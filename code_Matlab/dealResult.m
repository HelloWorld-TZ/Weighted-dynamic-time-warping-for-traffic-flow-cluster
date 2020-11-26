function [ out ] = dealResult( data )

[dataRow, dataColumn] = size(data);
index = 1;
result = [];

for i = 1:dataRow
    i
    if index == cell2mat(table2cell(data(i,4)))
        result = [result; data(i,:)];
        index = index + 1;
    end
end

out = result;

end

