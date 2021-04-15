--頑固獵犬對話用
--World 1 區域頑固獵犬對話選項
--命名：lua_世界幾？_MTSnoopSZ()	MT=主城 SNOOP=阿狗 SZ=對話劇情
function lua_World1_MTSnoopSZ()
	local Player = OwnerID()
	local PlayerRace = ReadRoleValue(Player,EM_RoleValue_Race);
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local item = 0						--用來記錄列出的條目量
	local Flag = lua_Transport_FlagSet( ZoneID )		--回傳區域對應旗標 。
	local tmpPoint = lua_Transport_LocalSet( ZoneID )	--可傳送的暫存位置點，函式回傳一個陣列，對應該區域可傳送的地點。
	local Str = ""
	local Detail = ""
		Detail = lua_Snoopy_SpeakDetail()
		SetSpeakDetail( Player , Detail )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --我要將回程術地點登記於此
			--開啟傳送術
			if CheckFlag( Player,540001 ) == false then
				AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --傳送是什麼？
				SetFlag( Player,540001,1 )
			end
			--開啟此地傳送門
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );	--你成功開啟了此地的旅者之門。
			end
			--列出傳送選項(501638=騎程禁止)
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#tmpPoint do
					local loc = tmpPoint[i]	--loc =可傳送的區域
					local tmpFlag = lua_Transport_FlagSet( loc )
						if CheckFlag( Player , tmpFlag ) == true then
							if item < 6 then
								local PointName = lua_Transport_LocalName( loc )
									Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
								--	if ( loc ==31 and PlayerRace~=2 ) or ( loc==12 and PlayerRace~=1 ) then
									if loc==12 and PlayerRace~=1 then
										--2013/10/23 修正為只有精靈島禁外人。
									else
										AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 	
										item = item +1
									end
							else
								if CheckFlag( Player , 540191 ) == true then
									AddSpeakOption( Player, TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --傳送到瑞弗特營地
								end
									AddSpeakOption( Player, TargetID(),  "[SC_205764_2]" ,"lua_MTSnoopSZ_NEXT("..i..")", 0 ); --下一頁
									return
							end
						end
				end
				if CheckFlag( OwnerID() , 540191 ) == true then
					AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --這個是例外，所以特別列，傳送到瑞弗特營地
				end
			end
end
function lua_MTSnoopSZ_NEXT( k )
	local Player = OwnerID()
	local PlayerRace = ReadRoleValue(Player,EM_RoleValue_Race);
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local tmpPoint = lua_Transport_LocalSet( ZoneID )		--回傳一個陣列，對應該區域可傳送的地點。
	local Str = ""
		for i=k,#tmpPoint do
			local loc = tmpPoint[i]	--loc =可傳送的區域
			local tmpFlag = lua_Transport_FlagSet( loc )
				if CheckFlag( Player , tmpFlag ) == true then
					local PointName = lua_Transport_LocalName( loc )
						Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
						--if ( loc ==31 and PlayerRace~=2 ) or ( loc==12 and PlayerRace~=1 ) then
						if loc==12 and PlayerRace~=1 then
							--2013/10/23 修正為只有精靈島禁外人。
						else
							AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 
						end
				end
		end
		AddSpeakOption( Player, TargetID(),  "[SO_BACK]" ,"lua_World1_MTSnoopSZ", 0 ); --返回上一頁	
end
--傳送時用的Detail對話
function lua_Snoopy_SpeakDetail()
	--暫用，想新增或有使用條件都可
	local num=Rand(6)+1
	local SP = {}
		SP ={
			[1] = "[SC_111256_0]" ,		--呼～小子，你想做什麼快說；我，可是很沒耐心的。
			[2] = "[SC_SNOOPYSAY_01]" , 	--說真的，居然敢要我幫你服務？不要太過分了啊你！
			[3] = "[SC_SNOOPYSAY_02]" ,	--其實我也想轉行了，無奈何…算了，跟你說也沒用。
			[4] = "[SC_SNOOPYSAY_03]" ,	--你們這些不務正業的傢伙別老找我麻煩，會害我的工時不斷增加！
			[5] = "[SC_SNOOPYSAY_04]" ,
			[6] = "[SC_114353_0]"
				}
		return SP[num]
end
--可傳送區域的名稱
function lua_Transport_LocalName( loc )
	local PointName = {}
	local Str = ""
		PointName = {
				[1] = "[ZONE_ROGSHIRE]" , 		--羅格鎮
				[2] = "[ZONE_VARANAS]" , 		--凡瑞娜絲城
				[3] = "[ZONE_DUST HOLD]", 		--廢棄城寨
				[4] = "[ZONE_ARGENFALL]" , 		--銀瀑村
				[5] = "[ZONE_HAROLFE TRADING POST]" , --哈洛夫交易站
				[6] = "[OBSIDIAN BASTION]" , 		--黑曜石要塞
				[7] = "[ZONE_BOULDERWIND]" , 		--岩風村
				[8] = "[ZONE_THE GREEN TOWER]" ,	--綠之塔
				[9] = "[ZONE_DIMARKA]" , 		--達馬蓋村
				[10] = "[ZONE_AYEN CARAVAN]" ,	--艾爾恩商隊
				[11] = "[ZONE_LAGO]"  ,			--雷克鎮
				[12] = "[ZONE_STONES FURLOUGH]" ,	--遠行之點
				[13] = "[ZONE_HARFEN_CAMP]" ,		--海爾芬營地
				[15] = "[ZONE_THUNDERHOOF_MESA]" ,	--雷蹄之丘
				[16] = "[ZONE_SOUTH_JENOTAR_FOREST]" ,--南傑諾斯塔森林
				[17] = "[ZONE_NORTHERN_JANOST_FOREST]" ,--北傑諾斯塔森林
				[18] = "[ZONE_LYMUN_KINGDOM]" ,	--萊慕恩王國
				[19] = "[ZONE_CAMPBELL_TOWNSHIP]" ,	--坎貝爾小鎮
				[20] = "[ZONE_FIREBOOT_DWARF_FORTRESS]",--火靴堡壘
				[21] = "[ZONE_TORAGG_CARAVAN]",	--特羅格商隊
				[22] = "[ZONE_Z22_OLD_ROJAN_KINGDOM]",--諾里吉安國舊址
				[23] = "[ZONE_Z23_QUESLANA]",		--奇斯特拉艾恩那
				[24] = "[ZONE_Z24_MERDIN_TUNDRA]",	--彌爾丁凍原
				[25] = "[ZONE_Z25_SERBAYT_PASS]",	--希爾卑特隘口
				[26] = "[ZONE_Z26_ZHYRO]",		--薩烏洛
				[27] = "[ZONE_Z27_WAILING_FJORD]",	--哀嚎峽灣
				[28] = "[ZONE_Z28_HURTEKKE_JUNGLE]",	--赫特克叢林
				[29] = "[ZONE_Z29_XADIA_BASIN]",		--塞勒裴地亞盆地
				[30] = "[ZONE_Z30_KATHALAN]",		--卡沙艾蘭
				[31] = "[ZONE_Z31_IFANTRISH_CRYPT]", 	--伊凡崔希地穴
				[32] = "[ZONE_Z32_SPLITWATER]",  		--裂水台地
				[33] = "[ZONE_Z33_FAYTEAR_UPLANDS]" 	--費泰爾丘陵
						}
			return PointName[ loc]
end
function lua_Transport_LocalSet( ZoneID,loc )
	local tmp = 1;
 		if loc ==nil then
 			local TelLoc ={
 				[2] = { 6,22,27,1,13,4,5,3,7,8,9,10,11,12,31,32 },
 				[6] = { 2,22,27,1,13,10,11,4,5,3,7,8,9,12,31,32 },
				[15] = { 22, 27,16, 17, 18, 19, 20, 21,32 },
				[22] = { 2, 6, 15, 27, 23, 24 ,25 , 26,32 },
				[27] = { 2, 6, 15, 22, 28, 29, 30,32 },
				[32] = { 2, 6, 15, 22, 27, 33, 34 }
 						}
 			return TelLoc[ZoneID]
 		else
 			local TelMoney = {
 				[2] = { [1]=10, [3]=750, [4]=250 , [5]=750 , [6]=50, [7]=1750, [8]=3000, [9]=4500, [10]=60, [11]=300, [12]=10 , [13]=10, [22]=2200, [27]=5000, [31]=10, [32]=10000 } ,
 				[6] = { [1]=60, [2]=50, [3]=800, [4]=300 , [5]=750, [7]=1800, [8]=3050, [9]=4550, [10]=10, [11]=250, [12]=60 , [13]=60,  [22]=2200, [27]=5000, [31]=60, [32]=10000 } ,
				[15] = { [22]=2200, [27]=5000, [32]=10000,  [16]=1500, [17]=3000, [18]=4500, [19]=6000, [20]=7500, [21]=9000 } ,
				[22] = { [2]=2200 ,[6]=2200, [15]=2200 , [32]=10000,  [23]=2200 , [24]=4400 , [25]=6600 , [26]=8800 ,[27]=5000 } ,
				[27] = { [2]=5000,[6]=5000, [15]=5000 , [22]=5000, [32]=10000,   [28]=3000 ,[29]=6000 ,[30]=9000 },
				[32] = { [2]=10000,[6]=10000, [15]=10000 , [22]=10000, [27]=10000 ,[33]=6000 ,[34]=9000 }
						 }
 			return TelMoney[ ZoneID ][loc]
 		end
end

function lua_Transport_FlagSet( loc )
	loc = loc or 1	--就算壞掉也會以為是羅格鎮
	--新增區域[ZoneID]=可飛該Zone的旗標判定。
	local Flag = {
			--World I
		 	[1] = 541313 ,
			[2] = 541314 ,	--主城
			[3] = 542297 ,
			[4] = 541315 ,
			[5] = 541316 ,
			[6] = 541317 ,	--主城
			[7] = 542498 ,
			[8] = 542744 ,
			[9] = 542997 ,
			[10] = 541318 ,
			[11] = 541319 ,
			[12] = 542557 ,
			[13] = 540193 ,
			--World II
			[15] = 543704 ,	--主城
			[16] = 543705 ,
			[17] = 544327 , 
			[18] = 544624 ,
			[19] = 544680 ,
			[20] = 545465 ,
			[21] = 545618 ,
			--World III
			[22] = 546189 ,	--主城
			[23] = 547002 ,
			[24] = 547003 ,
			[25] = 547004 ,
			[26] = 547005 ,
			[31] = 546255 ,
			--World IV
			[27] = 548380,
			[28] = 548381,
			[29] = 548382,
			[30] = 548383,
			--World V
			[32] = 548978,
			[33] = 548979,
			[34] = 548980
					}
			return Flag[ loc ]
end
--取得傳送點位置
function lua_GetTransportPoint( loc ) 
	local TP = {}
		for i=1,40 do
			TP[i] = {}
		end
		TP = {
			[1] = { -1155, 37, -5548, 100 }  , 		--開墾聚落
			[2] = { 2298, 0, 1153, 39 }  , 		--凡瑞娜絲城
			[3] = { 13855, 27 , 6748, 175 } , 		--廢棄城寨
			[4] = { -5917, 593, 2886, 280 } , 		--銀瀑村
			[5] = { -14466, 756, -170, 2 } , 		--哈洛夫交易站
			[6] = { -20460, -190, 6507, 132 } , 		--黑曜石要塞
			[7] = { 19672, 12, 21907, 340 } , 		--岩風村
			[8] = { 5924 , 189 , 20751 , 210 } ,		--綠之塔
			[9] = { -11207 , 973 , 26316 , 70 } , 	--達馬蓋村
			[10] = { -38730, -2, 1543, 14 } ,		--艾爾恩商隊	-- -29480, -540, 1193, 8.6
			[11] = { -29454, 254 , -17630, 180 } , 	--雷克鎮
			[12] = { 28502, 312, 3465 , 180 } ,		--遠行之點
			[13] = { -6324.4, 165, -3914.3 , 166.2 } ,	--海爾芬營地
			[15] = { -4261, 13, 5050, 250 } ,		--雷蹄之丘
			[16] = { -5982 , -148 , 21609 , 300 } ,
			[17] = { 3571.6 , 113.5 , 31635.7 , 300 } ,
			[18] = { 3085.2 , 85.0 , 47603.9 , 90 } ,
			[19] = { -2893.9 , 119.0 , 49658.0 , 251.4 } ,
			[20] = { -16445.3 , 613 , 41033.7 , 174.4 } ,
			[21] = { -26338.5 , -100 , 29778.7 , 174.4 } ,
			[22] = { -20732.1,570,-22756.7,321.3 } , 	--諾里吉安國舊址
			[23] = { -7794.4,718.8,-16589.3,169.9 } ,
			[24] = { 3847.4,444.8,-7769.3,180.9 } ,
			[25] = { -6557.7, 1452.4, -7719.4, 29 } ,
			[26] = { -17896.6, 801.9, -3340.5, 335.9 } ,
			[27] = { -9171.8, 20, 3055, 283.7 } ,
			[28] = {2587.7,146.9,24619,210},
			[29] = { 7054, 11, 22695, 272},
			[30] = {19298.9,45.8,34932.7,134.6},
			[31] = { 2300, 1546, -414, 300 },		--伊凡崔希地穴
			[32] = { -12986, 180, -14194, 200 },		--裂水台地
			[33] = {-4248.7,839.1,5134.2,116.5},
			[34] = {0,0,0,0}
					}
		if TP[1]==nil then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	--資料送出有問題
		else
			return TP[loc][1],TP[loc][2],TP[loc][3],TP[loc][4]
		end
end
--傳送術
function lua_World1_Transport( loc )	--loc =玩家指定傳送的位置
	local Player = OwnerID()
	CloseSpeak( Player )
	DebugMsg(0,0,"Player_Select_a_location="..loc)
	CallPlot( Player , "lua_World1_TransportSpell" , TargetID() , Player , loc )
end
function lua_World1_TransportSpell( Obj , Player , loc ) --loc =玩家指定傳送的位置
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Areaname = lua_Transport_LocalName( loc )	-- function回傳地圖字串
	local CastMoney = lua_Transport_LocalSet( ZoneID,loc )
	local String = ""
		String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname.."][$SETVAR2="..CastMoney.."]" --傳送到羅格鎮需要付費 XX 銀
		if String == -1 then
			ScriptMessage( Player,Player,1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		if CheckBuff( Player , 501570) == false then  --增加檢查判斷

			DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
			DialogSelectStr( Player , GetString("SO_YES") );
			DialogSelectStr( Player , GetString("SO_NO") );
			AddBuff( Player , 501570,0,-1);--然後給予BUFF
				if( DialogSendOpen( Player ) == false ) then 
					ScriptMessage( Player,Player,1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
					--資料送出有問題
					return 0
				end
			--通用取得DIALOG判斷( 取得的物件ID、存在的秒數、距離限制、距離限制參考的目標 )
			local SelectID = EX_GetDialogResoult( Player, 30 , 75 , Obj )
				DialogClose( Player )
				CancelBuff( Player, 501570 );--最後清除BUFF
				if SelectID == 0  then
					if ReadRoleValue( Player , EM_RoleValue_Money ) < CastMoney then
						ScriptMessage( Player, Player, 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*你身上的錢不夠。
					else
						if AddRoleValue( Player , EM_RoleValue_Money , -(CastMoney) ) then
							local tx,ty,tz,tdir = lua_GetTransportPoint( loc )
								CastSpell( Player , Player , 491008 )
								sleep( 5 )
								ChangeZone( Player , loc , 0 , tx , ty , tz, tdir )
						end
					end
					return 1
				elseif SelectID == 1  then
					return 0
				else 
					return 0
				end
		else
			ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
		end
end