--------------------------------------------------------------------------------------------
--����NPC 121396 ������
--------------------------------------------------------------------------------------------
function Lua_na_121396_speak() --��ܼ@��
	local Owner = OwnerID()
	local Target = TargetID()
	local BuffID = 623456
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	if CheckFlag( Owner ,  547022 ) == true then --����w�g����L���y
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC06]") --�A�O�_�]�|����ı�o����@�}�D�N�O�H�ר�O�̪񪺱��p�S�O�W�c�I
	elseif CheckFlag( Owner ,  547021 ) == true then --�p�G���a�w�g�������ʡA������y
		if CheckBuff( Owner , BuffID ) == true then --�p�G���a����찭�F
			if BuffLv > 9 then -- 10 ��{�ܤ�����I
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC08]") 
				if BuffLv >= 14 then  -- 15
					GiveBodyItem( Owner , 530794 , 1 ) --���ٸ� "�D�W�I�⪺�찭�j�v"
				end
				GiveBodyItem( Owner , 209433 , 3 )
			elseif BuffLv >= 5 and  BuffLv <= 9 then  --6~10
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC09]") --��{�ٺ�i�H�I	
				GiveBodyItem( Owner , 209433 , 2 )
			elseif  BuffLv <=4 then -- 1~5
				SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC10]") --�ӻ��O����ܡH
				GiveBodyItem( Owner , 209433 , 1 )
			end
			CancelBuff( Owner , 623456 )	--�R�� �v�����������F
			CancelBuff( Owner , 623443 )	
			CancelBuff( Owner , 623439 )			

		else --���W�S�����F
			SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC07]") --�Ӥ��|�O�˲��ݨ찭�F����A�N�`�Ȱh�Y�F�a�H
			GiveBodyItem( Owner , 724059 , 1 )

		end
		SetFlag( Owner , 547022 , 1 ) --�}�Ҥw������y�X��
		Lua_Festival_10_All(Owner)

	elseif CheckBuff( Owner , 623442) == true then --�p�G���a���b�i�次��
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC05]")
	else
		SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC01]") --�A�O�_�]�|����ı�o����@�}�D�N�O�H�ר�O�̪񪺱��p�S�O�W�c�I ...
		AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT1]" ,  "Lua_na_121396_speak2",0 ) --�ѥ[�u�찭�v���V�m�ҵ{
		AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT2]" ,  "Lua_na_121396_speak3",0 ) --��K�찭�ڡK�K�ڦA�Ҽ{�@�U�n�F�K�K
	end
end


function Lua_na_121396_speak2() --�ѥ[����
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC02]") --�W�h����
	AddSpeakOption( Owner , Owner ,"[SC_2012_GHOST_OPT3]" ,  "Lua_na_121396_start",0 ) --�찭���u�@�N�浹�ڡI
end


function Lua_na_121396_speak3() --���ѥ[����
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GHOST_NPC03]") --�Ʊ�A��A�Ҽ{�ݬ�
end


function Lua_na_121396_start() --���ʶ}�l�A�������a5����������BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner , EM_RoleValue_LV_SUB )
	DesignLog( Owner , 121396 , "Lv = "..Lv.." SubLv = "..SubLv )  --�^�Ǭ��ʰѻP��
	CloseSpeak( Owner)
	ScriptMessage( Owner , Owner , 2 , "[SC_2012_GHOST_NPC04]" , C_SYSTEM) --�h�a�I�h�i�{�A������a�I
	AddBuff( Owner ,623442 , 0 , -1 ) --�F������
	AddBuff( Owner ,623440 , 0 , -1 ) --���a�ޯ�
end


-------------------------------------------------------------------------------------------
--���F���P�_�@��
-------------------------------------------------------------------------------------------
function Lua_na_2012_ghost() -- ���F����l�@��
	local Owner = OwnerID() -- ���F
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
	while true do --���F�j�M
		local P = SearchRangePlayer( Owner , 20 ) --���a����ӱ����F
		local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1)
		
		if Reg1 ~= 0 then
			Lua_na_2012_ghost_hide()

		elseif Reg1 == 0 then
			SysCastspellLv( Owner , Owner , 499669, 0 ) --�I�i���νd��k�Ne
			if table.getn(P) >= 1 then --�p�G�d�򤤦����a
				for i = 0 , table.getn(P) do
					if CheckBuff( P[i] , 623442 ) == true and CheckBuff( P[i] , 623443) == false then 
						WriteRoleValue( Owner , EM_RoleValue_Register1 , 1 )	
						PlayMotion( Owner ,ruFUSION_MIME_BUFF_SP01)
						SysCastspellLv( Owner , Owner , 499672, 0 ) --�I�񮣷W
					--	Say( Owner , "YES" )
						break
					end
				end
			end
		end
		sleep( 10 )
	end
end


function Lua_na_2012_ghost_hide()
	local Owner = OwnerID()
	local R = Rand(3)+2
--	Say( Owner , "HIDE")
	Hide( Owner)
	Sleep( R*100) --20 / 30 / 40��A����
	Show( Owner , 0) 
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
end


function Lua_na_2012ghost_spell()
	local Owner = OwnerID() --npc
	local Target = TargetID() --���a

--	Sleep(30)
	if CheckBuff ( Target , 623442 ) == true and CheckBuff ( Target , 623443 ) == false then --�ؼЬ����ѥ[���ʪ����a
		WriteRoleValue( Owner , EM_RoleValue_Register1 , 2 )	
	--	Say( Owner ,  "R = "..ReadRoleValue( Owner ,  EM_RoleValue_Register1) )
		ScriptMessage( Target , Target , 1 , "[SC_2012_GHOST_MES1]" , 0)  --�J�M�A�K�ݪ����K�ڡK�K�K���N�K�P���K���ߧa�K�K 
		ScriptMessage( Target , Target , 2 , "[SC_2012_GHOST_MES8]" , 0)  --�֨ϥΧޯण�ȡI���ȡI�A�����ߤ������ߡC
		SysCastspellLv( Owner , Target , 499570 , 0 )
		AddBuff( Target , 623443 , 0 , -1)
		AddBuff( Target , 623439 , 4, -1) 
		BeginPlot( Target , "Lua_na_ghost_cry", 0)
		AdjustFaceDir(Owner, Target , 180 ) --���V �I��
		WriteRoleValue( Owner  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
		Lua_MoveLine( Owner , 40 ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
	else --�S���ѥ[���ʪ����a
		ScriptMessage( Target , Target, 2 , "[SC_2012_GHOST_MES0]" ,  0 ) --�I���M�P����@�ѴH�N�K�K
	end
end 


function Lua_na_2012_Ghost_JoinPlayer() --���W���ˬd���a�O�_���ѥ[�@��
	local Target = TargetID()
	if CheckBuff( Target , 623442) == true and CheckBuff( Target , 623443) == false then --�ˬd�ؼЪ��a�O�_���ѥ[����
		return TRUE
	else
		return FALSE
	end
end
		


-------------------------------------------------------------------------------------------
--�������F�A�ˬd�ؼЬO�_�����F 499670
-------------------------------------------------------------------------------------------
function Lua_na_2012_Ghost_Tar() --�R�����~BUFF�A�ˬd�ۤv�O�_�����~BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Ghost = 121395
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	
	if  OrgID ~= Ghost then --�ؼФ��O���F
		ScriptMessage( Owner , Owner , 1 , "[SC_422202_5]" , 0 )
		return false
	else -- �S�����~
		return true	
	end	
end


function Lua_na_ghost_cry()  --���a������_���ʧ@
	local Owner =OwnerID() 	
--	while true do
	for i = 1 , 2 do
		if CheckBuff( Owner , 623439 ) == true then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_EMOTE_CRY)		
		else
			break
		end
		Sleep(30)
	end
end

---------------------------------------------------------------------------------------------------------------------------------
--���a�ϥΪ��ޯ�
---------------------------------------------------------------------------------------------------------------------------------
function Lua_na_ghost_catch_check() --�������F
	local Owner = OwnerID() --���a
	local Target = TargetID() --���F
	local reg1 = ReadRoleValue( Target , EM_RoleValue_Register1 ) 
	
	if CheckID( Target) == true then
		if CheckBuff( Owner , 623442 ) == true then --�p�G���a���W��"�F������"BUFF�|������
			if reg1 ~= 0  then -- ���F���i�H����
				ScriptMessage( Owner , Owner , 1 , "[SC_2012_GHOST_MES2]" , 0)  --�L�k�����ؼСI
				return false
			else
				return true
			end
		else
			ScriptMessage( Owner , Owner , 2 , "[SC_2012_GHOST_MES3]" , 0) --�L�k�P����[121395]�C
			return false					
		end	
	else
		ScriptMessage( Owner , Owner ,1 , "[SC_2012_GHOST_MES4]" , 0) --[121395]�w�g�����C	
		return false
	end
end


function Lua_na_ghost_catch() --�������F
	local Owner = OwnerID() --���a
	local Target = TargetID() --���F
	local reg1 = ReadRoleValue( Target , EM_RoleValue_Register1 ) 
	if reg1 == 0 then
		AddBuff( Owner , 623455 , 0 , -1 ) --�I�t�����F�A�|+BUFF�@�h�A �C�@�h�|���C�]�t1%
		WriteRoleValue( Target , EM_RoleValue_Register1 , 1 )	
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GHOST_MES2]" , 0)  --�L�k�����ؼСI
	end
end



function Lua_na_2012_ghost_Delsk() --"���Ȥ���"�A�d�ߪ��a���W�O�_�����~��BUFF�A�����ܧR���@�h
	local Owner = OwnerID()
	local Target = TargetID()
	local BuffID = 623439
	local BuffLv =  FN_CountBuffLevel(Target,BuffID)
--	Say( Owner , BuffLv )

	if BuffLv >=1 then
		Cancelbuff( Target , BuffID)
		AddBuff(Target ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Target , BuffID)	
		Cancelbuff_NoEvent( Target , 623443)
	--	Say( Owner, "CANCEL" )
	else
		ScriptMessage( Owner, Owner , 2 , "[SC_2012_GHOST_MES6]" , 0 ) --�ثe����í�w�A�S�����ߪ��Pı�C
	end
end


function Lua_na_2012_ghost_delbuff() --�Y�O�ɶ����S���������W�����~BUFF�A���ʵ���
	local Owner = OwnerID()
	--�R�����ʬ���BUFF
	CancelBuff(Owner , 623439) --���~BUFF 
	if CheckBuff( Owner , 623442 ) == true then
		CancelBuff(Owner , 623442) -- �F������ BUFF 
	end
end



function Lua_na_ghost_buffend() --�F��BUFF��������A�έp����
	local Owner = OwnerID()
	local BuffID = 623455
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
--	DebugMsg( Owner , 1, "SPELL" ) 
	SetFlag( Owner , 547021 , 1 ) --�������ʵ����i��FLAG
	Cancelbuff( Owner , 623443)
	CancelBuff(Owner , 623440) --���ʧޯ�
	if BuffLv >=0 then
		CancelBuff ( Owner , BuffID ) --�R�����F�p��BUFF
		ScriptMessage( Owner , Owner , 3 , "[SC_2012_GHOST_MES5]" , 0) --�b���F�ò�����e�A�ȧ֥浹[121396]�C
		AddBuff( Owner , 623456 , BuffLv , -1 )  --�������ɶ������F�p��BUFF
	else
		ScriptMessage( Owner , Owner , 3 , "[SC_2012_GHOST_MES7]" , 0 ) --�V�����s���Ϫ�[121396]�^�����G�C
	end
end


-----------------------------------------------------------------
--���ի��O
-----------------------------------------------------------------
function Lua_na_ghost_join() --�i�次�ʪ����A
	local Owner = OwnerID()
	AddBuff( Owner ,623442 , 0 , -1 ) --�F������ 3�h
	AddBuff( Owner ,623440 , 0 , -1 ) --���a�ޯ�
end



function Lua_na_ghost_delflag() --�R�����ʬ����X��
	local Owner = OwnerID()
	SetFlag( Owner , 547021 , 0 )
	SetFlag( Owner , 547022 , 0 )
	say( Owner , "CLEAR!")
end


function Lua_na_ghost_addbuff(LV) --�W�[�p��BUFF�A�ϥ�PCALL�A��J�h��BUFF
	addbuff( OwnerID(), 623455 , LV , -1 )
end