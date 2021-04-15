--EM_ClockCheckValue_20 -- �p�ɾ�
--Lua_Deadkeep --��npc����ʧ@�]���`�^
--INSTANCE_STATE_11 �����ɤ���
--EM_RoleValue_Register+1  ���ain�D��
--EM_RoleValue_Register+2  ����in�ܰʭ�
--EM_RoleValue_Register+3  ���ain����NPC
--EM_RoleValue_Register+4  ����in���KNPC�]���K�ʫ�A�n���W��惡�ȡA�H���n�R�ɡA�R����F��^
--EM_RoleValue_Register+5  ����in���a


function Lua_fireday_ev1_npc()	
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_01") ) --�������A�S�n�ӬD����~�ɤ����ª�����F~~
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_02") , "lua_fireday_background", 0 ) --ť�������`���Ѩ�
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_06") , "lua_fireday_ev1_rule", 0 ) --ť���C���W�h
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_06") , "lua_fireday_changegoods", 0 ) --���y�I��
	if CheckFlag(OwnerID(), 544702 ) == true and CheckFlag(OwnerID(), 544728 ) == false then 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_21") , "lua_fireday_ev1_end", 0 ) --������y
	elseif CheckFlag(OwnerID(), 544702 ) == false then
		if CheckFlag(OwnerID(), 544703 ) == false  and CheckFlag(OwnerID(), 544707 ) == false then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_EV1_07") , "lua_fireday_firekey", 0 ) --�ڷǳƦn�n�ɤ��F
		end
	end
end

--------------------------------�ɤ��C���W�h�B�ѨӡB���-----------------------------------------
function lua_fireday_ev1_rule() 
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_03") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "Lua_fireday_ev1_npc", 0 ) --�^�W�@��
end

function lua_fireday_background() 
	SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_01") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "Lua_fireday_ev1_npc", 0 ) --�^�W�@��
end

function lua_fireday_firekey()   
	--Say(OwnerID(), "37")
	--Say(TargetID(), "38") --NPC
	if CheckFlag(OwnerID(), 544702 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_EV1_05") ) --�ܩ�p�A�A���Ѥw�g���L�F�A�Щ��ѦA�ӧa�I
	else  
		local c = rand(31) + 70 --���K�ū׬�70~100
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_08][$SETVAR1="..c.."]" ) --�I���ڮ��䪺����}�l�a�I�ū׬O�K
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, c ) 
		setflag(OwnerID(), 544703, 1 )  --���Ұʨ�		
	end
end

--------------------------------���ޯ�B�p�ɾ�------------------------------------------
Function lua_fireday_clock01() --���b���󲣥XSCRIPT
	SetPlot( OwnerID() , "touch" , "lua_fireday_clockbuff" , 30 );	--�᭱�Ʀr�O���I�����d��
end

function lua_fireday_clockbuff() 
	--Say(OwnerID(), "55")  --player
	--Say(TargetID(), "56")  --����
	local firepid = readRoleValue( targetID(), EM_RoleValue_PID )
	local NPC = WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, TargetID() ) --��ȼg�JNPC
	if firepid == 0 then
		if CheckFlag(OwnerID(), 544703 ) == true and CheckFlag(OwnerID(), 544707 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0  then
			WriteRoleValue( targetID() , EM_RoleValue_PID ,  1 )
			--say(targetid(), firepid)
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_10]" , C_SYSTEM )  --�ɤ��}�l�I
			ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_10]" , C_SYSTEM )  
			AddBuff( OwnerID() , 508657 , 1, -1) --���ಾ��
			sleep(1)
			AddBuff( OwnerID() , 508489 , 1, -1) --���ޯ�buff��
			sleep(1)	
			AddBuff( OwnerID() , 508490 , 1, -1) --���ޯ�buff��
			sleep(1)
			setflag(OwnerID(), 544707, 1 )  --���୫���I����
			setflag(OwnerID(), 544703, 0 ) 	
			local target = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) --Ū�O�b���a�W����
			--Say( OwnerID(), target)
			WriteRoleValue(TargetID() , EM_RoleValue_Register+2, 0 ) 
			local now = ReadRoleValue ( targetID() , EM_RoleValue_Register+2)
			SetSmallGameMenuType(  OwnerID() , 11 , 1 ) --�O���O�A��1���гy�A��2������
			SetSmallGameMenuStr( OwnerID() , 11 , 1 , "[SC_FIREDAY_EV1_16][$SETVAR1="..target.."]"  ) --���F��ūץؼС]�e�����^
			SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..now.."]"  ) --�ثe�ū�
			ClockOpen( OwnerID() ,EM_ClockCheckValue_20, 60,60, 0,"lua_fireday_ev1_zone", "lua_fireday_ev1_timeover") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
			beginplot(TargetID(), "lua_fireday_ev1_infire", 0) --�I�s
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) == 0 then
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_20]" , C_SYSTEM )  --�Х���ɤ��t�d�H�������ȡI
			ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_20]" , C_SYSTEM )  
			setflag(OwnerID(), 544703, 0 )
			--say(OwnerID(), "88")
			--say(TargetID(), "89")
		end
	elseif checkflag(ownerid(), 544707) == true then
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_22]" , C_SYSTEM ) --���୫���I������
	--say(OwnerID(), "83")
	--say(TargetID(), "84")
	elseif firepid ==1 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FIREDAY_EV1_23]" , C_SYSTEM ) --���勵�b�ϥΤ�
		--say(OwnerID(), "93")
		--say(TargetID(), "94")
	end
end

--------------------------------�ɶ���B���ϡB�M��----------------------------------------------------
function lua_fireday_ev1_timeover()
	--Say( NPC , "101" )  --NPC
	--Say(OwnerID(), "102")  --player
	--Say(TargetID(), "103")  -- player
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_15]" , C_SYSTEM )  --�ɶ���I
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FIREDAY_EV1_15]" , C_SYSTEM )  
	ClockClose( OwnerID() )
	CancelBuff( OwnerID() , 508489 ) 	--�M���ޯ�buff
	CancelBuff( OwnerID() , 508490 )
	CancelBuff( OwnerID() , 508657 )
	SetFlag(OwnerID(), 544702, 1 ) --�����Ѥw�ѥ[�����ɤ��֪� Flag
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --����NPC
	local fireplayer = ReadRoleValue ( NPC , EM_RoleValue_Register+2 )  -- ans
	local fireq = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 )   --question
	--Say(OwnerID(), fireplayer)  
	--Say( TargetID(), "NPC"..firenpc) 
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_25][$SETVAR1="..fireq.."][$SETVAR2="..fireplayer.."]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID(), 0, "[SC_FIREDAY_EV1_25][$SETVAR1="..fireq.."][$SETVAR2="..fireplayer.."]" , C_SYSTEM )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,fireplayer)
	sleep(50)
	local fireNPC = ReadRoleValue( NPC , EM_RoleValue_Register+4 ) 
	DelObj( fireNPC )
	SetSmallGameMenuType( OwnerID() , 11 ,2 ) -- �������� (2������)
	WriteRoleValue( NPC , EM_RoleValue_PID ,  0 ) --���諸IP�k0
	WriteRoleValue( NPC , EM_RoleValue_Register+4 , 0 ) 
end

function lua_fireday_ev1_firere()
	local firetime = 60
	while firetime >0 do
	--	say(TargetID(), "firere="..firetime)
		firetime = firetime -1
		sleep(10)
	end
	local t = ReadRoleValue(  TargetID() , EM_RoleValue_Register+4 )
	DelObj( t )
	WriteRoleValue(  TargetID() , EM_RoleValue_PID ,  0 ) --���諸PID�k0
	WriteRoleValue(  TargetID() , EM_RoleValue_Register+2 ,  0 )
end

function lua_fireday_ev1_zone() --����
	--Say(OwnerID(), "137")  --player
	--Say(TargetID(), "139")  -- player
	ClockClose( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_17]" , 0)
	ScriptMessage( OwnerID() , OwnerID(), 0, "[SC_FIREDAY_EV1_17]" , C_SYSTEM )
	CancelBuff( OwnerID() , 508489 ) 	--�M���ޯ�buff
	CancelBuff( OwnerID() , 508490 )
	CancelBuff( OwnerID() , 508657 )
	SetFlag(OwnerID(), 544731, 0 )
	SetSmallGameMenuType( OwnerID() , 11 ,2 ) -- �������� (2������)
	local firenpc2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local firenpc3 = ReadRoleValue( firenpc2 , EM_RoleValue_Register+4 ) 
	DelObj( firenpc3 )
	WriteRoleValue(  firenpc2 , EM_RoleValue_PID ,  0 ) --���諸IP�k0
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+1 , 0 ) 
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+3 , 0 ) 
end

function lua_fireday_ev1_leavefire() --���u
	--Say(OwnerID(), "137")  --player
	--Say(TargetID(), "139")  -- player
	local firenpc2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local firenpc3 = ReadRoleValue( firenpc2 , EM_RoleValue_Register+4 ) 
	DelObj( firenpc3 )
	WriteRoleValue(  firenpc2 , EM_RoleValue_PID ,  0 ) --���諸IP�k0
end

--------------------------------�ޯ���w------------------------------------------------
function Lua_fireday_ev1_checknpc()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --Ū�֨��W��ID
--	say ( OwnerID () ,"161" ) --player
--	say ( TargetID () , OrgID ) --����
	if ( CheckID( TargetID() ) == false ) then  --�S����H
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )	
	--	Say(OwnerID(),"166  no ok")
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )	
			return false
		else  --���O���a
			if OrgID == 117254 then  
			--	Say(OwnerID(),"ok")
				return true
			else
			--	Say(OwnerID(),"177 no ok")
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_26]" , 0 )		
				return false
			end
		end
	end
end

--------------------------------�ӤF�@�}��or�B------------------------------------------
function lua_fireday_ev1_infire() --�ؤ��K
	--Say(OwnerID(), "131") --����
	--Say(TargetID(), "132")  --���a
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --�ѷӤ����}
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , TargetID() ) --�]�i���a����
--	say(playerID,"0000")
	local Obj = Role:new( OwnerID() )  -- ���o���� X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local fireNPC = CreateObj( 117265, BaseX, BaseY+10, BaseZ, BaseDir, 1 ) --�Хߤ��K����10
	SetModeEx( fireNPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( fireNPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( fireNPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( fireNPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx( fireNPC, EM_SetModeType_Move, false )--����
	SetModeEx( fireNPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( fireNPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx( fireNPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( fireNPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( fireNPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( fireNPC, EM_SetModeType_Gravity, false )--���O
	SetModeEx( fireNPC, EM_SetModeType_Show, true )--���
	AddToPartition( fireNPC , RoomID ) -- �إߪ���
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, fireNPC ) --��ȼg�JNPC
	Beginplot( fireNPC, "lua_fireday_ev1_change" , 0 ) --�b�إ߫e����~�|���\
	Beginplot( OwnerID() , "lua_fireday_ev1_firere" , 0 )--�˼�
end

function lua_fireday_ev1_change()
	--Say(OwnerID(), "159")  --����
	--Say(TagetID(), "160")  -- ����
	local newvalue , playerID , firevalue
	local time = 60
	while true do
		if time >= 4 and time <= 50 then --10���}�l�j��
			while true do
				--Say( OwnerID() , "time ="..time )
				newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
				playerID = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )
				firevalue = ReadRoleValue (  playerID, EM_RoleValue_Register+1 )
				if newvalue > 0 then
					local a = rand(11)
					if a >= 0 and a <= 5  then-- 0~ 5
						local b = (rand(21)+30) * 0.5
						local newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						newvalue  = math.floor ( newvalue + b +0.5)  --�|�ˤ��J
						--say( OwnerID(), b)
						ScriptMessage( playerID, playerID, 1, "[SC_FIREDAY_EV1_09]" , C_SYSTEM )  --���M��_�@�}�������է���F�I
						ChangeObjID( OwnerID(), 117256 ) --�ܤj��
						WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
						WriteRoleValue( TargetID() , EM_RoleValue_Register+2, newvalue )
						local n =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						SetSmallGameMenuStr( playerID , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..n.."]"  ) --��s���ثe�ū�
						--say( TargetID(), "173")
						--say(OwnerID(), "174")
					elseif a >= 6 and a <= 10 then -- 6 ~ 10
						local b = (rand(21)+30) * 0.5
						local newvalue = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
						newvalue  = math.floor ( newvalue - b +0.5) 
						--say( TargetID(), newvalue)
						if newvalue < 0 then
							newvalue = 0
							ChangeObjID( OwnerID(), 117255 ) --�ܤp��
							WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
							SetSmallGameMenuStr( playerID, 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..newvalue.."]"  )
						else
							ScriptMessage( playerID,  playerID, 1, "[SC_FIREDAY_EV1_12]" , C_SYSTEM )  --���M�U�_�@�}�B�����հI�z�F�I
							ChangeObjID( OwnerID(), 117255 ) --�ܤp��
							WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , OwnerID() )
							WriteRoleValue( TargetID() , EM_RoleValue_Register+2, newvalue )
							local n =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
							SetSmallGameMenuStr( playerID, 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..n.."]"  ) --��s���ثe�ū�
							--say(OwnerID(), "183")
							--say(TargetID(), "184")
						end
					end
				end
				local g = (rand( 5 ) *10)+15
				time = time - g/10
				if time <= 4 then --�p��4��ɰ���j��
					return time				
				end
			sleep( g )
			end 
		else 
			time = time -1			
		end
	sleep(10)
	end

end 

-------------------------------�ޯ����B�ʤ�--------------------------------------------
function lua_fireday_ev1_waterbuff()
	--Say(OwnerID(), "192")  --player
	--Say(TargetID(), "193")  -- ����
	local w =  ReadRoleValue ( targetID() , EM_RoleValue_Register+2 )
	local fireNPC = ReadRoleValue ( TargetID() , EM_RoleValue_Register+4)
	local x = rand(15)+1
	if w < x then
		w = 0
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_24]" , C_SYSTEM )  --�¤O�L�C�A�ֶʤ�
		SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  )
	elseif w >= x then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_19][$SETVAR1="..x.."]" , C_SYSTEM ) --���F�H��
		w = w - x
		SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  )
	end

	ChangeObjID( fireNPC, 117265 ) --�ܤ���
	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , fireNPC )
	WriteRoleValue(TargetID() , EM_RoleValue_Register+2, w )
	local w =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..w.."]"  ) --��s���ثe�ū�
end

function lua_fireday_ev1_firebuff()
	--Say(OwnerID(), "207")  --player
	--Say(TargetID(), "208") --����
	local f = ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	local fireNPC = ReadRoleValue ( TargetID() , EM_RoleValue_Register+4)
	local x = rand(15)+1
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FIREDAY_EV1_18][$SETVAR1="..x.."]", C_SYSTEM  ) -- �ɤF�H��

	ChangeObjID( fireNPC, 117265 ) --�ܤ���
	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , fireNPC )
	f = f + x
	WriteRoleValue(TargetID() , EM_RoleValue_Register+2, f )
	local f =  ReadRoleValue ( TargetID() , EM_RoleValue_Register+2 )
	SetSmallGameMenuStr( OwnerID() , 11 , 2 , "[SC_FIREDAY_EV1_11][$SETVAR1="..f.."]"  ) --��s���ثe�ū�
end

-------------------------------�{��--------------------------------------------------
function lua_fireday_ev1_end()
	--Say(OwnerID(), "222")  --player
	--Say(TargetID(), "223") --�ɤ��t�d�H
	--Say(OwnerID(), fireplayer)  
	--Say( TargetID(), "NPC"..firenpc) 
	local firenpc4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --����NPC
	local fireplayer = ReadRoleValue ( OwnerID(), EM_RoleValue_Register+2 )  -- ans
	local fireq = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 )   --question
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if fireq>0 then
			if fireplayer > (fireq-4) and fireplayer < (fireq+4) then  
				SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_04]" ) --�u�O���o�Ӧn�F�A�ݨӧA�ܦ����|�Q�אּ���~���ɤ�����̰ڡI���h�a�A�o�O�A���o�����y�C
				GiveBodyItem(OwnerID(),725654, 1) --����
				GiveBodyItem(OwnerID(), 208918, 1)
				SetFlag(OwnerID(), 544728, 1 )
			else   
				SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_14]" ) --���M���G�t�j�H�N�A���A�ܧV�O�A���ѦA�[�o�a�I
				GiveBodyItem(OwnerID(), 208918, 1) --����
				SetFlag(OwnerID(), 544728, 1 ) --���୫�ƻ�
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_FIREDAY_EV1_27]" ) --���ʥ��ѵL�k���
			SetFlag(OwnerID(), 544728, 1 )
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
	end
	WriteRoleValue( firenpc4 , EM_RoleValue_Register+2, 0 )        --�M�ŵ���
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+3 , 0 ) 
	WriteRoleValue(  OwnerID(), EM_RoleValue_Register+1 , 0 ) 
end