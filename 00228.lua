------------------------�@�q�ɶ������Ĳ�o���s����---------------

Function Lua_Discowood_CheckCombat(Time)
	--Time ����b�԰��~�s�b�̧C�ɶ�(�H��p��)
	local Count = 0
	while true do
		sleep(10)
		--�O�_�b�԰���
--		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
		if HateListCount( OwnerID() ) > 0 then 
			sleep(50)
		else
			if Count > Time and  ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  ==  0 then
				BeginPlot(OwnerID() , "Lua_Discowood_Revive" , 0 )
				break
			end
			sleep(50)
			Count = Count + 6
		end
	end
	
end

Function Lua_Discowood_Revive()
	LuaFunc_ResetObj( OwnerID() )
end

-------------------------------���Ǫ��b�D�԰��U�۰ʮ���------------------------
Function LuaFunc_Obj_Suicide(Time)
	--Time ����s�b���̧C�ɶ�
	Sleep(Time)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- �����ˬd�@��	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				DelObj( OwnerID() )
			end
			break		
		end
	sleep(1)
	end
end
-----------------------------�B��NPC��Ĳ�o�@��----------------------
function LuaFunc_Obj_BUSY() -- ���T��
	ScriptMessage( OwnerID(), OwnerID(), 1,GetString("SAY_NPC_BUSY"), 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );

end

function LuaFunc_Obj_Nothing() -- �L�T��

	--NOTHING

end		
-----------------------------�ˬd���a����---------------------------
function LuaFunc_PlayerCheck( ItemID , DBID)

	if CheckID(  ItemID ) == false then
		return false;
	end

	local Obj = Role:new( ItemID )
	if  Obj:GetDBID() ~= DBID or Obj:IsPlayer() == false then
		return false;
	end
	
	return true;

end
------------------------------�üƲ���-----------------------------
function Func_rand_walker(ItemID,Range,SleepSec)
	--ItemID ����ID
	--Range �è����d��
	--SleepSec �j�h�[�ܴ��@����V
	if CheckID(ItemID) then
		local Role = Role:new( ItemID )
		local X = Role:X() + rand(Range/2) + (Range/2)
		local Y = Role:Y()
		local Z = Role:Z()+ rand(Range/2) + (Range/2)

		if Range <= 0 then Range = 0 end
		if Range >= 1000 then Range = 1000 end 
		if SleepSec <= 1 then SleepSec = 1 end

		Move(  ItemID  , X , Y , Z )--��MOVE�O�]����m���񪺪�ê�����@�w�A�קK�]�������m�ӳy�����_
		sleep( SleepSec )
	else
		return Say(OwnerID(),"Error")
	end
end
-------------------------------�ˬd���a�O�_�٦b����-----------------------------------------------------
function Luafunc_Player_Alive( Player,DBID,Range ) 
	if LuaFunc_PlayerCheck( Player , DBID) then
		if CheckDistance( OwnerID(), Player, Range ) then
			return true
		else
			return false
		end
	end
	
	return false	
end
-----------------------------�q�ΨT�w�����ܼ@��------------------------------------------------------------
Function LuaI_CommonSpeak_A() --�N���禡���J��l�@���Y�i
	SetPlot( OwnerID() , "Touch" , "LuaFunc_CommonSpeak_A", 40)
end

Function LuaFunc_CommonSpeak_A()
	BeginPlot( TargetID(),"LuaFunc_NPCSpeak_A", 0 )
end

function LuaFunc_NPCSpeak_A()

	local Target = Role:new(TargetID())
	local Owner = Role:new(OwnerID())
	local Switch
	Switch = Rand( 20 )
	if Switch == 0 then
		if Owner:Sex() == 0 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_1")) --/*�����I�ڳ��w�A���~���C
		elseif Owner:Sex() == 1 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_2")) --/*���I�o�N�O�̪�y�檺�A���ܡH
		else
			Say( OwnerID() , GetString("SAY_COMSPEAK_3")) --/*......
		end		
	elseif Switch == 1 then
		if Target:Sex() == 0 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_4")) --/*��w�A���͡C
		elseif Target:Sex() == 1 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_5")) --/*��w�A�k�h�C
		else
			Say( OwnerID() , GetString("SAY_COMSPEAK_6")) --/*��w�A�j�H�C
		end
	elseif Switch == 2 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_7")) --/*�J�|�}�Ȫ��Ԫ������D����ɭԤ~�|����...
	elseif Switch == 3 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_8")) --/*�̪�n�����ܦh�����]�ڪ��ǻD...
	elseif Switch == 4 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_9")) --/*�A���D�j�N����ܡH�̪�n���ܦh�H��o�ӫܦ�����...�����`ı�o�o�تF���٬O�ָI�����C
	elseif Switch == 5 then
			Say( OwnerID() , GetString("SAY_COMSPEAK_10")) --/*�ڦ��عw�P...�o�ӥ@�ɱN�o�ͫܤj���ܤơA����
	else
			Say( OwnerID() , GetString("SAY_COMSPEAK_11")) --/*��p�A���٦��ƭn���C
	end
	sleep( 30 )

end
-----------------------�j�M�S�w�˪O�N��NPC--------------------------------------------------------------------
function LuaFunc_SearchNPCbyOrgID( GuildItem , NPCOrgID , Range , Type)
	--GuildItem �@���d��зǪ����� ID
	--NPCOrgID �n�j�M�� NPC �˪O ID
	--Range �H GuildItem �����ߪ��j�M�b�|
	--Type 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼСA���j���즹�ؼЫh�^��-1
	--     1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�
	--     �i����A�w�]�� 0
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GuildItem,Range )
	local NPCCount = 0
	if Type == nil then
		Type = 0
	end
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == NPCOrgID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
			Ret[NPCCount] = ID
			NPCCount = NPCCount + 1;
		end
	end	
	Ret[ NPCCount ] = -1;
	if NPCCount < 2 then
		if Type == 0 then
			return Ret[0]
		else
			return Ret
		end
	else
		return Ret;
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaFunc_PartyData(Obj)  --���o Obj ���ݪ�������
	-- �Ĥ@�Ӧ�m������H��
	-- ��l��m���������ID

	local Party = {}
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local n = 0
	Party[0] = GetPartyID( Obj , -1 )

	if Party[0] == 0 then
		Party[0] = 1
		Party[1] = Obj 
	else
		for i = 1 , Party[0], 1 do
			local Player = GetPartyID( Obj, i )
			if ReadRoleValue( Player , EM_RoleValue_RoomID ) == RoomID and CheckID(Player)  then
				n = n + 1
				Party[n] = Player
			end
		end
		Party[0] = n
	end

	return Party
end
---------------------------------------------�ഫ��Ь�����-------------------------------------------------
function LuaFunc_Obj_Cusor_A()
	SetCursorType( OwnerID() , 0 )
end
---------------------------------------------------����----------------------------------------------------------
function LuaFunc_DeadPlay()
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end
function LuaFunc_DeadPlay_Sub()
	sleep(15)
	DelObj( OwnerID() )
end

---------------------------------------------------�ˬd����S�w����s�b�~�i�ϥΪ��~�ӱo��t�@�˪��~---------------------------------------------------------
function LuaFunc_ItemCheckObj( Type , Obj , Range ,QuestID , GiveItem )
	if Type == "CHECK" then
		if CheckAcceptQuest( OwnerID() , QuestID ) == true and CountBodyItem( OwnerID() ,GiveItem) == 0 then
			local CheckPoint = LuaFunc_SearchNPCbyOrgID( OwnerID(), Obj  ,Range, 1)
			if CheckPoint[0] == -1 then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_FIND_NO_OBJ"), 0 ); 
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_FIND_NO_NEED"), 0 ); 
			return false
		end
	elseif Type == "USE" then
		if CheckAcceptQuest( OwnerID() , QuestID ) == true and CountBodyItem( OwnerID() ,GiveItem) == 0 then
			GiveBodyItem( OwnerID() , GiveItem , 1 )
		end		
	end 
end
----------------------------------------------------�����~�ˬd�I�]�H�μȦs-----------------------------------------------
function Lua_SafeGive( Role , Item , Count )
	if ReadRoleValue( Role , EM_RoleValue_IsPlayer ) == 1 then
		if EmptyPacketCount( Role ) >= 1 and QueuePacketCount( Role ) == 0 then
			if GiveBodyItem( Role , Item , Count ) then
				return true
			end
		else
			ScriptMessage( Role , Role, 0, GetString("MSG_SONGSONGBAGWARN"), 0 ); 		
			return false
		end
	else
		say( Role , "I AM NOT PLAYER" )
		return false
	end
end
------------------------------------------------�ҪO�γq�μ@�����ˬd���~&�I����R�����w���~�ƶq-------------------------
function LuaQ_ComCheck_OnClick(item,count)
	if count > 0 then	
		if CountBodyItem( OwnerID() , Item) < count  then
			local name ="["..item.."]"
			local Str = "[SC_COM_LESS][$SETVAR1="..name.."]"
--			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_COM_LESS"), 0 )
			ScriptMessage( OwnerID(), OwnerID(), 0, Str ,0 )
			return -1
		else
			return 1
		end
	else
		return -1
	end
end
function LuaQ_ComDelObj_AfterClick(item,count)

	if count > 0 then
		if CountBodyItem( OwnerID() , Item) >= count  then
			DelBodyItem( OwnerID() , Item , count )
			return 1
		else
			return -1
		end
	else
		return -1
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaFunc_SearchRoomNPCbyOrgID( GuildItem , NPCOrgID , Type)
	--GuildItem �@���d��зǪ����� ID
	--NPCOrgID �n�j�M�� NPC �˪O ID
	--Type 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼСA���j���즹�ؼЫh�^��-1
	--     1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�
	--     �i����A�w�]�� 0
	local Ret = {}
	local Obj;
	local RoomID = ReadRoleValue( GuildItem , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local NPCCount = 0
	if Type == nil then
		Type = 0
	end
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == NPCOrgID then
			Ret[NPCCount] = ID
			NPCCount = NPCCount + 1;
		end
	end	
	Ret[ NPCCount ] = -1;
	if NPCCount < 2 then
		if Type == 0 then
			return Ret[0]
		else
			return Ret
		end
	else
		return Ret;
	end
end
-------------------
function Lua_ObjLifeTime(Time)--����
	for i=1,Time do
		Sleep(10);
	--	Say(OwnerID(),"i = "..i);
	end;
	DelObj(OwnerID());
end;
--�^�Ǥ@��Index�}�C���e��1~TotalSize���H����Amount��
function Lua_Table_GetRdIndex(TotalSize,Amount)--TotalSize �}�C�j�p, Amount ���X���ƶq
	local AA = {}
	local BB = {}
	for i=1 ,TotalSize do
		AA[i] = i;
	end
	for j=1,Amount do
		local NN = Rand(table.getn(AA))+1
		table.insert(BB,AA[NN])
		table.remove(AA,NN)
	end
--	for i,v in ipairs(BB) do
--		Say(OwnerID(),"v = "..v)
--	end
	return BB;
end
----------------���o�{�b�y�и�T
function Lua_GetPostion(OID)
	if OID == nil then
		local Obj = Role:new( OwnerID() )
		local BaseX = Obj :X()
		local BaseY = Obj :Y()
		local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		return BaseX,BaseY,BaseZ,BaseDir
	else
		local Obj = Role:new( OID )
		local BaseX = Obj :X()
		local BaseY = Obj :Y()
		local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		return BaseX,BaseY,BaseZ,BaseDir
	end
end