-- 2012.11.09 lua �@�~
-- ���gLua�D�ءG
-- �Q�ΰ}�C�A�Ыؤ@�ӿ��i�H�H���X�{5�Ӯy�M�A�����a��ܡA��ܫ᪱�a�|�����W�y�M�A�`�H���y�M�ƶq20�A�X�{���y�M���n��W����ܪ��@�� 
-----------------------------------------------------------------------------------------------------
function lua_mika_mountsummon_0()
	BeginPlot(OwnerID(), "lua_mika_mountsummon", 0 )
end

function lua_mika_mountsummon()
	local Player = OwnerID();
	local list = {
		505075,	--�M�����a�b�k
		505111,	--�M���r�V�b�k
		505113,	--�M�������԰�
		505127,	--�M�������԰�
		505472,	--�M���Һ����L
		505473,	--�M���խ߹��L
		505474,	--�M���a�����L
		505475,	--�M�����V���L
		505476,	--�M���`�W���L
		505477,	--�M���]����L
		505478,	--�M���ƥ����I
		505479,	--�M�����K�԰�
		505480,	--�M���s��Ծs
		505481,	--�M���Ȫe�Ѱ�
		506001,	--�M���զ��@��
		506002,	--�M���¦��@��
		506109,	--�M���Ħ��@��
		506137,	--�M���������j
		506174,	--�M���ɭ��N���~
		506175	--�M���N�����C��
		}
	local DialogStatus = 0
	local choosed = ReadRoleValue(Player, EM_RoleValue_Register+1)
	local count = 5
	local number
	local uselist = {}

	DialogCreate( Player , EM_LuaDialogType_Select , "choose one" )

	if choosed ~= 0  then  -- �W������L
		for i = 1, #list do
			if choosed == list[i] then
				table.remove{list, i }  -- ����list �S�w��m������
			end
		end
	end
	
	for i = 1, (count) do  -- �D5��
		number = Rand(#list)+1
		table.insert(uselist, list[number] )
		table.remove(list, number)
		DialogSelectStr( Player , "["..uselist[i].."]"  )
	end

	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Player );--�����]�_�Ӫ����ݦ^�Х�function
	say(Player, "SelectID ="..SelectID )
	if SelectID == 0 then
		AddBuff(Player, uselist[1], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[1] )
	elseif SelectID == 1 then
		AddBuff(Player, uselist[2], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[2] )
	elseif SelectID == 2 then
 		AddBuff(Player, uselist[3], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[3] )
	elseif SelectID == 3 then
		AddBuff(Player, uselist[4], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[4] )
	elseif SelectID == 4 then
		AddBuff(Player, uselist[5], 0, -1)
		WriteRoleValue(Player, EM_RoleValue_Register+1, uselist[5] )
	end
	DialogClose(Player)
end

-------------
--lua�i���D��1�G�b���a�e��C50�Z���إ�1�ӽc�l�@10�ӽc�l�A�b�c�l�W����10�Ӥ��@�˪�npc�A�C������W����npc�H�����t
--lua�i���D��2�G�b���a����l�إߤ@��npc�A�u�۽c�l�����j�B�A�D�Ω��e����̫�@�ӽc�l�A�b���^�ӡC���g�H�GFN�B�����B�p���B���E�B����
--lua�i���D��3�G�D��2��npc�����H���Ϋe�i�C���g�H�G�p���B���E

function lua_mika_hw1211_test01()
	local Player = OwnerID()
	local NPCList = {
			114578,
			114579,
			114580,
			114581,
			114582,
			114583,
			114709,
			114710,
			114711,
			114712
			}
	local boxid = 110267
	local range = 50
	local nowrange = 0
	local allcount  =  10
	local box = {}
	local npc = {}	
	local box_x = {}
	local box_y = {}
	local box_z = {}
	local box_Dir = {}

	for i  = 1, 10 do
		addrange = range*(i-1)
		say(Player, "addrange = "..addrange )
		box[i] = Lua_CreateObjByDir( Player , boxid , range+addrange , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
		AddToPartition( Box[i], 0 )
		SetModeEx( Box[i], EM_SetModeType_Obstruct, true )
		box_x[i] = ReadRoleValue(box[i], EM_RoleValue_X)
		box_y[i] = ReadRoleValue(box[i], EM_RoleValue_Y )
		box_z[i] = ReadRoleValue(box[i], EM_RoleValue_Z )
		box_Dir[i] = ReadRoleValue(box[i], EM_RoleValue_Dir)

		local number = Rand(#NPCList)+1  -- �q�ثetable �̭��Ѿl�ƶq ��1��
		npc[i] = CreateObj( NPCList[number], box_x[i] , box_y[i]+30 ,  box_z[i] , box_Dir[i] , 1 )--�Ǫ��N��
		AddToPartition( npc[i], 0 )
		table.remove(NPCList, number )  -- �N�����X��m�qtable ����
		PlayMotionEX( npc[i], ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
		sleep(10)
	end

end

----------------------------------
function lua_mika_musictest1212_1()
	local Player = OwnerID()

	Lua_StopBGM(Player)  -- ����ثe���񭵼�
	say(Player, "Start 1")
	local MusicID  = PlayMusicToPlayer(player,"music/wedding/fairytales_06_COL_ARO_home.mp3", true )--���s�X������

	sleep(200)
	StopSound(Player,MusicID)  -- ����MusicID�o���W�D���n��
	Lua_PlayBGM(Player)
	say(Player, "Stop 1")
end

function lua_mika_musictest1212_2()
	local Player = OwnerID()

	Lua_StopBGM(Player)  -- ����ثe���񭵼�
	say(Player, "Start 2")
	local MusicID  = PlayMusicToPlayer(player,"music/GuildWar/epic_tales_01_APF_chaos.mp3", true )--���s�X������

	sleep(200)
	StopSound(Player,MusicID)  -- ����MusicID�o���W�D���n��
	Lua_PlayBGM(Player)
	say(Player, "Stop 2")
end



-----------------
function lua_mika_test_round_01(number)
	local box = OwnerID()
	local X_pos = ReadRoleValue(box, EM_RoleValue_X )
	local Y_pos = ReadRoleValue(box, EM_RoleValue_Y )
	local Z_pos = ReadRoleValue(box, EM_RoleValue_Z )
	local range = 50
	local obj = {}
	for i = 1,number do
		obj[i] = CreateObj( 100292, X_pos+(range*math.cos(math.pi*2*(i/number))), Y_pos, Z_pos+(range*math.sin(math.pi*2*(i/number))), 0, 1 )
		AddToPartition( obj[i], 0 )	
	end
end
