function S_ResetObj( ObjID )
	--Sleep(50);
	-- 設定消失
	DelFromPartition( ObjID)
	Sleep( 50 )		
	
	-- 重設NPC資料	
	local ReviveTime = ReSetNPCInfo( ObjID)
	
	if ReviveTime  ~= -1 then
		Sleep( ReviveTime*10 )
	end
	
	-- 重新加入分割區
	AddToPartition( ObjID, 0 ) 
end

function LuaFunc_ResetObj( ObjID )
	--Sleep(50);
	-- 設定消失
	DelFromPartition( ObjID)
	Sleep( 50 )		
	
	-- 重設NPC資料	
	local ReviveTime = ReSetNPCInfo( ObjID)
	
	if ReviveTime  ~= -1 then
		Sleep( ReviveTime*10 )
	end
	
	-- 重新加入分割區
	AddToPartition( ObjID, 0 ) 
end
