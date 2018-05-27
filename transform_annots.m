%boxes_img1_train = ([dlib.rectangle(left=329, top=78, right=437, bottom=186),
%                     dlib.rectangle(left=224, top=95, right=314, bottom=185),
%                     dlib.rectangle(left=125, top=65, right=214, bottom=155)])
N = 108;
%N = 12;
%Files = dir('test');
Files = dir('train');
[m,n] = size(Files);
FileName={Files(3:m).name};
%cd test
cd train
formatSpec = '%d %d %d %d';
formatSpec2Print = '%s %s %s %s %s %s %s %s \n';
formatSpec2Print_v2 = '%s ';
for i=1:N
    FileID = fopen(FileName{i});
    [filepath,name,ext] = fileparts(FileName{i});
    C = textscan(FileID,formatSpec);
    fileID2 = fopen(strcat(name,'_v2','.txt'),'w');
    fprintf(fileID2, formatSpec2Print_v2,strcat('boxes_img',sprintf('%d',i),'_train = (['));
    for j=1:length(C{1,1})
        fprintf(fileID2, formatSpec2Print,strcat('dlib.rectangle(left=', sprintf('%d',max(C{1,1}(j),0)),', top=',sprintf('%d',max(C{1,2}(j),0)),', right=',sprintf('%d',min(C{1,3}(j),2304)),', bottom=',sprintf('%d',min(C{1,4}(j),1536)),'),'));
    end
    fprintf(fileID2, formatSpec2Print_v2,'])');
    fclose(fileID2);
end
fclose all;