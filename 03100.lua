--�x�V�Ѩ�
function Lua_na_2013_xmas_tw()  --123234 �x�V�p�Ѩϵ�������
	local Owner = OwnerID()
	if CheckFlag( Owner , 548801 ) == true then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_14]" ) --�洫§�����ʤ@�ѥu��洫�@����I
	else
		if CountBodyItem( Owner , 241000) >=1 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_12]" ) --�֥��}�A��§���a�I�쩳�|�o�줰��O�H
			GiveBodyItem( Owner , 241987,1 )
			DelBodyItem( Owner, 241000, 1)
			SetFlag( Owner , 548801 , 1 )
			DesignLog( Owner , 123234 , "Exchange perfect gift" ) 
		elseif CountBodyItem( Owner , 241001) >=1 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_12]" ) --�֥��}�A��§���a�I�쩳�|�o�줰��O�H
			GiveBodyItem( Owner , 241986,1 )
			DelBodyItem( Owner, 241001, 1)	
			SetFlag( Owner , 548801 , 1 )
			DesignLog( Owner , 123234 , "Exchange soso gift" ) 
		else
			SetSpeakDetail( Owner, "[SC_XMAS_TW_01]" ) --�x�V�`�A�R��§�����`��I	
		end			
	end
end

  

--�N�ܯS�D§��
function Lua_na_2013_xmas_Gift()  --123235 �V�N�ܯS�D§��R§��
	local Owner = OwnerID()
--	local Target = TargetID()
	if  CheckFlag( Owner , 548800 ) == false and  CheckFlag( Owner , 548801) == false then
		if CountBodyItem( Owner , 240997) == 0 and CountBodyItem( Owner , 240998) == 0 and  CountBodyItem( Owner , 240999) == 0 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_05]" ) --�A�ݭn�ʶR�ѥ[�洫§�������~�ܡH
			AddSpeakOption( Owner , Owner ,"[SC_XMAS_TW_08]", "Lua_na_2013_xmas_Buy" , 0 ) --Buy	
		else
			SetSpeakDetail( Owner, "[SC_XMAS_TW_13]" ) --�A���W�w�g��§���F��I			
		end

	else
		SetSpeakDetail( Owner, "[SC_XMAS_TW_02]" ) --�x�V�`�A��M�N�O�n���洫§���o!			
	end
end

function Lua_na_2013_xmas_Buy()
	local Owner = OwnerID()
	local R = DW_Rand(3)
	if CheckFlag( Owner , 548801) == false then
		if  CountBodyItem( Owner , 203038 ) >=100 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_06]" ) --���N�o��§���a�I	
			if R == 1 then
				GiveBodyItem( Owner ,240997 , 1 )  --�]�˯}�l��§��
			elseif R==2 then
				GiveBodyItem( Owner , 240998 , 1 )  --�ʥF�˹���§��
			else
				GiveBodyItem( Owner , 240999 , 1 ) --�~�����b��§��
			end
			DelBodyItem( Owner , 203038, 100 )  
			SetFlag( Owner , 548800 , 1 )
			DesignLog( Owner , 123235 , "buy xmas gift" ) 
		else
			SetSpeakDetail( Owner , "[SC_111813_YU_36]"  )
		end
	else
		SetSpeakDetail( Owner , "[SC_XMAS_TW_02]" )
	end
end


--�x�V����
function Lua_na_2013_xmas_fairy()
	local Owner = OwnerID()
	if CountBodyItem( Owner , 240997) >= 1 or CountBodyItem( Owner , 240998) >= 1 or CountBodyItem( Owner , 240999) >= 1 then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_07]" )  --�浹�ڨ����A���s�]�˧a�I
		AddSpeakOption( Owner , Owner ,"[SC_XMAS_TW_09]", "Lua_na_2013_xmas_wrap" , 0 ) --�����o��§���ݰ_���ܺ�o�a�I	
	else
		SetSpeakDetail( Owner, "[SC_XMAS_TW_10]" )  --�O���Z�ڭ̡A�A�S�ݨ�ڭ̳��֦����L�ӤF�ܡI
	end	
end


function Lua_na_2013_xmas_wrap()
	local Owner = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	local GiftType = {	[1] = 240997,
				[2] = 240998,	
				[3] = 240999	}
	if CountBodyItem( Owner , 241000) ~= 0 or  CountBodyItem( Owner , 241001) ~= 0 then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_03]" ) -- �A���W�w�g���i�H�ѥ[�洫§�������~�F
	else
		for i = 1 , 3 do
			if PID == i and CountBodyItem( Owner , GiftType[i]) == 1 then
				SetSpeakDetail( Owner, "[SC_XMAS_TW_11]" ) -- �ֱa�۳o��§���h��[123234]�a�I
				DelBodyItem( Owner, GiftType[i] , 1 )
				GiveBodyItem( Owner , 241000 , 1 )
			end
		end

		for j = 1 , 3 do
			if CountBodyItem ( Owner , GiftType[j] ) >= 1 then
				DelBodyItem( Owner , GiftType[j], 1 )
				GiveBodyItem( Owner , 241001 , 1 )
			end
		end
		SetSpeakDetail( Owner, "[SC_XMAS_TW_11]" ) -- �ֱa�۳o��§���h��[123234]�a�I
	end	
end


----------------------------------------------------------------------------------------------------------------------------------------
--���y
----------------------------------------------------------------------------------------------------------------------------------------

Function LuaI_241986() --����§��
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241986]][$SETVAR3=[202434]]"

	local itemset = { 5 ,Prize1Str	, { 202434,1 } --�C����ȭ��m��
		        , 20 ,""	, { 241479,3 } --�ɭ�����
		       , 35 ,""	, { 241480,3 } --�`������
		       , 50 ,""	, { 241481,3 } --�P������
		       , 65 ,""	, { 241482,3 } --�s������
	                     , 80 ,"" 	, { 201139,2 } --�j�ѨϪ��Į�
 		       , 100 ,"" 	, { 240736,3 }} --�n�W�j������
									
	BaseTressureProc7(   itemset , 1 )	
	return true;
end



Function LuaI_241987() --����§��
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241987]][$SETVAR3=[202434]]"

	local itemset = { 5 ,Prize1Str	, { 202434,1 } --�C����ȭ��m��
		        , 20 ,""	, { 241479,5 } --�ɭ�����
		       , 35 ,""	, { 241480,5 } --�`������
		       , 50 ,""	, { 241481,5 } --�P������
		       , 65 ,""	, { 241482,5 } --�s������
	                     , 80 ,"" 	, { 201139,3 } --�j�ѨϪ��Į�
 		       , 100 ,"" 	, { 240736,3 }} --�n�W�j������
			
						
	BaseTressureProc7(   itemset , 1 );
	
	return true;
end



Function LuaI_241976() --�p�ѨϪ�§��
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[202846]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207492]]"
	local Prize3Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207786]]"
	local Prize4Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207788]]"
	local Prize5Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207787]]"


	local itemset = { 5 ,Prize1Str	, { 202846,1 } --�C���]��
		 	       , 13 ,Prize2Str	, { 207492,1 } --�����˹��~�����
			       , 19 ,Prize3Str	, { 207786,1 } --�����H���Z����
			       , 26 ,Prize4Str	, { 207788,1 } --�����H��������
			       , 35 ,Prize5Str	, { 207787,1 } --�����H���˳ƥ�
		     	       , 60 ,"" 	, { 203576,1 } --�j�v�����ײz��		
		     	       , 85 ,"" 	, { 206426,2 } --�j�N���_���լd����
 			       , 100 ,"" 	, { 242629,1 }} --�C����ȧޯ��ľ�
		
	BaseTressureProc7(   itemset , 1 );
	
	return true;
end