--頑固獵犬對話用
--World 2 區域頑固獵犬對話選項
--命名：lua_世界幾？_MTSnoopSZ()	MT=主城 SNOOP=阿狗 SZ=對話劇情
function lua_World3_MTSnoopSZ()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local item = 0						--用來記錄列出的條目量
	local Flag = lua_Transport_FlagSet( ZoneID )		--回傳區域對應旗標 。
	local tmpPoint = lua_Transport_LocalSet( ZoneID )	--可傳送的暫存位置點，函式回傳一個陣列，對應該區域可傳送的地點。
	local Str = ""
	local Detail = ""
		Detail = lua_Snoopy_SpeakDetail()
		SetSpeakDetail( Player , Detail )			--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --我要將回程術地點登記於此
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
						--	item = item +1
						--	if item <= 5 then
							local PointName = lua_Transport_LocalName( loc )
							Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --傳送到[$VAR1]
							AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 
						--	else
						--		AddSpeakOption( Player, TargetID(),  "[SC_205764_2]" ,"lua_MTSnoopSZ_NEXT", 0 ); --下一頁
						--		return
						--	end
						end
				end

			end
end