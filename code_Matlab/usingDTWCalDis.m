function [ out ] = usingDTWCalDis( data )

dataRow = size(data,1);
result = [];

for i = 1:dataRow - 1
    for j = (i+1):dataRow
        result = [result dtw(data(i,:), data(j,:))];
    end
end

out = result;

end

