function LuaInit_HuiInit()

	SetPlot( OwnerID(),"range","LuaSO_HuiTest_RangePlot",30)

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_HuiTest_RangePlot()

	if( RandRange( 0, 1 ) == 1 ) then
		Say( TargetID(), "�}~�}~" );
	end
	-- �i�H�յۼ����n��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaQ_HuiTest_BeginPlot()

	-- �{�b OwnerID() �O�Ǫ�, Target �O���a

	local TargetDBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	local SelfDBID = ReadRoleValue( OwnerID(), EM_RoleValue_DBID ) 
	Say( OwnerID(), "Target DBID = " .. TargetDBID .. " SelfDBID = " .. SelfDBID );
	
	while 1 do

		-- ���եؼ�( ���a ) �P�ۤv���Z��
		if( LuaFunc_PlayerCheck( TargetID() , DBID ) == true and CheckDistance( OwnerID(), TargetID(), 40 ) == true ) then
			 --LuaFunc_PlayerCheck( ItemID , DBID)
			--if( LuaFunc_Player_Alive( TargetID(), TargetDBID, 40 ) == 1 ) then
			Say( OwnerID(), "�٦b����" );
		else
			Say( OwnerID(), "���b����" );
			break;
		end			

		sleep( 500 );
	end
	
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaItem_ProcessItem()
	
	Say( OwnerID(), "�}�l�ϥΪ��~�@��" );

end
