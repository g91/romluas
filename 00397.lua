---------------------------�����]�k�}��l�@��
function LuaI_110091()	--�����]�k�}��l�@��

	--CastSpell( OwnerID() , OwnerID() , 490101)	-- �X�ͫ����ۤv�W�S���]�k
	SetPlot( OwnerID() , "touch" , "LuaI_110091_A" , 40 );

end

function LuaI_110091_A()

	local result = "";
	local resultM = "";
	local resultX = "";

	if CheckFlag( OwnerID()  , 540778 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_1") , 0 );	--�A�w�g�ʦL�F�]�k�}�I
	else
		if CheckAcceptQuest( OwnerID() , 420481) == true then
			if CountBodyItem( OwnerID() , 201190 ) >= 1 then
				if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_01") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );	-- �e�U���ۤW���Ť�лx
					return
				end
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );

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
					DelBodyItem ( OwnerID() , 201190 , 1 );
					GiveBodyItem ( OwnerID() , 201191 , 1 );
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_2") , 0 )		--�A�e�U�F���ۤW���Ť�лx�I
				end
			elseif CountBodyItem( OwnerID() , 201191 ) == 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_3") , 0 )		--�A�w�g�e�U���ۤW���Ť�лx�F�I
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_4") , 0 )		--�A�S���ťժ����b�i�H�e�U�Ť�лx�I
			end
		elseif CheckAcceptQuest( OwnerID() , 420479) == true then
			if CountBodyItem( OwnerID() , 201192 ) == 0 then		--/* �P�_�O�_�������T��	--/* �P�_�O�_���]������
				if CountBodyItem( OwnerID() , 201189 ) >= 10 then
					if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_02") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- �l���]��
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
						return
					end
					while 1 do
						sleep( 2 );
						local CastBarStatus = CheckCastBar( OwnerID() );

						if ( CastBarStatus ~= 0 ) then 
							if ( CastBarStatus > 0) then -- ���\
								resultM = "OKOK"
								EndCastBar( OwnerID() , CastBarStatus )
								break;
							elseif ( CastBarStatus < 0 ) then -- ����
								resultM = "DAME"
								EndCastBar( OwnerID() , CastBarStatus )
								break;
							end
						end
					end
					if ( resultM == "OKOK" ) then
						DelBodyItem ( OwnerID() , 201189 , 10 )		--/* �R���^�~�����T��
						ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_5") , 0 )		--�A�}�ҤF�]�k�}�I�]���X�{�I�I�I

						local Obj = Role:new( OwnerID() ) 

						local BaseX = Obj :X()
						local BaseY = Obj :Y();
						local BaseZ = Obj :Z();
						local BaseDir = Obj:Dir();

						local Bear = CreateObj(100560, BaseX, BaseY, BaseZ, BaseDir+180, 1 )	
						AddToPartition( Bear , 0 )
						BeginPlot( Bear , "LuaS_100560_LivingTime" , 0 )
						SetAttack( Bear , OwnerID())
						sleep(60)
						--while 1 do
						--	if ReadRoleValue( Bear , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Bear ) == true then  --�ˬd�O�_���}�԰�
						--		sleep(60)	-- �����ˬd�@��
						--	else
						--		if CheckID( Bear ) == true and ReadRoleValue( Bear , EM_RoleValue_IsDead )  == 0 then
						--			DelObj( Bear )
						--		end 
						--	sleep( 300 )
						--	break
						--	end
						--sleep(1)
						--end
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_6") , 0 )	--�L�k�}���]�k�}�A�A�S���������T�ߡI
				end
			end
		elseif CheckAcceptQuest( OwnerID() , 420480) == true then
			if  CountBodyItem( OwnerID() , 201193 ) == 1 then
				if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_03")  , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- �ʦL�]�k�}
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
					return
				end
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );

					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- ���\
							resultX = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- ����
							resultX = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end

				if ( resultX == "OKOK" ) then
					SetFlag( OwnerID()  , 540778 , 1 );
					DelBodyItem ( OwnerID() , 201193, 1 )	;
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_7") , 0 )	--�A�ϥ��]������ʦL�F�]�k�}�I
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_8") , 0 )	--�A�S���]������i�H�ʦL�]�k�}�I
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_9") , 0 )	--�S������Ƶo�͡I
		end
	end
end

function LuaS_110062()
	if CheckAcceptQuest( OwnerID(), 420480) == true and CheckFlag( OwnerID()  , 540778 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110091_10") )	--�Ӹ`�ڤw�gť�d�A�R���F�A�ڷQ�ЧA�Ȯɫ��U��L���ȡA�H�ʦL�y�ۥC���l���]�k�}�o�@��Ƭ��u���I
	else
		LoadQuestOption( OwnerID() );  --���J���ȼҪO
	end
end

function LuaS_100560_LivingTime()
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj( OwnerID() )
			break;
		end
		Sleep( 20 )
	end
end

