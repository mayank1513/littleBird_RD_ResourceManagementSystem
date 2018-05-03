function [img, lowResPath, highResPath] = getPhoto(path)
    img = imread(path);
    f = createWindow();
    imdisplay(img,f);
//    set(f,'layout','border');
    i = uicontrol(f,'style','image','string',path,'position',[20,20,200,200],'scrollable','on');
    disp(size(img));
endfunction
