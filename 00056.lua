-----------------------------------------------------------------------------------------------------------
--���R
-----------------------------------------------------------------------------------------------------------

--function LuaS_110068_0()

	--if CheckAcceptQuest( OwnerID(), 420077) == true then
	--LoadQuestOption( OwnerID() );  --���J���ȼҪO
	--end

	--SetSpeakDetail( OwnerID(), GetString("ST_110068_0")   );
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_1") , "LuaS_110068_1",0 );	--�W�[�@�ӿﶵ�A�оǤ���1

--end

-----------------------------------------------------------------------------------------------------------
function LuaS_110068_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110068_1") );  --	�оǤ���1
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_2") , "LuaS_110068_0",0 );	--��^
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--�ڤF�Ѧp�󲾰ʤF

end
------------------------------------------------------------------------------------------------------------
function LuaS_110068_3()
	if CheckcompleteQuest( OwnerID(), 420077) ==true then
	BeginPlot( OwnerID(), "LuaS_110068_EXIT", 10 ); 	--�p�w�����L���ȡA�i����������ܡC
	else	
	LoadQuestOption( OwnerID() );  --���J���ȼҪO
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_1") , "LuaS_110068_0",0 );	--�^�W�@��
	end
end
------------------------------------------------------------------------------------------------------------
function LuaS_110068_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end

-----------------------------------------------------------------------------------------------------------
--���
-----------------------------------------------------------------------------------------------------------
function LuaS_110073_0()

	LoadQuestOption( OwnerID() );  --���J���ȼҪO

	if CheckCompleteQuest( OwnerID(), 420085) == true then
		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110073_1"), "LuaSO_110073_1", 0 );  --�оǤ��e3
--		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110073_EXIT"), "LuaS_110073_EXIT", 0 );  --�������
	end
end

---------------------------------------------------------------------------------------------------------------------
function LuaSO_110073_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110073_1") );  --�оǤ���3
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110073_EXIT"), "LuaS_110073_EXIT", 0 );  --�������

end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110073_EXIT()
	CloseSpeak( OwnerID() );  --������ܵ���

end