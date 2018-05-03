    f_addNew = figure('dockable', 'off', 'infobar_visible', 'off', 'toolbar_visible', 'off', 'toolbar', 'none', 'menubar_visible', 'on', 'menubar', 'none', 'default_axes', 'off', ...
        'layout', 'border', 'figure_name', gettext(prodName), 'visible', 'on','icon','jagannath.png','position',[230 40 850 630]);
    
    menu = uimenu(f_addNew, 'Label', gettext('Menu'));
    uimenu(menu, 'Label', gettext('Add New Villages'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WRD: Add New Sponsor'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WRD: Add New Support Type'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WRD: Increase/Decrease Rows'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WE: Increase/Decrease Rows'),'callback','exec(''addBlocks.sce'');');

    frame_top = uicontrol(f_addNew, 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 100]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), gettext(trustName), 'center', 'below_top', createBorderFont('', 16, 'bold'), 'black'), ...
        'backgroundcolor', [.98 .98 .98], 'layout_options', createLayoutOptions('grid', [1, 4]),...//);// ...
        'layout', 'grid');
    
    layer_addNew = uicontrol(f_addNew, 'tag', 'addNewLayer', 'style', 'layer', 'constraints', createConstraints('border', 'center', [0, 150]), ...
        'String', 'addWadiFrame', 'border', createBorder('line', 'lightGray', 1), 'backgroundcolor', [1 1 1]);
    
    pop_list = list(departments,blocks(1),'','');
    if isempty(pop_list(2)) then
        pop_list(2) = '';
    end
    pop_name = ['Department', 'Block', 'Village', 'Hemlet'];
    pop_tag = ['dpt' 'blk' 'vil' 'hem'];
    t_str = ['addWadiFrame', 'addWRDFrame', 'addWEframe', 'addLandlessFrame', 'addComCareFrame'];
    clbks = ['set(get(''addNewLayer''),''String'',t_str(get(''dpt'',''value'')));', ...
        'set(get(''vil''),''String'',blocks(2)(get(''blk'',''Value''))(1),''value'',[]); set(get(''hem''),''String'','''');',...
        'set(get(''hem''),''String'',blocks(2)(get(''blk'',''Value''))(2)(get(''vil'',''Value'')),''value'',[]);',''];
    for i = 4:-1:1
        fr = uicontrol(frame_top, 'style', 'frame','backgroundcolor', [.98 .98 .98],'layout','border','border',createBorder('empty',10,20,15,20));
        uicontrol(fr, 'tag',pop_tag(i), 'Style', 'popupmenu','backgroundcolor', [.98 .98 .98],'constraints', createConstraints('border', 'bottom', [0, 20]),...
            'String', gettext(pop_list(i)), 'callback',clbks(i));
        uicontrol(fr, 'Style', 'text','HorizontalAlignment', 'center','backgroundcolor', [.98 .98 .98],'constraints', createConstraints('border', 'top', [0, 25]),...
            'FontSize', 12, 'String', gettext(pop_name(i)));
    end
    
    Footer = uicontrol(f_addNew, 'style', 'frame', 'constraints', createConstraints('border', 'bottom', [0, 30]), 'backgroundcolor', [1 1 1]);   
    
    frame_addWadi = uicontrol(layer_addNew, 'tag', 'addWadiFrame', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('line', 'lightGray', 1), ...
        'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','border');
    frame_addWRD = uicontrol(layer_addNew, 'tag', 'addWRDFrame', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), ('WRD Support Acknowledgement'), 'center', 'below_top', createBorderFont('', 16, 'normal'), 'black'), ...
        'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','border');
    frame_addWE = uicontrol(layer_addNew, 'tag', 'addWEframe', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), ('Women Empowerment: Self Help Group Registration Form'), 'center', 'below_top',..
         createBorderFont('', 16, 'normal'), 'black'), 'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','border');
    frame_addLandless = uicontrol(layer_addNew, 'tag', 'addLandlessFrame', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), _('Sri Chaitanya Seva Trust: LL'), 'center', 'below_top', createBorderFont('', 16, 'normal'), 'black'), ...
        'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','border');
    frame_addComCare = uicontrol(layer_addNew, 'tag', 'addComCareFrame', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), _('Sri Chaitanya Seva Trust: cc'), 'center', 'below_top', createBorderFont('', 16, 'normal'), 'black'), ...
        'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','border');
        
    frame_img = uicontrol(layer_addNew, 'tag', 'imgFrame', 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 150]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), _('Sri Chaitanya Seva Trust'), 'center', 'below_top',...
         createBorderFont('', 16, 'normal'), 'black'), ...
        'backgroundcolor', [1 1 1], 'Scrollable', 'on','layout','gridbag');
        
    h = uicontrol(frame_img, 'Style', 'image', 'String', 'Govardhanashram-logo.png', 'backgroundcolor', [1 1 1]);
    scales = [.1:.001:.9];
    for k = scales
        set(h,'value',[k k]);
        //sleep(1);
    end
    
    exec('_weFrame.sce');
    exec('_wrdFrame.sce');    
    exec('_wadiFrame.sce');
