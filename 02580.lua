function lua_skwerl_cooknpc()
	SetSpeakDetail(OwnerID(), "[SKWERL_FIREDAY_COOK01]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_FIREDAY_COOK08") , " lua_skwerl_aboutcooking", 0 ) --about cooking
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_FIREDAY_COOK10") , " lua_skwerl_aboutingredient", 0 ) --about ingredient
end

function lua_skwerl_aboutcooking()
	SetSpeakDetail( OwnerID(), GetString("SKWERL_FIREDAY_COOK09") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_cooknpc", 0 ) --�^�W�@��
end

function lua_skwerl_aboutingredient()
	SetSpeakDetail( OwnerID(), GetString("SKWERL_FIREDAY_COOK11") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_cooknpc", 0 ) --�^�W�@��
end

function lua_skwerl_firestove()
	SetSpeakDetail( OwnerID(), "[SKWERL_FIREDAY_COOK15]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_FIREDAY_COOK02") , "lua_skwerl_firestove_chicken", 0 ) -- I WANT TO COOK CHICKEN
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_FIREDAY_COOK03") , " lua_skwerl_firestove_pork", 0 ) -- I WANT TO COOK PORK
 end
-- �ڭn�N�� �Ʋz 
function lua_skwerl_firestove_chicken()

	local chickencount= Countbodyitem( OwnerID(), 240993 )
	local fireflag= ReadRoleValue( TargetID() , EM_RoleValue_Register+1  )
	local Player = OwnerID()
	local stove= TargetID()
	local Block = ReadRoleValue( Player, EM_RoleValue_Register+5 )

	if Checkbuff(Player, 621810)== true then  --bug hunt
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK12]", C_SYSTEM) -- I need to rest
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK12]", C_SYSTEM)

	
	elseif Block==1 then
		Closespeak(Player)
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK07]", C_SYSTEM) -- I need to focus
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK07]", C_SYSTEM)


	elseif fireflag==1 then  --bug hunt
		Closespeak(Player)
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK06]", C_SYSTEM) -- stove is busy
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK06]", C_SYSTEM)
	elseif  chickencount==0 then
		Closespeak(Player)
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK04]", C_SYSTEM) -- I dont have enough chicken 
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK04]", C_SYSTEM)


	else
		CloseSpeak(Player)
		WriteRoleValue( stove , EM_RoleValue_Register+1, 1 )--stove is busy flag
		CallPlot( stove, "lua_skwerl_firestove_countdown" , Player )
		DelBodyItem( Player , 240993, 1 );
		WriteRoleValue( Player , EM_RoleValue_Register+1 , 1 ) --- chicken cuisine
		WriteRoleValue( Player , EM_RoleValue_Register+5 , 1 )
	end
end

-- �ڭn�N�� �Ʋz 
function lua_skwerl_firestove_pork()
	
	local porkcount= Countbodyitem( OwnerID(), 240994)
	local fireflag= ReadRoleValue( TargetID() , EM_RoleValue_Register+1 )
	local Player = OwnerID()
	local stove= TargetID()
	local Block = ReadRoleValue( Player, EM_RoleValue_Register+5 )

	if Checkbuff(Player, 621810)== true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK12]", C_SYSTEM) -- I need to rest
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK12]", C_SYSTEM)
	
	elseif Block==1 then
		Closespeak(Player)
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK07]", C_SYSTEM) -- I need to focus
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK07]", C_SYSTEM)


	elseif fireflag==1 then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK06]", C_SYSTEM) -- stove is busy
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK06]", C_SYSTEM)
	elseif Porkcount==0 then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK05]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK05]", C_SYSTEM) --I dont have enough pork


	else
		CloseSpeak( Player );
		WriteRoleValue(stove , EM_RoleValue_Register+1, 1 )--stove is busy flag
		CallPlot( stove, "lua_skwerl_firestove_countdown" , Player )
		DelBodyItem( Player, 240994, 1 );
		WriteRoleValue(Player , EM_RoleValue_Register+1 , 2 )      --- pork cuisine
		WriteRoleValue( Player , EM_RoleValue_Register+5 , 1 )
	end
end

--lua_skwerl_firestove_countdown( Num )
function lua_skwerl_firestove_countdown( Player )

--TARGETID= FLAME	-- ���Ʋz
	-- WriteRoleValue( ���a  , EM_RoleValue_Register+2 , Num ) -- �ثe�b������Ʋz
	-- �}����A�b���鶴�W���檺�@��
	--local Key 
--	Say( OwnerID() , "OwnerID" )
	AddBuff(Player , 621826 , 1 , 16 )--freezes player
	AddBuff(Player , 621822 , 1 , 16 )-- Stops player from double dipping
----------countdown--------------------------------------
	ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK14]", C_SYSTEM)
	ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK14]", C_SYSTEM) 
	AddBuff(Player , 621816 , 0 , 12 ) --controller system

	local stove = OwnerID()
	local RoomID = ReadRoleValue( stove , EM_RoleValue_RoomID )
	local Obj = Role:new( stove )  -- ���o���� X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local fireNPC = CreateObj( 120135 , BaseX , BaseY+10 , BaseZ , BaseDir , 1 ) --�Хߤ��K����10
	WriteRoleValue( Player , EM_RoleValue_Register+3 , stove )	-- �N����g�i���a�� Reg+3 
	WriteRoleValue( Player , EM_RoleValue_Register+4 , fireNPC )	-- �N����W�����K�g�i���a�� Reg+4
	AddToPartition( fireNPC , RoomID )
	SetModeEx( fireNPC , EM_SetModeType_Mark , false )--�аO
	local Key
	
	for Time = 1 , 121 , 1 do
		Key = ReadRoleValue( stove , EM_RoleValue_Register+1 )
		--DebugMsg( Player , 0 , "Time = "..Time )
		if ReadRoleValue( stove , EM_RoleValue_Register+1 ) == 0 then
			break
		else
			--------loop scoring/timing system---------------------
			WriteRoleValue( Player , EM_RoleValue_Register+2 , Time )
			--------bug hunt system---------
			--if time==114 then
			--	say(Player, "FIRE FIRE FIRE")	
			if  time==40 then
				ChangeObjID(fireNPC , 120136)
				SetModeEx( fireNPC , EM_SetModeType_Mark , false )--�аO
			elseif time==80 then
				ChangeObjID(fireNPC , 120137)
				SetModeEx( fireNPC , EM_SetModeType_Mark , false )--�аO
			elseif time==119 then
				CancelBuff(Player, 621816) -- removes control buff
			elseif time ==121 then
				SysCastSpellLv( stove , stove , 497005 , 0 )
				CastSpell( stove , stove , 497005 ) ---explosion
				sleep (6)
				AddBuff(Player ,503047 , 1, 5 ) ---burning
			--	BeginPlot( Player , "Lua_skwerl_firestove_503047" , 0 )
				ScriptMessage(Player,Player,1, "[SKWERL_FIREDAY_COOK13]", C_SYSTEM)
				ScriptMessage(Player,Player,0, "[SKWERL_FIREDAY_COOK13]", C_SYSTEM)
				if CountBodyItem(Player, 530778 )==0 then-- check for title, then give title if no title
					givebodyitem(Player, 530778, 1)
				end

				if CheckID( Player ) == false then
					DelObj(fireNPC)
					WriteRoleValue( stove , EM_RoleValue_Register+1 , 0 )--stove is busy flag off
				else
					BeginPlot( Player , "Lua_skwerl_firestove_respond" , 0 )
				end
				break
			end
		end
		sleep(1)
	end
end

function Lua_skwerl_firestove_503047()
	Sleep(6)
	AddBuff( OwnerID() , 503047 , 1 , 5 ) ---bughunt
end

---fire model switch system---
function lua_skwerl_firestove_fire()
--	local FireTable={}
--	FireTable[1]=120135
--	FireTable[2]=120136
--	FireTable[3]=120137
-- 	FireTable[4]=120137       ----bug hunt change
--	for time=1,3,1 do ---changed from 1,4,1 to 1,3,1
--		ChangeObjID(OwnerID() , FireTable[time])
--		SetModeEx( OwnerID() , EM_SetModeType_Mark , false )--�аO
--		sleep (40)
--	end
end

function Lua_skwerl_firestove_respond(Select)

	local Player = OwnerID()
	local Cuisine = ReadRoleValue( Player, EM_RoleValue_Register+1 )		-- �b�k�νޮƲz
	local Time = ReadRoleValue( Player, EM_RoleValue_Register+2 )		-- ���ʮɶ�
	local stove = ReadRoleValue( Player , EM_RoleValue_Register+3 )		-- ����
	local fireNPC = ReadRoleValue( Player , EM_RoleValue_Register+4 )	-- ����W�����K
	local Food1 , Food2 , Flag = {} , {} , {}					-- ���P�����X��
	local Buff = { 621816 , 621826 , 621822 }					-- ���a���W���k�N control buff�Bunfreeze player�Bdouble dipping buff
	local Title = 0
	local Lv = math.ceil( Time / 20 )						-- �Ѭ��ʮɶ��M�w���������~ 1 ~ 7(�� Time = 121 �ɡALv �|����7 )
	
	--DebugMsg( Player , 0 , "Select = "..Cuisine.." Time = "..Time.." Stove = "..stove.." fireNPC = "..fireNPC)
		
--------food/gift table------------
	Food1[1]=240981
	Food1[2]=240982
	Food1[3]=240983
	Food1[4]=240984
	Food1[5]=240985
	Food1[6]=240986
-----------------------------------
	Food2[1]=240987
	Food2[2]=240988
	Food2[3]=240989
	Food2[4]=240990
	Food2[5]=240991
	Food2[6]=240992
----------------------------------
-------Flag Table----------------
	Flag[1]=546116	--chicken cuisine flags
	Flag[2]=546117
	Flag[3]=546118
	Flag[4]=546119
	Flag[5]=546120
	Flag[6]=546128
	Flag[7]=546129	--pork cuisine flags
	Flag[8]=546130
	Flag[9]=546131
	Flag[10]=546132
	Flag[11]=546133
	Flag[12]=546134

--	Say( Player , Time )
	DelObj(fireNPC)
-- ���y�P�_�}�l
	if Select == 1 then
		if Cuisine == 1 then
		--	DebugMsg( Player , 0 , "Flag = "..Flag[Lv] )
			Givebodyitem( Player , Food1[Lv] , 1 )
			if CheckFlag( Player , Flag[Lv] ) == false then --flag planting---
				SetFlag( Player , Flag[Lv] , 1 )
			end
		elseif Cuisine == 2 then
		--	DebugMsg( Player , 0 , "Flag = "..Flag[Lv] )
			Givebodyitem( Player , Food2[Lv] , 1 )
			if CheckFlag( Player, Flag[Lv+6] ) == false then --flag planting---
				SetFlag( Player , Flag[Lv+6] , 1 )	-- �]���N�X�вΤ@���@�Ӱϰ��ܼơA�ҥH����󬰽ޮƲz�ɡALv�L����+6 ( �b�k�� Flag[1]~[6]�A�ެ� Flag[7]~[12])
			end
		end
		-- �ٸ��P�_�}�l
		if CountBodyItem( Player , 530777 ) == 0 then	-- �p�G���a�S�����ٸ��A�~����o�ӧP�_��
		
			for i = 1 , table.getn(Flag) , 1 do
				if CheckFlag( Player , Flag[i] ) == true then
					Title = Title + 1
				end
			end
			if Title == 12 then
				Givebodyitem( Player , 530777 , 1 ) -- iron chef, 12 dishes completion
			end
		end
		-- �p�G���a�S���`�y���X��
		if CheckFlag( Player, 546068 ) == false then
			GiveBodyItem( Player , 208918 , 1 )
			GiveBodyItem( Player, 240995, 2)
			SetFlag( Player , 546068 , 1 )-- daily 24 hours ticket flag
		end
	end
-- �M�Ū��a���W�O�����Ʋz���B���ʮɶ��B����id�B����W�����K
	for i = 1 , 4 , 1 do
		WriteRoleValue( Player , EM_RoleValue_Register+i , 0 )
	end
-- �M�����a���W���ʬ�����Buff
	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( Player, Buff[i] )
	end
-- ���m���אּ�i�I�����A
	WriteRoleValue( stove , EM_RoleValue_Register+1 , 0 )--stove is busy flag off
-- ��������W���檺�@��
--	WriteRoleValue( stove , EM_RoleValue_Register+2 , 1 )
-- �������a 3 �p�ɤ��A�L�k�I����Buff
	WriteRoleValue( Player , EM_RoleValue_Register+5 , 0 )
	AddBuff( Player , 621810 , 0 , 10800 ) --mission complete buff
--
end

function lua_skwerl_fireday_deltitle()
	local OID= OwnerID()
	DelBodyItem(OID, 530777, 1)
	DelBodyItem(OID, 530778, 1)
	Setflag(OID, 546116 , 0 )
	Setflag(OID, 546117 , 0 )
	Setflag(OID, 546118 , 0 )
	Setflag(OID, 546119 , 0 )
	Setflag(OID, 546120 , 0 )
	Setflag(OID, 546128 , 0 )
	Setflag(OID, 546129 , 0 )
	Setflag(OID, 546130 , 0 )
	Setflag(OID, 546131 , 0 )
	Setflag(OID, 546132 , 0 )
	Setflag(OID, 546133 , 0 )
	Setflag(OID, 546134 , 0 )
	say(OID, "test")
end	