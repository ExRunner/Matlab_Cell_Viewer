load CellMatrix
load img_name
load cellcounter
floder_path = '.\pic\';
len = length(CellMatrix);
for i = 29
    img_name(i,:)
    subplot(1,2,1)
    hold on
    imshow(img_name(i,:));
    cellcount = cellcounter(i,1);
    for j = 1:cellcount
        text(CellMatrix{i,j}{1}(1),CellMatrix{i,j}{1}(2),num2str(j));
    end
    
    subplot(1,2,2)
    hold on
    imshow(img_name(i+1,:));
    cellcount = cellcounter(i+1,1);
    for j = 1:cellcount
        text(CellMatrix{i+1,j}{1}(1),CellMatrix{i+1,j}{1}(2),num2str(j));
    end

end