--�w��|�P�~_�̨�

----------------  �|���M�� ---------------- 

-- 121805 �Où�D�ͩ_ ����NPC��l��� 
function mika_4years_NPC_01()
	local player = OwnerID()
	local NPC = TargetID()
	local GetQuestKey =  547527  -- �i������-�M������
	local TodayQuestKey = 547530 -- ���Ѥw��������-�M������

	if CheckFlag(player, TodayQuestKey) == false then  -- ���Ѥw��������-�M������
		if CheckFlag(player, GetQuestKey) == false then  -- �i������-�M������
			SetSpeakDetail( player, "[SC_DE_4TH_Q1_NPC_01]"   );  -- �u�O�@�s���H�˸������Q�~��...�C
			AddSpeakOption(player, player, "[SC_DE_4TH_Q1_NPC_02]", "mika_4years_NPC_quest_01", 0  )   --  �o�ͤ���ƤF�H
		else  -- �������Ȫ�KEY
			LoadQuestOption(player)
		end
	else  --  �������L��
		SetSpeakDetail( player, "[SC_DE_4TH_Q1_NPC_03]" );  -- �|���ש�M�b�h�F�A���A�b���ɤ���o���Z�C
	end
end

-- �������ȥΪ�KEY
function mika_4years_NPC_quest_01()
	local player = OwnerID()
	local GetQuestKey =  547527  -- �i������-�M������

	CloseSpeak(player)
	Setflag(player,547527 , 1 ) -- ���������Ȫ�KEY
end

-- �������ȫ�Ĳ�o�ƥ�
function mika_4years_NPC_quest_02()
	local player = TargetID()  -- ��b�ҪO�ƥ�, TargetID �O���a
	local GetQuestKey =  547527  -- �i������-�M������
	local TodayQuestKey = 547530 -- ���Ѥw��������-�M������

	Setflag(player,GetQuestKey , 0 ) -- �R �����Ȫ�KEY
	Setflag(player,TodayQuestKey , 1 ) -- �� �������Ȫ�KEY
	DesignLog( player , 121805 , "4 years event - venue cleaning complete." )
end

---------------------------- �Ǫ�����  ----------------------------
--107622 �v���~ ���ҪO��l�@��  -- ���� ����n����
function mika_4years_ev1_monster_01()
	local Bird = OwnerID()
	local range = 25
	local X = ReadRoleValue(Bird, EM_RoleValue_X )
	local Y = ReadRoleValue(Bird, EM_RoleValue_Y )
	local Z = ReadRoleValue(Bird, EM_RoleValue_Z )	

	WriteRoleValue(bird, EM_RoleValue_Register1, X )
	WriteRoleValue(bird, EM_RoleValue_Register2, Y )
	WriteRoleValue(bird, EM_RoleValue_Register3, Z )

--	local R1 = ReadRoleValue(bird, EM_RoleValue_Register1 )  -- X
--	local R2 = ReadRoleValue(bird, EM_RoleValue_Register2 )  -- Y
--	local R3 = ReadRoleValue(bird, EM_RoleValue_Register3 )  -- Z
--	say(bird, "R1 ="..R1..", R2 = "..R2..", R3 = "..R3 )
	Callplot(Bird, "mika_4years_ev1_monster_02", 0)  -- �����a�@��
	MoveToFlagEnabled( Bird , false )-- �������޼@��
	Callplot(Bird, "Hao_Obj_Mobile", bird, 4, range , 1 )
end


-- �j�M���a 
function mika_4years_ev1_monster_02()
	local Bird = OwnerID()
	local magicid =	850608
	local R = Rand(2)+1  -- 1 ~ 2
	local CDtime = R*5

	while true do 
		local PID = ReadRoleValue(bird, EM_RoleValue_PID )

	--	WriteRoleValue(bird, EM_RoleValue_Register, 0)

		if PID ~= 99 then  -- �p�Gpid�O99, �h�Ohide���A���]�U��
			local allplayeys = SearchRangePlayer(Bird, 10)
			if #allplayeys > 0 then
				SysCastSpellLv( Bird , Bird , magicid , 0 )  -- CD 3 ��
			end
		end
		sleep(10+CDtime)  
	end
end


function mika_4years_ev1_item_check()
	local player = OwnerID()
	local Target = TargetID()
	local npcid = 107622

	if ReadRoleValue(Target, EM_RoleValue_OrgID ) ~= npcid then
		ScriptMessage( player, player, 1, "[SC_421101_0]", 0 );   -- �ؼп��~
		return false
	else
		if PID ~= 99 then
			return true
		end
	end
end

function mika_4years_ev1_item_use()
	local player = OwnerID()
	local Target = TargetID()
	local killid = 107623
	local R = Rand(100)+1
	local rate = 85  -- ���\���v
	local PID = ReadRoleValue(Target, EM_RoleValue_PID )

	if R >= (100-rate+1) then  
		UseItemDestroy()
		DW_QietKillOne(player, killid )  -- �t�t�����@��NPC 
		Callplot(Target, "mika_4years_ev1_monster_reset", 0)
	--	CallPlot( Target, "LuaFunc_ResetObj",Target )
	else
		ScriptMessage( player, player, 1, "[SC_DE_4TH_Q1_ITEM_01]", C_SYSTEM )   -- [107622]�F�Ӧa�ò�F�A������
	end


end

function mika_4years_ev1_monster_reset()
	local bird = OwnerID()
	local Room = ReadRoleValue( bird , EM_RoleValue_RoomID )
	local BirdID = 107622
	local reborntime = 15  -- ���ͮɶ� 15
	local range = 25
	local R1 = ReadRoleValue(bird, EM_RoleValue_Register1 )  -- X
	local R2 = ReadRoleValue(bird, EM_RoleValue_Register2 )  -- Y
	local R3 = ReadRoleValue(bird, EM_RoleValue_Register3 )  -- Z

	WriteRoleValue(bird, EM_RoleValue_PID, 99)
	hide(bird)
	Sleep(reborntime*10)  
	local NewBird = CreateObj( BirdID , R1 , R2 , R3 , 0 , 1 )	-- ���ͯQ�~
	Hao_Germany_4th_Obj_Status( NewBird , Room , false , true , false , true )	-- ��ܥͦ����A(����BRoom�B���סB�Y���ءB����B�аO)
	BeginPlot( NewBird , "mika_4years_ev1_monster_01" , 0 )
	DelObj(bird)

end