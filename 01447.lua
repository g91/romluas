
function Yu_noPK_Safe_00()                                                                                                 --PK�O�@

	if GetServerDataLanguage()  == "kr" then  --�p�G�y�t�O����

       	         SetPlot( OwnerID(),"range","Yu_noPK_Safe_01",300 )                                         --�d��Ĳ�o

	end

end

function Yu_noPK_Safe_01()

--	Say( OwnerID() ,"OwnerID" ) --���a
--	Say( TargetID() ,"TargetID" ) --npc

	local noPK = 504623 --�p���ϰ�
	local noPK2 = 505578 --�j���ϰ�


	if ( CheckBuff( OwnerID(), noPK ) == FALSE ) then

		AddBuff( OwnerID() , noPK , 0 , 30 )		--PK�O�@BUFF

		ScriptMessage( TargetID() , OwnerID() , 1 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --�A�{�b�B��w�����A�A�����j��PK�I�ǡC
		ScriptMessage( TargetID() , OwnerID() , 0 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --

	end

end

function Yu_noPK_Safe_02()

--	Say( OwnerID() ,"OwnerID" ) --���a
--	Say( TargetID() ,"TargetID" ) --���a

	local noPK = 504623
	local noPK2 = 505578 --�j���ϰ�

	local noPK_Buliding_01 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 110425, 300 , 1) --���ͥ�
	local noPK_Buliding_02 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 111272, 300 , 1) --�ǰe��

	if ( CheckID( noPK_Buliding_01[0] ) == true ) or ( CheckID( noPK_Buliding_02[0] ) == true ) then

		AddBuff( OwnerID() , noPK , 0 , 30 )		--PK�O�@BUFF

	else
		if ( CheckBuff( OwnerID(), noPK2 ) == FALSE ) then --�j���ϰ�PK�O�@��BUFF
			ScriptMessage( TargetID() , OwnerID() , 1 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) --�A�w���}PK�O�@���w���ϰ�C
			ScriptMessage( TargetID() , OwnerID() , 0 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) 
		end
	end

end

function Lua_Hao_Check_Pk_Status()	-- PK�O�@�]�v���L�H�Ӯ��� 2012/02/20

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