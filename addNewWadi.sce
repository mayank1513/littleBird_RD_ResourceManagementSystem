if ~isdir(baseDir + '\SEWA') then
    mkdir(baseDir + '\SEWA');
end
blkStr = get('blk','string')(get('blk','value'));
vilStr = get('vil','string')(get('vil','value'));
hemStr = get('hem','string')(get('hem','value'));
if isempty(blkStr)|isempty(vilStr)|isempty(hemStr) then
    messagebox('Please Select Block, village and Hemlet');
else
//    exec('registerNewEntry.sce');
if ~isdir(baseDir + '\SEWA\'+blkStr) then
    [status, msg] = mkdir(baseDir + '\SEWA\'+blkStr);
    if status~=1 then
        messagebox(['directory SEWA\'+blkStr+' could not be created'; msg],'littleBird');
    end
end
f_name = baseDir + '\SEWA\' + blkStr + '\Wadi_' + vilStr +'.csv';

if isfile(f_name) then
    wadiList = csvRead(f_name,',','.','string');
    if isempty(wadiList) then
        messagebox('File could not be read or it was empty');
        wadiList = ['Registration Number', 'Name of Member', 'Number of Family Member', 'Hemlet', 'Name of Shetkari Mandal'];
    end
    exec('createNewWadifile.sce');
else
    wadiList = ['Registration Number', 'Name of Member', 'Number of Family Member', 'Hemlet', 'Name of Shetkari Mandal'];
    exec('createNewWadifile.sce');
end

end

