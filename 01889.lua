function LuaI_423382_207452_Check()		--���b���~�ϥΤU��<�ˬdlua>���U�C
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423382 ) == false or CountBodyItem( OwnerID() , 207474 ) >= 3 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if OrgID == 0 or ( OrgID ~= 103987) or CheckBuff( TargetID() , 504004 ) == true then
		if OrgID == 103987 then
			if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_0]" , 0 ) --[103987]�w�g���`�F�A�L�k����
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_0]" , 0 )
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_1]" , 0 ) --�A�N[207452]������[103987]
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_1]" , 0 )
				return false
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_2]" , 0 ) --�u��[103987]�|����[207452]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_2]" , 0 )
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[205871]�C
		return false
	end
	
	if 	ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_0]" , 0 ) --[103987]�w�g���`�F�A�L�k����
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_0]" , 0 )
		return false
	end

	if 	ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
		return false
	end
	
	return true
end

function LuaI_207452_Use()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	if GiveBodyItem( OwnerID() , 207474 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 3 )
		--UseItemDestroy( OwnerID() )
	end
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423382_3]" , 0 ) --[103987]�Y�U�A����[207452]
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_3]" , 0 )
	
	SetStopAttack(TargetID())
	Beginplot(TargetID(),"LuaI_207452_Use1",0)
end

function LuaI_207452_Use1()
	Hide(OwnerID())
	local FA = LuaFunc_CreateObjByObj(103559 , OwnerID() )
	
	--SetRoleCamp(FA, "SNPC" )	--��}��
	SetModeEx(FA, EM_SetModeType_Mark , false )	--����npc/monster���аO
	
	SetModeEx(OwnerID(), EM_SetModeType_Mark , false )	--����npc/monster���аO
	SetStopAttack(OwnerID())
	SetDefIdleMotion(FA,ruFUSION_MIME_CAST_LOOP	)
	
	Sleep(30)
--	SetRoleCamp(OwnerID(), "SNPC" )	--��}��
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423382_4]" , 0 ) --[103987]�h�W����ʡC
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423382_4]" , 0 )
	Sleep(30)
	SetDefIdleMotion(FA,ruFUSION_MIME_BUFF_SP01)
	Sleep(30)
	PlayMotion(FA,	ruFUSION_ACTORSTATE_DYING)
	Sleep(30)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423382_5]" , 0 ) --[103987]���`�F
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423382_5]" , 0 )
	WriteRoleValue (FA ,EM_RoleValue_HP,1)
	NPCDead( FA, FA)
	WriteRoleValue (FA ,EM_RoleValue_IsDead,1)
	WriteRoleValue (OwnerID(),EM_RoleValue_IsDead,1)
	Delobj(FA)
--	SetRoleCamp(OwnerID(), "Monster" )	--��}��
	SetModeEx(OwnerID(), EM_SetModeType_Mark , true )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end

--�������ȫ�
function LuaS_423382_USECHECK()	--���b���ȧ���
	if	 CountBodyItem( TargetID(), 207452)>0	 then 
		 DelBodyItem( TargetID(), 207452, 1 )
	end
	
end

--======================================================================================================
--423383
--======================================================================================================

function LuaS_423383_0()
LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423383)==true 	and
		CheckCompleteQuest(OwnerID(),423383)==false	and
		CountBodyItem( OwnerID(), 207453)<10		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_0]","LuaS_423383_1",0)
		--�ڭn�R��ơC
	end
end

function LuaS_423383_1()
	SetSpeakDetail(OwnerID(),"[SC_423383_1]")
	--�A�n�A���ѭn���ʤ���˪���ưڡH 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_2]","LuaS_423383_2",0)
	--�S���r�����ءC
end

function LuaS_423383_2()
	SetSpeakDetail(OwnerID(),"[SC_423383_3]")
	--�N�I�ȤH�u�R�}�����A�ڭ̱q�Ӥ��榳�r����ơA�̪񤣾�o���^�ơA��ƥͷN�@���d�V�A���Ǧ��U�Ȥ��ӥ��U�N��F�A�L�̤p�p�������ݧڪ������A�˯u���ڽ檺��Ʀ��r�����C�u��O���O�ӵ����o�̪��R��A��O���a��I�I�B��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_4]","LuaS_423383_3",0)
	
--���ڤQ�i�a�C
end

function LuaS_423383_3()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID(), 207454)>0	then
		GiveBodyItem( OwnerID() , 207453 , 10 )
		DelBodyItem( OwnerID(), 207454, 1 )
	else
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[207454]:[SC_110497_5]", 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[207454]:[SC_110497_5]", 0 )

	end
	
end
	
	
	
	

--(1)
function Lua_422907()	--���b���Ȫ��~����l�@�����U
	SetPlot( OwnerID(),"touch","Lua_422907_do",30 )--Ĳ�I�@��
end

function Lua_422907_do()
	BeginPlot( TargetID(), "Lua_422907_Get", 0 )--�����˨��@��
end


function Lua_422907_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	local QuestID = 422907 --�һݪ����Ƚs��
	local item = 207445 --��o���~
	local num = 1 --��o�ƶq
	local time = 0 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end

--(2)
function Lua_422907_create()	----���b���Ϊ��󪺪�l�@�����U�Afor�ͪ��� 
	local FlagObjID = 780676  --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local Obj = 115608 --�شӪ���s��
	local ObjNum = math.floor( FlagNum /1)   --�شӪ���ƶq
	local resetTime = 180 --���s�ɶ�(��) 
	local Range = 20	--���󲣥ͦb�X�m���d��
	local Gravity = true --���L���O
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	



--�ΧZ
--(1)
function Lua_422080()	--���b���Ȫ��~����l�@�����U
	SetPlot( OwnerID(),"touch","Lua_422080_do",30 )--Ĳ�I�@��
end

function Lua_422080_do()
	BeginPlot( TargetID(), "Lua_422080_Get", 0 )--�����˨��@��
end


function Lua_422080_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	local QuestID = 422080 			--##�һݪ����Ƚs��
	local item = 207432 			--##��o���~
	local num = 1 					--##��o�ƶq
	local time = 0 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end

--(2)
function Lua_422080_create()	----���b���Ϊ��󪺪�l�@�����U�Afor�ͪ��� 
	local FlagObjID = 780683  --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local Obj = 115615 --�شӪ���s��
	local ObjNum = math.floor( FlagNum / 2 )   --�شӪ���ƶq
	local resetTime = 180 --���s�ɶ�(��) 
	local Range = 20	--���󲣥ͦb�X�m���d��
	local Gravity = true --���L���O
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	

