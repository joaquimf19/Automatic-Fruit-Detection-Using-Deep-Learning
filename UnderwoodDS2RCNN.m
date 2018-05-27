Files=dir('labels');
[m,n] = size(Files);
FileNames={Files(3:m).name};

for k=1:length(FileNames)
    [filepath,name,ext] = fileparts(FileNames{k});
    if ext == '.svg';
        FileNames{k} ='';
    end
end

FileNames = FileNames(~cellfun('isempty',FileNames));

for i=1:length(FileNames)
    %label = csvread('DSIR5080.csv');
    full_filename = fullfile('labels',FileNames{i});
    label = csvread(full_filename);
    [r,c] = size(label);
    label_cut = label(1:r,2:5);
    label_cut = transpose(label_cut);
    %fileID = fopen('DSIR5080','w');
    [filepath,name,ext] = fileparts(FileNames{i});
    fileID = fopen(strcat(name,'.txt'),'w');
    %txt = 'TRAIN/DSIR5080.jpg ';
    %txt = strcat('TRAIN/',FileNames{i},'.JPG');
    formatSpec = '%7.2f %7.2f %7.2f %7.2f\n';
    for j=1:r
        fprintf(fileID,formatSpec,label_cut(j,1),label_cut(j,2),label_cut(j,3),label_cut(j,4));
    end
    fclose(fileID);
end

