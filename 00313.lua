function Hsiang_PlotDialogChangeZoneList( )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "��ܤ@�Ӱϰ�ǰe" );
	DialogSelectStr( OwnerID() , "(1)�z�s�s�S" );
	DialogSelectStr( OwnerID() , "(2)�ȴ餧��" );
	DialogSelectStr( OwnerID() , "(3)���~���" );
	DialogSelectStr( OwnerID() , "(4)������ר�" );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	
	if SelectID == 0  then
		Hsiang_PlotDialogZone1Pos(  )	
	elseif SelectID == 1  then
		Hsiang_PlotDialogZone2Pos(  )
	elseif SelectID == 2  then
		Hsiang_PlotDialogZone3Pos(  )
	elseif SelectID == 3  then
		Hsiang_PlotDialogZone4Pos(  )
	else 
		-- �S��
	end

	DialogClose( OwnerID() )

end

function Hsiang_PlotDialogZone1Pos(  )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "�z�s�s�S ��Ӧa��ǰe");
	DialogSelectStr( OwnerID() , "(1) �X���I" );
	DialogSelectStr( OwnerID() , "(2) ù����" );
	DialogSelectStr( OwnerID() , "(3) �y�ۥC" );
	DialogSelectStr( OwnerID() , "(4) ??��} " );
	DialogSelectStr( OwnerID() , "(5) ��u����" );
	DialogSelectStr( OwnerID() , "(6) �^�W��" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--�X���I
		ChangeZone( OwnerID(), 1 , 0 , -4162 ,240  ,-8210 , 0 );
	elseif SelectID == 1  then
		--ù����
		ChangeZone( OwnerID(), 1 , 0 , -234 ,15  ,-6503 , 0 );
	elseif SelectID == 2  then
		--�y�ۥC
		ChangeZone( OwnerID(), 1 , 0 ,-2202,130,-4267 , 0 );
	elseif SelectID == 3  then
		--�\��}
		ChangeZone( OwnerID(), 1 , 0 , -3877,15,-6004 , 0 );
	elseif SelectID == 4  then
		--��u���� 
		ChangeZone( OwnerID(), 1 , 0 , 877,32,-5215 , 0 );
	elseif SelectID == 5 then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	else 
	end


end
function Hsiang_PlotDialogZone2Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "�z�s�s�S ��Ӧa��ǰe");
	DialogSelectStr( OwnerID() , "(1)�J�f" );
	DialogSelectStr( OwnerID() , "(2)�^�W��" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--�X���I
		ChangeZone( OwnerID(), 2 , 0 , -1 , 4 , -1292 , 0 );
	elseif SelectID == 1 then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	else 
	end

end
function Hsiang_PlotDialogZone3Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "���~��� ��Ӧa��ǰe");
	DialogSelectStr( OwnerID() , "(1)�^�W��" );
	DialogSelectStr( OwnerID() , "(2)�^�W��" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	elseif SelectID == 1 then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	else 
	end	
end
function Hsiang_PlotDialogZone4Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "������ר� ��Ӧa��ǰe");
	DialogSelectStr( OwnerID() , "(1)�^�W��" );
	DialogSelectStr( OwnerID() , "(2)�^�W��" );



	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	elseif SelectID == 1 then
		--�^�W��
		Hsiang_PlotDialogChangeZoneList();
	else 
	end
end