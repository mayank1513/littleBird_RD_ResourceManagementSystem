blkInd = get('blockList','Value');
vilInd = get('villageList','Value');
hemInd = get('hemletList','Value');
if isempty(blkInd)|isempty(hemInd) then
    messagebox("Select a hemlet first","littleBird");
else
    str = get('hemletList','String');
    btn = messagebox("Are you sure you want to delete " + str(hemInd),'littleBird: Confirmation','passwd',['Yes','No'],"modal");
    if btn == 1 & x_dialog("Enter password",'') == passWord
        blocks(2)(blkInd)(2)(vilInd) = [blocks(2)(blkInd)(2)(vilInd)(1:hemInd-1), blocks(2)(blkInd)(2)(vilInd)(hemInd+1:$)];
        set(get('hemletList'),'String',blocks(2)(blkInd)(2)(vilInd));
    end
end
