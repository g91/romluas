-----------�M�h
function LuaS_422378_0() --����@��
	local Killer = HateListInfo(TargetID() ,0 , EM_HateListInfoType_GItemID )
	if	ReadRoleValue(Killer,EM_RoleValue_IsPlayer) == 1	then
		if	(CheckAcceptQuest(Killer,422378)	or
			CheckAcceptQuest(Killer,422367))	and  --�������ȴN��
			CheckBuff(Killer,503612)		and
			CountBodyItem(Killer,204891)<10	then
			GiveBodyItem(Killer,204891,1)
		end
	end
	NPCDead( TargetID() , TargetID() )
	DelObj(TargetID())
end

function LuaS_422378_1() --�������Ĥ@�W������
	local Hate = HateListInfo(OwnerID() ,0 , EM_HateListInfoType_HatePoint )
	Hate = Hate - 3000 
	SetHateListPoint( OwnerID() , 0 , Hate ) --�ק盧���
end

function LuaS_422378_3() -- �򥻪k�N���ˬd�@��(�u��@���ǲ��ͮĪG)
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102114	then
		return true
	end
	return false
end

function LuaS_422378_2() -- ��ܼ@��
	if	(CheckAcceptQuest( OwnerID(), 422378 )		or
		CheckAcceptQuest( OwnerID(), 422367 ))		and
		CheckBuff(OwnerID(),503612)==false		and
		CountBodyItem(OwnerID(),204891)<10	then
		SetSpeakDetail ( OwnerID() , "[SC_422367]" )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422367_1]","LuaS_422378_7",0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422367_2]","LuaS_422378_8",0)
		return
	end

	if	CountBodyItem(OwnerID(),204891)>9	then
		if	CheckBuff(OwnerID(),503612)		then
			CancelBuff_NoEvent( OwnerID(), 503612)
		end
		SetSpeakDetail ( OwnerID() , "[SC_422367_6]" )
		return
	end
	SetSpeakDetail ( OwnerID() , "[SC_422367_0]" )
end

function LuaS_422378_7() -- ��ܼ@��
	SetSpeakDetail ( OwnerID(),"[SC_422367_3]")
	if	not	CheckBuff(OwnerID(),503612)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422367_4]","LuaS_422378_4",0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422367_5]","LuaS_422378_8",0)
	end
end

function LuaS_422378_8() -- ��ܼ@��
	CloseSpeak( OwnerID() );
end

function LuaS_422378_9()
	if CountBodyItem(OwnerID(),204891) < 10 then
		SetFlag(OwnerID(),542722,0)
		DelBodyItem(OwnerID(),204891,CountBodyItem(OwnerID(),204891))
	end
end

function LuaS_422378_4() --�s�X�Q����  �Ǧ����e ���Ѷ}�����
	AddBuff(OwnerID(),503612,1,40) --4040404040
	SetFlag(OwnerID(),542722,1)
	CloseSpeak( OwnerID() );
	DisableQuest( TargetID() , true )
	BeginPlot(TargetID(),"LuaS_422378_6",0)
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422367_7]" , C_Red )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422367_7]" , 0 )
end

function LuaS_422378_5() -- ���b�Ǩ��W���@��  �Ӥ[�S�H���N����
	sleep(100)
	for i=1,20	do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 1	then
			i=1
		end
		if	i==20	then
			DelObj(OwnerID())
		end
	end
end


function LuaS_422378_6()
	local QuestMob = {}
	local loop = 0
	for i = 1,10	do
		QuestMob[i] = Lua_DW_CreateObj("flag",102114, 780089,i)
		BeginPlot(QuestMob[i] ,"LuaS_422378_5",0)
	end
	while loop==0 do
		sleep(10)
		for i = 1,10	do
			if	CheckID(QuestMob[i])	then
				break
			end
			if	i==10	then
				loop = 1
			end
		end
	end
	DisableQuest( OwnerID() , false )
end

----�v���

function LuaS_422380_0()
	SetPlot(OwnerID(),"range","LuaS_422380_1",70)
	AddBuff(OwnerID(),503616,1,-1)
end

function LuaS_422380_1() -- �����H
	if	not CheckBuff(OwnerID(),503609)	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==0	then
		BeginPlot(TargetID(),"LuaS_422380_2",0)
	end
	if	CheckBuff(OwnerID(),500675) == false	and
		CheckBuff(OwnerID(),500745) == false	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==0	then
		BeginPlot(TargetID(),"LuaS_422380_2",0)
	end
end

function LuaS_422380_2() --�z���{��
	CastSpell(OwnerID(),OwnerID(),493370)
	sleep(10)
	CastSpellLv(TargetID(),TargetID(),492587,200)
end

function LuaS_422380_3() --�����
	local Bomb = SearchRangeNPC ( OwnerID() , 30 )
	for	i=0,table.getn(Bomb)	do
		if	ReadRoleValue(Bomb[i],EM_RoleValue_OrgID) == 102116	and
			math.abs(ReadRoleValue(Bomb[i],EM_RoleValue_Y)-ReadRoleValue(OwnerID(),EM_RoleValue_Y)) < 50	then --���䦳���u
			BeginPlot(Bomb[i],"LuaS_422380_2",0)
			return
		end
	end
end

function LuaS_422380_4()
	if	CountBodyItem(OwnerID(),204869)<1	then
		SetFlag(OwnerID(),542703,0)
		DelBodyItem(OwnerID(),204871,1)
	end
end

function LuaS_422380_5() --��ܼ@��
	if	(CheckAcceptQuest( OwnerID(), 422380)	or
		CheckAcceptQuest( OwnerID(), 422369 ))	and
		CheckBuff(OwnerID(),503609)==false		and
		CountBodyItem(OwnerID(),204869)<1		then
		SetSpeakDetail ( OwnerID(),"[SC_422369]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422367_1]","LuaS_422380_10",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422367_2]","LuaS_422378_8",0)
		return
	end

	if	CountBodyItem(OwnerID(),204871)> 0		then
		if	CheckBuff(OwnerID(),503609)		then
			SetSpeakDetail ( OwnerID(),"[SC_422369]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422369_3]","LuaS_422380_9",0)
			return
		else
			if	(CheckAcceptQuest( OwnerID(), 422380)	or
				CheckAcceptQuest( OwnerID(), 422369 ))	then

				SetSpeakDetail ( OwnerID(),"[SC_422369]")
				AddSpeakOption(OwnerID(),OwnerID(),"[SC_422367_1]","LuaS_422380_10",0)
				AddSpeakOption(OwnerID(),OwnerID(),"[SC_422367_2]","LuaS_422378_8",0)
				return
			end
		end
	end



	if	CountBodyItem(OwnerID(),204869)>0	then
		if	CheckBuff(OwnerID(),503609)	then
			SetSpeakDetail ( OwnerID(),"[SC_422369_5]")
			return
		end
	end
	SetSpeakDetail ( OwnerID(),"[SC_422369_0]")
end

function LuaS_422380_10()
	SetSpeakDetail ( OwnerID(),"[SC_422369_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422369_2]","LuaS_422380_6",0)
end

function LuaS_422380_6()
	DelBodyItem(OwnerID(),204871,CountBodyItem(OwnerID(),204871))
	CloseSpeak(OwnerID());
	AddBuff(OwnerID(),503609,1,60)
	SetFlag(OwnerID(),542703,0)
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422369_6]" , C_Red )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422369_6]" , 0 )
end

function LuaS_422380_7()
	SetPlot(OwnerID(),"touch","LuaS_422380_8",50)
end

function LuaS_422380_8()
	if	CheckBuff(OwnerID(),503609) 		and
		CountBodyItem(OwnerID(),204871)<1		and
		CountBodyItem(OwnerID(),204869)<1		then
		GiveBodyItem(OwnerID(),204871,1)
		SetFlag(OwnerID(),542703,1)
	end
end
function LuaS_422380_9()
	SetSpeakDetail ( OwnerID(),"[SC_422369_4]")
	if	CountBodyItem(OwnerID(),204871)> 0		and
		CheckFlag(OwnerID(),542703)		then
		CancelBuff_NoEvent( OwnerID(), 503609)
		DelBodyItem(OwnerID(),204871,1)
		GiveBodyItem(OwnerID(),204869,1)
	end
end

----�k�v

function LuaS_422382_0()  --�F�誺�X�ͼ@��
	SetPlot(OwnerID(),"dead","LuaS_422382_1",0)
	AddBuff(OwnerID(),503606,1800,-1)
	AddBuff(OwnerID(),502550,1800,-1)--
end

function LuaS_422382_1() -- �F�覺�����׭^�X��
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	CallPlot(OwnerID(),"LuaS_422382_7",TargetID())
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false ) 
	SetModeEx( OwnerID() , EM_SetModeType_Show, false ) 
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false ) 
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false ) 
	local BuffCount = BuffCount(OwnerID())
	if BuffCount > 0 then
		for i = 1 ,BuffCount do
			local BuffID = BuffInfo( OwnerID(), BuffCount-i , EM_BuffInfoType_BuffID)
			CancelBuff_NoEvent( OwnerID(), BuffID )
		end
	end
	AddBuff(OwnerID(),503606,1800,-1)--
	AddBuff(OwnerID(),502550,1800,-1)--
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	AddToPartition(OwnerID(),0)
	return false
end

function LuaS_422382_2(Tar) --�׭^�]�w
	SetPlot(OwnerID(),"dead","LuaS_422382_4",0)
	AddBuff(OwnerID(),503606,1800,-1)
	SetAttack(OwnerID(),Tar)
	BeginPlot(OwnerID(),"LuaS_422382_6",0)
end

function LuaS_422382_3(Boss) --���m�����ˬd
	while true do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0	and
			CheckID(Boss) == false				then
			SetModeEx( OwnerID() , EM_SetModeType_Fight , true ) 
			SetModeEx( OwnerID() , EM_SetModeType_Show, true ) 
			SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true ) 
			SetModeEx( OwnerID() , EM_SetModeType_Mark , true ) 
			Lua_CancelAllBuff( OwnerID()) 
			AddBuff(OwnerID(),503606,1800,-1)--
			AddBuff(OwnerID(),502550,1800,-1)--
			AddToPartition(OwnerID(),0)
			return
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) ~= 0	then
			return
		end
	end
end

function LuaS_422382_4() --�׭^���� ���p�Ǹs�n��
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local PID = ReadRoleValue(Master,EM_RoleValue_PID) -- �i�{
	PID = PID + 1
	WriteRoleValue(Master,EM_RoleValue_PID,PID) -- �g�J
	CallPlot(Master,"LuaS_422382_5",TargetID())
end

function LuaS_422382_5(Tar) -- �X���P�ɺʱ�
	local Mouse = {}
	for i = 1, 15	do
		Mouse[i] = Lua_DW_CreateObj("flag",102121,780088,i)
		BeginPlot(Mouse[i],"LuaS_422382_6",0)
		AddBuff(Mouse[i],503606,1800,-1)
		SetAttack(Mouse[i],Tar)
	end
	while true do
		sleep(10)
		for i=1,15	do
			if	CheckID(Mouse[i])	then  -- ���F�~��L��
				break
			end
			if	i == 15	then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				SetModeEx( OwnerID() , EM_SetModeType_Fight , true ) 
				SetModeEx( OwnerID() , EM_SetModeType_Show, true ) 
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true ) 
				SetModeEx( OwnerID() , EM_SetModeType_Mark , true ) 
				Lua_CancelAllBuff( OwnerID()) 
				AddBuff(OwnerID(),503606,1800,-1)--
				AddBuff(OwnerID(),502550,1800,-1)--
				AddToPartition(OwnerID(),0)
				return
			end
		end
	end
end

function LuaS_422382_6() -- ���b�Ǩ��W���@��  �Ӥ[�S�H���N����
	sleep(100)
	for i=1,20	do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 1	then
			i=1
		end
		if	i==20	then
			DelObj(OwnerID())
		end
	end
end

function LuaS_422382_7(TargetID)
	sleep(10)
	local	Boss = Lua_DW_CreateObj("flag",102122,780088,1)
	CallPlot(Boss,"LuaS_422382_2",TargetID)
	WriteRoleValue(Boss,EM_RoleValue_PID,OwnerID())
	CallPlot(OwnerID(),"LuaS_422382_3",Boss )
	while CheckID(Boss)	do
		local BuffCount = BuffCount(OwnerID())
		if BuffCount> 0 then
			for i = 1 , BuffCount do
				local BuffID = BuffInfo( OwnerID(),BuffCount-i , EM_BuffInfoType_BuffID)
				CancelBuff_NoEvent( OwnerID(), BuffID )
			end
		end
		AddBuff(OwnerID(),503606,1800,-1)
		WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
		sleep(10)
	end
end