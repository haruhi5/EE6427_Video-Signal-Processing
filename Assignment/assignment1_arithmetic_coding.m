%% Name Arithmetic Coding
name = "Wu Tanghong"; % 11
name_char = lower( char(name) )';

tbl = tabulate(name_char);
tbl = sortrows(tbl);
alpha =  cell2mat([' ' tbl(:,1)']);
len = length(alpha);
distribution = [1/len cell2mat(tbl(:,2))'./11]; % possibility distribution 按出现顺序定
%distribution = [1/11 1/11 2/11 1/11 2/11 1/11 1/11 1/11 1/11];

interval = zeros(len,2);
interval(1,:) = [0 distribution(1)]; 
for i=2:len
    interval(i,:) = [interval(i-1,2) interval(i-1,2)+distribution(i)];  
end
interval(interval>1)=1;
% Initialization
format longG
Low = 0;
High = 1;
fprintf("\nInitialization: %f %f\n",Low,High);

for i=1:length(name_char)
    j = 0;
    j = find( alpha == name_char(i));
    if i==1
        if j==1
            Low = 0;
        else
            Low =  interval(j,1);
        end
       High = interval(j,2);
       fprintf("\n%c: %f %f\n",name_char(i),Low,High);
       continue;   
    end
    inter = High-Low;
    High = Low+inter*interval(j,2);
    Low = Low+inter*interval(j,1); % 顺序
    fprintf("\n%c: %.15g %.15g\n",name_char(i),Low,High);
end

