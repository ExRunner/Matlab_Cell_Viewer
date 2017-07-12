function draw_cell_tree(CellMatrix,cellcounter, pstart, pend, cellID)
%pstart = 1;
%pend = 25;
%cellID = 3;
cur_Par=0;
Par = cellID;
X=[0;0];
Y=[0;0];
Z=[0;0];
for i = pstart+1:pend
    n=length(Par);
    cellcount = cellcounter(i);
    for j = 1:cellcount
        for k=1:n
        if Par(k)~=0 && CellMatrix{i,j}{3} == Par(k) 
            x=[CellMatrix{i-1,Par(k)}{1}(1);CellMatrix{i,j}{1}(1)];
            X=[X,x];
            y=[CellMatrix{i-1,Par(k)}{1}(2);CellMatrix{i,j}{1}(2)];
            Y=[Y,y];
            z=[i-1;i];
            Z=[Z,z];
            cur_Par = [cur_Par,j];
        end
        end
    end
    Par = cur_Par;
    cur_Par = 0;
end
figure();

plot3(X,Y,Z,'r')