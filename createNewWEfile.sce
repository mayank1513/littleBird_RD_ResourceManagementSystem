    shgName = get('shg_SHG Name','String'); bankName = get('shg_Bank Name','String'); accNo = get('shg_Account Number','String');
    shgSaving = get('shg_Savings','String'); remarks = get('shg_Remarks','String'); startDate = get('shg_Starting Date','string'); ifscCode = get('shg_IFSC Code','String');
    if isempty(shgName) then
        messagebox('Please Enter SHG Name','littleBird');
    else
        if isempty(bankName) then bankName = ''; end
        if isempty(accNo) then accNo = ''; end
        if isempty(shgSaving) then shgSaving = ''; end
        if isempty(remarks) then remarks = ''; end
        if isempty(startDate) then startDate = ''; end
        if isempty(ifscCode) then ifscCode = ''; end
    end
    names = stripblanks(get('shgNames','string'));
    msgStr = [];
    weStart = size(weList,1)+1;
    for i = 2:shgMax
        if isempty(names(i,2)) then
            continue;
        end
        if ~isempty(find(weList(2:$,6)==names(i,2))) then
            msgStr($+1) = names(i);
            continue;
        end
        [weList(weStart:$+1,6), we_ind] = insertName(weList(weStart:$,6)',names(i,2)); we_ind = we_ind+weStart-1;
        weList(we_ind+1:$,7) = weList(we_ind:$-1,7);
        weList(we_ind,7) = names(i,3);
        if names(i,4)=='y'|names(i,4)=='Y'|names(i,4)=='T' & ~isempty(names(i,4))
            //check for the reg number in cumulative list and update
            weList(we_ind,5) = names(i,5);
        end
    end
    weList(weStart,4) = string(size(weList,1)-weStart+1);
    for i = weStart:size(weList,1)
        if isempty(weList(i,5))
            regDate = get('shg_Starting Date','string'); 
            regValues = [weList(i,6) regDate];
            regColInd = [6+2*size(wrdSupportType,2), 7+2*size(wrdSupportType,2)];
            nFamily = names(i,3);
            nReg = -1;
            exec('registerNewEntry.sce');
//            regNo = 'GEV' + string(y) + vilStr + n;
            weList(i,5) = regNo;
        end
    end
    weList(weStart,[1 2 3 8 9 10 11 12 13]) = ['1', hemStr, shgName ,bankName, accNo, shgSaving, remarks, startDate, ifscCode];
    csvWrite(weList,f_name);
    
