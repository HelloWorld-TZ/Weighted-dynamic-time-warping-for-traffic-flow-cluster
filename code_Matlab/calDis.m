function [ out ] = calDis( data )

tempSen1 = data(1,1);
tempSen2 = data(1,2);
[dataRow, dataColumn] = size(data);

temp=[];
output=[];

for i = 1:dataRow
    if strcmp( char(table2cell(data(i,1))) ,char(table2cell(tempSen1))) == 0 || strcmp( char(table2cell(data(i,2))) ,char(table2cell(tempSen2))) == 0
        output = [output;temp];
        temp = [];
        tempSen1 = data(i,1);
        tempSen2 = data(i,2);
    end
        
    temp = [temp,table2cell(data(i,4:18))];
    
    if i == dataRow
        output = [output;temp];
        output = cell2table(output);
        output = fillmissing(output,'constant',0);
        output = cell2mat(table2cell(output));
        
        tempdis = zeros(179,24);
        for m = 1:179
            for n = 1:24
                for p = 1:15
                    tempdis(m,n) = tempdis(m,n) + output(m, (n-1)*15 + p);
                end
            end
        end
        out = tempdis;
%         eva = evalclusters(output,'kmeans','DaviesBouldin','klist',[1:]);
%         plot(eva.CriterionValues)
        D = pdist(cell2mat(output));
%         out = squareform(D);
%         Z = linkage(D);  %生成聚类
%         out = dendrogram(Z) %冰柱图
%         out=cophenet(Z,D)  %聚类评价
        T=cluster(Z,20);
%         out = T
    end
end
    
end

