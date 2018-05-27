%images_train = [io.imread(apples_folder + '/2008_002506.jpg'),
%                io.imread(apples_folder + '/2009_004587.jpg')]
n = 108;
%n = 12;
fileID = fopen('train images.txt');
%fileID = fopen('test images.txt');
formatSpec = '%8s';
formatSpec2Print = '%8s\n';
names = textscan(fileID, formatSpec,n);
fileID2 = fopen('images_to_load.txt','w');
%fileID2 = fopen('images_test_to_load.txt','w');
for i=1:n
    fprintf(fileID2, formatSpec2Print,strcat("io.imread(apples_folder + '/",names{1,1}{i},".JPG'),"));
end
fclose all;