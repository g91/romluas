function LuaI_420592()	--�]�O������l�@��
	CastSpell( OwnerID(),OwnerID(),490100)  -- �X�ͫ����ۤv�W�S���]�k
	SetPlot( OwnerID() , "touch" , "LuaI_420592_01" , 40 );

end
function LuaI_420592_01()

	local resultZ = "";

	if CountBodyItem( OwnerID() , 201251 ) == 1 then			--/* �P�_�O�_���j�Ť�
		if CountBodyItem( OwnerID() , 201249 ) >= 5 then  --/* �P�_�O�_�������ʦL���ͩީ����]�k���y
			if BeginCastBar( OwnerID(), GetString("EM_420592_0") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );

					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- ���\
							resultZ = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- ����
							resultZ = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end
			end
			if ( resultZ == "OKOK" ) then
				DelBodyItem ( OwnerID() , 201249 , 5 )		--/* �R�������ʦL���ͩީ����]�k���y
				DelBodyItem ( OwnerID() , 201251 , 1 )		--/* �R���j�Ť�
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_201251_1") , 0 )	--�A�l��F�ީ������`�F�I�I�I
				local Obj = Role:new( OwnerID() ) 
				local BaseX = Obj :X()
				local BaseY = Obj :Y();
				local BaseZ = Obj :Z();
				local BaseDir = Obj:Dir();
				local kk = CreateObj(100366, BaseX, BaseY, BaseZ, BaseDir -180, 1 )	
				AddToPartition( kk , 0 )
				SetAttack( kk , TargetID())
				sleep(60)
				LuaFunc_Obj_Suicide(50)
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_201251_2") , 0 )	--�L�k�l��A�A�S���������l�ꪫ�~�I
		end
	end
end