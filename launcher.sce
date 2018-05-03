//Notes
//Event model: Plan event (Before Event); Event Execution; After Event(Notes, Impact Analysis)
//Personal Reports: timeline (photos, explanations) tell a story 
//timeline of project progress
//Strings
xdel(winsid());
prodName = "littleBird Rural Development Resource Planning System";
supportLink = "https://";
authorLink = "https://";
orgName = "Govardhan Gramsewa";
trustName = "Sri Chaitanya Seva Trust";
orgLink = "https://ecovillage.org.in";
orgLogo = "gevlogo";
baseDir = pwd();

//metadata
departments = ["Wadi", "WRD", "Women Empowerment", "Landless", "Community Care"];
passWord = 'Krishna';
if isfile(baseDir+'\meta.dat') then
    load(baseDir+'\meta.dat','blocks');
end
//blocks(1 or 2)(block ind)(1 or 2)(vill ind)
if ~exists('blocks') then
    blocks = list([],list(list([],list([]))));
end
shgMax = 15;
wrdMax = 20;
wrdSupportType = ['New Borewell Installation' 'Old Borewell Repairing' 'Lift Irrigation' 'Water Tank Installation' 'other: specify in remarks'];
Sponsor = ['Krishna Pharmaceuticals Limited' 'Rubamin Limited' 'Apar Industries Limited' 'Imperial'];
//including functions
exec('insertName.sci');
exec('str2date.sci');
exec('getPhoto.sci');
exec('createNewRegFile.sci');
//Daily Nectar
//doc = htmlRead('http://bhaktirasamritaswami.info/');
//dailyNectarStr = doc.root.children(2).children(2).content...
//    (find(~(strstr(doc.root.children(2).children(2).content,'Daily Nectar')==''))+1);
//xmlDelete(doc);
//messagebox(dailyNectarStr,'BRSM Daily Nectar');
// Launcher UI
    f_launcher = figure('dockable', 'off', 'infobar_visible', 'off', 'toolbar_visible', 'off', 'toolbar', 'none', 'menubar_visible', 'on', 'menubar', 'none', 'default_axes', 'off', ...
        'layout', 'border', 'figure_name', gettext(prodName), 'visible', 'on','icon','jagannath.png','position', [150   20   1010   640]);
    
    menu = uimenu(f_launcher, 'Label', gettext('Menu'));
    menuAddNew = uimenu(f_launcher, 'Label', gettext('Add New Participants'),'callback','exec(''addNew.sce'');');
    uimenu(menu, 'Label', gettext('Add New Villages'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WRD: Add New Sponsor'),'callback','exec(''addBlocks.sce'');');
    uimenu(menu, 'Label', gettext('WRD: Add New Support Type'),'callback','exec(''addBlocks.sce'');');

    frame_top = uicontrol(f_launcher, 'style', 'frame', 'constraints', createConstraints('border', 'top', [0, 200]), ...
        'border', createBorder('titled', createBorder('line', 'lightGray', 1), gettext(trustName), 'center', 'below_top', createBorderFont('', 16, 'normal'), 'black'), ...
        'backgroundcolor', [.98 .98 .98], 'layout_options', createLayoutOptions('grid', [1, 4]),'layout', 'grid');
    
    pop_list = list(['Select All' departments],['Select All' blocks(1)],'Select All' ,'Select All' );
    sz = size(pop_list(1),2);
    if isempty(pop_list(2)) then
        pop_list(2) = '';
    end
    pop_list(2)(1,$+1:sz-1) = '';
    pop_list(3)(1,$+1:sz-1) = '';
    pop_list(4)(1,$+1:sz-1) = '';
    list_size = [size(pop_list(1),2) size(pop_list(2),2) size(pop_list(3),2) size(pop_list(4),2)];
    pop_name = ['Department', 'Block', 'Village', 'Participnt Names'];
    pop_tag = ['dpt_' 'blk_' 'vil_' 'hem_'];
//    clbks = ['set(get(''addNewLayer''),''String'',t_str(get(''dpt'',''value'')));', ...
//        'set(get(''vil''),''String'',blocks(2)(get(''blk'',''Value''))(1),''value'',[]); set(get(''hem''),''String'','''');',...
//        'set(get(''hem''),''String'',blocks(2)(get(''blk'',''Value''))(2)(get(''vil'',''Value'')),''value'',[]);',''];
    dptSelect(size(departments)) = %f;
    blkSelect = list();
    temp(1,list_size(2)) = %f;
    blkSelect(1) = temp;
    blkSelect(2) = list();
    for i = 1:size(blocks(1),2)
        sz = size(blocks(2)(i)(1),2);
        if sz==0 then
            continue;
        end
        temp(1,sz) = %f;
        blkSelect(2)(i) = temp;
    end 
    for i = 4:-1:1
        fr = uicontrol(frame_top, 'style', 'frame','backgroundcolor', [.98 .98 .98],'layout','border','border',createBorder('empty',10,20,10,20));
        fr1 = uicontrol(fr, 'style', 'frame','backgroundcolor', [.98 .98 .98],'layout_options', createLayoutOptions('grid', [list_size(i), 1]),'layout', 'grid',...
            'border',createBorder('empty',10,20,25,20),'scrollable','on');
        for j = list_size(i):-1:1
            fr2 = uicontrol(fr1, 'style', 'frame', 'layout', 'border');
            clf(fr2);
            if length(pop_list(i)(j)) then
                t_str = pop_tag(i)+string(j); 
                uicontrol(fr2, 'tag',t_str,'style','checkbox','backgroundcolor', [.98 .98 .98],'constraints', createConstraints('border', 'left', [20, 20]));
                uicontrol(fr2, 'backgroundcolor', [.95 .95 .95],'constraints', createConstraints('border', 'center', [100, 20]),...
                'String', gettext(pop_list(i)(j)),'HorizontalAlignment', 'left','callback','set(get('''+t_str+'''),''value'',1);');
            else
                uicontrol(fr2, 'style','text','backgroundcolor', [.98 .98 .98],'constraints', createConstraints('border', 'center', [100, 20]),...
                'String', gettext(pop_list(i)(j)),'HorizontalAlignment', 'left');
            end
        end
        uicontrol(fr, 'Style', 'text','HorizontalAlignment', 'center','backgroundcolor', [.98 .98 .98],'constraints', createConstraints('border', 'top', [0, 25]),...
            'FontSize', 12, 'String', gettext(pop_name(i)));
    end
    
    Footer = uicontrol(f_launcher, 'style', 'frame', 'constraints', createConstraints('border', 'bottom', [0, 30]), 'backgroundcolor', [1 1 1]);   

//blocks(1) = ["Wada" "Vikramgadh"];//names of blocks
//blocks(2) = list(); // lists of villages
//blocks(2)(1) = list();
//blocks(2)(1)(1) = ["Galtare", "Guhir"]; //names of villages in block 1
//blocks(2)(1)(2) = list();
//blocks(2)(1)(2)(1) = ["Galtare Vill", "Pada1"]; //names of villages in block 1
//blocks(2)(1)(2)(2) = ["Guhir Vill", "Pada1"]; //names of villages in block 1
//
//blocks(2)(2) = list();
//blocks(2)(2)(1) = ["Vikrmvill", "Vill2"]; //names of villages in block 1
//blocks(2)(2)(2) = list();
//blocks(2)(2)(2)(1) = ["Vikram Vill", "Pada1"]; //names of villages in block 1
//blocks(2)(2)(2)(2) = ["vikram Vill", "Pada1"]; //names of villages in block 1
//
