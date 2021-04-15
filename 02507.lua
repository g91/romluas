function ic_22_npc_buff()								
	AddBuff(OwnerID(),507111,0 ,-1 )
end
function ic_22_npc()								
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545753 ) ==false then
			AddSpeakOption(own,tar,"[SC_424516_00]","ic_22_npc_1",0)
		else
			LoadQuestOption(own)
		end
end
function ic_22_npc_1()	  							
	local own = OwnerID()
	local tar = TargetID()
	GiveBodyItem( OwnerID(), 545753, 1 )
	SetSpeakDetail( own, "[SC_424776_BOOK_6]" )
end
function ic_zone22_BOSS1KO_ok()---�������X�� ���`���ȥ�
GiveBodyItem( TargetID(), 545766, 1 )
end 
-----------------------------------�]�k�Ф�
function ic_zone22_uuu_1()--�]�k�Ф�
SetPlot(OwnerID(),"touch","ic_zone22_uuu_2",10)
end
function ic_zone22_uuu_2()---��1���ȺX��  �C��X�� ���S�����~
local player = OwnerID() 	-- ���a
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545764 ) ==false  then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 148, 150, 0, "ic_zone22_uuu_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end
end
function ic_zone22_uuu_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( OwnerID(), 240753, 1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_uuu()----�ϥΪ��~���o���ȥ�
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 424777 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424777, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_uuu_ok()---�������X�� ���`���ȥ�
GiveBodyItem( TargetID(), 545764, 1 )
end
-----------------------------------���K��
function ic_zone22_flower_ok()---�������X�� ���`���ȥ�
GiveBodyItem( TargetID(), 545755, 1 )
end 
function ic_zone22_flower_xx()---�����R����� ���`���ȥ�
SetScriptFlag( TargetID(), 545755, 0 )
end 
function ic_zone22_flower_ok_day()---�������X�� �������ȥ�
GiveBodyItem( TargetID(), 545755, 1 )
Lua_ZonePE_3th_GetScore(100)
end 
function ic_zone22_flower_xx_day()---�����R����� �������ȥ�
SetScriptFlag( TargetID(), 545755, 0 )
Lua_ZonePE_3th_GetScore(250)
end
---CheckQuest(���ȸ��X)   =0(�٨S������) =1(���F����) =2(��������)

-----------------------------------�ë�k�}
function ic_zone22_book()----�ϥΪ��~���o���ȥ�
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 424776 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424776, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_book_ok()---�������X��
GiveBodyItem( TargetID(), 545754, 1 )
end 
function ic_zone22_book_1_1()--�ϧܤ�U
SetPlot(OwnerID(),"touch","ic_zone22_book_1_2",15)
end
function ic_zone22_book_1_2()---��1���ȺX��  �C��X�� ���S�����~
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--��l�ƥ۸O����
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_1]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end		
end	

function ic_zone22_book_2_1()--�������
SetPlot(OwnerID(),"touch","ic_zone22_book_2_2",15)
end
function ic_zone22_book_2_2()---��1���ȺX��  �C��X�� ���S�����~
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--��l�ƥ۸O����
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_2]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

function ic_zone22_book_3_1()--���ˮѥ�
SetPlot(OwnerID(),"touch","ic_zone22_book_3_2",15)
end
function ic_zone22_book_3_2()---��1���ȺX��  �C��X�� ���S�����~
local player = OwnerID() 	-- ���a
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545754 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
		ClearBorder( OwnerID())			--��l�ƥ۸O����
		AddBorderPage( OwnerID(), "[SC_424776_BOOK_3]" )
		ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545754 ) ==false then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_USEOBJ_01]", 30, 131, 133, 0, "ic_zone22_book_3_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end
end
function ic_zone22_book_3_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( OwnerID(), 240652, 1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_book_4_1()--�⥾
SetPlot(OwnerID(),"touch","ic_zone22_book_4_2",15)
end
function ic_zone22_book_4_2()---��1���ȺX��  �C��X�� ���S�����~
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--��l�ƥ۸O����
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_4]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

function ic_zone22_book_5_1()--�]�k�~�O�ƥ�
SetPlot(OwnerID(),"touch","ic_zone22_book_5_2",15)
end
function ic_zone22_book_5_2()---��1���ȺX��  �C��X�� ���S�����~
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--��l�ƥ۸O����
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_5]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

-----------------------------------�B������ 545758=��1���Ȧ����L  545757=��1���ѧ� 545756=����C��
function ic_zone22_ooo()----�ϥΪ��~���o���ȥ�
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 424775 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424775, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_ooo_1()--��
SetPlot(OwnerID(),"touch","ic_zone22_ooo_1_1",10)
end
function ic_zone22_001_ok()---�������X��
GiveBodyItem( TargetID(), 545757, 1 )
end
function ic_zone22_ooo_1_1()---
local player = OwnerID() 	-- ���a
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 545756 ) ==true or
	   CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 546251 ) ==true then			
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_1_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end
	if CheckScriptFlag( player, 545758 ) ==true and 
	   CheckScriptFlag( player, 545757 ) ==false then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_1_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end	
end	
function ic_zone22_ooo_1_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240335, 1 )
			AddBuff(player,621091,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end		
function ic_zone22_ooo_1_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240755, 1 )
			AddBuff(player,621091,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end		
function ic_zone22_ooo_2()--�B
SetPlot(OwnerID(),"touch","ic_zone22_ooo_2_1",10)
end
function ic_zone22_ooo_2_1()
local player = OwnerID() 	-- ���a
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 545756 ) ==true or
	   CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 546251 ) ==true then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_2_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end
	if CheckScriptFlag( player, 545758 ) ==true and 
	   CheckScriptFlag( player, 545757 ) ==false  then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_2_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end	
end
function ic_zone22_ooo_2_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240336, 1 )
			AddBuff(player,621092,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_ooo_2_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240756, 1 )
			AddBuff(player,621092,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	