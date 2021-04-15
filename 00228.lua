------------------------一段時間後消失觸發關連重生---------------

Function Lua_Discowood_CheckCombat(Time)
	--Time 物件在戰鬥外存在最低時間(以秒計數)
	local Count = 0
	while true do
		sleep(10)
		--是否在戰鬥中
--		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
		if HateListCount( OwnerID() ) > 0 then 
			sleep(50)
		else
			if Count > Time and  ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  ==  0 then
				BeginPlot(OwnerID() , "Lua_Discowood_Revive" , 0 )
				break
			end
			sleep(50)
			Count = Count + 6
		end
	end
	
end

Function Lua_Discowood_Revive()
	LuaFunc_ResetObj( OwnerID() )
end

-------------------------------讓怪物在非戰鬥下自動消失------------------------
Function LuaFunc_Obj_Suicide(Time)
	--Time 物件存在的最低時間
	Sleep(Time)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				DelObj( OwnerID() )
			end
			break		
		end
	sleep(1)
	end
end
-----------------------------遮蔽NPC的觸發劇情----------------------
function LuaFunc_Obj_BUSY() -- 有訊息
	ScriptMessage( OwnerID(), OwnerID(), 1,GetString("SAY_NPC_BUSY"), 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );

end

function LuaFunc_Obj_Nothing() -- 無訊息

	--NOTHING

end		
-----------------------------檢查玩家身分---------------------------
function LuaFunc_PlayerCheck( ItemID , DBID)

	if CheckID(  ItemID ) == false then
		return false;
	end

	local Obj = Role:new( ItemID )
	if  Obj:GetDBID() ~= DBID or Obj:IsPlayer() == false then
		return false;
	end
	
	return true;

end
------------------------------亂數移動-----------------------------
function Func_rand_walker(ItemID,Range,SleepSec)
	--ItemID 角色ID
	--Range 亂走的範圍
	--SleepSec 隔多久變換一次方向
	if CheckID(ItemID) then
		local Role = Role:new( ItemID )
		local X = Role:X() + rand(Range/2) + (Range/2)
		local Y = Role:Y()
		local Z = Role:Z()+ rand(Range/2) + (Range/2)

		if Range <= 0 then Range = 0 end
		if Range >= 1000 then Range = 1000 end 
		if SleepSec <= 1 then SleepSec = 1 end

		Move(  ItemID  , X , Y , Z )--用MOVE是因為位置附近的阻礙物不一定，避免因走不到位置而造成中斷
		sleep( SleepSec )
	else
		return Say(OwnerID(),"Error")
	end
end
-------------------------------檢查玩家是否還在附近-----------------------------------------------------
function Luafunc_Player_Alive( Player,DBID,Range ) 
	if LuaFunc_PlayerCheck( Player , DBID) then
		if CheckDistance( OwnerID(), Player, Range ) then
			return true
		else
			return false
		end
	end
	
	return false	
end
-----------------------------通用汽泡式說話劇情------------------------------------------------------------
Function LuaI_CommonSpeak_A() --將此函式插入初始劇情即可
	SetPlot( OwnerID() , "Touch" , "LuaFunc_CommonSpeak_A", 40)
end

Function LuaFunc_CommonSpeak_A()
	BeginPlot( TargetID(),"LuaFunc_NPCSpeak_A", 0 )
end

function LuaFunc_NPCSpeak_A()

	local Target = Role:new(TargetID())
	local Owner = Role:new(OwnerID())
	local Switch
	Switch = Rand( 20 )
	if Switch == 0 then
		if Owner:Sex() == 0 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_1")) --/*哈哈！我喜歡你的品味。
		elseif Owner:Sex() == 1 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_2")) --/*噢！這就是最近流行的服飾嗎？
		else
			Say( OwnerID() , GetString("SAY_COMSPEAK_3")) --/*......
		end		
	elseif Switch == 1 then
		if Target:Sex() == 0 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_4")) --/*日安，先生。
		elseif Target:Sex() == 1 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_5")) --/*日安，女士。
		else
			Say( OwnerID() , GetString("SAY_COMSPEAK_6")) --/*日安，大人。
		end
	elseif Switch == 2 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_7")) --/*克魯迪亞的戰爭不知道什麼時候才會結束...
	elseif Switch == 3 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_8")) --/*最近好像有很多關於魔族的傳聞...
	elseif Switch == 4 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_9")) --/*你知道古代王國嗎？最近好像很多人對這個很有興趣...但我總覺得這種東西還是少碰為妙。
	elseif Switch == 5 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_10")) --/*我有種預感...這個世界將發生很大的變化，唉～
	else
			Say( OwnerID() , GetString("SAY_COMSPEAK_11")) --/*抱歉，我還有事要忙。
	end
	sleep( 30 )

end
-----------------------搜尋特定樣板代號NPC--------------------------------------------------------------------
function LuaFunc_SearchNPCbyOrgID( GuildItem , NPCOrgID , Range , Type)
	--GuildItem 作為範圍標準的角色 ID
	--NPCOrgID 要搜尋的 NPC 樣板 ID
	--Range 以 GuildItem 為中心的搜尋半徑
	--Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標，未搜索到此目標則回傳-1
	--     1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標
	--     可不填，預設為 0
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GuildItem,Range )
	local NPCCount = 0
	if Type == nil then
		Type = 0
	end
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == NPCOrgID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
			Ret[NPCCount] = ID
			NPCCount = NPCCount + 1;
		end
	end	
	Ret[ NPCCount ] = -1;
	if NPCCount < 2 then
		if Type == 0 then
			return Ret[0]
		else
			return Ret
		end
	else
		return Ret;
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaFunc_PartyData(Obj)  --取得 Obj 所屬的隊伍資料
	-- 第一個位置為隊伍人數
	-- 其餘位置為隊伍成員的ID

	local Party = {}
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local n = 0
	Party[0] = GetPartyID( Obj , -1 )

	if Party[0] == 0 then
		Party[0] = 1
		Party[1] = Obj 
	else
		for i = 1 , Party[0], 1 do
			local Player = GetPartyID( Obj, i )
			if ReadRoleValue( Player , EM_RoleValue_RoomID ) == RoomID and CheckID(Player)  then
				n = n + 1
				Party[n] = Player
			end
		end
		Party[0] = n
	end

	return Party
end
---------------------------------------------轉換游標為齒輪-------------------------------------------------
function LuaFunc_Obj_Cusor_A()
	SetCursorType( OwnerID() , 0 )
end
---------------------------------------------------假死----------------------------------------------------------
function LuaFunc_DeadPlay()
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end
function LuaFunc_DeadPlay_Sub()
	sleep(15)
	DelObj( OwnerID() )
end

---------------------------------------------------檢查附近特定物件存在才可使用物品來得到另一樣物品---------------------------------------------------------
function LuaFunc_ItemCheckObj( Type , Obj , Range ,QuestID , GiveItem )
	if Type == "CHECK" then
		if CheckAcceptQuest( OwnerID() , QuestID ) == true and CountBodyItem( OwnerID() ,GiveItem) == 0 then
			local CheckPoint = LuaFunc_SearchNPCbyOrgID( OwnerID(), Obj  ,Range, 1)
			if CheckPoint[0] == -1 then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_FIND_NO_OBJ"), 0 ); 
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_FIND_NO_NEED"), 0 ); 
			return false
		end
	elseif Type == "USE" then
		if CheckAcceptQuest( OwnerID() , QuestID ) == true and CountBodyItem( OwnerID() ,GiveItem) == 0 then
			GiveBodyItem( OwnerID() , GiveItem , 1 )
		end		
	end 
end
----------------------------------------------------給物品檢查背包以及暫存-----------------------------------------------
function Lua_SafeGive( Role , Item , Count )
	if ReadRoleValue( Role , EM_RoleValue_IsPlayer ) == 1 then
		if EmptyPacketCount( Role ) >= 1 and QueuePacketCount( Role ) == 0 then
			if GiveBodyItem( Role , Item , Count ) then
				return true
			end
		else
			ScriptMessage( Role , Role, 0, GetString("MSG_SONGSONGBAGWARN"), 0 ); 		
			return false
		end
	else
		say( Role , "I AM NOT PLAYER" )
		return false
	end
end
------------------------------------------------模板用通用劇情－檢查物品&點擊後刪除指定物品數量-------------------------
function LuaQ_ComCheck_OnClick(item,count)
	if count > 0 then	
		if CountBodyItem( OwnerID() , Item) < count  then
			local name ="["..item.."]"
			local Str = "[SC_COM_LESS][$SETVAR1="..name.."]"
--			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_COM_LESS"), 0 )
			ScriptMessage( OwnerID(), OwnerID(), 0, Str ,0 )
			return -1
		else
			return 1
		end
	else
		return -1
	end
end
function LuaQ_ComDelObj_AfterClick(item,count)

	if count > 0 then
		if CountBodyItem( OwnerID() , Item) >= count  then
			DelBodyItem( OwnerID() , Item , count )
			return 1
		else
			return -1
		end
	else
		return -1
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaFunc_SearchRoomNPCbyOrgID( GuildItem , NPCOrgID , Type)
	--GuildItem 作為範圍標準的角色 ID
	--NPCOrgID 要搜尋的 NPC 樣板 ID
	--Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標，未搜索到此目標則回傳-1
	--     1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標
	--     可不填，預設為 0
	local Ret = {}
	local Obj;
	local RoomID = ReadRoleValue( GuildItem , EM_RoleValue_RoomID ) --取得所在room
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local NPCCount = 0
	if Type == nil then
		Type = 0
	end
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == NPCOrgID then
			Ret[NPCCount] = ID
			NPCCount = NPCCount + 1;
		end
	end	
	Ret[ NPCCount ] = -1;
	if NPCCount < 2 then
		if Type == 0 then
			return Ret[0]
		else
			return Ret
		end
	else
		return Ret;
	end
end
-------------------
function Lua_ObjLifeTime(Time)--單位秒
	for i=1,Time do
		Sleep(10);
	--	Say(OwnerID(),"i = "..i);
	end;
	DelObj(OwnerID());
end;
--回傳一個Index陣列內容為1~TotalSize中隨機取Amount個
function Lua_Table_GetRdIndex(TotalSize,Amount)--TotalSize 陣列大小, Amount 取出的數量
	local AA = {}
	local BB = {}
	for i=1 ,TotalSize do
		AA[i] = i;
	end
	for j=1,Amount do
		local NN = Rand(table.getn(AA))+1
		table.insert(BB,AA[NN])
		table.remove(AA,NN)
	end
--	for i,v in ipairs(BB) do
--		Say(OwnerID(),"v = "..v)
--	end
	return BB;
end
----------------取得現在座標資訊
function Lua_GetPostion(OID)
	if OID == nil then
		local Obj = Role:new( OwnerID() )
		local BaseX = Obj :X()
		local BaseY = Obj :Y()
		local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		return BaseX,BaseY,BaseZ,BaseDir
	else
		local Obj = Role:new( OID )
		local BaseX = Obj :X()
		local BaseY = Obj :Y()
		local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		return BaseX,BaseY,BaseZ,BaseDir
	end
end