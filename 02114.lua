
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

function Lua_Az190_Tank_1()							--�𫰨��Ҫ����ͼ@��
	AddBuff(OwnerID(),505923,10,-1)				--����NPC�¤OUP
	AddBuff(OwnerID(),505516,300,-1)				--�QNPC�����¤OUP
end

function Lua_Az190_TankCreate()						--���ȧ������ͧ𫰨�
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Tank=star_CreateObj( OwnerID() , 104765 , DW_Rand(50) , 0 , DW_Rand(50) , RoomID , 90) --�̾�OwnerID��m�гyXXX����XYZ�y��,zoomID,���V
	AddToPartition(Tank,RoomID)
end

function Lua_Az190_Tank_2(Seat,UpDown)				--�𫰨��D�nscript
	local SkillID={495083,--���l����
				   495240,--�R���аO	
				   495092,--�w�߭ײz��	
				   495093,--���r����	
				   495241,--�R���аO	
				   495239,--������	
				   495242,--�R���аO	
				   495094}--�e���ļ�	
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

function Lua_Az190_BowCreate_1()					--�����سy�IĲ�I�@��
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az190_BowCreate_2",50)
end

function Lua_Az190_BowCreate_2(Seat,UpDown)			--�����سy�@��
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
				SetModeEx(Bow,EM_SetModeType_Strikback,false) ---����
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
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---����
	AddBuff(OwnerID(),505923,200,-1)
	AddBuff(OwnerID(),505516,300,-1)
end

function Lua_Az190_Bow_2(Seat,UpDown)
	local SkillID={ 495085,	--�����g��
					495090}	--�s�򱽮g
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

function Lua_Az190_QuestDetail()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
--	AddBorderPage( OwnerID(),"")
	ClearBorder(OwnerID())
	AddBorderPage( OwnerID(), GetString("ST_200936_1"))					--�r��ݧ�
	ShowBorder( OwnerID(), 423676, str,"ScriptBorder_Texture_Paper" )	
end

function Lua_Az190_BowCreate_20(Seat,UpDown)							--�����سy�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bow=Lua_DW_CreateObj("obj",104766,OwnerID(),0,1)
	CastSpellLv(OwnerID(),OwnerID(),496415,0)
	sleep(30)
	AddToPartition(Bow,RoomID)
	SetPlot(Bow,"dead","Lua_Az190_BowDead",0)
	sleep(10)
end