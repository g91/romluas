---------------------------------------------------------------�]�K��B�q���@��---------------------------------------------------------------

function LuaYU_GDWAR_TOWER_01()--test

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951) then
	--	SetCursorType( TargetID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--���|���Ԯ�
	end
end

---------------------------------------------------------------�q���---------------------------------------------------------------

function LuaYU_GDWAR_TOWER_02_buff_01()--�ɹq�ޯ�

	local Player = OwnerID()
	local Tower = TargetID()
	SysCastSpellLv( Tower , Tower , 494667 , 0 )
--	CastSpelllv( TargetID() , TargetID() , 494667 , 0 )

end

---------------------------------------------------------------�t����---------------------------------------------------------------

function LuaYU_WarTowerRange_01()--�s�򲣥ͪk�N�A���b�t���𡰡�������

	AddBuff( OwnerID() ,505257,0, -1); --�t�����I�k

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--���|���Ԯ�
	end

end

function LuaYU_GDWAR_TOWER_juget_01()--�ˬd�D���a�h����

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )

	if ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_02()--�ˬd���a�O�Լv��h����  <��MP��>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --�P�_�ؼФ�¾�~

	if ( VOC == 1 ) or ( VOC == 2 ) or ( VOC == 3 ) then

		return false

	elseif ( IsPlayer ~= 1 ) then

		return false

	else
		return true
	end

end

function LuaYU_GDWAR_TOWER_juget_03()--�ˬd���a�D�Ԥh�h����  <��SP1��>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --�P�_�ؼФ�¾�~

	if ( VOC == 1 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_04()--�ˬd���a�D�C�L�h����  <��SP2��>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --�P�_�ؼФ�¾�~

	if ( VOC == 2 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_05()--�ˬd���a�D�v��̫h����  <��SP3��>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --�P�_�ؼФ�¾�~

	if ( VOC == 3 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_03_buff_01()--�t������ + �d��HMP�B�M�`...etc���@��

	AddBuff( OwnerID() ,505304,0, 2 ); --�V���I�k

	AddBuff( OwnerID() ,505305,0, 2 ); --�V���I�k

	AddBuff( OwnerID() ,505306,0, 2 ); --�V���I�k

	AddBuff( OwnerID() ,505307,0, 2 ); --�V���I�k

end

function LuaYU_GDWAR_TOWER_03_buff_02()--�t���� => �ۧڭ״_�}���Ұ�

--	Say(OwnerID(),"Hello2")

end

---------------------------------------------------------------�V���---------------------------------------------------------------

function LuaYU_WarTowerRange_02()--�s�򲣥ͪk�N�A���b�V��𡰡�������
-- 2013.07.31 ���E:�B���H�U 505263 �V���w�ɬI��@���A��� lua ��������
--	AddBuff( OwnerID() ,505263,0, -1); --�V���I�k
--
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--���|���Ԯ�
	end
end

function LuaYU_GDWAR_TOWER_04_buff()--test�V���
-- 2013.07.31 ���E:�B���H�U�򥻪k�N - 505260 �෽�V���@���A��� lua ��������
--	local OID = OwnerID()
--	AddGuildWarEnergy( OID , 10 )  --�W���q
end
-- 2013.07.31 ���E:�ץ����|����(Zone 402)���~ - �l��N�G�V���(206664)�A�l��X���V���(102481)�L�k�V����q�����D�C
function Hao_GuildWar_Crystal_Extraction_Gem(Player)	-- �V���

	local Tower = OwnerID()
	local Room = ReadRoleValue( Tower , EM_RoleValue_RoomID )
	
	while true do
		Sleep(100)
		local PlayerCamp = GetRoleCampID(Player)	-- ���o���a�}��
		local TowerCamp = GetRoleCampID(Tower)	-- ���o��}��
		if PlayerCamp ~= TowerCamp then	-- ��C�������a���s�b�ɡA���s�����Room���P�@�}�窺���a�A�ѷs����쪺���a���浹����q
			local CampList =  SetSearchAllPlayer(Room)
			local SearchPlayer
			for i =1 , CampList , 1 do
				SearchPlayer = GetSearchResult()
				if GetRoleCampID(SearchPlayer) == TowerCamp then	-- ��C�������a����
					Player = SearchPlayer	-- ���s�w�qPlayer
					PlayerCamp = GetRoleCampID(Player)	-- ���s�w�q���a�}��
				--	Say( Tower , "Reset Default" )
					break
				end
			end
		end
		if PlayerCamp ~= -1 then
			AddGuildWarEnergy( Player , 10 )  --�W�[��q
		end
	--	Say( Tower , "Player = "..Player.." , PlayerCamp = "..PlayerCamp.." , Tower Camp = "..TowerCamp.." , Engrgy = "..GetGuildWarEnergy(Player) )
	end
end
---------------------------------------------------------------�a�A��---------------------------------------------------------------
function LuaYU_WarTowerRange_03()--�s�򲣥ͪk�N�A���b�a�A�ߡ���������

	AddBuff( OwnerID() ,505264,0, -1); --�a�A�߬I�k

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--���|���Ԯ�
	end

end

---------------------------------------------------------------��ı��---------------------------------------------------------------
function LuaYU_WarTowerRange_04()--�s�򲣥ͪk�N�A���b��ı�衰��������

	AddBuff( OwnerID() ,505262,0, -1); --�t�����I�k

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--���|���Ԯ�
	end

end

function LuaYU_GDWAR_TOWER_juget_T5_01()--�ˬd�ӥؼгB��԰��Ҧ��h�����

	-- 2013.07.19 ���E�G�ץ����a�󤽷|���Գ�(Zone 402)�����ǨϥΪ��~ - �l��N�G��ı����(206665)�ɡA�C���ı�۹ҮĪG�o�ʮɡA�����W��|���X�r�� - ������ �����D�C
	local Target = TargetID()
	local Door = {
				111577 ,
				111601 ,
				111602 ,
				111603 ,
				112064 ,
				120878 ,
				120880 ,
				121241 ,
				121243 ,
				121246 ,
				121248 ,
				121251 ,
				121253 ,
				122263 ,
				122265 ,
				122268 ,
				122270 ,
				122273 ,
				122275
						}

	local IsAttack = ReadRoleValue( Target , EM_RoleValue_IsAttackMode  )	--�ӥؼгB��԰��Ҧ�
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )	--�ؼ�ID

	for ID = 1 , #Door , 1 do
		if OrgID == Door[ID] then
			return false
		end
	end

	if ( IsAttack == 0 ) then
		return true
	else
		return false
	end
end

--====================================================================================================================
function Yuyu_GW_witchgood_Setbomb_00( Option ) --�i���u--�ϥ�(�ˬd)�j

--Say(OwnerID(),"OwnerID_1")
--Say(TargetID(),"TargetID_1")

	local Distance = GetDistance( OwnerID(), TargetID() )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--���a�O�_�b����W
	local TargetPlayer =  CheckFlag( TargetID()  , 543769 )--�ؼЪ��a�O�_�b����W

	if ( Option == "CHECK" ) then
		if (ZoneID == 402) or (ZoneID == 951)  then

			if CheckBuff( TargetID() , 505783 ) == true then

				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_18]", 0 ) -- �ؼФw�Q�w�m�F
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_18]", 0 ) 
				return false
			elseif ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)~=1 then --�ؼЫD���a
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_60]", 0 ) -- �u��缾�a�ϥ�
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_60]", 0 ) 
				return false

			elseif (PlayerIsSit == true) then --���a�b����W
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- ����W�L�k�ϥ�
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
				return false

			elseif (TargetPlayer == true) then --���a�b����W
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_1]", 0 ) -- �ؼФ����T
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_1]", 0 ) 
				return false

			elseif Distance > 50  then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]", C_SYSTEM ) --�ؼйL���I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]", C_SYSTEM ) 
				return false	
			else

				if (OwnerID()) == (TargetID()) then
					BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_3" , 0 )  --�˦b�ۤv
					return false
				elseif PlayerGuildID == BuildingGuildID then
					BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_6" , 0 )  --�˦b�P�}��W
					return false
				else
					return true	
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
			return false
		end

	elseif ( Option == "USE" ) then

		BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 )

	end

end


function Yuyu_GW_witchgood_Setbomb_00_1( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_2" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_2( ) --���u�w��
	CastSpell( OwnerID() , TargetID() , 494823 )
end

function Yuyu_GW_witchgood_Setbomb_00_3( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_4" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_4( ) 
	--ĵ�i���a�O�_�n�N���u�˨��W	
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end
	
	local RunTime = 0
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_YU_GUILDWAR_BUILD_26]" )
	DialogSelectStr( OwnerID() , "[SC_OKAY]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 10 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 0 then
			BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 )  
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		elseif DialogStatus == 1 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		end
	end
end

function Yuyu_GW_witchgood_Setbomb_00_5( ) --ĵ�i���񪱮a
--Say(OwnerID(),"OwnerID") -- �I�k��
--Say(TargetID(),"TargetID") -- ���N��

	local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
	local str = "[SC_YU_GUILDWAR_BUILD_17][$SETVAR1="..TargetIDName.."]"--ĵ�i�IXXX�����W�Q�ˤF���u

	ScriptMessage( TargetID() , 0 , 1 , str, 0 ) 
	ScriptMessage( TargetID() , 0 , 0 , str, 0 ) 
	DelBodyItem( OwnerID() , 206669 , 1 ) --�������~
end

function Yuyu_GW_witchgood_Setbomb_00_6( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_7" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_7( ) 
	--ĵ�i���a�O�_�n�N���u�˨��W
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end
		
	local RunTime = 0
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_YU_GUILDWAR_BUILD_58]" )
	DialogSelectStr( OwnerID() , "[SC_OKAY]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 10 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 0 then
			BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 ) 
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		elseif DialogStatus == 1 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )
			break
		end
	end
end

--====================================================================================================================

function Yuyu_GW_witchgood_bomb_01( Option ) --���u�

--Say(OwnerID(),"OwnerID")
--Say(TargetID(),"TargetID")

	local Distance = GetDistance( OwnerID(), TargetID() )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if ( Option == "CHECK" ) then


		if (ZoneID == 402) or (ZoneID == 951)  then

			if CheckBuff( TargetID() , 505783 ) == false then

				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_15]", C_SYSTEM ) --�ؼй�H�õL�ݩ���˸m�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_15]", C_SYSTEM ) 
				return false
			else
				if Distance < 50  then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]", C_SYSTEM ) --�ؼйL���I
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]", C_SYSTEM ) 

					return false	
				end
			end

		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

	elseif ( Option == "USE" ) then
		BeginPlot( TargetID()  , "Yuyu_GW_witchgood_bomb_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_bomb_02() -- ���u�
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_bomb_03" , 0 )  
end

function Yuyu_GW_witchgood_bomb_03() -- ���u�

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_14]", 15 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then

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
				elseif (CheckID( TargetID() ) == false) then
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end

			if ( result == "OKOK" ) then
				if CheckBuff( TargetID() , 505783 ) == true then
					local OwnerName = "|cffffff20"..GetName( OwnerID() ).."|r"
					local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_16][$SETVAR1="..OwnerName.."][$SETVAR2="..TargetIDName.."]"

					CancelBuff_NoEvent( TargetID(),505783 )--������BUFF�B��Ĳ�o����ĪG

					ScriptMessage( OwnerID() , 0 , 1 , str, C_SYSTEM ) --XXX���\����FXXX���W�����u
					ScriptMessage( OwnerID() , 0 , 0 , str, C_SYSTEM ) 
					DelBodyItem( OwnerID() , 206680 , 1 ) --�������~
				end
			end
		end
end