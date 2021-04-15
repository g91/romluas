function LuaS_Tahadi_event_na()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��

	if CheckBuff ( OwnerID() , 509693 ) ==false then  --�����PNPC��ܡA�M�����Ǫ��p��
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem9 , 0 )
		AddBuff( OwnerID(), 509693 , 0, -1)
		local U =ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem9 )
	--	Say( OwnerID(), U )
	end
	
	SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_MAIN]")  --���F��U���ť���30�Ū��~���_�I�̡A�ڭ̯M���F�@�Ǭ����������Z�w...�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_01]", "LuaS_RamadanDate_menu_na",0 )--������Ǫ��`��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_02]", "LuaS_Tahadi_package_na",0 ) --����ֳt�ɯ�§�]

end



function LuaS_RamadanDate_menu_na()

	SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_03]")   -- ���Ǭ��ʻ�����  [SC_Tahadi_event_03]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_04]","LuaS_check_RamadanDate_na",0 ) --�d�ߤw�^�m�����Ǽƶq 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_05]", "LuaS_receive_RamadanDate_na",0 ) --ú����� 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_12]", "LuaS_Tahadi_event_na",0 ) --�^��W�@��

	
end



function LuaS_check_RamadanDate_na()
	local dateamount = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9 )
	--Say( OwnerID(), dateamount )
	CloseSpeak ( OwnerID())
	ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_06][$SETVAR1=".. dateamount.."]"  , C_SYSTEM)  --�{�b�A�֭p�����Ǽƶq�@[$VAR1]��  [SC_Tahadi_event_06]

end



function LuaS_receive_RamadanDate_na()
	local X =CountBodyItem( OwnerID(), 207945) --�ˬd���a���W�����Ǽƶq

	--Say( OwnerID(), X )
	if X >= 1 then
		local Y =ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9 )	
		local Z = X + Y
	--Say( OwnerID(), Y )
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9, Z )  
		DelBodyItem( OwnerID(), 207945, X )
	--Say( OwnerID(), Z )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_07][$SETVAR1="..X.."][$SETVAR2="..Z.."]" , C_SYSTEM )  --�A�wú�����[$VAR1]�ӡA�ثe�A�ֿn�������`�Ƭ�[$VAR2]
		CloseSpeak ( OwnerID())
	elseif X ==0 then	
		SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_08]") --�A�����W�ثe�S���������	
	end

end



function LuaS_Tahadi_package_na()
	local LV = ReadRoleValue( OwnerID(), EM_RoleValue_LV )
	
	if LV <=30 then
		if CheckFlag( OwnerID() ,542189) == true then
			SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") -- �A���Ѥw�g����L�F�A���ѦA�ӧa�C
		else 
			GiveBodyItem( OwnerID(), 207947, 1 ) --����§�]
			SetFlag( OwnerID(), 542189, 1) 
			SetSpeakDetail( OwnerID(),  "[SC_TAHADI_EVENT_09]")  --�Ʊ�o��§�����A�������U�C
		end

	else 
		SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_10]")  --�A�w�g�W�L�i���§�]������	
	
	end
end		



Function LuaI_207947() --�ɯŻ��U�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 207946,1 , 203489 ,5 }		 }

	return BaseTressureProc(   itemset , 2  )
end



function LuaS_Datetest_na()    --���ձM�Ϋ��O

	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9, 0 )  
	Say( OwnerID(), "clear")

end



	
function LuaI_Tahadi_lvcheck()
	local LV = ReadRoleValue( OwnerID(), EM_RoleValue_LV )
	if LV <=30 then
		return TRUE		
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_11]"  , C_SYSTEM)
		return false
	
	end
end		
	