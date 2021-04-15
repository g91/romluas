function lua_kors_dancefer_changegood()
	local Owner = OwnerID()
	SetSpeakDetail(Owner,"[SC_DANCEFES_KORS_CHGOOD_01]")
	AddSpeakOption(Owner,TargetID(),"[SC_DANCEFES_KORS_CHGOOD_00]","lua_kors_dancefer_givegood",0)
	AddSpeakOption(Owner,TargetID(),"[SC_DANCEFES_KORS_CHGOOD_04]" , " lua_dancefes_changeyes", 0 )
 end

function lua_kors_dancefer_givegood()
	local Owner = OwnerID()
	if  CountBodyItem( Owner , 209270 ) >= 10 then
			if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then
				GiveBodyItem(Owner, 725693, 1) 
				GiveBodyItem( Owner , 241480 , 15 ) --�P�y�d �`�������A5.0.9 �w�R�`(2013�w�ꥼ�}���w�R�`�A�s�W���ش��ѵ���L�y�t��a)
				DelBodyItem( Owner , 209270 , 10 )
				SetSpeakDetail( Owner, "[SC_DANCEFES_KORS_CHGOOD_02]") --�P�°ѻP
				AddSpeakOption(Owner,TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_kors_dancefer_changegood",0)
			else
				SetSpeakDetail( Owner,GetString("SC_111490_DIALOG10") )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
		else
			SetSpeakDetail( Owner, "[SC_DANCEFES_KORS_CHGOOD_03]" ) --�ƶq����
		end

end

function lua_dancefes_changegame() --�ǰe�̲Ť�I�����m��
	local Owner = OwnerID()
	SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_05")  ) --�I��������
	AddSpeakOption( Owner, TargetID( ), GetString("SC_DANCEFES2011_06") , " lua_dancefes_changeyes", 0 ) --yes
	AddSpeakOption( Owner, TargetID( ), GetString("SC_DANCEFES2011_07") , " lua_dancefes_changeno", 0 ) --no
end

function lua_dancefes_changeyes()
	local Owner = OwnerID()
	if  CountBodyItem( Owner , 202904 ) >= 1 then
		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then
			GiveBodyItem(Owner, 209404, 1) --���m��
			DelBodyItem( Owner , 202904 , 1 )
			SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_04")  ) --�P�°ѻP
		else
			SetSpeakDetail( Owner, GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		end
	else
		SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_03") ) --�ƶq����
	end
end

function lua_dancefes_changeno()
	CloseSpeak( OwnerID() )
end

function lua_dancefes_2011reflag() --���ʭ��m
	local Owner = OwnerID()	
	ScriptMessage(Owner, Owner, 1,  GetString("SC_DANCEFES2011_08"),  C_SYSTEM )
	SetFlag(Owner, 544853, 0) --�����U���u��
	SetFlag(Owner, 544852, 0) --�����
	Lua_Hao_ResetColdown(Owner, 497413) --�N�o�ɶ��k0
	Lua_Hao_ResetColdown(Owner, 497414)
	Lua_Hao_ResetColdown(Owner, 497415)
	Lua_Hao_ResetColdown(Owner, 497416)
	BeginPlot(Owner,"Lua_mika_dancefes_delquest",0)
-----------------
	SetFlag(Owner, 544862, 0) --���c�l
	SetFlag(Owner, 544863, 0)
	CancelBuff(Owner,509137)
	CancelBuff(Owner,509389)
	SetFlag(Owner, 544864, 0) --�S��s��
  	SetFlag(Owner, 544865, 0)
	SetFlag(Owner, 544866, 0)  
	SetFlag(Owner, 544976, 0)  
end