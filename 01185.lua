---�ۭt�p��

function LuaS_421708()

	if CheckAcceptQuest(TargetID(),421708)==true then	

		local NPCA = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCA  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCA , TargetID() )

		local NPCB = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCB  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCB , TargetID() )

		local NPCC = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCC  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCC , TargetID() )

		local NPCD = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCD  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCD , TargetID() )

		local NPCE = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCE  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCE , TargetID() )

		local NPCF = LuaFunc_CreateObjByObj ( 101577 , OwnerID() )
		WriteRoleValue( NPCF  , EM_RoleValue_LiveTime , 60 )
		MoveToFlagEnabled ( OwnerID() , false )
		SetAttack( NPCF , TargetID() )
		return true
	end
end

---�ۭt�p�������Q�����

function LuaS_112192()

	LoadQuestOption( OwnerID() )

	if CheckCompleteQuest( OwnerID() , 421708) == true then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_112192]","LuaS_112192_1",0) --����Q�i���p���Q�����F�A�o�ݰ_�ӫܥͮ�I 
	end

	if (CheckAcceptQuest( OwnerID() , 421698) == true)and(CheckFlag( OwnerID() , 542353 )==false)and(CountBodyItem( OwnerID(), 203684 )<1)  then

		CancelBuff( OwnerID() , 502471 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421698]","LuaS_112192_2",0)--�ЦA���ڤ@���s�C 
	end		
end

function LuaS_112192_1()

	SetSpeakDetail(OwnerID(),"[SC_112192_1]") --�O�A�ܡH�����ھi���p�����H�H�]����Q����ۧA�C�^���O�̦n�A�n�O���ڪ��D�O�ַF���n�ơA�@�w�~��L�ݨ��W�ҡI		
end

function LuaS_112192_2()

	SetSpeakDetail(OwnerID(),"[SC_421698_1]") --����H�I�A�S���b�ɶ�����s�e���ȤH�ܡH���|�O�ۤv���~������s�ܱ��F�a�H�n�a�A�ڦA���A�@���s�A�o���n�O�A�d�{�A�s���N�q�A���~��̦��I		
	GiveBodyItem( OwnerID(), 203684, 1 )
	AddBuff(OwnerID() , 502471 , 0 , 600 )  	
end

