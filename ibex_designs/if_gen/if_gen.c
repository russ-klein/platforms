#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define STRLEN 1000

typedef struct sig_str_type {
   char signal_name[STRLEN];
   int  width;
   int  is_signed;
   int  is_input; 
   int  is_wire;
   struct sig_str_type *next;
} signal_struct;


static void clean_whitespace(char *s)
{
   // replaces all whitespace characters with a space
   // replaces all strings of whitespace with a single space
   // removes any leading and trailing spaces

   char *p, *start;

   p = start = s;

   // remove leading spaces
   while (isspace(*s)) s++;

   while (*s) {
      if (isspace(*s)) {
         *p++ = ' ';
         while (isspace(*s)) s++;
      } else {
         *p++ = *s++;
      }
   } 
  
   // remove trailing space
   if (p != start) if (*(p-1) == ' ') p--;

   // null terminate result
   *p = (char) 0;
} 
      

static char *lowercase(char *s)
{
   char *p;

   p = s;

   while (*p) {
     *p = tolower(*p);
     p++;
   }
   return s;
}


static char *uppercase(const char *s, char *s_out)
{
   int i = 0;

   while (*s) {
      s_out[i] = toupper(*s);
      s++;
      i++;
   }
   s_out[i] = 0;

   return s_out;
}


static int comment(char *s)
{
   if (s[0] == '#') return 1;
   if ((s[0] == '/') && (s[1] == '/')) return 1;
   return 0;
}


static int valid_signal_name(char *s)
{
   if (strlen(s) == 0) return 0;

   if (!((isalpha(*s) || (*s == '_')))) return 0;

   while (*s) {
      if ((!isalnum(*s)) && (*s != '_') && (*s != '$')) return 0;
      s++;
   }

   return 1;
}

static int valid_width_str(char *s)
{
   char *p;
   int num;

   if (strlen(s) == 0) return 0;

   p = s;
   while (*p) {
      if (!isdigit(*p)) return 0;
      p++;
   }

   num = atoi(s);

   if ((num < 1) || (num > 1024)) return 0;

   return 1;
}

static int valid_signed_str(char *s)
{
   if (0 == strcmp(lowercase(s), "signed")) return 1;
   if (0 == strcmp(lowercase(s), "unsigned")) return 1;
   return 0;
}

static int valid_input_str(char *s)
{
   if (0 == strcmp(lowercase(s), "input")) return 1;
   if (0 == strcmp(lowercase(s), "output")) return 1;

   return 0;
}

static int valid_wire_str(char *s)
{
   if (0 == strcmp(lowercase(s), "wire")) return 1;
   if (0 == strcmp(lowercase(s), "channel")) return 1;

   return 0;
}


static signal_struct *parse_interface(char *filename)
{
   /* 
    * file should have the following format:
    *
    * <signal_name>, <width>, [signed | unsigned], [input | output], [wires | channel]
    *
    */

   FILE *if_spec;
   char *r;
   char line[STRLEN];
   int line_no = 0;
   char signal_name[STRLEN];
   char width_str[STRLEN];
   char signed_str[STRLEN];
   char input_str[STRLEN];
   char wire_str[STRLEN];
   signal_struct *ret_val = NULL;
   signal_struct *signals;
   signal_struct *parent;
   
   if_spec = fopen(filename, "r");
   if (!if_spec) {
      fprintf(stderr, "Unable to open file %s for reading \n", filename);
      perror("if_gen");
      return ret_val;
   }
 
   while (r = fgets(line, sizeof(line), if_spec)) {
      line_no++;

      clean_whitespace(line);
      if (strlen(line) == 0) continue;
      if (comment(line)) continue;

      signal_name[0] = 0;
      r = strtok(line, ",");
      if (r) strcpy(signal_name, r);
      clean_whitespace(signal_name);
 
      width_str[0] = 0;
      r = strtok(NULL, ",");
      if (r) strcpy(width_str, r);
      clean_whitespace(width_str);

      signed_str[0] = 0;
      r = strtok(NULL, ",");
      if (r) strcpy(signed_str, r);
      clean_whitespace(signed_str);

      input_str[0] = 0;
      r = strtok(NULL, ",");
      if (r) strcpy(input_str, r);
      clean_whitespace(input_str);

      wire_str[0] = 0;
      r = strtok(NULL, ",");
      if (r) strcpy(wire_str, r);
      clean_whitespace(wire_str);

      if (!valid_signal_name(signal_name)) {
         fprintf(stderr, "Invalid signal name at line %d: %s \n", line_no, signal_name);
         return ret_val;
      }

      if (!valid_width_str(width_str)) {
         fprintf(stderr, "Invalid signal width at line: %d: %s \n", line_no, width_str);
         return ret_val;
      }

      if (!valid_signed_str(signed_str)) {
         fprintf(stderr, "Invalid signed string at line %d: %s \n", line_no, signed_str);
         return ret_val;
      }

      if (!valid_input_str(input_str)) {
         fprintf(stderr, "Invalid input string at line %d: %s \n", line_no, input_str);
         return ret_val;
      }

      if (!valid_wire_str(wire_str)) {
         fprintf(stderr, "Invalid wire string at line %d: %s \n", line_no, wire_str);
         return ret_val;
      }
    
      signals = (signal_struct *) malloc (sizeof(signal_struct));
      if (signals == NULL) {
         fprintf(stderr, "Unable to allocate memory for signal struct \n");
         perror("reg_if");
         return NULL;
      }

      strcpy(signals->signal_name, signal_name);
      signals->width  = atoi(width_str);
      signals->is_signed = (0 == strcmp(lowercase(signed_str), "signed")) ? 1 : 0;
      signals->is_input  = (0 == strcmp(lowercase(input_str),  "input" )) ? 1 : 0;
      signals->is_wire   = (0 == strcmp(lowercase(wire_str),   "wire"  )) ? 1 : 0;
      signals->next   = NULL;

      if (ret_val == NULL) {
         ret_val = signals;
      } else {
         parent = ret_val;
         while (parent->next) parent = parent->next;
         parent->next = signals;
      }
   }

   if (!feof(if_spec)) {
      fprintf(stderr, "Error reading file %s \n", filename);
      perror("if_gen");
   }

   fclose(if_spec);

   return ret_val;
}


static int register_count(signal_struct *signals)
{
    signal_struct *sp;
    int count = 0;

    sp = signals;

    while (sp) {
        count++;
        if (0 == sp->is_wire) count++;
        else if (sp->width > 32) count += (((sp->width+31)/32) -1);
        sp = sp->next;
    }

    return count;
}

static void print_intro(FILE *txt, signal_struct *signals)
{
    fprintf(txt, "                                                                                     \n");
    fprintf(txt, " module cat_accel                                                                    \n");
    fprintf(txt, " (                                                                                   \n");
    fprintf(txt, "       CLK,                                                                          \n");
    fprintf(txt, "       RSTn,                                                                         \n");
    fprintf(txt, "       READ_ADDR,                                                                    \n");
    fprintf(txt, "       DATA_OUT,                                                                     \n");
    fprintf(txt, "       DATA_VALID,                                                                   \n");
    fprintf(txt, "       OE,                                                                           \n");
    fprintf(txt, "       WRITE_ADDR,                                                                   \n");
    fprintf(txt, "       DATA_IN,                                                                      \n");
    fprintf(txt, "       BE,                                                                           \n");
    fprintf(txt, "       WE,                                                                           \n");
    fprintf(txt, "       WACK                                                                          \n");
    fprintf(txt, " );                                                                                  \n");
    fprintf(txt, "                                                                                     \n");
    fprintf(txt, " parameter address_width     = 14;                                                   \n");
    fprintf(txt, " parameter data_width        = 2; //   in 2^data_width bytes                         \n");
    fprintf(txt, " //   0 = 8 bits  1 = 16 bits  2 = 32 bits  3 = 64 bits ... 7 = 1024 bits            \n");
    fprintf(txt, "                                                                                     \n");
    fprintf(txt, " input                                CLK;                                           \n");
    fprintf(txt, " input                                RSTn;                                          \n");
    fprintf(txt, " input [address_width-1:0]            READ_ADDR;                                     \n");
    fprintf(txt, " output [((1<<data_width)*8)-1:0]     DATA_OUT;                                      \n");
    fprintf(txt, " output                               DATA_VALID;                                    \n");
    fprintf(txt, " input                                OE;                                            \n");
    fprintf(txt, " input [address_width-1:0]            WRITE_ADDR;                                    \n");
    fprintf(txt, " input [((1<<data_width)*8)-1:0]      DATA_IN;                                       \n");
    fprintf(txt, " input [(1<<data_width)-1:0]          BE;                                            \n");
    fprintf(txt, " input                                WE;                                            \n");
    fprintf(txt, " output                               WACK;                                          \n");
    fprintf(txt, "                                                                                     \n");
    fprintf(txt, " reg [((1<<data_width)*8)-1:0]  register_bank [%d:0];                                \n",
                                                           register_count(signals)-1 );
    fprintf(txt, "                                                                                     \n");
    fprintf(txt, " wire [address_width-1:0]       read_address   = READ_ADDR;                          \n");
    fprintf(txt, " wire [address_width-1:0]       write_address  = WRITE_ADDR;                         \n");
    fprintf(txt, " reg  [((1<<data_width)*8)-1:0] read_data;                                           \n");
    fprintf(txt, "                                                                                     \n");
}

static void print_signals(FILE *txt, signal_struct *signals)
{
    signal_struct *sp;

    sp = signals;

    if (sp) {
        fprintf(txt, " \n");
        fprintf(txt, " // interface signals \n");
        fprintf(txt, " \n");
    }
    while (sp) {
        if (sp->width > 1) {
           fprintf(txt, " wire [%3d:0] %s; \n", sp->width-1, sp->signal_name);
        } else {
           fprintf(txt, " wire         %s; \n", sp->signal_name);
        }
        if (sp->is_wire) {
           fprintf(txt, " wire         %s_tz; \n", sp->signal_name);
        } else {
           fprintf(txt, " %4s         %s_ready; \n", sp->is_input?"wire":"reg ", sp->signal_name);
           fprintf(txt, " %4s         %s_valid; \n", sp->is_input?"reg ":"wire", sp->signal_name);
        }
        sp = sp->next;
    }
}

static void print_write_ack(FILE *txt, signal_struct *signals)
{
    fprintf(txt, " reg local_data_valid; \n");
    fprintf(txt, " reg local_wack; \n");
    fprintf(txt, " \n");
    fprintf(txt, " assign WACK = local_wack; \n");
    fprintf(txt, " assign DATA_VALID = local_data_valid; \n");
    fprintf(txt, " \n");
    fprintf(txt, " always @(posedge CLK) begin  \n");
    fprintf(txt, "   local_wack <= (WE && BE) ? 1'b1 : 1'b0;  \n");
    fprintf(txt, "   local_data_valid <= OE;  \n");
    fprintf(txt, " end  \n");
    fprintf(txt, " \n");
}

static int print_register_map_entry(FILE *txt, signal_struct *sp, char *name, int offset)
{
    fprintf(txt, " `define %-20s %3d \n", name, offset++);
    if (0 == sp->is_wire) {
        if (sp->is_input) {
           fprintf(txt, " `define %-20s %3d \n", strcat(name, "_READY"), offset++);
        } else {
           fprintf(txt, " `define %-20s %3d \n", strcat(name, "_VALID"), offset++);
        }
    }
    return offset;
}

static void print_register_map(FILE *txt, signal_struct *signals)
{
    signal_struct *sp;
    char buf[STRLEN];
    char name[STRLEN];
    int offset = 0;
    int i;

    sp = signals;

    if (sp) {
        fprintf(txt, " \n");
        fprintf(txt, " // register map \n");
        fprintf(txt, " \n");
    }

    while (sp) {
        if (sp->width > 32) {
            for (i=0; i<sp->width; i+=32) {
               sprintf(name, "%s_%d", uppercase(sp->signal_name, buf), (i+31)/32);
               offset = print_register_map_entry(txt, sp, name, offset);
            }
        } else {
            offset = print_register_map_entry(txt, sp, uppercase(sp->signal_name, buf), offset);
        }
        sp = sp->next;
    }
    fprintf(txt, " \n");

}


static void print_assignments(FILE *txt, signal_struct *signals)
{
    signal_struct *sp;
    char buf[STRLEN];
    char name[STRLEN];
    int offset = 0;
    int i;

    sp = signals;

    if (sp) {
        fprintf(txt, " \n");
        fprintf(txt, " // assignments \n");
        fprintf(txt, " \n");
    }

    while (sp) {
        if (sp->is_input) {
            if (sp->width > 32) {
                for (i=0; i<sp->width; i+=32) {
                    sprintf(name, "%s_%d", uppercase(sp->signal_name, buf), i/32);
                    if (sp->width < (i+31)) {
                       fprintf(txt, " assign %s [%3d:%3d] = register_bank[`%s][%2d: 0]; \n", sp->signal_name, sp->width-1, i, name, sp->width-i-1);
                    } else {
                       fprintf(txt, " assign %s [%3d:%3d] = register_bank[`%s]; \n", sp->signal_name, i+31, i, name);
                    }
                }
            } else {
                fprintf(txt, " assign %-20s = register_bank[`%s]; \n", sp->signal_name, uppercase(sp->signal_name, buf));
            }
        }
        sp = sp->next;
    }
    fprintf(txt, " \n");
}

static void print_reset_assignment(FILE *txt, signal_struct *sp, char *name)
{
    char buf[STRLEN];
    char *p;

    fprintf(txt, "       register_bank[`%s] <= 32'h00000000; \n", name);
    if (0 == sp->is_wire) {
        if (sp->is_input) {
            p = "READY";
        } else {
            p = "VALID";
        }
        fprintf(txt, "       register_bank[`%s_%s] <= 32'h00000000; \n", name, p);
    }
}
       

static void print_register_accesses(FILE *txt, signal_struct *signals)
{
   signal_struct *sp;
   char buf[STRLEN];
   char name[STRLEN];
   int i;

   fprintf(txt, " \n");
   fprintf(txt, " assign DATA_OUT = read_data; \n");
   fprintf(txt, " \n");
   fprintf(txt, " always @(posedge CLK) begin \n");
   fprintf(txt, "    if (RSTn) begin \n");
   fprintf(txt, "       if (OE) begin \n");
   fprintf(txt, "          read_data <= register_bank[read_address]; \n");
   fprintf(txt, "       end \n");
   fprintf(txt, "    end \n");
   fprintf(txt, " end \n");
   fprintf(txt, " \n");
   fprintf(txt, " \n");

   fprintf(txt, " always @(posedge CLK) begin \n");
   fprintf(txt, "    if (!RSTn) begin \n");
   sp = signals;
   while (sp) {
      if (sp->width > 32) {
          for (i=0; i<sp->width; i+=32) {
              sprintf(name, "%s_%d", uppercase(sp->signal_name, buf), i/32);
              print_reset_assignment(txt, sp, name);
          }
      } else {
          print_reset_assignment(txt, sp, uppercase(sp->signal_name, buf));
      }

      sp = sp->next;
   }

   fprintf(txt, "    end else begin \n");
   fprintf(txt, "       if (WE) begin \n");
   fprintf(txt, "          register_bank[write_address] <= DATA_IN; \n");
   fprintf(txt, "       end \n");
   fprintf(txt, " \n");

   sp = signals;
   while (sp) {
       if (0 == sp->is_input) {
           fprintf(txt, "       register_bank[`%s] <= %s; \n", uppercase(sp->signal_name, buf), sp->signal_name);
       }
       if (0 == sp->is_wire) {
           if (sp->is_input) {
                fprintf(txt, "       register_bank[`%s] <= %s_ready; \n", strcat(uppercase(sp->signal_name, buf), "_READY"), sp->signal_name);
           } else {
                fprintf(txt, "       register_bank[`%s] <= %s_valid; \n", strcat(uppercase(sp->signal_name, buf), "_VALID"), sp->signal_name);
           }
       }
       sp = sp->next;
   }

   fprintf(txt, "    end \n");
   fprintf(txt, " end \n");

}

static void print_ready_valids(FILE *txt, signal_struct *signals)
{
    signal_struct *sp;
    char buf[STRLEN];

    sp = signals;

    while (sp) {
        if (0 == sp->is_wire) {
            if (sp->is_input) {
                fprintf(txt, " \n");
                fprintf(txt, " always @(posedge CLK) begin \n");
                fprintf(txt, "    if (!RSTn) begin \n");
                fprintf(txt, "       %s_valid <= 1'b0; \n", sp->signal_name);
                fprintf(txt, "    end else begin \n");
                fprintf(txt, "       if (WE) begin \n");
                fprintf(txt, "          if (write_address == `%s) begin \n", uppercase(sp->signal_name, buf));
                fprintf(txt, "             %s_valid <= 1'b1; \n", sp->signal_name);
                fprintf(txt, "          end \n");
                fprintf(txt, "       end \n");
                fprintf(txt, "       if (%s_valid && %s_ready) begin \n", sp->signal_name, sp->signal_name);
                fprintf(txt, "          %s_valid <= 1'b0; \n", sp->signal_name);
                fprintf(txt, "       end \n");
                fprintf(txt, "    end \n");
                fprintf(txt, " end \n");
                fprintf(txt, " \n");
            } else {
                fprintf(txt, " \n");
                fprintf(txt, " always @(posedge CLK) begin \n");
                fprintf(txt, "    if (!RSTn) begin \n");
                fprintf(txt, "       %s_ready <= 1'b0; \n", sp->signal_name);
                fprintf(txt, "    end else begin \n");
                fprintf(txt, "       if (OE) begin \n");
                fprintf(txt, "          if (read_address == `%s) begin \n", uppercase(sp->signal_name, buf));
                fprintf(txt, "             %s_ready <= 1'b1; \n", sp->signal_name);
                fprintf(txt, "          end \n");
                fprintf(txt, "       end \n");
                fprintf(txt, "       if (%s_valid && %s_ready) begin \n", sp->signal_name, sp->signal_name);
                fprintf(txt, "          %s_ready <= 1'b0; \n", sp->signal_name);
                fprintf(txt, "       end \n");
                fprintf(txt, "    end \n");
                fprintf(txt, " end \n");
                fprintf(txt, " \n");
            }
        }
        sp = sp->next;
    }
}


static void print_catapult_instantiation(FILE *txt, signal_struct *signals, char *instance_name)
{
    signal_struct *sp;

    fprintf(txt, " %s cat_accel ( \n", instance_name);
    fprintf(txt, "    .clk (CLK), \n");
    fprintf(txt, "    .rst (!RSTn), \n");

    sp = signals;

    while (sp) {
        if (sp->is_wire) {
            fprintf(txt, "    .%s_rsc_dat (%s), \n", sp->signal_name, sp->signal_name);
            fprintf(txt, "    .%s_rsc_triosy_lz (%s_tz)", sp->signal_name, sp->signal_name);
        } else {
            fprintf(txt, "    .%s_rsc_dat (%s), \n", sp->signal_name, sp->signal_name);
            fprintf(txt, "    .%s_rsc_vld (%s_valid), \n", sp->signal_name, sp->signal_name);
            fprintf(txt, "    .%s_rsc_rdy (%s_ready)", sp->signal_name, sp->signal_name);
        }
        if (sp->next) fprintf(txt, ", \n");
        else fprintf(txt, " \n");
        
        sp = sp->next;
    }
    fprintf(txt, " ); \n");
}


static void print_epilog(FILE *txt)
{
    fprintf(txt, " endmodule \n");
}


static void print_header_file(FILE *txt, signal_struct *signals, char *address)
{
    signal_struct *sp;
    int index = 0;
    char buf[STRLEN];

    sp = signals;

    fprintf(txt, "/*************************************************************************** \n");
    fprintf(txt, " *  accelerator interface header                                             \n");
    fprintf(txt, " ***************************************************************************/\n");
    fprintf(txt, "   \n");
    fprintf(txt, "#define ACCEL_ADDR ((volatile unsigned int *) %s) \n", address);
    fprintf(txt, "   \n");
    fprintf(txt, "   \n");
    fprintf(txt, "// register map \n");
    fprintf(txt, "   \n");

    while (sp) {
        if (sp->width > 32) {
            fprintf(txt, "#define %s(IDX) (*(ACCEL_ADDR + (%d + (IDX)))) \n", uppercase(sp->signal_name, buf), index);
            index += (sp->width+31)/32;
        } else {
            fprintf(txt, "#define %s (*(ACCEL_ADDR + %d)) \n", uppercase(sp->signal_name, buf), index++);
        }
        if (0 == sp->is_wire) {
            if (sp->is_input) {
                fprintf(txt, "#define %s_READY (*(ACCEL_ADDR + %d)) \n", uppercase(sp->signal_name, buf), index++);
            } else {
                fprintf(txt, "#define %s_VALID (*(ACCEL_ADDR + %d)) \n", uppercase(sp->signal_name, buf), index++);
            }
        }
        sp = sp->next;
    }
}
 
               
void make_filenames(char *spec_filename, char *verilog_filename, char *header_filename)
{
    char *p;
    unsigned int count;
    unsigned int i;

    p = spec_filename + strlen(spec_filename);

    while ((*p != '.') && (*p != '/') && (p > spec_filename)) p--;

    if (*p == '.') {
        count = p - spec_filename + 1;
        for (i=0; i<count; i++) {
           verilog_filename[i] = spec_filename[i];
           header_filename[i] = spec_filename[i];
        }
        verilog_filename[count] = 'v';
        verilog_filename[count+1] = 0;

        header_filename[count] = 'h';
        header_filename[count+1] = 0;
    } else {
        strcpy(verilog_filename, spec_filename);
        strcpy(header_filename, spec_filename);

        strcat(verilog_filename, ".v");
        strcat(header_filename, ".h");
    }
}


main(int argc, char **argv)
{
    int i;
    signal_struct *signals;
    signal_struct *next_signal;
    FILE *verilog_file;
    FILE *header_file;
    char filename[STRLEN];
    char verilog_filename[STRLEN];
    char header_filename[STRLEN];
    char *address;
  
    if (argc != 4) {
       fprintf(stderr, "Usage: %s: <instance_name> <signal specification file> <address of accelerator> \n", argv[0]);
       return;
    }

    if (strlen(argv[2]) > STRLEN - 3) {
       fprintf(stderr, "filename %s is too long \n", argv[2]);
       return;
    }

    address = argv[3];

    make_filenames(argv[2], verilog_filename, header_filename);

    verilog_file = fopen(verilog_filename, "w");
    if (!verilog_filename) {
        fprintf(stderr, "Unable to open file %d for writing. \n", verilog_filename);
        perror("if_gen");
        return;
    }
       
    header_file = fopen(header_filename, "w");
    if (!header_file) {
        fprintf(stderr, "Unable to open file %d for writing. \n", header_filename);
        perror("if_gen");
        return;
    }
       

    signals = parse_interface(argv[2]);

    if (signals) {
       print_intro(verilog_file, signals);
       print_signals(verilog_file, signals);
       print_write_ack(verilog_file, signals);
       print_register_map(verilog_file, signals);
       print_assignments(verilog_file, signals);
       print_register_accesses(verilog_file, signals);
       print_ready_valids(verilog_file, signals);
       print_catapult_instantiation(verilog_file, signals, argv[1]);
       print_epilog(verilog_file);
       print_header_file(header_file, signals, address);
    }

    while (signals) {
       next_signal = signals->next;
       free(signals);
       signals = next_signal;
    }
}
