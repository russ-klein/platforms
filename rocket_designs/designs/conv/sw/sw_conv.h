void sw_conv(
    signed char feature_maps[CHANS][ROWS][COLS],
    signed char kernels[FILTERS][CHANS][4][3],
    signed char results[FILTERS][ROWS][COLS]);
