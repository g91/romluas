-- 2013.03.14 ���E�G6.0.0 �t�X�f����X���s���g
function Lua_mika_losttreasurebox_01() -- �j���_�c(113617) ���󲣥ͫ���檺Ĳ�IĲ��
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Lua_mika_losttreasurebox_03() -- �B�A�_�c(113618) ���󲣥ͫ���檺Ĳ�IĲ��
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Lua_mika_losttreasurebox_05() -- �����_�c(113619) ���󲣥ͫ���檺Ĳ�IĲ��
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Hao_Zone355_Chest_1()

	local Player = OwnerID()	-- ���a
	local Chest = TargetID()	-- �_�c
	local Play_dead = 505297	-- ����Buff
	local CastTime = 50
	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- Ū����Ʈw�]�w������ID

	if CheckBuff( Player , Play_dead ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( Player , Player , 0 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )
	else
		if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , CastTime , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_Zone355_Chest_2" ) ~= 1 then
			ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--�ؼХ��b���L��
			return
		end
	end
end

function Hao_Zone355_Chest_2( Player , CheckStatus )	-- ���ʰƥ� - �j�N���_ �j���_�c�@���B����̡B���浲�G(�j��0�O���\�A�p��0�O����)

	local Chest = TargetID()	-- �_�c
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )	-- Ū�����a����
	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- Ū����Ʈw�]�w������ID
	local Treasure = { [113617] = 725010 , [113618] = 725051 , [113619] = 725013 }	-- �j���_�c(113617)�B �B�A�_�c(113618)�B�����_�c(113619)
	if CheckStatus ~= 0 then	-- �p�G���I�k����
		if CheckStatus > 0 then	-- �I�k���\
			if EmptyPacketCount(Player) >= 2 and QueuePacketCount(Player) == 0 then --�ˬd�I�]���
				PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --�_�c���򼽩�145�B146
				-- 6.0.1 �s�W�S����y�P�_���� -----------------------------
				if PlayerLv >= 61 and CheckFlag(Player, 548091 ) == True then
					Setflag(Player, 548091, 0 )  -- �M�Ŧ�key
					GiveBodyItem( Player , 203487 , 1 )   -- �]���_����q1�I�C
					ScriptMessage( Player , Player , 1 , "[SC_LOSTTREASURE_SECRET]" , C_SYSTEM ) -- �F���S��q������A��o[203487]1�ӡC
					ScriptMessage( Player , Player , 0 , "[SC_LOSTTREASURE_SECRET]" , C_SYSTEM ) -- �F���S��q������A��o[203487]1�ӡC
				end
				GiveBodyItem( Player , Treasure[OrgID] , 1 )
				if PlayerLv >= 50 and Lua_Hao_Return_Buff_Lv( Player , 505590 ) == 1 then	-- ���a����>=50�šB�H�Ϊ��a�����������L�����Ŷꨩ��
					Hao_Monetary_Union_240181(Player , 30)
					AddBuff( Player , 505590 , 0 , -1 )	-- �Q�Φ�Buff���|���覡�A�קK���a���ƻ�������D
				end
				if OrgID == 113619 then
					DW_QietKillOne( Player , 106279 )	-- �����ٸ��t�� - �C����� �}�ҵ����_�c*5
				end
				SetPlot( Chest , "touch" , "" , 10 )
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
			EndCastBar( Player , CheckStatus )
		else	-- �I�k����
			EndCastBar( Player , CheckStatus )
		end
	end
end
----------2013.03.14 ���E�A�H�W��������X����
--�۪�
Function Lua_mika_losttreasurebox_08()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_25]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

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

				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
						GiveBodyItem( OwnerID() ,206422 , 1 ) --�}�H�۪�
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						SetPlot( TargetID(),"touch","Lua_mika_losttreasurebox_08",10 )
					end	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasurebox_08",10 )
			end
		end
	end
end