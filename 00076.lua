function S_ResetObj( ObjID )
	--Sleep(50);
	-- �]�w����
	DelFromPartition( ObjID)
	Sleep( 50 )		
	
	-- ���]NPC���	
	local ReviveTime = ReSetNPCInfo( ObjID)
	
	if ReviveTime  ~= -1 then
		Sleep( ReviveTime*10 )
	end
	
	-- ���s�[�J���ΰ�
	AddToPartition( ObjID, 0 ) 
end

function LuaFunc_ResetObj( ObjID )
	--Sleep(50);
	-- �]�w����
	DelFromPartition( ObjID)
	Sleep( 50 )		
	
	-- ���]NPC���	
	local ReviveTime = ReSetNPCInfo( ObjID)
	
	if ReviveTime  ~= -1 then
		Sleep( ReviveTime*10 )
	end
	
	-- ���s�[�J���ΰ�
	AddToPartition( ObjID, 0 ) 
end
