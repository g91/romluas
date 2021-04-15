function lua_musicfes_kors_00() --劇情起頭
if ReadRoleValue(TargetID(),EM_RoleValue_PID) ~= 0 then
	local key1 = CheckFlag(OwnerID(),545139) --未承接
	local key2 = CheckFlag(OwnerID(),545140) --完成課題
	local key3 = CheckFlag(OwnerID(),545141) --領獎完成
		DW_CancelTypeBuff( 68,  OwnerID() )
		if Lua_Mounts_Copilot( OwnerID() ) == TRUE then
			if key1 == FALSE and key3 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_08]","lua_musicfes_kors_01",0)
			elseif key1 == TRUE and key2 == FALSE then
			local Qtable = {545184,545185,545186,545187,545188,545189,545190,545191}
			local Itable = {209017,209018,209019,209212,209213,209214,209228,209229}
			local class 
				for i =1,8 do
					if CheckFlag(OwnerID(),Qtable[i])== TRUE then
						class = Itable[i]
					end
				end
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_04][$SETVAR1=["..class.."]]")
			elseif key2 == TRUE and key3 == FALSE then
			local Qtable = {545184,545185,545186,545187,545188,545189,545190,545191}
			local Itable = {209017,209018,209019,209212,209213,209214,209228,209229}
			local class 
				for i =1,8 do
					if CheckFlag(OwnerID(),Qtable[i])== TRUE then
						class = Itable[i]
					end
				end
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_04][$SETVAR1=["..class.."]]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_06]","lua_musicfes_kors_awardCNT",0)
			elseif key2 == TRUE and key3 == TRUE then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_09]")
				if CheckFlag(OwnerID(),545174)==TRUE  and CountBodyItem(OwnerID(),530730) ==0 then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_ALL",0)
				elseif  CheckFlag(OwnerID(),545175) == TRUE and CountBodyItem(OwnerID(),530729) ==0 then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_BRM ",0)
				elseif CheckFlag(OwnerID(),545176) == TRUE and CountBodyItem(OwnerID(),530728) ==0 then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_HIL",0)
				elseif CheckFlag(OwnerID(),545177) == TRUE and CountBodyItem(OwnerID(),530727) ==0 then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_SUN ",0)
				end
			end
		else
			CloseSpeak(OwnerID())
		end
else
	SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_23]")

end
end

function lua_musicfes_kors_01()--活動參加確認
	SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_01]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_02]","lua_musicfes_kors_give",0)
end

function lua_musicfes_kors_give()--樂器交付
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
		CloseSpeak(OwnerID())
		local MS=Rand(100)
		if MS <=13 then
			GiveBodyItem(OwnerID(),209017,1)
			SetFlag(OwnerID(),545192,1)
		elseif MS > 13 and MS <=26 then
			GiveBodyItem(OwnerID(),209018,1)
			SetFlag(OwnerID(),545193,1)
		elseif MS >26 and MS <= 39 then
			GiveBodyItem(OwnerID(),209019,1)
			SetFlag(OwnerID(),545194,1)
		elseif MS >39 and MS <=52 then
			GiveBodyItem(OwnerID(),209212,1)
			SetFlag(OwnerID(),545195,1)
		elseif MS >52 and MS <= 65 then
			GiveBodyItem(OwnerID(),209213,1)
			SetFlag(OwnerID(),545196,1)
		elseif MS >65 and MS <=78 then
			GiveBodyItem(OwnerID(),209214,1)
			SetFlag(OwnerID(),545197,1)
		elseif MS >78 and MS <=91 then
			GiveBodyItem(OwnerID(),209228,1)
			SetFlag(OwnerID(),545198,1)
		elseif MS >91 then
			GiveBodyItem(OwnerID(),209229,1)
			SetFlag(OwnerID(),545199,1)
		end
		SetFlag(OwnerID(),545139,1)
		AddBuff(OwnerID(),508285,1,86400)
		BeginPlot(OwnerID(),"lua_musicfes_kors_Qus",0)
	else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_01",0)
	end
end

function lua_musicfes_kors_Qus()--出題目
local Itable = {209017,209018,209019,209212,209213,209214,209228,209229}
local ITEMt = {545192,545193,545194,545195,545196,545197,545198,545199}
local Qtable = {545184,545185,545186,545187,545188,545189,545190,545191}
	for i =1,8 do
		if CheckFlag(OwnerID(),ITEMt[i])== TRUE then
				local R =Rand(7)+1
			if ITEMt[i] ~= ITEMt[R] then	
			SetFlag(OwnerID(),Qtable[R],1)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_03][$SETVAR1=["..Itable[R].."]]",C_SYSTEM)
			elseif ITEMt[i] == ITEMt[R]then
				SetFlag(OwnerID(),Qtable[R+1],1)
				ScriptMessage(OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_03][$SETVAR1=["..Itable[R+1].."]]",C_SYSTEM)
			end
		end
	end
end

function lua_musicfes_kors_Icheck()
		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false
		else
			return true
		end
end

function lua_musicfes_kors_Iuse() --樂器使用
local ITEMBUF 
local Qus 
local ITEMt = {545192,545193,545194,545195,545196,545197,545198,545199}
local Qtable = {545184,545185,545186,545187,545188,545189,545190,545191}
local buftable = {509988,509989,509990,509991,509992,509993,509994,509995}
	for i =1,8 do
		if CheckFlag(TargetID(),ITEMt[i])== TRUE then
				ITEMBUF = buftable[i]
		end
		if CheckFlag(TargetID(),Qtable[i])== TRUE then
				Qus = buftable[i]
		end
	end
		if  CheckBuff(TargetID(),ITEMBUF) == TRUE and CheckBuff(TargetID(),Qus) == TRUE then
			IF CheckFlag(TargetID(),545141) == FALSE then
			ScriptMessage (TargetID(),TargetID(),1,"[SC_MUSICFES_KORS_05]",C_SYSTEM)
				SetFlag(TargetID(),545140,1)
			end
		end
	BeginPlot(TargetID(),"lua_musicfes_kors_titCNT",0)
end

function lua_musicfes_kors_guitar()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/guitar.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211822)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end
function lua_musicfes_kors_dimt()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/organ.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211835)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_lute()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/lute.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211826)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_clar()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/clarinet.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211837)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_sax()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/sax.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211824)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_FRE()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/french_horn.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 223428)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_tru()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/trumpet.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211833)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_flute()
	PlaySound(TargetID(),"sound/sound_new/skill/Music_Festival/instruments/flute.mp3",FALSE)
	AttachCastMotionTool( OwnerID(), 211840)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
	BeginPlot(TargetID(),"lua_musicfes_kors_Iuse",0)
end

function lua_musicfes_kors_titCNT()
local ALL =0
local brm = 0
local HIL =0
local sunb = 0
		if CheckBuff(OwnerID(),509988) == TRUE then --魔法吉他之旋律
		ALL = ALL+1
		brm = brm+1
		sunb = sunb+1
		end
		if CheckBuff(OwnerID(),509989) == TRUE then -- 魔法笛米特之旋律
		ALL = ALL+1
		HIL = HIL+1
		end
		if CheckBuff(OwnerID(),509990) == TRUE then -- 魔法魯特琴之旋律
		ALL = ALL+1
		sunb = sunb+1
		end
		if CheckBuff(OwnerID(),509991) == TRUE then -- 魔法豎笛之旋律
		ALL = ALL+1
		brm = brm+1
		HIL = HIL+1
		end
		if CheckBuff(OwnerID(),509992) == TRUE then -- 魔法薩克斯風之旋律
		ALL = ALL +1
		brm = brm +1
		sunb = sunb +1
		end
		if CheckBuff(OwnerID(),509993) == TRUE then -- 魔法法國號之旋律
		ALL = ALL +1
		brm = brm +1
		end
		if CheckBuff(OwnerID(),509994) == TRUE then --魔法管樂器之旋律
		ALL = ALL +1
		HIL = HIL+1
		end
		if CheckBuff(OwnerID(),509995) == TRUE then --魔法山笛之旋律
		ALL = ALL +1
		HIL = HIL +1
		end
	IF ALL >= 8  then
		SetFlag(OwnerID(),545174,1)
	end
	if brm >= 4  then 
		SetFlag(OwnerID(),545175,1)
		if CheckBuff(OwnerID(),509989) == TRUE or CheckBuff(OwnerID(),509990) == TRUE or CheckBuff(OwnerID(),509994) == TRUE or CheckBuff(OwnerID(),509995) == TRUE then
		SetFlag(OwnerID(),545175,0)
		end
	end
	if HIL >=4  then
		SetFlag(OwnerID(),545176,1)
		if  CheckBuff(OwnerID(),509988) == TRUE or CheckBuff(OwnerID(),509990) == TRUE or CheckBuff(OwnerID(),509992) == TRUE or CheckBuff(OwnerID(),509993) == TRUE then
		SetFlag(OwnerID(),545176,0)
		end
	end
	if sunb >= 3  then
		SetFlag(OwnerID(),545177,1)
		if CheckBuff(OwnerID(),509989) == TRUE or CheckBuff(OwnerID(),509991) == TRUE or CheckBuff(OwnerID(),509993) == TRUE or CheckBuff(OwnerID(),509994) == TRUE or CheckBuff(OwnerID(),509995) == TRUE then
		SetFlag(OwnerID(),545177,0)
		end
	end
end

function lua_musicfes_kors_NPC()
	while true do
	local min = GetSystime(2) --抓系統時間(分鐘)
	local hr = GetSystime(1)-- 抓小時
		if hr == 5 or  hr == 11 or  hr == 15   or  hr == 19 or  hr == 21 or hr == 23 then
			if min == 59 then
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , "[SC_MUSICFES_KORS_10]" )
				end
			end 
		elseif  hr == 0 or   hr == 6  or hr == 12 or  hr == 16  or  hr == 20 or hr == 22 then
				if min == 0 then --0分時執行出現劇情
					BeginPlot( OwnerID(), "lua_musicfes_kors_star",0 )					
				end
				if min == 59 then --刪除劇情
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Count = SetSearchAllNPC( RoomID )
					local Obj
					local MUSICTable = {118157,118344,118531}

					if  Count ~= 0 then
						for i=1 , Count , 1 do
							local ID = GetSearchResult()
							Obj=Role:New(ID)
							if Obj:IsNPC() == true then
								local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
								for j = 1 , table.getn( MUSICTable ) , 1 do
									if Name ==MUSICTable[j] then  --若為陣列中的值
									BeginPlot( OwnerID(), "lua_musicfes_kors_del", 0 )	--刪除
									end
								end
							end
						end
					end
				end
		end
--	Say(OwnerID(),hr)
--	Say(OwnerID(),min)
	Sleep(600)
	end
end

function lua_musicfes_kors_star()
local MUSICTable = {118531,118344,118157}
local R = Rand(7)+1
local R2 = Rand(7)+1
	for i = 1,11 do 
		local music={}
		local buftable = {509988,509989,509990,509991,509992,509993,509994,509995}
		if i ==1 then 
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
		elseif i >1 and i<=6 then
		music[i]=CreateObjByFlag(MUSICTable[2] ,780962 , i ,1) 
			SetModeEx(music[i],EM_SetModeType_Revive,TRUE)
			WriteRoleValue(music[i],EM_RoleValue_PID,buftable[R])
			WriteRoleValue(music[i] ,EM_RoleValue_IsWalk , 2 ) 
			BeginPlot(music[i],"lua_musicfes_kors_BUF",0)
			AddToPartition( music[i], 0 )	
		elseif i > 6 then
		music[i]=CreateObjByFlag(MUSICTable[3] ,780962 , i ,1) -- 
			SetModeEx(music[i],EM_SetModeType_Revive,TRUE)	
			WriteRoleValue(music[i],EM_RoleValue_PID,buftable[R2])	
			WriteRoleValue(music[i] ,EM_RoleValue_IsWalk , 2 ) 
			BeginPlot(music[i],"lua_musicfes_kors_BUF",0)
			AddToPartition( music[i], 0 )			
		end	
	end
end

function lua_musicfes_kors_del()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--		RunningMsgEx( OwnerID() , 2 , 3 , "[SC_MUSICFES_KORS_11]" )
--	end
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = {118344,118157}
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	if  Count ~= 0 then 
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end

function lua_musicfes_kors_BUF()
SetPlot(OwnerID(),"touch","lua_musicfes_kors_BUFF",20)
BeginPlot(OwnerID(),"lua_musicfes_kors_NPCmov",0)
end

function lua_musicfes_kors_NPCmov()
	while TRUE do
		for f = 1,18,1 do
			MoveToFlagEnabled( OwnerID(), false )
			WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 2 ) 
			LuaFunc_MoveToFlag( OwnerID(), 780967 , f ,30 )
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
			PlaySoundToPlayer(TargetID(),"sound\\fes\\musicfes\\guitar.mp3",FALSE)
			AttachCastMotionTool( OwnerID(), 211824)
			Sleep(30)
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)
			PlaySoundToPlayer(TargetID(),"sound\\fes\\musicfes\\maracas.mp3",FALSE)	
			AttachCastMotionTool( OwnerID(),211838 )		
			Sleep(50)
			PlayMotion(OwnerID(),	ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
			Sleep(50)
			PlayMotion(OwnerID(),	ruFUSION_ACTORSTATE_EMOTE_VICTORY)			
			Sleep(80)
		end 	
	Sleep(200)
	end
end

function lua_musicfes_kors_BUFF()
local buff = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if CheckFlag(OwnerID(),545139)==TRUE and CheckFlag(OwnerID(),545140) == FALSE then
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_18][$SETVAR2=["..buff.."]]",C_SYSTEM)
	AddBuff(OwnerID(),buff,1,600)
local ITEMBUF 
local Qus 
local ITEMt = {545192,545193,545194,545195,545196,545197,545198,545199}
local Qtable = {545184,545185,545186,545187,545188,545189,545190,545191}
local buftable = {509988,509989,509990,509991,509992,509993,509994,509995}
	for i =1,8 do
		if CheckFlag(OwnerID(),ITEMt[i])== TRUE then
				ITEMBUF = buftable[i]
		end
		if CheckFlag(OwnerID(),Qtable[i])== TRUE then
				Qus = buftable[i]
		end
	end
		if  CheckBuff(OwnerID(),ITEMBUF) == TRUE and CheckBuff(OwnerID(),Qus) == TRUE then
			IF CheckFlag(OwnerID(),545141) == FALSE then
			ScriptMessage (OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_05]",C_SYSTEM)
				SetFlag(OwnerID(),545140,1)
			end
		end
	BeginPlot(OwnerID(),"lua_musicfes_kors_titCNT",0)
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_17]",C_SYSTEM)
	end

end


function lua_musicfes_kors_awardCNT()
	SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_19]")
		if CheckFlag(OwnerID(),545174)==TRUE  and CountBodyItem(OwnerID(),530730) ==0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_ALL",0)
		elseif  CheckFlag(OwnerID(),545175) == TRUE and CountBodyItem(OwnerID(),530729) ==0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_BRM ",0)
		elseif CheckFlag(OwnerID(),545176) == TRUE and CountBodyItem(OwnerID(),530728) ==0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_HIL",0)
		elseif CheckFlag(OwnerID(),545177) == TRUE and CountBodyItem(OwnerID(),530727) ==0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_21]","lua_musicfes_kors_SUN ",0)
		end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSICFES_KORS_20]","lua_musicfes_kors_award",0)
end

function lua_musicfes_kors_ALL()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_16]")
			CancelBuff_NoEvent( OwnerID(), 508285) 
			GiveBodyItem(OwnerID(),204428,6)
			GiveBodyItem(OwnerID(),530730,1)
			SetFlag(OwnerID(),545141,1)
		else
			SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_awardCNT ",0)
		end
end

function lua_musicfes_kors_BRM()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_15]")
			CancelBuff_NoEvent( OwnerID(), 508285) 
			GiveBodyItem(OwnerID(),204428,5)
			GiveBodyItem(OwnerID(),530729,1)
			SetFlag(OwnerID(),545141,1)
		else
			SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_00 ",0)
		end
end

function lua_musicfes_kors_HIL()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_14]")
			CancelBuff_NoEvent( OwnerID(), 508285) 
			GiveBodyItem(OwnerID(),204428,5)	
			GiveBodyItem(OwnerID(),530728,1)
			SetFlag(OwnerID(),545141,1)
		else
			SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_00",0)
		end
end

function lua_musicfes_kors_SUN()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_13]")
		CancelBuff_NoEvent( OwnerID(), 508285) 
		GiveBodyItem(OwnerID(),204428,5)
		GiveBodyItem(OwnerID(),530727,1)
		SetFlag(OwnerID(),545141,1)
		else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_00 ",0)
		end
end

function lua_musicfes_kors_award()
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetSpeakDetail(OwnerID(),"[SC_MUSICFES_KORS_12]")
			CancelBuff_NoEvent( OwnerID(), 508285) 
			GiveBodyItem(OwnerID(),204428,4)
			SetFlag(OwnerID(),545141,1)
			else
			SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_musicfes_kors_00",0)
		end
end

function lua_musicfes_kors_giveup()
SetFlag(OwnerID(),545139,1)
SetFlag(OwnerID(),545140,1)
SetFlag(OwnerID(),545141,1)
local Itable = {209017,209018,209019,209212,209213,209214,209228,209229}
local ITEMt = {545192,545193,545194,545195,545196,545197,545198,545199}
	for i = 1,8 do
		if CheckFlag(OwnerID(),ITEMt[i]) == TRUE then
			DelBodyItem(OwnerID(),Itable[i],1)
			SetFlag(OwnerID(),ITEMt[i],0)
		end
	end
GiveBodyItem(OwnerID(),204428,1)
ScriptMessage(OwnerID(),OwnerID(),1,"[SC_MUSICFES_KORS_22]",C_SYSTEM)
end

function lua_musicfes_kors_testStart()
local MUSICTable = {118531,118344,118157}
local R = Rand(7)+1
local R2 = Rand(7)+1
	for i = 1,11 do 
		local music={}
		local buftable = {509988,509989,509990,509991,509992,509993,509994,509995}
		if i ==1 then 
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Count = SetSearchAllNPC( RoomID )
		local Obj
			if  Count ~= 0 then 
				for i=1 , Count , 1 do
					local ID = GetSearchResult()
						local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
							if Name == 118531 then
								WriteRoleValue(ID,EM_RoleValue_PID,1)
							end
				end
			end
		elseif i >1 and i<=6 then
		music[i]=CreateObjByFlag(MUSICTable[2] ,780962 , i ,1) 
			SetModeEx(music[i],EM_SetModeType_Revive,TRUE)
			WriteRoleValue(music[i],EM_RoleValue_PID,buftable[R])
			WriteRoleValue(music[i] ,EM_RoleValue_IsWalk , 2 ) 
			BeginPlot(music[i],"lua_musicfes_kors_BUF",0)
			AddToPartition( music[i], 0 )	
		elseif i > 6 then
		music[i]=CreateObjByFlag(MUSICTable[3] ,780962 , i ,1) 
			SetModeEx(music[i],EM_SetModeType_Revive,TRUE)	
			WriteRoleValue(music[i],EM_RoleValue_PID,buftable[R2])	
			WriteRoleValue(music[i] ,EM_RoleValue_IsWalk , 2 ) 
			BeginPlot(music[i],"lua_musicfes_kors_BUF",0)
			AddToPartition( music[i], 0 )			
		end	
	end
end

function lua_musicfes_kors_testEND()
local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
local Count = SetSearchAllNPC( RoomID )
local Obj
local NPC = {118344,118157}
	if  Count ~= 0 then 
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == 118531 then
				WriteRoleValue(ID,EM_RoleValue_PID,0)
				end
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end

function lua_musicfes_kors_RE()
local buftable = {509988,509989,509990,509991,509992,509993,509994,509995}
local keytable ={545139,545140,545141,545174 ,545175,545176,545177,545184,545185,545186,545187,545188,545189,545190,545191,545192,545193,545194,545195,545196,545197,545198,545199}
	for S = 1,table.getn(keytable),1 do
		SetFlag(OwnerID(),keytable[S],0)
	end
	for i = 1, 8 do	
		CancelBuff(OwnerID(),buftable[i])
	end
end