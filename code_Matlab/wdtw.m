function [ out ] = wdtw(X, Y, weight_meanCluster)

sakoe_chiba_band = 1;
X = X';
Y = Y';
%Compute the size of each time serie
%-------------------------------------------------------------------------------------------
n = size(X,1);
m = size(Y,1);

%Local Cost Matrix (Dissimilarities)
%-------------------------------------------------------------------------------------------
C = zeros(n,m);
for i = 1 : n
	for j = 1 : m
		C(i,j) =  (weight_meanCluster(j) ) * ( sqrt(( X(i) - Y(j) ) ^ 2) ); %(1/WY(j)*(X(i)-Y(j))^2)
	end;
end;

%Cost Matrix with Sakoe-Chiba Band
%-------------------------------------------------------------------------------------------
dtw = zeros(n,m);
dtw(1,1) = C(1,1);

for i = 2 : n
	dtw(i,1) = dtw(i-1,1) + C(i,1);
end;

for j = 2 : m
	dtw(1,j) = dtw(1,j-1) + C(1,j);
end;

for i = 2 : n
	for j = 2 : m
        if abs(i-j) <= sakoe_chiba_band
            dtw(i,j) = C(i,j) + min(dtw(i-1,j-1) , min(dtw(i-1,j),dtw(i,j-1)));
        else
			dtw(i,j) = Inf;
        end;
	end;
end;

% out = dtw(n,m);
out = dtw(n,m);
end

