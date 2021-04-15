--警衛巡邏劇情
function LuaAG_Patrol_leader()

	local dis = 10
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 100  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106792,Matrix,3,-1 )
	
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106792,Matrix,2,0 )

	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106792,Matrix,2,0 )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaAG_Patrol_Relife" , 0 );

end

function LuaAG_Patrol_Relife()
	BeginPlot( OwnerID() , "LuaAG_Patrol_leader" , 2 );
end


--test用
function luaAG_SoulSmoke()
	local obj=0
	while true do
		obj=CreateObjByFlag( 120485, 780871 , 0 , 1 );
		SetModeEx( obj , EM_SetModeType_Mark , false ) 
		AddToPartition(obj,0)
		CallPlot(obj,"luaAG_SoulSmoke1",obj)
		Sleep(30)
	end
end
function luaAG_SoulSmoke1()

	LuaFunc_MoveToFlag( OwnerID(), 780871 , 1 ,0 )
	Sleep(30)
	--DebugMsg(0,0,"2")
	DelObj(OwnerID())
end


function lua_dragonpo_test()
	local Target=SearchRangeNPC(OwnerID(),1000)
	local rTarget={}
	local nRand=0
		for i=0,#Target do
			if  ReadRoleValue( Target[i] , EM_RoleValue_OrgID ) == 117560 then
				table.insert(rTarget ,Target[i])
			end
		end
		while 1 do
			nRand=Rand(3)+1
				CastSpell(OwnerID(),rTarget[nRand], 498754)
			Sleep(20)
		end
		--for i=0,#Target do
		--	if  ReadRoleValue( Target[i] , EM_RoleValue_OrgID ) == 117560 then
		--		table.insert(rTarget ,Target[i])
		--	end
		--end
		--while 1 do
		--	local nRand={1,2,3,4,5}
		--	for j=1,2 do
		--		local NN = Rand(table.getn(nRand))+1
		--		DebugMsg(0,0,NN)
		--		--SysCastSpellLv(OwnerID(),rTarget[nRand[NN]], 498754,1)
		--		CastSpell(OwnerID(),rTarget[nRand[NN]], 498754)
		--		table.remove(nRand,NN)
		--	end
		--	Sleep(20)
		--end
end


--2012/02/29 長植物測試
function Lua_120482_touche()
		SetPlot( OwnerID(),"touch","Lua_120482_1",40 );
end
function Lua_120482_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	CallPlot(O_ID,"Lua_120482_2",O_ID,T_ID);
end

function Lua_120482_2(O_ID,T_ID)
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_421029_2]", 20, 131, 133, 0, "Lua_120482_3" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function Lua_120482_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			DebugMsg(0,0,"past 1")
			EndCastBar( O_ID, CheckStatus )
			local ObjID = Lua_DW_CreateObj( "obj" , 120488 , T_ID )
			DebugMsg(0,0,ObjID )
			Hide(T_ID)
			CallPlot(ObjID,"Lua_120482_4",ObjID,T_ID)
			DebugMsg(0,0,"past 2")
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
function Lua_120482_4(O_ID,T_ID)
	DebugMsg(0,0,"past 3")
	Sleep(100);
	DebugMsg(0,0,"past 4")
	DebugMsg(0,0,OwnerID())
	DebugMsg(0,0,TargetID())
	Show(T_ID,0);
	DelObj(O_ID);
end



function lua_test_Tank02( p_top , UpDown )	--攻城車主要script
	local SkillID = { 497219 , 497220 }			--火藥炮、碎裂炮火
	local SkillLv = { 0 , 0 }
	local Pos									--讀取玩家BUFF位置
	local Time									--殘餘火藥剩下的時間
	if UpDown == 1 then							--上車
		--Say( OwnerID() , "In" )
		SetFlag( OwnerID() , 545041 , 1 )		--給重要物品旗標
		AddBuff( OwnerID() , 509876 , 0 , -1 )	--上車BOSS不打
		Pos = Lua_BuffPosSearch( OwnerID() , 509271 )
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
		AddBuff( TargetID() , 509271 , 0 , Time )
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , OwnerID() )
		SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
	elseif UpDown == 0 then						--下車
		--Say( OwnerID() , "Out" )
		SetFlag( OwnerID() , 545041 , 0 )		--取消重要物品旗標
		CancelBuff( OwnerID() , 509876 )		--取消上車BOSS不打
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , 0 )
		DelExSkill( OwnerID() , TargetID() , SkillID[1] )
		DelExSkill( OwnerID() , TargetID() , SkillID[2] )
	end
end

function lua_test_use11()
	Say(OwnerID(),"1")
	LuaFunc_MoveToFlag(OwnerID(),780871,2,0)
end


function luaT120710_01()	--角色光龍信使對話劇情01
	--local Cd={};
	--local Cd[1] = CheckCompletequest(OwnerID(), )	--是否完成主線任務
	--local Cd[2] = CheckCompletequest(OwnerID(), )	--是否完成支線任務
	--	if Cd[1] then
			SetSpeakDetail( OwnerID(), "[SC_120710_S01]" ); 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C01"), "luaT120710_02", 0 );
	--	elseif Cd[2] then
	--		SetSpeakDetail( OwnerID(), "[SD_110000_1]" ); 
	--	else
	--		SetSpeakDetail( OwnerID(), "[SD_110000_1]" ); 
	--	end
end

function luaT120710_02()	--角色光龍信使對話劇情02
	SetSpeakDetail( OwnerID(), "[SC_120710_S02]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C02"), "luaT120710_03", 0 );
end

function luaT120710_03()	--角色光龍信使對話劇情03
	SetSpeakDetail( OwnerID(), "[SC_120710_S03]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C03"), "luaT120710_04", 0 );
end

function luaT120710_04()	--角色光龍信使對話劇情04
	LoadQuestOption(OwnerID())
end

--
function luaTZ23120715_01()	--角色水龍穎克兒對話劇情01
	AdjustFaceDir(TargetID(),OwnerID(),0)
	local Cd={}
	Cd[1] = CheckAcceptQuest( OwnerID(),425427 )	--是否完成支線任務
	if Cd[1] then
		SetSpeakDetail( OwnerID(), "[SC_Z23120715_C01]" ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S01"), "luaTZ23120715_02", 0 );
	else
		LoadQuestOption(OwnerID())		
	end
end
function luaTZ23120715_02()	--角色水龍穎克兒對話劇情02
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C02]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S02"), "luaTZ23120715_03", 0 );
end
function luaTZ23120715_03()	--角色水龍穎克兒對話劇情03
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C03]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S03"), "luaTZ23120715_04", 0 );
end
function luaTZ23120715_04()	--角色水龍穎克兒對話劇情04
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C04]" ); 
end
--

function luaT425427_01()	--與卡爾沛斯．沃克對話01
	AdjustFaceDir(TargetID(),OwnerID(),0)
	local Cd={};
	 Cd[1] = CheckCompletequest( OwnerID(),425427 )	--是否完成主線任務
		if Cd[1] then
			SetSpeakDetail( OwnerID(), "[SC_Z23425427_01]" ); 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23425427_02"), "luaT425427_02", 0 );
		else
			LoadQuestOption(OwnerID())		
		end
end
function luaT425427_02()	--與卡爾沛斯．沃克對話02
	SetSpeakDetail( OwnerID(), "[SC_Z23425427_03]" ); 
end


--角色火龍它許泰對話劇情01
function lua_z23q425427_talk()
	if CheckAcceptQuest(OwnerID(),425427) and
		CheckFlag( OwnerID(),546494 )==false then
		SetSpeakDetail( OwnerID(),"[SC_Z23120716_C01]" )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120716_S01"), "lua_z23q425427_t01", 0 )
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23q425427_t01()
	SetSpeakDetail( OwnerID(),"[SC_Z23120716_C02]" )
	SetFlag(OwnerID(),546494,1)
end

--讀書動作。
function Lua_AG_Read()
	AddBuff( OwnerID(), 501609 , 0 ,-1)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_READING_BEGIN,ruFUSION_ACTORSTATE_READING_LOOP)
	sleep(30)
end
--z23,聖所守衛，掛在戰鬥開始時，呼叫同伴攻擊
function lua_z23uesCallMeFrieds()	--use打錯成ues 懶得改了
	local friends=SearchRangeNPC(OwnerID(),150)
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==106793 then
			SetAttack(friends[i],TargetID())
		end
	end
end
--z23,經過聖所時的判定條件，如果沒解主線的話，會被殺
function lua_z23youCannotPassLa1()
	SetPlot( OwnerID(),"range","lua_z23youCannotPassLa2",100 ) 
end
function lua_z23youCannotPassLa2()
	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)
	if PlayerJob==0		then			--排除GM
		return
	end
	if CheckCompleteQuest( OwnerID(),425478 ) then
		--Say(OwnerID(),"1")
		return
	end
	local friends=SearchRangeNPC(TargetID(),150)
		--Say(TargetID(),"2")
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==106793 then
			SetAttack(friends[i],OwnerID())
		end
	end
end

function lua_z23i241300_usebeful()	--物品241300霧裝藥劑使用判定
	local tID=TargetID()
	local oID=OwnerID()
	local Dead=ReadRoleValue( TargetID(), EM_RoleValue_IsDead) 
	PlayMotion(tID,19)
	if tID==oID then
		CallPlot(tID,"lua_z23i241300_use01",1,oID)
	elseif ReadRoleValue(tID,EM_RoleValue_OrgID)==106795 or
	ReadRoleValue(tID,EM_RoleValue_OrgID)==101230 then
		if Dead==1 then
			ScriptMessage(tID,oID,1,GetString("EM_200928_1"),0)
		else
			CallPlot(tID,"lua_z23i241300_use01",2,oID)
		end
	end
end

function lua_z23i241300_use01(x,tID)
	local oID=OwnerID()
		Sleep(20)
	if x==1 then
		ScriptMessage(oID,tID,1,GetString("SC_Z23I241300_01"),0)
		AddBuff(tID,622609,0,10)
		return
	elseif x==2 then



		SetModeEx( oID  , EM_SetModeType_Mark, false )--標記
		SetModeEx( oID  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( oID  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( oID  , EM_SetModeType_Strikback, false )--反擊
		SetStopAttack(oID)
		PlayMotion(oID,181)
		Sleep(5)
		PlayMotion(oID,182)
		Sleep(5)
		PlayMotion(oID,183)
		Sleep(10)
		PlayMotion(oID,164)
		Sleep(10)
		local Penpen = DW_CreateObjEX("obj",120789,oID);
		ScriptMessage(oID,tID,1,GetString("SC_Z23I241300_02"),0)
		 lua_AGMoveToFlag( oID,780871,9,0)
		Sleep(20)
		DebugMsg(0,0,"1")
		CallPlot( oID, "LuaFunc_ResetObj", oID )
		return
	end
end

function Lua_z23npc120789_touche()	--任務便便觸碰劇情
		SetPlot( OwnerID(),"touch","Lua_z23npc120789_1",25 );
end
function Lua_z23npc120789_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelMount(O_ID)
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_USEOBJ_02]", 50, 131, 133, 0, "Lua_z23npc120789_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function Lua_z23npc120789_2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			DelBodyItem(O_ID,240957,1)
			GiveBodyItem( O_ID,241293,1 )
			DelObj( T_ID )
		else
			EndCastBar( O_ID, CheckStatus )
		end
	end
end	

function lua_testdd()
	SetDefIdleMotion(OwnerID(),101)
end

function lua_testdd_ini()
	SetDefIdleMotion(OwnerID(),11)
end

--任務425434，幫幫康葛斯對話
function  lua_z23q425434_01()
	--call 悄稍話
	if CheckAcceptQuest(OwnerID(),425434)==false and
	CheckCompleteQuest(OwnerID(),425434)==false then
	
		local npc=SearchRangeNPC(TargetID(),50)
		local act=0
			for i=0,#npc do
				if ReadRoleValue(npc[i],EM_RoleValue_OrgID)==120473 then
					act=npc[i]
				end
			end
		AdjustFaceDir(act,OwnerID(),0)
		Tell(OwnerID(),act,"[SC_Z23Q425434_01]")
	end
	if CheckAcceptQuest(OwnerID(),425434)==false then
		SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_02]")
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_03"), "lua_z23q425434_02", 0 );
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23q425434_02()
	LoadQuestOption(OwnerID())
end

function lua_z23q425434_w1()	--任務425434與溫蒂的對話
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion( TargetID(), 112) 
	if CheckAcceptQuest(OwnerID(),425434) and CheckFlag( OwnerID(),546490 )==false  and CountBodyItem(OwnerID(),241303)==0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_04"), "lua_z23q425434_w2", 0 );
	end
	if CheckAcceptQuest(OwnerID(),425437) and CheckFlag( OwnerID(),546493 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425437_01"), "lua_z23q425437_s1", 0 );
	end
end
function lua_z23q425434_w2()
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_05]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_06"), "lua_z23q425434_w3", 0 );
end
function lua_z23q425434_w3()
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_07]")
	GiveBodyItem(OwnerID(),241303,1)
end

--把康葛斯放出籠子劇情。
function Lua_120838_touche()
		SetPlot( OwnerID(),"touch","Lua_120838_1",40 );
end
function Lua_120838_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_Z23120838_1]", 20, 131, 133, 0, "Lua_120838_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function Lua_120838_2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			if DelBodyItem(O_ID,241303,1) then
				DebugMsg(0,0,"past 1")
				EndCastBar( O_ID, CheckStatus )
				SetFlag(O_ID,546490,1)
				CallPlot(T_ID,"lua_FinishQ425434_Show",O_ID) --呼叫兩個表演，一個是人物表演，一個是開籠對話
			else
				EndCastBar( O_ID, CheckStatus )
				DebugMsg(0,0,"past 2")
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
--釋放康葛斯表演
function lua_FinishQ425434_Show(tar)
	local RoomID=ReadRoleValue( OwnerID(),EM_RoleValue_RoomID )
	local Act=CreateObjByFlag( 120841, 780871 , 10 , 1 )
	SetModeEx( Act,EM_SetModeType_Mark,false )
	AddToPartition( Act,RoomID )
	AdjustFaceDir(Act,tar,0)
	Sleep(10)
	NpcSay( Act,"[SC_Z23Q425434_08]" )
	Sleep(30)
	DelObj(Act)
end
--未建字串
--SC_120838_1 打開牢籠。
--SC_120838_2 哈哈…感覺很久沒被人抓起來關了，感覺滿新鮮的。
--SC_120838_3 不過那個小鬼，我還是要去教訓教訓他。
--SC_120838_4 你身上並沒有鑰匙

--龍王與龍的故事
function lua_z23q425437_s1()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_02]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s2", 0 );
end
function lua_z23q425437_s2()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_03]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s3", 0 );
end
function lua_z23q425437_s3()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_04]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s4", 0 );
end
function lua_z23q425437_s4()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_05]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s5", 0 );
end
function lua_z23q425437_s5()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_06]")
	SetFlag( OwnerID(),546493,1 )
end
--使用黃金繩的檢查
function lua_QuestItem241289()
	local tmpTable={ 101230,101232,106795 }
	for i=1,3 do
		if ReadRoleValue( TargetID(),EM_RoleValue_OrgID)==tmpTable[i] then
			return true
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_I241289_TIP]",0)
	return false
end