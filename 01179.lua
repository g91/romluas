function LuaS_DialogRePort_OneChoose(Player)
--資料初始化
--記錄當時的zoneid、x還有z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""
	
	while true do
		Sleep( 5 )
--迴圈的檢查中加入區域的判斷
--若使用傳送術到別的zone 會直接跳出
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--迴圈的檢查中加入距離的判斷
--若距離超過100 則強制跳離選單
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--距離的平方 = x平方+z平方
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--等待玩家點選
--如果玩家不點選 一分鐘後跳出
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- 防無窮迴圈，120 = 一分鐘
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end

function ks_DialogRePort_TwoChoose( Player, Range, time )--新版提示框
	local FX,FZ,PX,PZ,Dis,OZone,PZone	
	local DialogResult
	local Sec = 0
	
	FX = ReadRoleValue( Player, EM_RoleValue_X )--原先座標x
	FZ = ReadRoleValue( Player, EM_RoleValue_Z )--原先座標z
	OZone = Lua_ExGetZone( Player )

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return
	end

	while true do		--等待玩家點選
		PZone = Lua_ExGetZone(Player)--區域的判斷
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		end

		PX = ReadRoleValue(Player,EM_RoleValue_X)--檢查當前座標
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)--檢查當前座標

		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)--求距離
		
		if Range == nil or Range < 50 or Range > 250 then Range = 50 end -- 距離範圍50~250		
		if	Dis > Range	then --若距離超過Range 則強制跳離選單
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		end
		
		Sec = Sec + 1
		if time == nil or time < 5 or time > 60 then time = 30 end	--時間範圍 5 ~ 60秒	
		if Sec >= time then  --如果玩家不點選 time秒後跳出
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		end
		
		local DialogStatus = DialogGetResult( Player )		
		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				DialogClose( Player )
				CancelBuff( Player, 501570 );--最後清除BUFF
				break
			end
		end
		Sleep( 10 )
	end
	return DialogResult	
end

function LuaS_DialogRePort_TwoChoose(Player)
--資料初始化
--記錄當時的zoneid、x還有z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)


	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
--迴圈的檢查中加入區域的判斷
--若使用傳送術到別的zone 會直接跳出
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--迴圈的檢查中加入距離的判斷
--若距離超過100 則強制跳離選單
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--距離的平方 = x平方+z平方
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--等待玩家點選
--如果玩家不點選 一分鐘後跳出
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- 防無窮迴圈，120 = 一分鐘
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end

function LuaS_DialogRePort_TwoChoose_40s(Player)
--資料初始化
--記錄當時的zoneid、x還有z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)


	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
--迴圈的檢查中加入區域的判斷
--若使用傳送術到別的zone 會直接跳出
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--迴圈的檢查中加入距離的判斷
--若距離超過100 則強制跳離選單
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--距離的平方 = x平方+z平方
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			return 0
		end
--等待玩家點選
--如果玩家不點選 40秒後跳出
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 80 then -- 防無窮迴圈，80 = 40秒
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--最後清除BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				ScriptMessage( Player , Player , 1, "[SC_QUESTSHOW_WAIT]", 0 )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--最後清除BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end