---------�n�ʸ`���B§��----------------------------------------------------------------------------------
function LuaI_206812()

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM_1][$SETVAR1="..RoleName.."][$SETVAR2=[206812]][$SETVAR3=[203229]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM_1][$SETVAR1="..RoleName.."][$SETVAR2=[206812]][$SETVAR3=[203274]]"
	local itemset = { }

	itemset = {	2 , Prize1Str 	, { 203229 , 1 } , --�ä[�n���_�_�d���J		���v	2/ 100
			4 , Prize2Str 	, { 203274 , 1 } , --�ä[�n�ʩ��d���J		���v	2/ 100
			7 , "" 		, { 206238 , 1 } , --30�ѷo�J3000���M		���v	3/ 100
			12 , "" 		, { 203878 , 1 } , --���ĲM���t�Ũ�		���v	5/ 100
			20 , "" 		, { 203877 , 1 } , --�j�ĲM���t�Ũ�		���v	8/ 100
			30 , "" 		, { 240741 , 1 } , --�n�ʬ�§��			���v	10/ 100
			40 , "" 		, { 240742 , 2 } , --�����n�ʿL��			���v	10/ 100
			 55, "" 		, { 240525 , 3 } , --�C�m�δο}			���v	15/ 100
			 70, "" 		, { 240524 , 3 } , --�������߿}			���v	15/ 100
			 100, "" 	, { 207963 , 3 } } --���|�귽�]			���v	30/ 100

	return BaseTressureProc(   itemset , 1 )
end
----------�n�ʸ`���y�I����-----------------------------------------------------------------------------------
function Lua_ying_Pumpkin_119980speak()


	local Player = OwnerID()
	local NPC = TargetID()

	AdjustFaceDir( NPC , Player , 0 ) --NPC���V���a
	SetSpeakDetail( Player , "[SC_PUMPKIN_2011_1]" ) --�_�I�̡A�A�n��ڬO�n�ʸ`���ʼ��y�I�����I 
	AddSpeakOption( Player , NPC , "[SC_111490_DIALOG1]" , "LuaS_111490_1", 0 )  -- �ڷQ�F�ѫn�ʸ`���Ѩ� 
	AddSpeakOption( Player , NPC , "[SC_PUMPKIN_2012_01]" , "Lua_ying_Pumpkin_119980speak2(".."119980"..")", 0 ) -- �ڷQ��20��[209433]�I���ǯS�O��...
	AddSpeakOption( Player , NPC , "[SC_PUMPKIN_2012_02]" , "Lua_ying_Pumpkin_119980speak2(".."1199801"..")", 0 ) -- �ڷQ��20��[209433]�I���ǯS�O��...
end
--------�ڷQ�I�����y-------------------------------------------------------------------------------------------
function Lua_ying_Pumpkin_119980speak2(Num)

	local Player = OwnerID()
	local NPC = TargetID()
	local Count = CountBodyItem( Player , 209433 ) --�ˬd�n�ʵw��
	local Itemset = {}
	local NpcID = { 119980 , 1199801 }	-- �n�ʸ`Npc ID	119980 = ���2011�~���y�B1199801 = ���2012�~���y
	local Random
	local Status = 0
	local Sex = ReadRoleValue( Player , EM_RoleValue_Sex )	-- �ʧO
	local Costume

	if Num == NpcID[1] then
		if Count < 10 then
			SetSpeakDetail( Player , "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			if Check_Bag_Space( Player , 1 ) == false then
				SetSpeakDetail( Player , "[SC_CHANGEGOOD_1_2]" ) -- �z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				return false
			else	
				SetSpeakDetail ( Player , "[SC_111490_DIALOG8]" ) --���z�n�ʸ`�ּ֡I
				GiveBodyItem( Player , 206812 , 1 ) --�����n�ʸ`���B§��
				DelBodyItem( Player , 209433 , 10 )
				PlayMotion( Npc , 106 ) -- �I�Y
				DesignLog( Player , Num , "Accept" )
			end
		end
	elseif Num == NpcID[2] then
		if Count < 20 then
			SetSpeakDetail( Player , "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
		else
			if Check_Bag_Space( Player , 2 ) == false then
				SetSpeakDetail( Player , "[SC_CHANGEGOOD_1_2]" ) -- �z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				PlayMotion( Npc , 107 )	-- �n�Y
				return false
			else
				if Sex == 0 then	-- �k��
					Costume = 241847	-- ����]�����§��
				else			-- �k��
					Costume = 241848	-- ����]�����§��
				end
			
			--	itemset[1]  = {	30	,	{ 725649 , 1 } ,		-- ��O�Ĥ�
			--			40	,	{ 726135 , 1 } ,		-- ���|�j���u��c
			--			50	,	{ 201141 , 1 } ,		-- �ᥧ�J������ū
			--			75	,	{ 201139 , 1 } ,		-- �j�ѨϪ���ū
			--			80	,	{ 241845 , 1 } ,		-- �R�d�Ǹ˹��]
			--			95	,	{ 241846 , 1 } ,		-- �p�o�J�٦�]
			--			100	,	{ Costume , 1 }	}	-- ����]�����§��
			--   2013���y�A�оB���W��������
				itemset[1]  = {	15	,	{ 242521 , 1 } ,		-- �P�h�˳���y�]
						25	,	{ 242514 , 1 } ,		-- ����@�ť]
						40	,	{ 242517 , 1 } ,		-- �����������ƥ]
						50	,	{ 201141 , 1 } ,		-- �ᥧ�J������ū
						75	,	{ 201139 , 1 } ,		-- �j�ѨϪ���ū
						80	,	{ 241845 , 1 } ,		-- �R�d�Ǹ˹��]
						95	,	{ 241846 , 1 } ,		-- �p�o�J�٦�]
						100	,	{ Costume , 1 }	}	-- ����]�����§��


						
				itemset[2] = { 3 , 241460 , 1 }	-- �ѯ����~����
				itemset[3] = { 241479 , 15 }	-- �ɭ�����*15
				
				Random = rand(100)
				for i = 1 , #(itemset[1]) , 2 do
					if Random < itemset[1][i] and Status == 0 then
						for j = 1 , #(itemset[1][i+1]) , 2 do
							GiveBodyItem( Player , itemset[1][i+1][j] , itemset[1][i+1][j+1] )
							Status = 1
						end
					--	DebugMsg( Player , 0 , "Random = "..Random.." itemset = "..itemset[1][i].." Status = "..Status )
					end
				end
				
				Random = rand(100)
			--	DebugMsg( Player , 0 , "Random2 = "..Random.." itemset = "..itemset[2][1] )
				if Random < itemset[2][1] then
					GiveBodyItem( Player , itemset[2][2] , itemset[2][3] )
				end				
				GiveBodyItem( Player , itemset[3][1] , itemset[3][2] )
				SetSpeakDetail( Player , "[SC_111490_DIALOG8]" ) -- ���z�n�ʸ`�ּ֡I
				DelBodyItem( Player , 209433 , 20 )
				PlayMotion( Npc , 106 ) -- �I�Y
				DesignLog( Player , Num , "Accept" )
			end
		end
	end
end

function lua_KORS_hollowen_itemgive()
local OID = OwnerID()
local item ={240913,240914,240915,240928,240929,240930,240931,240932,240933,240934,240935,240936,240937,227539}
	for i = 1 , 14 do
		GiveBodyItem( OID , item[i] , 1)
	end
end