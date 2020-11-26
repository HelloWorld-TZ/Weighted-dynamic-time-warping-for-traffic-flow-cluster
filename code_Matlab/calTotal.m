function [ out ] = calTotal( data )

output=[];
for i = 1:24
    temp = 0;
    for j = 161
        temp = temp + data(j,i);
    end
    output = [output; temp];
end

out = output;

end

