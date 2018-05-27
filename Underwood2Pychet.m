%Files = dir('DATASETS\Deep_fruit_dataset_Underwood\acfr-fruit-dataset\apples\etiquetes-2');
Files = dir('underwood');
[m,n] = size(Files);
FileName={Files(3:m).name};

%cd DATASETS\Deep_fruit_dataset_Underwood\acfr-fruit-dataset\apples\etiquetes-2
cd underwood
for i=1:(length(FileName)-1)
    FileID = fopen(FileName{1,i});
    formatSpecIn = '%f64 %f64 %f64 %f64';
    C = textscan(FileID,formatSpecIn);
    formatSpecOut = '%d,%f,%f,%f,%f,%d\n';
    [filepath,name,ext] = fileparts(FileName{1,i});
    FileID_2 = fopen(strcat(name,'.csv'),'w');
    
    for x=1:length(C{1})
        fprintf(FileID_2,formatSpecOut,x,C{1}(x),C{2}(x),C{3}(x)-C{1}(x),C{4}(x)-C{2}(x),1);
    end
    
    fclose(FileID_2);
    fclose(FileID);
    fclose all;
end