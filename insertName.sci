function [sortedStr, ind] = insertName(str1, blk1)
    if isempty(str1) then
        sortedStr = blk1;
        ind = 1;
    end
    str = convstr(str1,"l");
    blk = convstr(blk1,"l");
    indx = find(part(str,1)==part(blk,1));
    i = 0;
    while ~isempty(indx)
        i = i + 1;
        indx = find(part(str,1:i)==part(blk,1:i));
    end
    
    if i==0 then
        tempStr = [str, blk];
        [temp, ind] = gsort(part(tempStr,1),'g','i');
        //sortedStr = tempStr(ind);
        ind = find(ind == max(ind));
    else
        i = i-1;
        indx = find(part(str,1:i)==part(blk,1:i));
        tempStr = [str(indx), blk];
        indx = indx(1):indx($)+1;
        [temp, ind] = gsort(part(tempStr,i+1),'g','i');
        // assuming that array is sorted
        ind = find(ind == max(ind));
        ind = indx(ind);
    end
    sortedStr = [str1(1:ind-1) blk1 str1(ind:$)];
endfunction
