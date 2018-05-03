    TopFr = uicontrol(frame_addWadi, 'style', 'frame','constraints', createConstraints('border', 'top', [0, 140]),..
        'layout', 'border','backgroundcolor', [1 1 1],'border', createBorder('empty',8,3,3,3));
    
    BotFr = uicontrol(frame_addWadi, 'style', 'frame','constraints', createConstraints('border', 'bottom', [0, 30]),..
        'layout', 'border','backgroundcolor', [1 1 1],'border', createBorder('empty',4,0,4,0));
        
        
    uicontrol(BotFr, 'constraints', createConstraints('border', 'right', [80, 0]), 'String', 'Add','callback','exec(''addNewWadi.sce'');');
    uicontrol(BotFr, 'constraints', createConstraints('border', 'left', [80, 0]), 'String', 'Cancel','callback','close();');
        
        
    devFr0 = uicontrol(TopFr, 'style', 'frame','constraints',createConstraints('border', 'left', [180, 0]),..
        'layout', 'border','backgroundcolor', [1 1 1]);
        uicontrol(devFr0, 'style','image','String', 'Govardhanashram-logo.png', 'backgroundcolor', [1 1 1], 'value', [.5 .5]);
        
    devFr1 = uicontrol(TopFr, 'style', 'frame','constraints',createConstraints('border', 'right', [200, 0]),..
        'layout', 'border','backgroundcolor', [1 1 1]);
    photo1Fr = uicontrol(devFr1, 'style', 'frame','constraints', createConstraints('border', 'left'),..
        'layout', 'border','backgroundcolor', [1 1 1],'border', createBorder('empty',0,0,5,0));
    
    photo2Fr = uicontrol(devFr1, 'style', 'frame','constraints', createConstraints('border', 'right'),..
        'layout', 'border','backgroundcolor', [1 1 1], 'border', createBorder('empty',0,2,5,5));
    
    uicontrol(photo1Fr,'tag','wadi_photo1','String', 'Select Photo','callback','set(get(''wadi_photo1''),''icon'',uigetfile(''*.jpg''))'); 
    uicontrol(photo2Fr,'tag','wadi_photo2','String', 'Select Photo','callback','set(get(''wadi_photo2''),''icon'',uigetfile(''*.jpg''))');    
    
    devFr2 = uicontrol(TopFr, 'style', 'frame', 'layout', 'border','backgroundcolor', [1 1 1],..
    'border', createBorder('titled', createBorder('empty'),('Symbiotically Enhanced Wadi Agriculture'), 'center', 'below_top', createBorderFont('', 18, 'bold'), 'black'));
    
    uicontrol(devFr2,'style','text','string','Agreement and Basic Survey','constraints', createConstraints('border', 'top', [0, 20]),...
    'HorizontalAlignment','center','FontWeight','bold','backgroundcolor', [1 1 1]);
    devFr3 = uicontrol(devFr2, 'style', 'frame', 'layout', 'grid','backgroundcolor', [1 1 1],...
    'layout_options', createLayoutOptions('grid', [3,1]),'border', createBorder('empty',12,0,3,3));
    
        
//    entriesFr = uicontrol(devFr3, 'style', 'frame','constraints', createConstraints('border', 'center'),..
//        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [3,1]),..
//            'border', createBorder('empty',0,2,5,25));
    fieldsStr = ['Sri' 'Srimati' 'Category' 'Total Land' 'Land Under Project' 'Joining Date'];
    entriesStr = ['', '', 'ST', '', '',date()];
    for i = 3:-1:1
        fieldsFr = uicontrol(devFr3, 'style', 'frame','layout', 'border', 'border', createBorder('empty',1,1,1,1),'backgroundcolor', [1 1 1]);
        uicontrol(fieldsFr, 'Enable','off','String', fieldsStr(i),'backgroundcolor', [1 1 1],'FontWeight','bold','constraints', createConstraints('border', 'left', [85, 0]));
        uicontrol(fieldsFr, 'style','edit','String', entriesStr(i),'backgroundcolor', [1 1 1],'FontWeight','demi','tag','wrd_' + fieldsStr(i));
        fieldsFr = uicontrol(fieldsFr, 'style', 'frame','constraints', createConstraints('border', 'right', [240, 0]),'layout','border');
        uicontrol(fieldsFr, 'Enable','off','String', fieldsStr(i+3),'backgroundcolor', [1 1 1],'FontWeight','bold','constraints', createConstraints('border', 'left', [140, 0]));
        uicontrol(fieldsFr, 'style','edit','String', entriesStr(i+3),'backgroundcolor', [1 1 1],'FontWeight','demi','tag','wrd_' + fieldsStr(i+3));
    end
//    fieldsFr = uicontrol(fieldsFr, 'style', 'frame','constraints', createConstraints('border', 'right', [120, 0]),'layout','border');
//
//
