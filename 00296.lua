--Quest 420274 ���ȧ����@�� 
--function LuaQ_420274_Complete()

--	local FLAG = 780029
--	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
--	MoveToFlagEnabled( OwnerID(), false );
--	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing", 10 )
--	LuaFunc_MoveToFlag( OwnerID() ,FLAG, 1 , 0 )
--	Say( OwnerID() , GetString("SAY_110242_0") ) --/*�ݬݳo�Ӭ��R���j�N�x�M��ڡI�o�򧹾㪺�O�d�U�ӬO�j�۵M������C
--	sleep( 30 )
--	Say( OwnerID() , GetString("SAY_110242_1") ) --/*�ӥB�K���h�áK�o���p�ߨe�٬��ۡK�K
--	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
--	sleep( 50 )
--	--ScriptMessage( OwnerID(), TargetID(), 0, GetString("SAY_110242_2"), 0 );
--	Say( OwnerID() , GetString("SAY_110242_2") ) --/*���F�I�N�b�o��I�I
--	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
--	sleep( 30 )
--	Say( OwnerID() , GetString("SAY_110242_3") ) --/*��ӭn�Τ����I�o�ӧU�U�ڡK�o�F�褣���o��A���L�N�O�·СC
--	LuaFunc_MoveToFlag( OwnerID() ,FLAG, 0 , 0 )
--	sleep( 30 )
--	SetPlot( OwnerID() , "touch" , "", 0 )
--	MoveToFlagEnabled( OwnerID(), true );	

--end
----------------------------------------------------------------------------------------------------------
--Quest 420275 ���ȧ����@��
function LuaQ_420275_Complete()

	local n =0

		--MoveToFlagEnabled( OwnerID(), false )
		--WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
		--LuaFunc_MoveToFlag( OwnerID(), 780029 , 1 , 0 )
	SetPosByFlag( OwnerID(), 780029 , 1 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing", 10 )
	local Fire       = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110751 , 50 , 1);	--say ( OwnerID() , Fire[0])
	local IceWall = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110750 , 50 , 1);	--say ( OwnerID() , IceWall[0] )
	local Wolf     = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110040 , 100 , 1);	--say ( OwnerID() , Wolf[0] )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	sleep( 50 )
	PlayMotion( Fire[0] , ruFUSION_ACTORSTATE_NORMAL )
	sleep( 20 )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep( 50 )
	Say( OwnerID() , GetString("SAY_110242_4") ) --/*�Ӧn�F�I�B�����\�a�ĤƤF�C
	Hide( IceWall[0] )
	SetPosByFlag( OwnerID(), 780029 , 0 )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110242_5") )	-- �z�ڰڰڡI�j�N���T�~�M���F�L�ӡI
	SetFlag( TargetID() , 540803 , 1 )
	PlayMotion( Fire[0] , ruFUSION_ACTORSTATE_DEAD )
	Hide( Wolf[0] )
	local BigWolf = LuaFunc_CreateObjByObj ( 100277 , Wolf[0] )
	SetPlot( BigWolf , "Dead" , "LuaQ_420275_Dead" , 10 )
	 SetAttack( BigWolf , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- ���L�a�j��
			ScriptMessage( TargetID(), TargetID(), 0, "�L�a�j��", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "�X�k�j��", 0 )
		end
		if ReadRoleValue( BigWolf , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( BigWolf ) == true then  --�ˬd�O�_���}�԰�
			sleep(600)	-- ���Q���ˬd�@��	
		else
			if CheckID( BigWolf ) == true then
				DelObj( BigWolf )
			end 
			sleep( 1 )
			break
		end
	sleep(1)
	end

		--WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
		--LuaFunc_MoveToFlag( OwnerID() , 780029, 0 , 0 )
		--MoveToFlagEnabled( OwnerID(), true );
	sleep( 30 )
	SetPlot( OwnerID() , "touch" , "", 0 )
	Show( Wolf[0] , 0 )
	Sleep( 5 )
	Show( IceWall[0] , 0 )

end
---------------------------------------------------------------------------------------------------------
function LuaI_110242()
	SetPlot( OwnerID() , "touch" , "", 0 )
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420275_Sui()
	LuaFunc_Obj_Suicide(600)
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420275_Dead()

	if CheckID(TargetID()) == true and CheckFlag( TargetID() , 540803 ) == true then
		GiveBodyItem(TargetID(),200733 , 1)
		SetFlag( TargetID() , 540803 , 0 )
	end

end
--------------------------------------------------------------------------------------------------------
--�x�M���Y�`Ĳ�o���ȼ@��