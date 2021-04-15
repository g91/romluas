--Pet_NPC      542203

function LuaYU_PetSystemFarm_0()--���b���Ϩ��W
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemNPC_01",30 )
end

function LuaYU_PetSystemNPC_01()

--	Say(OwnerID(), "OwnerID".."1"  )
--	Say(TargetID(), "TargetID".."1"  )

	local food =  CountBodyItem( OwnerID() , 204788 ) --�s�A������
	local milkbox =  CountBodyItem( OwnerID() , 204786 ) --�A�Ŧ�����

	local P = 100
	local XX = Rand( P )    
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+9 , TargetID()  )

	if CheckBuff( TargetID() , 503462 ) == true and milkbox > 0 then

			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_05" , 0 ) 
	--		BeginPlot( TargetID() , "LuaYU_PetSystemNPC_06" , 0 )--�ʪ��ʧ@�^�X 


	elseif milkbox == 0 then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_12]" , 0 )  --�����A�I�S����a[204786]�L�k�����A�ų�I
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_12]" , 0 )  --�����A�I�S����a[204786]�L�k�����A�ų�I

	elseif food >= 1 then

		if XX >50 and XX < 100 then --40%

			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_02" , 0 ) --���a���i
			BeginPlot( TargetID() , "LuaYU_PetSystemNPC_04" , 0 )--�ʪ��ʧ@�^�X 

		else -- 60%
			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_03" , 0 ) 
			BeginPlot( TargetID() , "LuaYU_PetSystemNPC_04" , 0 ) 

		end

	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_13]" , 0 )  --�S�󤣯���
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_13]" , 0 )  --�S�󤣯���
	end



		

end

function LuaYU_PetSystemNPC_02() --���a����

	local O_ID = OwnerID() --���a
	local T_ID = TargetID()  --��/��
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_06]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYU_PetSystemNPC_02_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		 AttachCastMotionTool( O_ID, 211100 ); --�m���Z�����s�A������
	end
end
function LuaYU_PetSystemNPC_02_1(ObjID, CheckStatus)
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ��/��

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID, O_ID , 1 , "[SC_PETSYS_14]" , "0xffffff00" )  --�A�ܶ��Q�����������C
			ScriptMessage(O_ID, O_ID , 0 , "[SC_PETSYS_14]" , "0xffffff00" )  --�A�ܶ��Q�����������C
			AddBuff( T_ID ,503462 ,1 ,-1 )
			DelBodyItem( O_ID , 204788 , 1 )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystemNPC_03() --���a����

	local O_ID = OwnerID() --���a
	local T_ID = TargetID()  --��/��
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_06]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYU_PetSystemNPC_03_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		 AttachCastMotionTool( O_ID, 211100 ); --�m���Z�����s�A������
	end
end

function LuaYU_PetSystemNPC_03_1(ObjID, CheckStatus)
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ���a

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID,O_ID, 1 , "[SC_PETSYS_09]" , 0 )  --�A�⦣�}�ê����������C
			DelBodyItem( O_ID , 204788 , 1 )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystemNPC_04() -- �ʪ��ʧ@�^�X
--OwnerID  ��/��
--TargetID ���a

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID(), 121) 	
	
	sleep(20)
	PlayMotion( OwnerID(), 121) 	

	sleep(20)
	PlayMotion( OwnerID(), 122) 	
end


function LuaYU_PetSystemNPC_05() --���a����
	local O_ID = OwnerID() --���a
	local T_ID = TargetID()  --���a
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	BeginPlot( Cow , "LuaYU_PetSystemNPC_04" , 0 ) 
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_15]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_PetSystemNPC_05_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		local Milkbox = LuaFunc_CreateObjByObj ( 112960 , Cow )--�A�Ŧ�����
		WriteRoleValue(  O_ID , EM_RoleValue_Register+2 , Milkbox  )
	end
end
function LuaYU_PetSystemNPC_05_1(ObjID, CheckStatus)

	local O_ID = OwnerID() --���a
	local T_ID = TargetID()  --��/��

	local MilkBox = ReadRoleValue( O_ID,  EM_RoleValue_Register+2  )  -- �A�Ŧ�����

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			ChangeObjID( MilkBox, 114929 );	-- �m������ID
			ScriptMessage(O_ID, O_ID , 1 , "[SC_PETSYS_16]" , "0xffffff00" )  --�A���Q���������A���C
			GiveBodyItem( O_ID , 204787 , 1 ) --�˺�����
			DelBodyItem( O_ID , 204786 , 1 ) --�S�˺�����
			CancelBuff( T_ID ,503462 )
			BeginPlot( MilkBox , "LuaYU_PetSystemNPC_05_2" , 0 ) 
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
			Delobj( MilkBox )
		end
	end
end

function LuaYU_PetSystemNPC_05_2() 
	sleep(30)
	Delobj( OwnerID() )
end

function LuaI_PetFrameBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 204793		--����§��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720436 , 1 )	

	end
end

function LuaI_PeteEventBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 205793		--�d���������~
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720628 , 1 )	

	end
end

--************************************************************�H�U���d���о�-----------------------

function LuaYU_114932_raid()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID ~= 304) then
		AddBuff( OwnerID() ,506137 ,0 ,-1 ); --�M���j�l  		
	end
end

function LuaYU_114932_PetsTeach_00()

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local play =  CheckFlag( OwnerID() , 542570 ) --�O�_�ѻP�L�K�O�m��		--�Ĥ@���m�ߧ��|����KEY
	local play01 =  CheckFlag( OwnerID() , 542572 ) --���J�洫���m��
	local play02 =  CheckFlag( OwnerID() , 542571 ) --�m�ߵ���			--�Ĥ@���m�ߧ��|����KEY
	local play03 =  CheckFlag( OwnerID() , 542573 ) --��o�F�Ĥ@���K�O�J		--�Ĥ@���m�ߧ��|����KEY
	local play04 =  CheckFlag( OwnerID() , 542574 ) --�������\�񧹦�  		--�Ĥ@���m�ߧ��|����KEY
	local GoodJob =  CheckFlag( OwnerID() , 542575 ) --�Ĥ@���m�ߧ����A�������y	--�Ĥ@���m�ߧ��|����KEY
	local meet =  CountBodyItem( OwnerID() , 204928 ) --���Q�Q��������


	SetShop( TargetID() , 600183 , "Test_Shop_Close" );--�c�檫�~

	if ZoneID == 304 then
		if ( play01 == true ) and ( play02 == false ) then--�D�K�O�m�ߡA�wú�Ǫ��J�A�m�߶}�l
			if (meet == 0) and ( play04 == false ) then
				GiveBodyItem( OwnerID() , 204928 , 1 ) --���Q�Q��������	
			end
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , 109) --�����V�e
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_33]"    )---�֥h�i�}�y���m�ߧa�I���b�A���I��A�����Q�屼��[114933]�W�A��o��[204928]�\�W�h�a�I
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --�бa�����}����

		elseif ( play == true ) and ( play01 == false ) and ( play02 == false ) and ( play03 == false ) and ( play04 == false ) then--�������K�O�m�ߡA�m�߶}�l
			if (meet == 0) and ( play04 == false ) then
				GiveBodyItem( OwnerID() , 204928 , 1 ) --���Q�Q��������	
			end
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , 109) --�����V�e
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_33]"    )---�֥h�i�}�y���m�ߧa�I���b�A���I��A�����Q�屼��[114933]�W�A��o��[204928]�\�W�h�a�I
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --�бa�����}����

		elseif ( play01 == false ) and ( play02 == false ) then--������
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , 112) --����
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_17]"    )--�o�̴N�O�̩Ԫ����o�I[110789]�O�������D�H�A��U�������u�@�N�i�H�K�O��o�i�|�d�����n��������I
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_18]" , "LuaYU_114932_PetsTeach_01", 0 ) --���󩬩_��
			if ( play == false ) and ( play01 == false ) then
				AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --�i���y�d�m��
			elseif ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]�����
			end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --�бa�����}����

		elseif ( GoodJob == false ) and ( play03 == true ) then--�Ĥ@���m�ߧ����A�������y
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , 112) --����
			GiveBodyItem( OwnerID() , 204513 , 1 ) --���|��}�q��
			SetFlag( OwnerID() , 542575 , 1 ) -- ����O��
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_68]"    )--�p���y��[103567]�ٺⶶ�Q�a�I�H����e�A�@�� ���|��}�q��A�C�ѧڳ����A�@���m�ߪ����|�a�I�����d�W�����D���i�H��ڡC
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --�y��[103567]���Z¬
		--	if ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]�����
		--	end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --�бa�����}����


		else						--�m�ߵ���
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , 112) --����
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_29]"    )--������ڭ�観�ݨ�A�⨺�ǯT�ޥX�ӤF�A�y��[103567]�ٺⶶ�Q�a�I�H����A�C�ѧڳ����A�@���m�ߪ����|�a�I�����d�W�����D���i�H��ڡC
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --�y��[103567]���Z¬
			if ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]�����
			end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --�бa�����}����
		end
	else
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_38]"    )--����~�~�����_�I�̶ܡH���j���_�I�ȵ{�̧A�ݭn��h���۪��٦��I�i�����ߪ��]�k�d���_�_�O�A�̦n����ܡI
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --�ڷQ�ݬݧA�檺�f��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_39]" , "LuaYU_114932_OtherZone_01", 0 ) --�����]�k�d���_�_
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --�e���̩Ԫ���
	end
end

function LuaYU_114932_PetsTeach_00_store() --�i�[�u�t�B�L�u�t�j�}�Ұө�
	CloseSpeak( OwnerID() )
	OpenShop()
end

--************�H�U��  ���a���m��L�j�a�ϡn�ɤ����************--
function LuaYU_114932_OtherZone_01()

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_40]"    )--�]�k�d���_�_�O�q�d���_���J�̭���ƥX�ӥi�H�g�ѤH�u���i��U�@�Ԫ��n�٦��I���i�u�@���o�V�n�A�]�k�d���_�_�����D�H���W�q�ĪG�B��U�N�|��n�I
							--���~�A�]�k�d���_�_�ٯ��U�A�i��@�ǥͲ��u�@�A�p���B���q�B�Ķ��A�A�u�ݭn�V���ʶR�@�ǥͲ��u��浹�e�A�e�K�|���ߪ����A�u�@��I

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_48]" , "LuaYU_114932_OtherZone_02", 0 ) --�p����o�]�k�d���_�_
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_49]" , "LuaYU_114932_OtherZone_05", 0 ) --�p����o�}��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_50]" , "LuaYU_114932_OtherZone_06", 0 ) --�p�󴣤��d������O
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��
end

function LuaYU_114932_OtherZone_02()--�p����o�]�k�d���_�_

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_51]"    )--�]�k�d���_�_�O�Ѥ@�إs��[103567]���]���һs�y���A�ҥH�u�n�e��[103567]�N����o�]�k�d���_�_�C

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_18]" , "LuaYU_114932_PetsTeach_01", 0 ) --���󩬩_��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --�y��[103567]���Z¬
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --�^�W�@��
end

function LuaYU_114932_OtherZone_03()--�i���y�d�m��

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_41]"    )--���n�a�A�A���}�i�]�k�d���_�_�~�|���ݨD�M�ʶR���A�ڪ��~�Z�]�~�|�W�ɡA�������M�ڤ��O��¾�~�ӤH���o�Ӻ�L���o�٤����A�N���ڪ��p���j���A�@�{�a�I

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --�e���̩Ԫ���
end

function LuaYU_114932_OtherZone_04() --�e���̩Ԫ���
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_47]"    )--����ǳƦn�F�ܡA�ڪ��p���j�i�O���d������I�X�o�a�I�V�̩Ԫ����e�i��I

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111584_YU_36]" , "LuaYU_114932_OtherZone_08", 0 ) --���N�·ЧA�o�I
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��

end


function LuaYU_114932_OtherZone_05()--�p����o�}��
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_43]"    )--�]�k�d���_�_�ݭn�S�s���}�����i�e�̡A�V�U����<CM>���d�y��</CM>�O�ֳ̧t���覡�A���L�p�G�A�@�N���I�ɶ��B�ҤO�b�̩Ԫ������������ܡA
                                                                                                   --�������D�H�]�|�����A�@���d���}�Ʒ�@���y����I�ڥ��n�h�̩Ԫ����ɳf�A�p�G�A���ݭn�A�ˬO�i�H���ڪ��p���j���A�@�{�C

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --�e���̩Ԫ���
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --�^�W�@��

end

function LuaYU_114932_OtherZone_06()--�p�󴣤��d������O

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_44]"    )--��A�}�i�@���]�k�d���_�_�ɡA�O�o�`�`���e�@�_�ѻP�_�I�A�b�_�I���~���A���d���|���@�ǷQ�k�B�g���Q�M�A��y�A�ӧA���^���]�N�������d�����s����{�A
							--�i�Ӵ��ɯ�O�F��M�٦��t�@�ؤ覡�A���N�O���]�k�d���̶i��ĦX�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_45]" , "LuaYU_114932_OtherZone_07", 0 ) --�p��i���d���ĦX
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --�^�W�@��
end

function LuaYU_114932_OtherZone_07()--�p��i���d���ĦX

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_46]"    )--�ĦX���W�h�۷�²��A�u�n�d�����ݩʬۦP�A�Ϊ̳Q�ĦX���d���ݩ�"�L�ݩ�"���d���A�Y�i�i��ĦX�C
							--�t�~��ӬۿĪ��d���_���J�����Ůt���i����5�šA�ĦX��A�]�k�d���_�_�N�l���Q�ĦX���]�k�d���_�_�ݩʤW�����������ݩʡA�B�X�Ӭ��@�C

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_06", 0 ) --�^�W�@��
end

function LuaYU_114932_OtherZone_08() --�e���̩Ԫ����@��
	local Player = OwnerID()

	local Zone = ReadRoleValue(Player , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local RoomID = ReadRoleValue( Player ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( Player , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( Player , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( Player , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( Player , EM_RoleValue_Dir ) 

	SaveReturnPos( Player,ZoneID,OwnerX,OwnerY,OwnerZ,OwnerDIR)	--�����A�i�J�ƥ��ɪ���e��m�C

	BeginPlot( Player , "LuaYU_114932_OtherZone_09" , 0 ) 
end

function LuaYU_114932_OtherZone_09() --�e���̩Ԫ����@��
	CloseSpeak( OwnerID() )


	if ChangeZone( OwnerID(), 304 , -1 , 4033.2, -0.0, 3450.8, 90) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),304," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��

	end

end

--************�H�U��  ���a���m�̩Ԫ����n�ɤ����************--
function LuaYU_114932_PetsTeach_01()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local play =  CheckFlag( OwnerID() , 542570 ) --�O�_�ѻP�L�K�O�m��
	local play01 =  CheckFlag( OwnerID() , 542572 ) --���J�洫���m��
	PlayMotion( TargetID() , 112) --����
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_20]"    )--���_�����w�����ʪ��B�]�����c�l����A�ñN���]�Щ�I�W���]�k�_���J�W�i����i�A�̲���Ƭ����_����H���ͪ��S���q�C
                                                                                                  --���_���֦������H�ͪ��]�k��O�A�u�n�J�D���h�N�ѡA���_���K�|�X���Ѩ��c�l����k�]�C
				   			 --�Q�γo�˪��ͪ��S�ʡA�ڭ̴N�i�H�X�������e�I���_���J�O�Q���ܮz������A�������_���O�����i�檺�A�]���ڭ̥����m�ߧQ�Τu��-[103565]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_21]" , "LuaYU_114932_PetsTeach_02", 0 ) --�p��ϥ�[103565]
	if ( play == false ) and ( play01 == false ) and (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --�i���y�d�m��

	end
	if (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_02", 0 ) --�^�W�@��	
	end
end

function LuaYU_114932_PetsTeach_02() --�p��ϥ�[103565]���y����
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local play =  CheckFlag( OwnerID() , 542570 ) --�O�_�ѻP�L�K�O�m��
	local play01 =  CheckFlag( OwnerID() , 542572 ) --���J�洫���m��
	PlayMotion( TargetID() , 112) --����
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_26]"    )--�b�U�������d�ӤH�B�i�ʱo�u��-[103565]�A�k��ϥΫK�|�b�Ҧb��m�]�m�@�ӥi�����@�����������A���_���I��H�|�|�B�k«�A�����Q�Ψ���N���_�����쳴���]�m����m�A
								 --�Y�i���\�������_���C�Ӧb���o�d���_���J��A�N�i�H�N���_������C
	if ( play == false ) and ( play01 == false ) and (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --�i���y�d�m��
	elseif (ZoneID ~= 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_OtherZone_03", 0 ) --�i���y�d�m��
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_01", 0 ) --�^�W�@��

end

function LuaYU_114932_PetsTeach_03() --�i���y�d�m��

	local play =  CheckFlag( OwnerID() , 542570 ) --�O�_�ѻP�L�K�O�m��
	local play01 =  CheckFlag( OwnerID() , 542572 ) --���J�洫���m��
	local GoldenEgg =  CountBodyItem( OwnerID() , 204792 ) --���J

	if ( play == false ) then--�����ѻP�K�O�m��
		PlayMotion( TargetID() , 109) --�����V�e
		SetSpeakDetail( OwnerID(), "[SC_PETSYS_23]"    )--�b�A���I��A���@�ӳQ�屼������d��[114933]�A��o��[204928]��m�b���ӥ��x�W�A�|�ިӤ@���Q���_���ұH�ͪ��T�A���˨����T�A���_���N�|�X�{�A���򱵤U�ӧG�m�n����
									  --�}�l�i���y�d�m�ߧa�I�ڳo���n���@��[103565]�A���`�i�H�n����R���A�o���N�K�O���A��m�ߥΧa�I
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --�y��[103567]���Z¬
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_24]" , "LuaYU_114932_PetsTeach_04", 0 ) --�}�l�y�d�m��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��
	end
end

function LuaYU_114932_PetsTeach_03_2() --�����J�����

	local play =  CheckFlag( OwnerID() , 542570 ) --�O�_�ѻP�L�K�O�m��
	local play01 =  CheckFlag( OwnerID() , 542572 ) --���J�洫���m��
	local GoldenEgg =  CountBodyItem( OwnerID() , 204792 ) --���J
	PlayMotion( TargetID() , 112) --����
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_52]"    )--������_�I�̡A�y�d�m�ߤW��F�ܡH���ڦ��@�Ӵ�ĳ�A�̩Ԫ������������O��������I�����|���U�����~�ߪ������J�I�p�G�A��a�ӵ��ڡA�ڥi�H���A�X�Ӧn�B�C
							--1.����1��[204792]�A�ڴ��ѧA�K�O���y�d�m�ߡA�ӥB�O����o���d���_���J���j�w�C�C��@��
							--2.����2��[204792]�A�ڥΤ@�~[204927]�M�A�洫�A�o���]�ĥi�H���d����300�I[SC_PETS_EVENT_00_00_05]�A��Ƭ�1�I��[SC_PETS_EVENT_00_00_03]������C
							--3.����3��[204792]�A�ڥΤ@�~[204926]�M�A�洫�A�o���]�ĥi�H���d����300�I[SC_PETS_EVENT_00_00_05]�A��Ƭ�1�I��[SC_PETS_EVENT_00_00_02]������C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_53]" , "LuaYU_114932_PetsTeach_09", 0 ) --�洫�y�d�m�߾��|
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_54]" , "LuaYU_114932_PetsTeach_10", 0 ) --�洫[204927]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_55]" , "LuaYU_114932_PetsTeach_11", 0 ) --�洫[204926]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��

end

function LuaYU_114932_PetsTeach_04() --�}�l�y�d�m��
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() , 204928 , 1 ) --���Q�Q��������	
	GiveBodyItem( OwnerID() , 206776 , 1 ) --���y����
	SetFlag( OwnerID() , 542570 , 1 ) -- �}�l��԰��O��
	PlayMotion( TargetID() , 109) --�����e�i
	Say(TargetID(),"|cffffff00" .."[SC_PETSYS_25]".. "|r") --�V�O�m�ߡI����פ���m�b�A�I�᪺[114933]�W�a�I	
end

function LuaYU_114932_PetsTeach_05()--�y��[103567]���Z¬
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	PlayMotion( TargetID() , 112) --����
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_31]"    )--�Z¬��...�o�i�O�ӷ~���K�I...���A�ڭJ�誺�I�ڬO�y��i���O�ӤH�A�ڧi�D�A�T�ӳZ¬�A�Ĥ@.[103567]�u�b���~�X�{�A�ӥB�q�`�O�H�ͦb��O���t���]�����W�A�]�N�O�D��^�ŧO���C
							--�ĤG.�V�ŬD�԰������]���ɡA���]���Q���ѫ�[103567]�X�{�����v�V���C �ĤT.[103567]�|�¦V�l�v�L���H�e�i����V�����k�h�A�Q�γo�ӯS�ʳ]���������a�I

	if (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��
	else
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_OtherZone_03", 0 ) --�i���y�d�m��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_02", 0 ) --�^�W�@��	
	end
	
end

function LuaYU_114932_PetsTeach_06()--�бa�����}����
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_37]" )--�A�Q�^�h�F�r�H�n�f�K���ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111584_YU_36]" , "LuaYU_114932_PetsTeach_07", 0 ) --���N�·ЧA�o�I
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --�^�W�@��
end

function LuaYU_114932_PetsTeach_07()--���N�·ЧA�o�I
	CloseSpeak( OwnerID() )
	Say(TargetID(), "[SC_422579_4]") --�ܦn�A����ڭ̨��a
	PlayMotion( TargetID() , 116) --����
	BeginPlot( OwnerID() , "LuaYU_114932_PetsTeach_08" , 0 ) 
end

function LuaYU_114932_PetsTeach_08()--���}�̩Ԫ���
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_114932_PetsTeach_08_01" , 0 ) 
end

function LuaYU_114932_PetsTeach_08_01()--���}�̩Ԫ���
	GoReturnPos(OwnerID())--�e���i�J�ƥ��ɪ���m
end

function LuaYU_114932_PetsTeach_09()--�洫�y�d�m�߾��|

	local O_ID = OwnerID()
	local play02 =  CheckFlag( OwnerID() , 542571 ) --�m�ߵ���
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --�����J

	if (play02 == true) then
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --�n�Y
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_61]".. "|r") --�c...���n�N��A�A���Ѥw�g�i��L�y�d�m�ߤF��I
	elseif GoldenEgg >=1 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 1 )
		GiveBodyItem( O_ID , 204928 , 1 ) --���Q�Q��������	
		GiveBodyItem( O_ID , 206776 , 1 ) --���y����	
		SetFlag( O_ID , 542572 , 1 ) -- �}�l��԰��O��
		PlayMotion( TargetID() , 109) --�����e�i
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_56]".. "|r") --���������᪺[204792]�I���򦬤U�o��[103565]�M[204928]�I����פ���m�b�A�I�᪺[114933]�W�a�I	
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --�n�Y
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --�c...���n�N��A�A�a�Ӫ�[204792]�ƶq���G������I
	end
end

function LuaYU_114932_PetsTeach_10()--�洫[204927] �����]��
	local O_ID = OwnerID()
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --�����J

	if GoldenEgg >=2 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 2 )
		GiveBodyItem( O_ID , 204927 , 1 ) --�����]��	
		PlayMotion( TargetID() , 112) --����
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_58]".. "|r") --���������᪺[204792]�I�o�O���w�n��[204927]�ЧA���U�C
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --�n�Y
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --�c...���n�N��A�A�a�Ӫ�[204792]�ƶq���G������I
	end	
end

function LuaYU_114932_PetsTeach_11()--�洫[204926] ı���]��
	local O_ID = OwnerID()
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --�����J

	if GoldenEgg >=3 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 3 )
		GiveBodyItem( O_ID , 204926 , 1 ) --ı���]��	
		PlayMotion( TargetID() , 112) --����
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_59]".. "|r") --���������᪺[204792]�I�o�O���w�n��[204926]�ЧA���U�C
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --�n�Y
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --�c...���n�N��A�A�a�Ӫ�[204792]�ƶq���G������I
	end	
end

--************�H�W��  ���a���m�̩Ԫ����n�ɤ����************--



--************�H�U��  ���a���m�i�殷�d�y�d�m�ߪ��@���n************--
function LuaYU_PetSystemWood_00()--���\����x��l�@��
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemWood_01",50 )
end

function LuaYU_PetSystemWood_01()
	local O_ID = OwnerID()	--���a
	local T_ID = TargetID()	--���\����x
	local play04 =  CheckFlag( O_ID , 542574 ) --�������\�񧹦�


	if ReadRoleValue( T_ID , EM_RoleValue_Register+3) == 1 then
		return
	end

	local Player_Lv = ReadRoleValue( O_ID, EM_RoleValue_LV )--Ū�����a����
	local meet =  CountBodyItem( O_ID , 204928 ) --���Q�Q��������
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 
	local play02 =  CheckFlag( OwnerID() , 542571 ) --����m�ߵ���

	if (meet > 0) and ( play02 == false ) and ( play04 == false ) then

		WriteRoleValue( T_ID , EM_RoleValue_Register+3, 1 ) --��w��
		ChangeObjID( T_ID, 114934 );	-- �m������ID  ���Q�Q��������
		SetModeEx( T_ID  , EM_SetModeType_Show , true ) --���
		SetModeEx( T_ID  , EM_SetModeType_Move, false )--����
		SetModeEx( T_ID , EM_SetModeType_DisableRotate, true )--����V
		SetModeEx( T_ID , EM_SetModeType_NotShowHPMP, true )--����ܦ��

		DelBodyItem( O_ID , 204928 , 1 )

		SetFlag( O_ID , 542574 , 1 ) -- �������\�񧹦�


		sleep(30)
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_27]" , 0)  --���Q�Q�������פިӤF���j�����T...
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_27]", 0) 
		--�H�U���T�X�{
	 	local Warwick = CreateObjByFlag( 103568, 780307, 6 , 1 );  --��������

		WriteRoleValue(  Warwick , EM_RoleValue_LV , Player_Lv  ) --���T���ŵ��󪱮a����
		AddToPartition( Warwick, RoomID) 

		WriteRoleValue( Warwick , EM_RoleValue_Register+1, T_ID ) --�O��N��
		WriteRoleValue( Warwick , EM_RoleValue_Register+2, O_ID ) --�O���a

		SetPlot( Warwick , "dead","LuaYU_114932_warwilddead_1",0 )           	
		SetModeEx( Warwick , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( Warwick  , EM_SetModeType_Strikback, true )--����
		SetModeEx( Warwick , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Warwick , EM_SetModeType_NotShowHPMP, true )--����ܦ��

		MoveToFlagEnabled(Warwick, false )
		LuaFunc_MoveToFlag( Warwick , 780307 , 7 , 0 )
		AddBuff( Warwick ,503141 ,1 ,20 )--��Y
		sleep(10)
		SetModeEx( Warwick , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( Warwick , EM_SetModeType_NotShowHPMP, false )--����ܦ��
		SetAttack( Warwick , O_ID ) --��§���  
	end
end

function LuaYU_114932_warwilddead_1()--�Q�H�ͪ��T���`�@��

	local ID = OwnerID()
	local OrgID = ReadRoleValue( ID , EM_RoleValue_OrgID ) --�өǦb��Ʈw���Τ@ID
	local Meet = ReadRoleValue( ID , EM_RoleValue_Register+1) --�N��
	local Player = ReadRoleValue( ID , EM_RoleValue_Register+2) --���a
	local GMtest =  CountBodyItem( Player , 203477 ) --�S��@��Ĳ�o�_��


	local Str = "[SC_PETSYS_28][$SETVAR1=".."["..OrgID.."]".."]"
	--�o�{�F�@���H�ͦbOrgID���W�����_���I[103567]
	ScriptMessage(Player, Player , 1 , Str , "0xff00ff00") 
	ScriptMessage(Player, Player , 0 , Str, "0xff00ff00") 

	ScriptMessage(Player, Player, 2 , "[SC_PETSYS_32]" , "0xff00ff00") --����]�m[103565]�a�I
	ScriptMessage(Player, Player , 0 , "[SC_PETSYS_32]", "0xff00ff00") 
	local RoomID = ReadRoleValue( ID ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( ID , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( ID , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( ID , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( ID , EM_RoleValue_Dir ) 


	local StageNpc = CreateObj( 103566 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --���_��
	AddToPartition( StageNpc , RoomID )  

	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	Beginplot( StageNpc ,"event_module_NPC_dead_00", 0 )--5������A���_������



	SetModeEx( Meet  , EM_SetModeType_Show , false ) --���
	ChangeObjID( Meet, 114933 );	-- �m������ID  ���\����x
	SetModeEx( Meet  , EM_SetModeType_Show , false ) --���

	AddBuff( StageNpc ,503589 ,1 ,-1 )--�G����
	AddBuff( StageNpc ,502363 ,1 ,-1 )--�G����
	SetFlag( Player , 542571 , 1 ) -- ������԰��O��


	if GMtest > 0 then
		WriteRoleValue( Meet , EM_RoleValue_Register+3, 0 ) --�Y�OGM���աA�Ѱ���w
	end
end