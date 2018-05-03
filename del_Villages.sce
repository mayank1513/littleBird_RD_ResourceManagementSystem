blkInd = get('blockList','Value');
vilInd = get('villageList','Value');
if isempty(blkInd)|isempty(vilInd) then
    messagebox("Select a block and village first","littleBird");
else
    str = get('villageList','String');
    btn = messagebox("Are you sure you want to delete " + str(vilInd),'littleBird: Confirmation','passwd',['Yes','No'],"modal");
    if btn == 1 & x_dialog("Enter password",'') == passWord
        blocks(2)(blkInd)(1) = [blocks(2)(blkInd)(1)(1:vilInd-1), blocks(2)(blkInd)(1)(vilInd+1:$)];
        blocks(2)(blkInd)(2)(vilInd) = null();
        set(get('villageList'),'String',blocks(2)(blkInd)(1));
        set(get('hemletList'),'String','');
    end
end

