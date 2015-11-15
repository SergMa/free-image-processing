% function r = is_matlab ()
%
% Check if we run program in MATLAB
function r = is_matlab ()
    persistent x;
    if (isempty (x))
        x = exist('support');
    end
    r = x;
return
