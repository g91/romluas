
function Yu_noPK_Safe_00()                                                                                                 --PK保護

	if GetServerDataLanguage()  == "kr" then  --如果語系是韓國

       	         SetPlot( OwnerID(),"range","Yu_noPK_Safe_01",300 )                                         --範圍內觸發

	end

end

function Yu_noPK_Safe_01()

--	Say( OwnerID() ,"OwnerID" ) --玩家
--	Say( TargetID() ,"TargetID" ) --npc

	local noPK = 504623 --小型區域
	local noPK2 = 505578 --大型區域


	if ( CheckBuff( OwnerID(), noPK ) == FALSE ) then

		AddBuff( OwnerID() , noPK , 0 , 30 )		--PK保護BUFF

		ScriptMessage( TargetID() , OwnerID() , 1 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --你現在處於安全狀態，不受強制PK侵犯。
		ScriptMessage( TargetID() , OwnerID() , 0 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --

	end

end

function Yu_noPK_Safe_02()

--	Say( OwnerID() ,"OwnerID" ) --玩家
--	Say( TargetID() ,"TargetID" ) --玩家

	local noPK = 504623
	local noPK2 = 505578 --大型區域

	local noPK_Buliding_01 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 110425, 300 , 1) --重生石
	local noPK_Buliding_02 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 111272, 300 , 1) --傳送石

	if ( CheckID( noPK_Buliding_01[0] ) == true ) or ( CheckID( noPK_Buliding_02[0] ) == true ) then

		AddBuff( OwnerID() , noPK , 0 , 30 )		--PK保護BUFF

	else
		if ( CheckBuff( OwnerID(), noPK2 ) == FALSE ) then --大型區域PK保護的BUFF
			ScriptMessage( TargetID() , OwnerID() , 1 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) --你已離開PK保護之安全區域。
			ScriptMessage( TargetID() , OwnerID() , 0 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) 
		end
	end

end

function Lua_Hao_Check_Pk_Status()	-- PK保護因治療他人而消失 2012/02/20

	local Self = OwnerID()
	local Target = TargetID()
	local Buff = {}
	Buff[1] = 502931
	Buff[2] = 502932
	Buff[3] = 502933
	
	if Target ~= Self then
		for i = 1 , table.getn(Buff) , 1 do
			CancelBuff_NoEvent( Self , Buff[i] )
		end
	end
end