function [ out ] = countAverage( data )
warning('off');

data = fillmissing(data,'nearest');
[dataRow, dataColumn] = size(data);

locations = [data(:,2:3),data(:,7)];

timeLabel = data(1:24, 7);
locationLabel = unique(locations);
[labelRow, labelColumn] = size(locationLabel);

out = [data(1,2:3), data(1,7:22)];
temp = zeros(24, 16);  % index 1 是次数， index 2-16 是合
tempSen1 = data(1,2);
tempSen2 = data(1,3);


for i = 1:dataRow
    
    if strcmp( char(table2cell(data(i,2))) ,char(table2cell(tempSen1))) == 0 || strcmp( char(table2cell(data(i,3))) ,char(table2cell(tempSen2))) == 0
        outputTable = [data(1,2:3), data(1,7:22)];
        for j = 1:24
            outputTable(j,1) = tempSen1;
            outputTable(j,2) = tempSen2;
            outputTable(j,3) = timeLabel(j,1);
            outputTable{j,4} = num2cell(temp(j,2)/temp(j,1));
            outputTable(j,5) = num2cell(temp(j,3)/temp(j,1));
            outputTable(j,6) = num2cell(temp(j,4)/temp(j,1));
            outputTable(j,7) = num2cell(temp(j,5)/temp(j,1));
            outputTable(j,8) = num2cell(temp(j,6)/temp(j,1));
            outputTable(j,9) = num2cell(temp(j,7)/temp(j,1));
            outputTable(j,10) = num2cell(temp(j,8)/temp(j,1));
            outputTable(j,11) = num2cell(temp(j,9)/temp(j,1));
            outputTable(j,12) = num2cell(temp(j,10)/temp(j,1));
            outputTable(j,13) = num2cell(temp(j,11)/temp(j,1));
            outputTable(j,14) = num2cell(temp(j,12)/temp(j,1));
            outputTable(j,15) = num2cell(temp(j,13)/temp(j,1));
            outputTable(j,16) = num2cell(temp(j,14)/temp(j,1));
            outputTable(j,17) = num2cell(temp(j,15)/temp(j,1));
            outputTable(j,18)= num2cell(temp(j,16)/temp(j,1));
        end
        tempSen1 = data(i,2);
        tempSen2 = data(i,3);
        temp = zeros(24, 16);
        out = [out; outputTable];
    end
    
    time = data(i,7);
    if strcmp(time, '') == 1
        continue;
    end
    
    
    timeSplit = strsplit(char(table2cell(time)), ':');
    index = str2double(cell2mat(timeSplit(1))) + 1;
    
    temp(index, 1) = temp(index, 1) + 1;
    temp(index, 2) = temp(index, 2) + str2double(table2cell(data(i,8)));
    for j = 1:14
        temp(index, j+2) = temp(index, j+2) + cell2mat(table2cell(data(i,8+j)));
    end
    
    if i == dataRow
        outputTable = [data(1,2:3), data(1,7:22)];
        for j = 1:24
            outputTable(j,1) = tempSen1;
            outputTable(j,2) = tempSen2;
            outputTable(j,3) = timeLabel(j,1);
            outputTable{j,4} = num2cell(temp(j,2)/temp(j,1));
            outputTable(j,5) = num2cell(temp(j,3)/temp(j,1));
            outputTable(j,6) = num2cell(temp(j,4)/temp(j,1));
            outputTable(j,7) = num2cell(temp(j,5)/temp(j,1));
            outputTable(j,8) = num2cell(temp(j,6)/temp(j,1));
            outputTable(j,9) = num2cell(temp(j,7)/temp(j,1));
            outputTable(j,10) = num2cell(temp(j,8)/temp(j,1));
            outputTable(j,11) = num2cell(temp(j,9)/temp(j,1));
            outputTable(j,12) = num2cell(temp(j,10)/temp(j,1));
            outputTable(j,13) = num2cell(temp(j,11)/temp(j,1));
            outputTable(j,14) = num2cell(temp(j,12)/temp(j,1));
            outputTable(j,15) = num2cell(temp(j,13)/temp(j,1));
            outputTable(j,16) = num2cell(temp(j,14)/temp(j,1));
            outputTable(j,17) = num2cell(temp(j,15)/temp(j,1));
            outputTable(j,18)= num2cell(temp(j,16)/temp(j,1));
        end
        out = [out; outputTable];
        out(1,:) = [];
    end
end



end

