for i = 100:299
    path = strcat('.\celldata\',num2str(i),'.txt');
    [NUM,X,Y,Light,foo,cellpath] = textread(path,'%n %n %n %f %n %s');
    len = length(NUM); 
    cellcounter(i-99,1) = len;
    for j = 1:len
       pos = [X(j),Y(j)];
       CellMatrix{i-99,j} = {pos,cellpath(j,:),0};
    end
end