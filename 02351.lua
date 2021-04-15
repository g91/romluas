function lua_kors_sprfes_rabbitTaxi_00()
local key1 = CheckFlag(OwnerID(),545049) --活動未承接
local key2 = CheckFlag(OwnerID(),545050) --活動進行完成	
local key3 = CheckFlag(OwnerID(),545051) --活動領獎完成
	DW_CancelTypeBuff( 68,  OwnerID() )
		if key1 == FALSE and key3 == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_00]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_01]","lua_kors_sprfes_rabbitTaxi_01",0)
		elseif key1 == TRUE and key2 == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_16]")
		elseif key2 == TRUE and key3 ==  FALSE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_16]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_17]","lua_kors_sprfes_RT_award",0)
		elseif key3 == TRUE then
		SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_18]")
		end
end

function lua_kors_sprfes_rabbitTaxi_01()
	SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_03]","lua_kors_sprfes_rabbitTaxi_rank",0)
end

function lua_kors_sprfes_rabbitTaxi_rank()
	SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_04]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_05]","lua_kors_sprfes_rabbitTaxi_rank_1",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_06]","lua_kors_sprfes_rabbitTaxi_rank_2",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_07]","lua_kors_sprfes_rabbitTaxi_rank_3",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_kors_sprfes_rabbitTaxi_00",0)
end	

function lua_kors_sprfes_rabbitTaxi_rank_1()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
	CloseSpeak(OwnerID())
	AddBuff(OwnerID(),509741,1,-1)
	ClockOpen(OwnerID(),EM_ClockCheckValue_22, 340,340, 0,"lua_kors_sprfes_zoneCh","lua_kors_sprfes_TIMEOut")
	SetFlag(OwnerID(),545049,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
	local rabbit = LuaFunc_CreateObjByObj (  118287, OwnerID() )
			SetFollow(rabbit,OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,rabbit)
			SetModeEx(rabbit,EM_SetModeType_Revive,TRUE)
			BeginPlot(rabbit,"lua_kors_sprfes_rabbitTaxi_rabbitHome",0)
			AddToPartition( rabbit, 0 )
end

function lua_kors_sprfes_rabbitTaxi_rank_2()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
	CloseSpeak(OwnerID())
	AddBuff(OwnerID(),509741,1,-1)
	ClockOpen(OwnerID(),EM_ClockCheckValue_22, 300,300, 0,"lua_kors_sprfes_zoneCh","lua_kors_sprfes_TIMEOut")
	SetFlag(OwnerID(),545049,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,2)
	local rabbit={}
		rabbit[1] = LuaFunc_CreateObjByObj ( 118288 , OwnerID() )
			SetFollow(rabbit[1],OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,rabbit[1])
			SetModeEx(rabbit[1],EM_SetModeType_Revive,TRUE)
			local hole = Rand(10)
				if hole <5 then
				AddBuff(rabbit[1],509737,1,-1)
				tell(OwnerID() ,rabbit[1], "[SC_SPRIN_2011_RTAXI_08]" )
				else
				AddBuff(rabbit[1],509738,1,-1)
				tell(OwnerID() ,rabbit[1], "[SC_SPRIN_2011_RTAXI_09]" )
				end
			AddToPartition( rabbit[1], 0 )
		rabbit[2] = LuaFunc_CreateObjByObj ( 118296 , OwnerID() )
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,rabbit[2])
			SetFollow(rabbit[2],OwnerID())	
			SetModeEx(rabbit[2],EM_SetModeType_Revive,TRUE)
			local hole = Rand(10)
				if hole <5 then
				AddBuff(rabbit[2],509739,1,-1)
				tell(OwnerID() ,rabbit[2], "[SC_SPRIN_2011_RTAXI_10]" )
				else
				AddBuff(rabbit[2],509740,1,-1)
				tell(OwnerID() ,rabbit[2], "[SC_SPRIN_2011_RTAXI_11]" )
				end
			AddToPartition( rabbit[2], 0 )
end

function lua_kors_sprfes_rabbitTaxi_rank_3()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
	CloseSpeak(OwnerID())
	AddBuff(OwnerID(),509741,1,-1)
	ClockOpen(OwnerID(),EM_ClockCheckValue_22, 250,250, 0,"lua_kors_sprfes_zoneCh","lua_kors_sprfes_TIMEOut")
	SetFlag(OwnerID(),545049,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,4)
	local rabbit1 = LuaFunc_CreateObjByObj (  118287 , OwnerID() )
			SetFollow(rabbit1,OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,rabbit1)
			SetModeEx(rabbit1,EM_SetModeType_Revive,TRUE)	
			AddBuff(rabbit1,509737,1,-1)
			tell(OwnerID() ,rabbit1, "[SC_SPRIN_2011_RTAXI_08]" )
			AddToPartition( rabbit1, 0 )
	local rabbit2 = LuaFunc_CreateObjByObj (  118288 , OwnerID() )
			SetFollow(rabbit2,OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,rabbit2)
			SetModeEx(rabbit2,EM_SetModeType_Revive,TRUE)
			AddBuff(rabbit2,509738,1,-1)
			tell(OwnerID() ,rabbit2, "[SC_SPRIN_2011_RTAXI_09]" )
			AddToPartition( rabbit2, 0 )
	local rabbit3 = LuaFunc_CreateObjByObj (  118296 , OwnerID() )
			SetFollow(rabbit3,OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,rabbit3)
			SetModeEx(rabbit3,EM_SetModeType_Revive,TRUE)
			AddBuff(rabbit3,509739,1,-1)
			tell(OwnerID() ,rabbit3, "[SC_SPRIN_2011_RTAXI_10]" )
			AddToPartition( rabbit3, 0 )
	local rabbit4 = LuaFunc_CreateObjByObj (  118287 , OwnerID() )
			SetFollow(rabbit4,OwnerID())	
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,rabbit4)
			SetModeEx(rabbit4,EM_SetModeType_Revive,TRUE)
			AddBuff(rabbit4,509740,1,-1)
			tell(OwnerID() ,rabbit4, "[SC_SPRIN_2011_RTAXI_11]" )
			AddToPartition( rabbit4, 0 )
end

function lua_kors_sprfes_RT_award()
local Quest = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local ans = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
		if Quest ==0 and ans ==0 then
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_21]")
			SetFlag(OwnerID(),545051,1)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
	else
	SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_19]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SPRIN_2011_RTAXI_20]","lua_kors_sprfes_RT_awardGET",0)
	end
end

function lua_kors_sprfes_RT_awardGET()
local Quest = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local ans = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
local arv = Quest-ans
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		CloseSpeak(OwnerID())
		if Quest >= 1 and ans ==0 then
		CancelBuff(OwnerID(),509741)
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_21]")
			SetFlag(OwnerID(),545051,1)
			GiveBodyItem(OwnerID(),204214,2)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
		elseif Quest >=1 and arv>=1 then
		CancelBuff(OwnerID(),509741)
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_22]")
			SetFlag(OwnerID(),545051,1)
			GiveBodyItem(OwnerID(),204214,3)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
		elseif Quest ==1 and  arv==0 then
		CancelBuff(OwnerID(),509741)
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_23]")
			GiveBodyItem(OwnerID(),204218,1)
			GiveBodyItem(OwnerID(),204214,3)
			SetFlag(OwnerID(),545051,1)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
		elseif Quest == 2 and arv == 0 then
		CancelBuff(OwnerID(),509741)
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_23]")
			GiveBodyItem(OwnerID(),204218,2)
			GiveBodyItem(OwnerID(),204214,4)
			SetFlag(OwnerID(),545051,1)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
		elseif Quest == 4 and arv== 0 then
		CancelBuff(OwnerID(),509741)
			SetSpeakDetail(OwnerID(),"[SC_SPRIN_2011_RTAXI_23]")
			GiveBodyItem(OwnerID(),204218,5)
			GiveBodyItem(OwnerID(),204214,5)
			SetFlag(OwnerID(),545051,1)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
		end

	else	
	SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_kors_sprfes_rabbitTaxi_award ",0)
	end
end

function lua_kors_sprfes_buffend()
	if CheckFlag(OwnerID(),545050) == FALSE then
		ClockClose(OwnerID())
		SetFlag(OwnerID(),545050,1)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_14]",C_SYSTEM)
		local rabbit1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
			DelObj(rabbit1)
		local rabbit2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
			DelObj(rabbit2)
		local rabbit3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
			DelObj(rabbit3)
		local rabbit4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
			DelObj(rabbit4)
	end
end

function lua_kors_sprfes_zoneCh()
	CancelBuff(OwnerID(),509741)
end
			
function lua_kors_sprfes_TIMEOut()
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_15]",C_SYSTEM)
	ClockClose(OwnerID())
	SetFlag(OwnerID(),545050,1)
	local rabbit1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
		DelObj(rabbit1)
	local rabbit2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
		DelObj(rabbit2)
	local rabbit3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
		DelObj(rabbit3)
	local rabbit4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
		DelObj(rabbit4)
end

function lua_kors_sprfes_rabbitTaxi_rabbitHome()--決定拉比家
--O==rabbit ,T == player
local home = Rand(100)
	if home <25 then
	AddBuff(OwnerID(),509737,1,-1)
	tell( TargetID() , OwnerID() , "[SC_SPRIN_2011_RTAXI_08]" )
	elseif home >=25 and home <50 then
	AddBuff(OwnerID(),509738,1,-1)
	tell( TargetID() , OwnerID() , "[SC_SPRIN_2011_RTAXI_09]" )
	elseif home>=50 and home < 75 then
	AddBuff(OwnerID(),509739,1,-1)
	tell( TargetID() , OwnerID() , "[SC_SPRIN_2011_RTAXI_10]" )
	elseif home >=75 then
	AddBuff(OwnerID(),509740,1,-1)
	tell( TargetID() , OwnerID() , "[SC_SPRIN_2011_RTAXI_11]" )
	end
end

function lua_kors_sprfes_RT_r_holeBron()
local Orgid = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
	if Orgid == 118297 then
		SetPlot(OwnerID(),"touch","lua_kors_sprfes_RT_r_hole7",50)
	elseif Orgid == 118341 then
		SetPlot(OwnerID(),"touch","lua_kors_sprfes_RT_r_hole8",50)
	elseif Orgid == 118342 then
		SetPlot(OwnerID(),"touch","lua_kors_sprfes_RT_r_hole9",50)
	elseif Orgid == 118343 then
		SetPlot(OwnerID(),"touch","lua_kors_sprfes_RT_r_hole0",50)
	end
end

function lua_kors_sprfes_RT_r_hole7()
	if CheckBuff(OwnerID(),509741) ==  TRUE then
--		SetPlot( TargetID(),"touch","",0 )	
		BeginCastBarEvent(OwnerID(),OwnerID(),"[118297]",40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "lua_kors_sprfes_RT_hole7DEL")
	end
end

function lua_kors_sprfes_RT_hole7DEL(O_ID,RES)
	local rabbit1=ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	local rabbit2=ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local rabbit3=ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	local rabbit4=ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
	if RES ~=0 then
		if RES >0 then
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,0)
			EndCastBar( O_ID,RES )
		if CheckBuff(rabbit1,509737) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit1)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit2,509737) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit2)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit3,509737) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit3)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit4,509737) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit4)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register+6) == 0 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_24]",C_SYSTEM)
		end
		BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)	
		else
			EndCastBar( O_ID, RES );
		end
	BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)
	end
end

function lua_kors_sprfes_RT_r_hole8()
	if CheckBuff(OwnerID(),509741) ==  TRUE then
--		SetPlot( TargetID(),"touch","",0 )	
		 BeginCastBarEvent(OwnerID(),OwnerID(),"[118297]",40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "lua_kors_sprfes_RT_hole8DEL")
	end
end

function lua_kors_sprfes_RT_hole8DEL(O_ID,RES)
	local rabbit1=ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	local rabbit2=ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local rabbit3=ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	local rabbit4=ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
	if RES ~=0 then
		if RES >0 then
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,0)
			EndCastBar( O_ID, RES);
		if CheckBuff(rabbit1,509738) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit1)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit2,509738) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit2)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit3,509738) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit3)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit4,509738) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit4)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register+6)== 0 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_24]",C_SYSTEM)
		end
		BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)
		else
			EndCastBar( O_ID, RES);
		end	
	BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)
	end
end

function lua_kors_sprfes_RT_r_hole9()
	if CheckBuff(OwnerID(),509741) ==  TRUE then
--		SetPlot( TargetID(),"touch","",0 )		
	 BeginCastBarEvent(OwnerID(),OwnerID(),"[118297]",40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "lua_kors_sprfes_RT_hole9DEL") 
	end
end

function lua_kors_sprfes_RT_hole9DEL(O_ID,RES)
	local rabbit1=ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	local rabbit2=ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local rabbit3=ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	local rabbit4=ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
	if RES ~=0 then
		if RES >0 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,0)
			EndCastBar( O_ID, RES );
		if CheckBuff(rabbit1,509739) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit1)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit2,509739) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit2)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit3,509739) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit3)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit4,509739) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit4)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register+6)== 0 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_24]",C_SYSTEM)
		end
		BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)	
		else
			EndCastBar( O_ID, RES );
		end
	BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)
	end
end

function lua_kors_sprfes_RT_r_hole0()
	if CheckBuff(OwnerID(),509741) ==  TRUE then
	--	SetPlot( TargetID(),"touch","",0 )	
		BeginCastBarEvent(OwnerID(),OwnerID(),"[118297]",40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "lua_kors_sprfes_RT_hole0DEL") 
	end
end

function lua_kors_sprfes_RT_hole0DEL(O_ID,RES)
	local rabbit1=ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	local rabbit2=ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local rabbit3=ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	local rabbit4=ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
	if RES ~=0 then
		if RES >0 then
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,0)
			EndCastBar( O_ID, RES);
		if CheckBuff(rabbit1,509740) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit1)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit2,509740) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit2)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit3,509740) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit3)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if CheckBuff(rabbit4,509740) == TRUE then
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_12]",C_SYSTEM)
					BeginPlot(OwnerID(),"lua_kors_sprfes_rabbitTaxi_ck",0)
					DelObj(rabbit4)	
					WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,1)
		end
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register+6) ==0 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_24]",C_SYSTEM)
		end
		BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)	
		else
			EndCastBar( O_ID, RES );
		end
	BeginPlot(TargetID(),"lua_kors_sprfes_RT_r_holeBron",0)
	end
end

function lua_kors_sprfes_rabbitTaxi_ck()
local Quest = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local sc = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,sc+1)
	BeginPlot(OwnerID(),"lua_kors_sprfes_RT_CKS",0)
end
function lua_kors_sprfes_RT_CKS()
local Quest = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local ans = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	if Quest == ans then
	ClockClose(OwnerID())
	SetFlag(OwnerID(),545050,1)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SPRIN_2011_RTAXI_13]",C_SYSTEM)
	end
end
		
function lua_kors_sprfes_rabbitTaxi_RE()
	SetFlag(OwnerID(),545049,0)
	SetFlag(OwnerID(),545050,0)
	SetFlag(OwnerID(),545051,0)
	ClockClose(OwnerID())
	local rabbit1=ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	local rabbit2=ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local rabbit3=ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
	local rabbit4=ReadRoleValue(OwnerID(),EM_RoleValue_Register+5)
	DelObj(rabbit1)
	DelObj(rabbit2)
	DelObj(rabbit3)
	DelObj(rabbit4)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+5,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+6,0) 
end