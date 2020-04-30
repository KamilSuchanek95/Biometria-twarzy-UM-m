%%
% v = max(cell2mat(score.score)')';
% var(v(find(cell2mat(score.success) == 0)))
% var(v(find(cell2mat(score.success) == 1)))
%% Create figure
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
bar1 = bar(categorical(stats.label),cell2mat(stats.sen)*100);
box(axes1,'on');
bar(cell2mat(stats.TP) + cell2mat(stats.FN));
ylabel('sensitivity [%] / number of training images [n]')
xlabel('subjects to recognizing')
legend('sensivityty','number of images')
title('Statement of sensitivity to the number of learning images')
grid on
grid minor
%%
figure2 = figure;
Xlabels = categorical({'0-20','21-30','31-40','41->'});
sums = cell2mat(stats.TP) + cell2mat(stats.FN);
a = cell2mat(stats.sen(find(sums>10 & sums<=20)));
b = cell2mat(stats.sen(find(sums>20 & sums<=30)));
c = cell2mat(stats.sen(find(sums>30 & sums<=40)));
d = cell2mat(stats.sen(find(sums>40)));
axes2 = axes('Parent',figure2);

bar(Xlabels, [mean(a),mean(b),mean(c),mean(d)]*100)
grid on
grid minor
title('Comparison of average sensitivity for groups with a similar number of training images');
ylabel('Average sensitivity [%]')
xlabel('Groups with the number of training images in selected frames')
hold(axes2,'on');

er = errorbar(Xlabels, [mean(a),mean(b),mean(c),mean(d)]*100, ...
    [mean(a)-min(a),mean(b)-min(b),mean(c)-min(c),mean(c)-min(d)]*100, ...
    [max(a)-mean(a),max(b)-mean(b),max(c)-mean(c),max(d)-mean(d)]*100)
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
%%
% figure3 = figure;
% grp = categorical();
% grp(1:numel(a)) = Xlabels(1);
% grp(1+numel(a):numel(b)+numel(a)) = Xlabels(2);
% grp(1+numel(b)+numel(a):numel(c)+numel(b)+numel(a)) = Xlabels(3);
% grp(1+numel(c)+numel(b)+numel(a):numel(d)+numel(c)+numel(b)+numel(a)) = Xlabels(4);
% X = [a;b;c;d]; X = X'*100;
% boxplot(X, grp)
% ylim([0 100])
