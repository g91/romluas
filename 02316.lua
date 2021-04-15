--EM_RoleValue_Register  buff���ǡB�D��
--EM_RoleValue_Register+1~7  �D�ة�Ѷ���
--EM_RoleValue_Register+8  NPCID



function lua_suki_Germany_2year_en1_01()
	--Owner�O���a
	--Target�Onpc
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) -- ���V
	if CheckBuff(OwnerID(), 507851) == FALSE then  --�D�ܨ��C�쪺���A
		if CheckFlag(OwnerID(), 544937) ==true and CheckFlag(OwnerID(), 544938) ==false then  --�ˬd���O�_�w�g�����L����
			SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS04") ) --���ѦA��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS01") ) 
		end

		if CheckFlag(OwnerID(), 544938) == TRUE then --�����
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS05]", "lua_suki_Germany_2year_en1_good", 0)--���

		elseif CheckFlag(OwnerID(), 544937) == FALSE then 
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS02]", "lua_suki_Germany_2year_en1_rule", 0)--������s�o�{��?
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS17") ) --�ɶ�����
	end
end 


function lua_suki_Germany_2year_en1_rule() --�W�h����
--	if CheckFlag(OwnerID(), 544937) == FALSE then -- �C��ѥ[�X��
		SetSpeakDetail(OwnerID(), "[SC_GERMANY2_VARIATIONS07]") --�A�i���z�L���P�ͪ��������ݥ@�ɩO�H...
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS03]", "lua_suki_Germany_2year_en1_give", 0)--���u
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]", "lua_suki_Germany_2year_en1_01", 0)--��^�W�@��
--	elseif CheckFlag(OwnerID(), 544938) == TRUE then --�����
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS05]", "lua_suki_Germany_2year_en1_good", 0)--���
--	end
end

function lua_suki_Germany_2year_en1_good() --�ˬd���WBUFF�ƶq
	local Count = FN_CountBuffLevel (OwnerID(), 507852)
--	SAY(OwnerID(), "Count="..Count)
	if Count == 8 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS13") ) --����
		GiveBodyItem( OwnerID(), 724059 , 1) --�ܨ��Ĥ�*3
		GiveBodyItem( OwnerID(), 724059 , 1)
		GiveBodyItem( OwnerID(), 724059 , 1)
		GiveBodyItem( OwnerID(), 209561 , 1) --�w�y�C�����
	elseif Count >=5 and Count <=7 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS15") ) --���ߺD
		GiveBodyItem( OwnerID(), 724059 , 1)		
		GiveBodyItem( OwnerID(), 209561 , 1) --�w�y�C�����
	elseif Count <=4 and Count>=2 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS14") ) --�t�@�B
		GiveBodyItem( OwnerID(), 209561, 1) --�w�y�C�����
	elseif Count ==1 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS12") ) --�A���A�y
	end
	CancelBuff(OwnerID(), 507852 ) --�O��
	SetFlag(OwnerID(), 544938, 0) --����X��
	CancelBuff(OwnerID(), 507846) --��
	CancelBuff(OwnerID(), 507847) --��
	CancelBuff(OwnerID(), 507848) --��
	CancelBuff(OwnerID(), 507849) --��
	CancelBuff(OwnerID(), 507850) --��
end


------------------------------�X�D------------------------------------

function lua_suki_Germany_2year_en1_give()  --�Hbuff���覡�X�D
	CancelBuff(OwnerID(), 507852 )
	SetFlag(OwnerID(), 544939, 0) --�X�D�e�����m���e�i�ॼ�M�����X�D
	SetFlag(OwnerID(), 544938, 0) --�X�D�e�����m���e�i�ॼ��������y
	CancelBuff(OwnerID(), 507846)  --��
	CancelBuff(OwnerID(), 507847)  --��
	CancelBuff(OwnerID(), 507848)  --��
	CancelBuff(OwnerID(), 507849)  --��
	CancelBuff(OwnerID(), 507850)	--�� 
	for i=1, 7 do  --�H���X�C���D��
		WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+i, 0) --�O���b
	end

	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 } --r,y,g,b,p
	local Random = Rand(5)+1--
	local Count = 10
	local Answer = Random--�D��buff
	local Reg4

	for i = 1 , 7 , 1 do
		AddBuff( OwnerID() , Buff[Answer] , 0 , -1 )--5
--		Say( OwnerID() , "Random = " .. Random )
		Random = ( Rand(5)+1 )*Count + Random--�O������
		Answer = math.floor( Random / Count )--�D��buff
		Count = Count*10--����
		if i == 7 then
			Reg4 = WriteRoleValue( OwnerID() , EM_RoleValue_Register , Random ) 
		end
	end

		local NPC={116850, 116851, 116852, 116853, 116854}--r,y,g,b,p�]�Ĥ@�ӬO����~�^ 
		local NPC2={}
		local Count2 =10
		local Answer2 = ReadRoleValue (OwnerID(), EM_RoleValue_Register )--23154215
		local Answer3 
		for i=1, 7, 1 do
			Answer3 =  Answer2 % Count2 --2315421...5
			Answer2 = math.floor( Answer2/Count2)
			WriteRoleValue ( OwnerID(), EM_RoleValue_Register+i, Answer3 )
			NPC2[i] = NPC[Answer3]

		--	say ( OwnerID(), "A="..NPC2[i] )
		end
		SetSpeakDetail(OwnerID(), "[SC_GERMANY2_VARIATIONS06][$SETVAR1=".."["..NPC2[1].."]".."][$SETVAR2=".."["..NPC2[2].."]".."][$SETVAR3=".."["..NPC2[3].."]".."][$SETVAR4=".."["..NPC2[4].."]".."][$SETVAR5=".."["..NPC2[5].."]".."][$SETVAR6=".."["..NPC2[6].."]".."][$SETVAR7=".."["..NPC2[7].."]".."]")--�D��
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS10]", "lua_suki_Germany2_en1_start", 0)--�ڷQ����C�쪺�ͬ�
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]", "lua_suki_Germany_2year_en1_01", 0)--back

end

function lua_suki_Germany2_en1_start() --�N���a�ܨ����C��
--	say( TargetID(), "1")
--	say( OwnerID(), "2")
	local R = Lua_Mounts_Copilot( OwnerID() )
	if R == false then --�p�G���a�b��y
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_16]" , 0)
	else
		DW_CancelTypeBuff( 68,  OwnerID() )
		SetFlag(OwnerID(), 544937, 1)  --����w�ѥ[����
		AddBuff(OwnerID(), 507851, 1, -1)
		AddBuff(OwnerID(), 507852, 1, -1)
	end	
	CloseSpeak( OwnerID() )
end

---------------------------------------------------------------------------
function lua_suki_Germany2_en1_color()  --���몺�d��@��
	SetPlot( OwnerID() , "range" , "lua_suki_Germany2_en1_color03" , 25 )
end

function lua_suki_Germany2_en1_color03()
	--say (TargetID(), "Org="..2)--npc
	WriteRoleValue ( OwnerID(), EM_RoleValue_Register+8, TargetID() )
	if CheckBuff ( OwnerID(), 507851) == TRUE then  --�O�_���ܨ��C�쪺���A
		BeginPlot(OwnerID(), "lua_suki_Germany2_en1_color02", 0)
--	elseif CheckBuff ( OwnerID(), 507851) == FALSE then
--		ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS18]" , C_SYSTEM)--�C���s�� ���w�P�D�c�Ȧ��G���D�o�O���@�^��
	end
end


function lua_suki_Germany2_en1_color02()  --�ˬd���a���W
	local npc8=ReadRoleValue( OwnerID(), EM_RoleValue_Register+8)
	local orgID=ReadRoleValue ( npc8, EM_RoleValue_OrgID )
	local NPC={116850, 116851, 116852, 116853, 116854}
	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 } --r,y,g,b,p
	local BuffLV=FN_CountBuffLevel ( OwnerID(), 507852) --�p��BUFF
	local n=ReadRoleValue (OwnerID(), EM_RoleValue_Register+bufflv) --
	local Random = rand(20)+1

--	Say(OwnerID(), "bufflv="..bufflv)
--	Say(OwnerID(), "npc="..NPC[n])
--	say (TargetID(), "Org="..orgID)


	if bufflv ~=8 then
		if orgID == NPC[n] then--���a�q�L���T������
			local x=FN_CountBuffLevel(OwnerID(), buff[n] )
	--		say (OwnerID(), "x="..x)
			if x == 0 then --���n�A�X�{�F
			--	say (OwnerID(), "x="..x)
				AddBuff(OwnerID(), Buff[n], x ,-1 )
				sleep(30)
				CancelBuff(OwnerID(), Buff[n] )
			else
				x = x-1
			--	say (OwnerID(), "x="..x)
				CancelBuff(OwnerID(), Buff[n] )
				CastSpell( OwnerID(), OwnerID(), 497453)
				AddBuff(OwnerID(), Buff[n], x ,-1 ) --��bufflv	
			end
			if BuffLV == 8 then
				ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS11]" , C_SYSTEM)--����
				SetFlag(OwnerID(), 544938, 1) --���������
			end
			bufflv = bufflv+1
			CancelBuff(OwnerID(), 507852)		
			AddBuff (OwnerID(), 507852, bufflv, -1) --+1��		
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS20]" , C_SYSTEM) --����T��P����A�F�C

		else	--���a�^�����~
			if Random <= 10 then
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS09]" , 0) --�A��Ĳ������O���~���I
			else 
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS19]" , 0)--���O�o�������I
		--	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS09][$SETVAR1=".."["..NPC[n].."]".."]" , C_SYSTEM)--���ӬO??�~��
			end
		end
	end
end
		
------------------------------
function lua_suki_Germany2_en1_timeover()
	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS16]" , C_SYSTEM) --�ܨ��ɮĤw�L�I�h�䴵�w�P�D�c�ȳ��i���絲�G�C
	ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_GERMANY2_VARIATIONS16]" , C_SYSTEM)
	SetFlag(OwnerID(), 544938, 1) --���������
	SetFlag(OwnerID(), 544939, 1) --����L�k�A�@��
end




function lua_suki_Germany2_en1_delbuff()--��ӨS���D��A�i�H���ίd�A�u�O�Ѵ��էRBUFF��
	SetFlag(OwnerID(), 544938, 0) --���
	SetFlag(OwnerID(), 544939, 0) --����
	SetFlag(OwnerID(), 544937, 0) --�R���C��X��
	--���몺����--
	CancelBuff(OwnerID(), 507846) 
	CancelBuff(OwnerID(), 507847)
	CancelBuff(OwnerID(), 507848)
	CancelBuff(OwnerID(), 507849)
	CancelBuff(OwnerID(), 507850)	
	CancelBuff(OwnerID(), 507851)	
	CancelBuff(OwnerID(), 507852)	
end