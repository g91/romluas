function LuaInit_SetGuild()

	SetMinimapIcon( OwnerID(), 1 );

end

function LuaInit_R110000()

	--SetMinimapIcon( OwnerID(), 1 );
	--SetPlot( OwnerID(), "range", "LuaRange_110000", 40 );
	SetSpeakDetail( OwnerID(), "����"   );
	AddSpeakOption( OwnerID(), TargetID( ), "���߷s�~�n�I���ڬ��]�I" , "LuaBorder_110000", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "�������" , "LuaS_110426_EXIT", 0 ); --/*�������


end

function LuaRange_110000()

	--SetMinimapIcon( OwnerID(), 1 );
	--SetPlot( OwnerID(), "range", 
	Say( OwnerID(), "TEST!" );
end

function LuaSpeak_R110000()

	SetSpeakDetail( OwnerID(), "����"   );
	AddSpeakOption( OwnerID(), TargetID( ), "���߷s�~�n�I���ڬ��]�I" , "LuaBorder_110000", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "�������" , "LuaS_110426_EXIT", 0 ); --/*�������
end

function LuaBorder_110000()

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDesc( 420025 ) );
	AddBorderPage( OwnerID(), GetQuestDetail( 420025, 1  ) );
	AddBorderPage( OwnerID(), GetQuestDetail( 420025 , 2 ) );
	AddBorderPage( OwnerID(), GetQuestDetail( 420025 , 3 ) );


	--AddBorderPage( OwnerID(), "PAGE 02" );
	--AddBorderPage( OwnerID(), "PAGE 03" );
	--AddBorderPage( OwnerID(), "PAGE 04" );
	--AddBorderPage( OwnerID(), "PAGE 05" );


	ShowBorder( OwnerID(), 420025, "GGYY", "ScriptBorder_Texture_Paper" );	

end

function LuaInit_SetBank()

	SetMinimapIcon( OwnerID(), 2 );

end

function LuaInit_SetTravel()
	SetMinimapIcon( OwnerID(), 13 );
end

function LuaTest_Click110091()
	--SetMinimapIcon( OwnerID(), 13 );
	--Say( TargetID(), "�I�ڷF��" );
	--SetPosByFlag( OwnerID(), 780010, 0 );
	local a = ReadRoleValue( OwnerID(), EM_RoleValue_Money );
	return 1;
end

