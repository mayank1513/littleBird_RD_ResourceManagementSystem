function [d, m, y]=str2date(s,varargin)
    months = ['Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec'];
    [lhs, rhs] = argn(0);
    if rhs>1 then
        //to be implemented to include date format specifier
        messagebox('Second argument to function not yet implemented','Hare Krishna!!');
        return;
    end
    separatorInd = strindex(s,'-');
    if size(separatorInd,2)==1 then
        mmm = part(s,1:separatorInd-1);
        m = find(strcmp(months,part(mmm,1:3),'i')==0);
        y = strtod(part(s,$-2:$));
    elseif size(separatorInd,2)==2
        d = strtod(part(s,1:separatorInd(1)));
        mmm = part(s,separatorInd(1)+1:separatorInd(2)-1);
        m = find(strcmp(months,part(mmm,1:3),'i')==0);
        y = strtod(part(s,$-2:$));
    end
    if isempty(m) then
        messagebox('Please enter date in dd-mmm-yyyy or mmm-yyyy format','Hare Krishna');
    end
endfunction
