--423355���F������--��b�̧J701907
--function LuaS_423355_0()	--���t��g�J����function���F���մ�������	115795	
--	LoadQuestOption( OwnerID() )
--	if	(CheckAcceptQuest(OwnerID(),423355)==true )	and	( CheckCompleteQuest( OwnerID(),423355)==false)	and	
--		CheckFlag( OwnerID() , 544261 ) ==false		then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423355_0]","LuaS_423355_1",0)		--���F�����ڨ�...
--	end
--end

function LuaS_423355_1()
	SetSpeakDetail(OwnerID(),"[SC_423355_1]")
	SetFlag( OwnerID() , 544261 , 1 )	
end

--423356
--�I�����~�e�G
function Lua_423356_STONE_before()
	if	(CheckAcceptQuest(OwnerID(),423356)==true )and( CheckCompleteQuest( OwnerID(),423356)==false) and	CheckFlag( OwnerID() , 544262) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--�ؼХ��b���L��
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(), 2, "[SC_423356_7]",0)
	ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423356_7]",0)
	return false
	end
end

--�I�����~��G�X�l�G780691
function Lua_423356_STONE_after()
	if 	CheckAcceptQuest( OwnerID() , 423356) == true		and
		(CheckFlag( OwnerID(), 544262)==false)		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(OwnerID() , 544330, 1 )						--544330�P�_�Z����		
		AddBuff(OwnerID() , 507159, 1 , 40)  						
	end

--	if 	CheckAcceptQuest( OwnerID() , 423356) == true	and	(CheckFlag( OwnerID(), 544262)==false)		and
--		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then

		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		local STONEB = LuaFunc_CreateObjByObj (115991, TargetID())				--115991�۪OB	
		Lua_ObjDontTouch( STONEB ) 
		SetModeEX( STONEB , EM_SetModeType_Obstruct , true )
		SetModeEX( STONEB , EM_SetModeType_Mark , true )
		WriteRoleValue( STONEB,EM_RoleValue_Register+2,TargetID())				--��۪O�g�i�۪OB
		WriteRoleValue( STONEB,EM_RoleValue_Register+3,OwnerID())				--�⪱�a�g�i�۪OB
		BeginPlot( STONEB, "LuaS_423356_Range_CHECK" , 0 )					--���۪OB�j���ˬd--���a���b�N�R���۪OB
		BeginPlot( STONEB  , "Lua_423356_LOOP" , 0 )
--		else
--		return false
--	end
	return true
end

function Lua_423356_LOOP()
	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	

	local BOX= Lua_DW_CreateObj("flag" ,116093,780703,1,1)				--���ͯS�Ĳy116093�A780703�A1
	WriteRoleValue( BOX,EM_RoleValue_Register+2,OwnerID())				--��۪OB�g�i�S��
	BeginPlot( BOX, "LuaS_423356_22" , 0 )						--�S�Ĳy�]���j���ˬd�A�۪OB���b�N�R��
	CastSpell( BOX, BOX, 495606)	
	sleep(30)
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423356_0]",0)				--�۪O���P��¶�H�H�ե�......
	ScriptMessage(TargetID(),TargetID(), 0, "[SC_423356_0]",0)				--�۪O���P��¶�H�H�ե�......
	
	local PREANT = Lua_DW_CreateObj("flag" ,115800,780691,1,1)				--���Ͱ��w�S�Jù780691�A�s��115800
	WriteRoleValue( PREANT,EM_RoleValue_Register+2,OwnerID())				--��۪OB�g�i���w�S
	BeginPlot( PREANT , "LuaS_423356_22" , 0 )						--�إX���w�S�]���j���ˬd�A�۪OB���b�N�R��
	DisableQuest( PREANT , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(PREANT , false )
	WriteRoleValue( PREANT ,EM_RoleValue_IsWalk , 1 )

	sleep(10)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_1]" , 3 )							--��Q����...
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_2]" , 3 )							--���ڹL�h�A�c�P��u����q�j�j...
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_3]" , 3 )							--�����O�p���t���C
	sleep(30)
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( PREANT , "[SC_423356_4]" , 3 )							--�p���D...�ڷ|�O�@�p...
	sleep(20)
	CastSpell( BOX, PREANT , 491923)							--�S��
	sleep(10)
	AddBuff( PREANT, 506135, 1 , -1 )							
	PlayMotion( PREANT,ruFUSION_ACTORSTATE_ATTACK_2H)
	Yell( PREANT , "[SC_423356_5]" , 3 )							--�ڡI
	sleep(20)
	DelObj(PREANT)									--<�w�S�Jù�ܦ��¼v>
	local BLACK = Lua_DW_CreateObj("flag" ,115990,780691,1,1)				--���Ͷ¼v�A�s���n���I
	WriteRoleValue( BLACK,EM_RoleValue_Register+2,OwnerID())				--��۪OB�g�i�¼v
	BeginPlot( BLACK , "LuaS_423356_22" , 0 )						--�إX�¼v�]���j���ˬd�A�۪OB���b�N�R��
	DisableQuest( BLACK , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(BLACK , false )
	WriteRoleValue( BLACK ,EM_RoleValue_IsWalk , 0 )
	sleep(20)
	
	Yell( BLACK , "[SC_423356_6]" , 3 )							--�¼v�G�Ӧ��I�S�Q�ѯ}�A���M�h�I
	sleep(10)
	LuaFunc_MoveToFlag( BLACK,780691,2,0)						--<�¼v�I��.����>
	CancelBuff(TargetID() , 507159)
	sleep(20)
	SetFlag( TargetID() , 544262 , 1 )							--�������X��
	WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
	DelObj(OwnerID())
end

function LuaS_423356_Range_CHECK()
	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local Num
	for i = 0 , 50 , 1 do
		Num = 0
			if	CheckAcceptQuest( player , 423356) == true	and
				CheckFlag( player , 544330) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
	Delobj( OwnerID() )
end


--function LuaS_423356_11()
--	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
--	local stone =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
--	for i = 1, 40 , 1 do									--��ưt�X�@���վ�
--		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423356)==false	then
--			CancelBuff(player , 507159)
--			DelObj(OwnerID())
--			WriteRoleValue( stone , EM_RoleValue_Register+1 , 0 )
--			break
--		end
--		sleep(10)
--	end
--end

function LuaS_423356_22()
	local STONEB =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	for i = 1, 40 , 1 do									--��ưt�X�@���վ�
		if  CheckID( STONEB ) == false	then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end

function LuaS_423356_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423356)==false )	then
		if 	CheckBuff( OwnerID(), 507159) == true	then
			CancelBuff( OwnerID() , 507159)  
		end
		return false
	end
	local STONEB= {}
	STONEB= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(STONEB)-1 do
		if	ReadRoleValue(STONEB[i] , EM_RoleValue_OrgID) == 115991	
			or	ReadRoleValue(STONEB[i] , EM_RoleValue_OrgID) == 115794
			then
			return false
		end
		if	i == table.getn(STONEB)	then
			return true
		end
	end
end

function LuaS_423356_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507159)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544330, 0 )
end



--423358
--�I�����~�e�ˬd�G
function Lua_423358_before()
	if	(CheckAcceptQuest(OwnerID(),423358)==true )and( CheckCompleteQuest( OwnerID(),423358)==false) and	CheckFlag( OwnerID() , 544263) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			if	CountBodyItem(OwnerID(),207700) > 0 	then
				return true
				else
				ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423358_0]",0)	 --�A���W�S���P��ë��I
				ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423358_0]",0)	 --�A���W�S���P��ë��I
				return false
			end
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --�ؼХ��b���L��
		return false
		end
	else
	return false
	end
end

--�I�����~��G
function Lua_423358_after()
	if 	CheckAcceptQuest( OwnerID() , 423358) == true	and	(CheckFlag( OwnerID(), 544263)==false)	and
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then	
		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		DelBodyItem(OwnerID(), 207700, 1 )				--�P��ë��	
		AddBuff( OwnerID() , 507160, 1 , 30 )				--CLIENT�P�_��507160	
		local WATERB = LuaFunc_CreateObjByObj (116006, TargetID())				--116006�r������B	 
		WriteRoleValue( WATERB ,EM_RoleValue_Register+2,TargetID())				--��WATER�g�iWATERB
		WriteRoleValue( WATERB ,EM_RoleValue_Register+3,OwnerID())				--�⪱�a�g�iWATERB
		BeginPlot( WATERB , "LuaS_423358_11" , 0 )						--��WATERB�j���ˬd--���a���b�N�R��WATERB
		BeginPlot( WATERB  , "Lua_423358_loop" , 0 )
		else
		return false
	end
	return true
end

function Lua_423358_loop()
	local WATER=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423358_1]",0)				--......
	sleep(20)
	ScriptMessage(TargetID(),TargetID(), 2, "[SC_423358_2]",0)				--......�H
	sleep(20)
	local BODO = Lua_DW_CreateObj("flag" ,115803,780691,3,1)				--115803�i�h�A780691�A3
	DisableQuest( BODO , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(BODO , false )
	WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODO,EM_RoleValue_Register+3,OwnerID())				--��WATERB�g�i�i�h
	BeginPlot( BODO	, "LuaS_423358_22" , 0 )						--���i�h�j���ˬd--WATERB�N�R���i�h
	PlayMotion(  BODO ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	Yell( BODO , "[SC_423358_3]" , 3 )							--�i�h�G�y�y...�y�I 
	sleep(20)
	PlayMotion(  BODO ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	sleep(10)
	AdjustFaceDir(BODO , TargetID(), 0 )
	Yell( BODO , "[SC_423358_4]" , 3 )							--�i�h�G�x�H�A�H�P��ë��H 
	sleep(20)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_CAST_SP02)
	Yell( BODO , "[SC_423358_5]" , 3 )							--�i�h�G�ڡI������ 
	sleep(20)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Yell( BODO , "[SC_423358_6]" , 3 )							--�i�h�G�A�O�n�å�I��ܡH�n���F�B�n�����쪺�n�å�I 
	sleep(30)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( BODO , "[SC_423358_7]" , 3 )							--�i�h�G��...���ڷQ�Q�A�̬O��򻡪�...
	sleep(30)
	PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( BODO , "[SC_423358_8]" , 3 )							--�i�h�G�u�ܺa���ݨ�A�I�v��ܡH[$playername]�I 
	sleep(20)
	SetFlag( TargetID() , 544263 , 1 )							--�������X��
	CancelBuff(TargetID() , 507160)
	DelObj(OwnerID())
	WriteRoleValue( WATER , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423358_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	for i = 1, 30 , 1 do									--��ưt�X�@���վ�
		if  CheckID( player ) == false	or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423358)==false	then
			CancelBuff(player , 507160)
			DelObj(OwnerID())
			WriteRoleValue( WATER , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423358_22()
	local WATERB=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	for i = 1, 30 , 1 do									--��ưt�X�@���վ�
		if  CheckID( WATERB) == false	then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end


--423359--��e���ϥί��־���
--�ϥΪ��~�e�ˬd�G(���ȡB�X�СB���L�H�b�ѡB����w��<���S���������~>)
function LuaS_423359_0()	
	if	CheckAcceptQuest( OwnerID() , 423359 ) == true	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				if	CheckFlag( OwnerID() , 544264 ) == true	then
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423359_0]" , 0 ) 	--�A�w�g�ϥιL���־���
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423359_0]" , 0 ) 
					return false
				end
				if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 115805	then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--�ؼФ����T
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
					return false 
				end

				local BWATER =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,115805, 70 )	
				if Type(BWATER) == "number" and CheckID(BWATER) == false	then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 )	--�A������a��@�I�I
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
					return false 
				end
				if	(CountBodyItem( OwnerID(),207718) >0) and CheckFlag( OwnerID() , 544264 ) ==false	then
					UseItemDestroy( OwnerID() , 207718 )
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	--�A���ݭn�ϥΦ����~
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
					return false 
				end
		else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --�ؼХ��b���L��
			return false
		end
		
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 			--�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
		return false 
	end
end

--��l�@��
function LuaS_115805()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP , true )				-- ����ܦ��
end


--���\�ϥΪ��~
function LuaS_423359_1()
	if	CheckID( TargetID() ) == true then
		WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
		local WATERB = LuaFunc_CreateObjByObj (116009, TargetID())			--116006�h�A����B
			SetModeEx( WATERB , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
		 AddBuff( OwnerID() , 507161, 1 , 60 )						--CLIENT�P�_��507161
		WriteRoleValue( WATERB ,EM_RoleValue_Register+2,TargetID())			--��WATER�g�iWATERB
		WriteRoleValue( WATERB ,EM_RoleValue_Register+3,OwnerID())			--�⪱�a�g�iWATERB
		BeginPlot( WATERB , "LuaS_423359_11" , 0 )					--��WATERB�j���ˬd--���a���b�N�R��WATERB
		BeginPlot( WATERB , "LuaS_423359_2" , 0 )							
	end
end
	
function LuaS_423359_2()	
		local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	
		local BODO = Lua_DW_CreateObj("flag" ,115806,780691,5,1)			--115806�i�h�B�X�l�s��5
		DisableQuest( BODO , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled(BODO , false )
		WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( BODO,EM_RoleValue_Register+3,OwnerID())			--��BWATER�g�i�i�h
		BeginPlot( BODO	, "LuaS_423359_22" , 0 )					--���i�h�j���ˬd--���a���b�N�R���i�h
		AddBuff( OwnerID() , 505067, 1 , 5)	
		local NOF = Lua_DW_CreateObj("flag" ,115881,780691,4,1)			--115881�ժܡB�X�l�s��4--�إX�b�z�����ժ�
		DisableQuest( NOF , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled(NOF , false )
		WriteRoleValue( NOF ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( NOF,EM_RoleValue_Register+3,OwnerID())			--��BWATER�g�i�ժ�
		BeginPlot( NOF, "LuaS_423359_22" , 0 )					--���ժܰj���ˬd--BWATER���b�N�R���ժ�
		sleep(20)
		PlayMotion( NOF ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
		CastSpell( NOF , NOF , 495975)						--�X�{�S��
		sleep(20)
		PlayMotion( NOF ,ruFUSION_ACTORSTATE_BUFF_END)
		sleep(10)
		DelObj(NOF)
		sleep(20)
		ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423359_1]" , 0 ) 			--�e����M�X�{�@�ӥb�z�����v�A�H�Y�������u......
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423359_1]" , 0 ) 
		sleep(10)
		PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_SP01)
		Yell( BODO , "[SC_423359_2]" , 3 )						--�i�h�G�ڡI�س�������F�ܡH
		SetFlag( TargetID() , 544264 , 1 )						--���X��
		sleep(20)
		--PlayMotion( BODO ,ruFUSION_ACTORSTATE_BUFF_END)
		Yell( BODO , "[SC_423359_3]" , 3 )						--�i�h�G�n�å�]���ݨ��H���n���X�{�F�I
		sleep(20)
		PlayMotion( BODO ,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Yell( BODO , "[SC_423359_4]" , 3 )						--�i�h�G�i�O���W�����F��
		sleep(20)
		CancelBuff(TargetID() , 507161)
		DelObj(OwnerID())
		WriteRoleValue( WATER  , EM_RoleValue_Register+1 , 0 )
end

function LuaS_423359_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	local WATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	
	for i = 1, 30 , 1 do														--��ưt�X�@���վ�
		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(player ,423359)==false	then
			CancelBuff(player , 507161)
			DelObj(OwnerID())
			WriteRoleValue(WATER , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423359_22()	
	local BWATER =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )		 
	for i = 1, 30 , 1 do														--��ưt�X�@���վ�
		if	CheckID( BWATER ) == false  then
			DelObj(OwnerID())
			break
		end
		sleep(10)
	end
end

--423361
function LuaS_423361_0()--(�I���i�h�A�t��)
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423361)==true )and( CheckCompleteQuest( OwnerID(),423361)==false) and	CheckFlag( OwnerID() , 544265) ==false	then
		if	 CountBodyItem(OwnerID(),207719) > 0 	then
			if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423361_0]","LuaS_423361_1",0)	--�ڭ̭n�⪫�~�e�i�h����Q�����F�H
				else
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423361_0]","LuaS_423361_2",0)	--�ڭ̭n�⪫�~�e�i�h����Q�����F�H
			end
		else
		ScriptMessage(OwnerID() , OwnerID() , 1 , "[SC_423361_16]" , 0 )	--�A���W�S��[207719]
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423361_16]" , 0 )	
		return false 
		end
	end
end

function LuaS_423361_2()
	SetSpeakDetail(OwnerID(),"[SC_423361_1]")	--�i�h�G��...�س����Q���z�A�o��񪺶Z���A�n���F�����򤣦ۤv�i�h�H     
end

function LuaS_423361_1()
	closespeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue ( TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(), "LuaS_423361_3" , 0 )
	end
end

function LuaS_423361_3()
	if 	CheckAcceptQuest( TargetID() , 423361) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(TargetID() , 544299, 1 )					--544299�P�_�Z����		
		AddBuff(TargetID() , 507162 , 1 , 180 )  						
	end
	local BODOB = LuaFunc_CreateObjByOBj(115882, OwnerID() )				--�X�{�t�����i�h
--	local BODOB = Lua_DW_CreateObj("flag" ,115882,780691,6,1)				--115882�i�h�B�X�l�s��6
	DisableQuest( BODOB , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(BODOB , false )
	WriteRoleValue( BODOB ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODOB,EM_RoleValue_Register+2,TargetID())				--�⪱�a�g�i�i�h
	WriteRoleValue( BODOB,EM_RoleValue_Register+3,OwnerID())				--���i�h�g�i�t���i�h
	BeginPlot(BODOB, "LuaS_423361_Range_CHECK" , 0 )					--�Z���ˬd�I�I
	BeginPlot(BODOB, "LuaS_423361_4" , 0 )
end

function LuaS_423361_4()
--OwnerID�OBODOB 
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QBODO  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	
	local ELY = Lua_DW_CreateObj("flag" ,115883,780692,1,1)			--115883��Q�����B�X�l�s��780692�B1
	DisableQuest(  ELY , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())			--��t���i�h�g�i�t����Q����
	BeginPlot(ELY, "LuaS_423361_MO_CHECK" , 0 )				

	sleep(10)
	AdjustFaceDir(OwnerID(), ELY, 0 )
	Yell( OwnerID() , "[SC_423361_2]" , 3 )					--�i�h�G��I��		
	sleep(10)
	Tell(player ,OwnerID(),"[SC_423361_3]")					--�����ܱK���a�G�n���F�M�̭������F�n�[�F�ܡH
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423361_4]")					--�����ܱK���a�G�b�M�l��
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID(), 780691,7,0)
	LuaFunc_MoveToFlag(OwnerID(), 780691,8,0)
	AdjustFaceDir(ELY, OwnerID(), 0 )
	sleep(10)
	PlayMotion(ELY,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(  ELY , "[SC_423361_5]" , 3 )						--��Q�����G...�p�i�h�H���|�X�{�b�o�̡H
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_6]" , 3 )						--��Q�����G���D...�S�O�ۼv�H
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( OwnerID() , "[SC_423361_7]" , 3 )					--�i�h�G�i�h���O�ۼv�A�س����O�u���I
	sleep(20)
	Yell( OwnerID() , "[SC_423361_8]" , 3 )					--�i�h�G�n���F�b�~���A�L�гس��������~���p�C
	sleep(20)
	DelBodyItem(player  , 207719, 1 )
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_9]" , 3 )						--��Q�����G��������...�o�O...�ڬ��w�S�Jù...
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_10]" , 3 )						--��Q�����G�S����...���e�����A�O�w�S�Jù...���O�A���|...
	sleep(20)
	Yell( OwnerID() , "[SC_423361_11]" , 3 )					--�i�h�G���F...�ͯf�F�ܡH
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( OwnerID() , "[SC_423361_12]" , 3 )					--�i�h�G�ͯf�F�A�ҥH�~�|��n���F�n�[�H
	sleep(30)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)		--<��Q�����n�Y>
	Yell(  ELY , "[SC_423361_13]" , 3 )						--��Q�����G��...�ڭ̨S��...
	sleep(20)
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  ELY , "[SC_423361_14]" , 3 )						--��Q�����G�p�i�h�A���ڨ��L�C
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( OwnerID() , "[SC_423361_15]" , 3 )					--�i�h�G�n�I�����A�س����h�Цn���F�i�ӡI
	sleep(20)
	LuaFunc_MoveToFlag(OwnerID(), 780693,3,0)
	sleep(10)
	BeginPlot( OwnerID() , "LuaS_423361_Finish" , 0 )	
	sleep(20)
	Delobj( ELY )
	writerolevalue(QBODO, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
	CancelBuff(player  , 507162)
end

function LuaS_423361_Range_CHECK()
	local QBODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 100 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423361) == true	and
				CheckFlag( play , 544299) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QBODO, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end

function LuaS_423361_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423361)==false )	then
		if 	CheckBuff( OwnerID(), 507162) == true	then
			CancelBuff( OwnerID() , 507162)  
		end
		return false
	end
	local BODO= {}
	BODO= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(BODO)-1 do
		if	ReadRoleValue(BODO[i] , EM_RoleValue_OrgID) == 115882	then
			return false
		end
		if	i == table.getn(BODO)	then
			return true
		end
	end
end

function LuaS_423361_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507162)
	DelBodyItem(OwnerID(), 207719, 1 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544299, 0 )
end

function LuaS_423361_Finish()
	local play = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	if	CheckAcceptQuest( play , 423361) == true	and
		CheckFlag( play  , 544299) == true		then
		SetFlag(play  , 544265, 1 )
		CancelBuff( play  , 507162)
	end
end

function LuaS_423361_MO_CHECK()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--�t���i�h
	for i = 0 , 100 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end