--���|���p�ޮa�t��
--�ק���: 2009/05/22
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--����NPC  ���|�����p�ޮa  112588  
------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_cast() --�p�ޮa�ϰ�s��  

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
	SetShop( OwnerID() , 600198 , "Test_Shop_Close" );


	if (ZoneID == 402) then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Show, false )--���	

	else
		while true do				
			SetPlot( OwnerID(), "range", "LuaN_miyon_guildgirl_say", 100 )  

			sleep(6000) --10����					

			local RANDOWN = rand(30)			
				if RANDOWN == 0 then  
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST01]" , C_SYSTEM )
				elseif RANDOWN == 1 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST02]" , C_SYSTEM )
				elseif RANDOWN == 2 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST04]" , C_SYSTEM ) --���Ӫ�[SC_GUILDGIRL_P1_CAST03]�O���~���A�ҥH��04�ɦ�
				elseif RANDOWN == 3 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST04]" , C_SYSTEM )
				elseif RANDOWN == 4 then
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST05]" , C_SYSTEM )
				elseif RANDOWN == 5 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST06]" , C_SYSTEM )
				elseif RANDOWN == 6 then 
					ScriptMessage( OwnerID(), -1,  0, "[SC_GUILDGIRL_P1_CAST07]" , C_SYSTEM )
				elseif RANDOWN == 7 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST08]" , C_SYSTEM )
				elseif RANDOWN == 8 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST09]" , C_SYSTEM )
				elseif RANDOWN == 9 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST10]" , C_SYSTEM )
				elseif RANDOWN == 10 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST11]" , C_SYSTEM )
				elseif RANDOWN == 11 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST12]" , C_SYSTEM )
				elseif RANDOWN == 12 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST13]" , C_SYSTEM )
				elseif RANDOWN == 13 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST14]" , C_SYSTEM )
				elseif RANDOWN == 14 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST15]" , C_SYSTEM )
				elseif RANDOWN == 15 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST16]" , C_SYSTEM )
				elseif RANDOWN == 16 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST17]" , C_SYSTEM )
				elseif RANDOWN == 17 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST18]" , C_SYSTEM )
				elseif RANDOWN == 18 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST19]" , C_SYSTEM )
				elseif RANDOWN == 19 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST20]" , C_SYSTEM )
				elseif RANDOWN == 20 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST21]" , C_SYSTEM )
				elseif RANDOWN == 21 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST22]" , C_SYSTEM )
				elseif RANDOWN == 22 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST23]" , C_SYSTEM )
				elseif RANDOWN == 23 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST24]" , C_SYSTEM )
				elseif RANDOWN == 24 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST25]" , C_SYSTEM )
				elseif RANDOWN == 25 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST26]" , C_SYSTEM )
				elseif RANDOWN == 26 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST27]" , C_SYSTEM )
				elseif RANDOWN == 27 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST28]" , C_SYSTEM )
				elseif RANDOWN == 28 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST29]" , C_SYSTEM )
				elseif RANDOWN == 29 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST30]" , C_SYSTEM )
				elseif RANDOWN == 30 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST31]" , C_SYSTEM )
				elseif RANDOWN == 31 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST32]" , C_SYSTEM )
				elseif RANDOWN == 32 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST33]" , C_SYSTEM )
				elseif RANDOWN == 33 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST34]" , C_SYSTEM )
				elseif RANDOWN == 34 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST35]" , C_SYSTEM )
				elseif RANDOWN == 35 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST36]" , C_SYSTEM )
				elseif RANDOWN == 36 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST37]" , C_SYSTEM )
				elseif RANDOWN == 37 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST38]" , C_SYSTEM )
				elseif RANDOWN == 38 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST39]" , C_SYSTEM )
				elseif RANDOWN == 39 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST40]" , C_SYSTEM )
				elseif RANDOWN == 40 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST41]" , C_SYSTEM )
				elseif RANDOWN == 41 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST42]" , C_SYSTEM )
				elseif RANDOWN == 42 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST43]" , C_SYSTEM )
				elseif RANDOWN == 43 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST44]" , C_SYSTEM )
				elseif RANDOWN == 44 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST45]" , C_SYSTEM )
				end
		end
	end
end

------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_say() 
	Say( TargetID(),"[SC_GUILDGIRL_SAY]")
end
------------------------------------------------------------------------------
--����NPC  ���|�����p�ޮa  112588 ��l���
------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_0() --NPC ���|�����p�ޮa
	local Mission = CheckCompleteQuest( OwnerID(), 423103 ); -- �O�_�����}�Һa�A�ө�������
	local Str = "[SC_YU_GUILDWAR_MG_00]"
	local StrX = "[SC_YU_GUILDWAR_BUILD_69]"
	LoadQuestOption( OwnerID() )
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_00]" ) --�A�n�A�ڬO���|�������p�ޮa�A�ݭn�ڬ��A������A�ȶܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_01]", " LuaN_miyon_guildgirl_01", 0) -- ���|�����\�श��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_02]" , "LuaN_miyon_guildgirl_02", 0 )    -- �d�\�Ҧ����|��T --��۬J��script
	AddSpeakOption(OwnerID(), TargetID(),Str, "LuaYU_GUILDWAR_MG_00", 0 )    -- ���|����²��
	if Mission == true then
		AddSpeakOption(OwnerID(), TargetID(),StrX, " LuaYu_GuildWar_HonorShop", 0) -- �}�Һa�A�ө�
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_03]", " LuaN_miyon_guildgirl_03", 0) -- �ڷQ���}���|����

	if CheckBuff( OwnerID() , 505918 ) == true or CheckBuff( OwnerID() , 505919 ) == true or CheckBuff( OwnerID() , 505920 ) == true then --�M�����|�Ԫ�debuff
		if GetSystime(1) ~= 20 then
			Say(TargetID(),"[SC_YU_GUILDWAR_MG_17]")
			CancelBuff_NoEvent( OwnerID() , 505918 )
			CancelBuff_NoEvent( OwnerID() , 505919 )
			CancelBuff_NoEvent( OwnerID() , 505920 )
		end
	end
end

function LuaYu_GuildWar_HonorShop() --NPC ���|�����p�ޮa
	CloseSpeak(OwnerID())           --������ܵ���
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,  EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,  EM_RoleValue_GuildID ) 

	OpenShop()

end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_01() -- ���|�����\�श��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_10]" ) --������ݭn�ڬ��A�����ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_11]", " LuaN_miyon_guildgirl_11", 0) --���|����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_12]", " LuaN_miyon_guildgirl_12", 0) --���|�ؿv
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_13]", " LuaN_miyon_guildgirl_13", 0) --���|�í�
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_14]", " LuaN_miyon_guildgirl_14", 0) --���|�Ȧ�
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_02() -- �d�\�Ҧ����|��T     
	CloseSpeak(OwnerID())           --������ܵ���
	OpenClientMenu(OwnerID() , EM_ClientMenuType_GuildList )       --���椽�|���C��@��	
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_03() -- �ڷQ���}���|����     
	CloseSpeak(OwnerID())  --������ܵ���
	BeginPlot( OwnerID() , "LuaS_111765_01" , 0 ) 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_11() --���|����
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_20]" ) --���|�����O���|�����@������a(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_21]", " LuaN_miyon_guildgirl_21", 0) --���|��T
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_22]", " LuaN_miyon_guildgirl_22", 0) --���[���|����
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_81]", " LuaN_miyon_guildgirl_23", 0) --�ɯŤ��|����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_21() --���|��T
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_23]" ) --���|�|���i�b�\��C(��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_22() --���[���|����
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_24]" ) --�p�G�Q���[�L�H�����|���� (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_23() --�ɯŤ��|����
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_82]" ) --�p�G�Q���[�L�H�����|���� (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_12() --���|�ؿv
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_30]" ) --�򥻻������e(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_31]", " LuaN_miyon_guildgirl_31", 0) --�p��إ߫ؿv��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_32]", " LuaN_miyon_guildgirl_32", 0) --�ؿv����������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_31() --�p��إ߫ؿv��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_90]" ) --
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_48]", " LuaN_miyon_guildgirl_48", 0) --�سy�ؿv��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_46]", " LuaN_miyon_guildgirl_46", 0) --�����ؿv��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_49]", " LuaN_miyon_guildgirl_49", 0) --�ɯŬ�޾�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_12", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_48() --�سy�ؿv��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_33]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_46() --�����ؿv��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_47]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_49() --�ɯŬ�޾�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_91]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --�^��W�@�h 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_32()--�ؿv����������
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_34]" ) --���U�ӡA�N���A���ЦU���������ؿv���a�I (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_35]" , "LuaN_miyon_guildgirl_35", 0 ) --�@��ؿv
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_36]" , "LuaN_miyon_guildgirl_36", 0 ) --��޾�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_12", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end 
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_35()-- �@��ؿv
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_38]" ) --�@��ؿv (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_32", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_36() -- ��޾�
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_39]" ) --��޾� (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_40]" , "LuaN_miyon_guildgirl_40", 0 ) --��޾�\�श�� - �Ĥ@��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_43]" , "LuaN_miyon_guildgirl_43", 0 ) --��޾�\�श�� - �ĤG��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_44]" , "LuaN_miyon_guildgirl_44", 0 ) --��޾�\�श�� - �ĤT��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_32", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end

--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_40()--��޾�\�श�� �Ĥ@��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --�A�Q�F�ѭ��ج�޾�O�H 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE01]" , "LuaN_miyon_guildgirl_tree01", 0 ) --�ǰ|
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE02]" , "LuaN_miyon_guildgirl_tree02", 0 ) --�A��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE03]" , "LuaN_miyon_guildgirl_tree03", 0 ) --�M�Ҽt
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE04]" , "LuaN_miyon_guildgirl_tree04", 0 ) --�Ϯ��]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE05]" , "LuaN_miyon_guildgirl_tree05", 0 ) --���\
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE06]" , "LuaN_miyon_guildgirl_tree06", 0 ) --���t
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_43()--��޾�\�श�� �ĤG��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --�A�Q�F�ѭ��ج�޾�O�H 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE07]" , "LuaN_miyon_guildgirl_tree07", 0 ) --�ճ�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE08]" , "LuaN_miyon_guildgirl_tree08", 0 ) --�u�ö�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE09]" , "LuaN_miyon_guildgirl_tree09", 0 ) --�L�u�t
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE10]" , "LuaN_miyon_guildgirl_tree10", 0 ) --�A������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE11]" , "LuaN_miyon_guildgirl_tree11", 0 ) --�[�u�t
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_44()--��޾�\�श�� �ĤT��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --�A�Q�F�ѭ��ج�޾�O�H 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE12]" , "LuaN_miyon_guildgirl_tree12", 0 ) --�L�ıj���
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE13]" , "LuaN_miyon_guildgirl_tree13", 0 ) --���慨����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE14]" , "LuaN_miyon_guildgirl_tree14", 0 ) --�]���@���
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE15]" , "LuaN_miyon_guildgirl_tree15", 0 ) --���֦�����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE16]" , "LuaN_miyon_guildgirl_tree16", 0 ) --���t�ǲ߶�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE17]" , "LuaN_miyon_guildgirl_tree17", 0 ) --���_�B�ն�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree01() --�ǰ|
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE01W]" ) --�ǰ|���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree02() --�A��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE02W]" ) --�A�Ф��Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree03() --�M�Ҽt
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE03W]" ) --�M�Ҽt���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree04() --�Ϯ��]
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE04W]" ) --�Ϯ��]���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree05() --���\
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE05W]" ) --���\���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end

--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree06() --���t
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE06W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree07() --�ճ�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE07W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree08() --�u�ö�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE08W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree09() --�L�u�t
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE09W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree10() --�A������
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE10W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree11() --�[�u�t
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE11W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree12() --�L�ıj���
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE12W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree13() --���慨����
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE13W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree14() --�]���@���
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE14W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree15() --���֦�����
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE15W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree16() --���t�ǲ߶�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE16W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree17() --���_�B�ն�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE17W]" ) --���Ф��e (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_13() --���|�í�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_50]" ) --���|�íѪ��ާ@�覡�M�\�]�b�ӤH�p�άۦP(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_51]", " LuaN_miyon_guildgirl_51", 0) --�T�{�v��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 

end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_51() --�T�{�v��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_57]" ) --�T�{�v��(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_52", 0) --�U�@�B
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_52() --���o�í�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_58]" ) --���o�í�(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_53", 0) --�U�@�B
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_51", 0) --�W�@�B
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_53() --��J�íѦC��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_59]" ) --��J�íѦC�� (��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_54", 0) --�U�@�B
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_52", 0) --�W�@�B
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_54() --�\��í�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_60]" ) --�\��í�(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_55", 0) --�U�@�B
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_53", 0) --�W�@�B
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_55() --�s��í�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_61]" ) --�s��í�(��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_56", 0) --�U�@�B
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_54", 0) --�W�@�B
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_56() --�^���í�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_62]" ) --�^���í�(��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_13", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
---------------------------------------------------------------------------------
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_14() --���|�Ȧ�
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_70]" ) --���|�Ȧ洣�Ѥ��|�����s��U�ت��~ (��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_71]", " LuaN_miyon_guildgirl_71", 0) --�p��ϥΦs���\��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_72]", " LuaN_miyon_guildgirl_72", 0) --�\��ﶵ����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 	
function LuaN_miyon_guildgirl_71() --�p��ϥΦs���\��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_73]" ) --�p��ϥΦs���\�� (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_14", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_72() --�\��ﶵ����
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_74]" ) --�U�謰���|�Ȧ檺�ﶵ�����A�ݭn�ڬ��A�������@���O�H
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_75]", " LuaN_miyon_guildgirl_75", 0) --�s������ 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_76]", " LuaN_miyon_guildgirl_76", 0) --�v���]�w
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_77]", " LuaN_miyon_guildgirl_77", 0) --�ʶR�s��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_14", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_75() --�s������ 
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_78]" ) --�s������ (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_76() --�v���]�w
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_79]" ) --�v���]�w (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_77() --�ʶR�s��
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_80]" ) --�ʶR�s�� (��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --�^��W�@�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end
--------------------------------------------------------------------------------- 

function LuaU_GuildWar_Title_01() --�R���Ҧ��a�A�Y��

	local Title = 0

	for i = 0 , 27 do
		Title = 530433 + i
		DelBodyItem(OwnerID(),Title,1) --�������~
	end

	SetFlag( OwnerID()  , 543768 , 0 )
end
--------------------------------------------------------------------------------- 
function LuaU_GuildWar_Title_02() --��o�Ҧ��a�A�Y��

	local Title = 0

	for i = 0 , 27 do
		Title = 530433 + i
		GiveBodyItem( OwnerID() , Title , 1 ) --�������~
	end
end

---------------------------------------------------------------------------------
function LuaYU_GUILDWAR_MG_00() -- ���|����²��
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_01]" ) --���|���ԤD�_�I�̨�|�w���A���F�����|���i�H���ۥ�y�A�������r�B���R���|�쪺���j�v�ɡC�L�׳ӱѳ��N�]���ѻP�A��o�_�Q����Ըg��P���ɯ�O���a�A�Y�ΡC
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_02]", "LuaYU_GUILDWAR_MG_01", 0) --�ѾԳW�h
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_03]", "LuaYU_GUILDWAR_MG_02", 0) --���|�س]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_W9_01]", "LuaYU_GUILDWAR_MG_03", 0) --�𫰾���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_04]", "LuaYU_GUILDWAR_MG_04", 0) --���Լ��y
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --�^��D��� 
end

function LuaYU_GUILDWAR_MG_01() -- �ѾԳW�h
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_05]" ) --���|���Ԯɨ��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_06]", " LuaYU_GUILDWAR_MG_01_1", 0) --�귽����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_07]", " LuaYU_GUILDWAR_MG_01_2", 0) --�v�ɨ��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_08]", " LuaYU_GUILDWAR_MG_01_3", 0) --�S���O
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_09]", " LuaYU_GUILDWAR_MG_01_4", 0) --���`�v�T
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_02() -- ���|�س]
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_14]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_03() -- �𫰾���
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_15]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_04() -- ���Լ��y
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_16]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_01_1() -- �귽����
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_10]" ) --�귽����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_01_2() -- �v�ɨ��
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_11]" ) --�v�ɨ��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_01_3() -- �S���O
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_12]" ) --�S���O
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --�^��W�@�h 
end

function LuaYU_GUILDWAR_MG_01_4() -- ���`�v�T
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_13]" ) --���`�v�T
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --�^��W�@�h 
end