% function r = is_freemat ()
%
% Check if we run program in FreeMat
function r = is_freemat ()
    persistent x;
    if (isempty (x))
        x = exist ('verstring');
    end
    r = x;
return
