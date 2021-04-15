
------------------�C�L������
function LuaS_102110_0()
	if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)>0		and --�٬���
		ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)~=0	then -- �������ؼ�
		if	ReadRoleValue(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),EM_RoleValue_IsDead) == 0		then--�����ؼ��٬���
			Say(OwnerID(),"[SC_113008_8]")
			return true
		end
	end
end


---�Ǫ����]�O�P�w
function LuaS_akeymaker_test01()
	local mpmax = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP)
	local mp = ReadRoleValue( OwnerID() , EM_RoleValue_MP)
	
	if mp== mpmax then
		CancelBuff( OwnerID() , 503597 )
	end
end

-------NPC���
function LuaS_113008() --�٥��ȮɲM��542716�X��
	if (CheckAcceptQuest(OwnerID(),422370)==false )and(CheckAcceptQuest(OwnerID(),422381)==false ) then
		SetFlag( OwnerID() , 542716 , 0 )
	end
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422370)==true )or(CheckAcceptQuest(OwnerID(),422381)==true ) then
		if (CheckFlag( OwnerID() , 542716 )==false)then	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_113008]","LuaS_113008_1",0) --ť���X�{�_�S�ͪ��H
		end
	end
end

function LuaS_113008_1() 
	
	SetSpeakDetail(OwnerID(),"[SC_113008_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113008_2]","LuaS_113008_2",0) --�S���A��̤������H�ЧڹL�ӬݬݡC
end

function LuaS_113008_2() 
	
	CloseSpeak( OwnerID() )
	Say( TargetID() , "[SC_113008_3]" ) --�ڸոլݥΨ����n���I��e�C
	sleep(20)
	Say( TargetID() , "[SC_113008_4]" ) --�z���R�ԡI�z���R�ԡI
	BeginPlot( TargetID() , "LuaS_113008_3" , 0 )
end

function LuaS_113008_3() 

	DisableQuest( OwnerID() , true)
	local Org = Role:new( OwnerID()  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal

	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(70*math.cos(Cal))
	Pos["Z"] = Org:Z() - (70*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] )
	Pos["X2"] = Org:X() +(30*math.cos(Cal))
	Pos["Z2"] = Org:Z() - (30*math.sin(Cal))
	Pos["Y2"] = GetHeight( Pos["X2"] , Org:Y() , Pos["Z2"] )
	local Dir2 = Dir + 180
	if Dir2 > 360 then
		Dir2 = Dir2 - 360 
	end

	local Monster = CreateObj ( 102110 , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir2 , 1)
	AddToPartition( Monster  , 0 )
	Addbuff(Monster, 503597,1,-1)
	SetAttack( Monster , TargetID() )
	Say( Monster , "[SC_113008_5]" ) --�H�H��A��ڡ��A�s�ڡ��n�����g�öܡH�ڰl�A�]�A���n�I���n�I
	SetPlot(Monster,"dead" , "LuaS_113008_4",0) 

	while true do
		if CheckID( Monster ) == false then
			DisableQuest( OwnerID() , false)
		end

		if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 0 then 
			Say( Monster , "[SC_113008_7]" ) --�H�H��Q�ڧ��F�I�A�����A�n���a�H
			DisableQuest( OwnerID() , false)
		end

		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )
		else
			if CheckID( Monster ) == true then	
				DelObj( Monster )
				DisableQuest( OwnerID() , false)
			end 
			break
		end
	end
end

function LuaS_113008_4() 
	Say( OwnerID() , "[SC_113008_6]" ) --�A���ڤF...�n�a�I�o����AĹ��
	SetFlag( TargetID() , 542716, 1 )
	return true
end

function LuaS_113008_5() 

	SetFlag( TargetID() , 542716, 0 )
end




