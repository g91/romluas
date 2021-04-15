----------------------423321--------------------------
function LuaS_115647()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544218 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_1]","LuaS_423321_1",0)		---我想了解佩謝神殿。
	end	--<=423321用	
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544218 ) == true	and	CheckFlag( OwnerID(),544219 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_4]","LuaS_423321_1_1",0)		---上次稍微了解神殿了，有人見過佩謝神嗎？
	end	--<=423321用	
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544219 ) == true	and	CheckFlag( OwnerID(),544220 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_7]","LuaS_423321_3",0)		---上次說到神殿內的遭遇，你自己逃出來了？
	end	--<=423321用
----------423324用
	if CheckAcceptQuest( OwnerID() , 423324 ) == true  and	CheckFlag( OwnerID(),544223 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_1]","LuaS_423324_1_1",0)	--要跟我們說什麼呢？
	end	--<=423324用
	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544223 ) == true	and	CheckFlag( OwnerID(),544224 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_1]","LuaS_423324_1",0)		---要跟我們說什麼呢？
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544224 ) == true	and	CheckFlag( OwnerID(),544225 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_4]","LuaS_423324_2",0)		---抱歉上次先離開，請繼續說下去。
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544225 ) == true	and	CheckFlag( OwnerID(),544226 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_7]","LuaS_423324_3",0)		---上次說到坦帝歐斯的不合理，烈卡妮難道不知道嗎？
	end	--<=423318用	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544226 ) == true	and	CheckFlag( OwnerID(),544227 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_10]","LuaS_423324_4",0)		---上次是說安格爾人是為了追查真兇才加入人王軍囉？
	end	--<=423318用	
------17副本任務423478用---
	if	CountBodyItem ( OwnerID(), 207759 )	== 1 and CountBodyItem ( OwnerID(), 207920 )	== 1 and 
		CheckAcceptQuest( OwnerID() ,423478 ) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423478_1]" , "LuaS_k423478_1", 0 )
	end
		
end



function LuaS_423321_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_2]")			---傳說千年前烈卡妮帶領族人在此建立領主國時...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_3]","LuaS_423321_2",0)	--佩謝神殿內出了什麼問題？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_9]","LuaS_423321_1_1",0)	--	曾經有人見過佩謝神嗎？
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544218,1)
		end	
	end
end

function LuaS_423321_1_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_10]")			---現在的安格爾人，沒人真正見過「叢林守護者」佩謝...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_3]","LuaS_423321_2",0)	--	佩謝神殿內出了什麼問題？
	end
end

function LuaS_423321_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_5]")			---這要說到我的母親雅瓦卡...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_6]","LuaS_423321_3",0)	--所以你逃出來了？
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544219,1)
		end
	end
end

function LuaS_423321_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_8]")			---嗯...我逃出來了，背負著恥辱...但我族必須要有人將神殿內的一切事情告訴同族...
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544220,1)
		end	
	end
end

----------------------423322---------------------------
function LuaS_423322()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423322 ) == true  and	CheckFlag( OwnerID(),544221 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423322_1]","LuaS_423322_1",0)	--我們要跟拉夏娜說什麼呢？
	end	--<=423317用
end

function LuaS_423322_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423322_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423322_2]")			---讓我整理一下思緒，畢竟獅心騎士團目前人手不足，得想辦法說服拉夏娜...	
	end
end

function LuaS_423322_false()
	SetSpeakDetail(OwnerID(),"[SC_423322_2]")			---讓我整理一下思緒，畢竟獅心騎士團目前人手不足，得想辦法說服拉夏娜...
end

function LuaS_423322_2()

	AddBuff( TargetID()  , 506994 , 1 , -1 ) 
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423322 , 506994,TargetID(),OwnerID(),150)
	local ith = Lua_DW_CreateObj("obj",115701,OwnerID())   --ith假人	
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115645  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115700,NPC)   --tony假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115702,NPC1)   --lasha假人	
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )	
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_3]",3)						---我還是不贊成獅心騎士團出兵。
	sleep(35)
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )		---用跑的
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 0 )		---用跑的
	AdjustFaceDir( lasha ,ith, 0 )
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423322_4]",3)						---那只是你們懦弱的表現，口口聲聲說協助領主國，遇到問題卻只會推拖。
	sleep(35)
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_5]",3)							---那是因為事情實在太離奇，沒有證據根本難以相信。
	sleep(35)
	
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Yell(lasha,"[SC_423322_6]",3)						---我身上的傷痕就是證據，再說如果人王不相信我
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )
	sleep(25)	
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	Yell(ith,"[SC_423322_7]",3)							---拉夏娜！
	DW_MoveToFlag(ith,780679 , 11,0 ,1)
	Yell(tony,"[SC_423322_8]",3)						---你們都冷靜下來！
	sleep(15)	

	AdjustFaceDir( ith ,tony, 0 )
	AdjustFaceDir( lasha ,tony, 0 )
	sleep(5)
	Yell(ith,"[SC_423317_8]",3)							----....
	Yell(lasha,"[SC_423317_8]",3)						----....
	sleep(50)
		
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( tony ,lasha, 0 )
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423322_9]",3)					---沒錯，我們確實需要證據，所以可以請拉夏娜帶我們實際勘查一次嗎？
	sleep(10)
	Yell(ith,"[SC_423225_3]",3)						---陛下！
	sleep(25)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(lasha,"[SC_423322_10]",3)					---好！我這就去準備，還是人王明理。
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(30)

	CallPlot(tony,"LuaS_face_someone", lasha,5)		---持續面對拉夏娜
	CallPlot(ith,"LuaS_face_someone", lasha,5)
	DW_MoveToFlag(lasha,780679 , 1,0 ,1)
	delobj(lasha)
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	DW_WaitMoveTo( ith , X , Y, Z)
	sleep(20)
		
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( ith ,tony, 0 )
	AdjustFaceDir( tony ,ith, 0 )
	sleep(5)
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_11]",3)					---陛下，這太危險了。
	sleep(30)
	Yell(tony,"[SC_423322_12]",3)					---放心，只是勘查而已，而且如果有危險，我會自己保護自己。
	sleep(40)

	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423322_13]",3)					---我們需要有些計畫，記得嗎？有良好的應對方式，風雨就不足為懼。
	sleep(40)
	Yell(ith,"[SC_423322_14]",3)					---陛下...
	sleep(30)
	AdjustFaceDir( ith ,NPC1, 0 )
	AdjustFaceDir( tony ,NPC1, 0 )
	sleep(5)
	if	CheckAcceptQuest ( TargetID()   , 423322 )	 == true	and	CheckBuff( TargetID() , 506994 ) == true	then
		SetFlag(TargetID(),544221,1)
	end
	delobj(tony)
	delobj(ith)
	CancelBuff( TargetID()  , 506994  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

function LuaS_face_someone(Target,time)
	for i = 0,time*2 do
		sleep(5)
		if	CheckID(Target)	== true	then
			AdjustFaceDir( OwnerID() ,Target, 0 )	
		end
	end
end

-----------------------423323--------------------------
function LuaS_115753()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423323 ) == true  and	CheckFlag( OwnerID(),544222 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423323_1]","LuaS_423323_1",0)	--我們要進去了嗎？
	end	--<=423317用
end

function LuaS_423323_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423323_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423323_2]")			---進去？去哪裡？你家人王小鬼都還沒來咧？
	end
end

function LuaS_423323_false()
	SetSpeakDetail(OwnerID(),"[SC_423323_2]")			---進去？去哪裡？你家人王小鬼都還沒來咧？
end

function LuaS_423323_2()

	AddBuff( TargetID()  , 506995 , 1 , -1 ) 

	local lasha = Lua_DW_CreateObj("obj",115705,OwnerID())   --lasha假人	
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115754  , 200 , 0)		---
	local samu1 = Lua_DW_CreateObj("obj",115706,NPC)   --samu1假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115755  , 200 , 0)		---
	local samu2 = Lua_DW_CreateObj("obj",115707,NPC1)   --samu2假人	
	local tony = Lua_DW_CreateObj("flag" ,115703,780680,1)		---tony假人	
	local ith = Lua_DW_CreateObj("flag" ,115704,780680,2)		---ith假人
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423323 , 506995,TargetID(),lasha,150)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(samu1,false)							
	MoveToFlagEnabled(samu2,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( samu1 , true )							---演員不可對話
	DisableQuest( samu2 , true )
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 1 )		---用走的
	sleep(10)
	Yell(tony,"[SC_423323_3]",3)						---我們來了。
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 4,0 ,1)
	DW_MoveToFlag(tony,780680 , 3 ,0 ,1)
	sleep(5)
	AdjustFaceDir( ith ,lasha, 0 )
	AdjustFaceDir( tony ,lasha, 0 )
	AdjustFaceDir( lasha ,tony, 0 )
	sleep(5)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_THINK)
	Yell(lasha,"[SC_423323_4]",3)						---我們沒有太多時間，一有狀況立刻離開。
	sleep(40)	
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423323_5]",3)						---了解。
	sleep(30)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 6,0 ,1)	
	CallPlot(tony,"DW_MoveToFlag",tony,780680 , 5,0 ,1)
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 7,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 8,0 ,1)
	DW_MoveToFlag(lasha,780680 , 9 ,0 ,1)
	local fire = Lua_DW_CreateObj("flag" ,115756,780680,10)		---ith假人	
	MoveToFlagEnabled(fire,false)
	DisableQuest( fire , true )
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 0 )		---用走的
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 0 )		---用走的
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 0 )		---用走的
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 0 )		---用走的
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )		---用走的
	Yell(fire,"[SC_423323_6]",3)						---安格爾的各位請停下來吧。
	CallPlot(fire,"MK_MoveToFlag_Face",fire,780680 , 11,0 ,1,lasha)
	sleep(20)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(lasha,"[SC_423320_34]",3)						---侍衛！
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 12,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 13,0 ,1)
	CallPlot(tony,"MK_MoveToFlag_Face", tony , 780680 , 20, 0 , 1 ,fire )	
	CallPlot(ith,"MK_MoveToFlag_Face", ith , 780680 , 22, 0 , 1 ,fire )	
	sleep(20)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_7]",3)						---你是...犬族人！
	sleep(15)	
	SetIdleMotion( samu1,ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----戰鬥姿勢
	SetIdleMotion( samu2,ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----戰鬥姿勢
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 14,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 15,0 ,1)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 16,0 ,1)
	AdjustFaceDir( tony ,fire, 0 )	
	Yell(fire,"[SC_423323_8]",3)						---你的母親要我跟你說...
	sleep(15)
	Yell(lasha,"[SC_423323_9]",3)						---我的母親還活著!?
	sleep(35)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(fire,"[SC_423323_10]",3)						---不...應該是死了...
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_11]",3)						---你說謊!!
	sleep(35)
	Yell(fire,"[SC_423323_12]",3)						---我也不確定，但應該也不算活著。
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell(lasha,"[SC_423323_13]",3)						---不用廢話了，殺死犬族人!!
		

		
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(tony,"[SC_423323_14]",3)						----等等，冷靜點，先聽聽她的說法,或許可以知道裡面的情況!!
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 17,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 18,0 ,1)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 19,0 ,1)	
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 20,0 ,1)		
	MK_MoveToFlag_Face( tony , 780680 , 21, 0 , 1,lasha  )
	AdjustFaceDir( ith ,lasha, 0 )		
	sleep(20)
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 1 )		---用走的	
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---用走的
	Yell(lasha,"[SC_423317_8]",3)						----....
	sleep(30)
	Yell(lasha,"[SC_423323_15]",3)						----哼!待會再殺也不遲!!你們!!退下去!!
	sleep(5)
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 5,0 ,1)
	DW_MoveToFlag(samu2,780680 , 6 ,0 ,1)
	delobj(samu1)
	delobj(samu2)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( tony ,fire, 0 )	
	AdjustFaceDir( ith ,fire, 0 )		
	AdjustFaceDir( lasha ,fire, 0 )
	AdjustFaceDir( fire ,tony, 0 )			
	sleep(5)
	Yell(tony,"[SC_423323_16]",3)						---螢火...你進去過佩謝神殿？
	sleep(35)	
	Yell(fire,"[SC_423323_17]",3)						---沒錯...我聽到貓族雅瓦卡酋長在佩謝神殿出事的消息後...
	sleep(55)	
	Yell(fire,"[SC_423323_18]",3)						---但沒想到我看到的不是雅瓦卡，而是雅瓦卡的靈魂，他與我做了一場交易。
	sleep(50)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	AdjustFaceDir( fire ,lasha, 0 )			
	sleep(5)	
	Yell(fire,"[SC_423323_19]",3)						---他將寶藏的位置告訴我，代價是要我保護他最重要的寶物，也就是你，拉夏娜。
	sleep(15)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(5)
	Yell(lasha,"[SC_423323_20]",3)						---說謊!你在說謊!!
	sleep(30)	
	Yell(fire,"[SC_423323_21]",3)						---當佩謝所選中的人出現時，酋長將要維護部落...
	sleep(35)
	Yell(lasha,"[SC_423323_22]",3)						---這是...只有酋長才能知道的神諭...
	sleep(30)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(fire,"[SC_423323_23]",3)						---是的...你的母親即使去世了仍在關心你跟這片古林...
	sleep(55)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_TIRED)
	Yell(lasha,"[SC_423323_24]",3)						---母親...
	sleep(30)	
	Yell(fire,"[SC_423323_25]",3)						---他也告訴我現在還不是解放佩謝神殿的時候...
	sleep(55)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( lasha ,fire, 180 )	
	sleep(5)
	Yell(lasha,"[SC_423323_26]",3)						---嗯...我並不相信你，但神諭是不變的真理，今天就先放過你。
	sleep(40)
	Yell(fire,"[SC_423323_27]",3)						---當你遭遇危險時，我仍會遵守與雅瓦卡的約定保護你。
	sleep(40)
	AdjustFaceDir( lasha ,fire, 0 )		
	sleep(5)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	Yell(lasha,"[SC_423323_28]",3)						---哼...我只知道如果你現在不離開那麼將會有犬族人死在這裡。
	sleep(40)
	CallPlot(fire,"DW_MoveToFlag",fire,780680 , 10,0 ,1)
	sleep(10)
	AdjustFaceDir( lasha ,fire, 180 )		
	sleep(5)
	Yell(lasha,"[SC_423323_29]",3)						---回帳棚之後有些話要告訴你們。
	sleep(20)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 9,0 ,1)
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 7,0 ,1)	
	CallPlot(tony,"DW_MoveToFlag",tony,780680 , 5,0 ,1)
	sleep(30)
	if	CheckAcceptQuest ( TargetID()   , 423323 )	 == true	and	CheckBuff( TargetID() , 506995 ) == true	then
		SetFlag(TargetID(),544222,1)
	end	
	delobj(ith)
	delobj(tony)
	delobj(lasha)
	delobj(fire)
	CancelBuff( TargetID()  , 506995  ) 	--

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

--------------------------------------423324----------------------------------------

function LuaS_423324_1_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423324_1_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423323_36]")			---我要說的事情攸關達拉尼斯與安格爾的同盟關係...	
	end			
end

function LuaS_423324_false()
	SetSpeakDetail(OwnerID(),"[SC_423323_36]")			---我要說的事情攸關達拉尼斯與安格爾的同盟關係...
end

function LuaS_423324_1_2()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506996 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423324 , 506996,TargetID(),OwnerID(),150)
	local lasha = Lua_DW_CreateObj("obj",115757,OwnerID())   --lasha假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115645  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115758,NPC)   --tony假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115646  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115759,NPC1)   --ith假人
	local knight = Lua_DW_CreateObj("flag" ,115762,780679,1)
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(knight,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( knight , true )
	sleep(20)
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )		---用走的

	sleep(10)
	MK_MoveToFlag_Face(knight,780679 , 7 ,0 ,1,lasha)		
	AdjustFaceDir( lasha ,knight, 0 )
	sleep(5)
	Yell(knight,"[SC_423323_30]",3)							----報告酋長，「大將軍」蘭斯在城外求見！
	sleep(30)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_31]",3)							---大將軍嗎...准！
	sleep(5)
	Yell(tony,"[SC_423323_32]",3)							---蘭斯？
	sleep(20)
	CallPlot(knight,"DW_MoveToFlag",knight,780679 , 1,0 ,1)
	AdjustFaceDir( ith ,tony, 0 )	
	sleep(5)
	AdjustFaceDir( tony ,ith, 0 )		
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --舉手禮
	sleep(15)
	Yell(ith,"[SC_423323_33]",3)							---伊崔妮向陛下請罪，屬下擔心路上會遭遇德瑞克攻擊
	sleep(25)
	delobj(knight)
	sleep(20)
	Yell(tony,"[SC_423323_34]",3)							---不...沒關係...
	local lance = Lua_DW_CreateObj("flag" ,115760,780679,9)	
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	   --舉手禮
	WriteRoleValue(lance , EM_RoleValue_IsWalk, 1 )		---用走的
	MoveToFlagEnabled(lance,false)
	DisableQuest( lance , true )
	sleep(5)
	local lance2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115761  , 200 , 0)		---湯尼走到定位
	local X = ReadRoleValue ( lance2, EM_RoleValue_X)
	local Y = ReadRoleValue ( lance2, EM_RoleValue_Y)
	local Z = ReadRoleValue ( lance2, EM_RoleValue_Z)
	DW_WaitMoveTo( lance , X , Y, Z)
	AdjustFaceDir( tony ,lance, 0 )	
	sleep(5)
	AdjustFaceDir( lance ,tony, 0 )		
	sleep(5)
	if	CheckBuff( TargetID() , 506996 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423323_35]", "0xff8080ff" )--「大將軍」蘭斯正視著湯尼，露出難得一見的笑容。
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423323_35]",  "0xff8080ff" )--
	end
	sleep(40)
	AdjustFaceDir( lance ,lasha, 0 )
	sleep(5)	
	AdjustFaceDir(tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(20)
	delobj(tony)
	delobj(ith)
	delobj(lasha)
	delobj(lance)
	if	CheckBuff( TargetID() , 506996 ) == true	then

		SetFlag(TargetID(),544223,1)
	end	
	CancelBuff( TargetID()  , 506996  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

function LuaS_423324_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_2]")	---這是一段關於傳說英雄烈卡妮與坦帝歐斯.卡薩姆的故事。...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_3]","LuaS_423324_2",0)	--抱歉，我沒看過史書，但這種合作關係看來並不壞。
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544224,1)
		end
	end
end

function LuaS_423324_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_5]")	---但是仔細想想，為何坦帝歐斯要為敵將的死負責？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_6]","LuaS_423324_3",0)	--這確實是非常不合理，烈卡妮難道不知道嗎？
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544225,1)
		end
	end
end

function LuaS_423324_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_8]")	---烈卡妮也不是笨蛋，自然知道這一點...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_9]","LuaS_423324_4",0)	--這麼說來，安格爾人是為了追查真兇才加入人王軍囉？
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544226,1)
		end
	end
end

function LuaS_423324_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_11]")	---一開始或許是這樣，但在烈卡妮的記載中...
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544227,1)
		end
	end
end

-------------------423326--------------------------

function LuaS_115761()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if CheckAcceptQuest( OwnerID() , 423326 ) == true  and	CheckFlag( OwnerID(),544228 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423326_1]","LuaS_423326_1",0)	--沒有紀錄，我們又如何向拉夏娜解釋？
	end	--<=423326用	
end
	
function LuaS_423326_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423326_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423326_2]")			---率直的道歉並不能消除安格爾人對人王軍的猜忌...		
	end
end

function LuaS_423326_false()
	SetSpeakDetail(OwnerID(),"[SC_423326_2]")			---率直的道歉並不能消除安格爾人對人王軍的猜忌...
end	
	
function LuaS_423326_2()
	AddBuff( TargetID()  , 506997 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423326 , 506997,TargetID(),OwnerID(),150)	
	local lance = Lua_DW_CreateObj("obj",115766,OwnerID())   --lance假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115764  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115767,NPC)   --tony假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115765  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115768,NPC1)   --ith假人
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115769,NPC2)   --lasha假人
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(lance,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( lance , true )	
	sleep(20)
	WriteRoleValue(lance , EM_RoleValue_IsWalk, 1 )		---用走的
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_3]",3)						---年輕的安格爾人酋長拉夏娜，烈卡妮的記錄相信一定有他的根據...
	sleep(5)	
	AdjustFaceDir(tony ,lance, 0 )	
	AdjustFaceDir( ith ,lance, 0 )	
	AdjustFaceDir( lasha ,lance, 0 )	
	sleep(15)
	Yell(ith,"[SC_423326_4]",3)							---大將軍？
	sleep(30)
	Yell(lance,"[SC_423326_5]",3)						---然而我必須承認，這將引起安格爾人對人王軍的不信任...
	sleep(55)
	
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
			
			
	if	CheckBuff( TargetID() , 506997 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423326_6]", "0xff8080ff" )--(拉夏娜眼神中帶著憤怒)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423326_6]",  "0xff8080ff" )--
	end
	sleep(5)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(lasha,"[SC_423326_7]",3)						---你也想如坦帝歐斯那般代罪嗎？
	sleep(40)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_8]",3)						---不，千年前的過去難以追查...
	sleep(55)
		
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		
			
	Yell(lance,"[SC_423326_9]",3)						---並且盡全力追查當時所發生的一切...
	sleep(15)		
	if	CheckBuff( TargetID() , 506997 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423326_10]", "0xff8080ff" )--拉夏娜似乎對「大將軍」蘭斯有些意外
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423326_10]",  "0xff8080ff" )--
	end	
	sleep(35)
	Yell(lasha,"[SC_423326_11]",3)						---未彌補的罪孽就如同血脈傳承嗎？真有趣的說法，或許能夠在我這一代化解對達拉尼斯的猜忌。
	sleep(45)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_12]",3)						---如今各地事件四起，重新締結同盟關係刻不容緩，獅心騎士團將全力支援安格爾城所面臨的各種問題。
	sleep(55)	

	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		

	PlayMotion( lasha,ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	Yell(lasha,"[SC_423326_13]",3)						---不...現在不是時候，我將等待先靈們的訊息，屆時再通知達拉尼斯城的各位。
	sleep(45)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_14]",3)						---感謝安格爾酋長原諒，能夠及時參與重要會議實在萬幸，希望這可以解除安格爾酋長的疑惑。
	sleep(55)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)	
	Yell(lasha,"[SC_423326_15]",3)						---人類的那套就免了吧，我可沒有完全原諒你們...
	sleep(15)
		
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end				
		
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)		
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_16]",3)						---是嗎？但願達拉尼斯的誠意可以重新取回安格爾對人王軍的信任。
	sleep(35)		
	Yell(lance,"[SC_423326_17]",3)						---基於政務在身，還請請容我先離開。
	sleep(25)		
	PlayMotion( lasha,ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	Yell(lasha,"[SC_423326_18]",3)						---不送。
	sleep(15)	
	DW_MoveToFlag(lance,780679 , 1 ,0 ,1)
	delobj(lance)		
	AdjustFaceDir(tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha, 0 )	
	AdjustFaceDir( lasha ,tony, 0 )	
	sleep(5)
	Yell(lasha,"[SC_423326_19]",3)						---不好意思，發生的事情太多，現在請讓我靜一靜。
	sleep(25)		
	delobj(tony)
	delobj(ith)
	delobj(lasha)

	if	CheckBuff( TargetID() , 506997 ) == true	then
		CancelBuff( TargetID()  , 506997  ) 	--
		SetFlag(TargetID(),544228,1)
	end	
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end	
	