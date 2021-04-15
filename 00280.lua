function LuaI_110749()
	SetPlot( OwnerID(), "touch", "LuaQ_110749", 25)
end
--------------------------------------------------------------------------------------------------------------
function LuaQ_110749()
	local result = ""

	if CountBodyItem ( OwnerID() , 200903 ) >= 1 then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_06") , 120 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then-- �ϥέ�������
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );

				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0 ) then -- ���\
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
				DelBodyItem ( OwnerID() , 200903 , 1 );
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_1") , 0 )	-- ���������̬�M���ͤF�����ӸH���I
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_2") , 0 )	-- �a�s���l��ı�첧�˯}�ߦӥX�I
				SetFlag( OwnerID() , 540802, 1 )
				BeginPlot(TargetID() , "LuaS_110749_Fight" , 0 )
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_3") , 0 )	-- �A�ݨ��@���a�s���s�Z�C
	end

end
--------------------------------------------------------------------------------------------------------------
function LuaS_110749_Fight()
	local n =0
	local O = OwnerID() 
	local T = TargetID() 

	Hide( O )
	local Dragon = LuaFunc_CreateObjByObj ( 100266 , O )
	SetPlot( Dragon ,"Dead" , "LuaS_110749_Dead" , 40 )
	SetAttack( Dragon , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- ���L�a�j��
			ScriptMessage( TargetID(), TargetID(), 0, "�L�a�j��", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "�X�k�j��", 0 )
		end
		if ReadRoleValue( Dragon , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Dragon ) == true then  --�ˬd�O�_���}�԰�
			sleep(600)	-- ���Q���ˬd�@��	
		else
			if CheckID( Dragon ) == true then
				DelObj( Dragon )
			end 
			sleep( 60 )
			break
		end
	sleep(1)
	end

	sleep( 300 )
	Show( O , 0 )
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110749_Dead()
	if CheckFlag( TargetID() , 540801 ) == false and CheckAcceptQuest(TargetID() , 420323 ) == true then
		SetFlag( TargetID() , 540801, 1 )
	end
end
--------------------------------------------------------------------------------------------------------------
--Owner���ۮy
--Function LuaI_110451()
--	SetPlot( OwnerID(), "touch", "LuaQ_110451_1", 40)	--�]�w�}�¥ۮyĲ�I�@��
--End
--------------------------------------------------------------------------------------------------------------
--Owner�����a
--Function LuaQ_110451_1()
--	if CheckAcceptQuest( OwnerID(), 420323) == true And CountBodyItem( OwnerID(),200903) >=1 then
--	DelBodyItem( OwnerID(), 200903, 1);
--	SetPlot( TargetID(), "touch", "LuaFunc_Obj_BUSY", 40);	
--	sleep(20);
--	--CastSpell( TargetID(), TargetID(), *�k�N�s��);	--�I��S��
--	sleep(30);
--	BeginPlot( TargetID() , "LuaQ_110451_2",30);
--	end
--End
--------------------------------------------------------------------------------------------------------------
--Owner���ۮy
--Function LuaQ_110451_2()

--	local Dragon = LuaFunc_SearchNPCbyOrgID( OwnerID() ,110160 ,300 );	--�q�ۮy����m�M���s
--	sleep(30);
--	Hide (Dragon);	--���èI���s
--	sleep(30);
--	local Dragon_2 = LuaFunc_Createobjbyobj( 100266, Dragon, 1);	--�q�I�Τ��s����m���ͦu�@�a�s
--	SetAttack( Dragon_2, TargetID() );
--	BeginPlot( Dragon_2, "LuaQ_110451_Suicide", 0); 

--	While 1 do
--		if CheckID(Dragon_2) == false then	--�Y�O�u�@�a�s�w����
--			break	--���X�j��
--		end
--		sleep( 20 );	--�j���ˬd���j�ɶ�
--	end
	
--	sleep(120);	--�����
--	Show( Dragon, 0)	--��ܨI�Τ��s
--	sleep(10);
--	SetPlot( OwnerID(), "touch", "LuaQ_110451_1", 40)
--End
-------------------------------------------------------------------------------------------------------------
--Owner���ۮy
--Function LuaQ_110451_Suicide()
--	LuaFunc_Obj_Suicide( 300 );	--�����u�@�a�s�O�_�s�b���A��
--End
