function Lua_na_hannorika_check() --�����������NPC�P�_���ȹD��O�_�w�g���[�ղ��d
local a = CheckCompleteQuest( OwnerID(), 423986 ) --�����������
local b = CheckCompleteQuest( OwnerID(), 423985 )  --�L�k�ܩڪ��n���D
--local c = CheckAcceptQuest( OwnerID(), 423986 )  --�L�k�ܩڪ��n���D
	LoadQuestOption( OwnerID() )
	if a == true and b == false  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_117734_0"), "Lua_na_hannorika_give", 0 ) -- ��A���ڤ@��������ܡH
	end
end



function Lua_na_hannorika_give()
	local X=Countbodyitem( OwnerID(), 209249)
	if  X< 1 then
		Setspeakdetail (OwnerID(), GetString("SC_117734_1") ) --�A����[209249]�˥�F�r�I�o�Ǵ��i�O�ܬöQ���A�ڳo���ٳѤ@�ǡA���I�a�h��[117733]�a�I
		Givebodyitem ( OwnerID(), 209249, 1 )
	else
		Setspeakdetail (OwnerID(), GetString("SC_117734_2") ) --�A���O�w�g����������F�ܡH�@[117733]�٦b���A�A���I�X���e�h���L�a�C
	end
end




function Lua_na_117590_0()--�ۤ��ľ�NPC�P�_���ȹD��O�_�w�g���@�̴����G
local a = CheckCompleteQuest( OwnerID(), 424013 ) --���ͤۤƪ��į�
local b = CheckCompleteQuest( OwnerID(), 424012 )  --��U�ש����u�@
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	LoadQuestOption(OwnerID())
	if a == true and b == false  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_117590_0"), " Lua_na_117590_1", 0 ) -- �ڧ�ۤ��ľ��˥�F
	end
end

function Lua_na_117590_1()--�p����U�ץ��G���s���ľ�
	local Player=OwnerID();
	CloseSpeak(Player);
	if CountBodyItem(Player,209254)==0 then
		GiveBodyItem(Player,209254,1);
	end
end

function Lua_ying_118300_01() --npc���Y�D���� ���

	local Quest = CheckAcceptQuest( OwnerID() , 424323 ) --���ȡG���褣�i�H
	local Quest2 = CheckAcceptQuest( OwnerID() , 424333 )

	LoadQuestOption( OwnerID() )
	if Quest == true  then
		if CountBodyItem( OwnerID() , 240020 ) == 0 then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_424323_02]" , "Lua_ying_118300_02" , 0 ) --�A�V���Y�D���������F�A���ӷN�K
		end
	end
	
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545137 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118300_2",0)
	end
end

function Lua_ying_118300_02()

	local Count = CountBodyItem( OwnerID() , 240020 )

	SetSpeakDetail( OwnerID() , "[SC_424323_01]" ) 		
	if Count <= 0 then
		GiveBodyItem( OwnerID() , 240020 , 1 ) --�����@�������ĻI
	end
end