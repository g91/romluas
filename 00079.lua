function TEST_Dindin_01( )
	-- OwnerID()	�O�@�� NPC
	-- TargetID()	������Ȫ����a�ζ���

	-- FlagID		���|�X�l�s�եN�X
	-- Flag			���|�X�l�N�X

 	local FlagID	= 3;
	local FlagCount = GetMoveFlagCount ( FlagID ) - 1;

	Say( OwnerID(), "Flag Count:" .. FlagCount );

	local Flag		= 0;

	while 1 do

		-- DEBUG ��
		--local Owner = Role:new( OwnerID() ) 
		--Say( OwnerID(), "X: " .. Owner:X() .. ", Y:" .. Owner:Z()   );

		if( NPC_MoveToFlag( OwnerID() ,FlagID , Flag , 0 ) == true ) then
			
			-- ���ե�
			Say( OwnerID(), "�H�H�H��ڨ���X�l" .. Flag .. "�F");

			-- ��F�ĤT�ںX�l
			if( Flag == 2 ) then
				
				Say( OwnerID(), "�o�O�ĤT�ںX�l�A�ڼF�`�a�I�I" );
				sleep( 30 );
								
				-- �l��Ǫ� ( �� 100002 )
				--local ObjID;

				--ObjID = S_CreateNPC( 100002, 0, 2, 1, 0 );					
				-- ��t�@���M����
				--Say( ObjID, "�A���w�F, �ݧڱ��F�A!!" );
			
				-- ���ܩǪ��������覡 ( ������ )
				-- SetNPCGroup( ObjID, 1 );
				--sleep( 20 );
				
			end

			-- �ˬd�O���O����I�F
			if( Flag == 4 ) then

				-- ���ȧ���
				Say( OwnerID(), "�o�O��" .. Flag .. "�ںX�l�A�n������O�n�����~�~��L���ȡI" );

				-- �������~�T��
				S_GiveItem( 200033, 1 );
				
				sleep( 20 );
				
				-- �R������ NPC 
				Say( OwnerID(), "���ȵ����F�A���@�������Ӥ@�M�I" );	-- DEBUG
				S_ResetObj(  OwnerID() );

				break;
			end

			Flag = Flag+1;

		end

		sleep( 1 );

	end
end