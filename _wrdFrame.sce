// WRD frame
    TopFr = uicontrol(frame_addWRD, 'style', 'frame','constraints', createConstraints('border', 'top', [0, 140]),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [1,2]));
    BotFr = uicontrol(frame_addWRD, 'style', 'frame','constraints', createConstraints('border', 'bottom', [0, 30]),..
        'layout', 'border','backgroundcolor', [1 1 1],'border', createBorder('empty',4,0,4,0));
        
        
    uicontrol(BotFr, 'constraints', createConstraints('border', 'right', [80, 0]), 'String', 'Add');
    uicontrol(BotFr, 'constraints', createConstraints('border', 'left', [80, 0]), 'String', 'Cancel');
        
    devFr1 = uicontrol(TopFr, 'style', 'frame',..
        'layout', 'border','backgroundcolor', [1 1 1]);
    fieldsFr = uicontrol(devFr1, 'style', 'frame','constraints', createConstraints('border', 'left', [160, 0]),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',0,0,5,0));
        
    entriesFr = uicontrol(devFr1, 'style', 'frame','constraints', createConstraints('border', 'center'),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',0,2,5,25));
        
    fieldsStr = ['WRD Support Type' ' ' 'Sponsor' '  ' 'Remarks' ]; //d = date();
    entriesStr = list(wrdSupportType,'', Sponsor,'','');
    sty = ['popupmenu' 'pushbutton' 'popupmenu' 'pushbutton' 'edit'];
    for i = 5:-1:1
        uicontrol(fieldsFr, 'Enable','off','String', fieldsStr(i),'backgroundcolor', [1 1 1],'FontWeight','bold');
        uicontrol(entriesFr, 'style',sty(i),'String',entriesStr(i) ,'backgroundcolor', [1 1 1],'FontWeight','demi',..
            'tag','wrd_' + fieldsStr(i));
    end
    set([get('wrd_ '),get('wrd_  ')],'Enable','off');
    devFr2 = uicontrol(TopFr, 'style', 'frame', 'layout', 'border','backgroundcolor', [1 1 1]);
    fieldsFr = uicontrol(devFr2, 'style', 'frame','constraints', createConstraints('border', 'left', [160, 0]),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',0,0,5,0));
        
    entriesFr = uicontrol(devFr2, 'style', 'frame','constraints', createConstraints('border', 'center'),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',0,2,5,25));
    fieldsStr = ['Name of Shetakari Mandal' 'Starting Date/Month' 'Account Number' 'Bank Name' 'IFSC Code' 'Savings/member/month'];
    entriesStr = ['', date(), '', 'State Bank of India', '', '100'];
    for i = 6:-1:1
        uicontrol(fieldsFr, 'Enable','off','String', fieldsStr(i),'backgroundcolor', [1 1 1],'FontWeight','bold');
        uicontrol(entriesFr, 'style','edit','String', entriesStr(i),'backgroundcolor', [1 1 1],'FontWeight','demi',..
            'tag','wrd_' + fieldsStr(i));
    end    
    //Adding WRD members
    shgStr = ['' string(1:wrdMax)]'; shgStr(1,2) = 'Name of Member'; shgStr(1,3) = 'No. of family members'; 
    shgStr(1,4) = 'Connected to Wadi or other WRD? (y/n))'; shgStr(1,5) = 'Registration No.'; 
    uicontrol(frame_addWRD,'tag','shgNames', 'style','table', 'string',shgStr, 'constraints', createConstraints('border', 'center', [0, 140]));
