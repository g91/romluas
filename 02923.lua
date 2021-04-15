--角色移動用
function lua_Z26_DramaStopMove()
	MoveToFlagEnabled( OwnerID(),false )
end

--桑妮．洛法
function szLuaScript_122183_1()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID() ,426179 ) and CheckFlag( OwnerID() ,548047 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426179_0]","szLuaScript_426179_2(1)",0 )
	end
	if CheckAcceptQuest( OwnerID() ,426182 ) or
	CheckAcceptQuest( OwnerID() ,426353 ) or
 	CheckAcceptQuest( OwnerID() ,426358 ) then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_117376_01]","giveBodyItem_242612_1",0 )--請給我更多的陷阱
	end
end
function giveBodyItem_242612_1()
	CloseSpeak( OwnerID())
	GiveBodyItem( OwnerID(),242612,5 )	--鋸火網
end
--安德森．克里斯
function szLuaScript_122184_1()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID() ,426179 ) and CheckFlag( OwnerID() ,548048 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426179_0]","szLuaScript_426179_2(2)",0 )
	end
end
--邦特．曼瑞
function szLuaScript_122185_1()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID() ,426179 ) and CheckFlag( OwnerID() ,548049 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426179_0]","szLuaScript_426179_2(3)",0 )
	end
end
--哈妮．曼雪
function szLuaScript_122186_1()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID() ,426179 ) and CheckFlag( OwnerID() , 548050 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426179_0]","szLuaScript_426179_2(4)",0 )
	end
	--if CheckAcceptQuest( OwnerID() ,426194 ) then
	--	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_1]","szLuaScript_426194_1",0)
	--end
end

--任務426179對話
function szLuaScript_426179_2( var )
	SetSpeakDetail( OwnerID(), "[SC_426179_"..var.."]" )
	SetFlag( OwnerID(), 548046+var  ,1)
end

--使用物品鋸火網前判斷
function CheckUseScript_242612_1()
	local player = OwnerID()
	local obj = TargetID()
		--先判定目標編號
		if player == obj then
			ScriptMessage( player,player,1,"[SC_421219_1]",0 )	--你沒有目標
			return false
		elseif ReadRoleValue( obj,EM_RoleValue_OrgID ) == 107700 then
			return true
		else
			ScriptMessage( player,player,1,"[SC_204592_1]",0)	--目標不正確
			return false
		end
end

--使用物品鋸火網後判斷
function ItemUseOKScript_242612_2()
		SetStopAttack( OwnerID())
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_425103_E]",0 )	--目標已經死亡！
			return
		elseif ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP) >= 0.5 then
			--DelBodyItem( OwnerID(),242612,1)
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_422113_7]",0)	--暫代
			return	
		else
			CallPlot( TargetID(), "LuaFunc_ResetObj", TargetID() )
			GiveBodyItem( OwnerID(),242590,1 )
			DelBodyItem( OwnerID(),242612,1)
			return		
		end
end

--任務426184失蹤的夥伴，與122222索尼斯．曼頓對話
function szLuaScript_122222_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(),426184 ) and CheckFlag( OwnerID(),548051)==false then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_426184_1]","szLuaScript_426184_1",0 )
	end
	if CheckAcceptQuest(OwnerID(),426196 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426196_0]","szLuaScript_122222_2",0 )
	end
end
--給旗標
function szLuaScript_426184_1()
	SetSpeakDetail( OwnerID(), "[SC_426184_2]" )
	SetFlag( OwnerID(), 548051  ,1)
end

--殘破的GL球體：點擊物品242597接任務426188
function SrvScript_242597_1() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 426188, 1  ) );
	ShowBorder( OwnerID(), 426188, "[426188]", "ScriptBorder_Texture_Paper" );	
end
--殘破的BL球體：點擊物品242598接任務426189
function SrvScript_242598_1() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 426189, 1  ) );
	ShowBorder( OwnerID(), 426189, "[426189]", "ScriptBorder_Texture_Paper" );	
end
--殘破的LV球體：點擊物品242599接任務426190
function SrvScript_242599_1() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 426190, 1  ) );
	ShowBorder( OwnerID(), 426190, "[426190]", "ScriptBorder_Texture_Paper" );	
end

--426188 完成任務給旗標548055
function szScriptOnComplete_426188_1()
	SetFlag( TargetID(),548055,1 )
end
--426189 完成任務給旗標548056
function szScriptOnComplete_426189_1()
	SetFlag( TargetID(),548056,1 )
end
--426190 完成任務給旗標548057
function szScriptOnComplete_426190_1()
	SetFlag( TargetID(),548057,1 )
end

--對話： 飢餓的戰士
function szLuaScript_122234_1()
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(),242595 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426186_1]","szLuaScript_426186_1",0)
	end
end
function szLuaScript_426186_1()
	CloseSpeak( OwnerID() );
	--507160判斷用buff
	if CheckBuff( TargetID(),620168 )==false then
		CallPlot( TargetID(),"szLuaScript_426186_2",OwnerID() )
	else
		Say( TargetID(),"[SC_423008_6]" )	--不需要
	end
end
function szLuaScript_426186_2( player )
	--PlayMotion( OwnerID() )
	local num = Rand(50) +100
	AddBuff( OwnerID(),620168,0,num )
	if DelBodyItem( player,242595,1 ) then
		Sleep(10)
		Say( OwnerID(),"[SC_426186_2]")
		Sleep(10)
		DW_QietKillOne( player,107776 )
	end
end

--對話： 受傷的戰士
function szLuaScript_122241_1()
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(),242596 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426186_3]","szLuaScript_426186_3",0)
	end
end
function szLuaScript_426186_3()
	CloseSpeak( OwnerID() );
	--507160判斷用buff
	if CheckBuff( TargetID(),620168 )==false then
		CallPlot( TargetID(),"szLuaScript_426186_4",OwnerID() )
	else
		Say( TargetID(),"[SC_423008_6]" )
	end
end
function szLuaScript_426186_4( player )
	--PlayMotion( OwnerID() )
	local num = Rand(50) +100
	AddBuff( OwnerID(),620168,0,num )
	if DelBodyItem( player,242596,1 ) then
		Sleep(10)
		Say( OwnerID(),"[SC_426186_4]")
		Sleep(10)
		DW_QietKillOne( player,107777 )
	end
end

--任務：426187 清潔大隊
function szScript_OnClickObjEnd_426187()
	if CountBodyItem( OwnerID(),242619 ) ==3 and
	CountBodyItem( OwnerID(),242597 )==0	then
		ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426187_1]",0 )
		GiveBodyItem( OwnerID(),242597,1 )
	elseif CountBodyItem( OwnerID(),242619 ) ==6 and
	CountBodyItem( OwnerID(),242598 )==0	then
		ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426187_1]",0 )
		GiveBodyItem( OwnerID(),242598,1 )
	elseif CountBodyItem( OwnerID(),242619 ) ==9 and
	CountBodyItem( OwnerID(),242599 )==0	then
		ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426187_1]",0 )
		GiveBodyItem( OwnerID(),242599,1 )
	end
	return true
end

--任務：426193 監護者行動，與122226 帕奇GL對話
function szLuaScript_122226_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426193 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_1A]","szLuaScript_426193_1(1)",0)
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_1B]","szLuaScript_426193_1(2)",0)
	end
end
function szLuaScript_426193_1( letter )
	if letter ==1 then
		SetSpeakDetail( OwnerID(),"[SC_426193_1A1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_2A]","szLuaScript_426193_2(1)",0)
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_2B]","szLuaScript_426193_2(2)",0)
	elseif letter ==2 then
		CloseSpeak( OwnerID() )
		Say( TargetID(),"[SC_426193_1B1]")
		CastSpell( TargetID(), OwnerID(), 850819 )
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_426193_1B2]",0 )
	end
end
function szLuaScript_426193_2( letter )
	if letter ==1 then
		SetSpeakDetail( OwnerID(),"[SC_426193_2A1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_2A2]","szLuaScript_426193_2A",0) --（你對帕奇GL表示不懂也沒關係。）
	elseif letter ==2 then
		SetSpeakDetail( OwnerID(),"[SC_426193_2B1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_3A]","szLuaScript_426193_3(1)",0) --誕生之地有後續行動嗎？
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_3B]","szLuaScript_426193_3(2)",0) --帕奇們的目標是什麼？
	end
end
function szLuaScript_426193_2A()
	CloseSpeak( OwnerID() )
	Say( TargetID(),"[SC_426193_2A3]")
	CastSpell( TargetID(), OwnerID(), 850819 )
	ScriptMessage( OwnerID(),OwnerID(),1,"[SC_426193_2A4]",0 )
end
function szLuaScript_426193_3(letter)
	if letter ==1 then
		SetSpeakDetail( OwnerID(),"[SC_426193_3A1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_4A]","szLuaScript_426193_4(1)",0) --妳一直在說隊長，他和你們的關係是……
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_4B]","szLuaScript_426193_4(2)",0) --隊長是指你們的領袖，沒錯吧？
	elseif letter ==2 then
		SetSpeakDetail( OwnerID(),"[SC_426193_3B1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426193_3B2]","szLuaScript_426193_3A",0) --（你用懷疑的眼神看著帕奇GL。）
	end
end
function szLuaScript_426193_3A()
	CloseSpeak( OwnerID() )
	Say( TargetID(),"[SC_426193_3B3]")
	CastSpell( TargetID(), OwnerID(), 850819 )
	ScriptMessage( OwnerID(),OwnerID(),1,"[SC_426193_2A4]",0 )
end
function szLuaScript_426193_4(letter)
	if letter ==1 then
		SetSpeakDetail( OwnerID(),"[SC_426193_4A1]")
	elseif letter ==2 then
		SetSpeakDetail( OwnerID(),"[SC_426193_4B1]")
		if CheckAcceptQuest( OwnerID(),426193) then
			SetFlag( OwnerID(), 548052,1)
		end
	end
end
--任務：426194 監護者行動，與122186 哈妮．曼雪對話
function szLuaScript_426194_1()
	SetSpeakDetail( OwnerID(),"[SC_426193_2]")
	SetFlag( OwnerID(),548053,1 )
end

--122221 狼牙．匈搥
function szLuaScript_122221_1()
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),426196 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426196_0]","szLuaScript_122221_2",0 )
	end
end
function szLuaScript_122221_2()
	SetSpeakDetail( OwnerID(),"[SC_426196_1]")
	AdjustFaceDir( TargetID(),OwnerID(),0)
	SetFlag( OwnerID(),548058,1 )
end
--122222 索尼斯‧曼頓
function szLuaScript_122222_2()
	SetSpeakDetail( OwnerID(),"[SC_426196_2]")
	AdjustFaceDir( TargetID(),OwnerID(),0)
	SetFlag( OwnerID(),548059,1 )
end
--122223  尖爪‧賽克
function szLuaScript_122223_1()
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),426196 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426196_0]","szLuaScript_122223_2",0 )
	end
end
function szLuaScript_122223_2()
	SetSpeakDetail( OwnerID(),"[SC_426196_3]")
	AdjustFaceDir( TargetID(),OwnerID(),0)
	SetFlag( OwnerID(),548060,1 )
end
--122288  利嘴‧迅風
function szLuaScript_122288_1()
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),426196 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426196_0]","szLuaScript_122288_2",0 )
	end
end
function szLuaScript_122288_2()
	SetSpeakDetail( OwnerID(),"[SC_426196_4]")
	AdjustFaceDir( TargetID(),OwnerID(),0)
	SetFlag( OwnerID(),548061,1 )
end
--122289  金瞳‧硬爪
function szLuaScript_122289_1()
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),426196 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426196_0]","szLuaScript_122289_2",0 )
	end
end
function szLuaScript_122289_2()
	SetSpeakDetail( OwnerID(),"[SC_426196_5]")
	AdjustFaceDir( TargetID(),OwnerID(),0)
	SetFlag( OwnerID(),548065,1 )
end

--火舌火舌束縛者
function LuaEvent_OnDead_107702_1()
	local Machine = OwnerID()
	CastSpell( Machine,Machine,498754)
	local x,y,z,dir = DW_Location( Machine )
	local newy = GetHeight( x , y , z )
	local obj = CreateObj( 122248,x,newy+10,z,dir,1  )
	SetModeEx( obj, EM_SetModeType_Gravity, false )
	CallPlot( obj,"LuaEvent_OnDead_107702_2",obj)
end
function LuaEvent_OnDead_107702_2(obj)
	Sleep(30)
	AddToPartition( obj,0)
end
--122246死亡後的殘骸
function LuaEvent_OnDead_107772()
	local NPC = OwnerID();
	local New_Process = DW_CreateObjEX("obj", 122246, NPC);
	LuaPG_SetMode(New_Process)
	Hide( NPC )
	return true
end
--初始劇情預設為死亡動作
function szLuaInitScript_deathLoop_122246()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_DEATH_LOOP ) ;
	for i = 0 ,50 do
		if i== 45 then
			SetModeEx( OwnerID(),EM_SetModeType_Mark , false ) ;
		end
		Sleep( 10 )
	end
	DelObj( OwnerID() )
end
--crouch
function szLuaInitScript_NPC107772() 
	--SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_CROUCH )
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
end

--帕奇隊長，躲避玩家劇情
function szLuaInitScript_122249()    
	--帕奇隊長、逃跑判定時間。
	local ID = OwnerID()
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 8
	SetModeEx( ID , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( ID , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( ID , EM_SetModeType_Searchenemy, false )--索敵
	WriteRoleValue( ID,EM_RoleValue_IsWalk ,0)--用跑的
	SetModeEx( ID  , EM_SetModeType_Move, true )--移動

	Beginplot( ID ,"szLuaInitScript_122249_Take", 0 )--範圍內有陷阱則被捕。

	while true do 
		local dis = 60			--偵查玩家距離	靈敏度	隨機取值
		local Player = SearchRangePlayer( ID , dis ) --判斷附近是否有玩家
		local PetPID = ReadRoleValue( ID , EM_RoleValue_Register3  ) --該老鼠是否已被捕捉記錄了玩家的ID

		if (PetPID>0) then
			break
		elseIf CheckID( Player[0] ) == true then	--如果附近XX內有玩家

			local M = 25		--有玩家則移動之距離
			AdjustFaceDir(ID, Player[0] , 180 ) --面向 背對
			sleep(5)
			local mtime = Lua_MoveLine( ID , M ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			sleep(mtime)
		end
		sleep(stime)
	end
end

--陷阱r1值 裝是否抓到怪了 0 表示無
--陷阱pid值 裝玩家id

function szLuaInitScript_122249_Take() --老鼠被捕劇情
	local ID = OwnerID()--老鼠
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 5

	while true do 

		local Trap = LuaFunc_SearchNPCbyOrgID( ID, 107778, 15 , 1)       --狩獵陷阱

		if (CheckID( Trap[0] ) == true) then	--如果附近15內有陷阱
			local N = 10
			local YY = Rand( N )    

			local Mark = ReadRoleValue( Trap[0] , EM_RoleValue_Register)--該狩獵陷阱是否有抓到怪了
			if Mark == 0 then
				if YY >=5 then
					local PlayerID = ReadRoleValue( Trap[0] , EM_RoleValue_PID  ) --陷阱所屬"玩家"ID
					local OwnerX = ReadRoleValue( Trap[0] , EM_RoleValue_X ) 
					local OwnerY = ReadRoleValue( Trap[0] , EM_RoleValue_Y ) 
					local OwnerZ = ReadRoleValue( Trap[0] , EM_RoleValue_Z ) 
					local OwnerDIR = ReadRoleValue( Trap[0] , EM_RoleValue_Dir ) 
					OwnerDIR = OwnerDIR+180
					SetPos( ID, OwnerX, OwnerY , OwnerZ , OwnerDIR )--將該怪傳送到陷阱處
					SetModeEx( ID , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( ID  , EM_SetModeType_Move, false )--移動
					SetModeEx( ID , EM_SetModeType_Obstruct, false )--阻擋
					SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( ID , EM_SetModeType_DisableRotate, true )--不轉向
					SetModeEx( ID , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( ID , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			--		PlayMotion( Trap[0] , 12) --deadth 陷阱關閉動作
					WriteRoleValue( Trap[0]  ,EM_RoleValue_Register , 110  )--做記號，該陷阱已捕捉到獵物
					WriteRoleValue( ID,EM_RoleValue_Register3, PlayerID)
					WriteRoleValue( ID , EM_RoleValue_Register+2, Trap[0] ) --讓老鼠記住陷阱

						ScriptMessage( PlayerID , PlayerID , 2 , "[SC_426197_6]" , "0xff00ffff" )--太好了！成功捕獲了[SC_426197_6]！
						ScriptMessage( PlayerID , PlayerID , 0 , "[SC_426197_6]" , "0xff00ffff" )

						SetPlot( OwnerID(),"touch","szLuaInitScript_122249_Touch",30 )

					Beginplot( ID ,"szLuaInitScript_122249_GetOut", 0 )--自被困住起，10秒後刪除。
					break
				else	--寵物發現有陷阱，烙跑
					AddBuff( ID ,503141 ,1 ,3 )--驚訝
					AdjustFaceDir(ID, Trap[0] , 180 ) --面向 背對
					local Dis = 80	
					Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
				end
			end
		end
		sleep(stime)
	end
end

function szLuaInitScript_122249_GetOut() --自被困住起，10秒後，自動刪除。
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"陷阱"ID
	local obj = ReadRoleValue( OwnerID(), EM_RoleValue_PID)	--初始用
	PlayMotion( Trap , 12) --deadth 陷阱關閉動作
	PlayMotion( OwnerID() , 21) --掙扎的動作 
	sleep(100)
	DelObj( Trap )
	SetPlot( obj,"range","szLuaInitScript_426197_2",100 )
	DelObj( OwnerID() )
end

function szLuaInitScript_122249_Touch() --觸碰劇情，玩家取蛋
	local obj = ReadRoleValue( TargetID(), EM_RoleValue_PID)	--初始用
	if CheckAcceptQuest( OwnerID(),426197 ) and CountBodyItem( OwnerID(),242618)==0 then
		local Trap = ReadRoleValue( TargetID() , EM_RoleValue_Register+2  ) --"陷阱"ID
		GiveBodyItem( OwnerID(),242618,1 )
	elseif CheckAcceptQuest( OwnerID(),426197 ) and CountBodyItem( OwnerID(),242618)>=1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_PE_ZONE20_01_FULL]",0 )	--你無法攜帶更多了！
	else
--		SetPlot( TargetID(),"touch","",0 )
--		local Trap = ReadRoleValue( TargetID() , EM_RoleValue_Register+2  ) --"陷阱"ID
--			Sleep(10)
-- 			DelObj( Trap )
--			SetPlot( obj,"range","szLuaInitScript_426197_2",100 )
-- 			DelObj( TargetID() )
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422160_1]" , 0 )--他消失了。
--			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422160_1]" , 0 )
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_ERR_PARTY_1]",0 )	--你並沒有權限
		return
	end
end

-- 任務：426197 _使用捉貓陷阱
function ItemUseOKScript_242617()    --玩家安裝陷阱劇情
	local Player = OwnerID()
		DW_CancelTypeBuff( 68 , Player) 
		BeginPlot( Player , "ItemUseOKScript_242617_2" , 0 )  
end

function ItemUseOKScript_242617_2() --安裝陷阱
	local ID = OwnerID() --玩家		
	
	if BeginCastBarEvent( ID, ID,"[SC_YU_GUILDWAR_BUILD_13]", 3 , ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "ItemUseOKScript_242617_3" ) ~= 1 then
		ScriptMessage( ID, ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function ItemUseOKScript_242617_3(ObjID,CheckStatus)--實裝安裝陷阱
	local ID = OwnerID() --玩家
	if ( CheckStatus ~= 0 ) then
		if ( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( ID, CheckStatus );

			local RoomID = ReadRoleValue( ID ,EM_RoleValue_RoomID) 
			local OwnerX = ReadRoleValue( ID , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( ID , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( ID , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( ID , EM_RoleValue_Dir ) 
			OwnerY = OwnerY+15

			local StageNpc = CreateObj( 107778 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --100989 陷阱用 NPC  捕捉動作：死亡 13
				SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( StageNpc , EM_SetModeType_DisableRotate, true )--不轉向
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			AddToPartition( StageNpc , RoomID )  

			DelBodyItem( OwnerID() , 242617 , 1 )
			WriteRoleValue( StageNpc,EM_RoleValue_PID,ID )	--將玩家寫入npc
			BeginPlot( StageNpc , "LuaYU_PetSystem_TrapDead" , 0 )  --陷阱60秒後消失
		else
			-- 失敗
			EndCastBar( ID, CheckStatus );
		end
	end
end

--任務：永遠在一起，範圍劇情。
function szLuaInitScript_426197_1()
	SetPlot( OwnerID(),"range","szLuaInitScript_426197_2",100 )
	function szLuaInitScript_426197_2()
		if CheckAcceptQuest( OwnerID(),426197 ) then
			SetPlot( TargetID(),"range","",0 )
			local pachi = Lua_CreateObjToRandownPos( TargetID(),122249,1,50,true)
			WriteRoleValue( pachi[1] , EM_RoleValue_PID, TargetID() )
			AddBuff( pachi[1] , 501409 ,0 , 5)
			Beginplot( pachi[1],"szLuaInitScript_122249",0 )
			CallPlot( pachi[1],"szLuaInitScript_426197_3",TargetID() )
		end
	end
end
function szLuaInitScript_426197_3( obj )
	local pachi = OwnerID()
		while true do
			if CheckDistance ( pachi,obj,200 ) ==false then
				SetPlot( obj,"range","szLuaInitScript_426197_2",100 )
				DelObj(pachi )
				return
			end
			Sleep(20)
		end
end

--
function szScript_OnComplete_426192()
	local x,y,z,dir = DW_Location( OwnerID() )
		AddBuff( TargetID(),504004,0,19 )			--加一個buff給玩家
		local act1 = CreateObj( 122293,x,y,z,dir,1 )
			SetModeEx( act1, EM_SetModeType_Mark, false )	--邦特．曼瑞
			AddToPartition( act1,0 )
				Sleep( 20 )
			PlayMotion( act1 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
				Sleep( 20 )
			Say( act1,"[SC_426192_1]" )			--嘿唷…這樣就完成了
				Sleep( 20 )
			Say( act1,"[SC_426192_2]" )
				Sleep( 10 )
		local act2 = CreateObjByFlag( 122294, 780867, 1, 1 )	--GL
			SetModeEx( act2, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act2,false )
			WriteRoleValue( act2 , EM_RoleValue_IsWalk , 0 )
			AddToPartition( act2,0 )
			AddBuff( act2 , 501409 ,0 , 5)
				Sleep( 10 )
			Say( act2,"[SC_426192_3]")
			LuaFunc_MoveToFlag( act2, 780867 , 9 ,0 ) 
		local act3 = CreateObjByFlag( 122295, 780867, 2, 1 )	--BL 
 			SetModeEx( act3, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act3,false )
			WriteRoleValue( act3 , EM_RoleValue_IsWalk , 0 )
 			AddToPartition( act3,0 )
 			AddBuff( act3 , 501409 ,0 , 5)
 				Sleep( 10 )
			Say( act3,"[SC_426192_4]")
			LuaFunc_MoveToFlag( act3, 780867 , 10 ,0 ) 
		local act4 = CreateObjByFlag( 122296, 780867, 3, 1 )	--LV
 			SetModeEx( act4, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act4,false )
			WriteRoleValue( act4 , EM_RoleValue_IsWalk , 0 )
 			AddToPartition( act4,0 )
 			AddBuff( act4 , 501409 ,0 , 5)
 				Sleep( 10 )
			Say( act4,"[SC_426192_5]")
			LuaFunc_MoveToFlag( act4, 780867 , 11 ,0 ) 
				Sleep( 20 )
		DelObj(act1)
		DelObj(act2)
		DelObj(act3)
		DelObj(act4)
end

--
function szScript_OnComplete_426197()
	local x,y,z,dir = DW_Location( OwnerID() )
		local act1 = CreateObjByFlag( 122301, 780867, 4, 1 )
			SetModeEx( act1, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act1, false )
			WriteRoleValue( act1,EM_RoleValue_IsWalk ,0)--用跑的
			AddToPartition( act1,0 )
			AddBuff( act1 , 501409 ,0 , 5)
		local act2 = CreateObjByFlag( 122300, 780867, 5, 1 )
			SetModeEx( act2, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act2, false )
			WriteRoleValue( act2,EM_RoleValue_IsWalk ,0)--用跑的
			AddToPartition( act2,0 )
		local act3 = CreateObjByFlag( 122299, 780867, 6, 1 )
			SetModeEx( act3, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act3, false )
			WriteRoleValue( act3,EM_RoleValue_IsWalk ,0)--用跑的
			AddToPartition( act3,0 )
		local act4 = CreateObjByFlag( 122298, 780867, 7, 1 )
			SetModeEx( act4, EM_SetModeType_Mark, false )
			MoveToFlagEnabled( act4, false )
			WriteRoleValue( act4,EM_RoleValue_IsWalk ,0)--用跑的
			AddToPartition( act4,0 )
		--
		Sleep(20)
		Say( act2,"[SC_426197_1]" )	--是隊長！
		Sleep(5)
		CallPlot( act1,"szScript_OnComplete_426197_1",4 )
		CallPlot( act2,"szScript_OnComplete_426197_1",5 )
		CallPlot( act3,"szScript_OnComplete_426197_1",6 )
		CallPlot( act4,"szScript_OnComplete_426197_1",7 )
		Say( act3,"[SC_426197_2]" )	--隊長
		Say( act4,"[SC_426197_2]" )	--隊長
		Sleep(20)
		Say( act1,"[SC_426197_3]")	--原來…是大家
		Sleep(20)
		Say( act2,"[SC_426197_4]" )	--太好了，家又能在一起了。
		Sleep(10)
		Say( act3,"[SC_426197_5]" )	--太好了
		Sleep(30)		
	 		DelObj(act1)
	 		DelObj(act2)
	 		DelObj(act3)
	 		DelObj(act4)
end

function szScript_OnComplete_426197_1(k)
	while true do
		if k==7 then k=4 else k=k+1 end
		LuaFunc_MoveToFlag( OwnerID(), 780867, k, 0 ) 
		Sleep(1)
	end
end


--使用前檢查
function CheckUseScript_242609_1()
	if CountBodyItem( OwnerID(),242611 )>=1 and 
		CountBodyItem( OwnerID(),242610 )>=1 and 
		CountBodyItem( OwnerID(),242609 )>=1 then
		
		ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426195_1]",1 )	--[242632]的電力已經消耗怠盡
		return false
	end
end
--使用後檢查
function SrvScript_242609_1()    --玩家安裝陷阱劇情
	local Player = OwnerID()
		DW_CancelTypeBuff( 68 , Player) 
		BeginPlot( Player , "SrvScript_242609_2" , 0 )  
end

function SrvScript_242609_2() --安裝陷阱
	local ID = OwnerID() --玩家		
	
	if BeginCastBarEvent( ID, ID,"[SC_YU_GUILDWAR_BUILD_13]", 80 , ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "SrvScript_242609_3" ) ~= 1 then
		ScriptMessage( ID, ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

--使用後檢查
function SrvScript_242609_3(ObjID,CheckStatus)
	local ktable = SearchRangeNPC( OwnerID(),50 )
	local target = 0
	if ( CheckStatus ~= 0 ) then
		if ( CheckStatus > 0 ) then
		-- 成功
		EndCastBar( OwnerID(), CheckStatus );
	 		for i=0,#ktable do
	 			if ReadRoleValue( ktable[i],EM_RoleValue_OrgID)==107773 or
	 			ReadRoleValue( ktable[i],EM_RoleValue_OrgID)==122190 or
	 			ReadRoleValue( ktable[i],EM_RoleValue_OrgID)==122191 then
	 				target = ReadRoleValue( ktable[i],EM_RoleValue_OrgID)
	 				break
	 			end
	 		end
	 		if target == 0 then
	 			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426195_2]",1 ) --[242632]：逼逼，別耍我，你有看到東西嗎？不會給我靠近一點嗎。
			elseif target == 107773 then
	 			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426195_3][$SETVAR1=".."[242610]".."]",1 ) --[242632]：[$VAR1]已經掃描完成。
				GiveBodyItem( OwnerID(),242610,1 )
			elseif target == 122190 then
				ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426195_3][$SETVAR1=".."[242611]".."]",1 ) --[242632]：[$VAR1]已經掃描完成。
				GiveBodyItem( OwnerID(),242611,1 )
			elseif target == 122191 then
				ScriptMessage( OwnerID(),OwnerID(),3,"[SC_426195_3][$SETVAR1=".."[242609]".."]",1 ) --[242632]：[$VAR1]已經掃描完成。
				GiveBodyItem( OwnerID(),242609,1 )
			else
				ScriptMessage( OwnerID(),OwnerID(),3,"[SYS_GAMEMSGEVENT_454]",1 )  --目標不存在
	 		end
		else
			-- 失敗
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end
function szLuaInitScript_AddBuff_621145()
	AddBuff( OwnerID(),621145,0,-1 )
end

--使用廢棄通道啟動器 使用前檢查 
function CheckUseScript_242633_1()
	local NPC = SearchRangeNPC( OwnerID(),15)
	local x = 0 
		for i=0, #NPC do
			if ReadRoleValue( NPC[i],EM_RoleValue_OrgID ) == 122191 then
				WriteRoleValue( OwnerID(),EM_RoleValue_Register1,NPC[i] )
				x=x+1
			end
		end
		if x>=1 then 
			return true 
		end
			ScriptMessage( OwnerID(),OwnerID(),2,"[SC_204592_2]",0)
		return false
end

--使用後檢查
function ItemUseOKScript_242633_1()
	local x,y,z,dir = DW_Location( 780867,8 )
	SetPos( OwnerID(), x,y,z,dir )
	if CheckAcceptQuest( OwnerID(),426198) then
		SetFlag( OwnerID(),548054,1)
	end
end
--跟斐吹．西羅對話拿陷阱
function szLuaScript_122225_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426197 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_117376_01]","szLuaScript_122225_2",0 )	--請給我更多的陷阱
	end
end
function szLuaScript_122225_2()
	CloseSpeak( OwnerID() )
	GiveBodyItem(  OwnerID(),242617,1 )
end