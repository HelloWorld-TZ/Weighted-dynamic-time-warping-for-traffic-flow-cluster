function [ out ] = totalWave( data )

[dataRow, dataColumn] = size(data);
result = [];

for i = 1:dataColumn
    temp = 0;
    for j = 1:dataRow
        temp = temp + data(j,i);
    end
    result = [result;temp];
end

out = result;

end

