--702772 新版結婚系統_傳送物品

-- 物品使用檢查 是否在各副本裡
function lua_mika_weddingtrans_check()
	local OID = OwnerID()
	local ZoneID =  ReadRoleValue( OID , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if Zone > 100 then 
		ScriptMessage( OID , OID , 1 , "[SC_2012MARRY_ITEM02]" , 0 )	-- 副本區域內無法使用此物品
		return false
	else
		return true
	end
end


function lua_mika_weddingtrans_item01()
	local OID = OwnerID()
	local itemid = GetUseItemGUID(OID)  -- 使用中的物品id
--	say(OID, "idtest ="..itemid )
	Callplot( OID ,"lua_mika_weddingtrans_item02", itemid )
end

function lua_mika_weddingtrans_item02(itemid)
	local OID = OwnerID()
	if CheckBuff( OID , 501570) == false then  --增加檢查判斷
		DialogCreate( OID , EM_LuaDialogType_YesNo ,"[SC_2012MARRY_ITEM03]") -- 確定要前往邀請者申請的婚禮會場？
		DialogSelectStr( OID , "[SC_GETTITLE_1]" );
		DialogSelectStr( OID , "[SC_CANCEL]" );
		AddBuff(OID , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OID ) == false ) then 
			ScriptMessage( OID , OID , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		local n = 0
		local DialogResult = ""
		while true do
			Sleep( 10 )
			local DialogStatus = DialogGetResult( OID )
			n = n + 1
		--	Say(OwnerID(), n)
			if n >= 10 then -- 防無窮迴圈，10sec
				--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
				DialogClose( OID )
				CancelBuff( OID, 501570 );--最後清除BUFF

				break
			else
				--ScriptMessage( Player , Player , 0, "OK", 0 )
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					Callplot( OID ,"lua_mika_weddingtrans_item03", itemid )
					DialogClose( OID )
					CancelBuff( OID, 501570 );--最後清除BUFF
					break
				elseif ( DialogStatus == 1 ) or ( DialogStatus ==-1 ) then
					DialogResult = "No"
					DialogClose( OID )
					CancelBuff( OID, 501570 );--最後清除BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end
	else
		ScriptMessage( OID , OID , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function lua_mika_weddingtrans_item03(itemid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem 傳入區域時給予
	local itemlist = { 
			241977, 241978 , 241979 ,
 			241980, 241981 , 241982 ,
 			241983, 241984 , 241985 
			}  -- 傳送石的id

	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}


	for i = 1, #itemlist do
	--	say(Player, "i ="..i)
		if itemid == itemlist[i] then
			Setflag(Player, EnterKey, 0 ) --清除隱藏物件範圍觸發劇情Key
			WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, i )
			local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
		--	say(Player, "SN ="..SN )
		--	say(Player, "pos1 ="..pos[SN][1]..", pos2 ="..pos[SN][2]..", pos3 ="..pos[SN][3]..", pos4 ="..pos[SN][4]..", pos5 ="..pos[SN][5]  )
			ChangeZone( Player , pos[SN][1] , 0, pos[SN][2] , pos[SN][3], pos[SN][4], pos[SN][5] ) 
			DelBodyItem(Player, itemid, 1 )
			break
		end
	end

end