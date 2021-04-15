function yuyu_111593_0() --簽到點1

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


		if BuffType == 58 then		--/*有變身出現對話選項
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢	
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111593_1", 0 ) --我要簽到
		end


end

function yuyu_111593_1()	

	local Map =  CheckFlag( OwnerID()  , 542154 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX1_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX1_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX1_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX1_0()

	SetFlag( OwnerID()  , 542154 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end
---------------------------------
function yuyu_111594_0() --簽到點2

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end



			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111594_1", 0 ) --我要簽到
			end

end

function yuyu_111594_1()	
	local Map =  CheckFlag( OwnerID()  , 542155 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX2_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX2_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX2_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX2_0()

	SetFlag( OwnerID()  , 542155 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end
---------------------------------
function yuyu_111595_0() --簽到點3

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111595_1", 0 ) --我要簽到
			end

end

function yuyu_111595_1()	
	local Map =  CheckFlag( OwnerID()  , 542156 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX3_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX3_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX3_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX3_0()

	SetFlag( OwnerID()  , 542156 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end

---------------------------------
function yuyu_111596_0() --簽到點4

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111596_1", 0 ) --我要簽到
			end

end

function yuyu_111596_1()	
	local Map =  CheckFlag( OwnerID()  , 542157 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX4_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX4_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX4_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX4_0()

	SetFlag( OwnerID()  , 542157 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end


function yuyu_111597_0() --簽到點5

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111597_1", 0 ) --我要簽到
			end


end

function yuyu_111597_1()	

	local Map =  CheckFlag( OwnerID()  , 542158 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX5_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX5_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX5_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX5_0()

	SetFlag( OwnerID()  , 542158 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end
---------------------------------
function yuyu_111598_0() --簽到點6

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111598_1", 0 ) --我要簽到
			end

end

function yuyu_111598_1()	
	local Map =  CheckFlag( OwnerID()  , 542159 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX6_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX6_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX6_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX6_0()

	SetFlag( OwnerID()  , 542159 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end
---------------------------------
function yuyu_111599_0() --簽到點7

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111599_1", 0 ) --我要簽到
			end

end

function yuyu_111599_1()	
	local Map =  CheckFlag( OwnerID()  , 542160 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX7_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX7_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX7_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX7_0()

	SetFlag( OwnerID()  , 542160 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end

---------------------------------
function yuyu_111600_0() --簽到點8

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		for i = 0 , Count do                                                           --檢查bufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*有變身出現對話選項
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--哇，好酷的打扮耶，我是百鬼大遊行的簽到處管理員，需要什麼服務呢
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111600_1", 0 ) --我要簽到
			end


end

function yuyu_111600_1()	
	local Map =  CheckFlag( OwnerID()  , 542161 ) --檢查身上旗標
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --百鬼大遊行地圖

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --沒地圖
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX8_0", 0 ) --我選擇1號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX8_0", 0 ) --我選擇2號禮盒
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX8_0", 0 ) --我選擇3號禮盒
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --咦？你已經有簽到了喔！
		end	


end

function Lua_BOX8_0()

	SetFlag( OwnerID()  , 542161 , 1 )  --沒走過給旗標

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --南瓜酷裝禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --南瓜神祕禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --南瓜補給禮盒
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --回到上一頁
	end
end