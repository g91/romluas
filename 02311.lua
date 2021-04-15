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
				GiveBodyItem( Owner , 241480 , 15 ) --星座寵 深海元素，5.0.9 歡舞節(2013德國未開放歡舞節，新增項目提供給其他語系國家)
				DelBodyItem( Owner , 209270 , 10 )
				SetSpeakDetail( Owner, "[SC_DANCEFES_KORS_CHGOOD_02]") --感謝參與
				AddSpeakOption(Owner,TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_kors_dancefer_changegood",0)
			else
				SetSpeakDetail( Owner,GetString("SC_111490_DIALOG10") )--您的背包空間不足，請清理一下再來吧。
			end
		else
			SetSpeakDetail( Owner, "[SC_DANCEFES_KORS_CHGOOD_03]" ) --數量不足
		end

end

function lua_dancefes_changegame() --傳送者符文兌換重置券
	local Owner = OwnerID()
	SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_05")  ) --兌換說明文
	AddSpeakOption( Owner, TargetID( ), GetString("SC_DANCEFES2011_06") , " lua_dancefes_changeyes", 0 ) --yes
	AddSpeakOption( Owner, TargetID( ), GetString("SC_DANCEFES2011_07") , " lua_dancefes_changeno", 0 ) --no
end

function lua_dancefes_changeyes()
	local Owner = OwnerID()
	if  CountBodyItem( Owner , 202904 ) >= 1 then
		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then
			GiveBodyItem(Owner, 209404, 1) --重置卷
			DelBodyItem( Owner , 202904 , 1 )
			SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_04")  ) --感謝參與
		else
			SetSpeakDetail( Owner, GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
		end
	else
		SetSpeakDetail( Owner, GetString("SC_DANCEFES2011_03") ) --數量不足
	end
end

function lua_dancefes_changeno()
	CloseSpeak( OwnerID() )
end

function lua_dancefes_2011reflag() --活動重置
	local Owner = OwnerID()	
	ScriptMessage(Owner, Owner, 1,  GetString("SC_DANCEFES2011_08"),  C_SYSTEM )
	SetFlag(Owner, 544853, 0) --假面下的真相
	SetFlag(Owner, 544852, 0) --領獎的
	Lua_Hao_ResetColdown(Owner, 497413) --冷卻時間歸0
	Lua_Hao_ResetColdown(Owner, 497414)
	Lua_Hao_ResetColdown(Owner, 497415)
	Lua_Hao_ResetColdown(Owner, 497416)
	BeginPlot(Owner,"Lua_mika_dancefes_delquest",0)
-----------------
	SetFlag(Owner, 544862, 0) --推箱子
	SetFlag(Owner, 544863, 0)
	CancelBuff(Owner,509137)
	CancelBuff(Owner,509389)
	SetFlag(Owner, 544864, 0) --特攻連盟
  	SetFlag(Owner, 544865, 0)
	SetFlag(Owner, 544866, 0)  
	SetFlag(Owner, 544976, 0)  
end