--��߻���y����

--NPC �N�w
Function lua_mika_phbirthday_npc01_1()
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_01]" )--�A�Q���D���ǨƱ��O�H
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_VNMAYDAY_02]" , "lua_mika_phbirthday_npc01_2", 0 ) --�d�ݳӧQ���骺���v
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_VNMAYDAY_03]" , "lua_mika_phbirthday_npc01_3", 0 ) --�d�ݤ���`�����v
end

Function lua_mika_phbirthday_npc01_2() --�d�ݳӧQ���骺���v
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_04]" )--4��30��b�V�n���@�~�@�����`��...(��)  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc01_1", 0 ) --�^��W�@�h
end

Function lua_mika_phbirthday_npc01_3() --�d�ݤ���`�����v
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_05]" )--����`���ΤF�U�سҤu�y�����޾�...(��)  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc01_1", 0 ) --�^��W�@�h
end

-- NPC �u��
Function lua_mika_phbirthday_npc02_1()
	SetSpeakDetail( OwnerID(), "[SC_VNMAYDAY_06]" )--���F�y���o�Ӹ`��...(��)  
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_0908SEANSON_03]" , "lua_mika_phbirthday_npc02_2", 0 ) --�ڷQ�I�����y
end

Function lua_mika_phbirthday_npc02_2() --�ڷQ�I�����y
	local item = CountBodyItem(OwnerID(), 207080 ); -- �ˬd ���B���� �ƶq
	if item >=3 then  --�ƶq���w
		CloseSpeak(OwnerID())
		GiveBodyItem(OwnerID(), 725150 , 1 )  --�����y ���_ ��߻��M�μ��y
		DelBodyItem(OwnerID(), 207080 , 3 ) --�����B����x3
	else 
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_phbirthday_npc02_1", 0 ) --�^��W�@�h
	end
end

function lua_mika_phbirthday_rewardtest()  --�@����20���_
	GiveBodyItem(OwnerID(), 725150 , 20 )  --�����y ���_
end