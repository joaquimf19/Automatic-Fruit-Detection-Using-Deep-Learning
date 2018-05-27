%Files = dir('subset_1_12split');
Files = dir('_count_UW_apples');
[m,n] = size(Files);
FileName={Files(3:m).name};

%cd subset_1_12split
cd _count_UW_apples
formatSpec = '%s %f64 %f64 %f64 %f64 %f64';
FileID = fopen(FileName{1,1});
C = textscan(FileID,formatSpec);
annotations_total = length(C{1,1});
C{:,5} = C{:,5} - C{:,3};
C{:,6} = C{:,6} - C{:,4};
[imageNames, index] = unique(C{1,1},'stable');
l_aux = length(index);
index(l_aux + 1) = annotations_total;

x1 = C{1,3};
y1 = C{1,4};
x2 = C{1,5};
y2 = C{1,6};
formatSpec2Print = '%d,%f,%f,%f,%f,%d\n';
k = 1;
apples_tot = 0
for i=1:length(imageNames)
    fileID_2 = fopen(strcat(imageNames{i},'.csv'),'w');
    for j=1:index(i+1)-index(i)
        fprintf(fileID_2,formatSpec2Print,j,x1(k),y1(k),x2(k),y2(k),1);
        k = k + 1;
        apples_tot = k - 1 + apples_tot;      
    end
    fclose(fileID_2);
end

