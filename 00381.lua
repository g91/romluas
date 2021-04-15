-- 執行某一劇情
function Hsinag_RunPlot(  LuaName )
	BeginPlot( OwnerID() , LuaName , 0 )	
end

-- 取得Dialog回傳結果
function Hsiang_GetDialogResoult(  GItemID )
	local Ret;
	for i = 0 , 6000 , 1 do
		Sleep( 1 );
		Ret = DialogGetResult( GItemID );
		if Ret>-2 then
			return Ret;
		end
	end
	return -1
end

function SysOpenEqGamble()
	OpenEqGamble();
end