load CellMatrix
load cellcounter

mindis = 9999;
minidx = 0;

for i = 2:length(cellcounter)
    for j = 1:cellcounter(i)
        x0 = CellMatrix{i,j}{1}(1);
        y0 = CellMatrix{i,j}{1}(2);
        for k = 1:cellcounter(i-1)
            x = CellMatrix{i-1,k}{1}(1);
            y = CellMatrix{i-1,k}{1}(2);
            dis = (x-x0)^2 + (y-y0)^2;
            if(dis < mindis)
                mindis = dis;
                minidx = k;
            end
        end
        CellMatrix{i,j}{3} = minidx;
        mindis = 99999999;
        minidx = 0;
    end
end