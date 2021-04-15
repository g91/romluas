-- �����`-�S����Ƴc��ӤH

--                      ���~�W��   ���~ID   ��Ѳ��q
-- shop01 �i�� �S�ﭻۣ	240066  1000
-- shop02 �Ҫ� �j�U�F��	240067  1000
-- shop03 ���_ ���Žv�a	240068  300
-- shop04 �s�� �ջ��K�q	240069  300
-- shop05 ��u �𮧤���	240070  100
-- shop06 ���K ���ɴ��K	240071  100


--- �@�� -----------------------
function lua_mika_skillcraft_shop_intro()  -- �S����Ƥ���
	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP05]"   )   -- �A�n�A�_�I�̡A���ݹL���ڤ�W�o�دS���s�@���ƶܡH (��)
end
 ----------------------

--- ��s�C�Ѽƶq -----------------------

-- �C�� 1000��  ( �i��, �Ҫ�)
function lua_mika_skillcraft_shop_count1()
	local count_day = 1000   -- �������~���npc���Ѷq
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
	--		Say(OwnerID(), "reset" )
	--		Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC
	end
end

-- �C�� 300��  ( ���_, �s��)
function lua_mika_skillcraft_shop_count2()
	local count_day = 300   -- �������~���npc���Ѷq
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
		--	Say(OwnerID(), "reset" )
		--	Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC

	end
end

-- �C�� 100��  ( ���K, ��u)
function lua_mika_skillcraft_shop_count3()
	local count_day = 100   -- �������~���npc���Ѷq
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- ���s����� �ɥR���Ѷq
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --�{�bR�ȶq
		--	Say(OwnerID(), "reset" )
		--	Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC

	end
end

----------------------------------------------


-- NPC��l�@�� -----------------------

-- shop01 �i�� �S�ﭻۣ	240066  1000
function lua_mika_skillcraft_shop01()   --�i��  
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop1_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~


end

function lua_mika_skillcraft_shop1_buy()  -- �ө�1 �i�� �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240066  --�S�ﭻۣ
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end

end
--------------------------------------------------------------------
-- shop02 �Ҫ� �j�U�F��	240067  1000
function lua_mika_skillcraft_shop02()   --�Ҫ�
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop2_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~


end

function lua_mika_skillcraft_shop2_buy()  -- �ө�2 �Ҫ� �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240067  --�j�U�F��
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end
end
--------------------------------------------------------------------
-- shop03 ���_ ���Žv�a	240068  300
function lua_mika_skillcraft_shop03()   --���_
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop3_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~

end

function lua_mika_skillcraft_shop3_buy()  -- �ө�3 ���_ �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240068  --���Žv�a
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end
end

--------------------------------------------------------------------
-- shop04 �s�� �ջ��K�q	240069  300
function lua_mika_skillcraft_shop04()   --���_
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop4_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~


end

function lua_mika_skillcraft_shop4_buy()  -- �ө�4 �s�� �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240069  --�ջ��K�q
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end
end

--------------------------------------------------------------------
-- shop05 ��u �𮧤���	240070  100

function lua_mika_skillcraft_shop05()   --���_
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop5_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~

end

function lua_mika_skillcraft_shop5_buy()  -- �ө�5 ��u �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240070  --�𮧤���
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end
end

--------------------------------------------------------------------
-- shop06 ���K ���ɴ��K	240071  100

function lua_mika_skillcraft_shop06()   --���K
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )  -- �_�I�̡A�A�ӱo���n�I���Ѫ������٦��f�O�I(��)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop6_buy", 0 ) -- �ʶR����
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --����S����ưӫ~


end

function lua_mika_skillcraft_shop6_buy()  -- �ө�6 ���K �ʶR�ӫ~
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240071  --���ɴ��K
	local item_need = 240061   --�I���һݪ��~id
	local count = CountBodyItem(OwnerID(), item_need  )  --���a���W�I�����~�ƶq
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq  Ū npc �� r��

	if count_now < 1 then   -- ���׾���, ��npc r�� <1 , �I���ɧi�D���a����R
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )   --�ܩ�p�A�_�I�̡A�A��F�@�B�A���ѳc�⪺���Ƥw�g�����⧹�A�ЧA���Ѧ��I�ӧa�I
	else
		if count < 1 then -- �p�G���a�S�I�����~
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- ���� r��
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --�{�bR�ȶq �ӫ~�c��Ѿl�ƶq
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL ���K���P�ª�X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE ����X1
		end
	end
end
--------------------------------------------------------------------