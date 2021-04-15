function lua_30wb_szLuaInitScript()
  local boss=OwnerID();
  Lua_DW_WBGUIDRecord( 1 );--世界王掉寶設定    賽西蒙德是30的第1個世界王，SN就填1
  
  local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
  SetModeEx(boss,EM_SetModeType_Move,false);
  SetModeEx(boss,EM_SetModeType_Gravity,false);
  SetModeEx(boss,EM_SetModeType_Searchenemy,false);
  local x,y,z,dir=DW_Location(boss);
  
--  local ctrl=CreateObj(108403,x,GetHeight(x,y,z),z,90,1);
  local ctrl=CreateObj(109239,x,GetHeight(x,y,z),z,90,1);
  SetModeEx(ctrl,EM_SetModeType_Move,false);
  SetModeEx(ctrl,EM_SetModeType_Searchenemy,false);
  AddToPartition(ctrl,room);
  AddBuff(ctrl,507899,0,-1);
  --CallPlot(ctrl,"DW_tokenrule",boss);
--  LockHP(ctrl,DW_GetHPpercentVar(ctrl,95),"lua_30wb_ctrl_trigger")
  LockHP(ctrl,1,"lua_30wb_ctrl_trigger")
  WriteRoleValue(ctrl,EM_RoleValue_Register1,boss);
  
  local kid=CreateObj(108407,x,y-25,z,dir,1);
  SetModeEx(kid,EM_SetModeType_Mark,false);
  SetModeEx(kid,EM_SetModeType_ShowRoleHead,false);
  SetModeEx(kid,EM_SetModeType_HideName,true);
  SetModeEx(kid,EM_SetModeType_Gravity,false);
  DW_UnFight(kid,true);
  AddToPartition(kid,room);
  CallPlot(kid,"DW_tokenrule",ctrl);
  WriteRoleValue(ctrl,EM_RoleValue_Register2,kid);
end
function lua_30wb_ctrl_trigger()
  BeginPlot(OwnerID(),"lua_30wb_main",0);
end
--主體迴圈始於 中控器被打爆，終於 離開迴圈之際
function lua_30wb_main()
  DebugMsg(0, 0, "function lua_30wb_main() start!!!")

  global_30wb={};
  global_30wb.playerlist={};
  global_30wb.playerhash={};
  
  local ctrl=OwnerID();
  local boss=ReadRoleValue(ctrl,EM_RoleValue_Register1);
  local kid=ReadRoleValue(ctrl,EM_RoleValue_Register2);
  local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
  local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
    
  local candle={};
  for i=1,20,1 do
    local x,y,z,dir=DW_Location(781368,2);
    x,y,z,dir=DW_NewLocation(20*i,115,x,y,z,0);
    local a=CreateObj(108405,x,y,z,dir,1);
    SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
    SetModeEx(a,EM_SetModeType_HideName,true);
    DW_UnFight(a,true);
    AddToPartition(a,room);
    CallPlot(a,"DW_tokenrule",ctrl);
    
    candle[#candle+1]={guid=a;};
  end
  
  --特殊機制：賽西蒙德 的進入戰鬥機制是從玩家對符文進行足夠的傷害而啟動的
  --傷害 賽西蒙德 的方法就是對符文造成單體傷害，當傷害了結計算，每個人平均分配"這些血量"由系統打在賽西蒙德身上
  LockHP(ctrl,1,"");
  SetModeEx(ctrl,EM_SetModeType_Mark,false);
  SetModeEx(ctrl,EM_SetModeType_Show,false);
  SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
  SetModeEx(ctrl,EM_SetModeType_HideName,true);
  SetModeEx(ctrl,EM_SetModeType_Fight,false);
  DW_UnFight(ctrl,true);
  local amount=0;
  local a={};
  for pos=0,HateListCount(ctrl)-1,1 do
    table.insert(a,HateListInfo(ctrl,pos,EM_HateListInfoType_GItemID));
    amount=amount+1;
  end
  local dmg=math.floor((DW_GetHPpercentVar(boss,5)/#a)/10000);
  if(dmg<1)then
    dmg=1;
  end
  for i=1,#a,1 do
    Tell(a[i] , kid , "[SC_30WB_START]");--做得好。這些符文是我設下以防有人企圖染指這些強大的能量，用他們來對付賽西蒙德！
    SysCastSpellLv(a[i],boss,851335,dmg-1);
    global_30wb.playerlist[#global_30wb.playerlist+1]={guid=a[i];check=true;};
  end
  
  --time
  local increase=1;
  local gcd=0;
  local countdown={
        bubble=2;
        line=4;
        space=3;
        summon=10;
        bomb=17;
        };
  
  --HP system
  local rune={};
  local rune_angle=DW_CircleRand(5);
  local rune_dis=DW_Ran(3);
  local rune_basic=360/5;
  
  for i=1,5,1 do
    local x,y,z,dir=DW_Location(boss);
    x,y,z,dir=DW_NewLocation(rune_basic*rune_angle(),30*rune_dis(),x,y,z,0);
    local a=CreateObj(108403,x,y,z,90,1);
    SetModeEx(a,EM_SetModeType_Move,false);
    SetModeEx(a,EM_SetModeType_HideName,true);
    SetModeEx(a,EM_SetModeType_Searchenemy,false);
    AddToPartition(a,room);
    AddBuff(a,507899,0,-1);--不可攻擊
    --AddBuff(a,508481,0,-1);--AE無效化  K.J. Aris
    CallPlot(a,"DW_tokenrule",ctrl);
    WriteRoleValue(a,EM_RoleValue_Register1,boss);
--    LockHP(a,DW_GetHPpercentVar(a,95),"lua_30wb_trigger");
    LockHP(a,1,"lua_30wb_trigger");
    rune[#rune+1]={guid=a;};
  end
  
  --condition list
  local space={countdown=10;};
  local bubble={countdown=12;};
  local line={countdown=13;};
  local summon={countdown=10;};
  local fighter={};
  local corpse={};
  local bomb={};
  
  --hate list
  local list={};
  local playernum=0;
  local playerand;
  
  local radius=DW_Ran(36);

  local player_guid_for_keyitem = {}
  
  local reset=false;

  DebugMsg(0, 0, "trace ctrl state : Enter Loop")

  while true do
    sleep(10);

    if CheckFlag( boss, 546926 ) == true then
      DebugMsg( 0, 0, "Flag True" );
    else
      DebugMsg( 0, 0, "Flag False" );
    end

  --reset
    list={};
    global_30wb.playerhash={};
    for i=#global_30wb.playerlist,1,-1 do
      global_30wb.playerhash[global_30wb.playerlist[i].guid]=i;
    end
  --keep
    --世界王狀態
    if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
      break;
    end
    local boss_hp=DW_GetHPpercent(boss);
    local send_msg=false;
    for i=20,1,-1 do
      local progress=i*5;
      if(progress>boss_hp)and(CheckID(candle[i].guid)==true)then
        DelObj(candle[i].guid);
        send_msg=true;
      elseif(progress<=boss_hp)and(CheckID(candle[i].guid)==false)then
        local x,y,z,dir=DW_Location(781368,2);
        x,y,z,dir=DW_NewLocation(20*i,115,x,y,z,0);
        local a=CreateObj(108405,x,y,z,dir,1);
        SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
        SetModeEx(a,EM_SetModeType_HideName,true);
        DW_UnFight(a,true);
        AddToPartition(a,room);
        CallPlot(a,"DW_tokenrule",ctrl);
        
        candle[i]={guid=a;};
      end
    end
    --玩家清單
    local tank_pos,tank_hate;
    player_guid_for_keyitem = {}
    for pos=0,HateListCount(boss)-1,1 do
      local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);

      table.insert(player_guid_for_keyitem, id)

      local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
      local player=false;
      if(CheckBuff(id,625063)==true)then
        player=true;
      elseif(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
        --沒有Buff的玩家
        player=true;
        AddBuff(id,625063,0,-1);
        CallPlot(id,"lua_30wb_track",boss);
      end
      
      if(player==true)then
        local inlist=false;
        if(global_30wb.playerhash[id]~=nil)then
          --已在列表上
          inlist=true;
        end
        if(inlist==false)then
          --新加入的玩家
          global_30wb.playerlist[#global_30wb.playerlist+1]={guid=id;};
        end
        if(send_msg==true)then
          Tell(id,kid,"[SC_30WB_PROGRESS]");--做得好！繼續誘使他使用底下的能量吧！
        end
      end
      table.insert(list,id);
    end
    DebugMsg(0, 0, '#player_guid_for_keyitem = ' .. #player_guid_for_keyitem)
    for i=#global_30wb.playerlist,1,-1 do
      if(CheckID(global_30wb.playerlist[i].guid)==false)or(ReadRoleValue(global_30wb.playerlist[i].guid,EM_RoleValue_IsDead)==1)then
        global_30wb.playerhash[global_30wb.playerlist[i].guid]=nil;
        table.remove(global_30wb.playerlist,i);
      else
        if(GetDistance(global_30wb.playerlist[i].guid,boss)>300)or(CheckRelation(boss,global_30wb.playerlist[i].guid,EM_CheckRelationType_Attackable)==false)then
          CancelBuff_NoEvent(global_30wb.playerlist[i].guid,625063);
          global_30wb.playerhash[global_30wb.playerlist[i].guid]=nil;
          table.remove(global_30wb.playerlist,i);
        end
      end
    end
    if(#global_30wb.playerlist==0)then
      reset=true;
      break;
    end
    if(playernum~=#global_30wb.playerlist)then
      playerand=DW_Ran(#global_30wb.playerlist);
    end

    --世界王掉落設定
    -- 2015.05.05 新增 Boss 參數，修正以中控器執行此函式時，擊殺Boss後，無法取得傳奇之證的問題。(阿浩)
    Lua_DW_WBLvCheck_Table( list, boss );--檢查仇恨表內的玩家等級程度，並設立旗標以供掉落表判斷

    --時間變數
    increase=increase+1;
    if(gcd>0)then
      gcd=gcd+1;
    end
    for cd_type,sec in pairs(countdown)do
      if(sec>0)then
        countdown[cd_type]=sec-1;
      end
    end
    --壓潰符文
    for i=#rune,1,-1 do
      if(CheckID(rune[i].guid)==false)then
        table.remove(rune,i);
      end
    end
    if(#rune==0)then
      --所有符文都被啟動
      for i=1,5,1 do
        local x,y,z,dir=DW_Location(boss);
        x,y,z,dir=DW_NewLocation(rune_basic*rune_angle(),30*rune_dis(),x,y,z,dir);
        local a=CreateObj(108403,x,y,z,90,1);
        SetModeEx(a,EM_SetModeType_Move,false);
        SetModeEx(a,EM_SetModeType_HideName,true);
        SetModeEx(a,EM_SetModeType_Searchenemy,false);
        AddToPartition(a,room);
        AddBuff(a,507899,0,-1);--不可攻擊
        --AddBuff(a,508481,0,-1);--AE無效化  K.J. Aris
        CallPlot(a,"DW_tokenrule",ctrl);
        WriteRoleValue(a,EM_RoleValue_Register1,boss);
--        LockHP(a,DW_GetHPpercentVar(a,95),"lua_30wb_trigger");
        LockHP(a,1,"lua_30wb_trigger");
        rune[#rune+1]={guid=a;};
      end
    end
    --鏡花水月
    for i=#bubble,1,-1 do
      if(ReadRoleValue(bubble[i].guid,EM_RoleValue_Y)>=-1660)then
        --至視野高度
        StopMove(bubble[i].guid,false);
        local x,y,z,dir=DW_Location(bubble[i].guid);
        local a=CreateObj(108397,x,GetHeight(x,y,z),z,dir,1);
        SetModeEx(a,EM_SetModeType_Mark,false);
        SetModeEx(a,EM_SetModeType_Move,false);
        SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
        SetModeEx(a,EM_SetModeType_HideName,true);
        DW_UnFight(a,true)
        WriteRoleValue(a,EM_RoleValue_LiveTime,4);
        AddToPartition(a,room);
        
        CastSpellPos(a,x,GetHeight(x,y,z),z,851330,0);
        DelObj(bubble[i].guid);
        table.remove(bubble,i);
      end
    end
    --黯然傷痕
    for i=#line,1,-1 do
      if(ReadRoleValue(line[i].guid,EM_RoleValue_Y)>=-1660)then
        --至視野高度
        --DebugMsg(0,room,"黯然傷痕");
        StopMove(line[i].guid,false);
        local x,y,z,dir=DW_Location(boss);
        x,y,z,dir=DW_NewLocation(line[i].line_dir,115,x,y,z,0);
        local a=CreateObj(108397,x,y,z,dir,1);
        SetModeEx(a,EM_SetModeType_Mark,false);
        SetModeEx(a,EM_SetModeType_Move,false);
        SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
        SetModeEx(a,EM_SetModeType_HideName,true);
        SetModeEx(a,EM_SetModeType_Gravity,false);
        SetModeEx(a,EM_SetModeType_Strikback,false);
        WriteRoleValue(a,EM_RoleValue_LiveTime,3);
        AddToPartition(a,room);
        
        StopMove(line[i].twist,false);
        x,y,z,dir=DW_Location(boss);
        x,y,z,dir=DW_NewLocation(line[i].line_dir-180,115,x,y,z,0);
        local b=CreateObj(108397,x,y,z,dir,1);
        SetModeEx(b,EM_SetModeType_Mark,false);
        SetModeEx(b,EM_SetModeType_Move,false);
        SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
        SetModeEx(b,EM_SetModeType_HideName,true);
        SetModeEx(b,EM_SetModeType_Gravity,false);
        SetModeEx(b,EM_SetModeType_Strikback,false);
        WriteRoleValue(b,EM_RoleValue_LiveTime,3);
        AddToPartition(b,room);
        
        CastSpellLv(a,b,851331,0);
        
        DelObj(line[i].guid);
        DelObj(line[i].twist);
        table.remove(line,i);
      end
    end
    --召喚
    for i=#summon,1,-1 do
      if(ReadRoleValue(summon[i].guid,EM_RoleValue_Y)>=-1660)then
        --至視野高度
        StopMove(summon[i].guid,false);
        if(DW_Rand(100)>50)then
          local x,y,z,dir=DW_Location(781368,1);
          
          local a=CreateObj(108401,x,-1645,z,dir,1);
          MoveToFlagEnabled(a,false);
          SetModeEx(a,EM_SetModeType_Searchenemy,false);
          SetModeEx(a,EM_SetModeType_Strikback,false);
          SetFlag(a,544801,1);
          AddToPartition(a,room);
          AddBuff(a,502707,0,-1);
          CallPlot(a,"DW_tokenrule",ctrl);
          LockHP(a,1,"");
          bomb[#bomb+1]={guid=a;countdown=25;target=global_30wb.playerlist[playerand()].guid;};       
          SetFollow(bomb[i].guid,bomb[i].target);
        else          
          --------------------------------
          
          local x,y,z,dir=DW_Location(781368,1);
          local b=CreateObj(108398,x,-1645,z,dir,1);
          MoveToFlagEnabled(b,false);
          SetFlag(b,544801,1);
          AddToPartition(b,room);
          CallPlot(b,"DW_tokenrule",ctrl);
          SetAttack(b,summon[i].target);
          fighter[#fighter+1]={guid=b;target=summon[i].target};
        end
        
        DelObj(summon[i].guid);
        table.remove(summon,i);       
      end
    end       
    --死亡使者
    for i=#fighter,1,-1 do
      if(CheckID(fighter[i].guid)==false)or(ReadRoleValue(fighter[i].guid,EM_RoleValue_IsDead)==1)then
        --死亡的瞬間
        local x,y,z,dir=DW_Location(fighter[i].guid);--有點冒險
        local a=CreateObj(108399,x,y,z,dir,1);
        SetModeEx(a,EM_SetModeType_Mark,false);
        SetModeEx(a,EM_SetModeType_Move,false);
        SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
        DW_UnFight(a,true);
        AddToPartition(a,room);
        CallPlot(a,"DW_tokenrule",ctrl);
        
        corpse[#corpse+1]={guid=a;countdown=15;};
        DelObj(fighter[i].guid);
        table.remove(fighter,i);
      elseif(HateListCount(fighter[i].guid)>0)then
        --閒置中
        local a=global_30wb.playerlist[playerand()].guid;
        SetAttack(fighter[i].guid,a);
        fighter[i].target=a;
      end
    end
    --死亡使者 的屍體
    for i=#corpse,1,-1 do
      if(corpse[i].countdown==0)then
        DelObj(corpse[i].guid);
        table.remove(corpse,i);
      else
        corpse[i].countdown=corpse[i].countdown-1;
        for j=1,#global_30wb.playerlist,1 do
          if(GetDistance(corpse[i].guid,global_30wb.playerlist[j].guid)<=20)then
            DebugMsg(0,room,"有人踩屍體 賽西蒙德回血")
            DW_AddHPpercent(boss,5);
          end
        end
      end
    end
    --獵命之影
    local x,y,z,dir=DW_Location(781368,2);
    for i=#bomb,1,-1 do
      bomb[i].countdown=bomb[i].countdown-1;
      local active=false;
      local scale;
      if(ReadRoleValue(bomb[i].guid,EM_RoleValue_HP)==1)or(bomb[i].countdown==0)then
        active=true;
        scale="small";
      else
        if(global_30wb.playerhash[bomb[i].target]==nil)then
          bomb[i].target=global_30wb.playerlist[playerand()].guid;
          SetFollow(bomb[i].guid,bomb[i].target);
        end
        for j=#global_30wb.playerlist,1,-1 do
          if(GetDistance(global_30wb.playerlist[j].guid,bomb[i].guid)<30)then
            active=true;
            scale="big";
            break;
          end
        end
      end
      if(active==true)then
        --獵命之影 爆炸
        DebugMsg(0,room,"獵命之影 爆炸");
        StopMove(bomb[i].guid,false);
        if(scale=="small")then
          CastSpell(bomb[i].guid,bomb[i].guid,851332);
        else
          CastSpell(bomb[i].guid,bomb[i].guid,851336);
        end
        SetDefIdleMotion(bomb[i].guid,ruFUSION_MIME_CAST_LOOP);
        PlayMotionEX(bomb[i].guid,ruFUSION_ACTORSTATE_CAST_BEGIN,ruFUSION_ACTORSTATE_CAST_LOOP);
        SetModeEx(bomb[i].guid,EM_SetModeType_Move,false);
        WriteRoleValue(bomb[i].guid,EM_RoleValue_LiveTime,2);
        
        table.remove(bomb,i);
      end
    end 
  --condition
    
    for solely=1,1,1 do
      --血佈蒼穹
      if(countdown.space==0)then
        countdown.space=rawget(space,"countdown");
        for i=#global_30wb.playerlist,1,-1 do
          local dis=math.floor(GetDistance(boss,global_30wb.playerlist[i].guid));
          if(dis>90)then
            Tell(global_30wb.playerlist[i].guid , kid , "[SC_30WB_CLOSEWALL]");--你太靠近牆面了！小心他充滿整個空間的魔法！
          end
          SysCastSpellLv(boss,global_30wb.playerlist[i].guid,851333,dis);
        end
      end
      --鏡花水月
      if(countdown.bubble==0)then
        countdown.bubble=rawget(bubble,"countdown");
        for j=1,3,1 do
          local x,y,z,dir=DW_Location(boss);
          x,y,z,dir=DW_NewLocation(radius()*10,DW_Rand(80),x,y,z,0);
          local b=CreateObj(108396,x,y-50,z,dir,1);
          SetModeEx(b,EM_SetModeType_Gravity,false);
          SetModeEx(b,EM_SetModeType_Mark,false);
          SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
          DW_UnFight(b,true);
          MoveToFlagEnabled(b,false);
          AddToPartition(b,room);
          CallPlot(b,"DW_tokenrule",ctrl);
          MoveDirect(b,x,y+50,z);
          bubble[#bubble+1]={guid=b;};
        end
      end
      --黯然傷痕
      if(countdown.line==0)then
        countdown.line=rawget(line,"countdown");
        for i=1,2,1 do--一次叫幾條線出來
          local line_dir=DW_Rand(360)
          
          local x,y,z,dir=DW_Location(boss);
          x,y,z,dir=DW_NewLocation(line_dir,115,x,y,z,0);
          local a=CreateObj(108395,x,y-80,z,dir,1);
          SetModeEx(a,EM_SetModeType_Gravity,false);
          SetModeEx(a,EM_SetModeType_Mark,false);
          SetModeEx(a,EM_SetModeType_Drag,false);
          SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
          DW_UnFight(a,true);
          MoveToFlagEnabled(a,false);
          AddToPartition(a,room);
          CallPlot(a,"DW_tokenrule",ctrl);
          MoveDirect(a,x+1,y+50,z+1);
          
          x,y,z,dir=DW_Location(boss);
          x,y,z,dir=DW_NewLocation(line_dir-180,115,x,y,z,0);
          local b=CreateObj(108395,x,y-80,z,dir,1);
          SetModeEx(b,EM_SetModeType_Gravity,false);
          SetModeEx(b,EM_SetModeType_Mark,false);
          SetModeEx(b,EM_SetModeType_Drag,false);
          SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
          DW_UnFight(b,true);
          MoveToFlagEnabled(b,false);
          AddToPartition(b,room);
          CallPlot(b,"DW_tokenrule",ctrl);
          MoveDirect(b,x+1,y+50,z+1);       
          
          line[#line+1]={guid=a;twist=b;line_dir=line_dir;};
        end
      end
      --召喚
      if(countdown.summon==0)then
        countdown.summon=rawget(summon,"countdown");
        local x,y,z,dir=DW_Location(781368,1);
        local b=CreateObj(108395,x,y-110,z,dir,1);
        SetModeEx(b,EM_SetModeType_Gravity,false);
        SetModeEx(b,EM_SetModeType_Mark,false);
        SetModeEx(b,EM_SetModeType_Drag,false);
        SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
        DW_UnFight(b,true);
        MoveToFlagEnabled(b,false);
        AddToPartition(b,room);
        CallPlot(b,"DW_tokenrule",ctrl);
        MoveDirect(b,x+1,y,z+1);
        
        summon[#summon+1]={guid=b;target=global_30wb.playerlist[playerand()].guid;};
      end
      --
      if(gcd~=0)then
        break;
      end
    end

    DebugMsg(0, 0, "trace ctrl state : Loop ...")
  end
  
  
  for i=#rune,1,-1 do
    DelObj(rune[i].guid);
  end
  for i=#bubble,1,-1 do
    DelObj(bubble[i].guid);
  end
  for i=#line,1,-1 do
    DelObj(line[i].guid);
    DelObj(line[i].twist);
  end
  for i=#summon,1,-1 do
    DelObj(summon[i].guid);
  end
  for i=#fighter,1,-1 do
    DelObj(fighter[i].guid);
  end
  for i=#corpse,1,-1 do
    DelObj(corpse[i].guid);
  end
  for i=#bomb,1,-1 do
    DelObj(bomb[i].guid);
  end
  for i=#candle,1,-1 do
    DelObj(candle[i].guid);
  end
  DelObj(kid);

  DebugMsg(0, 0, "trace ctrl state : reset =>" .. tostring(reset))  

  
  if reset then
    DW_UnFight(boss,true);
    sleep(30);
    DW_UnFight(boss,false);
    BeginPlot(boss,"lua_30wb_szLuaInitScript",0);
    Yell(boss,"[SC_30WB_FAIL]",2);--不自量力！這點力量也想阻擾我？
  else

    DebugMsg(0, 0, '#player_guid_for_keyitem = '..#player_guid_for_keyitem)
    for index, guid in ipairs(player_guid_for_keyitem) do
      if CheckAcceptQuest(guid, 424757) or CheckAcceptQuest(guid, 426199) or CheckAcceptQuest(guid, 427088) then
        SetFlag(guid, 548802, 1)
      end
    end

    ScriptMessage(ctrl,0,2,"[SC_30WB_END]",0);--賽西蒙德的儀式被干擾，重新陷於基德所佈置的循環之中......
    --要出寶箱
    local x,y,z,dir = DW_Location( ctrl );--長在中控器上108403
--    local _TreasureBox = CreateObj(108403,x,y,z,dir,1);--掉寶怪  109240
    local _TreasureBox = CreateObj(109240,x,y,z,dir,1);--掉寶怪 
    DW_UnFight( _TreasureBox , true );--special order
    SetModeEx( _TreasureBox , EM_SetModeType_ShowRoleHead , false );
    SetModeEx( _TreasureBox , EM_SetModeType_HideName , true );
    
    AddToPartition( _TreasureBox , room );--
    DebugMsg( 0 , 0 , "Engage TreasureBox" );
    
    AddBuff( _TreasureBox , 508481 , 0 , -1 );--AE無效化 K.J. Aris
    SetPlot( _TreasureBox , "touch" , "lua_30wb_PlayerGetTreasure" , 40 );
    SetCursorType( _TreasureBox , eCursor_Enhance );    
    
    Lua_DW_WBGUIDSwitch( 1 , _TreasureBox );--見Step3

  end

  DebugMsg(0, 0, "trace ctrl state : DelObj(ctrl)")
  
  DelObj(ctrl);
end
--消除專屬buff的機制
function lua_30wb_track(boss)
  local player=OwnerID();
  local limit=GameObjInfo_Int(108400,"FollowRange");
  while true do
    sleep(30);
    if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
      CancelBuff_NoEvent(player,625063);
      return;
    elseif(GetDistance(player,boss)>limit)then
      CancelBuff_NoEvent(player,625063);
      return;
    elseif(CheckBuff(player,625063)==false)then
      return;
    end
  end
end
--符文被打爆的觸動
function lua_30wb_trigger()
  local rune=OwnerID();
  LockHP(rune,-100,"");
  local boss=ReadRoleValue(rune,EM_RoleValue_Register1);
  local a={};
  for pos=0,HateListCount(rune)-1,1 do
    table.insert(a,HateListInfo(rune,pos,EM_HateListInfoType_GItemID));
  end
  local dmg=math.floor((DW_GetHPpercentVar(boss,5)/#a)/10000);
  if(dmg<1)then
    dmg=1;
  end
  for i=1,#a,1 do
    SysCastSpellLv(a[i],boss,851335,dmg-1);
  end
  SysCastSpellLv(rune,boss,850799,0);
  WriteRoleValue(rune,EM_RoleValue_LiveTime,1);
end
--buff晉級
function lua_30wb_MRPlotName()
  local player=TargetID();
  if(CheckBuff(player,625067)==true)then
    return true;
  end
  if(CheckBuff(player,625057)==true)then
    CancelBuff_NoEvent(player,625057);
  elseif(CheckBuff(player,625056)==true)then
    CancelBuff_NoEvent(player,625056);
    AddBuff(player,625057,0,-1);
  elseif(CheckBuff(player,625055)==true)then
    CancelBuff_NoEvent(player,625055);
    AddBuff(player,625056,0,-1);
  elseif(CheckBuff(player,625054)==true)then
    CancelBuff_NoEvent(player,625054);
    AddBuff(player,625055,0,-1);
  elseif(ReadRoleValue(player,EM_RoleValue_IsDead)==0)then
    AddBuff(player,625054,0,-1);
  end
  return true;
end



function lua_30wb_PlayerGetTreasure()
  local _PlayerID = OwnerID(); --拿寶箱的人  Caution : 觸碰劇情執行的涵式中，觸碰者ID為OwnerID，掛觸碰劇情者為TargetID。 
  local _TreasureBoxID = TargetID();
  
  SetPlot( _TreasureBoxID , "touch" , "" , 0 );--當有人典寶箱時  則  關閉觸碰劇情

  local _OntheList = false;--
  for i = 1 , #global_30wb.playerlist , 1 do --檢查是否曾經戰鬥
    if( _PlayerID == global_30wb.playerlist[ i ].guid ) then
      _OntheList = true;
      break;
    end
  end

  if ( _OntheList == true ) then 
    KillID( _PlayerID , _TreasureBoxID );--叫開寶箱的人  殺死寶箱 --  掉落設定在NPC身上
    DebugMsg( 0 , 0 , "TreasureBox Opened !!" );
  else
    DebugMsg( 0 , 0 , "TreasureBox unavailable" );
    SetPlot( _TreasureBoxID , "touch" , "lua_30wb_PlayerGetTreasure" , 40 );--重設觸碰劇情
    return;--不在名單上  不開寶箱
  end
  
end

function lua_30wb_test()
  local owner = OwnerID()
  
  DebugMsg( 0 , 0 , "GiveBodyItem(guid, 548802, 1) = " .. tostring(GiveBodyItem(owner, 548802, 1)))

  local x,y,z,dir = DW_Location( owner );--長在中控器上108403
  local _TreasureBox = CreateObj(109240,x,y,z,dir,1);--掉寶怪 
  DW_UnFight( _TreasureBox , true );--special order
  SetModeEx( _TreasureBox , EM_SetModeType_ShowRoleHead , false );
  SetModeEx( _TreasureBox , EM_SetModeType_HideName , true );
  
  AddToPartition( _TreasureBox , 0 );--
  DebugMsg( 0 , 0 , "Engage TreasureBox" );
  
  AddBuff( _TreasureBox , 508481 , 0 , -1 );--AE無效化 K.J. Aris
  SetPlot( _TreasureBox , "touch" , "lua_30wb_PlayerGetTreasure" , 40 );
  SetCursorType( _TreasureBox , eCursor_Enhance );    
  
  --Lua_DW_WBGUIDSwitch( 1 , _TreasureBox );--見Step3
end