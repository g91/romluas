--水紋翡翠

function Lua_Haoplaymusic_00()

	SetPlot( OwnerID(),"touch","Lua_Haoplaymusic_01",50 ) --觸碰劇情

end


function Lua_Haoplaymusic_01()

--	Say(  OwnerID(),"OwnerID" )  --玩家
--	Say(  TargetID(),"TargetID" ) --物件


	local  ZONEID = ReadRoleValue( OwnerID() ,EM_RoleValue_ZoneID)


	if BeginCastBar( OwnerID(), "[SYS_SKILLNAME_MINING]", 50 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 	AttachCastMotionTool( OwnerID(), 210508 ); --置換武器為圓鍬

		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then


			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then   --判斷玩家背包空間夠不夠


				SetPlot( TargetID(),"touch","",0 ) -- 讓物件無法再次觸發挖礦劇情



				if ZONEID == 110 then --卑劣岩窟地穴
				
					GiveBodyItem( OwnerID(), 204527, 1 ) --玩家獲得物品

				elseif ZONEID == 102 then --廢棄修道院

					GiveBodyItem( OwnerID(), 204528, 1 )

				elseif ZONEID == 251 then --薩斯科特

					GiveBodyItem( OwnerID(), 204530, 1 )

				elseif ZONEID == 103 then --鏡之墓城

					GiveBodyItem( OwnerID(), 204529, 1 )

				end


				Hide(TargetID()) --隱藏物件

				BeginPlot( TargetID() , "Lua_Haoplaymusic_02" , 0 )  --物件觸發重置機制


			else
				SetSpeakDetail( OwnerID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end






		end
	end


end

function Lua_Haoplaymusic_02() --OwnerID  為物件

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	sleep(1000000)
	Show(OwnerID(),RoomID)
	BeginPlot( OwnerID() , "Lua_Haoplaymusic_00" , 0 ) 

end



function Lua_YUmusicmaker_00()

--	Say(OwnerID()  , "OwnerID") --NPC
--	Say(TargetID()  , "TargetID") --玩家

	local music01 =  CheckFlag( TargetID()  , 542622 ) --烏德

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --判斷玩家背包空間夠不夠

				
					GiveBodyItem( TargetID(), 204534, 1 ) --玩家獲得物品
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]將隨身攜帶的魔法樂器給你試用，趕快使用看看吧！
					SetFlag( TargetID()  , 542622 , 1 )  --沒給過給旗標

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end


	end


end

function Lua_YUmusicmaker_01()


	local music01 =  CheckFlag( TargetID()  , 542623 ) --吉他

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --判斷玩家背包空間夠不夠

				
					GiveBodyItem( TargetID(), 204533, 1 ) --玩家獲得物品
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]將隨身攜帶的魔法樂器給你試用，趕快使用看看吧！
					SetFlag( TargetID()  , 542623 , 1 )  --沒給過給旗標

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end


	end


end

function Lua_YUmusicmaker_02()


	local music01 =  CheckFlag( TargetID()  , 542624 ) --薩克斯風

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --判斷玩家背包空間夠不夠

				
					GiveBodyItem( TargetID(), 204532, 1 ) --玩家獲得物品
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]將隨身攜帶的魔法樂器給你試用，趕快使用看看吧！
					SetFlag( TargetID()  , 542624 , 1 )  --沒給過給旗標

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end


	end


end

function Lua_YUmusicmaker_03()


	local music01 =  CheckFlag( TargetID()  , 542625 ) --沙鈴

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --判斷玩家背包空間夠不夠

				
					GiveBodyItem( TargetID(), 204536, 1 ) --玩家獲得物品
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]將隨身攜帶的魔法樂器給你試用，趕快使用看看吧！
					SetFlag( TargetID()  , 542625 , 1 )  --沒給過給旗標

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end


	end


end

function Lua_YUmusicmaker_04()


	local music01 =  CheckFlag( TargetID()  , 542626 ) --鈴鼓

	if music01 == false then

			if EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then   --判斷玩家背包空間夠不夠

				
					GiveBodyItem( TargetID(), 204535, 1 ) --玩家獲得物品
					ScriptMessage(TargetID(), TargetID() , 1 , "[SC_MUSICPLAY_03]" , C_SYSTEM )  --[112279]將隨身攜帶的魔法樂器給你試用，趕快使用看看吧！
					SetFlag( TargetID()  , 542626 , 1 )  --沒給過給旗標

			else
				SetSpeakDetail( TargetID(), GetString("SC_TREASURE_NOSPACE")   )--背包沒有空間
			end


	end


end