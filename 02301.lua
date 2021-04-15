--NPC �ۼ�
--����
function Lua_na_waterslot_touch() --����Ĳ�I�@��
	SetPlot( OwnerID() , "touch" , "Lua_na_waterslot_touch1" , 50 )
end

function Lua_na_waterslot_touch1()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_WSLOT_01]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_waterslot_touch2" ) ~= 1 then --20��bar�ʧ@�ɶ� �V��[208307]
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
		return
	end
end



function Lua_na_waterslot_touch2(O_ID, CheckStatus)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			local X = CountBodyItem( OwnerID(), 208306)
			Say( OwnerID(), X )
			if X == 1 then  --�p�G���W���V����
				DelBodyItem( OwnerID(), 208306, 1 ) --�R���V����
				GiveBodyItem( OwnerID(), 208307, 1 ) --�����A�G����, �ͦs�ɶ�10��

			elseif CountBodyItem( OwnerID(), 208307) == 1 then  --�Y���a���W�w�g���A�G����

				ScriptMessage( OwnerID(), OwnerID(), 0,  "[SC_423154_ITEM]" , C_SYSTEM )  --�A�w�g���o�L�F�C
				ScriptMessage( OwnerID(), OwnerID(), 1,  "[SC_423154_ITEM]" , C_SYSTEM )  --�A�w�g���o�L�F�C
			else 
				ScriptMessage( OwnerID(), OwnerID(), 0,  "[SC_WSLOT_02]" , C_SYSTEM )  --�A�w�g���o�L�F�C
				ScriptMessage( OwnerID(), OwnerID(), 1,  "[SC_WSLOT_02]" , C_SYSTEM )  --�A�w�g���o�L�F�C
			end
		else		-- ����
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			EndCastBar(O_ID, CheckStatus );	
		end
	end
end



function Lua_na_c_regiveleave() --�A�G�����R����Ĳ�o�@���A�A�����V����
	GiveBodyItem( OwnerID(), 208306, 1)
end


function Lua_na_plants_register_clear()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 0 ) --�b���~���W�g�J��0
	Say( OwnerID(), "REGISTER CLEAR!")
end



--���Ƽ�
function Lua_na_foodslot_touch() --���Ƽ�Ĳ�I�@��
	SetPlot( OwnerID() , "touch" , "Lua_na_foodslot_touch1" , 50 )
end

function Lua_na_foodslot_touch1()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_FSLOT_01]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_foodslot_touch2" ) ~= 1 then --10��bar�ʧ@�ɶ� �V��[208307]
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
		return
	end
end



function Lua_na_foodslot_touch2(O_ID, CheckStatus)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			local rand1 = rand(3)+1
			if rand1 == 1 then
				GiveBodyItem( OwnerID() , 208303 , 3 ) --���񴹪G
		--		Say( OwnerID(), rand2 )
			elseif rand1 == 2 then  
				GiveBodyItem( OwnerID() , 208304 , 3 ) --�������G
		--		Say( OwnerID(), rand2 )			
			elseif rand1 == 3 then  
				GiveBodyItem( OwnerID() , 208305 , 3 ) --�������G
		--		Say( OwnerID(), rand2 )
			end
		else		-- ����
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PICK_ERROR_NA]" , C_SYSTEM )  --�B������(��½Ķ)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PICK_ERROR_NA]" , C_SYSTEM )  --�B������
			EndCastBar(O_ID, CheckStatus );	
		end
	end
end




--�A�G�������@��
function Lua_na_cursedrop() --�ϥζA�G�������ĪG
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Monster =  {105125, 105126}
	--Owner = ���a�ۤv
	--Target=NPC/�䥦���a	
	if CheckDistance( OwnerID(), TargetID(), 150 ) == true then
		if OrgID ~= Monster or TargetID() == OwnerID()  then  --�ؼФ��O���a�]���O�P�H�x
			ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_204425_1]" , C_SYSTEM ) --�ؼФ����T
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_204425_1]" , 0 )	--�ؼФ����T	
			return false
		elseif OrgID == Monster then --�ؼЬO�P�H�x
			return true
		end
	end
	sleep(1)
end