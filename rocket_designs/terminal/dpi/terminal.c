#include <stdio.h> 
#include <stdlib.h>
#include <svdpi.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#ifdef VSIM
#include "dpi_functions.h"
#else
#include "tbxbindings.h"
#endif

static int terminal_socket;
static int recv_terminal_socket;
static struct sockaddr_in socket_addr;

#define KEY_BUFFER_SIZE 2000
static char key_buffer[KEY_BUFFER_SIZE];
static int key_count = 0;

int create_terminal_process(int socket_number)
{
    int r;
    char socket_string[20];
    char terminal_emulator_command[1000];
    char design_home_var[] = "TERMINAL";
    char *args[] = {(char *) "/usr/bin/xterm", 
                    (char *) "-fg", (char *) "green", 
                    (char *) "-bg", (char *) "black", 
                    (char *) "-T", (char *) "Catapult Platform Virtual Console", 
                    (char *) "-e", terminal_emulator_command, socket_string, 0};

    if (!getenv(design_home_var)) {
        fprintf(stderr, "environment variable '%s' must be set \n", design_home_var);
        return 1;
    }

    r = fork();

    printf("Fork returned %d \n", r);

    if (r == -1) {
        fprintf(stderr, "Unable to create child process for terminal \n");
        perror("Terminal");
        return 1;
    }

    if (r != 0) {
       return 0;
    }

    // from here on down we are in the child process

    sprintf(terminal_emulator_command, "%s/bin/terminal_emulator", getenv(design_home_var));

    sprintf(socket_string, "%d", socket_number);
    //args[6] = terminal_emulator_command;
    //args[7] = socket_string;
    r = execv(args[0], args);
    if (r == -1) { // or if you get here
        printf("Failure to launch terminal process \n");
        perror("Terminal");
        return 1;
    }

    fprintf(stderr, "You should never see this \n");
    return 0;
}


int send_char_to_terminal(int out_char)
{
    char buffer[2];
    int r;

    buffer[0] = out_char;
    r = sendto(terminal_socket, buffer, 1, 0, (struct sockaddr *) &socket_addr, sizeof(struct sockaddr));
    if (r == -1) {
        fprintf(stderr, "Unable to send character to terminal \n");
        perror("Terminal");
        return 1;
    }
    return 0;
}


char key_ready(void)
{
    return key_count;
}


char get_sync_char(void)
{
    while (key_count < 1) usleep(100);
    key_count--;
}


char get_key(void)
{
    int i;
    char return_value;

    if (key_count == 0) return (char) 0;

    return_value = key_buffer[0];

    for (i=0; i<key_count-1; i++) {
        key_buffer[i] = key_buffer[i+1];
    }

    key_count--;

    return return_value;
}


void *get_char_thread(void *not_used)
{
    char buffer[100];
    int r;
    svScope uart_context;

    while (1) {
        r = recv(recv_terminal_socket, buffer, sizeof(buffer), 0);
        if (r == -1) {
            fprintf(stderr, "Unable to get character from terminal \n");
            perror("Terminal");
            return NULL;
        }

        if (key_count < KEY_BUFFER_SIZE) key_buffer[key_count++] = buffer[0];
            // drops keyclicks if buffer is full

    }
    return NULL;
}

void shut_down_terminal_process(void)
{
    send_char_to_terminal(0x04);
}

int start_external_terminal(void)
{
    int r;
    int socket_number;
    char hostname[100];
    struct hostent *hp;
    struct sockaddr_in recv_socket_addr;
    pthread_t recv_thread_handle;

    srand(time(NULL));
    atexit(shut_down_terminal_process);

    do {
        socket_number = rand() & 0xFFFE;
    } while (socket_number<1024);

    printf("Socket address (so) is %d \n", socket_number);

    terminal_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (terminal_socket == -1) {
        fprintf(stderr, "Unable to create terminal socket \n");
        perror("Terminal");
        return 1;
    }

    r = gethostname(hostname, sizeof(hostname));
    if (r == -1) {
        fprintf(stderr, "Unable to get hostname \n");
        perror("Terminal");
        return 1;
    }

    hp = gethostbyname(hostname);
    if (hp == 0) {
        fprintf(stderr, "Unable to get host address \n");
        perror("Terminal");
        return 1;
    }

    socket_addr.sin_family = AF_INET;
    socket_addr.sin_addr.s_addr = ((struct in_addr *)( hp->h_addr))->s_addr;
    socket_addr.sin_port = htons(socket_number);

    // create socket in the other direction
    recv_socket_addr.sin_family = AF_INET;
    recv_socket_addr.sin_addr.s_addr = INADDR_ANY;
    recv_socket_addr.sin_port = htons(socket_number+1);

    recv_terminal_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (recv_terminal_socket == -1) {
        printf("Unable to create output terminal socket \n");
        perror("terminal_emulator");
        return -1;
    }

    r = bind(recv_terminal_socket, (struct sockaddr *) &recv_socket_addr, sizeof(recv_socket_addr));
    if (r == -1) {
        printf("Unable to bind output terminal socket \n");
        perror("terminal_emulator");
        return -1;
    }

    r = create_terminal_process(socket_number);
    if (r) {
        return r;
    }

    key_count = 0;

    r = pthread_create(&recv_thread_handle, NULL, get_char_thread, NULL);
    if (r != 0) {
        fprintf(stderr, "terminal_emulator: Unable to create thread for input stream \n");
        perror("terminal_emulator");
        return r;
    }
 
    get_sync_char();

    printf("Start terminal called! \n");
    return 0;
}
