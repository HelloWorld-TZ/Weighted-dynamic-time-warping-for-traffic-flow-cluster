function [ out, fdata, fIndex ] = dealOutlier( data, label )

outlierLevel = 500;

[dataRow, dataColumn] = size(data);
outliers = [];
index = [];
fdataIndex = [];

for i = 1:dataRow
    for j = 1:dataColumn
        if data(i,j) >= outlierLevel
            labelData = [label(i,:) cell2table(num2cell(data(i,:)))];
            outliers = [outliers; labelData];
            index = [index i];
            break;
        end
        if j == dataColumn
            fdataIndex = [fdataIndex; i];
        end
    end
end


data(index,:) = [];



out = outliers;
fdata = data;
fIndex = fdataIndex;

end

