-----��uSCRIPT-------
function LuaS_423694()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423694) == true  and  CheckFlag(OwnerID(),544604)==false then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423694_0]","LuaS_423694_1",0)--�N�~�H
	end
end

function LuaS_423694_1()
   	SetSpeakDetail(OwnerID(),"[SC_423694_1]")---
	AddSpeakOption(OwnerID(),TargetID()," [SC_423694_2]","LuaS_423694_3",0)-----
 end
function LuaS_423694_3()
   	SetSpeakDetail(OwnerID(),"[SC_423694_3]")---544588
	AddSpeakOption(OwnerID(),TargetID()," [SC_423694_4]","LuaS_423694_4",0)
 end
 function LuaS_423694_4()
   	SetSpeakDetail(OwnerID(),"[SC_423694_5]")---544588  544638
	SetFlag(OwnerID() ,544604, 1 )
 end
-------------------------------------------------------------------------------------------
--------------���W��208515�M208514 �~��ݨ����ӪF��117024�A�]�~���I���I �I����i�H��o�X�� 
function LuaS_423696_USECHECK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if  OrgID == 117024    then	
		if	CountBodyItem( OwnerID(), 208515 )<5 or CountBodyItem( OwnerID(), 208516 )<3 then------
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_1]", 0 )--�ʥF[208515]�M[208516]�I
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_1]", 0 )--
			return -1
		elseif	CountBodyItem( OwnerID(), 208515 )>=5 and CountBodyItem( OwnerID(), 208516 )<3 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_2]", 0 )--�ʥF[<S>208516]�I
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_2]", 0 )--
			return -1
		elseif	CountBodyItem( OwnerID(), 208515 )<5 and CountBodyItem( OwnerID(), 208516 )>=3 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_3]", 0 )--�ʥF[<S>208515]�I
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_3]", 0 )--
			return -1	
		else	
		return 1
		end
	end
	if  OrgID == 117028   then
		return 1	
	end
end
function LuaS_423696_USEOK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if  OrgID == 117024    then	
		if	(CheckAcceptQuest(OwnerID(),423696)==true )and   CountBodyItem( OwnerID(), 208515 )>=5 and CountBodyItem( OwnerID(), 208516 )>=3 then 
			DelBodyItem( OwnerID() , 208515 , 5)
			DelBodyItem( OwnerID() , 208516 , 3)
			SetFlag(OwnerID() ,544638, 1 )
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_4]", 0 )--�������ǨӯS�O���n�T�I
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_4]", 0 )
-----�I��k�N�C		
			return 1
		else
			return -1
		end
	end
	if  OrgID == 117028   then
		GiveBodyItem( OwnerID(), 208517, 1 )
			return 1
	else
			return -1
	end
end

-----

function LuaS_423696()
		SetPlot( OwnerID(),"range","LuaS_423696_1",400)
end
function LuaS_423696_1()
	if	CheckAcceptQuest(OwnerID(),423696)==true  and CheckFlag( OwnerID(),544638)==true  and  ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423696_2" , 0 )
	end
end
function LuaS_423696_2()----104332
	local KK = Lua_DW_CreateObj("flag" ,117027,780809,1,0 )---�إX�@�Ӵx��������NPC���]���C
	MoveToFlagEnabled( KK, false )
	SetModeEx(KK,EM_SetModeType_Gravity,false)
	WriteRoleValue(KK,EM_RoleValue_Y,550)
	SetModeEx(KK,EM_SetModeType_Gravity,false)	
	SetPlot( OwnerID(),"range","",250)
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition( KK, 0 )
	BeginPlot( KK , "LuaS_423696_3" , 0 )
	Callplot( OwnerID(), "LuaS_423696_1_sub",KK)
end
function LuaS_423696_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue(OwnerID() , EM_RoleValue_Register , 0 )
				SetPlot( OwnerID(),"range","LuaS_423696_1",250)
			break
		end
	end
end
function LuaS_423696_3()
	Yell(OwnerID(),"[SC_423696_5]",4)---�˷R���A�o�Ǥ�l���W�A�F�Iemote_applause
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_6]",4)---[116585]�A�A�@�w���o�ܤj�F�a�H
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(45)
	yell(OwnerID(),"[SC_423696_7]",4)---�i���ڤ���˲��ݨ��A�������I
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_8]",4)---��[116999]�@�w��A���U�o�ܦn�A��ܡH
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_9]",4)---�˷R���A�ڸ�A���L�R�@�w�n���X�f��a�H
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_10]",4)---[116585]�A�i���๳�����@�˳o��[��}�f��I
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_11]",4)---[116585]�A�ڪ��D�A�������L�{�@�w�D�`���}���I
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_12]",4)----���A�n���դ@��ơA�ڭ̷R�A�I
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_13]",4)---�ڭ̨ä��O�G�N�Q���A�A�ӬO�G��{�ꤣ�o�����A�k�����a�C
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_14]",4)----�A�n�M�����n�n���۳B�A�������D�H
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_15]",4)-----�]�n�n�n�����U���F���A���ܡH
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_16]",4)------�ɶ����h�F�A�ڪ��k�O�]�u�������o�F�C
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_17]",4)-----�˷R���A�A�n���D���קA���F����A�ڳ�����A����ܡI
PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_APPROVAL   )
	sleep(45)
	yell(OwnerID(),"[SC_423696_18]",4)-----����Q���ڪ��ɭԡA�N���}�o�Ӹ˸m�a�I
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_19]",4)----�b�o�˸m������A��ۧگd���A�B��i���@�šA���֨Ӯ��a�I
	sleep(45)
	yell(OwnerID(),"[SC_423696_20]",4)---�˷R���A�O�o�n�n���U��i�A�s�P�ڪ����@�_�V�O�C
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY  )
	sleep(10)
	delobj(OwnerID())
end
 
function LuaS_423696_4()
	SetFlag(OwnerID() ,544638, 1 )
end