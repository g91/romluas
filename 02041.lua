function FN_Pumpkin_NPC116035()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_RealZoneID)
--	local Pumpking = Lua_DW_CreateObj( "obj" , 116034 , OwnerID() , 1 , 1 )
	local Pumpking = LuaFunc_SearchNPCbyOrgID(OwnerID() , 116034, 100 , 0) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y
	while TRUE do
		Sleep(600)
		--
		local hour = GetSystime(1)
		local min = GetSystime(2)

		if Zone == 15 then
			if hour == 1 or hour == 3 or hour == 5 or hour == 7 or hour == 9 or hour == 11 or hour == 13 or hour == 15 or hour == 17 or hour == 19 or hour == 21 or hour == 23 then
				if  min == 50 then  
					RunningMsg( OwnerID() , 1 , "[FN_PUMPKIN_01]" )	-- �������a���ʮɶ��n��F
				end
			elseif hour == 0 or hour == 2 or hour == 4 or hour == 6 or hour == 8 or hour == 10 or hour == 12 or hour == 14 or hour == 16 or hour == 18 or hour == 20 or hour == 22 then      
				if min == 0 then
					--RunningMsg( OwnerID() , 2 , "[FN_PUMPKIN_02]" )		-- �������a���ʧY�N�}�l
					Beginplot(Pumpking, "FN_Pumpkin_NPC116034_Begin" , 0 )	--�n�ʤ��̼@��
					WriteRoleValue ( Pumpking , EM_RoleValue_Register1, 1)	--��n�ʤ��̪�Register1�g��1�A��ܬ��ʶi�椤
				end
			end
		end	
	end
end

function FN_Pumpkin_NPC116034()
	if ReadRoleValue ( TargetID() , EM_RoleValue_Register1 ) == 1 then
		SetSpeakDetail( OwnerID(), "[FN_PUMPKIN_03]"  )	--�i�D���a���ʥ��b�i��
	else
		if CheckFlag( OwnerID(), 543853 ) == TRUE then	--�ˬd���a���S����������
			if CheckFlag( OwnerID(), 543787 ) == FALSE then	--�ˬd���a���S�����L�C��p���~
				SetSpeakDetail( OwnerID(), "[FN_PUMPKIN_04]"  )
				AddSpeakOption( OwnerID(), TargetID(), "[FN_PUMPKIN_04_1]"  , "FN_Pumpkin_NPC116034_gift", 0 )	--����U�t���~
			else
				SetSpeakDetail( OwnerID(), "[FN_PUMPKIN_05]"  )
				
			end
		end
		LoadQuestOption( OwnerID())
	end
end

function FN_Pumpkin_NPC116034_gift()
	Tell ( OwnerID() , TargetID(),  "[FN_PUMPKIN_04_2]" )
	GiveBodyItem( OwnerID(),207965,5)
	SetFlag( OwnerID(), 543787,1)
	CloseSpeak( OwnerID())
end

function FN_Pumpkin_NPC116034_Begin()	--�n�ʤ��̪�Begin
	local TempString01 = {[1] = "[FN_PUMPKIN_09_VAR1_1]";
				[2] = "[FN_PUMPKIN_09_VAR1_2]";
				[3] = "[FN_PUMPKIN_09_VAR1_3]";
				[4] = "[FN_PUMPKIN_09_VAR1_4]";
				[5] = "[FN_PUMPKIN_09_VAR1_5]";
				}
	local TempString02 = {[1] = "[FN_PUMPKIN_09_VAR2_1]";
				[2] = "[FN_PUMPKIN_09_VAR2_2]";
				[3] = "[FN_PUMPKIN_09_VAR2_3]";
				[4] = "[FN_PUMPKIN_09_VAR2_4]";
				[5] = "[FN_PUMPKIN_09_VAR2_5]";
				[6] = "[FN_PUMPKIN_09_VAR2_6]";
				[7] = "[FN_PUMPKIN_09_VAR2_7]";
				[8] = "[FN_PUMPKIN_09_VAR2_8]";
				}
	local TempX
	local HardLV = 0
	local VAR1String
	local VAR2String
	local VAR3String
	local VAR2XString
	local VAR3XString
	local ranX
	local ranY = {}
	local VAR1TYPE
	local VAR1CHOOSE
	local VAR2BUFF
	local VAR2BUFFX
	local VAR3BUFF
	local VAR3BUFFX
	local PumpkingPlayer = {}
	local TempPlayer = SearchRangePlayer(OwnerID(), 300 )
	for X = 0, table.getn(TempPlayer) do
		if TempPlayer[X] ~= -1 then
			table.insert(PumpkingPlayer,TempPlayer[X])
		end
	end
	if table.getn(PumpkingPlayer) <= 10 then	--�H�H�ƦӤ��P���}����
		Yell(OwnerID(),"[FN_PUMPKIN_06_1]",2)
	elseif table.getn(PumpkingPlayer) <= 20 then
		Yell(OwnerID(),"[FN_PUMPKIN_06_2]",2)
	elseif table.getn(PumpkingPlayer) <= 30 then
		Yell(OwnerID(),"[FN_PUMPKIN_06_3]",2)
	end
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	for i= 1,table.getn(PumpkingPlayer) do	--�������a����BUFF
		if ReadRoleValue ( PumpkingPlayer[i] , EM_RoleValue_IsDead ) == 0 then
			AddBuff(PumpkingPlayer[i],507636,1,-1)
			AddBuff(PumpkingPlayer[i],507637,0,400)
		end
	end
	--
	Sleep(50)	
	Yell(OwnerID(),"[FN_PUMPKIN_07]",2)	--ť�n�F�A�̡A�C���W�h�D�`��²��...
	PlayMotion( OwnerID(), 123)
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(70)
	Yell(OwnerID(),"[FN_PUMPKIN_08]",2)	--�@ť��ڪ��R�O�A�A�̴N�n�b10��...
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Sleep(70)
	Yell(OwnerID(),"[FN_PUMPKIN_08_1]",2)	--�{�b...�A���٦�20���ɶ�...
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(200)
	while TRUE do
		for X= 1,table.getn(PumpkingPlayer) do
			--�ˬd���Ѫ����a�ý�X
			if CheckBuff( PumpkingPlayer[X] , 507636) == FALSE then
				table.remove(PumpkingPlayer,X)
			else
				WriteRoleValue(PumpkingPlayer[X],EM_RoleValue_Register10,HardLV)
			end
		end
		--
		if HardLV == 30 then
			FN_Pumpkin_GameEnd(OwnerID(),PumpkingPlayer)
			break
		end
		--
		if HardLV >= 10 then	--��������Ҧ�
			ranX = Rand(2)
			if ranX == 0 then	--�P�_�ر�
				VAR1TYPE = 1
				VAR1CHOOSE = Rand(2)
				TempX = VAR1CHOOSE+1
				VAR1String = TempString01[TempX]
			elseif ranX == 1 then	--�P�_¾�~
				VAR1TYPE = 2
				VAR1CHOOSE = DW_Rand(3)
				TempX = VAR1CHOOSE+2
				VAR1String = TempString01[TempX]
			end
			--
			if HardLV >= 20 then		--�������D��
				ranY = Az_RND_Ary(1,8,4)
				VAR2BUFF = ranY[1]
				VAR2BUFFX = ranY[2]
				VAR3BUFF = ranY[3]
				VAR3BUFFX = ranY[4]
				VAR2String = TempString02[VAR2BUFF]
				VAR3String = TempString02[VAR3BUFF]
				VAR2XString = TempString02[VAR2BUFFX]
				VAR3XString = TempString02[VAR3BUFFX]
				--
				FN_Pumpkin_NPC116034_VAR1(VAR1TYPE,VAR1CHOOSE,VAR2BUFF,VAR3BUFF,VAR2BUFFX,VAR3BUFFX,PumpkingPlayer)
				--
				Yell(OwnerID(),"[FN_PUMPKIN_09_2BUFF][$SETVAR1="..VAR1String.."][$SETVAR2="..VAR2String.."][$SETVAR3="..VAR2XString.."][$SETVAR4="..VAR3String.."][$SETVAR5="..VAR3XString.."]",2)
				PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				Sleep(30)
				local motionX = Rand(2)
				if motionX == 0 then
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH )
				else
					PlayMotion( OwnerID(), 123 )
				end
			elseif HardLV >= 10 then	--��������Ҧ�
				ranY = Az_RND_Ary(1,8,2)
				VAR2BUFF = ranY[1]
				VAR3BUFF = ranY[2]
				VAR2String = TempString02[VAR2BUFF]
				VAR3String = TempString02[VAR3BUFF]
				--
				FN_Pumpkin_NPC116034_VAR1(VAR1TYPE,VAR1CHOOSE,VAR2BUFF,VAR3BUFF,0,0,PumpkingPlayer)
				--
				Yell(OwnerID(),"[FN_PUMPKIN_09][$SETVAR1="..VAR1String.."][$SETVAR2="..VAR2String.."][$SETVAR3="..VAR3String.."]",2)
				PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			end
		elseif HardLV <= 9 then	--�����H�@�_�@�ʧ@��²��Ҧ�
			VAR2BUFF = DW_Rand(8)
			VAR2String = TempString02[VAR2BUFF]
			FN_Pumpkin_NPC116034_VAR1(3,0,VAR2BUFF,0,0,0,PumpkingPlayer)	--��0�����ݭn
			Yell(OwnerID(),"[FN_PUMPKIN_09_ALL][$SETVAR1="..VAR2String.."]",2)
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		--
		Sleep(90)
		--
		HardLV = HardLV + 1
		if HardLV ==10 then
			Yell(OwnerID(),"[FN_PUMPKIN_15]",2)	--²�檺�D�ؤw�g�X����...
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			Sleep(45)
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH )
			Sleep(35)
		elseif HardLV == 20 then
			Yell(OwnerID(),"[FN_PUMPKIN_16]",2)	--�ݨӫe�����D�بèS�����˧A�̩O...
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			Sleep(35)
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT )
			Sleep(45)
		end
	end
end

function FN_Pumpkin_NPC116034_VAR1(VAR1TYPE,VAR1CHOOSE,VAR2BUFF,VAR3BUFF,VAR2BUFFX,VAR3BUFFX,PumpkingPlayer) --��ܪ��a�é�buff�AVAR1TYPE��ܭn�P�_�ر��٬O¾�~�AVAR1CHOOSE�O�bTYPE�M�w�����ܤl��
	local PumpkinRaceType = {1, 2}
	local PumpkinClassType = {[1]={5, 6, 7, 8};
					[2]={3, 4};
					[3]={1, 2};
					}
	local PumpkinBuff = {507647, 507648, 507649, 507650, 507651, 507652, 507653, 507654}
	--
	if VAR1TYPE == 1 then	--�P�_�ر�
		for i= 1,table.getn(PumpkingPlayer) do
			if ReadRoleValue(PumpkingPlayer[i],EM_RoleValue_RACE) == VAR1CHOOSE then	--�P�_�O���O�M�w���ر�
					AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR2BUFF],0,9)
					if VAR2BUFFX ~= 0 then
						AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR2BUFFX],0,9)
					end
			else
					AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR3BUFF],0,9)
					if VAR3BUFFX ~= 0 then
						AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR3BUFFX],0,9)
					end
			end
		end
	elseif VAR1TYPE == 2 then	--�P�_¾�~
		local Tempboolean = FALSE
		for i= 1,table.getn(PumpkingPlayer) do
			Tempboolean = FALSE
			for ii = 1,table.getn(PumpkinClassType[VAR1CHOOSE]) do	--�P�_�O���O�M�w��¾�~
				if ReadRoleValue(PumpkingPlayer[i],EM_RoleValue_VOC) == PumpkinClassType[VAR1CHOOSE][ii] then
					Tempboolean = TRUE
				end
			end
			if Tempboolean == TRUE then
				AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR2BUFF],0,9)
				if VAR2BUFFX ~= 0 then
					AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR2BUFFX],0,9)
				end
			else
				AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR3BUFF],0,9)
				if VAR3BUFFX ~= 0 then
					AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR3BUFFX],0,9)
				end
			end
		end
	elseif VAR1TYPE == 3 then	--�����H
		for i= 1,table.getn(PumpkingPlayer) do
			AddBuff(PumpkingPlayer[i],PumpkinBuff[VAR2BUFF],0,9)
		end
	end
end

function FN_Pumpkin_GameOver()	--���a�]���ɶ����S�@�ӾɭP�C������
	CancelBuff_NoEvent(OwnerID(),507647)
	CancelBuff_NoEvent(OwnerID(),507648)
	CancelBuff_NoEvent(OwnerID(),507649)
	CancelBuff_NoEvent(OwnerID(),507650)
	CancelBuff_NoEvent(OwnerID(),507651)
	CancelBuff_NoEvent(OwnerID(),507652)
	CancelBuff_NoEvent(OwnerID(),507653)
	CancelBuff_NoEvent(OwnerID(),507654)
	if CheckBuff( OwnerID() , 507636) == TRUE then
		if FN_CountBuffLevel(OwnerID(),507636) == 0 then
			local HardLV = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)

			CancelBuff( OwnerID() , 507636 )
			CancelBuff( OwnerID() , 507637 )
			if HardLV <= 9 then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[FN_PUMPKIN_14]", C_SYSTEM ) 
				GiveBodyItem(OwnerID(),725489,1)
			elseif HardLV <= 30 then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_NORMALHARD]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[FN_PUMPKIN_14]", C_SYSTEM )
				if HardLV <= 19 then
					GiveBodyItem(OwnerID(),725490,1)
				elseif HardLV <= 30 then
					GiveBodyItem(OwnerID(),725491,1)	
				end
			end
			WriteRoleValue(OwnerID(),EM_RoleValue_Register10,0)
		else
			CancelBuff(OwnerID() , 507636 )
			CancelBuff(OwnerID() , 507637 )
			Sleep(5)
			AddBuff(OwnerID(),507636,0,-1)
			AddBuff(OwnerID(),507637,0,400)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_GIVECHANCE]", 0 )
		end
	end
end

function FN_Pumpkin_GameEnd(NPC,PumpkingPlayer)	--�C������
	local TempX = table.getn(PumpkingPlayer)

	if TempX ~= 0 then
		Yell(NPC,"[FN_PUMPKIN_11][$SETVAR1="..TempX.."]",2)
		Sleep(30)
		Yell(NPC,"[FN_PUMPKIN_12]",2)

		for i = 1,table.getn(PumpkingPlayer) do
			GiveBodyItem(PumpkingPlayer[i],207967,1)
			CancelBuff(PumpkingPlayer[i] , 507636 )
			CancelBuff(PumpkingPlayer[i] , 507637 )
		end

	elseif TempX == 0 then
		Yell(NPC,"[FN_PUMPKIN_13]",2)
	end
	WriteRoleValue ( NPC , EM_RoleValue_Register1, 0)
end
-----------------------------------------------------------------------------
------------------------------�ޯ�I�i-------------------------------------
-----------------------------------------------------------------------------#C7996E
function  FN_Pumpkin_507638()
	if CheckBuff( OwnerID() , 507647) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507647 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
--		ScriptMessage( OwnerID(), 0, 0, "XXXX",  "0xFFC7996E" )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507639()
	if CheckBuff( OwnerID() , 507648) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507648 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
		Sleep(35)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_NORMAL )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507640()
	if CheckBuff( OwnerID() , 507649) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507649 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507641()
	if CheckBuff( OwnerID() , 507650) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507650 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507642()
	if CheckBuff( OwnerID() , 507651) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507651 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507643()
	if CheckBuff( OwnerID() , 507652) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507652 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507644()
	if CheckBuff( OwnerID() , 507653) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507653 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CUTE1 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function  FN_Pumpkin_507645()
	if CheckBuff( OwnerID() , 507654) == TRUE then
		CancelBuff_NoEvent( OwnerID() , 507654 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DANCE )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_PUMPKIN_10_PASS]", C_SYSTEM )
	else
		FN_Pumpkin_BuffCancel(OwnerID())
	end
end

function FN_Pumpkin_BuffCancel(Player)	--���a�]���@���ɭP�C������
	if CheckBuff( Player , 507647) == TRUE or CheckBuff( Player , 507648) == TRUE or CheckBuff( Player , 507649) == TRUE or CheckBuff( Player , 507650) == TRUE or CheckBuff( Player , 507651) == TRUE or CheckBuff( Player , 507652) == TRUE or CheckBuff( Player , 507653) == TRUE or CheckBuff( Player , 507654) == TRUE then
		CancelBuff_NoEvent(Player,507647)
		CancelBuff_NoEvent(Player,507648)
		CancelBuff_NoEvent(Player,507649)
		CancelBuff_NoEvent(Player,507650)
		CancelBuff_NoEvent(Player,507651)
		CancelBuff_NoEvent(Player,507652)
		CancelBuff_NoEvent(Player,507653)
		CancelBuff_NoEvent(Player,507654)

		if FN_CountBuffLevel(Player,507636) == 0 then
			local HardLV = ReadRoleValue(Player,EM_RoleValue_Register10)
			CancelBuff(Player , 507636 )
			CancelBuff(Player , 507637 )
			if HardLV <= 9 then
				ScriptMessage( Player, Player, 1, "[FN_PUMPKIN_10]", 0 )
				ScriptMessage( Player, Player, 0, "[FN_PUMPKIN_14]", C_SYSTEM ) 
				GiveBodyItem(Player,725489,1)
			elseif HardLV <= 30 then
				ScriptMessage( Player, Player, 1, "[FN_PUMPKIN_10_NORMALHARD]", 0 )
				ScriptMessage( Player, Player, 0, "[FN_PUMPKIN_14]", C_SYSTEM )
				if HardLV <= 19 then
					GiveBodyItem(Player,725490,1)
				elseif HardLV <= 30 then
					GiveBodyItem(Player,725491,1)
				end
			end
			WriteRoleValue(Player,EM_RoleValue_Register10,0)
		else
			CancelBuff(Player , 507636 )
			AddBuff(Player,507636,0,-1)
			ScriptMessage( Player, Player, 1, "[FN_PUMPKIN_10_GIVECHANCE]", 0 )
		end
	end
end

-------------------------------------------------------------------------------------
function LuaI_207967( Option ) --�n�ʤ����Y�`�]
	local PlayerID = OwnerID()
	local PackageID = 207967		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725455 , 1 )	
	end
end