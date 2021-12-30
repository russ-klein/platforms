

// this is another comment

# name,  bitwidth, type, connection (wire|channel)

height,            12, unsigned,    input,    wire 
width,             12, unsigned,    input,    wire 
max_pool,           1, unsigned,    input,    wire
filter_in,         72, unsigned,    input,    wire
op,                 2, unsigned,    input,    wire
go,                 1, unsigned,    input,    channel
done,               1, unsigned,    output,   channel
image_word_array,  32, unsigned,    input,    channel
result_word_array, 32, unsigned,    output,   channel
