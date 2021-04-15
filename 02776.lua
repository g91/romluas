----------------- box -----------------
-- pid  - �ж��s��
-- r+1 - �p�ɾ��ɶ�
-- r+2 - �ж����s�p�ɶ}��
	
---------------- ���a ----------------
-- EM_LuaValueFlag_UseItem43   -- �Ҧb�ж�id

-- �U�|���ܽШ���NPC ------------------------------------

function Lua_Mika_weddingCard_set()  --�ө��]�w ���b����Npc���󲣥ͼ@��
	local NPC = OwnerID()
	SetMinimapIcon( NPC, EM_MapIconType_Shop )
	SetShop( NPC , 600431 , "Test_Shop_Close" )  -- �B§�ө�
end

function Lua_Mika_weddingCard_NPC0()
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- ����Ѿl�ɶ� 25�����H�W�~�i�A�ʶR �J����O20���� 
--	local limit =300  -- ���եήɶ�
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�

--	say(NPC, "timer ="..timer )
	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC04]")   --�ݭn�ʶR�B§�ܽШ�άO�|���\�I�\�]�ܡH

	AddSpeakOption( Player, Player, "[SC_2012MARRY_SHOPSNPC05]" , "Marry_Shop", 0 )  -- �ʶR�\�I�\�]
	if CheckBuff(Player, 623790 ) == true then  -- �s�H����~�i�ʶR�ܽШ�
		if timer >= limit then
			AddSpeakOption( Player, Player, "[SC_2012MARRY_SHOPSNPC06]" , "Lua_Mika_weddingCard_NPC1", 0 )  -- �ʶR�B§�ܽШ�
		end
	end
end

function Lua_Mika_weddingCard_NPC1()
	local Player = OwnerID()
	local Count = {1, 5, 10 }

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC01]")   --�@�ͥu���@�������B��§�A�˪B�n�ͪ����֬O���i�ίʪ��A�ݭn�ʶR�B§�ܽШ�o�e���n�ͶܡH
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[1].."]","Lua_Mika_weddingCard_NPC2("..Count[1]..")", 0)  -- �ڭn�ʶR�ܽШ�[$VAR1]�i
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[2].."]","Lua_Mika_weddingCard_NPC2("..Count[2]..")", 0)  
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[3].."]","Lua_Mika_weddingCard_NPC2("..Count[3]..")", 0)  

end

function Lua_Mika_weddingCard_NPC2(count)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- ����Ѿl�ɶ� 25�����H�W�~�i�A�ʶR �J����O20���� 
--	local limit =300  -- ���եήɶ�
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�

	local money = 5000
	local pay = count*money

	if timer >= limit then
		SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC03][$SETVAR1="..count.."][$SETVAR2="..pay.."]")   --�A����ʶR�ܽШ�[$VAR1]�i�A�`�@�O[$VAR2]���A�T�w�n�ʶR�ܡH
		AddSpeakOption( Player, Player, "[SC_GETTITLE_1]" , "Lua_Mika_weddingCard_NPC3("..pay..")", 0 )  -- �T�w
	else
		CloseSpeak(Player)
		ScriptMessage( player, player, 1, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	-- �B§�|�������}��ɶ��N��A�L�k�A�ܽЪB�ͤJ���C
		ScriptMessage( player, player, 0, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	
	end

end

function Lua_Mika_weddingCard_NPC3(pay)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- ����Ѿl�ɶ� 25�����H�W�~�i�A�ʶR �J����O20���� 
--	local limit =300  -- ���եήɶ�
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�

	local itemlist = { 
			241977, 241978 , 241979 ,
 			241980, 241981 , 241982 ,
 			241983, 241984 , 241985 
			}  -- �ǰe�۪�id
	local money = 5000
	local count = pay/money  -- �Ӽ�
	local SN = ReadRoleValue(NPC, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )
	local itemid = itemlist[SN]
	local NeedSpace = count  -- �ݭn�I�]�Ŷ���
	local NeedSpaceStatus  = Check_Bag_Space( Player , NeedSpace  )   -- �ˬd��ƬO�_�� true = �� , false = ����
 
	CloseSpeak(Player)
	if timer >= limit then 
		if NeedSpaceStatus == true then  -- �I�]�Ŷ��ƶq��
			if ReadRoleValue( Player , EM_RoleValue_Money ) < pay then  -- �������B����
				ScriptMessage( player, player, 1, "[SC_BUY_MONEY]" , 0 )	-- �A�S�������������I
				ScriptMessage( player, player, 0, "[SC_BUY_MONEY]" , 0 )
			else
			--	Say(Player, "itemid ="..itemid.." , count = "..count.. ", pay = "..pay )
				AddRoleValue( Player , EM_RoleValue_Money , -(pay) ) 
				for i = 1 , count do -- ���ӭӼƶ]����
					GiveBodyItem(Player, itemid, 1 )
				end
			end
		end
	else
		ScriptMessage( player, player, 1, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	-- �B§�|�������}��ɶ��N��A�L�k�A�ܽЪB�ͤJ���C
		ScriptMessage( player, player, 0, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	
	end

end

-------------------------------------------------------------

-- �U�|�����J�f�����ê���@�� , objedit �M�μ@��
function Lua_Mika_weddingtrans_box0()
	local box = OwnerID()
	local flagid_1 = { 781213, 781216, 781219, 781214, 781217, 781220, 781215, 781218, 781221 }  -- ��W���I
	local flagid_2 = { 781226, 781229, 781232, 781227, 781230, 781233, 781228, 781231, 781234 }  -- �\�I��
	local flagid_3 = { 781235, 781238, 781241, 781236, 781239, 781242, 781237, 781240, 781243 }  -- �ֹ�

	local SN = ReadRoleValue(box, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )

	local npcid = { 121476, 121477, 121478 }  -- ����M��
		-- 121476 ��W�I��
		-- 121477 �\�I��
		-- 121478 �ֹ�

	WriteRoleValue(box, EM_RoleValue_Register+2, 0 )  -- �p�ɶ}���w�]��0
	local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
--	say(box, "switch = "..Switch )
--	say(box, "SN ="..SN..", flagid_1 = "..flagid_1[SN]..", flagid_2 = "..flagid_2[SN].." , flagid_3 = "..flagid_3[SN] )

	if WeddingObjlist == nil then
		WeddingObjlist = {}  -- �إߪŪ��\�񪫥�M��
	end

	if WeddingObjlist[SN] == nil then
		WeddingObjlist[SN] = {}  -- �إ�Table
	end

	-- �o�O������y�M����Ϊ�
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- �إߪŪ��\�񪫥�M��
	end

	if WeddingObjlist2[SN] == nil then
		WeddingObjlist2[SN] = {}  -- �إ�Table
	end

	--- flag 1 ��W�I��
	local count1 = GetMoveflagCount(flagid_1[SN])  -- �����s���Ѥl���ƶq
--	say(box, "flag count = "..count1 )

	local putnpc1 = {}
	for i= 2 , count1+1 do
		putnpc1[i] = CreateObjByFlag( npcid[1] , flagid_1[SN] , i  , 1 )
		SetModeEx( putnpc1[i]   , EM_SetModeType_ShowRoleHead, True )--�Y����
		SetModeEx( putnpc1[i]   , EM_SetModeType_Mark, True )--�аO
		SetModeEx( putnpc1[i]   , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( putnpc1[i]   , EM_SetModeType_Strikback, false )--����
		SetModeEx( putnpc1[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( putnpc1[i]   , EM_SetModeType_Obstruct, false )--����
		SetModeEx( putnpc1[i]   , EM_SetModeType_Move, false )--����
		SetModeEx( putnpc1[i]   , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( putnpc1[i]   , EM_SetModeType_HideName, false )--�W��
		SetModeEx( putnpc1[i]   , EM_SetModeType_Gravity, false )--���O
		AddToPartition( putnpc1[i], 0 )
	--	say(putnpc1[i],"putnpc 1 = "..i)
	end

	--- flag 2 �\�I��
	local count2 = GetMoveflagCount(flagid_2[SN])  -- �����s���Ѥl���ƶq
--	say(box, "flag count = "..count2 )

	local putnpc2 = {}
	for i= 0 , count2-1 do
		putnpc2[i] = CreateObjByFlag( npcid[2] , flagid_2[SN] , i  , 1 )
		SetModeEx( putnpc2[i]   , EM_SetModeType_ShowRoleHead, True )--�Y����
		SetModeEx( putnpc2[i]   , EM_SetModeType_Mark, True )--�аO
		SetModeEx( putnpc2[i]   , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( putnpc2[i]   , EM_SetModeType_Strikback, false )--����
		SetModeEx( putnpc2[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( putnpc2[i]   , EM_SetModeType_Obstruct, false )--����
		SetModeEx( putnpc2[i]   , EM_SetModeType_Move, false )--����
		SetModeEx( putnpc2[i]   , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( putnpc2[i]   , EM_SetModeType_HideName, false )--�W��
		SetModeEx( putnpc2[i]   , EM_SetModeType_Gravity, false )--���O
		AddToPartition( putnpc2[i], 0 )
	--	say(putnpc2[i],"putnpc 2 = "..i)
	end

	--- flag 3 ���F�ֹ�
	local putnpc3 = CreateObjByFlag( npcid[3] , flagid_3[SN] , 0  , 1 )
	SetModeEx( putnpc3   , EM_SetModeType_ShowRoleHead, True )--�Y����
	SetModeEx( putnpc3   , EM_SetModeType_Mark, True )--�аO
	SetModeEx( putnpc3   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( putnpc3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( putnpc3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( putnpc3   , EM_SetModeType_Obstruct, false )--����
	SetModeEx( putnpc3   , EM_SetModeType_Move, false )--����
	SetModeEx( putnpc3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( putnpc3   , EM_SetModeType_HideName, false )--�W��
	SetModeEx( putnpc3   , EM_SetModeType_Gravity, false )--���O
	AddToPartition( putnpc3, 0 )

--	say(box, "Create point ok" )
	SetPlot( box , "range","Lua_Mika_weddingtrans_box2" , 50 )  --box �d��@��

end

function Lua_Mika_weddingtrans_box2()    --box �d��@��
	local Player = OwnerID()
	local box = TargetID()
	local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
	local fulltime = 3600   -- ��l�p�ɾ��ɶ�   ���T�ɶ�3600
--	local fulltime = 600   -- ��l�p�ɾ��ɶ� ���ծɶ��� 600
	local EnterKey =  545671-- keyitem �ǤJ�ϰ�ɵ���
	local roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43  )  -- �ж�ID
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 ) --Ū���O���bbox���ݾl�ɶ�

--	say(box, "switch = "..Switch )
	if Checkflag(Player, EnterKey) == false then  -- �S���ǤJ�ϰ쪺key (�����Ĳ�o�@��)
		Setflag(Player, 545671, 1 )  -- �����i�J�ϰ쪺key  
		AddBuff(Player, 623833, 0, -1 )  -- ���P���u��W�u�@��BUFF   -- Lua_Mika_weddingtrans_buffevt2
		AddBuff(Player, 624426, 0, -1 )  -- ���֮�^  6.0.1 �s�WBUFF  �Ω󭭨�PK�M�ǰe�N

		if Switch > 0 then -- �w���Ĥ@�ӤH�}��timer
		--	say(Player, "timer 1 = "..timer ) 
	
			if CheckBuff(Player, 623790) == true then  -- ���s�Hbuff
				CancelBuff(Player, 623790  )
				AddBuff(Player, 623790, 0, timer )  -- �� �p�H�B§�|�����ɾ��� BUFF  �ΨӧP�_�|���ܽШ�NPC
			else  -- ���O�s�H�䤤���@
				AddBuff(Player, 623791, 0, timer )  -- �����Ѿl�ɶ� �p�H�B§�|�����ɾ��� BUFF
			end

		else  -- ���}��
			if CheckBuff(Player, 623790) == True then  -- ���s�Hbuff
				WriteRoleValue(box, EM_RoleValue_Register+2, 1 )  -- �p�ɾ��} , �]��1
				CancelBuff(Player, 623790  )
				AddBuff(Player, 623790, 0, fulltime )  -- �� �p�H�B§�|�����ɾ��� BUFF  �ΨӧP�_�|���ܽШ�NPC
			--	say(box, "Switch = "..Switch..", Roomid = "..roomid ) 

				WriteRoleValue(box, EM_RoleValue_Register+1, fulltime ) 
				local timer =ReadRoleValue(box, EM_RoleValue_Register+1 ) --Ū���O���bbox���ݾl�ɶ�
			--	say(Player, "timer 2 = "..timer ) 

				Callplot(box, "Lua_Mika_weddingtrans_box3", roomid )  -- ����box�}�l�˼ƭp��
			end
		end
	end
end

-- box �p�ɶ}�l
function Lua_Mika_weddingtrans_box3(roomid)
	local box = OwnerID()
	local npcid = 121476 -- �\��Ѧ��I����id
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }

--	say(box, "count down start." )

	while true do 
		AddRoleValue(box, EM_RoleValue_Register+1, -1 ) 
		local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- �ثe�Ѿl�ɶ�
	--	say(box, "timer ="..timer )

		if timer == 0 then  -- ��|���ɶ��� (�N���\�񪺪���~�[����^�ѦҪ���  /  �N�@���ܼ��k�s )
	--		say(box, "timer up" )
		
			Lua_Mika_wedding_itemtest1(roomid)  -- ���m�ӰϩҦ����a�\�]����

			-- �N��box���p�ɾ��}�����m
			WriteRoleValue(box, EM_RoleValue_Register+2, 0 )  -- �p�ɶ}���w�]��0
			local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
		--	say(box, "switch = "..Switch )

			-- �N���ж����@���ܼ��k�s ( ���s�}��ж� )	 
		--	Say(box, "Roomid = "..roomid )
			local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
			Room = Room - number[roomid]
			SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- �]�w�@���ܼ� 
		--	Say(box, "new Room status = "..Room)

			break
		end

		sleep(10)  -- �C1��]����
	end
end	

-- buff �ƥ� 1 -  buff�ɶ���  (  1.�R���ж��Ǹ� 2.  �p�G�b���ǰϰ�N�ǥX )
function Lua_Mika_weddingtrans_buffevt1()
	local Player = OwnerID()
	local zonelist = { 305, 306, 307 }

	ScriptMessage( player, player, 1, "[SC_2012MARRY_TRANSNPC18]" , 0 )	-- [623790]�ĪG�w���
	ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC18]" , 0 )

	
	SetFlag( Player , 541320 , 0 ) --  �N�������ж�id�k�s
	Setflag( Player, 545671, 0 )  -- �R���i�J�|��KEY   -- 2013.08.13 �ק�
	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
--	say(Player, "SN ="..SN )

	-- �p�G����b�B§�ϰ�N�ǥX
	local myzone = ReadRoleValue(Player, EM_RoleValue_ZoneID ) 
--	say(Player, "My zone ="..myzone )
	if myzone == zonelist[1] or myzone == zonelist[2] or myzone == zonelist[3] then  
		ChangeZone( Player , 2 , 0, 4678 , 110, -2220, 0 )   -- �Ǧ^�����s���J�f
	end

end

-- buff �ƥ�2 - ���a�W�u��Ĳ�o ( �Ǩ줤���s�� )
function Lua_Mika_weddingtrans_buffevt2()
	local Player = OwnerID()
	local zonelist = { 305, 306, 307 }

	if CheckBuff(Player, 623790) == false then
		SetFlag( Player , 541320 , 0 )
		Setflag( Player, 545671, 0 )  -- �R���i�J�|��KEY   -- 2013.08.13 �ק�
		WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
		local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	--	say(Player, "SN ="..SN )
		ScriptMessage( player, player, 1, "[SC_2012MARRY_TRANSNPC18]" , 0 )	-- [623790]�ĪG�w���
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC18]" , 0 )

	end

	-- �p�G����b�B§�ϰ�N�ǥX
	local myzone = ReadRoleValue(Player, EM_RoleValue_ZoneID ) 
--	say(Player, "My zone ="..myzone )
	if myzone == zonelist[1] or myzone == zonelist[2] or myzone == zonelist[3] then  
		ChangeZone( Player , 2 , 0, 4678 , 110, -2220, 0 )   -- �Ǧ^�����s���J�f
	end

end


-- ���m��roomid���Ҧ�����
function Lua_Mika_wedding_itemtest1(Roomid)

	if WeddingObjlist ~= nil then
	--	say(Player, "obj reset 1_1 ")
		if WeddingObjlist[Roomid] ~= nil then
		--	say(Player, "obj reset 1_2 ")
			for i = 1,  #WeddingObjlist[roomid] do
				local objorgid = ReadRoleValue(WeddingObjlist[roomid][i], EM_RoleValue_OrgID)
				local putgroup_1 = {121494, 121495, 121496, 121503, 121504, 121505, 121506, 121507, 121508 }  -- �J�| ���� �I��
				local putgroup_2 = {121509, 121510, 121511 }  -- �\��
				local putgroup_3 = {121512, 121513, 121514 }  -- ���F�ֹ�
				local putnpc = { 121476, 121477, 121478 }  -- �J�|�����I�� / �\��/ ���F�ֹ� �ѦҪ���

				if objorgid == putgroup_1[1] or objorgid == putgroup_1[2] or objorgid == putgroup_1[3] or objorgid == putgroup_1[4] or objorgid == putgroup_1[5] or objorgid == putgroup_1[6] or objorgid == putgroup_1[7] or objorgid == putgroup_1[8] or objorgid == putgroup_1[9] then
					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[1] )  -- �Ntable�����C�@�Ӫ���~�[��^ �ѦҪ���	
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 1 "..i)
				elseif objorgid == putgroup_2[1] or objorgid == putgroup_2[2] or objorgid == putgroup_2[3] then
  					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[2] )  -- �Ntable�����C�@�Ӫ���~�[��^ �ѦҪ���
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 2 "..i)
				elseif objorgid == putgroup_3[1] or objorgid == putgroup_3[2] or objorgid == putgroup_3[3] then
  					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[3] )  -- �Ntable�����C�@�Ӫ���~�[��^ �ѦҪ���
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 3 "..i)
				end
				SetPlot( WeddingObjlist[roomid][i], "touch" , "" , 0)
				SetModeEx( WeddingObjlist[roomid][i] , EM_SetModeType_ShowRoleHead, true )--�}���Y����
			end
		end
	end

--	say(Player, "del obj grroup 1 ok")

	if WeddingObjlist2 ~= nil then
	--	say(Player, "obj reset 2_1 ")
		if WeddingObjlist2[Roomid] ~= nil then
		--	say(Player, "obj reset 2_2")
			for j = 1, #WeddingObjlist2[roomid] do
			--	say(WeddingObjlist2[roomid][j], "del obj "..j)
				DelOBJ(WeddingObjlist2[roomid][j])  -- �R������P��y
			end
		end	
	end

--	say(Player, "del obj grroup 2 ok")
end