-----------------------------------------------------------------�ȴ߫���----------------------------------------------------
function LuaQ_420549_CHECK1()

	if CountBodyItem(OwnerID(),200718) > 0 and CountBodyItem(OwnerID(),200719) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*�ʤ֩һݪ���C	
		return false
	end
end
function LuaQ_420549_CHECK2()

	if CountBodyItem(OwnerID(),200717) > 0 and CountBodyItem(OwnerID(),200719) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*�ʤ֩һݪ���C	
		return false
	end
end
function LuaQ_420549_CHECK3()

	if CountBodyItem(OwnerID(),200717) > 0 and CountBodyItem(OwnerID(),200718) > 0  then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("EM_420549_1"), 0 );	--/*�ʤ֩һݪ���C	
		return false
	end
end

function LuaQ_420549_Item()

	DelBodyItem( OwnerID() ,200717 , 1 )
	DelBodyItem( OwnerID() ,200718 , 1 )
	DelBodyItem( OwnerID() ,200719 , 1 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420549_0"), 0 ); --/*�A�N�ȴ߫��b�@�_�C
	GiveBodyItem(OwnerID() ,200722 , 1 )

end
--------------------------------------------------------------�������p�w-----------------------------------------------------

function LuaI_100225()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "Range" , "LuaI_100225_range" , 150 )
end

function LuaI_100225_range()
	BeginPlot( TargetID() , "LuaI_100225_Esc" , 0 )
end

function LuaI_100225_Esc()
	ScriptMessage( OwnerID(), 0, 1, GetString("EM_100225_0"), 0 ); --/*�������p�w�o�{�H���𮧡A���������b�Ů𤧤��C
	local Point = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Point = Point + 1 + rand(2)
	if Point > 4  then
		Point = Point - 5
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Point )	
	SetPosByFlag( OwnerID() , 780045, Point )
end
--------------------------------------------------------------�}�ຸ���l��--------------------------------------------------
function LuaI_200700_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420169 ) == false or CheckCompleteQuest( OwnerID() , 420169 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_0"), 0 ); --/*�A�ثe�Τ���o�ӲŦL�C
		return false
	elseif CheckFlag( OwnerID() , 540790 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_1"), 0 ); --/*�A�ݤF�ŦL�@���A�T�{�������p�w�٥}�T�b�䤤�C
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_2"), 0 ); --/*�A�S���ؼСC
		return false
	else
		if Target ~= 100225  then 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_3"), 0 ); --/*�ŦL�u��������p�w���@�ΡC
			return false	
		else
			return true
		end
	end
end

function LuaC_200700_Effect()
	if CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_4"), 0 ); --/*�ݨӪ������p�w���\�k���F�I		
	else
		BeginPlot(TargetID() , "LuaI_200700_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200700_5"), 0 ); --/*�������p�w���t�Y�p�A�óQ�l�J�ŦL�̭��I
		SetFlag(OwnerID() ,540790 , 1 )	
	end
end
function LuaI_200700_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end
--------------------------------------------------------------�u����a-----------------------------------------------------------------
function LuaS_200751_0() --�]�Ǥ���

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420576, 1  ) );

	ShowBorder( OwnerID(), 420576, "[200751]", "ScriptBorder_Texture_Paper" );	

end
--------------------------------------------------------------�v��-----------------------------------------------------------------
function LuaQ_420245_BeginClick() 

	if CountBodyItem( OwnerID() , 200706 ) > 0 then
		return 1
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420245_0"), 0 ); --/*�ʤ֧ưҽհt���ľ��C`
		return -1
	end	

end

function LuaQ_420245_AfterClick() 

	if DelBodyItem( OwnerID() , 200706 , 1)  then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420245_1"), 0 ); --/*�A�`�`�l�F�X�f�]�H�����ƴ��X�Ӫ�����C
		return 1
	else
		return -1
	end	

end
----------------------------------------------------------
