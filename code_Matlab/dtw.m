function [ out ] = dtw( t,r )
t = t';
r = r';
n = size(t,1);
m = size(r,1);
% ÷°∆•≈‰æ‡¿Îæÿ’Û
d = zeros(n,m);
for i = 1:n
    for j = 1:m
        d(i,j) = sum(sqrt((t(i,:)-r(j,:)).^2));
    end
end
% ¿€ª˝æ‡¿Îæÿ’Û

D=zeros(size(d));
D(1,1)=d(1,1);

for i=2:n
    D(i,1)=d(i,1)+D(i-1,1);
end
for i=2:m
    D(1,i)=d(1,i)+D(1,i-1);
end
% ∂ØÃ¨πÊªÆ

for i=2:n
    for j=2:m
        D(i,j)=d(i,j)+min(D(i-1,j),min(D(i-1,j-1),D(i,j-1))); % this double MIn construction improves in 10-fold the Speed-up. Thanks Sven Mensing
    end
end

out = D(n,m);

end

