function [ out ] = km( data, k, label, result )

Tdtw=kmedioids(data,k)';
result(:,4) = cell2table(num2cell(Tdtw));
writetable(result, 'result.csv');
out = cell2table(num2cell([Tdtw label]));
out = sortrows(out,'Var1','ascend');

end

