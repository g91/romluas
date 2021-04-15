function AG_face_and_load()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
end

function AGtest1()
	for i=1,266 do
		PlayMotion(OwnerID(),i)
		Sleep(10)
	end
end

-----------------------------------------------------------------------------------------------use
function AGuse01(x)
		PlayMotion(OwnerID(),x)
end
-----------------------------------------------------------------------------------------------use找物件坐標用，回傳table
function AGUSE02(Obj)
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	local T={x,y,z}
	return T
end
--------------------------------------------------------海比絲姬，第一階段任務離開消失
function AG_424093_LevandDisappear()
	local xyz=AGUSE02(OwnerID())				--table,裝座標
	local Obj_H=Lua_DW_CreateObj("xyz",117907,xyz,1,27,1)	--叫出另一隻海比絲姬做表演
	CallPlot(Obj_H,"AG_424093_01",Obj_H,xyz[1],xyz[2],xyz[3])	--用叫出來的npc呼叫函式
end

function AG_424093_01(Obj_H,x,y,z)
		AdjustFaceDir(Obj_H,TargetID(),0)
		Sleep(10)
		say(Obj_H,"[SC_424093_1]")				--要設定字串SC_424093_1，相信你不會讓自己受傷的，記得來遺跡中找我。
		--Say(Obj_H,"test")
		Sleep(10)
		Move( Obj_H, x+500 , y, z-200 )
		Sleep(20)
		DelObj(Obj_H)	
end
--------------------------------------------------------夏司，第一階段任務結束觸發劇情「我們開始吧…」
function AG_424094_ShowYourBlood()
	AddBuff(TargetID(),509369,1,20)
	local xyz=AGUSE02(OwnerID())
	local Obj_HS=Lua_DW_CreateObj("xyz",117908,xyz,1,230,1)
	WriteRoleValue(Obj_HS,EM_RoleValue_IsWalk,0)
	CallPlot(Obj_HS,"AG_424094_01",Obj_HS,xyz[1],xyz[2],xyz[3],TargetID())
end
function AG_424094_01(Obj_HS,x,y,z,Player)
		Sleep(10)
		Say(Obj_HS,"[SC_424094_1]")				--設定字串 SC_424094_1，我們開始吧…
		Sleep(10)
		Move(Obj_HS,x-20,y,z+22)
		Sleep(20)		
		PlayMotion(Obj_HS,148)
		sleep(10)
		AddBuff(Obj_HS,509157,1,2)
		ScriptMessage(Player,Player,1,"[SC_424094_2]",0)		--[117908]使用了[209258]，但石碑沒有任何反應。
		Sleep(10)
		Say(Obj_HS,"[SC_424094_3]")					--也不是這個嗎…
		Sleep(10)
		AddBuff(Obj_HS,509157,1,2)	
		sleep(10)
		ScriptMessage(Player,Player,1,"[SC_424094_4]",0)		--[117908]使用了[209259]，但石碑沒有任何反應。
		Sleep(10)
		Say(Obj_HS,"[SC_424094_5]")					--看來也不是這個…既然如此…
		Sleep(20)
		PlayMotion(Obj_HS,150)
		sleep(20)
		AddBuff(Obj_HS,509157,1,2)
		PlayMotion(Obj_HS,39)
		ScriptMessage(Player,Player,1,"[SC_424094_6]",0)		--[117908]使用了自己的鮮血，鮮血流在石碑上發出淡淡的光芒。
		Sleep(10)
		ScriptMessage(Player,Player,1,"[SC_424094_7]",0)		--光芒一下就消失了，石碑沒有任何反應。
		Sleep(20)
		PlayMotion(Obj_HS,41)
		Sleep(10)
		Say(Obj_HS,"[SC_424094_8]")					--看來還是失敗了…
		Sleep(10)
		Move(Obj_HS,x,y,z)
		Sleep(10)
		DelObj(Obj_HS)
end
--------------------------------------------------------夏司，第二階段任務--分為對話面與行動面，此為對話面
function  AG_424095_UnderTheBlood_talk()
	LoadQuestOption(OwnerID())
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	if CheckFlag(OwnerID(),544961)==false then
		AdjustFaceDir(TargetID(),OwnerID(),0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_1]","AG_424095_01",0)	
	end
end
function AG_424095_01()
	PlayMotion(TargetID(),112)
	SetSpeakDetail(OwnerID(),"[SC_424095_2]")					
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_3]","AG_424095_02",0)	
end
function AG_424095_02()
	SetSpeakDetail(OwnerID(),"[SC_424095_4]")				
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_5]","AG_424095_03",0)	
end
function AG_424095_03()
	SetSpeakDetail(OwnerID(),"[SC_424095_6]")					
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424095_7]","AG_424095_04",0)
end
function AG_424095_04()
	SetSpeakDetail(OwnerID(),"[SC_424095_8]")				
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	SetFlag(OwnerID(),544961,1)
end
--------------------------------------------------------夏司，第二階段任務--行動面--或得旗標後--可以點擊的東西出現
function AG_424095_UnderTheBlood_act_after()
	if CountBodyItem(OwnerID(),209260)==1	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_ITEM_UNIQUE]",0)
		return false
	end
		AddBuff(OwnerID(),509418,1,5)
		AddBuff(TargetID(),509157,1,-1)
	return true
end
function AG_424095_UnderTheBlood_act_before()
	local OBJ_state=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if	OBJ_state==0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,250)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_9]",0)
			AddBuff(TargetID(),509157,1,-1)
			return 1
		elseif	OBJ_state==250 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,500)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_10]",0)
			return 1
		elseif	OBJ_state==500 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424095_11]",0)	
			Lua_CancelAllBuff(TargetID())
			AddBuff(TargetID(),507096,1,1)			
			GiveBodyItem(OwnerID(),209260,1)
			SetFlag(OwnerID(),544960,0)
			return 1
		else
			return 1
		end	
end
--------------------------------------------------------種117835時會用到的石板函式
function AGUSE_STORN01(X)
	local Obj_HS=Lua_DW_CreateObj("obj",X,OwnerID(),0,1)
END
--------------------------------------------------------424096隱藏的訊息，先說話給旗標
function LuaS_424096_AG()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest(OwnerID(),424096) and CountBodyItem(OwnerID(),209260)==1 then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_1]","LuaS_424096_01",0)
	end
	--if CheckAcceptQuest(OwnerID(),424109)==true or CheckCompleteQuest(OwnerID(),424109)==true then
	--	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423688_1]","LuaS_424109_01",0)
	--end
end
--function LuaS_424109_01()
--	SetPos(OwnerID(),2944,569,10243,137)
--end
function LuaS_424096_01()
	SetSpeakDetail(OwnerID(),"[SC_424096_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_3]","LuaS_424096_02",0)
end
function LuaS_424096_02()
	PlayMotion(TargetID(),112)
	SetSpeakDetail(OwnerID(),"[SC_424096_4]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_5]","LuaS_424096_03",0)
end
function LuaS_424096_03()
	SetSpeakDetail(OwnerID(),"[SC_424096_6]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424096_7]","LuaS_424096_04",0)
end
function LuaS_424096_04()
	SetSpeakDetail(OwnerID(),"[SC_424096_8]")
	DelBodyItem(OwnerID(),209260,1)
	SetFlag(OwnerID(),544962,1)
end

function LuaQ_424096_Complet()
	local xyz=AGUSE02(OwnerID())
	local xyz1={xyz[1]+15,xyz[2],xyz[3]+15}
	local roada=Lua_DW_CreateObj("xyz",105478,xyz1,1,0,1)
	CallPlot(roada,"LuaQ_424096_C_2",roada)
end
function LuaQ_424096_C_2(roada)
	Sleep(10)
	AdjustFaceDir(roada,OwnerID(),0)
	Sleep(10)
	Say(roada,"[SC_424096_9]")
	Sleep(10)
	Say(roada,"[SC_424096_10]")
	Sleep(30)
	Move(roada,3439,187,11087)
	Sleep(20)
	DelObj(roada)
	return
end
--------------------------------------------------------424097點擊袋子
function AG_424097FakeAndTrue_bag()					--209262袋子會表示
	local Energe=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)		--SC_424097目前充能狀況
	return
end
--------------------------------------------------------424097點擊能量石
function AG_FakeAndTrue_Storn_BP()						--209263能量石會表示
	local num=DW_RAND(3)
	local Energe=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)

		if	CountBodyItem(OwnerID(),209262)==1 then		--假如有魔法布袋
				Energe=Energe+num
			if	Energe>=8	then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)
				DelBodyItem(OwnerID(),209262,1)
				GiveBodyItem(OwnerID(),209261,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
				return
			else
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,Energe)
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424097]"..Energe,0)
			end
		else
			--不做事
		end
end
--------------------------------------------------------點擊充能魔法袋
function AG_424097FakeAndTrue_MagPack()
	Beginplot( OwnerID() ,"AG_424097_00", 0 )
	GiveBodyItem(OwnerID(),209262,1)
end

function AG_424097_00()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate(OwnerID(),EM_LuaDialogType_Select,"[SC_424097_1]");	--SC_424097_1
	DialogSelectStr(OwnerID(),"[SC_424097_2]");				--SC_424097_2
	DialogSelectStr(OwnerID(),"[SC_424097_3]");				--SC_424097_3

	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		CancelBuff( OwnerID(), 501570 );
		return;
	end
	local SelectID = AG_GetDialogResoult( OwnerID() );
	CancelBuff( OwnerID(), 501570 );
	DialogClose( OwnerID() )
	if SelectID == 0  then
		AG_424097_01()
	elseif SelectID == 1  then
		AG_424097_02()
	else 
		-- 沒選
	end
	
end

function AG_GetDialogResoult(  GItemID )
	local Ret;
	for i = 0 , 40 , 1 do
		Sleep( 10 );
		Ret = DialogGetResult( GItemID );
		if Ret >-2 then
			if Ret>=0 then
				return Ret;
			elseif Ret==-1 then
				break
			end
		end
	end
	return -1
end

function AG_424097_01()
	AddBuff(OwnerID(),509575,1,2)
	Say(OwnerID(),"[SC_424097_2]")
	GiveBodyItem(OwnerID(),209264,1)
	--GiveBodyItem(OwnerID(),209262,1)
	return
end
function AG_424097_02()
	AddBuff(OwnerID(),509575,1,2)
	Say(OwnerID(),"[SC_424097_3]")
	GiveBodyItem(OwnerID(),209265,1)
	--GiveBodyItem(OwnerID(),209262,1)
	return
end
--------------------------------------------------------
function LuaQ_424098_HURRY_clickobj()
	IF CheckFlag(OwnerID(),544963)==TRUE and CountBodyItem(OwnerID(),209285)==0 then	--544963需對話給你旗標
		GiveBodyItem(OwnerID(),209285,1)
		return 1
	elseif	CheckFlag(OwnerID(),544963)==FALSE then
		AddBuff(OwnerID(),509430,0,5)
		return false
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_ITEM_UNIQUE]",0)
		return false
	end
end
function AG_424098_HURRY_01()	--說話拿544963旗標
		LoadQuestOption(OwnerID())						--我在忙，請別煩我！
	if CheckAcceptQuest(OwnerID(),424098) and CheckBuff(OwnerID(),509434)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_1]","AG_424098_01",0)
	end
end
function AG_424098_01()
	SetSpeakDetail(OwnerID(),"[SC_424098_2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_3]","AG_424098_02",0)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_4]","AG_424098_06",0)	
end
function AG_424098_02()
	SetSpeakDetail(OwnerID(),"[SC_424098_5]")					--5我說等一下了…你這個人聽不懂人話嗎？還是我得跟你說狗話才行？…汪汪汪…我現在沒空！
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_6]","AG_424098_03",0)		--6可是…
end
function AG_424098_03()
	SetSpeakDetail(OwnerID(),"[SC_424098_7]")					--7
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_8]","AG_424098_04",0)		--8但是…
end
function AG_424098_04()
	SetSpeakDetail(OwnerID(),"[SC_424098_9]")					--9哈…哈哈…你確定你還想繼續說下去？
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424098_10]","AG_424098_05",0)	--10悄悄的說
end
function AG_424098_05()
	CloseSpeak(OwnerID())
	--DisableQuest(TargetID(),true)
	CallPlot(TargetID(),"Lua_AG_Changebody1",TargetID(),OwnerID())
end
function AG_424098_06()
	SetSpeakDetail(OwnerID(),"[SC_424098_13]")	
	AddBuff(OwnerID(),509473,1,1)		
	SetFlag(OwnerID(),544963,1)
end
function Lua_AG_Changebody1(Obj,Player)
	--DisableQuest(Obj,false)
	ScriptMessage(Player,Player,0,"[SC_424098_11]","0xffff80ff")
	--Sleep(5)
	AdjustFaceDir(Obj,Player,0)
	Sleep(5)	
	CastSpell(Obj,Player,497560)
	DW_CancelTypeBuff(68,Player)
	Sleep(10)	
	Say(Obj,"[SC_424098_12]")
end
--------------------------------------------------------
--壺？對話
function LuaS_118031_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),112)
		if CheckAcceptQuest(OwnerID(),424101)==true then
--聽說你是最先發現壺的人？
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424101_1]","LuaS_118031_02",0)
		end
end
function LuaS_118031_02()
	SetSpeakDetail(OwnerID(),"[SC_424101_2]")
	SetFlag(OwnerID(),544984,1)
end
function LuaS_118032_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),112)
		if CheckAcceptQuest(OwnerID(),424101)==true then
--我想聽聽關於那個出土的壺？
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424101_3]","LuaS_118032_02",0)
		end
end
function LuaS_118032_02()
	SetSpeakDetail(OwnerID(),"[SC_424101_4]")
	SetFlag(OwnerID(),544985,1)
end
--------------------------------------------------------
function luaS_118033_01()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest(OwnerID(),424109)==true and CountBodyItem(OwnerID(),209294)==0 then
		GiveBodyItem(OwnerID(),209294,1)
	end
end
--以下不用了
function luaS_118033_02()
	CloseSpeak(OwnerID())
	if	CountBodyItem(OwnerID(),209289)==10 then
		CastSpell(OwnerID(),OwnerID(),497181)
		sleep(20)
		GiveBodyItem(OwnerID(),209291,1)
	end
end
--------------------------------------------------------
--調查可疑，點擊包包
function LuaI_209292_AfterUse()
	local NPCTT=SearchRangeNPC(OwnerID(),50)
	local num=table.getn(NPCTT)
	for i=0,num,1 do
		local npcid=ReadRoleValue(NPCTT[i],EM_RoleValue_OrgID)
		if npcid==118123 then
			local Obj=Lua_DW_CreateObj("obj",118124,NPCTT[i])
			SetModeEx(Obj,EM_SetModeType_Mark,false)
			CallPlot(NPCTT[i],"LuaFunc_ResetObj",NPCTT[i])
			return
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_VALENTINE_2011EV1_07]",0)
end
--初始劇情
function LuaI_118124_suspicious()
	local Plase=AGUSE02(OwnerID())
	local No_See2=Lua_DW_CreateObj("xyz",105621,Plase,1,27,1)
	WriteRoleValue(No_See2,EM_RoleValue_Register,OwnerID())
	CallPlot(No_See2,"Lua_AG_Suspicious",No_See2,Plase[1],Plase[2],Plase[3])
end
function Lua_AG_Suspicious(No_See2,x,y,z)
	SetModeEx(No_See2,EM_SetModeType_Fight,true)
	SetModeEx(No_See2,EM_SetModeType_Mark,true)
	SetModeEx(No_See2,EM_SetModeType_Move,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Gravity,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Searchenemy,FALSE)
	SetModeEx(No_See2,EM_SetModeType_Strikback,true)
	SetModeEx(No_See2,EM_SetModeType_AlignToSurface,FALSE)
	AddBuff(No_See2,507646,1,-1)
	AddBuff(No_See2,509456,0,604800)
end
--死亡劇情1
function Lua_AG_105621_dead()
	SetPlot(OwnerID(),"dead","Lua_AG_105621_dead_01",0)
end
function Lua_AG_105621_dead_01()
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	AddBuff(OwnerID(),509473,0,3)
	DelObj(Obj)
	DW_QietKillOne(TargetID(),105622)
	DelObj(OwnerID())
	return
end
-------------------------------------------------------424103上鎖
--靠近物品
function LuaI_118122_01()
	SetPlot(OwnerID(),"range","LuaI_118122_02",40)
end
function LuaI_118122_02()
	if CheckFlag(OwnerID(),544986)==false and CheckAcceptQuest(OwnerID(),424103)==true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424103_1]",0)
		return
	else
		return
	end
end
--點擊物品
function LuaQ_424103_AfterClickObj()
	if CheckFlag(OwnerID(),544986)==false and CheckAcceptQuest(OwnerID(),424103)==true then
		local Obj=Lua_DW_CreateObj("obj",118120,TargetID())
			SetModeEx(Obj,EM_SetModeType_Mark,false)
			CallPlot(Obj,"LuaQ_424103_01",Obj,OwnerID())
		return 1
	end
	return false
end
function LuaQ_424103_01(Obj,Obj2)
		PlayMotion(Obj,150)
		Sleep(10)
		MoveDirect(Obj,3831.3,223.6,12893.5)
		Sleep(20)
		Say(Obj,"[SC_424103_2]")
		Sleep(10)
		--AdjustFaceDir(Obj,Obj2,0)
		SetFlag(Obj2,544986,1)
		SetFlag(Obj2,545015,1)
		DelObj(Obj)
		return 
end
function LuaQ_424103_Complet()
	SetFlag(TargetID(),545015,1)
end
-------------------------------------------------------
--襲擊事件，初始劇情
function LuaI_118034_Suspicious()
	local Plant=OwnerID()
	local Plase=AGUSE02(Plant)--找座標
	local No_See2=Lua_DW_CreateObj("xyz",118035,Plase,1,27,1)
	WriteRoleValue(No_See2,EM_RoleValue_Register,Plant)
	CallPlot(No_See2,"Lua_AG_Suspicious1",No_See2)
	SetPlot(OwnerID(),"range","Lua_AG_FarMonster",80)
end
function Lua_AG_Suspicious1(No_See2)
	SetModeEx(No_See2,EM_SetModeType_Fight,true)
	SetModeEx(No_See2,EM_SetModeType_Mark,true)
	SetModeEx(No_See2,EM_SetModeType_Move,false)
	SetModeEx(No_See2,EM_SetModeType_Gravity,false)
	SetModeEx(No_See2,EM_SetModeType_Searchenemy,false)
	SetModeEx(No_See2,EM_SetModeType_Strikback,false)
	SetModeEx(No_See2,EM_SetModeType_AlignToSurface,false)
	AddBuff(No_See2,509456,0,604800)
end
--碰觸劇情
function Lua_AG_FarMonster()
	local Play_T=SearchRangePlayer(OwnerID(),100)
	local num=table.getn(Play_T)
	for i=0,num,1 do
		if CheckAcceptQuest(Play_T[i],424106)==true	then
			local dir=ReadRoleValue(Play_T[i],EM_RoleValue_Dir)
			local Plase=AGUSE02(OwnerID())
			local monster=Lua_DW_CreateObj("xyz",105451,Plase,1,Dir,1)
			--CallPlot(monster,"Lua_AG_ShowMonster",monster,Play_T[i])
		else
			return
		end
	end
end
--死亡劇情
function LuaS_118035_Dead()
	SetPlot(OwnerID(),"dead","Lua_AG_PlantBlock",0)
end
function Lua_AG_PlantBlock()
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	local monster=Lua_DW_CreateObj("obj",105451,Obj)
	AddBuff(OwnerID(),509473,0,3)
	CallPlot(Obj,"LuaFunc_ResetObj",Obj)
	DelObj(OwnerID())
	return
end
function Lua_105451_HateListCount()
	Sleep(100)
	while 1 do
		if HateListCount(OwnerID())==0 then
			DelObj(OwnerID())
			return
		end
		Sleep(30)
	end
end
--------------------------------------------------------
--悲傷的記憶
Function LuaI_209294_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetString("SC_424109_1"));
	AddBorderPage( OwnerID(), GetString("SC_424109_2"));
	AddBorderPage( OwnerID(), GetString("SC_424109_3"));
	AddBorderPage( OwnerID(), GetString("SC_424109_4"));
	ShowBorder( OwnerID(), 0, Str,"ScriptBorder_Texture_Paper" )
	SetFlag(OwnerID(),545017,1)
end

----------------------------------------說話遺跡
function LuaQ_424110_Accapt()
	SetPos(TargetID(),-178,1150,11061,260)
end
function LuaS_118230_01()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424110)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_116269_K_STORY_16]"," LuaS_118230_02",0)
	end
end
function  LuaS_118230_02()
	SetPos(OwnerID(),860,317,12899,86)
end

function LuaS_118227_BA()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118227_BA1",0)
end
function LuaS_118227_BA1()
	SetSpeakDetail(OwnerID(),"[SC_424110_3]")
	SetFlag(OwnerID(),545028,1)
end
function LuaS_118228_HI()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118228_HI1",0)
end
function LuaS_118228_HI1()
	SetSpeakDetail(OwnerID(),"[SC_424110_1]")
	SetFlag(OwnerID(),545030,1)
end
function LuaS_118228_OS()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_118229_OS1",0)
end
function LuaS_118229_OS1()
	SetSpeakDetail(OwnerID(),"[SC_424110_2]")
	SetFlag(OwnerID(),545029,1)
end
----------------------------------送信
function LuaS_118238_1()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_118238_1]","LuaS_118238_2",0)
end
function LuaS_118238_2()
	SetSpeakDetail(OwnerID(),"[SC_118238_2]")
	SetFlag(OwnerID(),544987,1)
end
----------------------------------考古包
function luaI_209291_1()
	local T_npc=SearchRangeNPC(OwnerID(),50)
	local num=table.getn(T_npc)
	for i=0,num,1 do
		local Obj=ReadRoleValue(T_npc[i],EM_RoleValue_OrgID)
		if Obj==118160 then
			SetModeEx(T_npc[i],EM_SetModeType_Mark,true)
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_VALENTINE_2011EV1_07]",0)
end
--------------------------------傳送門+buff
function LuaS_118240_Gate()
	SetPlot(OwnerID(),"range","LuaS_118240_Gate1",25)
end
function LuaS_118240_Gate1()
	--Say(OwnerID(),TargetID())
	SetPos(OwnerID(),3179,132,11075,0)
end
function Lua_118240_Gate2()
	AddBuff(OwnerID(),509576,1,60)
end

function AGUSE03(x)
	AddBuff(OwnerID(),x,0,-1)
end

function lua_AGtest05()
	while 1 do
	CastSpell(OwnerID(),2883666,497196)
	Sleep(20)
	end
end
--沒信封給信封
function LuaC_118239_Mail()
	LoadQuestOption(OwnerID());
	if	CheckAcceptQuest(OwnerID(),424201)==true and
		CountBodyItem(OwnerID(),209295)==0	then
		GiveBodyItem(OwnerID(),209295,1)
	end
end