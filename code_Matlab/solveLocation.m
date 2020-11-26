function [ out ] = solveLocation( data )

pointCount = 1;
[dataRow, dataColumn] = size(data);
pointType = 1;
result1 = [];
result2 = [];
result3 = [];
result4 = [];

for i = 1:dataRow
    str = data{i,4}{1}(17:strlength(data{i,4}{1})-3);
    str1 = strsplit(str,',');
    [str1Row, str1Column] = size(str1);
    for j = 1:str1Column
        str2 = strsplit(str1{j});
        if j == 1
            result1 = [result1;cellstr(str2{1})];
            result2 = [result2;cellstr(str2{2})];
            result3 = [result3;num2cell(pointCount)];
            result4 = [result4;num2cell(pointType)];
        end
        if j ~= 1
            result1 = [result1;cellstr(str2{2})];
            result2 = [result2;cellstr(str2{3})];
            result3 = [result3;num2cell(pointCount)];
            result4 = [result4;num2cell(pointType)];
        end
        pointCount = pointCount + 1;
    end
    pointType = pointType + 1;
    pointCount = pointCount + 1;
end

out = cell2table([result1 result2 result3 result4]);
end

