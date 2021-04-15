--一代的傳送術，寫法與邏輯簡單明瞭，但要增減都較為複雜。
--二代的傳送術，為了把所有東西都包進去，寫了一整片的共用函式，等於你每次要傳送就要跑一大片function。
--一代傳送術使用的字串為村莊，二代的傳送術使用的是地名。
--新寫作的東西僅做流程上的修改，並無更動任何東西。


--新增區域邏輯I：需新增旗標。
--新增區域邏輯II：需新增可傳送地區。
function lua_WorldI_TelFlagSet( loc )
	loc = loc or 1	--就算壞掉也會以為是羅格鎮
	--新增區域[ZoneID]=可飛該Zone的旗標判定。
	local Flag = { 	[1] = 541313 ,
			[2] = 541314 ,
			[3] = 542297 ,
			[4] = 541315 ,
			[5] = 541316 ,
			[6] = 541317 ,
			[7] = 542498 ,
			[8] = 542744 ,
			[9] = 542997 ,
			[10] = 541318 ,
			[11] = 541319 ,
			[12] = 542557 ,
			[13] = 540193 ,
			[15] = 543704 ,
			[22] = 546189 ,
			[31] = 546255 
					}
		return Flag[ loc ]
end

function lua_WorldI_TelPointSet( loc )
	loc = loc or 1	--就算壞掉也會以為是羅格鎮
	--邏輯ex：[zone 5] ={可以傳至zone 4、zone 6、zone 11}
	local Telpoint = {
			[1] = {2} ,
			[2] = {6,22,1,12,31,13,3,4,5,7,8,9,10,11},	--為了許多例外規則，主城的排列順序要特別注意，主城下來才是新手村
			[3] = {2,7} ,
			[4] = {2,5} ,
			[5] = {4,6,11} ,
			[6] = {2,15,12,31,10,13,5,11,1,3,4,7,8,9} ,
			[7] = {3,8} ,
			[8] = {7,9},
			[9] = {8} ,
			[10] = {6,11} ,
			[11] = {5,10} ,
			[12] = {2} ,
			[31] = {2} 	}
		return	Telpoint[ loc ]
end

--小狗初始值，在小地圖上設定飛行圖式
function DownloadSet()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end
--明明function內容一樣，為什麼要特意區分主城與一般呢？主要是因為有太多例外規則，不想在玩家點擊時製造多餘的判斷式。
--World I 區域用頑固獵犬對話內容
function lua_TeltestPort_Slaver()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Flag = lua_WorldI_TelFlagSet( ZoneID )		--回傳區域對應旗標 。
	local TelRule = lua_WorldI_TelPointSet( ZoneID )	--回傳一個陣列，對應該區域可傳送的地點。
		SetSpeakDetail( Player , GetString("SC_111256_0") )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --傳送是什麼？
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S("..ZoneID..")", 0 ); --我要將回程術地點登記於此
			--開啟傳送術
			if CheckFlag( Player,540001 ) == false then
				SetFlag( Player,540001,1 )
			end
			--開啟此地傳送門
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );
			end
			-- 501638=騎程禁止
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#TelRule do
					local loc = TelRule[i]
					local tmpFlag = lua_WorldI_TelFlagSet( loc )
						--列出傳送選項
						if CheckFlag( Player , tmpFlag ) then
							AddSpeakOption( Player,TargetID(), GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
						end
				end
			end
			--Zone10的例外阿狗，特別標註。
			if ZoneID==10 and CheckFlag( Player , 540191 ) then
				AddSpeakOption( Player, Player,  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); 		--傳送到瑞弗特營地
			end
end
--World I 主城用頑固獵犬對話內容
function lua_TeltestPort_Main()
	local Player = OwnerID()
	local item = 0						--用來記錄列出的條目量
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Flag = lua_WorldI_TelFlagSet( ZoneID )		--回傳區域對應旗標 。
	local TelRule = lua_WorldI_TelPointSet( ZoneID )	--回傳一個陣列，對應該區域可傳送的地點。
		SetSpeakDetail( Player , GetString("SC_111256_0") )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --傳送是什麼？
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S("..ZoneID..")", 0 ); --我要將回程術地點登記於此
			--開啟傳送術
			if CheckFlag( Player,540001 ) == false then
				SetFlag( Player,540001,1 )
			end
			--開啟此地傳送門
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );
			end
			-- 501638=騎程禁止
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#TelRule do
					local loc = TelRule[i]
					local tmpFlag = lua_WorldI_TelFlagSet( loc )
						--列出傳送選項
						if CheckFlag( Player , tmpFlag )  then
							AddSpeakOption( Player,TargetID(), GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
							item = item + 1
						end
						--超過5項就換下一頁
						if item>=5 then
							break	
						end
				end
				--Zone10的例外阿狗，特別標註。
				if CheckFlag( Player , 540191 )  then
					AddSpeakOption( Player, Player,  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); 		--傳送到瑞弗特營地
				end
				if item==5 then
					AddSpeakOption( Player,TargetID(), GetString( "SC_205764_2") ,"lua_TeltestPort_Next("..ZoneID..")",0 ); 	--選項：下一頁
				end
			end
end
--額外選項，主城才用得到
function lua_TeltestPort_Next(ZoneID)
	local Player = OwnerID()
	local TelRule = lua_WorldI_TelPointSet( ZoneID )
		for i=6,#TelRule do
			local loc = TelRule[i]
			local tmpFlag = lua_WorldI_TelFlagSet( loc )
				if CheckFlag( Player , tmpFlag ) == true then
					AddSpeakOption( Player,Player, GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
				end
		end
end
