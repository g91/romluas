--�x�V�𪺲��ͼ@��
function Lua_xmastree_na_begin()--���󲣥ͼ@��
		BeginPlot( OwnerID(), "Lua_xmastree_na_decrease", 0) --�C1����PID�Ȼ���
end


function Lua_xmastree_na_decrease()	--�x�V��˹�������
	while true do
		sleep(600)  --�C�@����PID -1 
		BeginPlot( OwnerID(), "Lua_xmastree_na_decrease2", 0 )
	end
end


function Lua_xmastree_na_decrease2()	--�x�V��˹�������
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
--	Say( OwnerID(), "A="..Y) - �쥻��PID��
	if Y > 1500 then
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , 1500 )
	elseif Y<=1500 and Y> 0 then
		WriteRoleValue ( OwnerID(), EM_RoleValue_PID , Y-1 )
	elseif Y<=0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , 0 )
	end
	local NEW= ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --�A���ŧipid�ȡA�T�w�g�JNPC
--	Say( OwnerID(), "NOW="..NEW) ����᪺PID��
	BeginPlot(OwnerID(), "Lua_xmastree_na_motion", 0)
	sleep( 30 )
end


function Lua_xmastree_na_motion() --���I�m���x�V��~��
	local Y = ReadRoleValue( OwnerID(), EM_RoleValue_PID ) 
--	say( OwnerID(), "before="..Y)
	if Y < 50 then
		ChangeObjID( OwnerID(), 116657  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --�N�쥻���骺PID�ȼg�J�s���x�V��W
	elseif Y >= 50 and Y <500  then
		ChangeObjID( OwnerID(), 116658  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --�N�쥻���骺PID�ȼg�J�s���x�V��W
	elseif Y >= 500 and Y < 1000 then
		ChangeObjID( OwnerID(), 117033  )	
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --�N�쥻���骺PID�ȼg�J�s���x�V��W
	elseif Y >=1000 then
		ChangeObjID( OwnerID(), 117034  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --�N�쥻���骺PID�ȼg�J�s���x�V��W
	end
	local NEW = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
--	say(OwnerID(), "after="..NEW)
end


--�x�V���ܼ@��
function LuaS_xmastree_na_menu()
	SetSpeakDetail( OwnerID(), "[SC_XMASTREE_MAIN]")   -- �˹��x�V�𻡩��� �]�����Űӷ|�S�O�]�m�����j�x�V��A�ܽЩҦ��H�@�P�w�y�x�V�`�C�^
	AddSpeakOption( OwnerID(), TargetID(), "[SC_XMASTREE_04]"," Lua_xmastree_na_decorate",0 ) -- �ڭn�˹��x�V��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_XMASTREE_05]", "Lua_xmastree_na_gift",0 ) --����x�V��§��
end	


function Lua_xmastree_na_decorate()
	-- OwnerID = ���a
	--TargetID = �x�V��
	CloseSpeak( OwnerID())
	local A = Countbodyitem( OwnerID(), 208471)
	local B = Countbodyitem( OwnerID(), 208574)
	local C = Countbodyitem( OwnerID(), 208575)
	if A>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208471, A )	--�R�����a���W�����~
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 10*A+Y )	 --�[�W���~���ƶq
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 10*A+X) --���a���W�g�JUSE ITEM��
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --�A���ŧipid�ȡA�T�w�g�JNPC
--		Say( OwnerID(), "1="..NEW)
	end
	if B>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208574, B )	--�R�����a���W�����~
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 30*B+Y )	 --�[�W���~���ƶq
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 30*B+X) --���a���W�g�JUSE ITEM��
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --�A���ŧipid�ȡA�T�w�g�JNPC
--		Say( OwnerID(), "2="..NEW)
	end
	if C>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208575, C )	--�R�����a���W�����~
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 50*C+Y )	 --�[�W���~���ƶq
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 50*C+X) --���a���W�g�JUSE ITEM��
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --�A���ŧipid�ȡA�T�w�g�JNPC
--		Say( OwnerID(), "3="..NEW)
	end
	if A <1 and B<1 and C<1 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASTREE_02]" , C_SYSTEM )  --�A���W�S���x�V�𪺸˹��~ 
--		Say( OwnerID(), "NO!" )	
		return false
	else
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASTREE_01]" , C_SYSTEM )  --�A�w�g�N�˹��~���b��W�F�C 
		BeginPlot( TargetID(), "Lua_buffreward_na",0)
		BeginPlot( OwnerID(), "Lua_checkbuff_na",0)
	end
	BeginPlot( OwnerID(),"Lua_xmastreetitle_na",0)
	BeginPlot( TargetID(), "Lua_xmastree_na_motion", 0 )
end


function Lua_xmastreetitle_na() --�˹��x�V���Y�ΧP�_
	local Y = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem23) 
	if Y >= 500 and Y < 1000 then
		GiveBodyItem( OwnerID(), 530661, 1 )
	elseif Y >= 1000 then
		GiveBodyItem( OwnerID(), 530662, 1 )
	end
end


function Lua_checkbuff_na() --�@�����ʵ�����M�����aUSEITEM�ȥ�
	local S= CheckBuff( OwnerID(), 508271) 
	if S ~= TRUE then
	 AddBuff( OwnerID(), 508271, 1, 1209600) --����2�g ,�ɶ�1��1��
	end
end


function Lua_buffreward_na() --�������ȷx�V�𵹪��a��BUFF
	CancelBuff(TargetID(), 508118)
	CancelBuff(TargetID(), 508119)
	CancelBuff(TargetID(), 508125)
	CancelBuff(TargetID(), 508126)
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
	if Y <50 then
		AddBuff (TargetID(), 508118, 1 , 1800)
	elseif Y>=50 and Y < 500 then
		AddBuff (TargetID(), 508119, 1 , 1800)
	elseif Y>=500 and Y < 1000 then
		AddBuff (TargetID(), 508125, 1 , 1800)
	elseif Y>=1000  then
		AddBuff (TargetID(), 508126, 1 , 1800)
	end
end


function Lua_xmastree_na_gift() --�ˬd���a
	-- Owner = ���a
	if CheckBuff ( OwnerID(),508271) ==true then
		if CheckFlag( OwnerID(), 544421) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") -- �A���Ѥw�g����L�F�A���ѦA�ӧa�C
		else
		local Y = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem23) 
			if Y < 100 then
				GiveBodyItem( OwnerID(), 720293, 1 ) 
			elseif Y >= 100 and Y < 300 then
				GiveBodyItem( OwnerID(), 720293, 1 )
				GiveBodyItem( OwnerID(), 725522, 1 )
			elseif Y >= 300 then
				GiveBodyItem( OwnerID(), 720293, 1 )
				GiveBodyItem( OwnerID(), 725520, 1 )
				GiveBodyItem( OwnerID(), 725522, 1 ) 
			end
			SetFlag( OwnerID(), 544421, 1) 
			SetSpeakDetail( OwnerID(),  "[SC_XMASTREE_03]")  --�]�q�x�V��W���o�@��§���I�^
		end
	else
			SetSpeakDetail( OwnerID(),  "[SC_XMASTREE_06]")  --�]�A�����n���ѻP�L�˹��x�V�𪺬��ʡA�~������§���I�^
	end
end



--�M���x�V�`��USEITEM��
function Lua_Clear_XMAS_USEITEM_na()  --���b�x�V�𬡰�����BUFF�ABUFF�����ɲM��USEITEM��
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 0)
end


--============���ի��O================
--�ˬd�x�V��ثe��PID��
function Lua_CheckPID_na()
	local T1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116657, 500 , 0)       --�x�V��1
	local T2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116658, 500 , 0)       --�x�V��2
	local T3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117033, 500 , 0)       --�x�V��3
	local T4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117034, 500 , 0)       --�x�V��4
	local Y1 = ReadRoleValue( T1 , EM_RoleValue_PID ) 
	local Y2 = ReadRoleValue( T2 , EM_RoleValue_PID ) 
	local Y3 = ReadRoleValue( T3 , EM_RoleValue_PID ) 
	local Y4 = ReadRoleValue( T4 , EM_RoleValue_PID ) 
	Say( OwnerID(), "A="..Y1.." or B="..Y2.." or C="..Y3.." or D="..Y4)
end


function Lua_ClearPID_na()
	local T1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116657, 500 , 0)       --�x�V��1
	local T2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116658, 500 , 0)       --�x�V��2
	local T3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117033, 500 , 0)       --�x�V��3
	local T4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117034, 500 , 0)       --�x�V��4

	WriteRoleValue( T1, EM_RoleValue_PID, 0)
	WriteRoleValue( T2, EM_RoleValue_PID, 0)
	WriteRoleValue( T3, EM_RoleValue_PID, 0)
	WriteRoleValue( T4, EM_RoleValue_PID, 0)
	Say( OwnerID(), "Clear!")
end

function Lua_CheckUSE23_na()
	Say( OwnerID(), ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23) )
end


function Lua_Delbuff_na() --�R���P�_�˹�����BUFF
	local S= CheckBuff( OwnerID(), 508271) 
	if S == TRUE then
	 CancelBuff( OwnerID(), 508271) 
	end
end
