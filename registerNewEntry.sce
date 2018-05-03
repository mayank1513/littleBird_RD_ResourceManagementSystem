if ~isdir(baseDir + '\Cumulative') then
    mkdir(baseDir + '\Cumulative');
end
if ~isdir(baseDir + '\Cumulative\'+blkStr) then
    [status, msg] = mkdir(baseDir + '\Cumulative\'+blkStr);
    if status~=1 then
        messagebox(['directory Cumulative\'+blkStr+' could not be created'; msg],'littleBird');
    end
end

fc_name = baseDir + '\Cumulative\' + blkStr + '\Cumulative_' + vilStr +'.csv';
        wrd(1,1:2:2*size(wrdSupportType,2)) = 'WRD: '+wrdSupportType;
        wrd(1,2:2:$) = 'Date';
        wrd(1,2*size(wrdSupportType,2):2*size(wrdSupportType,2)+1) = ['Remarks' 'Date'];
if isfile(fc_name) then
    regNoList = csvRead(fc_name,',','.','string');
    if isempty(regNoList) then
        messagebox('File could not be read or it was empty');
        regNoList = ['Reg. No.','#familyMemebrs','SEWA', 'Starting Date',wrd,'Women Empowerment', 'Starting Date',...
        'Landless', 'Starting Date','Community Care', 'Starting Date','Rural Education', 'Starting Date'];
    end
    regNo = createNewRegfile(fc_name,regNoList,nFamily,regColInd,regValues,vilStr,regDate,nReg);
//    exec('createNewRegfile.sce');
else
    regNoList = ['Reg. No.','#familyMemebrs','SEWA', 'Starting Date',wrd,'Women Empowerment', 'Starting Date',...
        'Landless', 'Starting Date','Community Care', 'Starting Date','Rural Education', 'Starting Date'];
    regNo = createNewRegfile(fc_name,regNoList,nFamily,regColInd,regValues,vilStr,regDate,nReg);
end
