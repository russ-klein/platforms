
void hw_conv(
    signed char feature_maps[CHANS][ROWS][COLUMNS],
    signed char  kernels[FILTERS][CHANS][3][3],
    signed char results[FILTERS][ROWS][COLUMNS]);
