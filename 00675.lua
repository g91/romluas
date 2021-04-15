-- ��{�j�YPVP���Ų~�˦�B�z
function BloodyGalleryPVP( KillerID , DeadID , ZoneID , ParallelZoneID , RoomID )

	if CountBodyItem( KillerID , 201962 ) >= 1 then			-- ��G�Ų~ >= 1
		if DelBodyItem( KillerID , 201962 , 1 ) then		-- ��G�Ų~�R��
			GiveBodyItem( KillerID , 201963 , 1 )	-- �s�A��~
		end
	end

end

-- �m���E�~�A��}�Ҫ�
function LuaI_BloodyGalleryDoor()

	--local Player = OwnerID()
	--local GalleryDoorID = 110985
	--local SearchRange = 500

	--local GalleryDoor = LuaFunc_SearchNPCbyOrgID( Player , GalleryDoorID , SearchRange )
	--if CheckID( GalleryDoor ) == true then
		--WriteRoleValue ( Player , EM_RoleValue_PID , GalleryDoor )
		--Say ( Player , GalleryDoor )
	--end

	SetPlot( OwnerID() , "touch" , "BloodyGalleryDoorOpen" , 20 )

end

function BloodyGalleryDoorOpen()

	local OpenTime = 10 * 60 * 60 * 2				 -- ���ת��}�Үɶ�
	--local OpenTime = 600
	local GalleryDoorID = 110985
	local SearchRange = 500

	for i = 1 , 5  do
		local GalleryDoor = LuaFunc_SearchNPCbyOrgID( TargetID() , GalleryDoorID , SearchRange )
		if CheckID( GalleryDoor ) == true then
			WriteRoleValue ( TargetID() , EM_RoleValue_PID , GalleryDoor )
			--Say ( TargetID() , GalleryDoor )
		end
	end

	GalleryDoor = ReadRoleValue ( TargetID() , EM_RoleValue_PID )

	if CountBodyItem( OwnerID() , 201963 ) >= 9 then		-- �s�A��~*9
		if DelBodyItem( OwnerID() , 201963 , 9 ) then		-- �s�A��~�R��
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("ST_BLOODY_03") , C_SYSTEM )		-- �A�m���F�E�~�A��A���W���ʦL�H�������ƥh�I
			DelFromPartition( GalleryDoor )
			Sleep( OpenTime )
			AddToPartition( GalleryDoor , 0 )
			--Sleep( 5 )
			--local GalleryDoor = LuaFunc_SearchNPCbyOrgID( TargetID() , GalleryDoorID , SearchRange )
			--if CheckID( GalleryDoor ) == true then
			--	WriteRoleValue ( TargetID() , EM_RoleValue_PID , GalleryDoor )
			--end
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("ST_BLOODY_02") , C_SYSTEM )			-- �m���W�E�~�A��A�~��Ѱ����W���ʦL�I
	end

end

-- �H�Φ����ܨ�����
function AI_Seebara_HumanType()
	SetPlot( OwnerID() ,"Dead" , "Dead_Seebara_HumanType" , 0 )
end

function Dead_Seebara_HumanType()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100706,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)		--�������`
	BeginPlot( TargetID() , "Show_Seebara_BatType" , 0 )
end

function Show_Seebara_BatType()

	local MonsterID = 100707	-- ��{�B��Ƥک�
	local BossID = TargetID()

	local Obj = Role:new( BossID )

	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()

	Seebara_BatType = CreateObj( MonsterID , BaseX , BaseY , BaseZ , BaseDir , 1 )
	SetRoleCamp( Seebara_BatType , "Visitor" )
	AddToPartition( Seebara_BatType , BaseRoom )
	Say( Seebara_BatType , GetString("ST_BLOODY_05") )	-- �㫢����ڥi�O�ë������ͩR�A�A��Q�����ڡI
	Sleep( 25 )
	DelFromPartition( Seebara_BatType )
	Sleep( 25  )
	AddToPartition( Seebara_BatType , BaseRoom )
	SetPos( Seebara_BatType , 1937 , 60 , 3081, 0 )
	Sleep( 25  )
	DelFromPartition( Seebara_BatType )
	Sleep( 25  )
	AddToPartition( Seebara_BatType , BaseRoom )
	SetPos( Seebara_BatType , 1876 , 60 , 3081, 0 )
	Sleep( 25 )
	DelObj( Seebara_BatType )

end

function BloodyGalleryAreaStart()	-- �ϰ��l��T
	PKFlag( 3 )
end

