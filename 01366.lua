

--�T�������T

function LuaS_422115_0()--�㺿�w����ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 422115 )	and
		CheckFlag(OwnerID(),542640)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422115_0]","LuaS_422115_1",0)
	end
end

function LuaS_422115_1()
	SetSpeakDetail ( OwnerID(),"[SC_422115_1]" )
	if	CountBodyItem(OwnerID(),204629) > 0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422115_2]","LuaS_422115_2",0)
	end
end

function LuaS_422115_2()
	SetSpeakDetail ( OwnerID(),"[SC_422115_3]" )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422115_4]","LuaS_422115_3",0)
end

function LuaS_422115_3()
	CloseSpeak( OwnerID() )
	BeginPlot(TargetID(),"LuaS_422115_4",0)
end



function LuaS_422115_4()
	DisableQuest( OwnerID() , true ) --��_��
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
	Say(OwnerID(),"[SC_422115_5]")
	SetDelayPatrolTime( OwnerID(), 0 )
	BeginPlot(OwnerID(),"LuaS_422115_5",0)
end

function LuaS_422115_5()
	DW_MoveToFlag( OwnerID() , 780091 , 2,10 , 1  )
	--�إ���T
	sleep(5)
	local wolf = Lua_DW_CreateObj("flag",101931,780091,1)
	Lua_ObjDontTouch(wolf)
	NPCAttackFlag(wolf)
	sleep(10)
	FaceObj( OwnerID(), wolf )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	SetDefIdleMotion(wolf ,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	sleep(5)
--	SetIdleMotion(OwnerID() ,ruFUSION_ACTORSTATE_COMBAT_UNARMED )
--	SetIdleMotion(wolf ,ruFUSION_ACTORSTATE_COMBAT_UNARMED )
	CastSpellLV( OwnerID(), wolf, 492489, 20 )
	sleep(8)
	CastSpellLV( wolf, OwnerID(), 492489, 20 )
	sleep(10)
	CastSpellLV( OwnerID(), wolf, 492489, 40 )
	sleep(8)
	CastSpellLV( wolf, OwnerID(), 492489, 20 )
	sleep(10)
	CastSpellLV( OwnerID(), wolf, 492489, 100 )
	sleep(10)
	NPCDead( Wolf , OwnerID() )
	sleep(10)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	Say(OwnerID(),"[SC_422115_6]")
	sleep(10)
	if	CheckID(Wolf )	then
		DelObj(Wolf )
	end
	sleep(10)
	DW_MoveToFlag( OwnerID() , 780091 , 3,0 , 1  )
	BeginPlot(OwnerID(),"LuaS_422115_6",0)
end

function LuaS_422115_6()
	DW_MoveToFlag( OwnerID() , 780091 , 4,0 , 1  )
	sleep(10)
	Say(OwnerID(),"[SC_422115_7]")
	BeginPlot(OwnerID(),"LuaS_422115_7",0)
	DisableQuest( OwnerID() , false )
end

function LuaS_422115_7()
	SetFlag( ReadRoleValue(OwnerID(),EM_RoleValue_PID) ,542640,1)
end

--�ӭ�buff

function LuaS_422156_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 422156 )	and
		CheckFlag(OwnerID(),542642)==false		then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422156_0]",  "LuaS_422156_1",  0 );
	end
end

function LuaS_422156_1()
	SetSpeakDetail ( OwnerID(),"[SC_422156_1]" )
	AddBuff(OwnerID(),503385,ReadRoleValue(OwnerID(),EM_RoleValue_LV),1800)
	SetFlag(OwnerID(),542642,1)
end


--���y���

function LuaS_422157_0()--�������ȫ����
	DisableQuest( OwnerID() , true ) --��_��
	sleep(10)
	Say(OwnerID(),"[SC_422157_0]")
	sleep(20)
	local ball = Lua_DW_CreateObj("flag",112399,780092,1,0)
	Lua_ObjDontTouch(ball)
	AddToPartition( ball,0 )
	CastSpell(OwnerID(),ball,493154)
	sleep(25)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422157_2]", 0 ); 
	ScriptMessage( OwnerID(), 0, 0, "[SC_422157_2]", 0 ); 
	sleep(25)
	Say(OwnerID(),"[SC_422157_1]")
	DelObj(ball)
	DisableQuest( OwnerID() , false ) --�Ѷ}
end

function LuaS_422157_1()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112928	then
		BeginPlot(TargetID(),"LuaS_422157_2",0)
	end
	return  1
end


function LuaS_422157_2()
	local ball = Lua_DW_CreateObj("obj",112399,OwnerID(),0)
	Lua_ObjDontTouch(ball)
	AddToPartition( ball,0 )
	sleep( 10 )
	CastSpell(TargetID(),ball,493154)
	sleep(20)
	DelObj(ball)
	local Whichone = DW_Rand(3)
	if	Whichone  == 3	then
		ScriptMessage( TargetID(), TargetID() , 0, "[SC_422157_2]", 0 ); 
		ScriptMessage( TargetID(), TargetID() , 2, "[SC_422157_2]", 0 ); 
		SetFlag(TargetID(),542643,1)
	else
		if	Whichone  == 2	then
			ScriptMessage( TargetID(), TargetID() , 1, "[SC_422157_3]", 0 ); 
		else
			ScriptMessage( TargetID(), TargetID() , 1, "[SC_422157_4]", 0 ); 
		end
	end
end

function LuaS_422157_3()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112931	then
		if	CountBodyItem(OwnerID(),204631)>0	then
			DelBodyItem(OwnerID(),204631,1)
			return 1
		end
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112928	then
		if	CountBodyItem(OwnerID(),204632)>0	then
			return 1
		else
			Lua_DW_CheckSome(204632)
		end
	end
	return false
end

--��ӪF��

function LuaS_422158_0() --��b�ˬd
	if	CheckFlag(OwnerID(),542663)	then --���L�F����
		return false
	end
	if	CheckCompleteQuest(OwnerID(),422158)	then --�����F����
		return false
	end
	local Item = Lua_DW_CreateObj("flag" , 112399, 780093 , 1)
	if	CheckDistance( OwnerID(), Item , 75 )	then
		DelObj(Item)
		return true
	end
	DelObj(Item)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422158_0]", 0 );
	return false

end

function LuaS_422158_1() -- ��b�ϥ�
	local Item = Lua_CreateObjByDir( OwnerID() , 112932  , 25 , 0) 
	AddToPartition(Item,0)
	SetFlag(OwnerID(),542663,1)
	BeginPlot(Item,"LuaS_422158_2",0)
	return 1
end

function LuaS_422158_2()
	sleep(60)
	DelObj(OwnerID())
end


--�Ҹ�



function LuaS_422159_0()
	if	CheckAcceptQuest(OwnerID(),422159)		and
		CheckFlag(OwnerID(),542645)==false		then
		SetSpeakDetail(OwnerID(),"[SC_422159_1]")
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_2]",  "LuaS_422159_1",  0 );
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_3]",  "LuaS_422159_1",  0 );
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_4]",  "LuaS_422159_2",  0 );
	else
		LoadQuestOption(OwnerID());
	end
end

function LuaS_422159_1()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422159_5]")
end

function LuaS_422159_2()
	DisableQuest( TargetID() , true ) --��_��
	CloseSpeak( OwnerID() );
	SetFlag(OwnerID(),542645,1)
	BeginPlot(TargetID(),"LuaS_422159_3",0)

end

function LuaS_422159_3()
	sleep(10)
	Say(OwnerID(),"[SC_422159_6]")
	sleep(20)
	Say(OwnerID(),"[SC_422159_9]")
	sleep(40)
	Say(OwnerID(),"[SC_422159_7]")
	sleep(40)
	ScriptMessage( TargetID(), TargetID() , 1, "[SC_422159_8]", 0 ); 
	ScriptMessage( TargetID(), TargetID() , 0, "[SC_422159_8]", 0 ); 
	DisableQuest( OwnerID() , false ) --turn out
end

--�Ҹ�2
function LuaS_422161_0()
	if	CheckAcceptQuest(OwnerID(),422161)	then
		if	CheckFlag(OwnerID(),542668)	then
			LoadQuestOption(OwnerID());
		end
		if	CheckFlag(OwnerID(),542667)	and
			not	CheckFlag(OwnerID(),542668)	then
			SetSpeakDetail(OwnerID(),"[SC_422161_15]")
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_16]",  "LuaS_422161_1",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_18]",  "LuaS_422161_2",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_20]",  "LuaS_422161_3",  0 );
			return
		end
		if	CheckFlag(OwnerID(),542665)	and
			not	CheckFlag(OwnerID(),542667)	then
			SetSpeakDetail(OwnerID(),"[SC_422161_8]")
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_9]",  "LuaS_422161_4",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_11]",  "LuaS_422161_5",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_13]",  "LuaS_422161_6",  0 );
			return
		end
		if	not	CheckFlag(OwnerID(),542665)	then
			SetSpeakDetail(OwnerID(),"[SC_422161_22]")
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_0]",  "LuaS_422161_7",  0 );
			return
		end
	else
		if	CheckAcceptQuest(OwnerID(),422159)		and
			CheckFlag(OwnerID(),542645)==false		then
			SetSpeakDetail(OwnerID(),"[SC_422159_1]")
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_2]",  "LuaS_422159_1",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_3]",  "LuaS_422159_1",  0 );
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422159_4]",  "LuaS_422159_2",  0 );
		else
			LoadQuestOption(OwnerID());
		end
	end
end

function LuaS_422161_1()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_17]")
end

function LuaS_422161_2()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_19]")
end

function LuaS_422161_3()
	SetSpeakDetail(OwnerID(),"[SC_422161_21]")
	SetFlag(OwnerID(),542668,1)
	SetFlag(OwnerID(),542648,1)
end

function LuaS_422161_4()
	SetSpeakDetail(OwnerID(),"[SC_422161_10]")
	SetFlag(OwnerID(),542667,1)
end

function LuaS_422161_5()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_12]")
end

function LuaS_422161_6()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_14]")
end

function LuaS_422161_7()
	SetSpeakDetail(OwnerID(),"[SC_422161_1]")
	AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_2]",  "LuaS_422161_8",  0 );
	AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_4]",  "LuaS_422161_9",  0 );
	AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422161_6]",  "LuaS_422161_10",  0 );
end

function LuaS_422161_8()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_3]")
end

function LuaS_422161_9()
	SetSpeakDetail(OwnerID(),"[SC_422161_5]")
	SetFlag(OwnerID(),542665,1)
end

function LuaS_422161_10()
	CloseSpeak( OwnerID() );
	Say(TargetID(),"[SC_422161_7]")
end

--���_��


function LuaS_422160_0()
	if	CheckFlag(OwnerID(),542647)	then --���L�F����
		return false
	end
	if	CheckCompleteQuest(OwnerID(),422160)	then --�����F����
		return false
	end

	--�ˬd�O���O�p���
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112847	and
		ReadRoleValue(TargetID(),EM_RoleValue_PID)==0		then

		if	not	CheckDistance( OwnerID(), TargetID(), 80 )		then
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_204637_2]",0)
			return false
		end
		return true
	end
	--���O�N�i�D���a���~
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_421101_0]",0)
	return false
end

function LuaS_422160_1()
	BeginPlot(TargetID(),"LuaS_422160_2",0)
end

function LuaS_422160_2()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
	DisableQuest( OwnerID() , true ) --��_��
	Hide(OwnerID())
	if	TargetID() ~= nil	then
		sleep(25)
		local Master = Lua_CreateObjByDir( TargetID() , 112846 , 45 , 0)
		AddToPartition(Master,0)
		FaceObj( Master , TargetID() );
		sleep(10)
		Say(Master,"[SC_422160_0]")
		sleep(20)
		if	TargetID() ~= nil	then
			Say(TargetID(),"[SC_422160_1]")
		end
		sleep(20)
		Say(Master,"[SC_422160_2]")
		sleep(30)
		DelObj(Master)
	end
	if	TargetID() ~= nil	then
		SetFlag(TargetID(),542647,1)
	end
	sleep(25)
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false ) --�Ѷ}
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

--���z������


function LuaS_422327_0()	--���b�ˬd
	local Ball = Lua_DW_CreateObj("flag",112399,780094,1,0) --�ؤ@�����Ϊ��y�X�ӧP�_�Z��
	Lua_ObjDontTouch(Ball)--�аO����������
	AddToPartition(Ball,0)
	if	CheckDistance( OwnerID(), Ball, 100 )	then
		DelObj(Ball)
		return true
	end
	DelObj(Ball)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_204637_2]",0)
	return false
end

function LuaS_422327_1()	--�I���ϥΫ�
	local Ball = Lua_DW_CreateObj("flag",112399,780094,1,0)  -- �حӲy
	Lua_ObjDontTouch(Ball)--�аO����������
	AddToPartition(Ball,0)
	CallPlot(OwnerID(),"LuaS_422327_2",Ball)  -- �����a���y��(�ǤJ�y��id)
end

function LuaS_422327_2(Ball)
	CastSpell(OwnerID(),Ball,493155)--��y��k�N
	sleep(10)
	BeginPlot(Ball,"LuaS_422327_3",0) -- ���y����Ϫ᭫��
	sleep(15)
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_422327_0]",0) 
	sleep(10)
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_422327_1]",0) 
	sleep(20)
	DelObj(Ball)
	SetFlag(TargetID(),542656,1)	
end

function LuaS_422327_3()
	local NPC = SearchRangeNPC ( OwnerID() , 20 )
	for i=0,table.getn(NPC)-1	do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112930	then
			BeginPlot(NPC[i],"LuaI_200700_Reset",0) --���᭫��
			return
		end
	end
end


--�٫��G�X�@


function LuaS_422332_0()-- ��b204642
	if	CountBodyItem(OwnerID(),204720) > 0	then
		DelBodyItem(OwnerID(),204720,1) --del
		GiveBodyItem(OwnerID(),204643,1) --�X��
		UseItemDestroy() -- �R���ϥΤ���
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422328_8]",0)
end

function LuaS_422332_1() --��b204635
	if	CountBodyItem(OwnerID(),204642) > 0	then
		DelBodyItem(OwnerID(),204642,1) --del
		GiveBodyItem(OwnerID(),204643,1) --�X��
		UseItemDestroy() -- �R���ϥΤ���
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422328_8]",0)		
end


function LuaS_422332_3()
	SetSpeakDetail ( OwnerID(),"[SC_422332_3]" )
	if	CountBodyItem(OwnerID(),204643) > 0	then
		DelBodyItem(OwnerID(),204643,1)
		SetFlag(OwnerID(),542664,1)
	end
end

function LuaS_422332_4()
	SetSpeakDetail ( OwnerID(),"[SC_422332_2]" )
	GiveBodyItem(OwnerID(),204720,1)
end

-- �Y��Ĩۣ


function LuaS_422335_0() --�Y��ۣ
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422335_0]", 0 );
end

function LuaS_422335_1() --�t��ۣ
	AddBuff(OwnerID(),503358,1,3) --�·�
	SetFlag(OwnerID(),542660,1)
end

function LuaS_422335_2() --����ۣ
	AddBuff(OwnerID(),501011,15,15)--���r
	SetFlag(OwnerID(),542660,1)
end

function LuaS_422335_3() --�d��ۣ
	AddBuff(OwnerID(),500974,3,3) --����3��
	SetFlag(OwnerID(),542660,1)
end



function LuaS_422335_4()
	LoadQuestOption(OwnerID());
	if	CheckAcceptQuest(OwnerID(),422335)		and
		not	CheckFlag(OwnerID(),542658)	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422335_3]",  "LuaS_422335_5",  0 );
	end
end


function LuaS_422335_5()
	SetSpeakDetail(OwnerID(),"[SC_422335_4]")
	SetFlag(OwnerID(),542658,1)
end

function LuaS_422335_6()
	SetSpeakDetail(OwnerID(),"[SC_422335_2]")
	SetFlag(OwnerID(),542659,1)
end