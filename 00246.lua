function LuaS_HuiTest_fInit()
	
	SetSpeakDetail( OwnerID(), GetString( "LUAS_TESTSTRING2" ) );  --	�оǤ���1
	--AddSpeakOption( OwnerID(), TargetID(), "Let game begin!!" , "LuaS_HuiTest_GameBegin",0 )--�W�[�@�ӿﶵ�A�оǤ���1
	--AddSpeakOption( OwnerID(), TargetID(), "S1" , "LuaS_HuiTest_GameBegin",0 )--�W�[�@�ӿﶵ�A�оǤ���1


end

-----------------------------------------------------------------------------------------------------------
function LuaS_HuiTest_GameBegin()

	-- �]�w NPC ����A���, ����b������
	-- LockNPC( TargetID(), 1 );  -- ��� NPC, 
	--BeginPlot( TargetID(), "LuaQ_HuiTest_StartFire", 0 );	

	local a = xasfasdf();
end

------------------------------------------------------------------------------------------------------------
function LuaQ_HuiTest_StartFire()

	-- �b�@�������C�����ͤ@�Ӥ�, ��P�ɲֿn�줭�Ӥ�. �K����
	-- �� 780040 �X�l����m���ͤ�
	-- OwnerID() NPC
	-- TargetID() Player

	local 	tickCount 	= 0;
	local	objCollect	= {};

	Say( OwnerID(), "Let game begin!" );

	-- �ˬd���W���L����θ˺���������
		--local	WaterCount	= CountBodyItem( TargetID(), 201034 ) + CountBodyItem( TargetID(), 201035 );
		
		--if( WaterCount == 0 ) then			
		--	GiveBodyItem( TargetID(), 201034, 1 );
		--end
	

	while 1 do

		-- ���ͤ�	
			local RandFlag 	= Rand( 8 );				
			local ObjID	= CreateObjByFlag( 110007, 780040, RandFlag, 1 );



			AddToPartition( ObjID, 0 );
			SetPlot( ObjID, "Touch", "LuaQ_Touch_Fire", 40 );
			LockObj( ObjID, 1, TargetID() );
			Say( OwnerID(), "�M ( �������V�n )" );
			
			objCollect[ tickCount ] = ObjID;
			tickCount = tickCount + 1;				

			

		-- ���
			if( tickCount == 1 ) then
				Say( OwnerID(), "��! �_���F, �h������������h�������Ǥ�!" );
			end	

		
		Sleep( 50 );

		-- �ˬd�ٳѴX����
			local AliveCount 	= 0;
			for i=0, ( tickCount -1 ), 1 do


				local ObjID 		= objCollect[ i ];

				if( ObjID ~= nil and CheckID( ObjID ) == true ) then
					AliveCount = AliveCount + 1;
				end					
			end

			if( AliveCount == 3 ) then
				Say( OwnerID(), "���V�ӶV�j�F! �A�쩳�椣��r!" );
			end

			if( AliveCount >= 5 ) then
				Say( OwnerID(), "�A���ŤF!" );
				break;	-- ���}�j��			
			end

		


		if( tickCount == 13 ) then
			Say( OwnerID(), "�A���\�F! �u�����۫H!" );
			break;
		end
	end

	for i=0, ( tickCount -1 ), 1 do

		local ObjID 		= objCollect[ i ];

		if( ObjID ~= nil and CheckID( ObjID ) == true ) then			
			--DelObj( ObjID );
		end

	end

	-- �ˬd���a�O���O�٦b, ���ˬd DBID í�X

	-- �^������

	local	WaterCount 	= 0;

	WaterCount		= CountBodyItem( TargetID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201034, WaterCount );
	end

	WaterCount		= CountBodyItem( TargetID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201035, WaterCount );
	end	
	
end
------------------------------------------------------------------------------------------------------------
function LuaQ_Touch_Fire()

	WaterCount		= CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( OwnerID(), 201035, WaterCount );
		--Say( TargetID(), "��..�ڳQ�A�˷��F" );
		ScriptMessage( TargetID(), 0, 0, "���V�����F", 0 );
		DelObj( TargetID() );
	else
		ScriptMessage( TargetID(), OwnerID(), 1, "�A���W�䤣��ຶ�������F��!", 0 );
	end

end
------------------------------------------------------------------------------------------------------------
function LuaQ_Init_Water()

	SetPlot( OwnerID(), "touch", "LuaQ_Touch_WaterPool", 40 );

end
------------------------------------------------------------------------------------------------------------
function LuaQ_Touch_WaterPool()

	-- �^������

	local	WaterCount 	= 0;
	
	-- �ˬd�Ū�����
	--WaterCount		= CountBodyItem( OwnerID(), 201034 );
	--if( WaterCount ~= 0 ) then			
	--	DelBodyItem( OwnerID(), 201034, WaterCount );
	--else
	--	ScriptMessage( TargetID(), OwnerID(), 1, "�A�S���ˤ����e��", 0 );
	--	return;
	--end

	-- �ˬd��������
	WaterCount		= CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then
		return;
		--DelBodyItem( OwnerID(), 201035, WaterCount );
	end
	
	-- �����˺���������

		GiveBodyItem( OwnerID(), 201035, 1 );	
end