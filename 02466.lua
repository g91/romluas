--104767  �����سy�INPC  119188 �o�ۥx�سy�I
----------------------------------------------------------------------------**�K�O
function Lua_un190_BowCreate_1_2()					--�����سy�IĲ�I�@��
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_un190_BowCreate_2_2",50)
end

function Lua_un190_BowCreate_2_2(Seat,UpDown)			--�����سy�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ItemCount=CountBodyItem(OwnerID(),208677)
	local Bow=Lua_DW_CreateObj("obj",106011,TargetID(),0,1)
	local atk =ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)
		if atk==1 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_STKING]",0)
		elseif atk == 0 then
			if ItemCount<0 then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_NOTENOUGH2]",0)
		--		say(TargetID(),"Not Enough")
			else
				CastSpellLv(TargetID(),TargetID(),496415,0)
				sleep(30)
				--ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE190_GETEXP]",0) --���g���
				--AddRoleValue(OwnerID(),EM_RoleValue_EXP,20000)                --���g���
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---����
				--DelBodyItem (OwnerID(),208677,1)
				AddToPartition(Bow,RoomID)
				SetPlot(Bow,"dead","Lua_un190_BowDead_2",0)
				sleep(10)
				DelObj(TargetID())
			end
		end	
end 
function Lua_un190_BowDead_2()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Struck=Lua_DW_CreateObj("obj",119188,OwnerID(),1,1)
	BeginPlot(Struck,"Lua_un190_BowCreate_1_2",0)
	sleep(20)
	DelObj(OwnerID())
end
----------------------------------------------------------------------------**�K�O
function Lua_un190_BowCreate_1()					--�����سy�IĲ�I�@��
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_un190_BowCreate_2",50)
end

function Lua_un190_BowCreate_2(Seat,UpDown)			--�����سy�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ItemCount=CountBodyItem(OwnerID(),208677)
	local Bow=Lua_DW_CreateObj("obj",106011,TargetID(),0,1)
	local atk =ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)

		if atk==1 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_STKING]",0)
		elseif atk == 0 then
			if ItemCount<1 then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_NOTENOUGH2]",0)
		--		say(TargetID(),"Not Enough")
			else
				CastSpellLv(TargetID(),TargetID(),496415,0)
				sleep(30)
				--ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE190_GETEXP]",0) --���g���
				--AddRoleValue(OwnerID(),EM_RoleValue_EXP,20000)                --���g���
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---����
				DelBodyItem (OwnerID(),208677,1)
				AddToPartition(Bow,RoomID)
				SetPlot(Bow,"dead","Lua_un190_BowDead",0)
				sleep(10)
				DelObj(TargetID())
			end
		end	
end

function Lua_un190_BowDead()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Struck=Lua_DW_CreateObj("obj",119188,OwnerID(),1,1)
	BeginPlot(Struck,"Lua_un190_BowCreate_1",0)
	sleep(20)
	DelObj(OwnerID())
end

function Lua_un190_Bow_1()
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---����
	AddBuff(OwnerID(),505923,200,-1)
	AddBuff(OwnerID(),505516,300,-1)
end

function Lua_un190_Bow_2(Seat,UpDown)  --���Y�ۨ����W���W�U���@�B�z
	local SkillID={ 498229,	--�����g��
					498229}	--�s�򱽮g
	local SkillLv={110,110}
	local PassCard=CountBodyItem(OwnerID(),206769)	
	if UpDown==1 then
		SetFlag(OwnerID(),543769,1)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID())
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
		if PassCard > 0 then
			SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
		else
			SetExSkill( OwnerID() , TargetID() , SkillID[Seat+1] , SkillLV[Seat+1] )
		end
		local Count=BuffCount(TargetID())
		local Set_A=-1
		for i=0,count,1 do 
			local BuffID=BuffInfo(TargetID(),i,EM_BuffInfoType_BuffID)
			if BuffID==506159 then
				local BuffLv=BuffInfo(TargetID(),i,EM_BuffInfoType_Power)
				Set_A=BuffLv
			end
		end
		if Set_A>-1 then
			Set_A=Set_A+1
			CancelBuff(TargetID(),506159)
			---AddBuff(TargetID(),506159,Set_A,-1)
		else
		----	AddBuff(TargetID(),506159,0,-1)
		end
	elseif UpDown == 0 then--�U����
		SetFlag( OwnerID()  , 543769 , 0 )--���a�b����W���X��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
		for i=1,table.getn(SkillID),1 do
			DelExSkill(OwnerID(),TargetID(),SkillID[i])
		end
		local Count=BuffCount(TargetID())
		local Set_A=-1
		for i=0,count,1 do 
			local BuffID=BuffInfo(TargetID(),i,EM_BuffInfoType_BuffID)
			if BuffID==506159 then
				local BuffLv=BuffInfo(TargetID(),i,EM_BuffInfoType_Power)
				Set_A=BuffLv
			end
		end
		if Set_A==0 then
			CancelBuff(TargetID(),506159)
		else
			Set_A=Set_A-1
			CancelBuff(TargetID(),506159)
		-----	AddBuff(TargetID(),506159,Set_A,-1)
		end
		DelExSkill( OwnerID() , TargetID() ,495085 )
		DelExSkill( OwnerID() , TargetID() ,495090 )
	end
end

function Lua_un190_QuestDetail()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
--	AddBorderPage( OwnerID(),"")
	ClearBorder(OwnerID())
	AddBorderPage( OwnerID(), GetString("ST_200936_1"))					--�r��ݧ�
	ShowBorder( OwnerID(), 423676, str,"ScriptBorder_Texture_Paper" )	
end

function Lua_un190_BowCreate_20(Seat,UpDown)							--�����سy�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bow=Lua_DW_CreateObj("obj",106011,OwnerID(),0,1)
	CastSpellLv(OwnerID(),OwnerID(),496415,0)
	sleep(30)
	AddToPartition(Bow,RoomID)
	SetPlot(Bow,"dead","Lua_un190_BowDead",0)
	sleep(10)
end
-------------------------------------------------------------------------------------------------****�H�U��t�@��
function lua_zone190_NPCplay()  --���bNPC�W �кX��780827  0~10�A0~5�p�ǡA6���O�I�A7~10 ĵ��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local monster
	local NPC = {}
	for i= 1 , 4 do
		NPC[i] = CreateObjByFlag( 105010, 780827 , i+6 , 1 )
		AddToPartition(NPC[i],RoomID)
	end
	
	while 1 do
	
		NPCSay( OwnerID(), "[SC_ZONE190_02]" )
		sleep(10)
		for i = 0 , 5 do  --��
			monster = CreateObjByFlag( 105009, 780827 , i , 1 )
			beginplot(monster,"un_zone190_9898",0)
			AddToPartition(monster,RoomID)
		end
		sleep(300)
	end
end
function un_zone190_9898()---���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780827 ,6,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				delobj(OWnerID())
				end
			end
		end	
		sleep(10)
	end
end

function un_498229_checkboss()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ==104903 or 
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ==104666 then
		return false
	else
		return true
	end	

end