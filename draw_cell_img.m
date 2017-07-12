function draw_cell_img(CellMatrix,cellcounter,img_name, pstart, pend, cellID)
%pstart = 1;
%pend = 20;
%cellID = 2;

cur_Par=0;
Par = cellID;
x = CellMatrix{pstart, cellID}{1}(1);
y = CellMatrix{pstart, cellID}{1}(2);
for i = pstart+1:pend
    n=length(Par);
    cellcount = cellcounter(i);
    for j = 1:cellcount
        for k=1:n
        if Par(k)~=0 && CellMatrix{i,j}{3} == Par(k)
            cur_Par = [cur_Par,j];
        end
        end
    end
    Par = cur_Par;
    cur_Par = 0;
end
for i = 2:length(Par)
    x = [x,CellMatrix{pend, Par(i)}{1}(1)];
    y = [y,CellMatrix{pend, Par(i)}{1}(2)];
end


figure();
subplot(1,2,1);
imshow(img_name{pstart});
hold on
plot(x(1),y(1),'ro');
subplot(1,2,2);
imshow(img_name{pend});
hold on
plot(x(2:length(x)),y(2:length(y)),'ro');
