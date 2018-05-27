Files=dir('labels_results/_count_UW_apples');
[m,n] = size(Files);
FileNames={Files(3:m).name};
total_apples = 0;
apples_not_left = 0;
apples_1 = 0;
apples_2 = 0;
apples_3 = 0;
apples_4 = 0;
apples_5 = 0;
apples_6 = 0;
apples_7 = 0;
apples_8 = 0;
apples_9 = 0;
apples_10 = 0;
apples_11 = 0;
apples_12 = 0;

for k=1:length(FileNames)
    [filepath,name,ext] = fileparts(FileNames{k});
    if ext == '.svg';
        FileNames{k} ='';
    end
end

FileNames = FileNames(~cellfun('isempty',FileNames));

for i=1:length(FileNames)
    full_filename = fullfile('labels_results/_count_UW_apples',FileNames{i});
    label = csvread(full_filename);
    [row,col] = size(label);
    total_apples = total_apples + row;
%     for j=1:row
%         label(j,4) = label(j,2) + label(j,4);
%         label(j,5) = label(j,3) + label(j,5);
%     end
%     [r,c] = size(label);
%     label_cut = label(1:r,2:5);
    %label_cut = transpose(label_cut);
%     [filepath,name,ext] = fileparts(FileNames{i});
%     fileID1 = fopen(strcat(name,'1','.txt'),'w');
%     fileID2 = fopen(strcat(name,'2','.txt'),'w');
%     fileID3 = fopen(strcat(name,'3','.txt'),'w');
%     fileID4 = fopen(strcat(name,'4','.txt'),'w');
%     fileID5 = fopen(strcat(name,'5','.txt'),'w');
%     fileID6 = fopen(strcat(name,'6','.txt'),'w');
%     fileID7 = fopen(strcat(name,'7','.txt'),'w');
%     fileID8 = fopen(strcat(name,'8','.txt'),'w');
%     fileID9 = fopen(strcat(name,'9','.txt'),'w');
%     fileID10 = fopen(strcat(name,'10','.txt'),'w');
%     fileID11 = fopen(strcat(name,'11','.txt'),'w');
%     fileID12 = fopen(strcat(name,'12','.txt'),'w');
%     %name = erase(name,".csv");
%     %txt = strcat('TRAIN/',name,'.JPG');
%     %formatSpec = '%6.8f \n';
%     formatSpec = '%7.2f %7.2f %7.2f %7.2f\n';
%     
% %     for i=1:r
% %         if label_cut(i,1) <= 1151 && label_cut(i,3) <= 1151 && label_cut(i,2) <= 767 && label_cut(i,4) <= 767
% %             fprintf(fileID3,formatSpec,label_cut(i,1),label_cut(i,2),label_cut(i,3),label_cut(i,4));
% %             not_left  = not_left + 1;
% %         elseif label_cut(i,1) <= 1151 && label_cut(i,3) <= 1151 && label_cut(i,2) > 767 && label_cut(i,4) > 767
% %             fprintf(fileID4,formatSpec,label_cut(i,1),label_cut(i,2)-767,label_cut(i,3),label_cut(i,4)-767);
% %             not_left  = not_left + 1;
% %         elseif label_cut(i,1) > 1151 && label_cut(i,3) > 1151 && label_cut(i,2) <= 767 && label_cut(i,4) <= 767
% %             fprintf(fileID1,formatSpec,label_cut(i,1)-1151,label_cut(i,2),label_cut(i,3)-1151,label_cut(i,4));
% %             not_left  = not_left + 1;
% %         elseif label_cut(i,1) > 1151 && label_cut(i,3) > 1151 && label_cut(i,2) > 767 && label_cut(i,4) > 767
% %             fprintf(fileID2,formatSpec,label_cut(i,1)-1151,label_cut(i,2)-767,label_cut(i,3)-1151,label_cut(i,4)-767);
% %             not_left  = not_left + 1;
% %         end
% %     end
%       for i=1:r
%           if label_cut(i,1) <= 819 && label_cut(i,3) <= 819 && label_cut(i,2) <= 489 && label_cut(i,4) <= 489
%               x1 = label_cut(i,1);
%               y1 = label_cut(i,2);
%               x2 = label_cut(i,3);
%               y2 = label_cut(i,4);
%               apples_not_left = apples_not_left + 1;
%               apples_1 = apples_1 + 1;
%               fprintf(fileID1,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 742 && label_cut(i,3) >= 742 && label_cut(i,1) <= 1561 && label_cut(i,3) <= 1561 && label_cut(i,2) <= 489 && label_cut(i,4) <= 489
%               x1 = label_cut(i,1)-742;
%               y1 = label_cut(i,2);
%               x2 = label_cut(i,3)-742;
%               y2 = label_cut(i,4);
%               apples_not_left = apples_not_left + 1;
%               apples_2 = apples_2 + 1;
%               fprintf(fileID2,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 1483 && label_cut(i,3) >= 1483 && label_cut(i,2) <= 489 && label_cut(i,4) <= 489
%               x1 = label_cut(i,1)-1483;
%               y1 = label_cut(i,2);
%               x2 = label_cut(i,3)-1483;
%               y2 = label_cut(i,4);
%               apples_not_left = apples_not_left + 1;
%               apples_3 = apples_3 + 1;
%               fprintf(fileID3,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) <= 819 && label_cut(i,3) <= 819 && label_cut(i,2) >= 383 && label_cut(i,4) >= 383 && label_cut(i,2) <= 873 && label_cut(i,4) <= 873
%               x1 = label_cut(i,1);
%               y1 = label_cut(i,2)-383;
%               x2 = label_cut(i,3);
%               y2 = label_cut(i,4)-383;
%               apples_4 = apples_4 + 1;
%               apples_not_left = apples_not_left + 1;
%               fprintf(fileID4,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 742 && label_cut(i,3) >= 742 && label_cut(i,1) <= 1561 && label_cut(i,3) <= 1561 && label_cut(i,2) >= 383 && label_cut(i,4) >= 383 && label_cut(i,2) <= 873 && label_cut(i,4) <= 873
%               x1 = label_cut(i,1)-742;
%               y1 = label_cut(i,2)-383;
%               x2 = label_cut(i,3)-742;
%               y2 = label_cut(i,4)-383;
%               apples_not_left = apples_not_left + 1;
%               apples_5 = apples_5 + 1;
%               fprintf(fileID5,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 1483 && label_cut(i,3) >= 1483 && label_cut(i,2) >= 383 && label_cut(i,4) >= 383 && label_cut(i,2) <= 873 && label_cut(i,4) <= 873
%               x1 = label_cut(i,1)-1483;
%               y1 = label_cut(i,2)-383;
%               x2 = label_cut(i,3)-1483;
%               y2 = label_cut(i,4)-383;
%               apples_not_left = apples_not_left + 1;
%               apples_6 = apples_6 + 1;
%               fprintf(fileID6,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) <= 819 && label_cut(i,3) <= 819 && label_cut(i,2) >= 661 && label_cut(i,4) >= 661 && label_cut(i,2) <= 1151 && label_cut(i,4) <= 1151
%               x1 = label_cut(i,1);
%               y1 = label_cut(i,2)-661;
%               x2 = label_cut(i,3);
%               y2 = label_cut(i,4)-661;
%               apples_7 = apples_7 + 1;
%               apples_not_left = apples_not_left + 1;
%               fprintf(fileID7,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 742 && label_cut(i,3) >= 742 && label_cut(i,1) <= 1561 && label_cut(i,3) <= 1561 && label_cut(i,2) >= 661 && label_cut(i,4) >= 661 && label_cut(i,2) <= 1151 && label_cut(i,4) <= 1151
%               x1 = label_cut(i,1)-742;
%               y1 = label_cut(i,2)-661;
%               x2 = label_cut(i,3)-742;
%               y2 = label_cut(i,4)-661;
%               apples_not_left = apples_not_left + 1;
%               apples_8 = apples_8 + 1;
%               fprintf(fileID8,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 1483 && label_cut(i,3) >= 1483 && label_cut(i,2) >= 661 && label_cut(i,4) >= 661 && label_cut(i,2) <= 1151 && label_cut(i,4) <= 1151
%               x1 = label_cut(i,1)-1483;
%               y1 = label_cut(i,2)-661;
%               x2 = label_cut(i,3)-1483;
%               y2 = label_cut(i,4)-661;
%               apples_not_left = apples_not_left + 1;
%               apples_9 = apples_9 + 1;
%               fprintf(fileID9,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) <= 819 && label_cut(i,3) <= 819 && label_cut(i,2) >= 1045 && label_cut(i,4) >= 1045
%               x1 = label_cut(i,1);
%               y1 = label_cut(i,2)-1045;
%               x2 = label_cut(i,3);
%               y2 = label_cut(i,4)-1045;
%               apples_not_left = apples_not_left + 1;
%               apples_10 = apples_10 + 1;
%               fprintf(fileID10,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 742 && label_cut(i,3) >= 742 && label_cut(i,1) <= 1561 && label_cut(i,3) <= 1561 && label_cut(i,2) >= 1045 && label_cut(i,4) >= 1045
%               x1 = label_cut(i,1)-742;
%               y1 = label_cut(i,2)-1045;
%               x2 = label_cut(i,3)-742;
%               y2 = label_cut(i,4)-1045;
%               apples_not_left = apples_not_left + 1;
%               apples_11 = apples_11 + 1;
%               fprintf(fileID11,formatSpec,488-y2,x1,488-y1,x2);
%           end
%           if label_cut(i,1) >= 1483 && label_cut(i,3) >= 1483 && label_cut(i,2) >= 1045 && label_cut(i,4) >= 1045
%               x1 = label_cut(i,1)-1483;
%               y1 = label_cut(i,2)-1045;
%               x2 = label_cut(i,3)-1483;
%               y2 = label_cut(i,4)-1045;
%               apples_not_left = apples_not_left + 1;
%               apples_12 = apples_12 + 1;
%               fprintf(fileID12,formatSpec,488-y2,x1,488-y1,x2);
%           end
%       end
%     %fprintf(fileID,'%s',txt);
%     %fprintf(fileID,' %d ',r);
%     %fprintf(fileID,formatSpec,label_cut);
%     fclose(fileID1);
%     fclose(fileID2);
%     fclose(fileID3);
%     fclose(fileID4);
%     fclose(fileID5);
%     fclose(fileID6);
%     fclose(fileID7);
%     fclose(fileID8);
%     fclose(fileID9);
%     fclose(fileID10);
%     fclose(fileID11);
%     fclose(fileID12);
    apples_left = total_apples - apples_not_left;
end
