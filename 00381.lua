-- ����Y�@�@��
function Hsinag_RunPlot(  LuaName )
	BeginPlot( OwnerID() , LuaName , 0 )	
end

-- ���oDialog�^�ǵ��G
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