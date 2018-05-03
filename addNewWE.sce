if ~isdir(baseDir + '\WomenEmpowerment') then
    mkdir(baseDir + '\WomenEmpowerment');
end
blkStr = get('blk','string')(get('blk','value'));
vilStr = get('vil','string')(get('vil','value'));
hemStr = get('hem','string')(get('hem','value'));
if isempty(blkStr)|isempty(vilStr)|isempty(hemStr) then
    messagebox('Please Select Block, village and Hemlet');
else
if ~isdir(baseDir + '\WomenEmpowerment\'+blkStr) then
    [status, msg] = mkdir(baseDir + '\WomenEmpowerment\'+blkStr);
    if status~=1 then
        messagebox(['directory WomenEmpowerment\'+blkStr+' could not be created'; msg],'littleBird');
    end
end
f_name = baseDir + '\WomenEmpowerment\' + blkStr + '\WE_' + vilStr +'.csv';

if isfile(f_name) then
    weList = csvRead(f_name,',','.','string');
    if isempty(weList) then
        messagebox('File could not be read or it was empty');
        weList = ['Sr. No.','Hemlet','SHG Name','Total SHG Member','Registration Number','Name of Member','Number of Family Member','Bank Name',...
            'Account No','Monthly Saving', 'Remarks', 'Starting Date', 'IFSC Code of Bank'];
    end
    exec('createNewWEfile.sce');
else
    weList = ['Sr. No.','Hemlet','SHG Name','Total SHG Member','Registration Number','Name of Member','Number of Family Member','Bank Name',...
            'Account No','Monthly Saving', 'Remarks', 'Starting Date', 'IFSC Code of Bank'];
    exec('createNewWEfile.sce');
end

end
