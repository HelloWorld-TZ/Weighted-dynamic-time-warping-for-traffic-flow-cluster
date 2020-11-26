function [ out ] = dealAllRoadLocation( data,label )

[dataRow, dataColumn] = size(data);
[labelRow, labelColumn] = size(label);
remember = [];

for i = 1:labelRow
    i
    for j = 1:dataRow
        if cell2mat(table2cell(label(i,3))) == cell2mat(table2cell(data(j,2)))
            remember = [remember j];
            break;
        end
    end
end

[rememberRow, rememberColumn] = size(remember);
remember = fliplr(sort(remember));

for i = 1:rememberColumn
    data(remember(1,i),:) = [];
end

out = data;

end

