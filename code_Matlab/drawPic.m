function [  ] = drawPic( linerPoint, test8 )

liner = test8(cell2mat(linerPoint),:)';
for i = 1 : size(liner,2)
    if i ~= size(liner,2)/2
        plot(liner(:,i),'DisplayName','liner')
        hold on
    end
    
    if i == floor(size(liner,2)/2)
        plot(liner(:,i),'DisplayName','liner','LineWidth',3)
        hold on
    end
end

end

