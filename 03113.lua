--�X��      781379
--������   108329
--��     108510

--��Ԩ���    108434
--�J���~�еK���y�b�� 108435
--�J���~�гg���F��  108436
--�J���~�Ъh�A�h��  108437
--�p���]��    103937
--��Ԩ���(�O����) 104492

--Flag
--0:�@ Boss
--1:  dog
--2:  bird
--3:  bug

local Z30_bico_Boss2_Door_Click = {}
local Z30_bico_boss2_Fight_Click = {}
local Z30_bico_boss2_NPC_Table = {}
local Z30_bico_boss2_NPC_Dead = {}
local Z30_bico_boss2_BirdDead = {}
local Z30_bico_Boss2_Hate_table = {}
local Z30_bico_Boss2_BirdTable = {}

local _boolena = {};
local _bird_created = {}

function lua_bico_Z30_Boss2_ctrl()
  local Ctrl = OwnerID()
  local BossNPC = { 108434, 103402, 103412 }  --10%����
  local Boss_10HP = false
  local Mob_Bird = { 108435, 103403, 103413 } --�K���y�b��
  local Mob_Bug = { 108436, 103404, 103414 }  --�g���F��
  local Mob_Dog = { 108437, 103405, 103415 }  --�h�A�h��
  local BossShowNPC = { 104492, 103401, 103411 }
  local ViolentTime = {480,360} --�g�ɮɶ�
  local ViolentTiming = 0   --�g�ɭp�ɾ�
  local ZoneID = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID )
  local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
  local zone
    if ZoneID == 166 then   --hard
      zone =1
    elseif ZoneID == 167 then --normal
      zone = 2
    elseif ZoneID == 168 then --easy
      zone = 3
    elseif ZoneID == 938 or
           ZoneID == 955 then --���հ�
      zone =1 
    end
  local Time
    if ZoneID == 166 then   --hard  8�����g��
      Time =1
    elseif ZoneID == 167 then --normal   6�����g��
      Time = 2
    elseif ZoneID == 938 or
           ZoneID == 955 then --���հ�
      Time =1
    end 
--  local Door_Front
--  local Door_Front_Click = 0  --�e���}��, �}=0, ��=1
  local P4_Click = 0
  Z30_bico_Boss2_Door_Click[RoomID] = 0
  Z30_bico_boss2_Fight_Click[RoomID] = 0      --�԰��}��, �D�԰�=0, �԰�=1
  
--------��l���A  
  local x,y,z,dir = DW_Location( 781379, 0 )      --����boss(�O�����t��)
  local BossShow = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 )
  SetModeEx( BossShow, EM_SetModeType_Move, false)  --����(���i)
--  SetModeEx( BossShow, EM_SetModeType_Fight, false) --���(���i)
  SetModeEx( BossShow, EM_SetModeType_Searchenemy, True)  --����(���i)
  AddToPartition( BossShow, RoomID )
  Cl_Resist_HackersBossNum( BossShow );
  SetPlot( BossShow ,"range","Lua_Z30_Boss_Start" , 300 );
  AddBuff( BossShow, 507899, 0, -1 )      --���i����
  
  local x,y,z,dir = DW_Location( 781379, 1 )      --���� �h�A�h��
  local Dog = CreateObj( Mob_Dog[zone], x, y, z, dir, 1 )
  SetModeEx( Dog, EM_SetModeType_Move, false)   --����(���i)
  SetModeEx( Dog, EM_SetModeType_Fight, false)    --���(���i)
  SetModeEx( Dog, EM_SetModeType_Searchenemy, false)  --����(���i)
  AddToPartition( Dog, RoomID )
  AddBuff( Dog, 500467, 0, -1 )
  AddBuff( Dog, 500476, 0, -1 ) --�����аOfor�]���ɦ�
  
  local x,y,z,dir = DW_Location( 781379, 2 )      --���� �K���y�b��
  local Bird = CreateObj( Mob_Bird[zone], x, y, z, dir, 1 )
  SetModeEx( Bird, EM_SetModeType_Move, false)    --����(���i)
  SetModeEx( Bird, EM_SetModeType_Fight, false)   --���(���i)
  SetModeEx( Bird, EM_SetModeType_Searchenemy, false) --����(���i)
  AddToPartition( Bird, RoomID )
  AddBuff( Bird, 500467, 0, -1 )
  
  local x,y,z,dir = DW_Location( 781379, 3 )      --���� �g���F��
  local Bug = CreateObj( Mob_Bug[zone], x, y, z, dir, 1 )
  SetModeEx( Bug, EM_SetModeType_Move, false)   --����(���i)
  SetModeEx( Bug, EM_SetModeType_Fight, false)    --���(���i)
  SetModeEx( Bug, EM_SetModeType_Searchenemy, false)  --����(���i)
  AddToPartition( Bug, RoomID )
  AddBuff( Bug, 500467, 0, -1 )
  AddBuff( Bug, 500477, 0, -1 ) --�Τl���аO
  
  Z30_bico_boss2_NPC_Table[RoomID] = { BossShow, Dog, Bird, Bug, OwnerID() }
  Z30_bico_boss2_NPC_Dead[RoomID] = { 0, 0, 0 } --��, ��, ��
  Z30_bico_Boss2_BirdTable[RoomID] = {}
  Z30_bico_Boss2_Hate_table[RoomID] = {}

  _boolena[ RoomID ] = false;
  _bird_created[ RoomID ] = false


--------AI�`����
  while true do 
    sleep(10)

    -- DebugMsg(0, 0, 'if Z30_bico_boss2_Fight_Click[RoomID] == 1 then')
    if Z30_bico_boss2_Fight_Click[RoomID] == 1 then
    -- �w�}��

      ----------------�g�ɾ���
      ViolentTiming = ViolentTiming + 1
      DebugMsg(0, 0, 'ViolentTiming = '..ViolentTiming)
      --DebugMsg(0, 0, 'ViolentTiming = '..ViolentTiming)
      -- DebugMsg(0, 0, 'if ViolentTiming == ViolentTime[Time] then')
      if ViolentTiming == ViolentTime[Time] then
        -- DebugMsg(0, 0, 'ViolentTiming == ViolentTime[Time]')
        -- if Z30_bico_boss2_Fight_Click[RoomID] == 1 then
        ScriptMessage( Z30_bico_boss2_NPC_Table[RoomID][1], -1, 2, "[SC_108434_02]", 0 )  --�g�ɦr��
        AddBuff( Dog, 625217, 0, -1 ) --��
        AddBuff( Bug, 625217, 0, -1 ) --��
        for i=1, #Z30_bico_Boss2_BirdTable[RoomID], 1 do  --��
          AddBuff( Z30_bico_Boss2_BirdTable[RoomID][i], 625217, 0, -1 )
        end
        if Boss_10HP then
          AddBuff( Boss_10HP, 625217, 0, -1 )
        end
        -- end
      end

      -- DebugMsg(0, 0, 'if Z30_bico_boss2_NPC_Dead[RoomID][1] + Z30_bico_boss2_NPC_Dead[RoomID][2] + Z30_bico_boss2_NPC_Dead[RoomID][3] == 3')
      if Z30_bico_boss2_NPC_Dead[RoomID][1] + 
         Z30_bico_boss2_NPC_Dead[RoomID][2] + 
         Z30_bico_boss2_NPC_Dead[RoomID][3] == 3 and
         P4_Click ==0 then
        DebugMsg(0, 0, '3 boss dead')

        local x, y, z, dir = DW_Location( Z30_bico_boss2_NPC_Table[RoomID][1] )
        Boss_10HP = CreateObj( BossNPC[zone], x, y, z, dir, 1 )
        local HP_Max = ReadRoleValue( Boss_10HP, EM_RoleValue_MaxHP )
        local TenHP = HP_Max/10
        WriteRoleValue( Boss_10HP, EM_RoleValue_HP, TenHP )
        AddToPartition( Boss_10HP, RoomID )
        SetPlot( Boss_10HP, "dead", "Z30_bico_Boss2_Dead", 10 )
        AddBuff( Boss_10HP, 502707, 0, -1 )
        P4_Click = 1

      end

      ----------------����
      --DebugMsg(0, 0, 'HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) = '..HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ))
      -- DebugMsg(0, 0, 'if HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) == 0 then')
      if HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) == 0 then
        --DebugMsg(0, 0, 'Z30_bico_boss2_Fight_Click[RoomID] = '..Z30_bico_boss2_Fight_Click[RoomID])
        -- if Z30_bico_boss2_Fight_Click[RoomID] == 1 then
        ScriptMessage( Z30_bico_boss2_NPC_Table[RoomID][1], -1, 2, "[SC_108434_03]", 0 )  --���Φr��
        ViolentTiming = 0
        --say( OwnerID(), "reset" )
        for i = 1, #Z30_bico_boss2_NPC_Table[RoomID]-1, 1 do  --���R��������
          DelObj( Z30_bico_boss2_NPC_Table[RoomID][i] )
        end
        if #Z30_bico_Boss2_BirdTable[RoomID] ~= 0 then    --�M��������
          for i = 1, #Z30_bico_Boss2_BirdTable[RoomID], 1 do
            DelObj( Z30_bico_Boss2_BirdTable[RoomID][i] )
          end
        end
        Z30_bico_boss2_NPC_Table[RoomID] = {}     
        Lua_DavisDelObj( 103937 )   --���W���]���M��
        Lua_DavisDelObj( BossNPC[zone] )  --���W��Boss10HP�M��
        Z30_bico_boss2_Fight_Click[RoomID] = 0
        Z30_bico_Boss2_Door_Click[RoomID] = 0
        ----------------------------------------��l���A
        local x,y,z,dir = DW_Location( 781379, 0 )      --����boss(�O�����t��)
        local BossShow = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 )

        -- ��s���b�ȧP�w��H
        Cl_Resist_HackersBossNum( BossShow );

        SetModeEx( BossShow, EM_SetModeType_Move, false)  --����(���i)
        SetModeEx( BossShow, EM_SetModeType_Searchenemy, True)  --����(���i)
        SetPlot( BossShow ,"range","Lua_Z30_Boss_Start" , 300 );
        AddToPartition( BossShow, RoomID )
        AddBuff( BossShow, 507899, 0, -1 )      --���i����
        
        local x,y,z,dir = DW_Location( 781379, 1 )      --���� �h�A�h��
        local Dog = CreateObj( Mob_Dog[zone], x, y, z, dir, 1 )
        SetModeEx( Dog, EM_SetModeType_Move, false)   --����(���i)
        SetModeEx( Dog, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( Dog, EM_SetModeType_Searchenemy, false)  --����(���i)
        AddToPartition( Dog, RoomID )
        WriteRoleValue( Dog ,  EM_RoleValue_Register + 5 , 0 );
        AddBuff( Dog, 500467, 0, -1 )
        AddBuff( Dog, 500476, 0, -1 ) --�����аOfor�]���ɦ�
        
        local x,y,z,dir = DW_Location( 781379, 2 )      --���� �K���y�b��
        local Bird = CreateObj( Mob_Bird[zone], x, y, z, dir, 1 )
        SetModeEx( Bird, EM_SetModeType_Move, false)    --����(���i)
        SetModeEx( Bird, EM_SetModeType_Fight, false)   --���(���i)
        SetModeEx( Bird, EM_SetModeType_Searchenemy, false) --����(���i)
        AddToPartition( Bird, RoomID )
        WriteRoleValue( Bird ,  EM_RoleValue_Register + 5 , 0 );
        AddBuff( Bird, 500467, 0, -1 )
        
        local x,y,z,dir = DW_Location( 781379, 3 )      --���� �g���F��
        local Bug = CreateObj( Mob_Bug[zone], x, y, z, dir, 1 )
        SetModeEx( Bug, EM_SetModeType_Move, false)   --����(���i)
        SetModeEx( Bug, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( Bug, EM_SetModeType_Searchenemy, false)  --����(���i)
        AddToPartition( Bug, RoomID )
        WriteRoleValue( Bug ,  EM_RoleValue_Register + 5 , 0 );
        AddBuff( Bug, 500467, 0, -1 )
        AddBuff( Bug, 500477, 0, -1 ) --�Τl���аO
        
        Z30_bico_boss2_NPC_Table[RoomID] = { BossShow, Dog, Bird, Bug, OwnerID() }
        -- end
        Z30_bico_Boss2_BirdTable[RoomID] = {}
        Z30_bico_Boss2_Hate_table[RoomID] = {}
        Z30_bico_boss2_NPC_Dead[RoomID] = { 0, 0, 0 }
        Z30_bico_boss2_BirdDead[RoomID] = { 0, 0, 0 }
        P4_Click = 0
        Z30_bico_Boss2_Door_Click[RoomID] = 0
      end

    else
    -- ���}��

      ----------------�}���ˬd
      -- if Z30_bico_boss2_NPC_Table[RoomID] ~= nil then --not CheckBuff( TargetID() , 508071 )

      -- if not CheckBuff( Z30_bico_boss2_NPC_Table[RoomID][1] , 508071 ) and
      --    HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) ~= 0 then --����boss�i�J�԰�����  
      -- DebugMsg(0, 0, 'if HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) ~= 0 then')
      if HateListCount( Z30_bico_boss2_NPC_Table[RoomID][1] ) ~= 0 then

        -- if Z30_bico_boss2_Fight_Click[RoomID] == 0 then
          --DebugMsg(0,0,"_boss="..Z30_bico_boss2_NPC_Table[RoomID][1] )
        SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][1], EM_SetModeType_Show, false )    --���ä���boss
        SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][1], EM_SetModeType_Fight, false)    --���ä���boss���(���i)
        local x, y, z, dir = DW_Location( Z30_bico_boss2_NPC_Table[RoomID][1] )
        local BossShowDog = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 ) --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
        SetModeEx( BossShowDog, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( BossShowDog, EM_SetModeType_Searchenemy, false)  --����(���i)

        AddToPartition( BossShowDog, RoomID )
        ScriptMessage( BossShowDog, -1, 2 , "[SC_108434_01]", 0 ) --�}�Ԧr��    
        CallPlot( BossShowDog, "bico_Z30_Boss2_BeginCheck", 10 )        
   
        Z30_bico_boss2_Fight_Click[RoomID] = 1
        Z30_bico_Boss2_Door_Click[RoomID] = 1 --�����}������
        -- end 

      end


    end


    -- end
  end 

end
  ------------------------���`
function Z30_bico_Boss2_Dead()
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  --DebugMsg(0,0,"All DEAD")
    ScriptMessage( Z30_bico_boss2_NPC_Table[RoomID][1], -1, 2 , "[SC_108434_04]", 0 ) --���`�r��
--            DelObj( Door_Back ) --�R�����
--            DelObj( Door_Front )  --�R���e��
    --DebugMsg(0,0,"_boss="..Z30_bico_boss2_NPC_Table[RoomID][1] )
    Cl_Resist_HackersBossDead( Z30_bico_boss2_NPC_Table[RoomID][1] );
    DelObj( Z30_bico_boss2_NPC_Table[RoomID][1] )           
--            KillID( Z30_bico_boss2_NPC_Table[RoomID][1] , Z30_bico_boss2_NPC_Table[RoomID][1] );
    Lua_DavisDelObj( 103937 )   --���W���]���M��
    DelObj( Z30_bico_boss2_NPC_Table[RoomID][5] )
    Z30_bico_Boss2_BirdTable[RoomID] = nil
    Z30_bico_Boss2_Hate_table[RoomID] = nil
    Z30_bico_boss2_Fight_Click[RoomID] = nil
    Z30_bico_boss2_NPC_Dead[RoomID] = nil
    Z30_bico_boss2_NPC_Table[RoomID] = nil
    Z30_bico_boss2_BirdDead[RoomID] = nil
    Z30_bico_Boss2_Door_Click[RoomID] = nil
end

function Lua_Z30_Boss_Start()
  -- DebugMsg( 0 , 0 , "--Lua_Z30_Boss_Start--" )
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  Cl_Resist_HackersFightBegin( Z30_bico_boss2_NPC_Table[RoomID][1] );
  if CheckBuff( Z30_bico_boss2_NPC_Table[RoomID][1], 508071 ) then
    local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
    for index, guid in ipairs( Z30_bico_boss2_NPC_Table[RoomID] ) do
      AddBuff( guid , 508071 , 0, -1 )
    end
  end
--  local _boss = TargetID();
--  DebugMsg( 0 , 0 , "_boss=".._boss )
--  if ReadRoleValue( _boss  , EM_RoleValue_Register+1 ) == 0 then
--  if not CheckBuff( TargetID() , 508071 ) then
--    DebugMsg( 0 , 0 , "---------" )
    SetAttack( TargetID() , OwnerID() );
--    WriteRoleValue( _boss  , EM_RoleValue_Register+1 ,  1  );
--    SetPlot( _ctrl ,"range","" , 0 );
--  end
end

function bico_Z30_Boss2_BeginCheck()  --�}��(boss>dog)
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2] ,  EM_RoleValue_Register + 5 , 1 );
  local Dx, Dy, Dz, dir = DW_Location( Z30_bico_boss2_NPC_Table[RoomID][2] )
  local sec = Move( OwnerID(), Dx, Dy, Dz ) 
    sec = sec +10
  local Livetime = (sec+7)/10
  WriteRoleValue( OwnerID(), EM_RoleValue_Livetime, Livetime )
  Move( OwnerID(), Dx, Dy, Dz )
  sleep(sec)
  if ReadRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2] ,  EM_RoleValue_Register + 5 ) == 1 then
    ScriptMessage( OwnerID(), -1, 2, "[SC_108434_05]", 0 )  --�Ұʪ����r��
    CastSpell(Z30_bico_boss2_NPC_Table[RoomID][2], Z30_bico_boss2_NPC_Table[RoomID][2], 499223 )  --�I���t�S��
    CancelBuff( Z30_bico_boss2_NPC_Table[RoomID][2], 500467 )     --������t�S��
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][2], EM_SetModeType_Move,  True )
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][2], EM_SetModeType_Fight,  True )
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][2], EM_SetModeType_Searchenemy,  True )
    CallPlot( Z30_bico_boss2_NPC_Table[RoomID][2], "lua_bico_Z30_Boss2_Dog", 10 )
  end
end

function lua_bico_Z30_Boss2_Dog() --�h�ت�AI
  local Dog = OwnerID()
  local SkillTime = 0
  local ZoneID = ReadRoleValue( Dog, EM_RoleValue_ZoneID )
  local RoomID = ReadRoleValue( Dog, EM_RoleValue_RoomID )
  local MaxHP = ReadRoleValue( Dog, EM_RoleValue_MaxHP )
  local BirdClick = 0
  local step3_click = 0
  local BirdLive = {}
  local BossShowNPC = { 104492, 103401, 103411 }
  local zone
  if ZoneID == 166 then   --hard
    zone =1
  elseif ZoneID == 167 then --normal
    zone = 2
  elseif ZoneID == 168 then --easy
    zone = 3
    elseif ZoneID == 938 or
           ZoneID == 955 then --���հ�
    zone =1 
  end
  LockHP( Dog , 10 , "WY_Z166_B3_STAR" )
  local HP, HP_percent
  local step3 = 0
  while true do
    sleep(10)

    HP = ReadRoleValue( Dog, EM_RoleValue_HP )
    HP_percent = (HP/MaxHP)*100 
    DebugMsg(0, 0, "_boolena[ RoomID ] = "..tostring(_boolena[ RoomID ]))
    DebugMsg(0, 0, "BirdClick = "..tostring(BirdClick))
    if HP_percent <= 40 and step3_click == 0 and BirdClick == 1  and _boolena[ RoomID ] then
      -- DebugMsg( 0 , 0 , "-----------------");
      LockHP( Dog , 0 , "" ); 
      Z30_bico_boss2_NPC_Dead[RoomID][2] = 1;
      local _boss_4 = Z30_bico_boss2_NPC_Table[RoomID][4];
      CastSpell(_boss_4, Z30_bico_boss2_NPC_Table[RoomID][3], 499223 )  --�I���t�S��
      CancelBuff( _boss_4, 500467 )     --������t�S��  
      SetModeEx( _boss_4, EM_SetModeType_Move,  True )
      SetModeEx( _boss_4, EM_SetModeType_Fight,  True )
      SetModeEx( _boss_4, EM_SetModeType_Searchenemy,  True )
      ScriptMessage( _boss_4 , -1, 2, "[SC_108434_07]", 0 ) --�Ұʪ����r��
      CallPlot( _boss_4 , "bico_Z30_Boss2_Bug" , OwnerID() );
      _boolena[ RoomID ] = false;
      -- WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1 )    
      step3 = 1
    end  

    if step3 == 1 then
      -- DebugMsg( 0 , 0 , "check point 1");
      step3_click = 1
      SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][2], EM_SetModeType_Move, false )  --���ʤ��i
      local step_fire = Lua_CreateObjToRandownPos( Z30_bico_boss2_NPC_Table[RoomID][5], 103937, 1, 390, true)
      SetModeEx( step_fire[1] , EM_SetModeType_Mark, false)
      SetModeEx( step_fire[1] , EM_SetModeType_HideName, false)
      SetModeEx( step_fire[1] , EM_SetModeType_ShowRoleHead, false)
      SetModeEx( step_fire[1] , EM_SetModeType_NotShowHPMP, false)
      SetModeEx( step_fire[1] , EM_SetModeType_Obstruct, false)     -----����
      SetModeEx( step_fire[1] , EM_SetModeType_Strikback, false)  ---����
      SetModeEx( step_fire[1] , EM_SetModeType_Move, true)   ---����  
      SetModeEx( step_fire[1] , EM_SetModeType_Fight, false)  ---�i���
      SetModeEx( step_fire[1] , EM_SetModeType_SearchenemyIgnore, false) 
      SetModeEx( step_fire[1] , EM_SetModeType_Searchenemy, false)
      SetModeEx( step_fire[1] , EM_SetModeType_Show, true)
      that( step_fire[1] ).live_time = 6
      CastSpell( OwnerID(), step_fire[1], 499229 )      --��z������Q�o���K  
    else

      if _bird_created[ RoomID ] then
        _boolena[ RoomID ] = true
        for index, guid in ipairs( Z30_bico_Boss2_BirdTable[RoomID] ) do
          local bird = that( guid )
          if not bird.is_dead or bird.hp / bird.max_hp > 0.5 then
            _boolena[ RoomID ] = false
            break
          end
        end
      end

    end
------------------------------------------
    if step3_click == 0 then

      if HP_percent <= 70 and BirdClick == 0 then
        -- DebugMsg( 0 , 0 , "check point 3");
        local x, y, z, dir = DW_Location( Dog )
        local BossShowBird = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 )  --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
        SetModeEx( BossShowBird, EM_SetModeType_Fight, false)   --���(���i)
        SetModeEx( BossShowBird, EM_SetModeType_Searchenemy, false) --����(���i)
        AddToPartition( BossShowBird, RoomID )
        BeginPlot( BossShowBird, "bico_Z30_Boss2_DogtoBird", 10 )
        BirdClick = 1   
      end
----------------------------------------------
      SkillTime = SkillTime + 1
      -- DebugMsg( 0 , 0 , "check point 14, SkillTime = "..SkillTime);
      if SkillTime % 11 == 0 then
        -- DebugMsg( 0 , 0 , "check point 4");
        CastSpell( Dog, Dog, 499225 ) --�Q�]��
      elseif SkillTime % 19 ==0 then
        -- DebugMsg( 0 , 0 , "check point 5");
        -- local HateTable = KS_GetHateList( OwnerID(), 1 )
        local HateTable = {}

        for i = 0, HateListCount( Dog ) - 1 do
          table.insert( HateTable, HateListInfo( Dog, i, EM_HateListInfoType_GItemID ) )
        end

        if #HateTable ~= 0 then
          -- DebugMsg( 0 , 0 , "check point 6, #HateTable = "..#HateTable);
          local r = DW_Rand(#HateTable)
          local Dx,Dy,Dz,Ddir = DW_Location( HateTable[r] )
          local Distance = GetDistance( Dog, HateTable[r] )
          -- DebugMsg( 0 , 0 , "check point 7, Distance = "..tostring(Distance)..", HateTable[r] = "..tostring(HateTable[r]));
          CastSpell( Dog, HateTable[r], 499227 )  --���K�ľW
          if Distance > 0 then
            local Sec = Move( Dog, Dx, Dy, Dz ) 
            -- DebugMsg( 0 , 0 , "check point 11, Sec = "..Sec);
            Sleep(Sec)
          end
          if Distance < 30 then
              Distance = 30
          end
          for Dis = 1, Distance , 30 do 
            -- DebugMsg( 0 , 0 , "check point 8, Dis = "..Dis);
            local Fx,Fy,Fz = Dw_Relative( OwnerID(), Dx, Dy, Dz, Dis )
            local Fire = CreateObj( 103937, Fx, Fy, Fz, 0, 1 )
            SetModeEx( Fire , EM_SetModeType_Mark, false)
            SetModeEx( Fire , EM_SetModeType_HideName, false)
            SetModeEx( Fire , EM_SetModeType_ShowRoleHead, false)
            SetModeEx( Fire , EM_SetModeType_NotShowHPMP, false)
            SetModeEx( Fire , EM_SetModeType_Obstruct, false)   -----����
            SetModeEx( Fire , EM_SetModeType_Strikback, false) ---����
            SetModeEx( Fire , EM_SetModeType_Move, true) ---����  
            SetModeEx( Fire , EM_SetModeType_Fight, false) ---�i���
            SetModeEx( Fire , EM_SetModeType_SearchenemyIgnore, false) 
            SetModeEx( Fire , EM_SetModeType_Searchenemy, false)
            SetModeEx( Fire , EM_SetModeType_Show, true)
            AddToPartition( Fire , RoomID )
            AddBuff( Fire, 500466, 0, -1 )
            BeginPlot( Fire, "bico_Z30_Boss2_FireFire", 10 )
          end
        end
      end
    end

  end -- while

end -- function

function bico_Z30_Boss2_P3HitFire() --P3�S�Ķ����z���D���汾���K
  sleep(30)
  BeginPlot( TargetID(), "bico_Z30_Boss2_FireFire", 10 )        
end

function bico_Z30_Boss2_FireFire()
  -- DebugMsg( 0 , 0 , "check point 9");
  for i = 1, 6 do
    sleep(10)
    -- DebugMsg( 0 , 0 , "check point 12");
    SysCastSpellLv( OwnerID(), OwnerID(), 499228, 0 )
    -- DebugMsg( 0 , 0 , "check point 13");
    SysCastSpellLv( OwnerID(), OwnerID(), 499224, 0 )
  end
  -- DebugMsg( 0 , 0 , "check point 10");
  DelObj( OwnerID() )
end

function bico_Z30_Boss2_DogtoBird()
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][3] ,  EM_RoleValue_Register + 5 , 1 );
  local Bx, By, Bz, dir = DW_Location( Z30_bico_boss2_NPC_Table[RoomID][3] )
  local sec = Move( OwnerID(), Bx, By, Bz ) 
    sec = sec +10
  local Livetime = (sec+7)/10
  ScriptMessage( OwnerID(), -1, 2, "[SC_108434_06]", 0 )  --�Ұʳ����r��
  WriteRoleValue( OwnerID(), EM_RoleValue_Livetime, Livetime )
  Move( OwnerID(), Bx, By, Bz )
  sleep(sec)
  if ReadRoleValue( Z30_bico_boss2_NPC_Table[RoomID][3] ,  EM_RoleValue_Register + 5 ) == 1 then
    CastSpell(Z30_bico_boss2_NPC_Table[RoomID][3], Z30_bico_boss2_NPC_Table[RoomID][3], 499223 )  --�I���t�S��
    CancelBuff( Z30_bico_boss2_NPC_Table[RoomID][3], 500467 )     --������t�S��  
    BeginPlot( Z30_bico_boss2_NPC_Table[RoomID][3], "lua_bico_Z30_Boss2_Bird", 10 ) 
  end
end

function lua_bico_Z30_Boss2_Bird()
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
  local BirdID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )
  local Buff = { 500508, 500951, 500953 }
  local choseeTime = 0
  local BugClick = 0
  local BossShowNPC = { 104492, 103401, 103411 }  
  local zone
  if ZoneID == 166 then   --hard
    zone =1
  elseif ZoneID == 167 then --normal
    zone = 2
  elseif ZoneID == 168 then --easy
    zone = 3
    elseif ZoneID == 938 or
           ZoneID == 955 then --���հ�
    zone =1 
  end
    
  Z30_bico_boss2_BirdDead[RoomID] = { 0, 0, 0 } 
  Z30_bico_Boss2_BirdTable[RoomID] = {}   --������table{����}
  Z30_bico_Boss2_Hate_table[RoomID] = {}  --�b�U�����F�餤�ϥ�remove
  
  local x,y,z,dir = DW_Location( OwnerID())
  for i=1 , 3 , 1 do
    local Bird = CreateObj( BirdID, x, y, z, dir, 1 )
    SetModeEx( Bird , EM_SetModeType_Searchenemy, false)  ---����
    SetModeEx( Bird , EM_SetModeType_Strikback, false)  ---����
    WriteRoleValue( Bird, EM_RoleValue_PID, i )
    --���B�n���@�Ӥ��^��--
    AddToPartition( Bird , RoomID )   
    table.insert( Z30_bico_Boss2_BirdTable[RoomID], Bird )      --��������table(����)   
    AddBuff( Z30_bico_Boss2_BirdTable[RoomID][i], Buff[i], 0, -1 )    --���W������buff
    Beginplot( Bird, "lua_bico_Z30_Boss2_BirdAI", 10 )
  end
  sleep(10)
  SetModeEx( OwnerID(), EM_SetModeType_Show, false )  --���å���
  AddBuff( OwnerID(), 507646, 0, -1 )     --��ʤ���
  local MaxHP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP )
--  local _bossNum_1 = false; 
--  local _bossNum_2 = false; 
--  local _bossNum_3 = false; 
  _bird_created[ RoomID ] = true
  while true do 
    sleep(10)
----------------�u�n����@�������q�C��70%�A�N�Ұ�����
--    local HP_b1 = ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][1], EM_RoleValue_HP )
--    local HP_b2 = ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][2], EM_RoleValue_HP )
--    local HP_b3 = ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][3], EM_RoleValue_HP )
--    local HP_percent_b1 = (HP_b1/MaxHP)*100
--    local HP_percent_b2 = (HP_b2/MaxHP)*100
--    local HP_percent_b3 = (HP_b3/MaxHP)*100
--    local Dog40_Click = ReadRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2], EM_RoleValue_Register2 )

--[[    if Dog40_Click ~= 1 then
      if HP_percent_b1 <= 98 and not _bossNum_1 then
        Lua_Z30_Phase_2_BossCheck( 1 );
        _bossNum_1 = true;
      elseif HP_percent_b2 <= 98 and not _bossNum_2 then
        Lua_Z30_Phase_2_BossCheck( 2 );
        _bossNum_2 = true;
      elseif HP_percent_b3 <= 98 and not _bossNum_3 then
        Lua_Z30_Phase_2_BossCheck( 3 );
        _bossNum_3 = true;
      end
    end ]]--
    
--[[    if BugClick == 0 and Dog40_Click ~= 1 then
      if HP_percent_b1 <= 70 then
        local x, y, z, dir = DW_Location( Z30_bico_Boss2_BirdTable[RoomID][1] )
        local BossShowBug = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 ) --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
        SetModeEx( BossShowBug, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( BossShowBug, EM_SetModeType_Searchenemy, false)  --����(���i)
        AddToPartition( BossShowBug, RoomID )
        BeginPlot( BossShowBug, "bico_Z30_Boss2_BirdtoBug", 10 )  
        WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2], EM_RoleValue_Register1, 1 )  --�������@�ӰT���A�i���w�g�O�ĤT���q�I�s������ʡI�I
        BugClick = 1
      elseif HP_percent_b2 <= 70 then
        local x, y, z, dir = DW_Location( Z30_bico_Boss2_BirdTable[RoomID][2] )
        local BossShowBug = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 ) --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
        SetModeEx( BossShowBug, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( BossShowBug, EM_SetModeType_Searchenemy, false)  --����(���i)
        AddToPartition( BossShowBug, RoomID )
        BeginPlot( BossShowBug, "bico_Z30_Boss2_BirdtoBug", 10 )    
        WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2], EM_RoleValue_Register1, 1 )  --�������@�ӰT���A�i���w�g�O�ĤT���q�I�s������ʡI�I
        BugClick = 1
      elseif HP_percent_b3 <= 70 then
        local x, y, z, dir = DW_Location( Z30_bico_Boss2_BirdTable[RoomID][3] )
        local BossShowBug = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 ) --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
        SetModeEx( BossShowBug, EM_SetModeType_Fight, false)    --���(���i)
        SetModeEx( BossShowBug, EM_SetModeType_Searchenemy, false)  --����(���i)
        AddToPartition( BossShowBug, RoomID )
        BeginPlot( BossShowBug, "bico_Z30_Boss2_BirdtoBug", 10 )    
        WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][2], EM_RoleValue_Register1, 1 )  --�������@�ӰT���A�i���w�g�O�ĤT���q�I�s������ʡI�I
        BugClick = 1
      end 
    end ]]--

----------------�۳ꪺ�ؼп��
    choseeTime = choseeTime + 1
    if choseeTime % 10 == 0 then
      Z30_bico_Boss2_Hate_table[RoomID] = {}
      if Z30_bico_boss2_NPC_Table[RoomID] ~= nil then
        local Hate_table = KS_GetHateList( Z30_bico_boss2_NPC_Table[RoomID][1], 1 ) --Ū��Boss
        -- DebugMsg(0,0,"BossHateCount = "..#Hate_table )
        if #Hate_table > 2 then
          for i=1, 3, 1 do            
            local  R= DW_Ran(#Hate_table) 
            table.insert( Z30_bico_Boss2_Hate_table[RoomID], Hate_table[R()] )    --�q������������H���D�T�Ӫ��a��i�h�@�Ӱϰ��ܼƪ�table
          end
        else
          for i=1, #Hate_table, 1 do
            local  R= DW_Ran(#Hate_table) 
            table.insert( Z30_bico_Boss2_Hate_table[RoomID], Hate_table[R()] )    --�q������������H���D�T�Ӫ��a��i�h�@�Ӱϰ��ܼƪ�table
          end
        end
      end
    end
----------------���`���~��
--    if ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][1], EM_RoleValue_IsDead ) == 1 and Z30_bico_boss2_BirdDead[RoomID][1] == 0 then
--    Z30_bico_boss2_BirdDead[RoomID][1] = 1  
--    end
--    if  ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][2], EM_RoleValue_IsDead ) == 1 and Z30_bico_boss2_BirdDead[RoomID][2] == 0 then
--    Z30_bico_boss2_BirdDead[RoomID][2] = 1
--    end
--    if  ReadRoleValue( Z30_bico_Boss2_BirdTable[RoomID][3], EM_RoleValue_IsDead ) ==1 and Z30_bico_boss2_BirdDead[RoomID][3] == 0 then
--    Z30_bico_boss2_BirdDead[RoomID][3] = 1
--    end
--    if Z30_bico_boss2_BirdDead[RoomID][1] ==1 and Z30_bico_boss2_BirdDead[RoomID][2] == 1 and Z30_bico_boss2_BirdDead[RoomID][3] == 1 then
--      Z30_bico_boss2_NPC_Dead[RoomID][2] = 1
--      DelObj( OwnerID() )
--    end
  end
end

function lua_bico_Z30_Boss2_BirdAI()      --��������AI
  local SkillTime = 0
  local R1_Num = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
  local Skill = { 499230, 499233, 499235 }    --�۳�ޯ�
  local skillbuff = { 500624, 500625, 500626 }  --�۳�S��
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  local _maxHP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP );
  local _hp;
  while true do 
    sleep(10)
    if ( ReadRoleValue( OwnerID() , EM_RoleValue_HP ) / _maxHP ) * 100 <= 50 then
      local _boss_4 = Z30_bico_boss2_NPC_Table[RoomID][4];
      WriteRoleValue( _boss_4 ,  EM_RoleValue_Register + 6 , ReadRoleValue( _boss_4 , EM_RoleValue_Register + 6 ) + 1 );
      local Bux, Buy, Buz, Budir = DW_Location( _boss_4 )
      local sec = Move( OwnerID(), Bux, Buy, Buz )  
        sec = sec +10
      local Livetime = (sec+7)/10
--      ScriptMessage( OwnerID(), -1, 2, "[SC_108434_07]", 0 )  --�Ұʪ����r��
      WriteRoleValue( OwnerID(), EM_RoleValue_Livetime, Livetime )
      Move( OwnerID() , Bux, Buy, Buz )
      sleep(sec)
      if ReadRoleValue( _boss_4 , EM_RoleValue_Register + 6 ) == 3 then
        -- DebugMsg( 0 , 0 , "++++++++++++++++");
--        CastSpell( _boss_4 , Z30_bico_boss2_NPC_Table[RoomID][3], 499223 )  --�I���t�S��
--        CancelBuff( _boss_4 , 500467 )      --������t�S��  
--        SetModeEx( _boss_4 , EM_SetModeType_Move,  True )
--        SetModeEx( _boss_4 , EM_SetModeType_Fight,  True )
--        SetModeEx(  _boss_4 , EM_SetModeType_Searchenemy,  True )
        _boolena[ RoomID ] = true;
--        BeginPlot( _boss_4 , "bico_Z30_Boss2_Bug", 10 ) --�Ұ��Τl    
      end
      DelObj( OwnerID() );
    elseif ReadRoleValue( OwnerID(), EM_RoleValue_IsDead ) == 1 then
      break
    else
      local Bx, By, Bz, Bdir = DW_Location( OwnerID() )
      local Ax, Ay, Az, Adir = DW_Location( OwnerID() )
      if Bx == Ax or  By == Ay or Bz == Az then
        DW_MoveRandPath( OwnerID() , 400 ,nil, Z30_bico_boss2_NPC_Table[RoomID][5] )  --�H�����ʥH�����������
      end
      
      local DeadNum = Z30_bico_boss2_BirdDead[RoomID][1] + Z30_bico_boss2_BirdDead[RoomID][2] + Z30_bico_boss2_BirdDead[RoomID][3]    
      if DeadNum == 0 then
        if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 1 then
          SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
          SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
        elseif ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 2 then
          SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
        elseif ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 3 then
          SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
          SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
        end
      end
      if DeadNum == 1 then
        if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 1 then
          if Z30_bico_boss2_BirdDead[RoomID][2] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
          end
          if Z30_bico_boss2_BirdDead[RoomID][3] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
          end
        end
        if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 2 then
          if Z30_bico_boss2_BirdDead[RoomID][1] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
          end
          if Z30_bico_boss2_BirdDead[RoomID][3] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
          end 
        end
        if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 3 then
          if Z30_bico_boss2_BirdDead[RoomID][1] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
          end
          if Z30_bico_boss2_BirdDead[RoomID][2] == 1 then
            SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
            SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
          end 
        end
      end
      if DeadNum == 2 then
        SysCastSpellLv( OwnerID(), OwnerID(), 499231, 0 ) --��Ǫ����ĪG
        SysCastSpellLv( OwnerID(), OwnerID(), 499222, 0 ) --�缾�a���ĪG
        SysCastSpellLv( OwnerID(), OwnerID(), 499232, 0 ) --�缾�a���ĪG
        SysCastSpellLv( OwnerID(), OwnerID(), 499234, 0 ) --��Ǫ����ĪG
        SysCastSpellLv( OwnerID(), OwnerID(), 499221, 0 ) --�缾�a���ĪG
      end
          
      SkillTime = SkillTime + 1
      if SkillTime % 10 == 0 then
        if #Z30_bico_Boss2_Hate_table[RoomID] == 3 then
          if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 3 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][3], skillbuff[3], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][3], Skill[3] )
          elseif ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 2 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][2], skillbuff[2], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][2], Skill[2] )
          elseif ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 1 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][1], skillbuff[1], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][1], skill[1] )
          end
        end
        if #Z30_bico_Boss2_Hate_table[RoomID] == 2 then
          if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 2 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][2], skillbuff[2], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][2], Skill[2] )
          elseif ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 1 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][1], skillbuff[1], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][1], Skill[1] )
          end
        end 
        if #Z30_bico_Boss2_Hate_table[RoomID] == 1 then
          if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 1 then
            AddBuff( Z30_bico_Boss2_Hate_table[RoomID][1], skillbuff[1], 0, 3 )
            sleep(10)
            CastSpell( OwnerID(), Z30_bico_Boss2_Hate_table[RoomID][1], Skill[1] )
          end
        end   
      end
    end
  end
end

function bico_Z30_Boss2_BirdtoBug()
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  WriteRoleValue( Z30_bico_boss2_NPC_Table[RoomID][4] ,  EM_RoleValue_Register + 5 , 1 );
  local Bux, Buy, Buz, Budir = DW_Location( Z30_bico_boss2_NPC_Table[RoomID][4] )
  local sec = Move( OwnerID(), Bux, Buy, Buz )  
    sec = sec +10
  local Livetime = (sec+7)/10
  ScriptMessage( OwnerID(), -1, 2, "[SC_108434_07]", 0 )  --�Ұʪ����r��
  WriteRoleValue( OwnerID(), EM_RoleValue_Livetime, Livetime )
  Move( OwnerID(), Bux, Buy, Buz )
  sleep(sec)
  if ReadRoleValue( Z30_bico_boss2_NPC_Table[RoomID][4] , EM_RoleValue_Register + 5 ) == 1 then
    CastSpell(Z30_bico_boss2_NPC_Table[RoomID][4], Z30_bico_boss2_NPC_Table[RoomID][3], 499223 )  --�I���t�S��
    CancelBuff( Z30_bico_boss2_NPC_Table[RoomID][4], 500467 )     --������t�S��  
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][4], EM_SetModeType_Move,  True )
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][4], EM_SetModeType_Fight,  True )
    SetModeEx( Z30_bico_boss2_NPC_Table[RoomID][4], EM_SetModeType_Searchenemy,  True )
    BeginPlot( Z30_bico_boss2_NPC_Table[RoomID][4], "bico_Z30_Boss2_Bug", 10 )  --�Ұ��Τl
  end
end

function bico_Z30_Boss2_Bug( _boss_1 )  --���Ϊ�AI
  DebugMsg( 0,0,"--bico_Z30_Boss2_Bug--" )
  
  Sleep(10);
  local _num = RandRange( 1 , 3 ) 
--  local Buff = { 500509 , 500645 , 500952 }
  local Buff = { 500508 , 500951 , 500953 }
  DebugMsg( 0,0,"_num=".._num )
  for i = _num , _num +1 , 1 do
    if i == _num  then
      DebugMsg( 0,0,"Buff[ _num ]="..Buff[ _num ] )
      AddBuff( _boss_1 , Buff[ _num ], 0 , -1 );
    else
      if i == 4 then i = 1 end;
      DebugMsg( 0,0,"Buff[ i ]="..Buff[ i ] )
      AddBuff( OwnerID() , Buff[ i ] , 0 , -1 );
    end
  end

  local SkillTime = 0
  local Skill = { 499236, 499239 }  --���߬r�b, �ۭ���
  while true do
    sleep(10)
    SkillTime = SkillTime + 1
    if SkillTime % 11 == 0 then
      local Hate_table = KS_GetHateList( OwnerID(), 1 )
      DebugMsg( 0,0,"===222===")
      if #Hate_table ~= 0 then
        CastSpell( OwnerID(), Hate_table[1], Skill[2] )
      end     
    end
    if SkillTime % 13 == 0 then
      Hate_table = KS_GetHateList( OwnerID(), 1 )
      DebugMsg( 0,0,"===111===")
      if #Hate_table ~= 0 then
        if #Hate_table > 1 then
          for i = 1, 2, 1 do
            local r = DW_Ran(#Hate_table)
            CastSpell( OwnerID(), Hate_table[r()], Skill[1] )
          end
        else
          CastSpell( OwnerID(), Hate_table[1], Skill[1] )
        end
      end
    end
  end
end

function bico_Z30_Boss2_BirdCall()
  local x, y, z, dir = DW_Location( OwnerID() )
  SetPos( TargetID(), x, y, z, dir )
end

function bico_Z30_Boss2_BugFireattack() --�Τl���]�����[���K�ˮ`���P�_
  if CheckBuff( OwnerID(), 500396 ) == 1 then
    SysCastSpellLv( OwnerID(), TargetID(), 499237, 0 )
  end
end

function bico_Z30_Boss2_DogDead() --���b�������`�@��
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  Z30_bico_boss2_NPC_Dead[RoomID][1] = 1
end

function bico_Z30_Boss2_BugDead() --���b�Ϊ����`�@��
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  Z30_bico_boss2_NPC_Dead[RoomID][3] = 1
end

function bico_Z30_Boss2_FD()  --�e��
  SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
  SetModeEx( OwnerID() , EM_SetModeType_show, false)
  SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  while true do
    sleep(10)
    if Z30_bico_Boss2_Door_Click[RoomID] == 1 then  --�i�J�԰��G��
    SetModeEx( OwnerID() , EM_SetModeType_show, true)
    SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true)
    end
    if Z30_bico_Boss2_Door_Click[RoomID] == 0 then  --��l���A�G�} ( ���}�� )
      SetModeEx( OwnerID() , EM_SetModeType_show, false)
      SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)
    end
    if Z30_bico_Boss2_Door_Click[RoomID] == nil then
    PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP )     
    end
  end
end

function bico_Z30_Boss2_BD()  --���
  SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  while true do
    sleep(10)
    if Z30_bico_Boss2_Door_Click[RoomID] == nil then  --Boss���`�G�}
    PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP )     
    end
  end
end



function Lua_Z30_Phase_2_BossCheck( _num )
  DebugMsg( 0 , 0 , "Lua_Z30_Phase_2_BossCheck=".._num );
  local _ownerID = OwnerID();
  local BossShowNPC = { 104492, 103401, 103411 };
  local ZoneID = ReadRoleValue( _ownerID , EM_RoleValue_ZoneID )
  local RoomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID )
  local zone
  if ZoneID == 166 then   --hard
    zone =1
  elseif ZoneID == 167 then --normal
    zone = 2
  elseif ZoneID == 168 then --easy
    zone = 3
    elseif ZoneID == 938 or
           ZoneID == 955 then --���հ�
    zone =1 
  end
  local x, y, z, dir = DW_Location( Z30_bico_Boss2_BirdTable[RoomID][ _num ] )
  local BossShowBug = CreateObj( BossShowNPC[zone], x, y, z, dir, 1 ) --���ͤ@�Ӫ�t�Τ����Ī�boss��dog�]�h
  SetModeEx( BossShowBug, EM_SetModeType_Fight, false)    --���(���i)
  SetModeEx( BossShowBug, EM_SetModeType_Searchenemy, false)  --����(���i)
  AddToPartition( BossShowBug, RoomID );
  BeginPlot( BossShowBug, "Lua_Z30_Phase_2_BossMove", 10 )    
end 
function Lua_Z30_Phase_2_BossMove()
  local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
  local _boss_4 = Z30_bico_boss2_NPC_Table[RoomID][4];
  WriteRoleValue( _boss_4 ,  EM_RoleValue_Register + 6 , ReadRoleValue( _boss_4 , EM_RoleValue_Register + 6 ) + 1 );
  local Bux, Buy, Buz, Budir = DW_Location( _boss_4 )
  local sec = Move( OwnerID(), Bux, Buy, Buz )  
    sec = sec +10
  local Livetime = (sec+7)/10
  ScriptMessage( OwnerID(), -1, 2, "[SC_108434_07]", 0 )  --�Ұʪ����r��
  WriteRoleValue( OwnerID(), EM_RoleValue_Livetime, Livetime )
  Move( OwnerID(), Bux, Buy, Buz )
  sleep(sec)
  if ReadRoleValue( _boss_4 , EM_RoleValue_Register + 6 ) == 3 then
    CastSpell( _boss_4 , Z30_bico_boss2_NPC_Table[RoomID][3], 499223 )  --�I���t�S��
    CancelBuff( _boss_4 , 500467 )      --������t�S��  
    SetModeEx( _boss_4 , EM_SetModeType_Move,  True )
    SetModeEx( _boss_4 , EM_SetModeType_Fight,  True )
    SetModeEx(  _boss_4 , EM_SetModeType_Searchenemy,  True )
    BeginPlot( _boss_4 , "bico_Z30_Boss2_Bug", 10 ) --�Ұ��Τl    
  end
  DelObj( OwnerID() );
end

function magicobj_500488()
  if OwnerID() == TargetID() then
    return false
  else
    return true
  end
end