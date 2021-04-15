function lua_kors_dancefer_EV1_00()--劇情開頭
	DW_CancelTypeBuff( 68,  OwnerID() )
if Lua_Mounts_Copilot( OwnerID() ) == TRUE then
	if CheckFlag(OwnerID(),544862) ==FALSE and CheckFlag(OwnerID(),544863) == FALSE then
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_01]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_02]","lua_kors_dancefer_EV1_01",0)
	elseif CheckFlag(OwnerID(),544862) == true and CheckFlag(OwnerID(),544863) == FALSE then
		SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_12]")
	elseif  CheckFlag(OwnerID(),544863) ==TRUE and CheckFlag(OwnerID(),544976) == FALSE then
		local score=FN_CountBuffLevel(OwnerID(),509137)
			if score <=1 then
				SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_11]")
				SetFlag(OwnerID(),544976,1)
			elseif score >1 then
				SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_06]")
				if score < 10 and score > 1 then 
				AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_10",0)
				elseif score >= 10 and score<20 then 
				AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_20",0)
				elseif score >=20 and score<25 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_30",0)
				elseif score >=25 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_40",0)
				end
			end
	elseif  CheckFlag(OwnerID(),544863) ==TRUE and CheckFlag(OwnerID(),544976) == TRUE then
		SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_08]")
	end
else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_13]",C_SYSTEM)

end
end
function lua_kors_dancefer_EV1_01()
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_03]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_04]","lua_kors_dancefer_EV1_02",0)
end	

function lua_kors_dancefer_EV1_02()--開始遊戲。
	CloseSpeak(OwnerID())
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KORS_DANCEFES_CL]",C_SYSTEM)	
--	CancelBuff(OwnerID(),509137)
	ClockOpen(OwnerID(),EM_ClockCheckValue_1, 60,60, 0,"lua_kors_dancefer_ChZone","lua_kors_dancefer_EV1_TIMEOVER") --開時間
	AddBuff(OwnerID(),509279,1,-1) --推動技能
	AddBuff(OwnerID(),509137,1,-1)--基本分數
	SetFlag(OwnerID(),544862,1)
--	local target = FN_CountBuffLevel(OwnerID(), 509137)
end

function lua_kors_dancefer_EV1_move() -- 推箱子
--local OrgID=ReadRoleValue(TargetID() , EM_RoleValue_OrgID)沒用到了。
local OrgX = ReadRoleValue( TargetID(), EM_RoleValue_X )
local OrgY = ReadRoleValue( TargetID() , EM_RoleValue_Y )
local OrgZ = ReadRoleValue( TargetID() , EM_RoleValue_Z )
local OrgD = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
local X = OrgX
local Y = OrgY
local Z =OrgZ
local D = OrgD
local distable={30,90,70,90,50}
local OrgIDtable={117625,117900,117901,117902,117903}
	for i = 1 , 5 , 1 do
		 if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==OrgIDtable[i] then
			 local flyDir = (math.pi/180)*( OrgD )	--讀取飛行面向
			 X = OrgX +(distable[i]*math.cos(flyDir))	--計算X邊長
			 Z =OrgZ - (distable[i]*math.sin(flyDir))	--計算Z軸長
			Move(TargetID(),X,Y,Z)					--移動物件
			BeginPlot(TargetID(),"lua_kors_dancefer_EV1_checkDis",0) --物件移動判斷
			BeginPlot(TargetID(),"lua_kors_dancefer_EV1_checkAR",0)
		end
	end
end

function lua_kors_dancefer_EV1_cktouch()
local OrgX = ReadRoleValue( OwnerID(), EM_RoleValue_X )
local OrgZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	for i = 1,15 do
		local nowX = ReadRoleValue( OwnerID(), EM_RoleValue_X )
		local nowZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
		if i == 15 then
			if nowX == OrgX and nowZ == OrgZ then
					Hide(OwnerID())
					LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
					MoveToFlagEnabled(OwnerID(),false)
					sleep(20)
					Show(OwnerID(),0)
					LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
			end
		end
	Sleep(10)
	end
end
function lua_kors_dancefer_EV1_checkAR()
		local npcm=SetSearchRangeInfo( OwnerID() , 280 )
			for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 117902 then
				local tmpDis = CheckDistance(OwnerID(), npcde,190)
						if tmpDis == FALSE then
						local tag=780320
						local flagID=Rand(22)
						local OrgID=ReadRoleValue(OwnerID(), EM_RoleValue_OrgID )
						LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
						Hide(OwnerID())
						LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
						MoveToFlagEnabled(OwnerID(),false)
						sleep(20)
						Show(OwnerID(),0)
						end
				end
			end

end

function lua_kors_dancefer_EV1_checkDis()--距離確認用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   		
	local npcm=SetSearchRangeInfo( OwnerID() , 280 )
	for i=1 , npcm, 1 do 											 
	local npcde = GetSearchResult()										
			if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 117624 and ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 117625 then --木箱
				local tmpDis = CheckDistance(OwnerID(), npcde,30)	
					if tmpDis == TRUE then	
					local flagID=FA_Rand (22)
					local OrgID=ReadRoleValue(OwnerID(), EM_RoleValue_OrgID )
					local tmpS = FN_CountBuffLevel(TargetID(),509137)
					local score = tmpS+4
					CancelBuff(TargetID(),509137)
					AddBuff(TargetID(),509137,score,-1)
					BeginPlot(TargetID(),"lua_kors_dancefer_EV1_SCORE",0)
					Hide(OwnerID())
					LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
					MoveToFlagEnabled(OwnerID(),false)
					sleep(20)
					Show(OwnerID(),0)
					LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
					end
			end	
			if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 117904 and ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 117903 then --酒桶
				local tmpDis = CheckDistance(OwnerID(), npcde,40)	
					if tmpDis == TRUE then	
					local flagID=FA_Rand (22)
					local OrgID=ReadRoleValue(OwnerID(), EM_RoleValue_OrgID )
					local tmpS = FN_CountBuffLevel(TargetID(),509137)
					local score = tmpS+3
					CancelBuff(TargetID(),509137)
					AddBuff(TargetID(),509137,score,-1)
					BeginPlot(TargetID(),"lua_kors_dancefer_EV1_SCORE",0)
					Hide(OwnerID())
					LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
					MoveToFlagEnabled(OwnerID(),false)
					sleep(20)
					Show(OwnerID(),0)
					LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
					end
			end	
			if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 117622 and ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 117900 then--糧草
				local tmpDis = CheckDistance(OwnerID(), npcde,60)	
					if tmpDis == TRUE then	
					local flagID=FA_Rand (22)
					local OrgID=ReadRoleValue(OwnerID(), EM_RoleValue_OrgID )
					local tmpS = FN_CountBuffLevel(TargetID(),509137)
					local score = tmpS+1
					CancelBuff(TargetID(),509137)
					AddBuff(TargetID(),509137,score,-1)
					BeginPlot(TargetID(),"lua_kors_dancefer_EV1_SCORE",0)
					Hide(OwnerID())
					LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
					MoveToFlagEnabled(OwnerID(),false)
					sleep(20)
					Show(OwnerID(),0)
					LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
					end
			end
			if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 117622 and ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 117901 then--鮮魚
				local tmpDis = CheckDistance(OwnerID(), npcde,60)	
					if tmpDis == TRUE then	
					local flagID=FA_Rand (22)
					local OrgID=ReadRoleValue(OwnerID(), EM_RoleValue_OrgID )
					local tmpS = FN_CountBuffLevel(TargetID(),509137)
					local score = tmpS+2
					CancelBuff(TargetID(),509137)
					AddBuff(TargetID(),509137,score,-1)
					BeginPlot(TargetID(),"lua_kors_dancefer_EV1_SCORE",0)
					Hide(OwnerID())
					LuaFunc_MoveToFlag( OwnerID(),780320,flagID,20) 
					MoveToFlagEnabled(OwnerID(),false)
					sleep(20)
					Show(OwnerID(),0)
					LockObj( OwnerID(), 0, 0 ); -- 解除鎖定 
					end	

		end

	end
end
function lua_kors_dancefer_EV1_SCORE()
local score = FN_CountBuffLevel(OwnerID(),509137)
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_05]"..score,C_SYSTEM)
end



function lua_kors_dancefer_EV1_TIMEOVER()
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_FIREDAY_EV1_15]" , C_SYSTEM )  --時間到！
	ClockClose( OwnerID())
	CancelBuff( OwnerID() ,509279) 	--清除技能buff
	SetFlag(OwnerID(),544863,1)
end

function lua_kors_dancefer_ChZone() --換區。
	ClockClose( OwnerID())
	CancelBuff( OwnerID() ,509279) 	--清除技能buff
	SetFlag(OwnerID(),544863,1)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_10]",C_SYSTEM)
end

function lua_kors_dancefer_EV1_change()--換獎勵
local score=FN_CountBuffLevel(OwnerID(),509137)
	SetSpeakDetail(OwnerID(),"[SC_DANCEFES_KORS_ARR_06]")
	if score < 10 and score >=1 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_10",0)
	elseif score >= 10 and score<20 then 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_20",0)
	elseif score >=20 and score<25 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_30",0)
	elseif score >=25 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_DANCEFES_KORS_ARR_07]","lua_kors_dancefer_EV1_change_40",0)
	end
end

function lua_kors_dancefer_EV1_change_10()
	if Check_Bag_Space(OwnerID(),1) == TRUE then
	CancelBuff(OwnerID(),509137)
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),544976,1)
	GiveBodyItem(OwnerID(),209270,1)
	else
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_dancefer_EV1_change", 0 )
	end
end

function lua_kors_dancefer_EV1_change_20()
	if Check_Bag_Space(OwnerID(),1) == TRUE then
	CancelBuff(OwnerID(),509137)
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),544976,1)
	GiveBodyItem(OwnerID(),209270,2)
	else
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_dancefer_EV1_change", 0 )
	end
end

function lua_kors_dancefer_EV1_change_30()
	if Check_Bag_Space(OwnerID(),1) == TRUE then
	CancelBuff(OwnerID(),509137)
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),544976,1)
	GiveBodyItem(OwnerID(),209270,3)
	else
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_dancefer_EV1_change", 0 )
	end
end

function lua_kors_dancefer_EV1_change_40()
	if Check_Bag_Space(OwnerID(),1) == TRUE then
	CancelBuff(OwnerID(),509137)
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),544976,1)
	GiveBodyItem(OwnerID(),209270,4)
	else
	SetSpeakDetail(OwnerID(),"[SC_CHANGEGOOD_1_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]", "lua_kors_dancefer_EV1_change", 0 )
	end
end

function lua_kors_dancefer_EV1_checkSk()
local OrgID=ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
local OrgIDtable={117625,117900,117901,117902,117903}
	for i = 1,5 do
		if OrgID == OrgIDtable[i] then
			return TRUE
		end
	end			
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_09]",C_SYSTEM)
		return FALSE
end