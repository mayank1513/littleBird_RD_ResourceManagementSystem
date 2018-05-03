str = get(get('edit_blockList'),"String");
for i = 1:size(str,2)-1
    str(i) = stripblanks(part(str(i),1:$-1));
end
str($) = stripblanks(str($));
addblk_msgStr = [];
for i = 1:size(str,2)
    if isempty(str(i)) then
        continue;
    end
    if ~isempty(find(blocks(1)==str(i))) then
        addblk_msgStr($+1) = str(i);
        continue;
    end
    //blocks(1 or 2)(block ind)(1 or 2)(vill ind)
    [blocks(1), ind] = insertName(blocks(1),str(i));
    for i1 = size(blocks(1),2):-1:ind+1
        blocks(2)(i1) = blocks(2)(i1-1);
    end
    blocks(2)(ind) = list([],list([]));
end

set(get('blockList'),'String',blocks(1));
set(get('villageList'),'String','');
set(get('hemletList'),'String','');

if ~isempty(addblk_msgStr) then
    messagebox(addblk_msgStr + " already exists in the list!", "littleBird: Duplicate entries ignored!!!","info");
end

set(get('edit_blockList'),"String","");


