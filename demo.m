clc;clear;
load img_name;
load cellcounter;
load CellMatrix;

pstart = 100;
pend = 180;
cellid = 10;

draw_cell_tree(CellMatrix ,cellcounter ,pstart,pend,cellid);
draw_cell_img(CellMatrix ,cellcounter,img_name ,pstart,pend,cellid);