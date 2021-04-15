--104767  弩砲建造點NPC  119188 發石台建造點
----------------------------------------------------------------------------**免費
function Lua_un190_BowCreate_1_2()					--弩砲建造點觸碰劇情
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_un190_BowCreate_2_2",50)
end

function Lua_un190_BowCreate_2_2(Seat,UpDown)			--弩砲建造劇情
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
				--ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE190_GETEXP]",0) --給經驗值
				--AddRoleValue(OwnerID(),EM_RoleValue_EXP,20000)                --給經驗值
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---反擊
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
----------------------------------------------------------------------------**免費
function Lua_un190_BowCreate_1()					--弩砲建造點觸碰劇情
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_un190_BowCreate_2",50)
end

function Lua_un190_BowCreate_2(Seat,UpDown)			--弩砲建造劇情
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
				--ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE190_GETEXP]",0) --給經驗值
				--AddRoleValue(OwnerID(),EM_RoleValue_EXP,20000)                --給經驗值
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---反擊
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
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---反擊
	AddBuff(OwnerID(),505923,200,-1)
	AddBuff(OwnerID(),505516,300,-1)
end

function Lua_un190_Bow_2(Seat,UpDown)  --掛頭石車身上的上下載劇處理
	local SkillID={ 498229,	--弩砲射擊
					498229}	--連續掃射
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
	elseif UpDown == 0 then--下車時
		SetFlag( OwnerID()  , 543769 , 0 )--玩家在載具上之旗標
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
	AddBorderPage( OwnerID(), GetString("ST_200936_1"))					--字串待改
	ShowBorder( OwnerID(), 423676, str,"ScriptBorder_Texture_Paper" )	
end

function Lua_un190_BowCreate_20(Seat,UpDown)							--弩砲建造劇情
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bow=Lua_DW_CreateObj("obj",106011,OwnerID(),0,1)
	CastSpellLv(OwnerID(),OwnerID(),496415,0)
	sleep(30)
	AddToPartition(Bow,RoomID)
	SetPlot(Bow,"dead","Lua_un190_BowDead",0)
	sleep(10)
end
-------------------------------------------------------------------------------------------------****以下表演劇情
function lua_zone190_NPCplay()  --掛在NPC上 創旗標780827  0~10，0~5小怪，6中力點，7~10 警衛
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
		for i = 0 , 5 do  --怪
			monster = CreateObjByFlag( 105009, 780827 , i , 1 )
			beginplot(monster,"un_zone190_9898",0)
			AddToPartition(monster,RoomID)
		end
		sleep(300)
	end
end
function un_zone190_9898()---走旗標
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