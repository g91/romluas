
function LuaS_422074()  --���}����

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422074)==true )and( CheckCompleteQuest( OwnerID() , 422074) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422074]","LuaS_422074_1",0) --�O���A�ڷQ���D�೽�H��M�����H������]�C
	end
end


function LuaS_422074_1()  
	SetSpeakDetail(OwnerID(),"[SC_422074_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422074_2]","LuaS_422074_2",0) ---�L�̭n���ꪺ�ηN�O����H
end

function LuaS_422074_2()  
	SetSpeakDetail(OwnerID(),"[SC_422074_3]")
	SetFlag(OwnerID() ,542446, 1 )
	CloseSpeak( OwnerID())
end


function LuaS_422074_3()	--�I�����~��(��)
	local GY =  Lua_DW_CreateObj("flag" ,112663,780298,9 )
	WriteRoleValue (OwnerID(), EM_RoleValue_PID,GY)
	BeginPlot( GY, "LuaS_422074_4", 0 )
	return true 
end

function LuaS_422074_4()
	Local GY = ReadRoleValue(TargetID(),EM_RoleValue_PID)	
	AddBuff(GY,503078 ,0,5 )
	sleep(50)
	DelObj (GY)
	setFlag(TargetID() ,542483, 1 )		
end



function LuaS_422075()	--�^�нլd���G
	local NPC = SearchRangeNPC ( OwnerID() , 300 )
	for i=0,table.getn(NPC)-1 do
		if  ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==112687 then
			return 
		end
	end
	BeginPlot(OwnerID(),"LuaS_422075_2",0)
	local UL = Lua_DW_CreateObj("flag",112687 ,780350,1 )
	MoveToFlagEnabled(UL , false )
	WriteRoleValue( UL ,EM_RoleValue_IsWalk , 1 )
	LuaFunc_MoveToFlag( UL,780350,2,0)
	Say(UL, "[SC_422075]")  --���w�g�^���̴N�O�A��ۧڤF�I
	sleep(10)
	LuaFunc_MoveToFlag( UL,780350,3,0)
	sleep(10)
	Say(UL, "[SC_422075_2]")  --�A�H���ڷ|�¨����p�A�װ�����W�ܡH
	LuaFunc_MoveToFlag( UL,780350,4,0)
	Say(OwnerID() , "[SC_422075_4]")  --�o��...���§A�̪������C
	sleep(30)
	Say(UL, "[SC_422075_5]")  --...��...��p�ưաI�ˬO�A���٭n���W�O�@������
	sleep(30)
	Say(OwnerID() , "[SC_422075_6]")  --���O�A�������೽�H�ѨM���D�e�A���~�٬O�ܦM�I�C
	sleep(30)
     	Say(UL, "[SC_422075_7]")  --...��...�n�A�ڷ|�A��L�̻����C
	sleep(10 )
	LuaFunc_MoveToFlag( UL,780350,5,0)
	DelObj (UL)
end

function LuaS_422075_2()
	local DLI = Lua_DW_CreateObj("flag",112700 ,780350,6 )
	WriteRoleValue( DLI ,EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled(DLI , false )	
	LuaFunc_MoveToFlag( DLI,780350,7,0)
	Say(DLI, "[SC_422075_1]")  --�j���㤰��ɭԭn�A�X�h�H
	sleep(10)
	LuaFunc_MoveToFlag( DLI,780350,8,0)
	Say(DLI, "[SC_422075_3]")  --�j���I�ڷQ�h����
	sleep(30)
	LuaFunc_MoveToFlag( DLI,780350,9,0)
	sleep(100)
	Say(DLI, "[SC_422075_8]")  --�j���A������
	LuaFunc_MoveToFlag( DLI,780350,10,0)
	DelObj (DLI)
end

function LuaS_422084()	--�ƥ��H���Ĥl
	LoadQuestOption( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422084)==true)and(CheckCompleteQuest( OwnerID() , 422084) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422084]","LuaS_422084_1",0)	--�A�n��
	end	

	if (CheckAcceptQuest(OwnerID(),422086)==true)and( CheckCompleteQuest( OwnerID() , 422086) == false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422086]","LuaS_422086_1",0)	--ť���A�`�O���������R�Dã�˪��_���ð_�ӡA������H
	end		

	if (CheckAcceptQuest(OwnerID(),422085)==true)and( CheckCompleteQuest( OwnerID() , 422085) == false) then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_5]","LuaS_422085_3",0)		--�ڧ�����R���_���F�C
	end	
end


function LuaS_422086_1()  
	SetSpeakDetail(OwnerID(),"[SC_422086_1]")					--��I���Q���I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422086_2]","LuaS_422086_2",0)	--�A�A�áA���٬O�|��쥦�C
end

function LuaS_422086_2()  
	SetSpeakDetail(OwnerID(),"[SC_422086_3]")					--�K�K�n�a�K����R�Dã�˥u����ڦФ�K�@�ڭn���K 
	SetFlag(OwnerID() ,542495, 1 )
	end

	
function LuaS_422084_1()
	SetSpeakDetail(OwnerID(),"[SC_422084_1]")					--�A�O�֡H�S�O�⦷��s�Ӫ��H�N��ڨS�������B�����A�]���n�A�ޡI���I���}�I
	BeginPlot(TargetID() , "LuaS_422084_2", 0 )
	DisableQuest( TargetID() , true )						--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)

end

function LuaS_422084_2() 
	local ILI = Lua_DW_CreateObj("flag" ,112607,780298,10 )
	WriteRoleValue(OwnerID(), EM_RoleValue_PID, ILI )
	BeginPlot(ILI,"LuaS_422084_11", 0 )
	BeginPlot(ILI,"LuaS_422084_4", 0 )
	sleep(90)
	Say(OwnerID() , "[SC_422084_4]")						--�ۤv��A�䤣��N�O�³J�� 
	SetFlag(TargetID() ,542484, 1 )
	DisableQuest( OwnerID() , false )
end
	
function LuaS_422084_11()
	LuaFunc_MoveToFlag(OwnerID(),780298,11,0)
	MoveToFlagEnabled( OwnerID(), false )	
	Say(OwnerID(),"[SC_422084_2]") 						--�A�O�a�J�I��ڪ��_���ٵ��ڡI
	sleep(30)
	Say(OwnerID(),"[SC_422084_5]")						--�i�c�I
	LuaFunc_MoveToFlag( OwnerID(),780298,12,0)
	DelObj(OwnerID())
end


function LuaS_422084_4()
	local DOGGY = Lua_DW_CreateObj("flag" ,112664,780298,13 )
	WriteRoleValue( OwnerID(), EM_RoleValue_PID, DOGGY )
	BeginPlot(OwnerID(), "LuaS_422084_12", 0 )	
end

function LuaS_422084_12()
	Local DOGGY = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	LuaFunc_MoveToFlag( DOGGY,780298, 14,0)
	MoveToFlagEnabled(DOGGY , false )
	Say(DOGGY, "[SC_422084_3]") --�L�I
	LuaFunc_MoveToFlag( DOGGY,780298,15,0)
	SLEEP(10)
	LuaFunc_MoveToFlag( DOGGY,780298,16,0)
	DelObj(DOGGY)
end

function LuaS_422085()	--���b����R���W
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) > 0 then
	SetSpeakDetail(OwnerID(),"[SC_422085_4]")	--�p�����ö]�A���b
	else
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422085)==true)and( CheckCompleteQuest( OwnerID() , 422085) == false) and CountBodyItem( OwnerID() ,204360) == 0 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422085]","LuaS_422085_1",0)		--�ڨ�������X�p���_���C
	End
	end
end	

function LuaS_422085_1()  
	SetSpeakDetail(OwnerID(),"[SC_422085_1]")					--�u���H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_2]","LuaS_422085_2",0)	--��A�p���_���O����A�p�����ݹL�ܡH
end

function LuaS_422085_2()  
	SetSpeakDetail(OwnerID(),"[SC_422085_3]")					--�Ф�I�}�G������Ф�A�ڳo���٦��I�u����ڡA�O�ڪ��_���A�p�����a�a��h�D�A�A�n�ɨe�H
	if ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_6]","LuaS_422085_4",0)	--��A�ڷQ�ɧU�e����O�C	
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422085_6]","LuaS_422085_11",0)--��A�ڷQ�ɧU�e����O�C
	end	
	
End


function LuaS_422085_3()  
	if CountBodyItem( OwnerID() , 204360 ) > 0 then
	SetSpeakDetail(OwnerID(),"[SC_422085_7]")					--���i��I���ëܦn�A�A���o��j�H
	SetFlag(OwnerID() ,542494, 1 )
	end
End

function LuaS_422085_4()  
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422085_8]")						--�n��p�����R�ö]���n�e�I
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_422085_6" , 0)
end

function LuaS_422085_11()  
	SetSpeakDetail(OwnerID(),"[SC_422085_9]")					--�i�O�A�p�����{�b���b......�e�R�ö]�A���e�^�ӡ�
end




function LuaS_422085_6()	
	local X,Y,Z,Dir,Dis
	Dis = 15
	X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=270 	then
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) -270
	else
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)+90
	end
	XYZ = { X+Dis*math.sin(math.pi/180*Dir) , Y , Z+Dis*math.cos(math.pi/180*Dir) }
	sleep( 10 )
	local Dog = Lua_DW_CreateObj("xyz" , 112664 , XYZ , 1 , ReadRoleValue(OwnerID() , EM_RoleValue_Dir) )
	WriteRoleValue(Dog,EM_RoleValue_PID,TargetID())
	BeginPlot(Dog,"LuaS_422085_7",0)
end

function LuaS_422085_7()
	local Owner = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local QuestNpc = {112716,112715,112714,112713,112527}
	local QuestItem = {204414,204406,204419,204420,204360}
	local FlagX , FlagY , FlagZ , X , Y , Z , RandFlag , Dir , AntiDir , OutItem , BefoRand
	local Dis = 15
	local XYZ = {}
	RandFlag = 0
	for	i=1,5	do
		BefoRand = RandFlag
		while BefoRand == RandFlag	do
			RandFlag = DW_Rand(GetMoveFlagCount(780356)-2)+1
		end
--		LuaS_422085_8(OwnerID() , 780356 , RandFlag)
		X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		FlagX = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_X )
		FlagY = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_Y )
		FlagZ = GetMoveFlagValue( 780356 , RandFlag , EM_RoleValue_Z )

		for i = 0 , 20 , 1 do
		if	math.floor(FlagX/10) ~= math.floor(X/10)	and
			math.floor(FlagZ/10) ~= math.floor(Z/10)	then
			Move( OwnerID() , FlagX, FlagY, FlagZ )
			sleep(20)
			X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
			Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
			Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)

		end
		end
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=180	then
			AntiDir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) - 180
		else
			AntiDir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) + 180
		end
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=270 	then
			Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) -270
		else
			Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)+90
		end

		XYZ = { X+Dis*math.sin(math.pi/180*Dir) , Y , Z+Dis*math.cos(math.pi/180*Dir) }
		OutItem = Lua_DW_CreateObj("xyz" , QuestNpc[i], XYZ ,1 , AntiDir )
		WriteRoleValue(OutItem,EM_RoleValue_PID, Owner)
		WriteRoleValue(OutItem,EM_RoleValue_Register2 , QuestItem[i])
		ScriptMessage( OwnerID(), 0 , 2, "[SC_422085_10]", 0 )
		SetPlot(OutItem,"touch","LuaS_422085_10",50)
		BeginPlot(OutItem,"LuaS_422085_9",0)
		while CheckID(OutItem) do
			sleep(10)
		end
		if ChecKID(Owner) == false or GetDistance( Owner , OwnerID() ) > 350 or ReadRoleValue( Owner , EM_RoleValue_IsDead ) == 1 or CheckAcceptQuest(Owner,422085)==false or CheckCompleteQuest(Owner,422085)==true then
		ScriptMessage( Owner,Owner , 2, "[SC_422085_11]", 0 )
			break
		
		end
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	ScriptMessage( OwnerID(), 0 , 2, "[SC_422085_11]", 0 )
	DelObj(OwnerID())
end

function LuaS_422085_8(Who,FlagID,ID)
	LuaFunc_MoveToFlag( Who, FlagID , ID ,0 )
end

function LuaS_422085_9()
	local sec = 0
	while sec < 15 do
		sleep(10)
		sec = sec +1
	end
	DelObj(OwnerID())
end

function LuaS_422085_10()
	SetPlot(TargetID(),"touch","",0)
	local Item = ReadRoleValue(TargetID(),EM_RoleValue_Register2)
	if	ReadRoleValue(TargetID(),EM_RoleValue_PID) == OwnerID()	then
		GiveBodyItem(OwnerID(),Item,1)
	end
	DelObj(TargetID())
end


function LuaS_422087()	--��§�P�ШD	
	say(OwnerID(),"[SC_422087]")	--���M�Τ�������������߯S�յ�������A�ɥR��O�I
end

function LuaS_422087_1()	--�I�����~��
	if (CheckAcceptQuest(OwnerID(),422087)==true)and(CheckFlag( OwnerID(), 542496 )== false) then
	AddBuff(OwnerID(),501578 ,0,30 )
	SetFlag(OwnerID() ,542496, 1 )
	return true
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422087_1]", 0 )
	return false
end



function LuaS_422089()	--�ڤ��O�n�A��...
		local FISHGO = Lua_DW_CreateObj("flag" ,112653,780355,1) 
		say( OwnerID(),"[SC_422089]" )
		sleep(100)
		DelObj(FISHGO)	
end





function LuaS_422090() 	--���b���~�W	�󧹬������Y�J��
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 422090, 1 ));
	ShowBorder( OwnerID(), 422090,str , "ScriptBorder_Texture_Paper" )				
end



function LuaS_422111() --�s�@�Q�������� ���ȧ����Უ�ͤ@�ӦQ����a�W 
	local WOW = Lua_DW_CreateObj("flag" ,112665,780355,2 ) 
	say(OwnerID(),"[SC_422111]" )
		Sleep(100)	
	DelObj(WOW)
	end

function LuaS_422111_1()	--���b�I�������
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649	then
		local R = Rand( 100 ) + 1
	
		if R >= 0 and R < 33 and(CountItem (OwnerID(), 204401)<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(), 204401, 2)
		
		end
		if R >= 33 and R < 66 and (CountItem (OwnerID(), 204402 )<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(),204402, 2 )
				
		end
		if R >= 67 and R < 100 and( CountItem (OwnerID(), 204403 )<4) and ( CheckCompleteQuest( OwnerID() , 422111) == false) and (ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112649) then
				GiveBodyItem( OwnerID(),204403, 2 )
		
		end
		BeginPlot(OwnerID() , "LuaS_422111_2", 0 )
	end
	Return 1
end


function LuaS_422111_2()
	if CountItem( OwnerID(), 204401)<4 then
		GiveBodyItem( OwnerID(),204401, 1 )
		Return 
	end

	if CountItem( OwnerID(), 204402)<4 then
		GiveBodyItem( OwnerID(),204402, 1 )
		Return 
	end

	if CountItem( OwnerID(), 204403)<4 then
		GiveBodyItem( OwnerID(),204403, 1 )
		Return 
	end
end







