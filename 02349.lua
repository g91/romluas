function Lua_ying_springev1_npctalk() 

	AddBuff( TargetID(),  503217, 1, -1) --���b�`�y����NPC�W �A�Y�W���Ϥ��лx
	SetPlot( OwnerID() , "range" , "Lua_ying_springev1_npctalk01" , 50 ) --�d��@���A�ˬd���a�O�_�b�d��50��
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npctalk01()
--	Say(OwnerID(), "Owner") --���a
--	Say(TargetID(), "Target") --NPC
	local A = CheckFlag ( OwnerID() , 544858 ) --�w�PNPC���
	local B = CheckFlag ( OwnerID() , 544859 ) --�w��������
	local C = CheckFlag ( OwnerID() , 544860 ) --�w���\
	local D = CheckFlag ( OwnerID() , 544861 ) --�w��������

	if A == false and B == false and C ==false and D == false then
		tell(  OwnerID() , TargetID() , "[SC_SPRING_2011EV1_01]" ) --�K�y�G" �١�o��B�͡A�@�N���U�A���}�Bť�ڻ��ܡH "
	end
end
------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npcspeak() --NPC �L�g�D�Ԥ��ܤ��e

	local over = CheckFlag( OwnerID() , 544861 ) --�w��������
	local X = CheckFlag( OwnerID() , 544859 ) --�w��������
	local Y = CheckFlag( OwnerID() , 544860 ) --�w���\
	local Z = CheckFlag( OwnerID() , 544858 ) --�w�PNPC���

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if over == true then
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) --�A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
	elseif X == true or Y == true or Z == true then
		LoadQuestOption( OwnerID()) --Ū�����ȼҪO
	else
		SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV1_02]" ) --"�A�n�I�ڬO�K�B�`���ʺ޲z��[118156]��K�B���u�`�S���{�F�A������ť�ݬ�����Ԥ�ߪ��ƶܡH�����쪺���"
		AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV1_03]" , "Lua_ying_springev1_npcspeak01" , 0 ) --�ﶵ"�n�r�I����Ʊ��O�H"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npcspeak01()----�ﶵ"�n�r�I����Ʊ��O�H"

	SetFlag( OwnerID() , 544858 , 1 ) --�����w�PNPC��ܭ��n���~
	LoadQuestOption( OwnerID()) --Ū�����ȼҪO
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_spring_ying_q424039over() --����424039���������
	
	SetFlag( TargetID() , 544858 , 0 ) --�R���w�PNPC���
	SetFlag( TargetID() , 544859 , 0 ) --�R�����ȱ���
	SetFlag( TargetID() , 544860 , 0 ) --�R�����Ȧ��\
	SetFlag( TargetID() , 544861 , 1 ) --���D�Ԥ�-��駹��
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_chkflag() --�M�Ω󶰦X�k�N�W�A�P�_���a�O�_���k�N�ĪG

	local X = CheckFlag( TargetID() , 544859 ) --�ˬd���a���W�O�_����������
	if X == true then
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_monster() --�������ͮɡA���󲣥ͼ@��

	SetPlot( OwnerID() , "range" , "Lua_ying_spring_monster01" , 40 ) --�d��@���A�ˬd���a�O�_�b40�X��
end
---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_monster01() --�b�����]�w�d��(40�X)�A�����I��k�N(Ĳ�o)
--	Say(OwnerID(), "Owner") --���a
--	Say(TargetID(), "Target") --NPC

	local X = Rand(9)+1 --rand(0~8)+1 = 1~9

	if X <=3 then --1~3
		CastSpell( TargetID() , OwnerID() , 497555 ) --�I��k�N���X�G497555 �g�۳���
	elseif X >3 and X <=6 then --4~6
		CastSpell( TargetID() , OwnerID() , 497556 ) --�I��k�N���X�G497556 �z������
	else --7~9
		CastSpell( TargetID() , OwnerID() , 497557 ) --�I��k�N���X�G497557 �B�᳴��
	end
	Sleep(30) --3��
	DelObj( TargetID() ) --�R������ 
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_rabbit() --�ߤl���ͳ���(���󲣥ͼ@��)
--	Say(OwnerID(), "Owner") --NPC
--	Say(TargetID(), "Target") --NPC
	AddBuff( OwnerID() , 508996 , 1 , -1 ) --�ߤl+�t
	BeginPlot( OwnerID() , "Lua_ying_spring_trap01" , 0 ) --���ͳ����j��
	while true do
		BeginPlot( OwnerID() , "Lua_ying_spring_run" , 0 ) --�L������
		sleep(10) --�C�����@��
--		Say(OwnerID() , "1")
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_trap01()

	while true do
--		Say(OwnerID() , "2")
		local Rd = Rand(90)+1 --1~90
	
		if Rd <= 30 then--1~30
			Sleep(100) --10��					
		elseif Rd >30 and Rd<= 60 then --31~60
			Sleep(80) --8��
		else --61~90
			Sleep(60)--6��
		end
		BeginPlot( OwnerID() , "Lua_ying_spring_trap" , 0 ) --���泴��function
--		Say(OwnerID() , "okok")
--		break
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_trap() --���ͳ���

	local Obj = Role:new( OwnerID() ) --�b"�ߤl"���m�A�إ߷s��NPC
	local BaseX = Obj :X() --�ߤl��X�b
	local BaseY = Obj :Y() --�ߤl��Y�b
	local BaseZ = Obj :Z() --�ߤl��Z�b
	local BaseDir = Obj:Dir() --�ߤl�����V
	local Trap --����

	Trap = CreateObj( 105631 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�إ�"����"
	SetModeEx( Trap , EM_SetModeType_Strikback , false ) --������
	SetModeEx( Trap , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
	SetModeEx( Trap , EM_SetModeType_Obstruct , false ) --������
	SetModeEx( Trap , EM_SetModeType_Mark , false ) --���аO
	SetModeEx( Trap , EM_SetModeType_Move , false ) --������
	SetModeEx( Trap , EM_SetModeType_Searchenemy , false ) --������
	SetModeEx( Trap , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( Trap , EM_SetModeType_ShowRoleHead , false ) --������Y����
	SetModeEx( Trap , EM_SetModeType_Fight , false ) --���i�������
	AddToPartition( Trap , 0 ) --�Ϸs�إߥX�Ӫ������X�{
	Sleep(30) --3��
--	Say(OwnerID() , "Del")
	DelObj( Trap ) --�R������
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_run() --��ۨߤl�]
--	Say(OwnerID(), "Owner") --NPC
--	Say(TargetID(), "Target") --NPC
	local Player =SearchRangePlayer( OwnerID() , 70 )

	for i= 0 , table.getn(Player) , 1 do
		local Dis = CheckDistance( OwnerID() , Player[i] , 50 ) --�ˬd���a�P�ߤl���Z��
		local key = CheckFlag( Player[i] , 544859 ) --�ˬd���a���W�O�_��"�w������key"
		local BuffLV = FN_CountBuffLevel( Player[i] , 509701 ) --�ˬd���a���WBUFFLV (�@�}�l�^�ǭȬ�-1�A���C����BUFF�w��ܬ�1 )
		local Count = CountBodyItem( Player[i] , 530716 ) --�ˬd���a���W�O�_���ٸ�
		local Ride = Lua_Mounts_Copilot( Player[i] ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
--		Say( Player[i] , "BuffLV ="..BuffLV)
		if key == true then --���w������key
			if Ride == true then --���b��y
				if Dis == true then --�P�ߤl�Z���b50�X��
					if BuffLV == 58 then --�C����BuffLV60
						SetFlag( Player[i] , 544860 , 1 ) --�������Ȧ��\key
					elseif BuffLV == 148 then --�C����BuffLV150
						if Count < 1 then
							GiveBodyItem( Player[i] , 530716 , 1 ) --�����ٸ�
						end
					end
					DW_CancelTypeBuff( 68,  Player[i] ) --�M�����M�ɡA�U��
					AddBuff( Player[i] , 509701 , 0 , 3 ) --�ܯQ�t
				else --���b�ߤl50�X��
					ScriptMessage( OwnerID() , Player[i] , 1 , "[SC_SPRING_2011EV1_04]" , 0 ) --"غغ�Ԥ�֬ݤ����A�F�A�����W�e���}�B�I"
				end
			end
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------