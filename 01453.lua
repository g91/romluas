function LuaN_mika_smallmerry00()
	SetSpeakDetail(OwnerID(), "[SC_MERRYS00]" )--�@npc��l���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MERRYS01]", " LuaN_mika_smallmerry_intro", 0) --����O�]�k�Ť���L�H
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MERRYS02]", " LuaN_mika_smallmerry_start", 0) --�ڭn�ոլ�   --�}�Ҥp����
end

function LuaN_mika_smallmerry_intro()
	SetSpeakDetail(OwnerID(), "[SC_MERRYS03]" )--�@�������e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_smallmerry00", 0 ) --�^��W�@�h
end

function LuaN_mika_smallmerry_start() --����ŦX�� ����p��������
	CloseSpeak(OwnerID())
	Hsiang_OpenEqGamble()
end