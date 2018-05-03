blkInd = get('blockList','Value');
if isempty(blkInd) then
    messagebox("Select a block first","littleBird");
else
    str = get('blockList','String');
    btn = messagebox("Are you sure you want to delete " + str(blkInd),'littleBird: Confirmation','passwd',['Yes','No'],"modal");
    if btn == 1 & x_dialog("Enter password",'') == passWord
        blocks(1) = [blocks(1)(1:blkInd-1), blocks(1)(blkInd+1:$)];
        blocks(2)(blkInd) = null();
        set(get('blockList'),'String',blocks(1));
        set(get('villageList'),'String','');
        set(get('hemletList'),'String','');
    end
end
