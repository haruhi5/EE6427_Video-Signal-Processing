%% Initinial
mx = ones(8,8)
mx(1:4,:) = mx(1:4,:)*20;
mx(5:6,:) = mx(5:6,:)*40;
mx(7:8,:) = mx(7:8,:)*100;
fprintf("Matrix: %f\n",mx);

%% 1D-DCT
%row
[row_mx,col_mx] = size(mx);
n = col_mx;
y = zeros(col_mx,row_mx);
[row_y, col_y] = size(y);
for i=1:col_y %row错了
    for w=1:row_y
        for j=1:col_mx
            if w==1
                 cu=sqrt(1/n);
             else
                 cu=sqrt(2/n);
            end
            y(w,i) = y(w,i)+cu*mx(i,j)*cos( (j-1+1/2)*(w-1)*pi/n );
        end
    end
end
y = y'

% col
[row_my,col_my] = size(y);
n = col_my;
z = zeros(col_my,row_my);
[row_z, col_z] = size(z);
for i=1:col_z %row错了
    for w=1:row_z
        for j=1:col_my
            if w==1
                 cu=sqrt(1/n);
             else
                 cu=sqrt(2/n);
            end
            z(w,i) = z(w,i)+cu*y(j,i)*cos( (j-1+1/2)*(w-1)*pi/n );
        end
    end
end
z % 对了， 要注意行列的位置