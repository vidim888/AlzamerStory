/// Creates the grid
global.cell_size = 128;
global.grid_width = 31;
global.grid_height = 19;
global.map_grid = mp_grid_create(global.cell_size / 2, global.cell_size / 2, global.grid_width, global.grid_height, global.cell_size, global.cell_size);
global.navigate = path_add();