function LuaI_110363()	--�j�Ѫ��_�c��l�@��
	SetPlot( OwnerID() , "touch" , "LuaS_110363_1" , 30 );
end

function LuaS_110363_1()
	local result = ""

	if ( CheckAcceptQuest( OwnerID() , 420360 ) == true and CheckAcceptQuest( OwnerID() , 420361 ) == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_02") , 0 )	-- ���Y�a�F�A�A�����}�o�ӽc�l�C
	elseif ( CheckAcceptQuest( OwnerID() , 420361 ) == true and CheckAcceptQuest( OwnerID() , 420362 ) == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_03") , 0 )	-- �A���ӭn��U���_�ͥ浹���L���C
	elseif ( CheckAcceptQuest( OwnerID() , 420362 ) == true and CountBodyItem( OwnerID() , 200945 ) >= 1 ) then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_07") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- �A���}�F�j�Ѫ��_�c�A�q�c�l�̶]�X�@�ΪF��I
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]"  , 0 );
			return
		end
		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_04") , 0 )
			DelBodyItem ( OwnerID() , 200945, 1 )		-- �U���_��
			local MoneySlime = LuaFunc_CreateObjByObj ( 100442 , TargetID() )
			SetAttack( MoneySlime , OwnerID() )
			while true do
				if ReadRoleValue( MoneySlime , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MoneySlime ) == true then  --�ˬd�O�_���}�԰�
				else
					if CheckID( MoneySlime ) == true then
						DelObj( MoneySlime )
					end
					break		
				end
			Sleep( 60 )	-- �����ˬd�@��	
			end
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_01") , 0 )	-- �A�ݨ��@�ӥj�Ѫ��c�l�C
	end
end