--基德之子，範圍劇情
function szLuaInitScript_122966() 
	SetPlot( OwnerID(),"range","rangeLua_122966_1",100 )
end
function rangeLua_122966_1() 
	if CheckAcceptQuest( OwnerID(),426487) then
		CallPlot( OwnerID(),"rangeLua_122966_2",TargetID() )
	end
end
function rangeLua_122966_2(obj)
	PlayMotion( obj,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(10)
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426487_1]",0 )
	Sleep(25)
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426487_2]",0 )
	Sleep(25)
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426487_3]",0 )
end
--主線任務2_426488_神祕的基德之子
function szLuaScript_122966()
	if CheckAcceptQuest( OwnerID(),426488) and CheckFlag( OwnerID(),548386 )==false then
		SetSpeakDetail( OwnerID(),"[SC_426488_1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426488_2]","SpeakOption_122966_m(2)",0)
	else
		LoadQuestOption( OwnerID() )
	end
end
function SpeakOption_122966_m( k )
	k = k + 1;
	SetSpeakDetail( OwnerID(),"[SC_426488_"..k.."]")
	if k < 13 then
		k = k+ 1;
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426488_"..k.."]","SpeakOption_122966_m("..k..")",0)
	else
		SetFlag( OwnerID(),548386,1)
	end
end
--426491 紅衣女子
function szLuaScript_122968()
	if CheckAcceptQuest( OwnerID(),426491) and CheckFlag( OwnerID(),548387 )==false then
		SetSpeakDetail( OwnerID(),"[SC_426491_1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426491_2]","SpeakOption_122968_m(2)",0)
	else
		LoadQuestOption( OwnerID() )
	end
end
function SpeakOption_122968_m(k)
	k = k + 1;
	SetSpeakDetail( OwnerID(),"[SC_426491_"..k.."]")
	if k < 7 then
		k = k+ 1;
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426491_"..k.."]","SpeakOption_122968_m("..k..")",0)
	else
		SetFlag( OwnerID(),548387,1)
	end
end
--426492 兩地行動
function szLuaScript_122969()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID(),426492) then
		SetFlag( OwnerID(),548388,1 )
	end
end

function szLuaInitScript_122985()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_SLEEP_LOOP)
end

--看圖說故事，魯斯
function szLuaScript_122967()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(),426497) and CheckFlag( OwnerID(),548389)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426497_1]","SpeakOption_122967_m(1)",0)
	end	
end
function SpeakOption_122967_m(k)
	k = k + 1;
	SetSpeakDetail( OwnerID(),"[SC_426497_"..k.."]")
	if k < 10 then
		k = k+ 1;
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426497_"..k.."]","SpeakOption_122967_m("..k..")",0)
	else
		SetFlag( OwnerID(),548389,1)
	end
end

--三地封印，接任務給旗標548397
function szScript_OnAccept_426506()
	SetFlag( TargetID(),548397,1)
end
--第一地
function szScript_OnComplete_426499()
	SetFlag( TargetID(),548390,1)
end
--第二地
function szScript_OnComplete_426500()
	SetFlag( TargetID(),548391,1)
end
--第三地
function szScript_OnComplete_426501()
	SetFlag( TargetID(),548392,1)
end
--前往召喚之地，與威爾對話
function szLuaScript_122972()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID(),426502 ) then
		SetFlag( OwnerID(),548398,1 )
	end
	if CheckAcceptQuest( OwnerID(),426503 ) and CheckFlag(OwnerID(),548399)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423177_0]","readyToQuest_426503",0)	--我準備好了
	end
end
--任務：召來「新月」
function readyToQuest_426503()
	CloseSpeak( OwnerID() )
	local testObj = 116858
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==testObj then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--表演正在進行中，請稍候…
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426503_2",obj )
		end
end
--關對話，種obj播表演

function readyToQuest_426503_2(O_ID)
	local QuestID = 426503			--任務編號
	local FinishFlagID = 548399			--完成任務獲得的旗標
	local CheckBuffID = 621881			--檢查是否正在演戲的BUFF
	local CheckRange = 150			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 122976, 780867, 1, 1 )	--表演用威爾
		ActorArray[2] =CreateObjByFlag( 122977, 780867, 2, 1 )	--表演用紅衣女子
		ActorArray[3] =CreateObjByFlag( 122974, 780867, 3, 1 )	--表演用魔獸
		ActorArray[4] =CreateObjByFlag( 122975, 780867, 4, 1 )	--表演用賽西蒙德
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			WriteRoleValue( ActorArray[1] , EM_RoleValue_IsWalk , 0 )
			moveToFlagEnabled( ActorArray[1], false )
			moveToFlagEnabled( ActorArray[2], false )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)

	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--表演開始
	--範圍看戲用的檢查函式
			Sleep(10)
			LuaFunc_MoveToFlag( ActorArray[1], 780867, 5, 0 )
			Sleep(10)
			Say(ActorArray[2],"[SC_426503_1]" )	--讓我等真久，快點用警告之石啟動它吧
			Sleep(20)
			Say(ActorArray[1],"[SC_426503_2]" )	--別再囉嗦了，沒看到我正在用嗎？
			PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			Sleep(30)
			Say(ActorArray[1],"[SC_426503_3]" )	--可以請你安靜個幾秒鐘，可以嗎？
			Sleep(30)
			PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[2],"[SC_426503_4]" )	--你…你真是很有惹人生氣的本事，再嘴硬就讓你嚐嚐苦頭。
			Sleep(10)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
			AddToPartition(ActorArray[3],RoomID)
			Sleep(30)
			Say(ActorArray[1],"[SC_426503_5]" )	--小心…開始了。
			PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			Sleep(10)
			AddBuff( ActorArray[3],622943,0,15)
			Sleep(20)
			setDefIdleMotion( ActorArray[3],ruFUSION_MIME_IDLE_COMBAT_UNARMED )
			Say(ActorArray[2],"[SC_426503_6]" )--這…這是…
			Sleep(20)	
			Say(ActorArray[1],"[SC_426503_7]" )--小心！
			local tmptime =LuaFunc_MoveToFlag( ActorArray[1], 780867, 2, 0 )
			Sleep(tmptime)
			CastSpell( ActorArray[3],ActorArray[1],850690 )
			PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_DYING)
			Sleep(20)
			Say(ActorArray[2],"[SC_426503_8]" )--威爾！
			Sleep(20)
			Say(ActorArray[2],"[SC_426503_9]" )--可惡，我生氣了…
			CastSpell( ActorArray[2],ActorArray[2],496128)
			Sleep(20)
			AddToPartition( ActorArray[4],RoomID )
			CastSpell( ActorArray[4],ActorArray[3],498337)
			Sleep(20)
			PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_DYING)
			Say(ActorArray[2],"[SC_426503_10]" )--這…這是…
			AdjustFaceDir( ActorArray[2],ActorArray[4],0)
			Sleep(30)
			Say(ActorArray[4],"[SC_426503_11]" )--又是你們阿…還真是窮追不捨的蟲子。
			Sleep(30)
			Say(ActorArray[4],"[SC_426503_12]" )--算了，只要別阻礙我就行了，否則就殺了你們。
			Sleep(30)
			Say(ActorArray[2],"[SC_426503_13]" )--你是什麼東西阿…
			Sleep(30)
			Say(ActorArray[2],"[SC_426503_14]" )--喂！ 
			Sleep(30)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end

--426499 西南方封印，點擊前判斷
function szScript_OnClickObjBegin_426499()
	local tmpNPC = SearchRangeNPC( TargetID(),200 )
	local num =0
		for i=0,#tmpNPC,1 do
			if ReadRoleValue( tmpNPC[i],EM_RoleValue_OrgID )==108135 then
				local tmpk = tmpNPC[i]
				if ReadRoleValue( tmpk,EM_RoleValue_IsDead )~=1 then
					num=num+1
				end
			end
		end
		if CountBodyItem( OwnerID(),243007)~=0 then
			if num>=1 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_426499_1]",0)	--魔獸已經存在
				return false
			else
				return true
			end
		end
		ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426499_4]",0)	--你身上沒有[243007]。
		return false
end
--426499 西南方封印，點擊後
function szScript_OnClickObjEnd_426499()
	AddBuff( TargetID(),620932,0,3 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426499_3]",0)
	CallPlot( TargetID(),"creatMonster_426499_01",OwnerID() )
	return 1
end
--426499 西南方封印，點擊後01
function creatMonster_426499_01(player)
	local monster = 108135
	local x,y,z,dir = DW_Location( OwnerID() )
	local k01 = CreateObj( monster,x,y,z,dir,1)
		AddToPartition( k01,0 )
		SetAttack( k01,player )
		Sleep(30)
			while true do
				if CheckDistance( OwnerID(),k01,150 )==false then
					ScriptMessage( player,player,1,"[SC_426499_2]",0) --距離太遠了
					DelObj( k01)
					return
				elseif ReadRoleValue( k01,EM_RoleValue_IsDead )==1 then
					return
				elseif HateListCount( k01) ==0 then
					DelObj( k01)
					return
				end
				Sleep(20)
			end
end

--426499 北方封印，點擊前判斷
function szScript_OnClickObjBegin_426500()
	local tmpNPC = SearchRangeNPC( TargetID(),200 )
	local num =0
		for i=0,#tmpNPC,1 do
			if ReadRoleValue( tmpNPC[i],EM_RoleValue_OrgID )==108136 then
				local tmpk = tmpNPC[i]
				if ReadRoleValue( tmpk,EM_RoleValue_IsDead )~=1 then
					num=num+1
				end
			end
		end
		if CountBodyItem( OwnerID(),243009)>0 then
			return false
		end
		if CountBodyItem( OwnerID(),243007)~=0 then
			if num>=1 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_426499_1]",0)	--魔獸已經存在
				return false
			else
				return true
			end
		end
		ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426499_4]",0)	--你身上沒有[243007]。
		return false
end
--426500 北方封印，點擊後
function szScript_OnClickObjEnd_426500()
	AddBuff( TargetID(),620932,0,3 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426499_3]",0)
	CallPlot( TargetID(),"creatMonster_426500_01",OwnerID() )
	return 1
end
--426500 北方封印，點擊後01
function creatMonster_426500_01(player)
	local monster = 108136
	local x,y,z,dir = DW_Location( OwnerID() )
	local k01 = CreateObj( monster,x,y,z,dir,1)
		AddToPartition( k01,0 )
		SetAttack( k01,player )
		Sleep(30)
			while true do
				if CheckDistance( OwnerID(),k01,150 )==false then
					ScriptMessage( player,player,1,"[SC_426499_2]",0) --距離太遠了
					DelObj( k01)
					return
				elseif ReadRoleValue( k01,EM_RoleValue_IsDead )==1 then
					return
				elseif HateListCount( k01) ==0 then
					DelObj( k01)
					return
				end
				Sleep(20)
			end
end

--基德特效
function szLuaInitScript_122979()
	AddBuff( OwnerID(),624055,0,-1)
end

--拉弓
function szLuaInitScript_122978()
	setDefIdleMotion( OwnerID(), ruFUSION_MIME_ATTACK_BOW_LOOP)
end

function LuaI_HouseMan_1()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_HouseMan );
end