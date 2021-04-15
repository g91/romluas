function houselearn_4(bookdbid)
	CallPlot(OwnerID() , "houselearn_4_1" , bookdbid )
end
function houselearn_4_1(bookdbid)
	local average = 3			--/*此處設定給予的經驗值
--	local bookdbid = 202702		--/*此處設定書的物件編號
	local lva = 30			--/*此處設定使用最高等級
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_5(bookdbid)
	CallPlot(OwnerID() , "houselearn_5_1" , bookdbid )
end
function houselearn_5_1(bookdbid)
	local average = 3			--/*此處設定給予的經驗值
--	local bookdbid = 202703		--/*此處設定書的物件編號
	local lva = 40			--/*此處設定使用最高等級
	local lvb = 30			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_6(bookdbid)
	CallPlot(OwnerID() , "houselearn_6_1" , bookdbid )
end
function houselearn_6_1(bookdbid)
	local average = 3			--/*此處設定給予的經驗值
--	local bookdbid = 202704		--/*此處設定書的物件編號
	local lva = 60			--/*此處設定使用最高等級
	local lvb = 40			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
-------------------------------------------------------------------------------------------------------
function houselearn_70(bookdbid)
	CallPlot(OwnerID() , "houselearn_70_1" , bookdbid )
end
function houselearn_70_1(bookdbid)
	local average = 141			--/*此處設定給予的經驗值
--	local bookdbid = 240494		--/*此處設定書的物件編號
	local lva = 70			--/*此處設定使用最高等級
	local lvb = 60			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_71(bookdbid)
	CallPlot(OwnerID() , "houselearn_71_1" , bookdbid )
end
function houselearn_71_1(bookdbid)
	local average = 213			--/*此處設定給予的經驗值
--	local bookdbid = 240495		--/*此處設定書的物件編號
	local lva = 80			--/*此處設定使用最高等級
	local lvb = 70			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_72(bookdbid)
	CallPlot(OwnerID() , "houselearn_72_1" , bookdbid )
end
function houselearn_72_1(bookdbid)
	local average = 315			--/*此處設定給予的經驗值
--	local bookdbid = 240496		--/*此處設定書的物件編號
	local lva = 90			--/*此處設定使用最高等級
	local lvb = 80			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function houselearn_73(bookdbid)
	CallPlot(OwnerID() , "houselearn_73_1" , bookdbid )
end
function houselearn_73_1(bookdbid)
	local average = 468			--/*此處設定給予的經驗值
--	local bookdbid = 240497		--/*此處設定書的物件編號
	local lva = 100			--/*此處設定使用最高等級
	local lvb = 90			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 600			--/*此處設定真實施法時間
	local BookMagicID = 502087
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		if ZoneID == 400 then
			if ( PlayerLV <= lva and PlayerLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), "[SC_BOOKCAST]".."["..bookdbid.."]" , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainGetTP(average*truecast/casttime)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end