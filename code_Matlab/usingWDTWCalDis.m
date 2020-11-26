function [ out ] = usingWDTWCalDis( data )

dataRow = size(data,1);
mu = [9 18] ;
sigma = [1  1]; 
x = 1:1:24; 

weight = (1/2)*normpdf(x,mu(1),sigma(1)) + (1/2)*normpdf(x,mu(2),sigma(2)) ; 

result = [];

for i = 1:dataRow - 1
    for j = (i+1):dataRow
        result = [result wdtw(data(i,:), data(j,:), weight)];
    end
end

out = result;

end

