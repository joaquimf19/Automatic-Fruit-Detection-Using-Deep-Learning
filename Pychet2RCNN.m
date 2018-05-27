Files=dir('labels');
[m,n] = size(Files);
FileNames={Files(3:m).name};
total_apples = 0;
for k=1:length(FileNames)
    [filepath,name,ext] = fileparts(FileNames{k});
    if ext == '.svg';
        FileNames{k} ='';
    end
end

FileNames = FileNames(~cellfun('isempty',FileNames));

for i=1:length(FileNames)
    full_filename = fullfile('labels',FileNames{i});
    label = csvread(full_filename);
    [row,col] = size(label);
    total_apples = total_apples + row;
    for j=1:row
        label(j,4) = label(j,2) + label(j,4);
        label(j,5) = label(j,3) + label(j,5);
    end
    [r,c] = size(label);
    label_cut = label(1:r,2:5);
    %label_cut = transpose(label_cut);
    [filepath,name,ext] = fileparts(FileNames{i});
    fileID = fopen(strcat(name,'.txt'),'w');
    %name = erase(name,".csv");
    %txt = strcat('TRAIN/',name,'.JPG');
    %formatSpec = '%6.8f \n';
    formatSpec = '%7.2f %7.2f %7.2f %7.2f\n';
    for i=1:r
        fprintf(fileID,formatSpec,label_cut(i,1),label_cut(i,2),label_cut(i,3),label_cut(i,4));
        %fprintf(fileID,formatSpec,label_cut(i,2),label_cut(i,1),label_cut(i,4),label_cut(i,3)); %switch x.y
    end
    %fprintf(fileID,'%s',txt);
    %fprintf(fileID,' %d ',r);
    %fprintf(fileID,formatSpec,label_cut);
    fclose(fileID);
end
