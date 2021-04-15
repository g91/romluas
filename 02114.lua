
function Lua_Az190_NpcTalk()
	LoadQuestOption(OwnerID())
	if CheckQuest(TargetID(),423656,0) then
		AddSpeakOption(OwnerID(),TargetID(),"SC_ZONE190_RETURN","Lua_Az190_NpcReTalk",0)
	end
end

function Lua_Az190_NpcReTalk()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"SC_ZONE190_SELECT","Lua_Az190_NpcTalk",0)
end

function Lua_Az190_Tank_1()							--攻城車模版產生劇情
	AddBuff(OwnerID(),505923,10,-1)				--攻擊NPC威力UP
	AddBuff(OwnerID(),505516,300,-1)				--被NPC攻擊威力UP
end

function Lua_Az190_TankCreate()						--任務完成產生攻城車
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Tank=star_CreateObj( OwnerID() , 104765 , DW_Rand(50) , 0 , DW_Rand(50) , RoomID , 90) --依據OwnerID位置創造XXX偏離XYZ座標,zoomID,面向
	AddToPartition(Tank,RoomID)
end

function Lua_Az190_Tank_2(Seat,UpDown)				--攻城車主要script
	local SkillID={495083,--重槌撞擊
				   495240,--摧毀標記	
				   495092,--安心修理鎚	
				   495093,--銅鑼撞擊	
				   495241,--摧毀標記	
				   495239,--巨鎚撞擊	
				   495242,--摧毀標記	
				   495094}--疾馳衝撞	
	local SkillLv={110,110,110,110,110,110,110,110}
	local PassCard=CountBodyItem(OwnerID(),206769)	
	if UpDown==1 then
		SetFlag(OwnerID(),543769,1)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID())
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
		if PassCard > 0 then
			SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
			SetExSkill( OwnerID() , TargetID() , SkillID[3] , SkillLV[3] )
			SetExSkill( OwnerID() , TargetID() , SkillID[4] , SkillLV[4] )
			SetExSkill( OwnerID() , TargetID() , SkillID[5] , SkillLV[5] )
			SetExSkill( OwnerID() , TargetID() , SkillID[6] , SkillLV[6] )
			SetExSkill( OwnerID() , TargetID() , SkillID[7] , SkillLV[7] )
			SetExSkill( OwnerID() , TargetID() , SkillID[8] , SkillLV[8] )
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
		----	AddBuff(TargetID(),506159,Set_A,-1)
		else
		---	AddBuff(TargetID(),506159,0,-1)
		end
		--ScriptMessage(OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_81]",C_SYSTEM) 
	---	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_81]",C_SYSTEM) 
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
			--AddBuff(TargetID(),506159,Set_A,-1)
		end
		DelExSkill( OwnerID() , TargetID() ,495083 )
		DelExSkill( OwnerID() , TargetID() ,495240 )
		DelExSkill( OwnerID() , TargetID() ,495092 )
		DelExSkill( OwnerID() , TargetID() ,495093 )
		DelExSkill( OwnerID() , TargetID() ,495241 )
		DelExSkill( OwnerID() , TargetID() ,495239 )
		DelExSkill( OwnerID() , TargetID() ,495242 )
		DelExSkill( OwnerID() , TargetID() ,495094 )
	end
end

function Lua_Az190_BowCreate_1()					--弩砲建造點觸碰劇情
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az190_BowCreate_2",50)
end

function Lua_Az190_BowCreate_2(Seat,UpDown)			--弩砲建造劇情
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ItemCount=CountBodyItem(OwnerID(),208309)
	local Bow=Lua_DW_CreateObj("obj",104766,TargetID(),0,1)
	local atk =ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)
	--say(OWnerID(),"Oatk = "..atk)
	--say(targetID(),"tar")
		if atk==1 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_STKING]",0)
		elseif atk == 0 then
			if ItemCount<40 then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_NOTENOUGH]",0)
		--		say(TargetID(),"Not Enough")
			else
				CastSpellLv(TargetID(),TargetID(),496415,0)
				sleep(30)
				ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE190_GETEXP]",0)
				AddRoleValue(OwnerID(),EM_RoleValue_EXP,20000)
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---反擊
				DelBodyItem (OwnerID(),208309,40)
				AddToPartition(Bow,RoomID)
				SetPlot(Bow,"dead","Lua_Az190_BowDead",0)
				sleep(10)
				DelObj(TargetID())
			end
		end	
end

function Lua_Az190_BowDead()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Struck=Lua_DW_CreateObj("obj",116806,OwnerID(),1,1)
	BeginPlot(Struck,"Lua_Az190_BowCreate_1",0)
	sleep(20)
	DelObj(OwnerID())
end

function Lua_Az190_Bow_1()
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---反擊
	AddBuff(OwnerID(),505923,200,-1)
	AddBuff(OwnerID(),505516,300,-1)
end

function Lua_Az190_Bow_2(Seat,UpDown)
	local SkillID={ 495085,	--弩砲射擊
					495090}	--連續掃射
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
		--ScriptMessage(OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_81]",C_SYSTEM) 
		---ScriptMessage(OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_81]",C_SYSTEM) 
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

function Lua_Az190_QuestDetail()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
--	AddBorderPage( OwnerID(),"")
	ClearBorder(OwnerID())
	AddBorderPage( OwnerID(), GetString("ST_200936_1"))					--字串待改
	ShowBorder( OwnerID(), 423676, str,"ScriptBorder_Texture_Paper" )	
end

function Lua_Az190_BowCreate_20(Seat,UpDown)							--弩砲建造劇情
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bow=Lua_DW_CreateObj("obj",104766,OwnerID(),0,1)
	CastSpellLv(OwnerID(),OwnerID(),496415,0)
	sleep(30)
	AddToPartition(Bow,RoomID)
	SetPlot(Bow,"dead","Lua_Az190_BowDead",0)
	sleep(10)
end