function regNo = createNewRegfile(fc_name,regNoList,nFamily,regColInd,regValues,vilStr,regDate,regN)
    if regN~=-1 then
        n = find(regNoList(:,1)==regN);
        if isempty(n) then
            btn = messagebox('registration number' + string(regN) + 'does not exist', 'littleBird', 'error', ['Enter Correct Registration Number', 'Cancel'], 'modal');
            if btn == 1 then
                while isempty(n)
                    regN = x_mdialog('Enter Correct Registration Number','GEV');
                    if isempty(regN) break; end
                    n = find(regNoList(:,1)==regN);
                end
                if isempty(n) then return -1; end
            else
                return -1;
            end
        end
        if sum(length(stripblanks(regNoList(n,regColInd))~=0)) then
            mStr = 'Entries already Exist:';
            mStr(2:3,1:size(regColInd,2)) = regNo([1 n],regColInd);
            btn = messagebox(mStr , 'littleBird', 'error', ['Over Write New Values', 'Cancel'], 'modal');
            if btn == 1
                regNoList(n,regColInd) = regValues; //overwriting if there was any existing entry
            else
                return -1;
            end
        end
        regNoList(n,regColInd) = regValues; //overwriting if there was any existing entry
        // implement check for nFamily
        return regN;
    end
    nReg = size(regNoList,1);
    [d, m, y] = str2date(regDate); 
    if m<4 then y = y-1; end
    n = '000'; n = part(n,1:3-length(string(nReg))) + string(nReg);
    regNo = 'GEV' + string(y) + vilStr + n;
    regNoList($+1,[1 2 regColInd]) = [regNo nFamily regValues];
    csvWrite(regNoList,fc_name);
endfunction
