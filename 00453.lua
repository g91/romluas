--�إߩФl
function Sys_BuildHouse( )
	local Ret = BuildHouse( OwnerID() , 575523 );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "�إߩЫΥ���" );
	end
end

--�}�Ұ��[�ЫΪ�����
function Sys_HouseVisit_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_HouseVisit_Open" , 50 );
end

function Sys_HouseVisit_Open()
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "���B����]�w�^���I" );
		return;
	end
	OpenVisitHouse( false );--�}�Ұ��[����
end

function Sys_HouseVisit_MyHouse_Open()

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Z )

	local Obj = Role:new( OwnerID() );

--	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );

	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , X , Y , Z , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "���B����]�w�^���I" );
		return;
	end
	OpenVisitHouse( true ); --�^�ۤv�Ы�
end

--���Фl
function Sys_ChangeHouse( Option )

	local HouseID= {575523,
			575524,
			578537,
			578538,
			579041,
			579917,
			579918}


	local FlagID= {	542670,
			542671,
			542672,
			542673,
			542674,
			542675,
			542676}


	local NewHouse = 0

	for i= 1 , table.getn(FlagID) do

		if Option == HouseID[i] then 
			NewHouse = FlagID[i]
		end
	end

--	Say( OwnerID, NewHouse )
--	Tell( OwnerID() , OwnerID() ,   NewHouse.."1"  )

	if SetHouseType( Option ) then
		SetPos( OwnerID() , 0 , 0 , 0 , 0 )
		UseItemDestroy()
		SetFlag( OwnerID()  , NewHouse, 1 )  --���X��

	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_203072_01")  , C_DEFAULT )	--�e�������T���G�L�k�󴫬��ۦP�槽���ЫΡI
	end
end
function Sys_ChangeHouse_Check()
	if ( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 400 ) then
		return true
	else
		return false
	end
end