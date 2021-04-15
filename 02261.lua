function andrus_skillcheck_01()
	local Owner=OwnerID()
	local Target=TargetID()
	if Target~=nil then
		if ReadRoleValue(Target,EM_RoleValue_OrgID)==105151 then  --�b�m
			sleep(10)
			KillID(Owner,Target)
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------

function andrus_bow_1H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_BOW, ruFUSION_ACTORSTATE_COMBAT_BOW)
end

function andrus_bow_2H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN, ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN)
end

function andrus_bow_3H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP,ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP)
end

function andrus_cost_4H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_END, ruFUSION_ACTORSTATE_ATTACK_BOW_END)
end

function Luadr_DW_Dead() --����+���b
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	AddBuff(OwnerID(),503165,0,-1)
end

function dr_DW_Idle_loop()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(25)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(25)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end

function Luadr_motion_01() --����]
	local obj = OwnerID()
	SetDefIdleMotion(obj,ruFUSION_MIME_RUN_BACKWARD) 
end
-------------------------------------------------------------------------------------------------------------------------
function andrus_camp_01()                                --�����ഫ
	local  Owner=OwnerID()
	local Target=TargetID()
		if Target~=nil then
			if ReadRoleValue(Target,EM_RoleValue_OrgID)==102815 then
			SetRoleCamp( OwnerID() , "good" )
			end
		end
end
------------------------------------------------------------------------------------------------------------------------
 function andrus_changecamp_buff_01()
	local Owner = OwnerID()
	AddBuff(Owner,506982,0,-1)
end

function andrus_changecamp_buff_02()
	local Owner = OwnerID()
	CancelBuff(Owner,506982,0,-1)
end
----------------------------------------------------------------------------------

function andrus_speakdetail_01()		
	LoadQuestOption( OwnerID() ); 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117721_01]", "andrus_speakdetail_02", 0 );
End

function andrus_speakdetail_02()
	SetSpeakDetail( OwnerID(), "[SC_117721_02]" ); 
end

------------------------------------------------------------------------------------------------------------------------

function andrus_CheckFlag117744_01()
	local own= ownerID()
	local tar = targetID()
	LoadQuestOption( own )
	if  CheckQuest(Own,424051,0)==true   then  
		AddSpeakOption( Own, tar, "[SC_117744_01]", "andrus_CheckFlag117744_02", 0 );  --��ť
	else
		LoadQuestOption(own)
	end
end 

function andrus_CheckFlag117744_02()			--�x�p���_�I��
		SetSpeakDetail(ownerID(), "[SC_117744_02]" )
		GiveBodyItem( ownerID(),544833, 1 ) 
end


function andrus_CheckFlag117744_03()
	local own= ownerID()
	local tar = targetID()
	LoadQuestOption( own); 
	if  CheckQuest(Own,424051,0)==true then  
		AddSpeakOption( own, tar, "[SC_117744_01]", "andrus_CheckFlag117744_04", 0 );  --��ť
	else
		LoadQuestOption(own)
	end
end 

function andrus_CheckFlag117744_04()			--���ê��_�I��
		SetSpeakDetail( ownerID(),"[SC_117744_03]" )
		GiveBodyItem(ownerID(),544834, 1 ) 
end

------------------------------------------------------------------------------------------------------------------------

function andrus_CheckFlag117721_01()
	local own= ownerID()
	local tar = targetID()
	if  CheckCompleteQuest(Own,424045)==false then  
		LoadQuestOption( Own ); 
		AddSpeakOption( Own, Tar, "[SC_117721_01]", "andrus_CheckFlag117721_02", 0 );  --�q�|���d�_�n!?
	else
		LoadQuestOption(own)
	end
end 

function andrus_CheckFlag117721_02()			--�ȷ�
	SetSpeakDetail( OwnerID(), "[SC_117721_02]" )
end

function andrus_CheckFlag117721_03()
	local own= ownerID()
	local tar = targetID()
	if  CheckCompleteQuest(Own,424047)==false then  
		LoadQuestOption( Own ); 
		AddSpeakOption( Own, Tar, "[SC_117721_01]", "andrus_CheckFlag117721_04", 0 );  --�q�|���d�_�n!?
	else
		LoadQuestOption(own)
	end
end 

function andrus_CheckFlag117721_04()			--�~��
	SetSpeakDetail( OwnerID(), "[SC_117721_03]" )
end

------------------------------------------------------------------------------------------------------------------------
function andrus_range_01()		--���d�}��
	SetPlot( OwnerID(),"range","andrus_keyitem_01",40 )
end	

function andrus_keyitem_01()			
	local own = OwnerID()
	local tar  = TargetID()
	local A = CheckQuest( own,424044, 0 )
	local B =CheckFlag(own,544837)
	if  A == true and B == false then  --�T�{�O�ݬO�_�����A�_�����n���~&����
		GiveBodyItem( own,544837, 1 ) 
		Say(own,"[SC_117721_04]")
	else
		return    --�w�����N��������
	end 
end
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
function dr_z14_cast01()
	local own=OwnerID()
	PlayMotion(own, ruFUSION_ACTORSTATE_BUFF_BEGIN )
	AddBuff(own,509383,0,-1)
end


function LuaI_117885_01()
	local obj = OwnerID()
	local buff = checkbuff(obj,509383)
	CastSpell(obj,obj,497182)
	if buff == true then
		PlayMotion(obj, ruFUSION_ACTORSTATE_BUFF_BEGIN )
	end
end



