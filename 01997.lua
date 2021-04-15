function Lua_beerday_na_A_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_A_02" , 50 ); --�]�w����Ĳ�I�@���A50���d��
end

function Lua_beerday_na_A_02()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M

	DesignLog(O_ID,115822 , "beer A" )  --�^�Ǭ��ʰѻP��

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_A_castbar" ) ~= 1 then --20��bar�ʧ@�ɶ�
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--�e�������T�� �A���W�S������M�l�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--�T����
	end
end


function Lua_beerday_na_A_castbar(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507452 )  --�R��
					AddBuff( OwnerID(),  507453, 0 , 1800 )	--���G��s
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_01]" ,C_SYSTEM )	--�e�������T�� ��o �b�M���G��s�C

				elseif checkcupa == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507453)  --�R��A�MBUFF
					AddBuff( OwnerID(), 507456, 0 , 3600 )	--���G��sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_02]" ,C_SYSTEM )	--��o ���G��s�C
	
				elseif checkcupb == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507454)  --�R��B�MBUFF
					AddBuff( OwnerID(), 507457, 0 , 3600 )	--���Ƥ��G��sBUFF	
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_03]" ,C_SYSTEM )	--��o ���Ƥ��G��s�C

				elseif checkcupc == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507455)  --�R��C�MBUFF
					AddBuff( OwnerID(),507458, 0 , 3600 )	--�᭻���G��sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_04]" ,C_SYSTEM )	--��o �᭻���G��s�C
				end
			end
		else
			-- ����
			EndCastBar(O_ID, CheckStatus );
		end
	end
end



function Lua_beerday_na_B_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_B_02" , 50 ); --�]�w����Ĳ�I�@���A50���d��
end

function Lua_beerday_na_B_02()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M

	DesignLog( O_ID ,115823 , "beer B" )  --�^�Ǭ��ʰѻP��

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_B_castbar" ) ~= 1 then --20��bar�ʧ@�ɶ�
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--�e�������T�� �A���W�S������M�l�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--�T����
	end
end


function Lua_beerday_na_B_castbar(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(),507452)  --�R��
					AddBuff( OwnerID(), 507454, 0 , 1800 )	--B�MBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_08]" ,C_SYSTEM )	--��o �b�M���ư�s�C

				elseif checkcupa == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507453)  --�R��A�MBUFF
					AddBuff( OwnerID(), 507457, 0 , 3600 )	--���Ƥ��G��sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_03]" ,C_SYSTEM )	--��o ���Ƥ��G��s�C

				elseif checkcupb == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507454)  --�R��B�MBUFF
					AddBuff( OwnerID(), 507459, 0 , 3600  )	--���ư�sBUFF	
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_05]" ,C_SYSTEM )	--��o ���ư�s�C
	
				elseif checkcupc == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507455)  --�R��C�MBUFF
					AddBuff( OwnerID(), 507460, 0 , 3600 )	--�ᦷ���ư�sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_06]" ,C_SYSTEM )	--��o �ᦷ���ư�s�C
				end
			end
		else
			-- ����
			EndCastBar(O_ID, CheckStatus );
		end
	end
end





function Lua_beerday_na_C_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_C_02" , 50 ); --�]�w����Ĳ�I�@���A50���d��
end

function Lua_beerday_na_C_02()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M

	DesignLog(O_ID ,115824 , "beer C" )  --�^�Ǭ��ʰѻP��

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_C_castbar" ) ~= 1 then --20��bar�ʧ@�ɶ�
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--�e�������T�� �A���W�S������M�l�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--�T����
	end
end



function lua_beerday_na_C_castbar(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local checkcupz = CheckBuff( OwnerID() , 507452)  --�ŪM
	local checkcupa = CheckBuff( OwnerID() , 507453) --A�M
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B�M
	local checkcupc = CheckBuff( OwnerID() , 507455) --C�M


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507452)  --�R��
					AddBuff( OwnerID(), 507455, 0 , 1800 )	--C�MBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_09]" ,C_SYSTEM )	--��o �b�M�᭻��s�C
				
				elseif checkcupa == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507453 )  --�R��A�MBUFF
					AddBuff( OwnerID(), 507458, 0 , 3600 )	--�᭻���G��sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_04]" ,C_SYSTEM )	--��o �᭻���G��s�C
				
				elseif checkcupb == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(), 507454)  --�R��B�MBUFF
					AddBuff( OwnerID(),507460, 0 , 3600 )	--�ᦷ���ư�sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_06]" ,C_SYSTEM )	--��o �ᦷ���ư�s�C
				
				elseif checkcupc == true then   --�ˬd���a���W�O�_�����Űs�M
					CancelBuff( OwnerID(),507455 )  --�R��C�MBUFF
					AddBuff( OwnerID(), 507461, 0 , 3600 )	--�᭻��sBUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_07]" ,C_SYSTEM )	--��o �᭻��s�C
				end
			end
		else
			-- ����
			EndCastBar(O_ID, CheckStatus );
		end
	end
end


--C_SYSTEM ����