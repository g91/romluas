function Sys_MineProcess( )
	while 1 do
		if  CheckMineEvent()== true then
			return true
		end
		Sleep( 5 )
	end
	return false






end