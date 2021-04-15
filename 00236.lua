function LuaS_110171_0()
	-- ���[�J�P�_�O�_�O�M�᪺�y�k
	if CheckAcceptQuest( OwnerID() , 420216 ) == true and CountBodyItem(OwnerID() , 200668) == 0 then
		SetSpeakDetail( OwnerID(), GetString( "ST_110171_0" ) );
	  	--/*�A�O�����ШӨ�U�ڭ̷������ܡH�����}�l�_����A����䪺���������A�M����x����Y�W�C
	  	--/*�ʧ@�@�w�n�֡A�_�h���|�����}�ӡC

          		--/*�ǳƦn�F�ܡH

		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110171_1") , "LuaS_110171_1",0 )--/*�ǳƦn�F
	else
		SetSpeakDetail( OwnerID(), GetString( "ST_110171_1" ) );
	  	--/*�ܩ�p�A�ڪ��d���O�ݦu�o�Ӧa��A�����@��H�H�N�i�X�A�Ц^�a�I		
	end
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110171_2") , "LuaS_110171_2",0 )--/*�������

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_1()

	CloseSpeak( OwnerID() );	--������ܵ���	
	GiveBodyItem( OwnerID() , 201034 , 1 ) --���������~
	--�N���a�ǰe�i�J����
	SetPlot( TargetID() , "touch" , "LuaS_110171_3", 40 )
	BeginPlot( TargetID(), "LuaQ_420216", 0 );	

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_2()

	CloseSpeak( OwnerID() );	--������ܵ���

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_3()

	Say( TargetID() , GetString("SAY_110171") ) --/*�Ф��n�b����������[�C

end
-----------------------------------------------------------------------------------------------------------
function LuaQ_420216()

	-- �b�@�������C�����ͤ@�Ӥ�, ��P�ɲֿn�줭�Ӥ�. �K����
	-- �� 780040 �X�l����m���ͤ�
	-- OwnerID() NPC
	-- TargetID() Player

	local 	tickCount 	= 0;
	local	objCollect	= {};
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 

	Say( OwnerID(), "Let game begin!" );
	sleep(60)

	while 1 do

		-- ���ͤ�	
			local RandFlag 	= Rand( 8 );				
			local ObjID	= CreateObjByFlag( 110007, 780040, RandFlag, 1 );

			AddToPartition( ObjID, 0 );
			SetPlot( ObjID, "Touch", "LuaQ_420216_Fire", 40 );
			Say( ObjID, "�M ( �������V�n )" );
			
			objCollect[ tickCount ] = ObjID;
			tickCount = tickCount + 1;				

			

		-- ���
			if( tickCount == 1 ) then
				Say( OwnerID(), "��! �_���F, �h������������h�������Ǥ�!" );
			end	

		
		Sleep( 60 );

		-- �ˬd�ٳѴX����
			local AliveCount 	= 0;
			for i=0, ( tickCount -1 ), 1 do

				local ObjID = objCollect[ i ];

				if( ObjID ~= nil and CheckID( ObjID ) == true ) then
					AliveCount = AliveCount + 1;
				end					
			end

			if( AliveCount == 3 ) then
				Say( OwnerID(), "���V�ӶV�j�F! �A�쩳�椣��r!" );
			end

			if( AliveCount >= 5 ) then
				-- �ˬd���a�O���O�٦b, ���ˬd DBID �k�X
				if  Luafunc_Player_Alive( TargetID(),DBID,100 ) == true  then
					Say( OwnerID(), "���ȥ���!" );
					--�N���a�Ǧ^�h
				end
				sleep( 50 )
				SetPlot( OwnerID() , "Touch" , "" , 0 ) 
				break;	-- ���}�j��			
			end

			if( tickCount == 10 ) then
				Say( OwnerID(), "�A���\�F! �u�����۫H!" );
				local FireSpr = CreateObjByFlag( 100084 , 780040 , rand(8) , 1 )
				AddToPartition( FireSpr , 0 )
				BeginPlot( FireSpr , "LuaQ_420216_CHECK" , 0 )
				SetAttack( FireSpr , TargetID() )
				break;
			end
	end

	-- �M���Ҧ����۪���
	for i=0, ( tickCount -1 ), 1 do
	 	local ObjID = objCollect[ i ];

		if( ObjID ~= nil and CheckID( ObjID ) == true ) then			
			DelObj( ObjID );
		end

	end

	-- �^������

	local WaterCount = 0;

	WaterCount = CountBodyItem( TargetID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201034, WaterCount );
	end

	WaterCount = CountBodyItem( TargetID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201035, WaterCount );
	end	
	
end
------------------------------------------------------------------------------------------------------------
function LuaQ_420216_Fire()

	local WaterCount = CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then
		SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40 ) 	
		sleep( 5 )		
		DelBodyItem( OwnerID(), 201035, WaterCount );
		GiveBodyItem( OwnerID(), 201034, 1 );
		Say( TargetID(), "��..�ڳQ�A�˷��F" );
		--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_1"), 0 )--/*�A���\�����F���C
		DelObj( TargetID() );
	else
		--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_2"), 0 );
		--/*�A���W�䤣��ຶ�������F��!
		Say( TargetID(), "�A���W�䤣��ຶ�������F��!" );
	end

end
------------------------------------------------------------------------------------------------------------
function LuaI_420216_Water()

	SetPlot( OwnerID(), "touch", "LuaQ_420216_WaterPool", 40 );

end
------------------------------------------------------------------------------------------------------------
function LuaQ_420216_WaterPool()

	-- �^������

	local	WaterCount = 0;
	SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40 ) 
	sleep( 5 )
	-- �ˬd�Ū�����
	WaterCount = CountBodyItem( OwnerID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( OwnerID(), 201034, WaterCount );

		-- �����˺���������
		GiveBodyItem( OwnerID(), 201035, 1 );	
	else
		-- �ˬd��������
		WaterCount = CountBodyItem( OwnerID(), 201035 );
		if( WaterCount ~= 0 ) then
			--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_3"), 0 );
			--/*�A�S���h���e���i�H�ˤ�
			Say( TargetID() , "�A�S���h���e���i�H�ˤ��C")
		else
			--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_4"), 0 );
			--/*�A���s���F�@�Ӥ���C
			Say( TargetID() , "�A���s���F�@�Ӥ���C")
			GiveBodyItem( OwnerID(), 201034, 1 );
			WaterCount = CountBodyItem( OwnerID(), 201034 );
		end

	end
	SetPlot( TargetID(), "touch", "LuaQ_420216_WaterPool", 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420216_CHECK()
	
	SetPlot( OwnerID() , "Dead" , "LuaI_100084_D" , 40 )
	Sleep(200)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- �����ˬd�@��	
		else
			local Bill = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110171 , 300 )
			SetPlot( Bill[0] , "touch" , "" , 0 )
			DelObj( OwnerID() )
			break	
		end
	sleep(1)
	end

end
-------------------------------------------------------------------------------------------------------------
function LuaI_100084_D()
	
	local Bill = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110171 , 300 )
	if  ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer)  then
		Say( OwnerID() ,"Clear!")
			--�N���a�Ǧ^�h
	end
	SetPlot( Bill[0] , "touch" , "" , 0 )

end