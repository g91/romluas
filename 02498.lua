--423773 雷奇夫王國領主
function LuaS_423773_CALAV()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),423773)==true  then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424528_2]","LuaP_423773_1",0);
	else
		SetPosByFlag(OwnerID(),780867,7);
		CloseSpeak(OwnerID());
	end
end
function LuaP_423773_1()	--呼叫表演
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_423773_2",0)
	end
end
function LuaP_423773_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 423773				--任務編號
	local FinishFlagID = 545574			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 200				--演戲的檢查範圍
	local ActorArray = {0}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119391 then		--亞吉恩
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119392 then	--普尼羅
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119393 then	--傑斯
				AcArray[3]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )
		Sleep(30)
		Say(AcArray[3],"[SC_424528_4]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424528_5]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424528_5_1]" )
		Sleep(30)
		Say(AcArray[3],"[SC_424528_6]" )
		Sleep(40)
		Say(AcArray[2],"[SC_424528_7]" )
		Sleep(30)
		Say(AcArray[2],"[SC_424528_7_1]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424528_8]" )
		Sleep(40)
		Say(AcArray[2],"[SC_424528_9]" )
		Sleep(10)
		Say(AcArray[1],"[SC_424528_10]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424528_11]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424528_12]" )
		Sleep(30)
		ScriptMessage(OwnerID(),0,2,"[SC_424528_13]",0)
		Sleep(10)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
end
--424528 開門見山 傳送
function LuaS_424528_119303_01()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(OwnerID(),TargetID(),0);
	if CheckAcceptQuest(OwnerID(),423773)==true and CheckCompleteQuest(OwnerID(),424530)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424528_1]","LuaS_424528_119303_02",0);
	end
end
function LuaS_424528_119303_02()
	SetPosByFlag(OwnerID(),780867,6)
end
--424528 開門見山 表演
function LuaS_424528_CALAV()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424528)==true  then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424528_14]","LuaP_424528_1",0);
	else
		SetPosByFlag(OwnerID(),780867,7);
		CloseSpeak(OwnerID());
	end
end
function LuaP_424528_1()	--呼叫表演
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 );
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_424528_2",0)
	end
end
function LuaP_424528_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424528				--任務編號
	local FinishFlagID = 545508			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 200				--演戲的檢查範圍
	local ActorArray = {0}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119250 then		--亞吉恩
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119267 then	--普尼羅
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119268 then	--傑斯
				AcArray[3]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )

		Sleep(10)
		Say(O_ID,"[SC_424528_15]" )
		Sleep(40)
		Say(O_ID,"[SC_424528_16]" )
		Sleep(40)
		Say(O_ID,"[SC_424528_16_1]" )
		Sleep(40)
		Say(O_ID,"[SC_424528_17]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424528_18]" )
		Sleep(10)
		Say(O_ID,"[SC_424528_19]" )
		Sleep(30)
		Say(O_ID,"[SC_424528_20]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424528_28]" )
		Sleep(20)
		Say(O_ID,"[SC_424528_21]" )
		Sleep(10)
		ScriptMessage(OwnerID(),0,2,"[SC_424528_22]",0 )
		Sleep(20)
		Say(AcArray[1],"[SC_422367_2]" )--不是的
		Sleep(20)
		Say(AcArray[1],"[SC_424528_23]" )
		Sleep(40)
		Say(O_ID,"[SC_424528_24]" )
		Sleep(20)
		Say(O_ID,"[SC_424528_24_1]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424528_28]" )
		Sleep(60)
		Say(O_ID,"[SC_424528_25]" )
		Sleep(40)		
		Say(O_ID,"[SC_424528_25_1]" )
		Sleep(30)
		Say(O_ID,"[SC_424528_26]" )
		Sleep(70)
		Say(AcArray[1],"[SC_424528_27]" )
		Sleep(30)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
end
--如果沒有任務424528就送他出去
function LuaS_424528_8()
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424528)==false then
		--SetPosByFlag(OwnerID(),780871,7)
	end
end

--424529 威爾．坎奇斯
function Lua_424529_AcceptQ()		--接任務完就傳送
	Say(OwnerID(),"!")
	Say(TargetID(),"2")
	--SetPosByFlag(TargetID(),780871,8)
end
function LuaS_424529_01()
	LoadQuestOption(OwnerID());
	if CheckFlag(OwnerID(),545509)==true then
		CloseSpeak(OwnerID());
	elseif CheckAcceptQuest(OwnerID(),424529)==true  then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424529_1]","LuaS_424529_02",0);
	end
end
function LuaS_424529_02()
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_424529_03",0)
	end
end
function LuaP_424529_03()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424529				--任務編號
	local FinishFlagID = 545509			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 200				--演戲的檢查範圍
	local ActorArray = {0}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==118967 then		--亞吉恩
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==118968 then	--普尼羅
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119258 then	--威爾
				AcArray[3]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119265 then	--傑斯
				AcArray[4]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "Ag_QuestS", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )
		Sleep(20)
		Say(O_ID,"[SC_424529_2]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424529_3]" )
		Sleep(40)
		Say(O_ID,"[SC_424529_4]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424529_5]" )
		Sleep(40)
		Say(AcArray[2],"[SC_424529_6]" )
		Sleep(60)
		Say(AcArray[1],"[SC_424529_7]" )
		Sleep(20)
		Say(AcArray[2],"[SC_424529_8]" )
		Sleep(40)
		Say(O_ID,"[SC_424529_9]" )
		Sleep(20)
		ScriptMessage(OwnerID(),0,2,"[SC_424529_20]",0)		
		Sleep(40)
		Say(AcArray[1],"[SC_424529_10]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424529_11]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424529_12]" )
		Sleep(20)
		ScriptMessage(OwnerID(),0,2,"[SC_424529_13]",0)
		Sleep(60)
		Say(AcArray[3],"[SC_424529_14]" )
		Sleep(20)
		ScriptMessage(OwnerID(),0,2,"[SC_424529_15]",0)
		Sleep(20)
		Say(AcArray[3],"[SC_424529_16]" )
		Sleep(40)
		Say(AcArray[3],"[SC_424529_17]" )
		CallPlot(AcArray[3],"LuaP_424529_04",0)
		Sleep(60)
		Say(AcArray[1],"[SC_424529_18]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424529_19]" )
		Sleep(40)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
end
function LuaP_424529_04()
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	LuaFunc_MoveToFlag(OwnerID(),780871,9,1)
	CallPlot( OwnerID(), "LuaFunc_ResetObj", OwnerID() )
end
--424535對談
function LuaS_424535_CALAV_1()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424535)==true  and Checkflag(OwnerID(),545570)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424535_16]","LuaP_424535_1",0);
	end
end
function LuaP_424535_1()	--呼叫表演
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_424535_2",0)
	end
end
function LuaP_424535_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424535				--任務編號
	local FinishFlagID = 545570			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119305 then		--賽西
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119310 then	--傑斯
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119311 then	--普
				AcArray[3]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "Ag_QuestS", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )
		Sleep(10)
		Say(AcArray[1],"[SC_424535_1]" )
		Sleep(30)
		ScriptMessage(OwnerID(),0,2,"[SC_424535_2]",0 )
		Sleep(50)
		Say(AcArray[1],"[SC_424535_3]" )
		Sleep(50)
		Say(AcArray[1],"[SC_424535_4]" )
		Sleep(30)
		Say(AcArray[2],"[SC_424535_5]" )
		Sleep(30)
		Say(AcArray[3],"[SC_424535_6]" )
		Sleep(50)
		Say(AcArray[1],"[SC_424535_7]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424535_8]" )
		Sleep(10)
		SysCastSpellLv(AcArray[1],AcArray[2],498337,1)
		SysCastSpellLv(AcArray[1],AcArray[3],498337,1)
		Sleep(10)
		Say(O_ID,"[SC_424535_9]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424535_10]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424535_11]" )
		Sleep(30)
		Say(O_ID,"[SC_424535_12]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424535_13]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424535_14]" )
		Sleep(40)
		Say(O_ID,"[SC_424535_15]" )
		Sleep(20)		
		Say(AcArray[1],"[SC_424535_17]" )
		Sleep(30)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
end

--424536 出乎意料
function LuaS_424536_CALAV_1()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424536)==true  and Checkflag(OwnerID(),545571)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424536_18]","LuaP_424536_1",0);
	end
end
function LuaP_424536_1()	--呼叫表演
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_424536_2",0)
	end
end
function LuaP_424536_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424536				--任務編號
	local FinishFlagID = 545571			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {0}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119315 then		--賽西
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119318 then	--傑斯
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119319 then	--普
				AcArray[3]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119320 then
				AcArray[4]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119321 then
				AcArray[5]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119322 then	
				AcArray[6]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "Ag_QuestS", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )
		local SS=Lua_DW_CreateObj( "flag" , 119316 , 780871 , 12 , 1 )
		SetModeEx(SS,EM_SetModeType_Mark,false)
		Sleep(10)
		Say(AcArray[1],"[SC_424536_1]" )
		Sleep(10)
		LuaFunc_MoveToFlag(SS,780871,13,0)
		Sleep(20)
		AdjustFaceDir(O_ID,SS,0)
		Sleep(20)
		Say(O_ID,"[SC_424536_2]" )
		Sleep(30)
		AdjustFaceDir(O_ID,AcArray[1],0)
		Sleep(30)
		Say(AcArray[1],"[SC_424536_3]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424536_3_1]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424536_4]" )
		Sleep(40)
		Say(SS,"[SC_424536_5]" )
		Sleep(30)
		Say(SS,"[SC_424536_5_1]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424536_6]" )
		Sleep(20)
		Say(AcArray[1],"[SC_424536_6_1]" )
		Sleep(10)
		SysCastSpellLv(AcArray[1],SS,498337,1)
		Sleep(10)
		ScriptMessage(OwnerID(),0,2,"[SC_424536_7]",0)
		Sleep(30)
		Say(AcArray[1],"[SC_424536_8]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424536_8_1]" )
		Sleep(30)
		Say(AcArray[1],"[SC_424536_9]" )
		Sleep(30)
		Say(AcArray[2],"[SC_424536_9_1]" )
		Sleep(30)
		Say(SS,"[SC_424536_10]" )
		Sleep(30)
		ScriptMessage(OwnerID(),0,2,"[SC_424536_11]",0)
		Sleep(30)
		Say(SS,"[SC_424536_12]" )
		Sleep(40)
		Say(SS,"[SC_424536_13]" )
		Sleep(10)
		CastSpell(  SS, SS, 498324 ) 
		Sleep(40)
		Say(SS,"[SC_424536_14]" )
		Sleep(40)
		Say(AcArray[1],"[SC_424536_14_1]" )
		Sleep(10)
			for i=2,6,1 do
				AdjustFaceDir(AcArray[i],SS,0)
			end
		Say(AcArray[2],"[SC_424536_14_2]" )
		Sleep(30)
		Say(SS,"[SC_424536_15]" )
		Sleep(30)
		Say(SS,"[SC_424536_15_1]" )
		Sleep(30)
		Say(SS,"[SC_424536_16]" )
		Sleep(10)
		AddBuff(SS,620932,1,5)
		Sleep(10)
		DelObj(SS)
		ScriptMessage(OwnerID(),0,2,"[SC_424536_17]",0)
		Sleep(30)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
			for i=2,6,1 do
				AdjustFaceDir(AcArray[i],AcArray[1],0)
			end
end

--424537 出乎意料
function LuaS_424537_talk()	--對話
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),424537)==true  and Checkflag(OwnerID(),545572)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424537_6]","LuaP_424537_1",0);
	end
end
function LuaP_424537_1()	--呼叫表演
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
		CloseSpeak(OwnerID());
	else
		WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
		CloseSpeak(OwnerID());
		BeginPlot(TargetID(),"LuaP_424537_2",0)
	end
end
function LuaP_424537_2()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424537				--任務編號
	local FinishFlagID = 545572			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {0}				--(新版修改)演員陣列表
	
	local AcArray=SearchRangeNPC(O_ID,200);
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119324 then		--賽西
				AcArray[1]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119326 then	--傑斯
				AcArray[2]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119327 then	--普
				AcArray[3]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119328 then
				AcArray[4]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119329 then
				AcArray[5]=AcArray[i];
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==119330 then	
				AcArray[6]=AcArray[i];
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "Ag_QuestS", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )

		Sleep(10)
		Say(AcArray[1],"[SC_424537_1]" )
		Sleep(60)
		Say(AcArray[1],"[SC_424537_2]" )
		Sleep(60)
		Say(AcArray[1],"[SC_424537_3]" )
		Sleep(60)
		Say(AcArray[1],"[SC_424537_4]" )
		Sleep(60)
		Say(AcArray[1],"[SC_424537_5]" )
		Sleep(60)
		WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
	Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品

end
--對話
function LuaS_21Say_1()
		Say(OwnerID(),"[SC_OTHER_ZONE21_1]")
end
function LuaS_21Say_2()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_2]")
end
function LuaS_21Say_3()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_3]")
end
function LuaS_21Say_4()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_4]")
end
function LuaS_21Say_5()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_5]")
end
function LuaS_21Say_6()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_6]")
end
function LuaS_21Say_7()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_7]")
end
function LuaS_21Say_8()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_8]")
end
function LuaS_21Say_9()
		NpcSay(OwnerID(),"[SC_OTHER_ZONE21_9]")
end