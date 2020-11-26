function [ out ] = calPointLarge( data )

[dataRow, dataColumn] = size(data);
result = [];

for i = 1:dataRow
    temp = 0;
    for j = 1:dataColumn
        temp = temp + data(i,j);
    end
    result = [result; temp];
end

out = result;
end

