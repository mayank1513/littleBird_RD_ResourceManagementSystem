// WE frame
    TopFr = uicontrol(frame_addWE, 'style', 'frame','constraints', createConstraints('border', 'top', [0, 140]),..
        'layout', 'border','backgroundcolor', [1 1 1]);
    BotFr = uicontrol(frame_addWE, 'style', 'frame','constraints', createConstraints('border', 'bottom', [0, 30]),..
        'layout', 'border','backgroundcolor', [1 1 1],'border', createBorder('empty',4,0,4,0));
        
        
    uicontrol(BotFr, 'constraints', createConstraints('border', 'right', [80, 0]), 'String', 'Add','callback','exec(''addNewWE.sce'');');
    uicontrol(BotFr, 'constraints', createConstraints('border', 'left', [80, 0]), 'String', 'Cancel');
        
    fieldsFr = uicontrol(TopFr, 'style', 'frame','constraints', createConstraints('border', 'left', [160, 0]),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',2,30,5,0));
        
    entriesFr = uicontrol(TopFr, 'style', 'frame','constraints', createConstraints('border', 'center'),..
        'layout', 'grid','backgroundcolor', [1 1 1],'layout_options', createLayoutOptions('grid', [7,1]),..
            'border', createBorder('empty',0,2,5,65));
        
    fieldsStr = ['SHG Name' 'Starting Date' 'Account Number' 'Bank Name' 'IFSC Code' 'Savings' 'Remarks']; //d = date();
    entriesStr = ['', date(), '', 'State Bank of India', '', '100',''];
    for i = 7:-1:1
        uicontrol(fieldsFr, 'Enable','off','String', fieldsStr(i),'backgroundcolor', [1 1 1],'FontWeight','bold');
        uicontrol(entriesFr, 'style','edit','String', entriesStr(i),'backgroundcolor', [1 1 1],'FontWeight','demi',..
            'tag','shg_' + fieldsStr(i));
    end
    //Adding Shg members
    shgStr = ['' string(1:shgMax)]'; shgStr(1,2:5) = ['Name of SHG Member' '# Family Member' 'Connected to Wadi or WRD? (y/n))' 'Registration No.']; 
    uicontrol(frame_addWE,'tag','shgNames', 'style','table', 'string',shgStr, 'constraints', createConstraints('border', 'center', [0, 140]));
    
