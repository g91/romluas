-- Z13 ����  NPC�@��

function lua_mika_z13_117692touch()
	SetPlot( OwnerID() , "Touch" , "lua_mika_z13_117692touch2" , 50 )
end

function lua_mika_z13_117692touch2()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_117692_1]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_mika_z13_117692touch3" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
		return
	end
end

function lua_mika_z13_117692touch3(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	 -- ���a
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "OK" , "0xffffff00" )  --BeginCastBar���\�F�C
		--	ScriptMessage(O_ID, O_ID , 0 , "OK" , "0xffffff00" )  

			local  buff = Checkbuff(OwnerID(), 509139 ) --buff
			local  Count = CountBodyItem(OwnerID(), 209217 ) --�D��ƶq
			
			if buff == true then --��buff
				if Count  >= 10 then
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_117692_2]" , C_SYSTEM )	--�e�������T��  �A�w�g�Ķ��쨬���ƶq��[209217]�C
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_117692_2]" , C_SYSTEM )	--�T����
				else
					GiveBodyItem(OwnerID(), 209217, 1)  --�^������
					Beginplot(TargetID(), "lua_mika_z13_117692touch4" , 0 )
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_117692_3]" , 0 )	--�e�������T��  �P��[209217]���G�����A�L�k�Ķ��C
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SSC_117692_3]" , 0 )	--�T����
			end

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "Fail" , "0xffffff00" )  --BeginCastBar���ѤF�C
		--	ScriptMessage(O_ID, O_ID , 0 , "Fail" , "0xffffff00" )  
		end
	end
end

function lua_mika_z13_117692touch4()
--	Say(OwnerID(), "11")  --npc
--	Say(TargetID(), "21")  --plyaer
	Hide(OwnerID() )
	local ran = rand(100)   
	if ran <= 30  then   -- 30
		Sleep(70)  --
	elseif ran >= 31 and ran <= 65  then   -- 35
		Sleep(100)  --
	elseif ran >= 66 and ran <= 85  then   -- 20
		Sleep(130)  --
	elseif ran >= 85 then   -- 15
		Sleep(150)  --
	end
	Show(OwnerID(), 0)
end



--z13��u(�̨�) ���լd��a
--questid : 424001 / ����npc : 117924

--�r��
--���հT��say

function lua_mika_z13_117924_0()
	LoadQuestOption( OwnerID() ) --Ū��npc����
	if CheckFlag(OwnerID(), 544953 ) == false and CheckAcceptQuest( OwnerID(), 424001 ) == true  then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_08]" , "lua_mika_z13_117924_00", 0 ) --�յ۪���ɨ�
	end
end

function lua_mika_z13_117924_00()
	SetSpeakDetail( OwnerID(), "[SC_Z13_117924_00]"   )   -- (����W���\�h���s...�A�n�����@�Ӧn�O�H)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_01]" , "lua_mika_z13_117924_1", 0 ) --�W
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_02]" , "lua_mika_z13_117924_2", 0 ) --�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_03]" , "lua_mika_z13_117924_1", 0 ) --��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z13_117924_04]" , "lua_mika_z13_117924_2", 0 ) --�k
end

function lua_mika_z13_117924_1()
	local Key1 = CheckFlag(OwnerID(), 544951 )
	local Key2 = CheckFlag(OwnerID(), 544952 )
--	Say(OwnerID(), "OwnerID2" )   --player
--	Say(TargetID(), "TargetID2" )  --�̩ԧJ
--	Say( OwnerID(), "1" )
	if Key2 == TRUE then
	--	Say( OwnerID(), "key2" )
		local R =  RAND(100)+1
		if R <= 85 then  -------����
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			BeginPlot(TargetID(), "lua_mika_z13_117924_ok" , 0 )  --���\�ƥ�
		end
	elseif Key1 == TRUE then
	--	Say( OwnerID(), "key1" )
		local R =  RAND(100)+1
		if R <= 75 then  -------����
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			SetFlag( OwnerID(), 544952, 1 ) --KEY2
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_062]" , C_SYSTEM )  --�A��ܪ����s�O���T���I�ٳѤU1���N�ন�\�Ѱ��C
		end
	else
	--	Say( OwnerID(), "key0" )
		local R =  RAND(100)+1
		if R <= 50 then  -------����
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			SetFlag( OwnerID(), 544951, 1 ) --KEY1
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_061]" , C_SYSTEM )  --�A��ܪ����s�O���T���I�ٳѤU2���N�ন�\�Ѱ��C
		end
	end
end

function lua_mika_z13_117924_2()  --set2
	local Key1 = CheckFlag(OwnerID(), 544951 )
	local Key2 = CheckFlag(OwnerID(), 544952 )
--	Say( OwnerID(), "2" )
	if Key2 == TRUE then
	--	Say( OwnerID(), "key2" )
		local R =  RAND(100)+1
		if R <= 80 then  -------����
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			BeginPlot(TargetID(), "lua_mika_z13_117924_ok" , 0 )  --���\�ƥ�
		end
	elseif Key1 == TRUE then   -- 2nd
	--	Say( OwnerID(), "key1" )
		local R =  RAND(100)+1
		if R <= 70 then  -------����
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
		--	Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			SetFlag( OwnerID(), 544952, 1 ) --KEY2
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_062]" , C_SYSTEM )  --�A��ܪ����s�O���T���I�ٳѤU1���N�ন�\�Ѱ��C
		end
	else
--		Say( OwnerID(), "key0" )
		local R =  RAND(100)+1
		if R <= 60 then  -------����
	--		Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_05]" , 0 )  --���G��ܤF���~�����s�A�S����������I
		else  --���\
	--		Say( OwnerID(), R )
			CloseSpeak( OwnerID()) --��������
			SetFlag( OwnerID(), 544951, 1 ) --KEY1
			ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_Z13_117924_061]" , C_SYSTEM )  --�A��ܪ����s�O���T���I�ٳѤU2���N�ন�\�Ѱ��C
		end
	end
end

function lua_mika_z13_117924_ok()
--	Say(OwnerID(), "OwnerID" )   ---�̩ԧJ
--	Say(TargetID(), "TargetID" )  ---playe
	ScriptMessage( TargetID() ,  TargetID(), 1, "[SC_Z13_117924_09]" , C_SYSTEM )  
	SetFlag( TargetID(), 544953, 1 ) --KEY

end

function lua_mika_424001_finish()
	CastSpell(TargetID(), TargetID(), 494640 ) --CastSpell �z��
	SetFlag( TargetID(), 544954, 1 ) --KEY
	ScriptMessage( TargetID() ,  TargetID(), 1, "[SC_Z13_117924_07]" , C_SYSTEM )  
end

function lua_mika_423992_finish() -- ����  �s���o�å� ���ȼ@��
	Setflag(TargetID(), 544948 ,1 ) -- ���� �ݤ����l�a�����KEY
end

function lua_mika_423994_finish() -- ����  �ʤ֪��s�� ���ȼ@��
	Setflag(TargetID(), 544949 ,1 ) -- ���� �ݱo���̩ԧJ KEY
end

function lua_mika_423998_finish() -- ����  �ӯ��F�I ���ȼ@��
	Setflag(TargetID(), 544949 ,0  ) -- �R�� �ݱo���̩ԧJ KEY
end

function lua_mika_424002_finish()
	Setflag(TargetID(), 544954 ,0 ) -- �R�� �ݱo�����e��key
end
