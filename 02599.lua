
--hp test system--
--switch
function lua_skwerl_val_test()
	local Player=OwnerID()
	Addbuff(Player, 621904, 1, -1)-- play system
	Addbuff(Player, 621903, 3, -1) ---hp
	Addbuff(Player, 621993, 1, -1)--IFF
	Addbuff(Player, 622035, 1, 180)
end

function lua_skwerl_val_test2()
	local Player=OwnerID()
	Addbuff(Player, 622035, 1, 180)
end

--impact
function lua_skwerl_val_hit()  --���u�@��
--	say(OwnerID(), "owner")
--	say(TargetID(), "target")
	local target=targetID()
	local Player=OwnerID()
	local HP= FN_CountBuffLevel(target, 621903)


	if CheckBuff(target, 621933)==true then                                                  --�p�G�ؼФw��
		return false

--	elseif CheckBuff( target , 621915)==true then --�p�G�ؼбa�����m�k�N
--		return false

	elseif HP==1 then	--��ؼ�hp=0�ɡA�T�{�ؼ��ũR�A������[��
		SysCastSpellLv(target, target, 499097,1 )
		--say (Player, playerscore)
		Cancelbuff(target, 621903) --��hp
		Addbuff(target, 621903, HP-1, -1)
		Addbuff(Player, 621985, 1, 1) --killer visual fx
		Addbuff(Player, 622036, 1, 900) --�[��
		local score= FN_CountBuffLevel(Player, 622036) --����
		ScriptMessage( Player,Player, 2, "+2", C_SYSTEM );  --����
--		say (Player, score+1) --����
		Addbuff(target,621933,1,8) --���`�L�Ī��A
		Addbuff(target,621932,1,5) --�˦�
	
		sleep(50)
		Addbuff(target, 621903, 2, -1)--�ؼЭ���
	--	say(target, "respawn")	
	
	else               -- �@������
		SysCastSpellLv(target, target, 499097,1 )
		SysCastSpellLv(target, Player, 499108, 1 )--�o��q���ĪG
		Cancelbuff(target, 621903)
		Addbuff(target, 621903, HP-1, -1) --��hp
		--Addbuff(Player, 621960, 1, 1)
		Addbuff(Player, 622036, 0, 900) --�[��
		ScriptMessage( Player,Player, 2, "+1", C_SYSTEM );  --����

		--say(target, "Hit")
	end
end




-------------------
function lua_skwerl_val_explosion()
local Player = TargetID()
local Mine = OwnerID()
--say(Player, "player")
--say(Mine, "mine")
--	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
--	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	Sleep (13) --�a�p������z
--	Addbuff(Player, 621960, 1, -1)
	
		--sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
--	say(Player, "Obj_X="..Obj_X)
--	say(Player, "Obj_Y="..Obj_Y)
--	say(Player, "Obj_Z="..Obj_Z)
--	SysCastSpellLv_Pos( Mine , Obj_X , Obj_Y , Obj_Z , 499047 , 1 )
	SysCastSpellLv( Player, Mine, 499047,1 )
	sleep ( 10 )
end
---------------------------
function lua_skwerl_val_counter_explosion()
local Player = TargetID()
local Mine = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 621916)+1
	if bufflv+1 ==0 then
		Cancelbuff(Player, 621916)
	else
	local newbuff= bufflv-1
		Cancelbuff(Player, 621916) --�����a�u������@��
		Addbuff(Player, 621916, newbuff-2, -1)
	end
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	
	Sleep (13)

	SysCastSpellLv( Player, Mine, 499069,1 )
	sleep ( 10 )
end

---------------------------------

function lua_skwerl_val_counterhit()
	
	local target=targetID()
	local Player=OwnerID()
	local HP= FN_CountBuffLevel(target, 621903)
	
	if CheckBuff(target , 621933)==true then                                                --�p�G�ؼФw��
		return false

	elseif CheckBuff( target , 621915)==true then --�p�G�ؼбa�����m�k�N
		Addbuff(target, 621916, 1, -1)  --���������ޯ�
		Cancelbuff(target, 621915) --�������m

	else	--�@���ű�

		SysCastSpellLv(target, target, 499097,1 )
		--say (Player, playerscore)
		Cancelbuff(target, 621903) --��hp
		Addbuff(target, 621903, HP-1, -1)
		Addbuff(Player, 621985, 1, 1) --killer visual fx
		Addbuff(Player, 622036, 1, 900) --�[��
		local score= FN_CountBuffLevel(Player, 622036) --����
		ScriptMessage( Player,Player, 2, "+2", C_SYSTEM );  --����
--		say (Player, score+1) --����
		Addbuff(target,621933,1,8) --���`�L�Ī��A
		Addbuff(target,621932,1,5) --�˦�
	
		sleep(50)
		Addbuff(target, 621903, 2, -1)--�ؼЭ���


	end
end
----------------------------------------------------

function lua_skwerl_val_hpreport()
	local Player=TargetID()
	local HP= FN_CountBuffLevel(Player, 622036)
	say(Player, HP)
end

---model/element/common/prop/music_fun/act_magic_plane_b.ros

function lua_skwerl_mine_hide()

	SetModeEx( OwnerId(), EM_SetModeType_Mark , false )--�аO
	SetModeEx( OwnerId(), EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( OwnerId(), EM_SetModeType_Show , false )--���

end
--------------------------------------------------------------------
--- check for friendly---
function lua_skwerl_iff()
local target= TargetID()
	if Checkbuff(target,621993)==false then   ---�p�G�S���W
		return false
	elseif  CheckBuff( target , 621915)==true then --�p�G�ؼбa�����m�k�N
		return false
	end
local caster = OwnerID()
	if caster==target then 
		return false
	else
		return true
	end
end

-----------

function lua_skwerl_val_cheat()
	say(OwnerID(), "owner")
	say(TargetID(), "target")
	Addbuff(OwnerID(),  621986, 1, -1)
	Addbuff(OwnerID(), 621915, 1, 10)
	Addbuff(OwnerID(), 621916, 2, -1)
end


function lua_skwerl_val_KO()
local Player = TargetID()
local Mine = OwnerID()

Cancelbuff(Player, 621986) --�����a�u������@��
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m

	SysCastSpellLv( Player, Mine, 499059,1 )
	sleep ( 10 )
end

function lua_skwerl_val_koshutdown()
	Cancelbuff(OwnerID(), 621986)
	Addbuff(targetID(),621932,1,5) 
end

function lua_skwerl_val_koshutdown2()
	Cancelbuff(OwnerID(), 621986)
	say(OwnerID(), "owner")
end
---remove buff if KIA'ed
---remove buff if used
---checkbufflv if 2 then +1 buff and give weapon switch 1
--- checkbufflv if 4 then +1 buff and give weapon switch 2




-------------REGISTRATION SYSTEM-------------------------------------------

-----------NPC--------------
function lua_skwerl_val_npc()  --�D��H
	SetSpeakDetail( OwnerID(), "[SKWERL_VAL_03]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_18") , "lua_skwerl_val_aboutrules", 0) --���ʳW�h
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_27") , "lua_skwerl_val_abouttime", 0) --���ʮɶ�	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_02") , "Lua_skwerl_val_registration", 0 ) --�ѥ[�C��
end

function lua_skwerl_val_npc_teleport()  ---�ǰe�v
	SetSpeakDetail( OwnerID(), "[SKWERL_VAL_26]" ) --((introduction )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_30") , "Lua_skwerl_val_teleportation", 0 ) --���ڶǰe��
 end

function lua_skwerl_val_teleportationstone()  --�ǰe��
	ChangeZone(OwnerID() , 2, 0, 1594.3, -21.9, 9542.8, 74.5)
end


-----���W-----------
function Lua_skwerl_val_registration() --Npc���W�@��
	local Player = OwnerID()
	local npc= TargetID()
	local registercount= ReadRoleValue( npc , EM_RoleValue_Register+1  )
	Local Hour
	Local Min
	Local Backdoor
	 Hour = GetSystime(1) --���o�{�b�ɶ��G��
	 Min = GetSystime(2) --���o�{�b�ɶ��G��
	--place backdoor system here----
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+2  ) 
	local check=checkbuff(Player, 622035)
		if CheckFlag( Player, 546188 ) == true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_15]", C_SYSTEM) --�A���Ѥw�g�ѥ[�L�F�A�Щ��ѦA��!
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_15]", C_SYSTEM)
			
		elseif check==true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_22]", C_SYSTEM) --�A�w�g���U�L�F
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_22]", C_SYSTEM)
	
		elseif Hour==0 or Hour==12 or Hour==18 or  backdoor==1 then

			if registercount==10 then
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_24]", C_SYSTEM)--���ʤw�B��
	 		ScriptMessage(Player,Player,0, "[SKWERL_VAL_24]", C_SYSTEM)
			elseif (Min>=7 and Min<10) or (Min>=17 and Min<20) or (Min >=27 and Min<30) or (Min >=37 and Min<40) or (Min >=47 and Min<50)  then 	
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_01]", C_SYSTEM) --���U���\
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_01]", C_SYSTEM)
			newregistercount=registercount+1
			WriteRoleValue(npc , EM_RoleValue_Register+1, newregistercount ) 
			Addbuff(Player, 622035, 1, 185)--���U�ҩ� ---give registration buff 
			else
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --�Цb���ʶ}�l�T�����e���W
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)

			end
		else
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --�Цb���ʶ}�l�T�����e���W
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)


	end
end
-------------------���~�I��------------------------

-------------------------------------------
function Lua_skwerl_val_teleportation()-- �ǰe�v��O
	local player= OwnerID()
	if CheckFlag( Player, 546195 ) == true then  --�ˬd�ǰe�۪��C��flag
		Closespeak(player);	
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_28]", C_SYSTEM) --"�ܩ�p�A�@�ѥu��e�@���ǰe�ۡA�Щ��ѦA��!"
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_28]", C_SYSTEM)
	else
		Closespeak(player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_31]", C_SYSTEM) --"�o�@���ǰe�۴N���A�F�A���A�n�B!"
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_31]", C_SYSTEM)
		GiveBodyItem( player, 241112, 1 ) --���ǰe��
		setFlag(player, 546195,1)--���ǰe�۪��C��flag
	end
end



function lua_skwerl_val_aboutrules() --����W�h�r��
	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_16") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --�^�W�@��
end

function lua_skwerl_val_abouttime() --����ɶ��r��
	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_13") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --�^�W�@��
end


	--function lua_skwerl_val_timetable() --���W�Ӹ`�r��
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_25") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --�^�W�@��
	--end
	--
	--function lua_skwerl_val_alreadyregistered() --�w�g���W�L
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_22") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --�^�W�@��
	--end
	--
	--function lua_skwerl_val_full() --�W�B�w��
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_24") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --�^�W�@��
	--end


function lua_skwerl_val_timer() ---npc �ɶ��p��
		local npc=TargetID()
		Local Hour
		Local Min
		while true do
		 Hour = GetSystime(1) --���o�{�b�ɶ��G��
		 Min = GetSystime(2) --���o�{�b�ɶ��G��
			if (hour==0 and Min==0) or (hour==12 and Min==0) or (hour == 18 and Min==0) then
			ScriptMessage(OwnerID(),2,1, "[SKWERL_VAL_32]", C_SYSTEM) --�s��
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_VAL_32]" )   --�s���}�l
			end
			sleep(600)
			end
		
			 if Min==0 or Min==10 or Min==20 or Min==30 or  Min==40 or Min ==50 then   
			WriteRoleValue(TargetID() , EM_RoleValue_Register+1, 0)
			 end	
		sleep (600)
		end
end
-----------------------------------------------------------------------------------------
function lua_skwerl_val_bailout()
	
--�ɶ��t��
	
	Local npc=OwnerID()
	Local magicformation
	Local Hour
	Local Min

---�����m
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local x= BaseX
	local y= BaseY
	local z= BaseZ
	local  direction= BaseDir
	local backdoor
	local backdoor2
	local backdoor3
-------	
	local magicformation
	local registeredplayer
	local remainingplayer = 0
	local judge
	local wall
	local registeredplayer2 ={}--new
	while true do
		 Hour = GetSystime(1) --���o�{�b�ɶ��G��
		 Min = GetSystime(2) --���o�{�b�ɶ��G��
		--backdoor-
		backdoor= ReadRoleValue( npc , EM_RoleValue_Register+1  ) --����A�j��}�l�C��
		backdoor2= ReadRoleValue( npc , EM_RoleValue_Register+2  )  -- ����A�j��H�ƨ����}��
		backdoor3= ReadRoleValue( npc , EM_RoleValue_Register+3  )  -- ����A�j��H�ƨ����}��
    		   if Hour==0 or Hour==12 or Hour==18 or backdoor==1 or backdoor3==1 then	
			if Min==7 or Min== 17 or Min==27 or Min==37 or Min==47 or backdoor3==1 then  --test
				--�w�����]�k��
			
				magicformation= CreateObj(120390 , BaseX , BaseY , BaseZ , BaseDir , 1 )
				SetModeEx( magicformation  , EM_SetModeType_Mark, false )--�аO
				AddToPartition( magicformation , RoomID )
				if  backdoor3==1  then
					say(npc, "test begins")
				elseif backdoor==0 or backdoor==1 then
					Sleep(1500) --�]�k��˼Ʈɶ� test
				end
				registeredplayer = SearchRangePlayer( npc , 130 )  --�j�M�餺���a
				
				for i=0, table.getn(registeredplayer), 1 do --�V�餺���a�ŧi�˼�
					ScriptMessage( registeredplayer[i],registeredplayer[i],1, "[SKWERL_VAL_12]", C_SYSTEM) --���ʧY�N�}�l
					ScriptMessage(registeredplayer[i],registeredplayer[i],0, "[SKWERL_VAL_12]", C_SYSTEM)
				end
				
				sleep(300)
				DelObj(magicformation)
			--	WriteRoleValue(npc , EM_RoleValue_Register+1, 0) --�M�����backdoor�}�� 				
		
				
				for i=0, table.getn(registeredplayer), 1 do
					if CheckBuff( registeredplayer[i] , 622035 ) == true then -- �����Ubuff�����a�}�l�C��
						Addbuff(registeredplayer[i], 621904, 1, -1)-- play system --�����k�N
						Addbuff(registeredplayer[i], 621903, 3, -1) ---hp
						Addbuff(registeredplayer[i], 621993, 1, -1)
						CancelBuff(registeredplayer[i], 622035) ---����Ubuff					
						table.insert(registeredplayer2, registeredplayer[i] )--new	
				--	else
				--		ChangeZone(registeredplayer[i] , 954 , RoomID , -274.0, -257.1, -634.2, 237.4) --�L���U���a�ǰe�X��
					end	
				end
				local number1=table.getn(registeredplayer)
				local number2=table.getn(registeredplayer2)
				--say (npc, number1)
				--say (npc, number2)
				 if backdoor3==1 then
					number2=6
					WriteRoleValue(npc , EM_RoleValue_Register+3, 0)  --�M������}���C
				end
				if number2<2 then
			--	if table.getn(registeredplayer2)<2 then
					for  i=1, table.getn(registeredplayer2), 1 do
		
		
						ScriptMessage( registeredplayer2[i],registeredplayer2[i],1, "[SKWERL_VAL_17]", C_SYSTEM) --�H�Ƥ���
						ScriptMessage(registeredplayer2[i],registeredplayer2[i],0, "[SKWERL_VAL_17]", C_SYSTEM)
						Cancelbuff(registeredplayer2[i], 621904)-- play system
						Cancelbuff(registeredplayer2[i], 621903) ---hp
						Cancelbuff(registeredplayer2[i], 621993) --���U
		
					end
					registeredplayer2={}---registeredplayer2 �k�s
					sleep (620)
					
				else
					for  i=1, table.getn(registeredplayer2), 1 do
						ScriptMessage( registeredplayer2[i],registeredplayer2[i],1, "[SKWERL_VAL_09]", C_SYSTEM) --���ʶ}�l
						ScriptMessage(registeredplayer2[i],registeredplayer2[i],0, "[SKWERL_VAL_09]", C_SYSTEM)
				
					end
		
					Lua_Hao_Round_wall( npc , 120368 , 20, 130 , 0 ) --����
					--�͵��P
				--	local judge
					judge=  CreateObj( 120394 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�е��P
					AddToPartition(judge , RoomID )
					SetModeEx( judge, EM_SetModeType_Mark , false )
				--	��power up
					 lua_skwerl_val_spawn(X,Y,Z,Direction,RoomID,registeredplayer2)	
					 lua_skwerl_val_spawn_2(X,Y,Z,Direction,RoomID,registeredplayer2)	
					 
				--------------------------�C������ remove buff----------------------------				
					for i=1, table.getn(registeredplayer2), 1 do
						Cancelbuff(registeredplayer2[i], 621904)-- play system
						Cancelbuff(registeredplayer2[i], 621903) ---hp
						Cancelbuff(registeredplayer2[i], 621993) --���U
						--�R��power ups--
						Cancelbuff(registeredplayer2[i],621986)
						Cancelbuff(registeredplayer2[i],621916)	
						Cancelbuff(registeredplayer2[i],621915)
						
					end
			
				------------------�R��---------------------------------------------
					wall= LuaFunc_SearchNPCbyOrgID(npc , 120368, 350 , 1 )   	
					for i=0, table.getn(wall), 1 do
						Delobj(wall[i])
					end
				--------------------------------------------------------------------------
					DelObj(judge) --�R���P
					sleep(10)
				-------------���ư���M���A�T�{�����M��-----------------
					
					for i=1, 3, 1 do
						for i=1, table.getn(registeredplayer2), 1 do
							Cancelbuff(registeredplayer2[i], 621904)-- play system
							Cancelbuff(registeredplayer2[i], 621903) ---hp
							Cancelbuff(registeredplayer2[i], 621993) --���U
							--�R��power ups--
							Cancelbuff(registeredplayer2[i],621986)
							Cancelbuff(registeredplayer2[i],621916)	
							Cancelbuff(registeredplayer2[i],621915)
						end
					end
					sleep(5)


					registeredplayer2={}---remainingplayer �k�s
			   	 end
				
			end 
		end
	sleep (10)
    	end

end





 function Lua_skwerl_val_walltest() -- ���իإ߶ꫬ������
	Lua_Hao_Round_wall( OwnerID() , 120368 , 20, 130 , 0 )
	sleep(30)
--	local wall
--	wall= LuaFunc_SearchNPCbyOrgID( OwnerID() , 120368, 350 , 1 )   	
			for i=0, table.getn(wall), 1 do
				Delobj(wall[i])
			end
	
--	Delobj(wall)
	say (OwnerID(), "test")
end



function Lua_skwerl_val_distcheck() --�ˬd�Z��
	local npc = OwnerID()
--	local Newplayer ={}
--	for i , player in pairs(CheckPlayer) do
	
	local activeplayer = SearchRangePlayer( npc , 300 )  --�����W���a�C
	local activeplayer2={}
	for i=0, table.getn(activeplayer), 1 do
		if CheckBuff( activeplayer[i] , 621993 ) == true then 
			table.insert(activeplayer2 , activeplayer[i]);
		end
	end	
	if #activeplayer2 >= 0 then--table.getn(activeplayer2) ~= nil then
		while true do
			local tmp = {}
			for i=1 , table.getn(activeplayer2) , 1 do
				local Distance= GetDistance(npc, activeplayer2[i])
				if Distance > 160 then
					ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_VAL_07]", C_SYSTEM)  --���a�X��
					ScriptMessage( activeplayer2[i],activeplayer2[i],0, "[SKWERL_VAL_07]", C_SYSTEM)
					Cancelbuff(activeplayer2[i], 621904)-- play system
					Cancelbuff(activeplayer2[i], 621903) ---hp
					Cancelbuff(activeplayer2[i], 621993) --���U
					Cancelbuff(activeplayer2[i], 622036) -- ����
					--��power ups
					Cancelbuff(activeplayer2[i],621986)
					Cancelbuff(activeplayer2[i],621916)	
					Cancelbuff(activeplayer2[i],621915)
				
				else
					table.insert( tmp, activeplayer2[i] )
				end
			end
			activeplayer2 = tmp;
			SysCastSpellLv(npc, npc, 499244,1 )
			
			for i = 1 , table.getn(tmp) , 1 do
				local BuffType = 0
				local Count = BuffCount( tmp[i] )

				for j = 1 , Count  , 1 do
					local BuffID = BuffInfo(tmp[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then --���M�����M
					DW_CancelTypeBuff( 68,  tmp[i] ) --�U��
					ScriptMessage( tmp[i] , tmp[i] , 1 , "[SKWERL_VAL_29]" , 0 )  --���ʶi�椤�A���B�L�k�M�����M�I0�O����  C_SYSTEM�O����
				end
	
			end
		sleep(10)
		end
	end
end	
	

-----------------�S���W�����a�|�ǥX��(�k�N�]�w)-------------------

function lua_skwerl_teleportationcheck()
	local player= TargetID()
	if (Checkbuff(player,621993)==false and Checkbuff(player, 622035)== true) then
		ChangeZone(Player , 2, 0, 1594.3, -21.9, 9542.8, 74.5) 
		ScriptMessage(player,player,1, "[SKWERL_VAL_35]", C_SYSTEM)  --�Ф��n�z�Z���ʡC
		ScriptMessage( player,player,0, "[SKWERL_VAL_35]", C_SYSTEM)
	elseif Checkbuff(player,621993)==false then    --�S���W�����a�|�ǥX��
		ChangeZone(Player , 2, 0, 1594.3, -21.9, 9542.8, 74.5) --�Ǩ쬡��npc��
		ScriptMessage(player,player,1, "[SKWERL_VAL_11]", C_SYSTEM)  --�Ф��n�z�Z���ʡC
		ScriptMessage( player,player,0, "[SKWERL_VAL_11]", C_SYSTEM)
	end
end
--------------------------------------------------------------------
function lua_skwerl_val_power_invincible()  ---�L��power up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
		return false
		else
		Addbuff(player, 621915, 1, 8)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_04]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_04]", C_SYSTEM)
	end
end


Function lua_skwerl_val_power_knockdown() ---�˦apower up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
		return false
		else
		Addbuff(player,  621986, 1, -1)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_05]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_05]", C_SYSTEM)
	end
end

Function lua_skwerl_val_power_nuke() ---�j��power up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
			return false
	elseif checkbuff(player, 621916)==true then
			return false
	else
		Addbuff(player, 621916, 2, -1)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_06]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_06]", C_SYSTEM)
	end
end

-----power up �Ͳ�function---
function lua_skwerl_val_spawn(X,Y,Z,Direction,RoomID)
	local powerup
	local angle			
	for i=0, 9, 1 do
		local Random1 = Rand(3)
		local Random2=Rand(2)
		if Random2==0 then
			angle = 1
		elseif Random2==1 then
			angle = -1	
		end

		if Random1==0 then
			powerup= CreateObj( 241054 ,X + angle*Rand(85) , Y , Z+angle*Rand(85) , Direction , 1 ) --�Х�power up 1
		elseif Random1==1 then
			powerup= CreateObj( 241072 , X + angle*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --�Х�power up 2
		else
			powerup= CreateObj( 241073 , X + angle*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --�Х�power up 3	
		end
		AddToPartition( powerup , RoomID )
		SetModeEx( powerup , EM_SetModeType_Mark , false )
		Sleep(150)
		DelObj(powerup)		
	 end	
end

-----power up �Ͳ�function part 2---

function lua_skwerl_val_spawn_2(X,Y,Z,Direction,RoomID,table1)
	local powerup1
	local powerup2
	local powerup3
	local angle
	local angle2
	local angle3
	local score
	local green

	for  i=1, table.getn(table1), 1 do
		if Checkbuff(table1[i], 621993)==true then
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_19]", C_SYSTEM) --���C�������٦�30��
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_19]", C_SYSTEM)
		end
	end

	for i=0, 5, 1 do
		if i==4 then
			for  i=1, table.getn(table1), 1 do
				if Checkbuff(table1[i], 621993)==true then
					ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_20]", C_SYSTEM) --���C�������٦�10��
					ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_20]", C_SYSTEM)
				end
			end
		elseif i==5 then
			for  i=1, table.getn(table1), 1 do
				if Checkbuff(table1[i], 621993)==true then
					ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_21]", C_SYSTEM) --���C�������٦�5��
					ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_21]", C_SYSTEM)
					setFlag(table1[i], 546188,1)   --���ѻP�Lflag 
				end
			end	
		end

		local Random2=Rand(2)
		if Random2==0 then
			angle = 1
			elseif Random2==1 then
			angle = -1	
		end
		
		local Random3=Rand(2)
		if Random3==0 then
			angle2 = 1
			elseif Random3==1 then
			angle2 = -1	
		end
		
		local Random4=Rand(2)
		if Random4==0 then
			angle3 = 1
			elseif Random4==1 then
			angle3 = -1	
		end
		
		local greenrandom=Rand(100)        --�ͺ�y�t��

		
		if greenrandom >= 79 then
  			powerup1= CreateObj( 241054 ,X + angle*Rand(85) , Y , Z+angle3*Rand(85) , Direction , 1 ) --�Х�power up 1
  			AddToPartition( powerup1 , RoomID )
  			SetModeEx( powerup1 , EM_SetModeType_Mark , false )
		end

		powerup2= CreateObj( 241072 , X + angle2*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --�Х�power up 2
		AddToPartition( powerup2 , RoomID )
		SetModeEx( powerup2 , EM_SetModeType_Mark , false )

		powerup3= CreateObj( 241073 , X + angle3*Rand(85) ,Y , Z+angle2*Rand(85) , Direction , 1 ) --�Х�power up 3	
		AddToPartition( powerup3 , RoomID )
		SetModeEx( powerup3, EM_SetModeType_Mark , false )	
	
		
		Sleep(60)
		if greenrandom >= 79  then
			DelObj(powerup1)
		end		
		DelObj(powerup2)
		DelObj(powerup3) 
	 end	
	
	for  i=1, table.getn(table1), 1 do
		if Checkbuff(table1[i], 621993)==true then
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_08]", C_SYSTEM) --�C������
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_08]", C_SYSTEM)
		end
	end
	for  i=1, table.getn(table1), 1 do  --�o���ť�
		if Checkbuff(table1[i], 621993)==true then
			score = FN_CountBuffLevel(table1[i], 622036)+1
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_33]"..":"..score.."[SKWERL_VAL_34]", C_SYSTEM) 
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_33]"..":"..score.."[SKWERL_VAL_34]", C_SYSTEM)
				if score >=40 then
				GiveBodyItem(table1[i], 209161,3)--�������y
					if CountBodyItem(table1[i], 530877 )==0 then-- �ˬd�O�_�����Y�����N�A�p�G�S���A�����N
					givebodyitem(table1[i], 530877, 1)
					end
				elseif score>=20 then
				Givebodyitem(table1[i], 209161,2) --�������y
				else
				Givebodyitem(table1[i], 209161,1) --�������y
				end

			Cancelbuff(table1[i], 622036)---�R������	
		end
	end
	
end

----------�ǰe�۪���---------------<100 �����`�ϰ�
function lua_skwerl_val_teleportcheck()
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if Zone < 100  then  
		return true
	else
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
		return false	
	end
end


------------------���լ�Ϋ�����O--------------
function lua_skwerl_val_on() --backdoor on
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 400 , 0) 
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120319, 400 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 1 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 1 ) 
end

function lua_skwerl_val_off() --backdoor off
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 400 , 0) 
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120319, 400 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 0 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 0 ) 
end

function lua_skwerl_val_backdoor2()
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 300 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+3, 1 ) 

end

function lua_skwerl_val_announcement()
	ScriptMessage(OwnerID(),2,1, "[SKWERL_VAL_32]", C_SYSTEM) --�s��
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_VAL_32]" )   --�s���}�l
	end
end

function lua_skwerl_val_score(score)
	Cancelbuff(OwnerID(), 622036)
	Addbuff(OwnerID(), 622036, score-1, 900)
end