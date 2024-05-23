% Niovi Peratikou

function restriction_flag = restrictions(x,y)
%restrictions
%x: x-coordinate from the point, which i want to check if it lies in X
%y: y-coordinate from the point, which i want to check if it lies in X
%
%return:
%restriction_flag: boolean variable, #true, if (x,y) lie in X, #false otherwise
%
restriction_flag = false;
if x >= -10 && x <= 5
    if y >= -8 && y <= 12
        restriction_flag = true;
    end
end