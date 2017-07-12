clear
clc
for i=1:10
    for j=1:2^i
        pos=randi([50,250],1,2);
        CellMatrix{i,j} = {pos,'address',ceil(j/2)};
    end
end

draw_cell_tree(CellMatrix,3,6,2)
draw_cell_img(CellMatrix,3,6,2)