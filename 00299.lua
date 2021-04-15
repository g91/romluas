--���j�F�a��H�i�J�K�D
function LuaQ_420279_Complete()

	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420279) == true then --���H�S�^���ȡA�@���N�����U�]
			return
		end 
	end

	DisableQuest( OwnerID() , true ) 
	MoveToFlagEnabled( OwnerID(), false );
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) 
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( OwnerID(), 780030 , 1 ,0 ) 
	local Soldier = Ver_Zone103_Trap[RoomID]["Soldiers"] 
	yell( OwnerID() , GetString("SAY_110247_4") , 5 ) --/*�Ԥh�̡I 
	for i = 0 , 12 , 1 do
		if Soldier[i] == -1 then			
			Break
		end
		MoveToFlagEnabled( Soldier[i], false );
		WriteRoleValue( Soldier[i] ,EM_RoleValue_IsWalk , 0  )
		LuaFunc_MoveToFlag( Soldier[i], 780030 , i+101 ,0 ) --�\��h�L����m101~112
		AdjustFaceDir( Soldier[i], OwnerID(), 0 )
		
	end
	sleep( 50 )
	yell( OwnerID() , GetString("SAY_110247_5") , 5) --/*�A�̷ǳƦn�F�ܡH
	sleep( 30 )
	yell( Soldier[5] , GetString("SAY_110450_0") , 5 ) --/*���N�ǳƦn�F�I�����I
	sleep( 30 )
	yell( Soldier[3] , GetString("SAY_110450_1") , 5) --/*���Ӥ[�A�ڪ��M�b���֥��äF�I
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_110247_6") , 5 ) --/*�w�R�I�d���ҡA�A�̦n�b�ڼƨ�T���e��M�b���ڿi�Q�A�]���ڭ̭n�X�o�F�C
	sleep( 30 )
	yell( Soldier[3] , GetString("SAY_110450_5") , 5 ) --/*�����I�ڦV�A�O�ҳo�ӤM�b�������}�̰�T������I
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_110247_7") , 5  ) --/*���N�g�b�a�I�Ԥh�̡I�]�̫᪺���\�u��Y����I
	for i = 0 , 11 , 1 do
		yell( Soldier[i] , GetString("SAY_110450_6") , 5) --/*�q��		
		PlayMotion( Soldier[i] , ruFUSION_ACTORSTATE_ATTACK_POLEARM ) --��ɭԬݱ����ܴ�
		BeginPlot( Soldier[i] , "LuaQ_420279_Solider" , 0 )
	end
	sleep( 30 )

	for i = 0 , 20 , 1 do
		LuaFunc_MoveToFlag( OwnerID(), 780030 , i+10 ,0 ) --�q10~30�����|B
	end

	Ver_Zone103_Trap[RoomID]["DRAMA"] = 1
	BeginPlot( OwnerID() , "LuaQ_420279_Corpse" , 0 )

	
end

function LuaQ_420279_Solider()

	sleep( Rand(20)+10 )
	for i = 0 , 20 , 1 do
		LuaFunc_MoveToFlag( OwnerID(), 780030 , i+10 ,0 )
	end
	DelObj( OwnerID() )
end
function LuaQ_420279_Corpse()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) 
	local Corpse = {}
	for i = 61 , 71 , 1 do
		Corpse[i] = CreateObjByFlag( 110450 , 780030 , i , 1 )
		SetRoleCamp( Corpse[i] ,"Visitor")
		PlayMotionEX( Corpse[i], ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
		AddToPartition( Corpse[i] ,RoomID )
		DisableQuest( Corpse[i] , true)
	end
	for i = 72 , 80 , 1 do
		local Enemy
		local n = rand( 4 )
		if n == 1 then
			 Enemy = 100159 
		elseif n == 2 then
			 Enemy = 100374 
		elseif n == 3 then
			 Enemy = 100609 --��Ͱ��d���]�~
		else
			 Enemy = 100594--���p���y���{
		end
		Corpse[i] = CreateObjByFlag( Enemy , 780030 , i , 1 )
		SetRoleCamp( Corpse[i] ,"Visitor")
		PlayMotionEX( Corpse[i], ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
		AddToPartition( Corpse[i] ,RoomID )
	end
	Hide( OwnerID() )
end
----------------------------------------------------------------------------------------------------------
--���j�F�P�h�|�����԰�
function LuaI_420279A()
	SetPlot( OwnerID() , "Range" ,"LuaI_420279_Range" , 150 )
end
function LuaI_420279_Range()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local DLS = Ver_Zone103_Trap[RoomID]["DLS"]  --�ȥN�A��X�h�|��
	if CheckID( DLS ) == false or ReadRoleValue(DLS,EM_RoleValue_IsDead) == 1 or  ReadRoleValue(DLS,EM_RoleValue_OrgID) ~= 100611 then
		SetPlot( TargetID(), "Range" ,"" , 0 )
		DelObj( TargetID() )
		return
	end 
	if Ver_Zone103_Trap[RoomID]["DRAMA"] == nil or Ver_Zone103_Trap[RoomID]["DRAMA"] == 0 then
		return
	end
	SetPlot( TargetID(), "Range" ,"" , 0 )
	BeginPlot( TargetID(), "LuaI_420279_CreateDLS" , 0 )
--	Say( OwnerID() ,"Touch")
end
function LuaI_420279_CreateDLS()
	local RoomID = ReadRoleValue( TargetID(),  EM_RoleValue_RoomID )
	local Dummy_DLS = CreateObjByFlag( 100611, 780030 , 5 , 1 ) 
	AddToPartition( Dummy_DLS , RoomID )
	SetRoleCamp( Dummy_DLS ,"Visitor" )
	Hide( Dummy_DLS )
	Show(Dummy_DLS , RoomID )
	BeginPlot( Dummy_DLS  , "LuaI_420279_Battle",0 )
	sleep(5)
	DelObj( OwnerID() )
end
function LuaI_420279_Battle()

	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) 

	if Ver_Zone103_Trap[RoomID]["DRAMA"] > 1 then
		Delobj(OwnerID())	
		return
	end 
	if CheckID( Ver_Zone103_Trap[RoomID]["DRAMA"] ) == true and ReadRoleValue( Ver_Zone103_Trap[RoomID]["DRAMA"] ,EM_RoleValue_OrgID) == 100274 then
		Delobj(OwnerID())	
		return
	end 
	local OGD = CreateObjByFlag( 110247 , 780030 , 4 , 1 ) 
	local DLS = Ver_Zone103_Trap[RoomID]["DLS"]  --�ȥN�A��X�h�|��
	Hide( DLS )
	DisableQuest( OGD , true )
	AddToPartition( OGD , RoomID )

	sleep( 100 )
	yell( OGD , GetString("SAY_110247_8") ,5) --/*�������å�I
	FaceObj( OwnerID() , OGD )
	SetAttack( OGD , OwnerID() )
	PlayMotion( OwnerID()  , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 50 )
	CastSpell( OGD , OGD, 491033 )
	yell( OGD , GetString("SAY_110247_8") ,5) --/*�������K�K�å�K�K
	SetStopAttack( OGD )
	SetPosture( OGD, 8 , ruFUSION_ACTORSTATE_DYING );
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_100178_0") ,5) --/*��I�ϰϤۼv�A�ڦ��N�ǳƹ�I�A����k�F�C
	CastSpell( OwnerID() ,OGD ,490111 )
	sleep( 30 )
	yell( OwnerID() , GetString("SAY_100178_1") ,5) --/*�ݨӾi���ƥ��ǳƪ��ߺD�A���T�i�H�קK�ܦh�·�......
	local COGD = LuaFunc_CreateObjByObj( 100274 , OGD ) --���ͫ��e���j�F
--	AddToPartition( COGD ,RoomID )
	Ver_Zone103_Trap[RoomID]["DRAMA"] = COGD 
	DelObj( OGD )
	MoveToFlagEnabled( COGD, false );
	SetPlot( COGD , "Dead" , "LuaQ_420280" , 40 )
	Beginplot( COGD ,"LuaB_OGD_AI_SYSYTEM" , 0 )
	yell( OwnerID()  , GetString("SAY_100178_2") , 5 ) --/*�h��I�L�̡C
	SetAttack( COGD , TargetID() )
	CastSpell( OwnerID()  , OwnerID() , 490111 ) --�H�U���h�|���^����
	sleep( 10 )		
	Show( DLS , RoomID )
	Delobj(OwnerID())	

end
----------------------------------------------------------------------------------------------------------
--�������j�F����
function LuaQ_420280()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100274,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckCompleteQuest( Player[i]  , 420280 ) ~= true and CheckCompleteQuest( Player[i] , 420279 ) == true and CountBodyItem( Player[i] , 200735) == 0 then
			GiveBodyItem( Player[i]  ,200735 , 1 )
		end 
	end
end
----------------------------------------------------------------------------------------------------------