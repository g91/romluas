----------------------------------------------------------------------------
--掛在YoYo木樁上的腳本
----------------------------------------------------------------------------
function YoYo_Test_Stakes()
	local Stakes = OwnerID() --木樁自己
	local FallHP = 502957 --滿血術
	local CureBuff = 500998 --回復印記

	AddBuff( Stakes , FallHP , 1 , -1 ) --出生先放滿血
		
	while true do
		sleep( 10 )
		if Lua_PercentHP( Stakes ) < 50 then
			AddBuff( Stakes , CureBuff , 1 , 30 )
			Say( Stakes , "Yooooooooo ~~~~  !!!" )
		end
	end
end

----------------------------------------------------------------------------
--貨幣測試用的商店-初始劇情
----------------------------------------------------------------------------
function YoYo_Test_TokenShop()
	SetSpeakDetail( OwnerID() , "[SSF_TEST]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110039_STORE]" , "YoYo_Test_TokenShop_SetShop" , 5 )	--武器
end

function YoYo_Test_TokenShop_SetShop()
	SetShop( TargetID() , 600443 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end
----------------------------------------------------------------------------
--給予貨幣的測試指令
----------------------------------------------------------------------------
	-- TokenValue = 0		--遊戲幣
	-- TokenValue = 1		--晶鑽
	-- TokenValue = 2		--紅鑽
	-- TokenValue = 3		--必爾汀代幣
	-- TokenValue = 4		--戰場榮譽
	-- TokenValue = 5		--競技場點數(Arena)
	-- TokenValue = 6		--公會戰能量
	-- TokenValue = 7		--公會戰戰績
	-- TokenValue = 8		--試煉徽章
	-- TokenValue = 9		--古代遺物
	-- TokenValue = 10	--夢境先遣印記
	-- TokenValue = 11	--必爾汀圓貝
	-- TokenValue = 12	--正義能量
	-- TokenValue = 13	--傳說之證
	-- TokenValue = 14	--勇士勳章
function Test_GameMoney( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 0 --遊戲幣
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_AccountMoney( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 1 --晶鑽
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_Phirius( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 3 --必爾汀代幣
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveDreamland( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 10 --夢境先遣印記
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GivePhiriusShell( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 11 --必爾汀圓貝
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveEnergyJustice( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 12 --正義能量
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveRelics( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 9 --古代遺物
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveProofLegend( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 13 --傳奇之證
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveHonor( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 4 --榮譽點數
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveTrialBadge( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 8 --試煉徽章
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveDuelistReward( Value )
	local Oneself = OwnerID() --自己
	local TokenValue = Value
	local TokenType = 14 --勇士勳章
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
----------------------------------------------------------------------------
--貨幣偵測指令測試用
----------------------------------------------------------------------------
function YOYO_Test_CheckToken( Value )
	local Oneself = OwnerID() --自己
		if CheckSpeicalCoin( Oneself , 13 , 100 )  == true then
			DebugMsg( 0 , 0 , "> 100 true")
		else
			DebugMsg( 0 , 0 , "< 100 false")
		end
end
----------------------------------------------------------------------------
--產生阻擋線
----------------------------------------------------------------------------
--[[
清除全場建好的阻擋線
void ClearLineBlock( int roomID )
增加阻擋線
void AddLineBlock( int roomID , int id , float x1 , float z1 , float x2 , float z2 )
刪除阻擋線
bool DelLineBlock( int roomID , int id )
確認阻擋線
bool CheckLineBlock( int roomID , float x1 , float y1 , float x2 , float y2 )
--]]

function YoYo_BlockingLine()
	local Player = OwnerID() --自己
	local BoxID = 110987
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location( Player ) --取出自己目前的座標與面向
	
	
	Box = Lua_CreateObjByDir( Player , BoxID , 100 , PlayerDir ) --創造第一個箱子
	SetModeEx( Box , EM_SetModeType_Gravity , false) --無重力
	SetModeEx( Box , EM_SetModeType_Move , false) --不可移動
	SetModeEx( Box , EM_SetModeType_Obstruct , true) --有阻擋效果
	AdjustFaceDir( Box , Player , 180 ) --設定箱子背對自己
	AddtoPartition( Box , RoomID )
	local BoxX , BoxY , BoxZ , BoxDir = DW_Location( Box ) --取得箱子的位置與面向
	
	local FlagObjID1 = 102331 --兔子旗標，去程行走路徑用
	local FlagObjID2 = 100186 --貓咪旗標，回程行走路徑用
	
	AdjustFaceDir( Box , Player , 90) --箱子面向-90度
	local Robit = Lua_CreateObjByDir( Box , FlagObjID1 , 50 , BoxDir ) --產生兔子旗標於箱子的正前方
	AddtoPartition( Robit , RoomID )
	local RobitX , RobitY , RobitZ , RobitDir = DW_Location( Robit ) --取得兔子旗標的位置與面向
		
	AdjustFaceDir( Box , Player , -90 ) --箱子面向+90度
	local Cat = Lua_CreateObjByDir( Box , FlagObjID2 , 50 , BoxDir ) --產生貓咪旗標於箱子的正前方
	AddtoPartition( Cat , RoomID )
	local CatX , CatY , CatZ , CatDir = DW_Location( Cat ) --取得貓咪旗標的位置與面向
	
	local LineBlock01 = 100
	AddLineBlock( RoomID , LineBlock01 , RobitX , RobitZ , CatX , CatZ )
	Say( Player , "BlockLine = " .. LineBlock01)
	
end

function YoYo_DelBlockingLine()
	local Player = OwnerID() --自己
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	ClearLineBlock( RoomID )
end

----------------------------------------------------------------------------
--給予99999的道具
----------------------------------------------------------------------------
function YoYo_GiveItem99999( ItemID )
	local Player = OwnerID() --自己
	GiveBodyItem( Player , ItemID , 99999 )
	
end

----------------------------------------------------------------------------
--世界入侵個人積分測試
----------------------------------------------------------------------------
function YoYo_Test_IncursivePoint( Value )
	local IncursivePoint = ReadRoleValue( OwnerID() , EM_RoleValue_IncursivePoint )
	Say( OwnerID() , "Before IncursivePoint = "..IncursivePoint )
	if Value > 0 then
		WriteRoleValue( OwnerID() , EM_RoleValue_IncursivePoint , Value )
		Say( OwnerID() , "After IncursivePoint = "..IncursivePoint )
	end
end