---------------------------------------------------------------------------
--424111  �j�L�ڪ��_�I��
---------------------------------------------------------------------------
function LuaPG_424111_talktoJ()  ----��p��������
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_01]")       ----�K�K���O�ڷQ�~�A�K�K
		SetFlag(OwnerID() ,544879, 1 )
	elseif
	
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then   ----���p�����ܤ�
		SetSpeakDetail(OwnerID(),"[SC_424114_J]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_J_flag",0)   ----�H�����ʧ@

	else
		LoadQuestOption( OwnerID() )

	end

end

function LuaPG_424111_talktoR()  ----��Ҵ�����
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_02]")       ----�K�Ať���F�ܡH
		SetFlag(OwnerID() ,544882, 1 )

----���Ҵ��ܤ�
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_R]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_R_flag",0)   ----�H�����ʧ@
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaPG_424111_talktoL()  ----��ܴ�����
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_03]")       ----�Q�ѩM�ڤ@�_.......
		SetFlag(OwnerID() ,544881, 1 )

----���ܴ��ܤ�
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_L]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_L_flag",0)   ----�H�����ʧ@
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaPG_424111_talktoD()  ----�򤦹y����
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_04]")       ----�A��򤣩Ȧ����ٯd�b�o�̡H
		SetFlag(OwnerID() ,544883, 1 )

----�����y�ܤ�
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_D]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_D_flag",0)   ----�H�����ʧ@
	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaPG_424111_01()  ----�򴣺����i����
----�O�_����j�a���L��
	if CheckAcceptQuest(OwnerID(),424111)==true and CheckCompleteQuest( OwnerID() , 424111) == false  
	and  CheckFlag(OwnerID(),544879 )==true
	and  CheckFlag(OwnerID(),544881 )==true 
	and  CheckFlag(OwnerID(),544882 )==true
	and  CheckFlag(OwnerID(),544883 )==true  then
		SetSpeakDetail(OwnerID(),"[SC_424111_05]")       
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_06]","LuaPG_424111_03",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_07]","LuaPG_424111_02",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_08]","LuaPG_424111_03",0)  

	elseif
	 (CheckAcceptQuest(OwnerID(),424118)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)

	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaPG_424111_02()
	CloseSpeak( OwnerID())
	SetFlag(OwnerID() ,544880, 1 )
	LoadQuestOption( OwnerID() )
end

function LuaPG_424111_03()
	SetSpeakDetail(OwnerID(),"[SC_424111_09]")
end

---------------------------------------------------------------------------
--424114  �s�W�r���ѰO�a�I
---------------------------------------------------------------------------
function LuaPG_424114_01()  ----�ˬd�O�_���F��
	if  CountBodyItem( TargetID(), 209267 )~=4 then
	
	repeat	
		GiveBodyitem( TargetID(), 209267, 1 )
	until CountBodyItem( TargetID(), 209267 )==4
	
	end
end

function LuaPG_424114_J_flag()  ----���p������flag
	CloseSpeak( OwnerID())  ----�������

	if	CheckFlag(OwnerID(),544884)==false	then	
		DelBodyItem( OwnerID(), 209267, 1 )   ----�l���@�ӿ�Ѥ���
		SetFlag(OwnerID() ,544884, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )	
	end
end

function LuaPG_424114_R_flag()  ----���Ҵ���flag
	CloseSpeak( OwnerID())  ----�������

	if	CheckFlag(OwnerID(),544885)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----�l���@�ӿ�Ѥ���
		SetFlag(OwnerID() ,544885, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_L_flag()  ----���ܴ���flag
	CloseSpeak( OwnerID())  ----�������

	if	CheckFlag(OwnerID(),544886)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----�l���@�ӿ�Ѥ���
		SetFlag(OwnerID() ,544886, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_D_flag()  ----�����y��flag
	CloseSpeak( OwnerID())  ----�������

	if	CheckFlag(OwnerID(),544887)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----�l���@�ӿ�Ѥ���
		SetFlag(OwnerID() ,544887, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_02(Target)  ----�ܤ��ᰵ���ʧ@	
	PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_DRINK)    ----�ܤ�
	Sleep(15)
	PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)    ----�n�Y
	Sleep(10)
	local X=Rand(3)+1
	local talktable={"[SC_424114_02]","[SC_424114_03]","[SC_424114_04]"}
	Say(Target, talktable[X] )   ----�H�����̸�
end

---------------------------------------------------------------------------
--424123  �����D��
---------------------------------------------------------------------------
----�����᪺�t��
function LuaPG_424123_after_acting()
	local NPC = OwnerID()
	local player = TargetID()
	local NUM = ReadRoleValue(NPC,EM_RoleValue_Register1)

	if NUM == 0 then
		CallPlot(NPC , "LuaPG_424123_after_acting_01" , NPC , player)	
	else
		LoadQuestOption(player)
	end
end

function LuaPG_424123_after_acting_01()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,999) --�}�l�t�X���аO
	CloseSpeak(TargetID()) --���O����

----��V�Yflag
	FA_FaceFlagEX(OwnerID(), 780914 , 1)
	WriteRoleValue(OwnerID()  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( OwnerID() , 780914,1,0 ,1) --�o�O�j��  ��F�~�]�U�@��


----�t��
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)  ----�u�@��

----ScriptMessage�G�շ�ȹ϶P�}�l�s�@�ľ�
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_424123_AFTER_ACTING]",  "0xffbf0b2b"  )
----SAY(TargetID(),"00")
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_424123_AFTER_ACTING]",  "0xffbf0b2b"  )  
	
	Sleep(40)

	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_NORMAL )	-- ���ܹw�]�ʧ@ �@��
	WriteRoleValue(OwnerID()  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( OwnerID() , 780914,2,0 ,1)	

	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0) --�����t�X���аO
end

---------------------------------------------------------------------------
--424124  ù�����S���]��
---------------------------------------------------------------------------
----��o���~
----��d���~��ϥΪ��d��@��
function LuaPG_424124_medicine_use()   ----�o�ӽd��~�i�ϥΪ��~
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	local CheckOver = false   ----�P�_���W
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==117935    then   ----�����Ω�117935������I
			CheckOver = true    ----���}�P�_
			break
		end
	end
	if	CheckOver == true	then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424124_MEDICINE_USE]", C_Red )
		return false
	end
end

function LuaPG_424124_medicine_range()
	AddBuff(OwnerID(),509330,1,30)     ----�[�Wbuff�A����
	BeginPlot(OwnerID(),"LuaPG_424124_placelimit",0)
end




----�ҥj�]�j�M
function LuaPG_424124_Archaeology()	
	local ttable = {}  --�ХX�@��table�˭nsearch��npc
 	ttable = SearchRangeNPC ( OwnerID() , 100 )  --search�g��100�����Ҧ�npc
	local NUM=table.getn(ttable)
	for i=0 , NUM-1 do
		local X =ReadRoleValue(ttable[i],EM_RoleValue_OrgID) 
		if X == 117880 and CountbodyItem( OwnerID(), 209390 )==0 then
		SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
		elseif X == 117933 and CountbodyItem( OwnerID(), 209390 )==0 then
		SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
		end
	end
end


----�I����^��scriptm�Mreturn1
function LuaPG_424124_wrong_target()	
	if (CheckAcceptQuest(OwnerID(),424124)==true )and( CheckCompleteQuest( OwnerID() , 424124) == false) 
	and	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==117933	then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_424124_WRONG_TARGET]",  "0xffbf0b2b"  )
		ScriptMessage( TargetID(), OwnerID(), 0, "[SC_424124_WRONG_TARGET]",  "0xffbf0b2b"  )  
	end
	return 1  ----�קK�I�������O�����
end


function LuaPG_424124_placelimit()
	for i=1, 90 ,1 do
		if	DW_CheckMap(OwnerID(),419)==false	then	--����a�bù�����S�A���}�N����
			Cancelbuff( OwnerID(), 509330 )
			break
		end
		Sleep(10)
	end
end


---------------------------------------------------------------------------
--424127  �}�޸̪���s��
---------------------------------------------------------------------------
function LuaPG_424127_decided_location()
	if CheckAcceptQuest(OwnerID(),424127)==true and CheckCompleteQuest( OwnerID() , 424127) == false   then
		SetSpeakDetail(OwnerID(),"[SC_424127_DECIDED_LOCATION]")       
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_01]","LuaPG_424127_change_location_before",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_02]","LuaPG_424127_02",0)  

	else
		LoadQuestOption( OwnerID() )
	end

end


function LuaPG_424127_02()
	SetSpeakDetail(OwnerID(),"[SC_424127_DECIDED_LOCATION_03]")      
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_01]","LuaPG_424127_change_location_before",0)  
end



function LuaPG_424127_change_location_before()   ----�S�ĩM�ǰe
	CloseSpeak(OwnerID()) --���O����
	BeginPlot(TargetID(),"LuaPG_424127_change_location_before_01",0)
end

function LuaPG_424127_change_location_before_01()  
	local player=TargetID()

	Sleep(10)
	Say(OwnerID(),"[SC_424127_CHANGE_LOCATION_BEFORE]")
	Sleep(15)
	Say(OwnerID(),"[SC_424127_CHANGE_BEFORE_01]")
	Sleep(15)

	ChangeZone( TargetID() , 14 , 0 , 13481.8, -3.0 , 11560.0 , 4.6 )  ----�ǰe��}�ޤf
	 --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	SetFlag(TargetID() ,544904, 1 )	
	
end


---------------------------------------------------------------------------
--424128  ���K���H������
---------------------------------------------------------------------------
function LuaPG_424128_talking_with_Mimir_01()      
	if CheckAcceptQuest(OwnerID(),424128)==true and CheckFlag( OwnerID(), 544903 ) == false   then
		SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_01]")       ----�ݧa�A�໡���ڴN�|�i�D�A
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_01]","LuaPG_424128_talking_with_Mimir_02",0)    ----�o�Ӭ}�޸̵o�ͪ���
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_02]","LuaPG_424128_talking_with_Mimir_03",0)   ----������n�b�}�޸�

	else
		LoadQuestOption( OwnerID() )
	end

end


function LuaPG_424128_talking_with_Mimir_02()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_02]")       ----�n���o�Ӭ}�ޡA�N�o�q�ԯ����Ȫ������̨��W�}�Y�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_02]","LuaPG_424128_talking_with_Mimir_03",0)    ----������n�b�}�޸�
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_04]","LuaPG_424128_talking_with_Mimir_04",0)   ----�A�̪���s�i�סH
end


function LuaPG_424128_talking_with_Mimir_03()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_03]")       ----��������o�Ӭ}�ޡA��M�O���çڭ̰��������
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_01]","LuaPG_424128_talking_with_Mimir_02",0)    ----�o�Ӭ}�޸̵o�ͪ���
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_04]","LuaPG_424128_talking_with_Mimir_04",0)   ----�A�̪���s�i�סH  
end


function LuaPG_424128_talking_with_Mimir_04()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_04]")       ----������u�����A�A���s������ڡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_05]","LuaPG_424128_talking_with_Mimir_05",0)    ----������|�o�ˡH
end


function LuaPG_424128_talking_with_Mimir_05()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_05]")       ----���o�ڥi������A�U�w�סC
	SetFlag(OwnerID() ,544903, 1 )	
end


---------------------------------------------------------------------------
--424129  �M�~�U���P
---------------------------------------------------------------------------
----Gill���W���d��@��
function LuaPG_424129_Gill_range_01() 
	SetPlot( OwnerID(),"range","LuaPG_424129_Gill_range_02",60 )  ----�d��@���}�l
end


function LuaPG_424129_Gill_range_02()
	if	CheckAcceptQuest(OwnerID(),424129)==true	and    CheckCompleteQuest(OwnerID(),424129)==false   then
		SetFlag(OwnerID(),544936,1)
	end
end


---------------------------------------------------------------------------
--424130  ���H�ոլ�
---------------------------------------------------------------------------
----�������ȡAGill�^�h������઺��t�@���A780914��3�B4����
function LuaQ_PG_424130_Gill_Accept() 
	SetFlag(TargetID(),544956,1)----���t����flag
	local player=TargetID()
	local NPC=OwnerID()
	
	if	ReadRoleValue(NPC,EM_RoleValue_Register1)==0	then  --�ˬd EM_RoleValue_Register1
		CallPlot(NPC , "LuaQ_PG_424130_Gill_Accept_02", player,NPC )  
	end	
end


function LuaQ_PG_424130_Gill_Accept_02(player,NPC)
	
	local Gill=DW_CreateObjEX("obj",117945,NPC)   ----�t���ΦN���A�ͩ���

	WriteRoleValue(Gill,EM_RoleValue_Register1,999) --�}�l�t�X���аO

	Say(Gill,"[SC_424130_01]")
	DW_MoveToFlag( Gill , 780914 ,4,0 ,1) --�o�O�j��  ��F�~�]�U�@��

	DelObj(Gill) --�R��

	SetFlag(player,544956,0)----�����t����flag
	WriteRoleValue(Gill,EM_RoleValue_Register1,0) --�����t�X���аO
end


---------------------------------------------------------------------------
--424125  ��C�򪺿��@
---------------------------------------------------------------------------
function LuaPG_424125_Tip()
	SetPlot(OwnerID(),"range","LuaPG_424125_Tip_01",600)
end

function LuaPG_424125_Tip_01()	
	if	CheckCompleteQuest( OwnerID() , 424124) == true	and	CheckAcceptQuest(OwnerID(),424126)==false	
		and	CheckFlag(OwnerID(),545023 )==false	then	
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424125_TIP]",  "0xffbf0b2b"  )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_424125_TIP]",  "0xffbf0b2b"  )
	end
end

--function LuaPG_424125_Complete()
--	SetFlag(TargetID(),545023,1)
--end

--function LuaPG_117881_dead()
--	if	CheckFlag(OwnerID() , 545023) == true	then
--		SetSpeakDetail(OwnerID(),"[SC_424125_COMPLETE]") 
--	else
--		LoadQuestOption(OwnerID())
--	end
--end