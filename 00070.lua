function TEST_Quest420025( )
	-- OwnerID()	�O�@�� NPC
	-- TargetID()	������Ȫ����a�ζ���

	-- FlagID		���|�X�l�s�եN��
	-- Flag			���|�X�l�N��

 	local FlagID	= 0;
	local FlagCount = GetMoveFlagCount ( FlagID ) - 1;

	Say( OwnerID(), "Flag Count:" .. FlagCount );

	SetRoleCamp( OwnerID(), "Guard" );
	SetFightMode( OwnerID(), 1, 1, 0, 1 );

	local Flag		= 0;

	while 1 do

		-- DEBUG ��
		local Owner = Role:new( OwnerID() ) 
		Say( OwnerID(), "X: " .. Owner:X() .. ", Y:" .. Owner:Z()   );

		if( NPC_MoveToFlag( OwnerID() ,FlagID , Flag , 0 ) == true ) then
			
			-- ���ե�
			Say( OwnerID(), "��F�X�l: " .. Flag );

			-- ��F�ƥ��I 1
			if( Flag == 2 ) then
				
				Say( OwnerID(), "�ڨ�F�F�ƥ��I�F, ���� 1��" );
				sleep( 10 );

				--PlayMotion( OwnerID(), "unarmed_attack01" );


								
				-- �l��Ǫ� ( �� 100002 )
				local ObjID = S_CreateNPC( 100002, 1, 0, 0, 2 );
					
				-- ��t�@���M����
				Say( ObjID, "�A���w�F, �ݧڱ��F�A!!" );

				sleep( 100 );

				-- ���ܩǪ��������覡 ( ������ )
				-- SetNPCGroup( ObjID, 1 );
				--sleep( 1000 );
				
			end

			-- �ˬd�O���O����I�F
			if( Flag == 3 ) then

				

				-- ���ȧ���
				Say( OwnerID(), "End:" .. Flag );

				-- �������~
				--GiveBodyItem( TargetID(), 540001, 1 );
				--S_GiveItem( 540030, 1 );
				--S_GiveItem( 200033, 1 );
				
				sleep( 20 );
				
				-- �R������ NPC 
				Say( OwnerID(), "���m" );	-- DEBUG
				S_ResetObj(  OwnerID() );

				break;
			end

			Flag = Flag+1;

		end

		sleep( 1 );

	end
end