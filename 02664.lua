
-- �`�y�@�Pbuff���P

-- �����լ�Ϋ��O
Function lua_mika_festivalbuff(Bufflv)  --  pcall�� buff lv 
	local OID = OwnerID()

	-- ��Ԩtbuff
	local showbuff1     = { 622406, 622407, 622408 }
	local hiddenbuff1 = { 622417, 622418 }
	-- �k�t buff
	local showbuff2     = { 622409, 622410, 622411 }
	local hiddenbuff2 = { 622419, 622420 }
	-- �S�� buff
	local showbuff3    = 622412 
	local hiddenbuff3 = 622421 
	
	local R = Rand(100)+1

	local bufftime =  3600 -- 1hr 
	
	local jobgroup1 =  { 1, 2, 3 , 6 , 7 , 10}  -- �Ԥh �B�C�L �B�v��B �M�h �B�˪L���̡B�Ť�u�K
	local JOB = ReadRoleValue(OID, EM_RoleValue_VOC )   -- �D¾¾�~

	local stime = 10

	ScriptMessage( OID, OID, 1, "[SC_EASTER_2012_BLESSING]" , C_SYSTEM )

	if R >= 74 then  -- 74 - 100
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
			--	Say(OID, "ATK BUFF 1")
				AddBuff(OID, showbuff1[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[1] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 1")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[1] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 47 and R <= 73  then -- 47 - 73
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 2")
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
				AddBuff(OID, showbuff1[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[2] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 2")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[2] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 20 and R <= 46  then   --  20 - 46
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 3")
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
				AddBuff(OID, showbuff1[3] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 3")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[3] , Bufflv , bufftime )
			end
		end

	else  --  1 - 19
	--	Say(OID, "SP BUFF ")
		CastSpell(OID, OID, 850137 )   -- �S�� �I��S��
		AddBuff(OID, showbuff3 , Bufflv , bufftime )
		AddBuff(OID, hiddenbuff3 , Bufflv , bufftime )
	end

end


-- �U�O���ʵ�
Function lua_mika_festivalbuffgive(OID, Bufflv)  --  pcall�� buff lv 

	-- ��Ԩtbuff
	local showbuff1     = { 622406, 622407, 622408 }
	local hiddenbuff1 = { 622417, 622418 }
	-- �k�t buff
	local showbuff2     = { 622409, 622410, 622411 }
	local hiddenbuff2 = { 622419, 622420 }
	-- �S�� buff
	local showbuff3    = 622412 
	local hiddenbuff3 = 622421 
	
	local R = Rand(100)+1

	local bufftime =  3600 -- 1hr 
	
	local jobgroup1 =  { 1, 2, 3 , 6 , 7 , 10}  -- �Ԥh �B�C�L �B�v��B �M�h �B�˪L���̡B�Ť�u�K
	local JOB = ReadRoleValue(OID, EM_RoleValue_VOC )   -- �D¾¾�~

	local stime = 10

	ScriptMessage( OID, OID, 1, "[SC_EASTER_2012_BLESSING]" , C_SYSTEM )

	if R >= 74 then  -- 74 - 100
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
			--	Say(OID, "ATK BUFF 1")
				AddBuff(OID, showbuff1[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[1] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 1")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[1] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 47 and R <= 73  then -- 47 - 73
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 2")
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
				AddBuff(OID, showbuff1[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[2] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 2")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[2] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 20 and R <= 46  then   --  20 - 46
		for i = 1 , table.getn(jobgroup1)  do  -- �Y�D¾���ŬO���¾�~
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 3")
				CastSpell(OID, OID, 850135 )   -- ���z�t �I��S��
				AddBuff(OID, showbuff1[3] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 3")
				CastSpell(OID, OID, 850136 )   -- �k�t �I��S��
				AddBuff(OID, showbuff2[3] , Bufflv , bufftime )
			end
		end

	else  --  1 - 19
	--	Say(OID, "SP BUFF ")
		CastSpell(OID, OID, 850137 )   -- �S�� �I��S��
		AddBuff(OID, showbuff3 , Bufflv , bufftime )
		AddBuff(OID, hiddenbuff3 , Bufflv , bufftime )
	end

end

-- test
function lua_mika_festivalbuff_check()
	local OID = OwnerID()  
--< OID���нж�J�Ӭ��ʤ��O���a���ܼ�,  �Ҧp Local OID = player

	local allcount = 4  -- �Ҧ��s���ʼƶq
	local count = 0
	local keylist =  {
			546288,	--�Ԥ�ߨ��þ�
			546257,	--�Ԥ�l�r�O
			546264,	--�ڤ۱m��
			546232		--�m�J��~
			}
	for i =  1 , table.getn(keylist) do
		if Checkflag(OID , keylist[i] )  == true then
			count = count +1
		end
		if i == table.getn(keylist) then
			if count == allcount then -- �p�G��������
				lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4��K�B�`���� ������0
			end
		end
	end
end