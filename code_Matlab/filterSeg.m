function [ out ] = filterSeg( allRoad, data )

[allRoadRow, allRoadColumn] = size(allRoad);
[dataRow, dataColumn] = size(data);
result = [];

allRoad = allRoad(:,2:3);

for i = 1:dataRow
    for j = 1:allRoadRow
        if cell2mat(table2cell(data(i,3))) == cell2mat(table2cell(allRoad(j,1)))
            result = [result; allRoad(j,2)];
            break;
        end
    end
end

out = result;

end

