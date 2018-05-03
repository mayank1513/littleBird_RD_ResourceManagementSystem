blkInd = get('blockList','Value');
vilInd = get('villageList','Value');
str = get(get('edit_hemletList'),"String");
for i = 1:size(str,2)-1
    str(i) = stripblanks(part(str(i),1:$-1));
end
str($) = stripblanks(str($));
if isempty(blkInd)|isempty(vilInd) then
    messagebox("Select a block and village first","littleBird");
else
    addblk_msgStr = [];
    for i = 1:size(str,2)
        if isempty(str(i)) then
            continue;
        end
        if ~isempty(find(blocks(2)(blkInd)(2)(vilInd)==str(i))) then
            addblk_msgStr($+1) = str(i);
            continue;
        end
        //blocks(1 or 2)(block ind)(1 or 2)(vill ind)
        [blocks(2)(blkInd)(2)(vilInd), ind] = insertName(blocks(2)(blkInd)(2)(vilInd),str(i));
    end
    
    set(get('hemletList'),'String',blocks(2)(blkInd)(2)(vilInd));
    
    if ~isempty(addblk_msgStr) then
        messagebox(addblk_msgStr + " already exists in the list!", "littleBird: Duplicate entries ignored!!!","info");
    end
    
    set(get('edit_hemletList'),"String","");
end

