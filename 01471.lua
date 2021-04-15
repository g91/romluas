-- 2013.05.07  6.0.1 ���ʰƥ��վ� - �����L�����ܼ@��
function Lua_Hao_113245_00()

	local Player = OwnerID()
	local Npc = TargetID()
	local KingSpeaking = ReadRoleValue( Npc , EM_RoleValue_Register+1 )	-- �����L���⪺���

	AdjustFaceDir( Npc , Player , 0 )	-- ���V

	if CheckFlag( Player , 542743 ) == false then	-- �ˬd���a�O�_�w�I30�T�����ťN��
		ScriptMessage( Npc , Player , 1 , "[GUILD_BUILD_12]" , 0 )	-- �A�S���v��
		PlayMotion( Npc , 107 )	-- �n�Y
		return
	end
	
	if CheckFlag( Player , 542904 ) == false then	-- �w��������L����o�񪺼��y
		if ReadRoleValue( Npc , EM_RoleValue_Register+1 ) == 1 then	-- �L�������A�������d���C�쪱�a���y
			SetSpeakDetail( Player , "[SC_GOBLINARENA_42]" )	-- �ܦn�A�n�n�ñ��o�Ӽ��y�C�J��ڬO�A�Ѥj�����B�A���D�ܡH
			AddSpeakOption( Player , Npc , "[SC_GOBLINARENA_40]" , "Lua_Hao_113245_01", 0 )	-- �ڭn���[205074]
		else
			SetSpeakDetail( Player , "[SC_GOBLINARENA_41]" )
		end
	else 
		SetSpeakDetail ( Player , "[SC_DAN_111700_24]") --�A���Ѥw�g�I���L���y�F
	end
end

function Lua_Hao_113245_01()

	local Player = OwnerID()
	local Npc = TargetID()
	
	local Present ={		25 , 203086 ,		-- �����L�ܨ��Ĥ�
				50 , 205078 ,		-- ��������ܨ��Ĥ�
				60 , 203182 ,		-- 7�ѭ����L�d���c
				70 , 205081 ,		-- 7����������d���c
				71 , 201134 ,		-- �g���ľ�
				72 , 201610 ,		-- �ޯ��ľ�
				82 , 201619 ,		-- ���B�ľ�
				87 , 202902 ,		-- �Ŷ��O������
				92 , 202903 ,		-- �ǰe�̲Ť�			
				96 , 202435 ,		-- �a������
				100 , 203784	}	-- ���|�����ǰe��	
	
	CloseSpeak(Player)
	if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
		local Random = math.random(100)
		GiveBodyItem( Player , 205817 , 1 )	-- 6.0.1 ��s�W���A�̪��ԧQ�~
		for i = 1 , #Present , 2 do		
			if Random <= Present[i] then
		    		GiveBodyItem( Player , Present[i+1] , 1 )
		    		break
		    	end
		end
		SetFlag( Player , 542904 , 1 )
	else
		SetSpeakDetail( Player , "[SC_DAN_111700_22]" )  -- �z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
	end
end