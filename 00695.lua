--700695_�B�ú޲z��1_�P��  (�i�P�ʵ��B, �]�i���� ) --���R 

function LuaI_111274()  --�ө��]�w ���b����Npc���󲣥ͼ@��
	local NPC = OwnerID()
	SetMinimapIcon( NPC, EM_MapIconType_Shop )
	SetShop( NPC , 600120 , "Test_Shop_Close" )
end

function Marry_Shop() --�ʶR�B�ì������~
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenShop()
end

function LuaS_111274() -- npc��l�@��
	local Player = OwnerID()
	local NPC = TargetID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local apply_Key = 541320  --�w�ӽе��B��keyitem
	local NPCID = { 115002 ,111274 }  -- 1 �P�ʤ��i���B  2. �P�ʥi���B
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID ) -- NPC ID

	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --1P�O�Ѥ�
	local IamW = Check_Relation( Couple1, EM_RelationType_Wife )  --1P�O�ѱC
	local UareH = Check_Relation( Couple2 , EM_RelationType_Husband )  --2P�O�Ѥ�
	local UareW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --2P�O�ѱC

	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --�ˬdNPC�P���a���Z��

	if CheckBuff(Player, 623790 ) == True then  -- ���p�H�|������buff
		local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
		SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC02]")   -- �A���i�J�|���H
		AddSpeakOption(Player,Player,"[SC_GETTITLE_1]","Lua_Mika_weddingtrans_room6("..ChoosedSN..")", 0)  -- �T�w
	else
		LoadQuestOption(Player)
		AddSpeakOption( Player, Player,"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --���Y�t�Τ���
		if CheckFlag( Player , apply_Key ) == true then  --���w�ӽе��B��keyitem
			AddSpeakOption( Player,  Player,"[SC_2012MARRY_TRANSNPC14]" , "lua_mika_weddingtrans_NPC1" , 0 )  --�B§�|���ӽ�
			AddSpeakOption( Player, Player,"[SC_MARRY_GIVEUP1]" , "lua_mika_merrygiveup" , 0 )  --�ڷQ���B�åӽ�
		else
			if (IamH ==  false  and UareW  == false) or (IamW  == false and UareH == false ) then  --���賣�S�����B
				if NPCOrgID == NPCID[1] then -- �P�ʤ��i���B
				--	say(Player, "same sex - no")
					AddSpeakOption( Player, Player, GetString("SC_MARRY_1") , "Marry_Check_1" , 0 )	--�ڷQ�n���B
				elseif NPCOrgID == NPCID[2] then -- �P�ʥi���B
				--	say(Player, "same sex - ok ")
					AddSpeakOption( Player, Player, GetString("SC_MARRY_1") , "Marry_Check_2" , 0 )	--�ڷQ�n���B
				end
			end
		end
		AddSpeakOption( Player, Player, GetString("SC_MARRY_20") , "Marry_Shop" , 0 )		--�ʶR�B�ì������~
	end
end


function Marry_Check_1()  --�ӽе��B (�P�ʤ��i���B)
	local Player = OwnerID()
--	Say(Player, "check1")
	CloseSpeak(Player)-- ������ܵ���
	if Marry_Apply_Check_1(player) == true then  -- �ˬd�B§�|���ӽб��� -���ʵ��B�� (�u���\����)
--		Say(Player, "check1 ok")
		BeginPlot(Player, "Marry_Check_step2" , 0)
	end
end

function Marry_Check_2()  --�ӽе��B (�P�ʥi���B)
	local Player = OwnerID()
--	Say(Player, "check2")
	CloseSpeak(Player)-- ������ܵ���
	if Marry_Apply_Check_2(player) == true then  -- �ˬd�B§�|���ӽб��� -�P�ʵ��B
--		Say(Player, "check2 ok")
		BeginPlot(Player, "Marry_Check_step2" , 0)
	end
end


function Marry_Check_step2()
	local Player = OwnerID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_mallring1 = CountBodyItem( Couple1 , 202543 )  --�ӫ��k��ring
	local P1_mallring2 = CountBodyItem( Couple1 , 202544 )  --�ӫ��k��ring
	local P1_shopring1 = CountBodyItem( Couple1 , 202817 )  --�C���k��ring
	local P1_shopring2 = CountBodyItem( Couple1 , 202818 )  --�C���k��ring
------------- �ĤG�Ө��⪺ -----------------------------------------------------------------
	local P2_mallring1 = CountBodyItem( Couple2 , 202543 )  --�ӫ��k��ring
	local P2_mallring2 = CountBodyItem( Couple2 , 202544 )  --�ӫ��k��ring
	local P2_shopring1 = CountBodyItem( Couple2 , 202817 )  --�C���k��ring
	local P2_shopring2 = CountBodyItem( Couple2 , 202818 )  --�C���k��ring

	if CheckFlag( Couple1 , 541320 ) == true and CheckFlag( Couple2, 541320 ) == true then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--�e�������T��  �B§�w�g�ӽЧ����A�Ыe�����B�|�����ұB���v�}�l�A�̪��B§
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--�e�������T��  �аO�o�ܽЧA�̪��˪B�n�Ͳն��@�P�e���e�����B�|�����A�̯��֡C
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )	
	elseif CheckFlag( Couple1 , 541320 ) == TRUE and CheckFlag( Couple2 , 541320 ) == FALSE then --1p ���ӽйL 2p�S
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_44]" , 0 )	--�e�������T��  ����Ψ䤤���@�w��z�L���B�ӽСC
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_44]" , 0 )
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_45]" , 0 )	--�e�������T��  ����Y�n���s��z���B�ӽСA�w��z�L���B�ӽЪ��@����i���󵲱B�ӽСC
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_45]" , 0 )	
	elseif CheckFlag( Couple1 , 541320 ) == FALSE and CheckFlag( Couple2 , 541320 ) == TRUE then --1P�S�ӽйL 2P��
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_44]" , 0 )	--�e�������T��  ����Ψ䤤���@�w��z�L���B�ӽСC
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_44]" , 0 )	
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_45]" , 0 )	--�e�������T��  ����Y�n���s��z���B�ӽСA�w��z�L���B�ӽЪ��@����i���󵲱B�ӽСC
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_45]" , 0 )	
	else
		--�[�W�W�h- 
		--���X�ն����H�ݬ��k��A�����ն���ݬ��k��C
		--�k��ݫ����k�ʱB�٨䤤�@��(�ӫ��ιC����)�A�k��ݫ����k�ʱB�٨䤤�@��(�ӫ��ιC����)
		if P1_mallring1 == 0 and  P1_shopring1 == 0 then
			--p1�S���٫�
			ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02]" , 0 )	--�e�������T��   �нT�{���X�ն��̬O�_����[202817]��[202543]�A
			ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02]" , 0 )	
			ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02]" , 0 )	
			ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02]" , 0 )	
			Sleep(10)
			ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--�e�������T��   �����ն��̬O�_����[202818]��[202544]�C
			ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02_2]" , 0 )	--�T����
			ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--�e�������T��   �����ն��̬O�_����[202818]��[202544]�C
			ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
		else 
			if P1_mallring1 > 0 then  --���ӫ��٫�
				if P2_mallring2 == 0  then
				--p2�S���ӫ��٫�
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY04]" , 0 )	--�e�������T��   �����ն��̥�����[202544]�A�L�k�i�浲�B�ӽЩαB§�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY04]" , 0 )	--�T����
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY04]" , 0 )	--�e�������T��   �����ն��̥�����[202544]�A�L�k�i�浲�B�ӽЩαB§�C
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY04]" , 0 )	--�T����
				elseif  P2_mallring2 > 0 then
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--�e�������T��  �B§�w�g�ӽЧ����A�Ыe�����B�|�����ұB���v�}�l�A�̪��B§
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					Sleep(10)
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--�e�������T��  �аO�o�ܽЧA�̪��˪B�n�Ͳն��@�P�e���e�����B�|�����A�̯��֡C
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )
					SetFlag( Couple1 , 541320 , 1 )
					SetFlag( Couple2 , 541320 , 1 )
				end
			elseif  P1_shopring1 > 0 then  --���@��٫�
				if P2_shopring2 == 0  then
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY03]" , 0 )	--�e�������T��   �����ն��̥�����[202818]�A�L�k�i�浲�B�ӽЩαB§�C
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY03]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY03]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY03]" , 0 )	
				elseif  P2_shopring2  > 0 then
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--�e�������T��  �B§�w�g�ӽЧ����A�Ыe�����B�|�����ұB���v�}�l�A�̪��B§
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					Sleep(10)
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--�e�������T��  �аO�o�ܽЧA�̪��˪B�n�Ͳն��@�P�e���e�����B�|�����A�̯��֡C
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )	
					SetFlag( Couple1 , 541320 , 1 )
					SetFlag( Couple2 , 541320 , 1 )
				end
			end
		end
	end
end

function lua_mika_merrygiveup() --�ڷQ���B�åӽ�
	SetSpeakDetail( OwnerID(), "[SC_MARRY_GIVEUP2]" )--�A�T�w�n���B�åӽжܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GETTITLE_1]" , "lua_mika_merrygiveup2", 0 ) --�T�w
end

function lua_mika_merrygiveup2() --�T�w-���B�åӽ�
	local Player = OwnerID()
	CloseSpeak( Player )		-- ������ܵ���
	SetFlag( Player , 541320 , 0 ) --���B�åӽ�

	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if CheckBuff(Player, 623790 ) == true then
		CancelBuff(Player, 623790 )
	end
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_GIVEUP4]" , C_SYSTEM )	--�e�������T��  �A�w���B�åӽСC
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_GIVEUP4]" , C_SYSTEM )	--�T����
end

function lua_mika_merryzonego() --�e�����B�|��
	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --�P�_OwnerID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC
	for i = 1 , PlayerTeam[0] do
		CloseSpeak(PlayerTeam[i])
		BeginPlot( PlayerTeam[i] , "lua_mika_merryzonego2" , 0 )  
	end
end

function lua_mika_merryzonego2()
	local Player = OwnerID()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_MARRY_35]") --�O�_�T�w�i�J���B�|���H
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		local n = 0
		local DialogResult = ""
		while true do
			Sleep( 10 )
			local DialogStatus = DialogGetResult( Player )
			n = n + 1
		--	Say(OwnerID(), n)
			if n >= 10 then -- ���L�a�j��A10sec
				--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

				break
			else
				--ScriptMessage( Player , Player , 0, "OK", 0 )
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					Beginplot( OwnerID() ,"lua_mika_merryzonego3", 0 )
					DialogClose( Player )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				elseif ( DialogStatus == 1 ) or ( DialogStatus ==-1 ) then
					DialogResult = "No"
					DialogClose( Player )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end


function lua_mika_merryzonego3()
	ChangeZone( OwnerID(), 303 , 0 , 2681.7, 1.9 , 1432.9, 89.6)    --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
	DesignLog(OwnerID(),303," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
end

function lua_mika_merryzonecheck() --�J�f���Ϊ���
	While true do
	--	say(OwnerID(), "check")
		SetPlot( OwnerID(), "range", "lua_mika_merryzonecheck2", 300 )  
		Sleep(50)
	end
end

function lua_mika_merryzonecheck2() 
--	Say(OwnerID(), "OwnerID") --player
--	Say(TargetID(), "TargetID")  --box
	if CheckBuff(OwnerID(), 501770) == false then
		AddBuff( OwnerID() , 501770 , 0 , -1 )
--		ClockOpen( OwnerID() ,EM_ClockCheckValue_3, 5400 ,5400,0,"Lua_Clockending","lua_mika_merry_timeup") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
		ScriptMessage( OwnerID() , OwnerID(), 2 , "[SC_MARRY_WELCOME01]" , C_SYSTEM )	--�w��Ө쵲�B�|���I
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_MARRY_WELCOME01]"  , C_SYSTEM )
		Sleep(20)
		ScriptMessage( OwnerID() , OwnerID(), 2 , "[SC_MARRY_WELCOME02]" , C_SYSTEM )	--�Y�s�H����w�ǳƦn�A�Ш����e��P�ұB���v��ܶ}�ұB§�a�I
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_MARRY_WELCOME02]"  , C_SYSTEM )
	end
end