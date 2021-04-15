

--�B§ready (�u������)
function Marry_Start_Begin2()
--	Say(OwnerID(), "OwnerID 2") -- npc
--	Say(TargetID(), "TargetID 2" ) -- player
	local PartyNum = GetPartyID(TargetID() , -1 )
	local Couple1 = GetPartyID( TargetID() , 1 )
	local Couple2 = GetPartyID( TargetID() , 2 )
	local Relation = GetRelation(Couple1, Couple2)  --�ˬd�������Y
	local Relation2 = GetRelation(Couple2, Couple1) -- �ˬd�������Y

	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P��DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P��DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- �b���b�u�W
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- �b���b�u�W

	local IamS = Check_Relation( Couple1 , EM_RelationType_Student )  --1P�OS
	local IamT = Check_Relation( Couple1, EM_RelationType_Teacher )  --1P�OT
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  --
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  --
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  --
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  --
---------------
	local YouS = Check_Relation( Couple2 , EM_RelationType_Student )  --
	local YouT = Check_Relation( Couple2, EM_RelationType_Teacher )  --
	local YouH = Check_Relation( Couple2 , EM_RelationType_Husband )  --
	local YouW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --
	local YouL = Check_Relation( Couple2 , EM_RelationType_Lover )  --
	local YouF = Check_Relation( Couple2 , EM_RelationType_Family  )  --
	local YouB = Check_Relation( Couple2 , EM_RelationType_BestFriend  )  --

	local P1_POS19_DBID  = GetRelation_DBID( Couple1 , 19 )
	local P2_POS19_DBID  = GetRelation_DBID( Couple2 , 19 )
--------------
--	Say(TargetID(), Relation )
--	Say(TargetID(), Relation2 )
	if ( PartyNum == 0 ) then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
	elseif ( PartyNum == 1 ) then
		ScriptMessage( TargetID(), TargetID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�e�������T��   �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
		ScriptMessage( TargetID(), TargetID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�T����
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- ���� LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , C_SYSTEM )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , C_SYSTEM )	--�e�������T��  ����Ҧ�¾�~�䤤���@��¾�~���ť����bLV18�H�W
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , C_SYSTEM )	--�T����
			elseif P1Sex == 0 and P2Sex == 0 then -- ��Ө��ⳣ�O�k��
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_46]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_46]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_46]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_46]" , C_SYSTEM )	--�T����
			elseif P1Sex == 1 and P2Sex == 1 then -- ��Ө��ⳣ�O�k��
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_46]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_46]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_46]" , C_SYSTEM )	--�e�������T��  �ӽе��B�����訤�⬰�P�ʧO�A�L�k�ӽе��B�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_46]" , C_SYSTEM )	--�T����
			elseif P1_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
			elseif P2_POS19_DBID ~= 0 then  --�p�G���Ȥ�����0 (��ܦ����a�w��20�ӯS�����Y����)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�e�������T��  �A���S�����Y�ƶq�w�F�W���A�L�k�إ����Y�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--�T����
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- ����Ψ䤤���@���w�B���A
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_39]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@���w�B���A�A�L�k�i��B§�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_39]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_39]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@���w�B���A�A�L�k�i��B§�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_39]" , C_SYSTEM )	--�T����
			elseif Relation == -1 and Relation2 == -1 then 	--����S���������Y
			--�i���B
				BeginPlot(TargetID(), "Marry_Start_Begin3" , 0)  --���B
			else
			--���i���B �T��
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@�w���䥦���Y�A�L�k�i��B§�C
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , C_SYSTEM )	--�T����
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , C_SYSTEM )	--�e�������T��  ����Ψ䤤���@�w���䥦���Y�A�L�k�i��B§�C
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , C_SYSTEM )	--�T����
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_8]" , C_SYSTEM )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�ڤ~�ର�A���ұB�C
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_8]" , C_SYSTEM )	--�T����
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_8]" , C_SYSTEM )	--�e�������T��   �s���P�s�Q�����b�ڪ�����A�ڤ~�ର�A���ұB�C
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_8]" , C_SYSTEM )	--�T����
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
	end
end



--�B§�i�榡
function Marry_Start_Begin_Combo( Couple1 , Couple2 )
--	Say(OwnerID(), "OwnerID") -- player
--	Say(TargetID(), "TargetID" ) -- npc
	local BoyName = GetName( Couple1 )
	local GirlName =  GetName( Couple2 )
	local PartyNum = GetPartyID(Couple1 , -1 )
	local Message1 = "[SC_MARRY_14][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --BoyName�A�A�@�N��GirlName���A���d�l�H
	local Message2=  "[SC_MARRY_17][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --GirlName�A�A�@�N����BoyName�����L���d�l�H
	local Message3=  "[SC_MARRY_30][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --���� BoyName �P GirlName �����B§�A���֥L�̥õ��P�ߡB�ïD�R�e�I

	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( Couple1 , EM_LuaDialogType_YesNo , Message1 )	-- BoyName�A�A�@�N��GirlName���A���d�l�H���U�o�A�R�@�o�A�L�׳h�a�٬O�I���A�e�f�٬O���d�A�۷R�۷q�A��������A�û��b�@�_�H
		DialogSelectStr( Couple1 , GetString("SC_MARRY_15") )			-- �O���A���@�N
		DialogSelectStr( Couple1 , GetString("SC_MARRY_16") )			-- �ڻݭn�Ҽ{�I
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		local Ask_For_Boy = Marry_Ask( Couple1 )
		if Ask_For_Boy == "Yes" then
			if ( PartyNum == 0 ) then
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
			elseif ( PartyNum == 1 ) then
				ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�e�������T��   �P�A�ӽе��B����H���b�u�W�A�L�k�ӽСC
				ScriptMessage( OwnerID(), OwnerID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--�T����
			elseif  ( PartyNum >= 3 ) then
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
			elseif  ( PartyNum == 2 ) then 
				Say( Couple1 , GetString("SC_MARRY_15") )
				if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
					DialogCreate( Couple2 , EM_LuaDialogType_YesNo , Message2 )	-- GirlName�A�A�@�N����BoyName�����L���d�l�H���H�L�A�߫��L�A�L�׳h�a�٬O�I���A�e�f�٬O���d�A�۷R�۷q�A��������A�û��b�@�_�H
					DialogSelectStr( Couple2 , GetString("SC_MARRY_15") )			-- �O���A���@�N
					DialogSelectStr( Couple2 , GetString("SC_MARRY_16") )			-- �ڻݭn�Ҽ{�I
					AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
					local Ask_For_Girl = Marry_Ask(Couple2 )
					if Ask_For_Girl == "Yes" then
						if ( PartyNum == 0 ) then
							ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
							ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
							ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
							ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
						elseif  ( PartyNum >= 3 ) then
							ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
							ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
							ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--�e�������T��  �s���P�s�Q����������H�p���A�~�i�H�}�l�B§�C
							ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--�T����
						elseif  ( PartyNum == 2 ) then 
							if SetRelation( Couple1  , Couple2 , EM_RelationType_Husband , 0 , EM_RelationType_Wife , 0 ) then	-- �]�w�ҩd���Y
								Say( Couple2 , GetString("SC_MARRY_15") )
								Say( TargetID() , GetString("SC_MARRY_18") )			-- �ڲ{�b�ŧG�A�A�̥��������X�k���ҩd�C���ߧA�̡I	
								local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
								local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
								if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
									RunningMsg( Couple1 , 2 , Message3 ) 	-- ���� BoyName �P GirlName �����B§�A���֥L�̥õ��P�ߡB�ïD�R�e�I
								end
								SetFlag( Couple1 , 541321 , 1 ) --���Ѱѥ[�L�B§
								SetFlag( Couple2 , 541321 , 1 ) --���Ѱѥ[�L�B§
								-- 5.0.6 �s���|���ƥ�P�_ ----------------------
								if CheckBuff(Couple1, 623790 ) == true and CheckBuff(Couple2, 623790 ) == true then  -- ���p�H�B§�|�����ɾ���buff 
									GiveBodyItem(Couple1, 202898, 1 )  -- ���k���y
									GiveBodyItem(Couple2, 202899, 1 )  -- ���k�豷��	
								else
									SetFlag( Couple1 , 541320 , 0 )
									SetFlag( Couple2 , 541320 , 0 )		
								end
							end
						end
					end
				else
					ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

----���}���B�|��
function  lua_mika_merry_exit01()  --���}���B�|��(npc)
	SetSpeakDetail(OwnerID(), "[SC_LOSTTREASURE_LEAVE]" )  --�A�T�w�n���}�o�̶ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit02" , 0 )	--�T�w
end

function lua_mika_merry_exit02() --���}�ﶵYesno
	CloseSpeak(OwnerID())
--	BeginPlot(OwnerID()  , "Lua_Clockending" , 0 )   --�I�sclockclose
	CancelBuff(OwnerID(), 501770 )	
	ChangeZone( OwnerID(), 2 , 0 , 4677.3, 109.3 , -2220.9, 326.3)    --ChangeZone �^��Z��R���������s��
end

function Marry_Ask( Player )
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
	--	Say(OwnerID(), "n")
		if n > 10 then -- ���L�a�j��A10sec
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			DialogClose( Player )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			elseif ( DialogStatus == 1 ) or ( DialogStatus == -1 )then
				DialogResult = "No"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			else
				DialogResult = "Etc"
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			end
		end
	end

	return DialogResult

end