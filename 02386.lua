function LuaQ_dr424295_01()									--�ˬd���L��
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,100)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118490 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own, own , 2 ,"[SC_424295_01]" , 2 )						--���B�S����M���F��i��	
		return false
	end
end





function LuaQ_dr424295_02()									--�䰭
	local own=OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)			
	local ownX=ReadRoleValue(own,EM_RoleValue_X)
	local ownY=ReadRoleValue(own,EM_RoleValue_Y)
	local ownZ=ReadRoleValue(own,EM_RoleValue_Z)
	local ownDir=ReadRoleValue(own,EM_RoleValue_Dir)
	local Btable={}
	Btable=SearchRangeNPC(own,100)								--�j�M�ۨ�100�d��
	castspell(own,own,497927)
	if CheckAcceptQuest(own,424295)==true and							--��������
		CheckCompleteQuest(own,424295) ~=true then						--�åB������
			for i = 0,table.getn(Btable),1 do
				local X=ReadRoleValue(Btable[i],EM_RoleValue_OrgID)
				if X==118490 then
					local ghost=CreateObj(105671,ownX+50,ownY-5,ownZ+0,ownDir+0,1)
					npcsay(ghost,"[SC_424295_02]")
					SetModeEx(ghost,EM_SetModeType_Mark,true)
					SetModeEx(ghost,EM_SetModeType_Strikback,true)      		--����
					SetModeEx(ghost,EM_SetModeType_HideName,true)     		--�����Y�W�O�_��ܦW��
					SetModeEx(ghost,EM_SetModeType_Searchenemy,true)		--���
					SetModeEx(ghost,EM_SetModeType_Fight,true)			--�|�԰�
					AddToPartition(ghost,RoomID)                        			--��{�Xghost�A�o��zone�A�t�XLuaFunc_CreateObjByObj��
					SetAttack(ghost,own)
					WriteRoleValue(ghost,EM_RoleValue_register1,own)
					CallPlot(ghost,"LuaQ_dr424295_03",ghost)
				end
			end
	end
end

function LuaQ_dr424295_03(ghost)	
	while true do
		sleep(50)
		if  CheckID(ghost)~=0 or CheckID(ghost)~=nil then
			if HateListCount( ghost) == 0   then
			DelObj(ghost)
			end
		end
	end
end
--====================================================================
function LuaQ_dr424296_01()									--�ˬd�O�_��󾽰��̥X�S�a
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,50)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118492 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own,  own , 2 ,"[SC_424296_02]" , 2 )						--�o�̤��O�����̱`�X�S���a��	
		return false
	end
end





function LuaQ_dr424296_02()									--�������̦��ѹ�
	local own=OwnerID()
	local tar = TargetID()
	local Btable={}
	Btable=SearchRangeNPC(own,50)
	if CheckAcceptQuest(own,424296)==true and
		CheckCompleteQuest(own,424296) ~=true then
			for i = 0,table.getn(Btable),1 do
				local X=ReadRoleValue(Btable[i],EM_RoleValue_OrgID)
				if X==118492 then
				AddBuff(own,620317,0,30)
				BeginPlot(own,"LuaQ_dr424296_03",0)
				CallPlot(Btable[i],"LuaQ_dr424296_05",Btable[i])
				Hide(Btable[i])
				end
			end
	end
end

function LuaQ_dr424296_03()									--��t
	local tar=TargetID()
	local dog = Lua_DW_CreateObj( "flag" , 105756 , 780950 , 2 , 1 , 1 )
	SetModeEx(dog,EM_SetModeType_Mark,false)
	SetModeEx(dog,EM_SetModeType_Strikback,false)      						--����
	SetModeEx(dog,EM_SetModeType_HideName,false)        						--�����Y�W�O�_��ܦW��
	SetModeEx(dog,EM_SetModeType_Searchenemy,false)    						--���
	SetModeEx(dog,EM_SetModeType_Fight,true)							--�|�԰�
	sleep(20)
	DW_MoveDirectToFlag( dog , 780950 , 3 , 1  )
	sleep(40)
	PlayMotion( dog, 164)
	sleep(20)
	DW_MoveDirectToFlag( dog , 780950 , 4 , 1  )
	local deadman = Lua_DW_CreateObj( "flag" , 105757 , 780950 , 5 , 1 , 1 )
	SetModeEx(deadman,EM_SetModeType_Mark,false)
	SetModeEx(deadman,EM_SetModeType_Strikback,false)      						--����
	SetModeEx(deadman,EM_SetModeType_HideName,false)        					--�����Y�W�O�_��ܦW��
	SetModeEx(deadman,EM_SetModeType_Searchenemy,false)    					--���
	SetModeEx(deadman,EM_SetModeType_Fight,true)						--�|�԰�
	WriteRoleValue(deadman,EM_RoleValue_Register9,OwnerID())
	sleep(50)
	DW_MoveDirectToFlag( deadman , 780950 , 6 , 1  )
	PlayMotion( deadman, 37)
	CastSpell(deadman, dog, 497674 )
	PlayMotion( dog, 164)
	Sleep(30)
	Yell(deadman,"[SC_424296_01]",2)
	PlayMotion( deadman, 37)
	PlayMotion( dog, 145)
	DelObj(dog)
	CallPlot(deadman,"LuaQ_dr424296_04",deadman)
	sleep(30)
	DelObj(deadman)
end

function LuaQ_dr424296_04(deadman)
	local roomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local box=LuaFunc_CreateObjByObj (118891,deadman)
	local guest=ReadRoleValue(deadman,EM_RoleValue_Register9)
	CallPlot(box,"LuaQ_dr424296_06",box)
	WriteRoleValue(box,EM_RoleValue_Register9,guest)
	SetModeEx(box,EM_SetModeType_Show,false)
	SetModeEx(box,EM_SetModeType_Mark,false)
	SetModeEx(box,EM_SetModeType_Strikback,false)      						--����
	SetModeEx(box,EM_SetModeType_HideName,false)
	AddToPartition(box,roomID)
	sleep(20)
	DelObj(box)

end

function LuaQ_dr424296_05(obj)
	local tar=TargetID()
	sleep(300)
	Show(obj,0)
end


function LuaQ_dr424296_06(box)
	local guest=ReadRoleValue(box,EM_RoleValue_Register9)
		if CheckAcceptQuest(guest,424296)==true and
		   CheckBuff(guest,620317)==true then
			if	CheckDistance(box,guest,150)==true then
			  	 SetFlag(guest,545080,1)
			else
			  	ScriptMessage(guest,guest,1,"[SC_423177_10][SAY_420635_1]",0)
			end
		end
end
--====================================================================

function LuaQ_dr424315_0()										--�զ⪺�O��(�P�_�O�_�b�e��
	local own = OwnerID()
	local Atable=SearchRangeNPC(own,30)
	local B = 0
	for i = 0,table.getn(Atable),1 do
		local X=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if X==118530 then
			B=B+1
		end
		if B ~=0 then
			return true
		else
			ScriptMessage( own,own, 2 ,"[SC_424315_01]" , 2 )				--�o���٤����a��e��
			return false
		end
	end
end



function LuaQ_dr424315_1()										--�զ⪺�O��(�x��)
	local own = OwnerID()
	local Atable=SearchRangeNPC(own,30)
	local B = 0
	for i = 0,table.getn(Atable),1 do
		local X=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if X==118530 then
		PlayMotion( own, 75)
		ScriptMessage( own, own , 2 ,"[SC_424315_02]" , 2 )
		BeginPlot(own,"LuaQ_dr424315_2",40)
		end
	end
end

function LuaQ_dr424315_2()										--give keyitem
	local own = OwnerID()
	GiveBodyItem(own,545134,1)
end

--============================================================

function LuaQ_dr424294_3()										--�ʺ��u�ñM�ΡA�����K��
	local own=OwnerID()
	SetPlot( own,"range","LuaQ_dr424294_3_1",65 )
end


function LuaQ_dr424294_3_1()
	local own=OwnerID()
	local obj = TargetID()
	local searchA=SearchRangePlayer(own,65)
	local Atime=0
		sleep(20)
		if CheckBuff(own,620027)==false then
		    SetPos( own, 473.9, -257, 348.9 , 1 ) 
			say(obj,"go back")
		end

end
--============================================================
function LuaQ_dr424308_4()--�����ȫ᪺��t�A�޾ɪ��a��V�A�����ȶ��K�MBUFF�A�קK�����ȭ��������a���|�X��
	local Npc = OwnerID()
	local Player = TargetID()
	local QMonster = nil
	if ReadRoleValue( Npc, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( Npc, EM_RoleValue_Register1, 1 )
		QMonster = Lua_DW_CreateObj( "flag" ,118310,  780964 , 12 , 1 , 1 )
		DW_MoveDirectToFlag( QMonster, 780964 , 13, 1 )
		Yell( QMonster,"[SAY_110341_3]", 3 ) 
		Sleep( 40 )
		DelObj( QMonster )
		WriteRoleValue( Npc, EM_RoleValue_Register1, 0 )
	end
	return
end
function LuaQ_dr424308_0()--�l�����ȥͩǥβĤ@�i
	local Ctrl = OwnerID()--������
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )--Ctrl�s��#1
	local Abox = Lua_DW_CreateObj( "flag", 118614, 780964, 0, 1, 1 )--�b�X�Ц�m���ͽc�lA
	local Bbox = Lua_DW_CreateObj( "flag", 118614, 780964, 1, 1, 1 )--�b�X�Ц�m���ͽc�lB
	SetModeEx( Abox, EM_SetModeType_Mark, false )--����A�c�аO
	SetModeEx( Bbox, EM_SetModeType_Mark, false )--����B�c�аO
	SetPlot( Ctrl , "range","LuaQ_dr424308_1" , 70 )--���ͽd��@��
end
function LuaQ_dr424308_1()--�P�_���a�O�_�ŦX���
	local Player = OwnerID()
	local Ctrl = TargetID()
	SetPlot( Ctrl, "range", "", 0 )
	if ( CheckAcceptQuest( Player ,424308 ) == true and CheckCompleteQuest( Player ,424308 ) == false ) then
		CallPlot( Ctrl , "LuaQ_dr424308_1_Start", Player )--�����������]FUNCTION�A�קK��Sleep���@���b���a���W�C
		return
	end
	SetPlot( Ctrl, "range", "LuaQ_dr424308_1", 70 )
end
function LuaQ_dr424308_1_Start( Player )--��ŦX����~Ĳ�o
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID )
	local EMonster = nil--E�Ǥj��		
	local Monster = {}
	for i = 1, 2, 1 do
		Monster[ i ] = Lua_DW_CreateObj( "flag" , 105755, 780964 , i+1, 1, 1 )--�Ǫ�
		AddBuff( Monster[ i ], 620029, 0, 10 )--�X���S��
		NpcSay( Monster[ i ], "[SC_424308_01]")
		SetAttack( Monster[ i ], Player )
		sysCastSpellLv ( Player, Monster[ i ], 496930, 1 )
		AddToPartition( Monster[ i ], RoomID) 
	end
	CallPlot( Ctrl, "LuaQ_dr424308_fight", Monster[ 1 ], Monster[ 2 ] )--�P�_�Ǫ����S���b���H�A�S������N�屼
	EMonster = Lua_DW_CreateObj( "flag" ,118310, 780964, 8, 1, 1 )
	DW_MoveDirectToFlag( EMonster, 780964, 9, 1 )
	say( EMonster,"[SC_423032_2]")
	Sleep( 50 )
	DelObj( EMonster )
end
function LuaQ_dr424308_fight( Npc1, Npc2 )--�Ǫ��b3���S���i�J�԰��N�|����
	local Ctrl = OwnerID()--������
	local CtrlID = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )--Ctrl�s��
	local MonsterStatus = 0
	local Monster = {}
	Monster[ 1 ] = Npc1
	Monster[ 2 ] = Npc2
	while true do
		Sleep( 20 )
		for i = 1, #Monster, 1 do
			if CheckID( Monster[ i ] ) == true then
				if ( ReadRoleValue( Monster[ i ], EM_RoleValue_AttackTargetID ) ~= 0 and
				CheckDistance( Ctrl, Monster[ i ], 300 ) == true ) then
					MonsterStatus = MonsterStatus + 1
				else
					StopMove( Monster[ i ], false )
					DelObj( Monster[ i ] )				
				end		
			end
		end
		if MonsterStatus == 0 then
			Sleep( 100 )--�ƥ󭫸m�ɶ�
			if CtrlID == 1 then
				SetPlot( Ctrl, "range", "LuaQ_dr424308_1", 70 )
			else
				SetPlot( Ctrl, "range", "LuaQ_dr424308_3", 70 )
			end
			return
		end
		MonsterStatus = 0
	end
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_dr424308_2()--�l�����ȥͩǥβĤG�i
	local Ctrl = OwnerID()--������
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 2 )--Ctrl�s��#2
	local Cbox = Lua_DW_CreateObj( "flag", 118614, 780964, 4, 1, 1 )--�b�X�Ц�m���ͽc�lA
	local Dbox = Lua_DW_CreateObj( "flag", 118614, 780964, 5, 1, 1 )--�b�X�Ц�m���ͽc�lB
	SetModeEx( Cbox, EM_SetModeType_Mark, false )--����A�c�аO
	SetModeEx( Dbox, EM_SetModeType_Mark, false )--����B�c�аO
	SetPlot( Ctrl, "range","LuaQ_dr424308_3" , 70 )--���ͽd��@��
end
function LuaQ_dr424308_3()
	local Player = OwnerID()
	local Ctrl = TargetID()
	SetPlot( Ctrl ,"range","", 0 )
	if ( CheckAcceptQuest( Player ,424308 ) == true and CheckCompleteQuest( Player ,424308 ) == false ) then
		CallPlot( Ctrl , "LuaQ_dr424308_3_Start", Player )--�����������]FUNCTION�A�קK��Sleep���@���b���a���W�C
		return
	end
	SetPlot( Ctrl, "range", "LuaQ_dr424308_3", 70 )
end
function LuaQ_dr424308_3_Start( Player )
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID )
	local EMonster = nil--E�Ǥj��		
	local Monster = {}
	for i = 1, 2, 1 do
		Monster[ i ] = Lua_DW_CreateObj( "flag", 105755, 780964 , i+5, 1, 1 )--�Ǫ�
		AddBuff( Monster[ i ], 620029, 0, 10 )--�X���S��
		NpcSay( Monster[ i ], "[SC_424308_01]")
		SetAttack( Monster[ i ], Player )
		sysCastSpellLv ( Player, Monster[ i ], 496930, 0 )  
		AddToPartition( Monster[ i ], RoomID )
	end
	CallPlot( Ctrl,"LuaQ_dr424308_fight", Monster[ 1 ], Monster[ 2 ] )--�P�_�Ǫ����S���b���H�A�S������N�屼
	EMonster = Lua_DW_CreateObj( "flag" ,118310, 780964, 10, 1, 1 )
	DW_MoveDirectToFlag( EMonster, 780964, 11, 1 )
	say( EMonster,"[SC_423032_2]")
	Sleep( 50 )
	DelObj( EMonster )
end
----============================================================
--���ȸѰ��T�D424305--�T�D�̥�
function LuaQ_dr424305_0()									--�b�T�D�̪��|�P����4�ڵ��ɤ���
	local own=OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)			
	local ownX=ReadRoleValue(own,EM_RoleValue_X)
	local ownY=ReadRoleValue(own,EM_RoleValue_Y)
	local ownZ=ReadRoleValue(own,EM_RoleValue_Z)
	local ownDir=ReadRoleValue(own,EM_RoleValue_Dir)
	local Alight=CreateObj(118623,ownX+20,ownY-5,ownZ+20,ownDir+0,1)
	local Blight=CreateObj(118623,ownX+20,ownY-5,ownZ-20,ownDir+90,1)
	local Clight=CreateObj(118623,ownX-20,ownY-5,ownZ-20,ownDir+180,1)                     
	local Dlight=CreateObj(118623,ownX-20,ownY-5,ownZ+20,ownDir+270,1)
		SetModeEx(Alight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Blight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Clight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Dlight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(own,EM_SetModeType_Searchenemy,false)    				--����ġA���|�h�l��
		SetModeEx(own,EM_SetModeType_Fight,false)					--���i���
		AddToPartition(Alight,RoomID)    
		WriteRoleValue(own,EM_RoleValue_Register1,Alight)				--�NA�O�ȰO���b�ǤW�A�Q�ΩǷ��
		WriteRoleValue(own,EM_RoleValue_Register2,1)					--Register2�A�M��A�O�P�_��
		WriteRoleValue(Alight,EM_RoleValue_Register1,own)				--�N�U�O��Register1�O���T�D��
		AddToPartition(Blight,RoomID) 		    
		WriteRoleValue(own,EM_RoleValue_Register3,Blight)
		WriteRoleValue(own,EM_RoleValue_Register4,1)					--Register4�A�M��B�O�P�_��
		WriteRoleValue(Blight,EM_RoleValue_Register1,own)
		AddToPartition(Clight,RoomID)   		
		WriteRoleValue(own,EM_RoleValue_Register5,Clight)
		WriteRoleValue(own,EM_RoleValue_Register6,1)					--Register6�A�M��C�O�P�_��
		WriteRoleValue(Clight,EM_RoleValue_Register1,own)
		AddToPartition(Dlight,RoomID)		     
		WriteRoleValue(own,EM_RoleValue_Register7,Dlight)       		
		WriteRoleValue(own,EM_RoleValue_Register8,1)					--Register8�A�M��D�O�P�_��
		WriteRoleValue(Dlight,EM_RoleValue_Register1,own)
	SetPlot( Alight,"touch","LuaQ_dr424305_2",30 )
	SetPlot( Blight,"touch","LuaQ_dr424305_3",30 )
	SetPlot( Clight,"touch","LuaQ_dr424305_4",30 )
	SetPlot( Dlight,"touch","LuaQ_dr424305_5",30 )
		while 1 do
			Sleep(20)
			if  ReadRoleValue(own,EM_RoleValue_Register2)==2 and			--��ABCD�O���P�_�ȧ���2�ɩǥi����B�|����
			    ReadRoleValue(own,EM_RoleValue_Register4)==2 and
			    ReadRoleValue(own,EM_RoleValue_Register6)==2 and
			    ReadRoleValue(own,EM_RoleValue_Register8)==2  then
				SetModeEx(own,EM_SetModeType_Searchenemy,true)    		--��ġA�|�h�l��
				SetModeEx(own,EM_SetModeType_Fight,true)			--�i���
				CallPlot(Alight,"LuaQ_dr424305_1",own,Blight,Clight,Dlight)	--��Ǧ���ΨӧR������
				return
			end
		end
end

function LuaQ_dr424305_1(own,Blight,Clight,Dlight)						--�Q��A�O�ӲM������
	sleep(30)
	while 1 do
		Sleep(20)
			if    ReadRoleValue(own,EM_RoleValue_IsDead)==1 
			or	HateListCount( own )==0 then
				DelObj(Blight)
				DelObj(Clight)
				DelObj(Dlight)
				DelObj(OwnerID())
				return
			end
	end
	
end		



function LuaQ_dr424305_2()									--A�OĲ�I�@��
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--Ū�X�Ǫ����
	local Clight =ReadRoleValue(monster,EM_RoleValue_Register5)				--Ū�X�Ǩ��WC�O�����
	if	CheckAcceptQuest(own,424305)==true and					--�T�{���Ȫ��A
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register2)==1 then				--�Q��Register�i��P�_ 1=�O���`  2=�O����
		WriteRoleValue(monster,EM_RoleValue_Register6,2)
		PlayMotion(Clight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register2)==2  then				--��O�O�������A�A�I�O�N�|�G�_��	
		WriteRoleValue(monster,EM_RoleValue_Register2,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_3()									--B�OĲ�I�@��
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)
	local Alight =ReadRoleValue(monster,EM_RoleValue_Register1)
	if	CheckAcceptQuest(own,424305)==true and
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register4)==1 then
		WriteRoleValue(monster,EM_RoleValue_Register2,2)
		PlayMotion(Alight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register4)==2  then
		WriteRoleValue(monster,EM_RoleValue_Register4,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_4()									--C�OĲ�I�@��
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--Ū�X�Ǫ����
	local Blight =ReadRoleValue(monster,EM_RoleValue_Register3)				--Ū�X�Ǩ��WB�O�����
	local Dlight =ReadRoleValue(monster,EM_RoleValue_Register7)				--Ū�X�Ǩ��WD�O�����
	if	CheckAcceptQuest(own,424305)==true and					--�T�{���Ȫ��A
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register6)==1 then				--�Q��Register�i��P�_ 1=�O���`  2=�O����
		WriteRoleValue(monster,EM_RoleValue_Register4,2)
		WriteRoleValue(monster,EM_RoleValue_Register8,2)
		PlayMotion(Blight,146)
		PlayMotion(Dlight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register6)==2  then				--��O�O�������A�A�I�O�N�|�G�_��
		WriteRoleValue(monster,EM_RoleValue_Register6,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_5()									--D�OĲ�I�@��
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--Ū�X�Ǫ����
	local Alight =ReadRoleValue(monster,EM_RoleValue_Register1)				--Ū�X�Ǩ��WA�O�����
	if	CheckAcceptQuest(own,424305)==true and					--�T�{���Ȫ��A
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register8)==1 then				--�Q��Register�i��P�_ 1=�O���`  2=�O����
		WriteRoleValue(monster,EM_RoleValue_Register2,2)
		WriteRoleValue(monster,EM_RoleValue_Register8,2)
		PlayMotion(Alight,146)
		PlayMotion(obj,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register8)==2  then				--��O�O�������A�A�I�O�N�|�G�_��
		WriteRoleValue(monster,EM_RoleValue_Register8,1)
		PlayMotion(obj,0)
	end			
end

----============================================================
function LuaQ_dr424294_4()					--�ج����S�s�A��
	local own=OwnerID()
	if CheckBuff(own,620129)==false then
		castspell(own,own,497968)
	BeginPlot(own,"LuaQ_dr424294_5",0)
	else
	ScriptMessage(own,own,2,"[SC_424294_3]",0)
		return
	end
end

function LuaQ_dr424294_5()	
	local own=OwnerID()
	local RoomID=ReadRoleValue(Own,EM_RoleValue_RoomID)
	local Akalorn = LuaFunc_CreateObjByObj (118823 , own) 
	SetModeEx(Akalorn,EM_SetModeType_Mark,false)
	SetModeEx(Akalorn,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Akalorn,EM_SetModeType_HideName,true)
	AddToPartition(Akalorn,RoomID)
	sleep(10)
	DelObj(Akalorn)
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_dr424303_0()					--��D�U���A��ͱq���W
	local own=OwnerID()
	local obj=TargetID()
	LoadQuestOption(own)
		if 	CheckAcceptQuest( Own,424303 )==true  and  CheckCompleteQuest(own,424303)== false  then
			AddSpeakOption(own,obj,"[SC_424303_0_1]","LuaQ_dr424303_1",0)
		else
	LoadQuestOption(own)
		end
end

function LuaQ_dr424303_1()
	local own=OwnerID()
	SetSpeakDetail(own,"[SC_424303_0_2]")
	GiveBodyItem(own,545081,1)
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_drBOX01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local Atable={}
	local X=0
	Atable=SearchRangeNPC(O_ID,30)
	for i=0,table.getn(Atable)  do
		if ReadRoleValue(Atable[i],EM_RoleValue_OrgID)==118820 then
			X = X+1
		end
	end
	if X ~=0 then
		return true
	else
		ScriptMessage(O_ID,0,1 ,"[SC_DRBOX01_01]" , 0)	  --�����H�a���\��c�l�A�y���O�H���·СI
		return false
	end	
end

function LuaQ_drBOX02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local RoomID=ReadRoleValue(O_ID,EM_RoleValue_RoomID)
	local Abox = LuaFunc_CreateObjByObj (110987 , O_ID) 
	SetModeEx(Abox,EM_SetModeType_Mark,false)
	SetModeEx(Abox,EM_SetModeType_Obstruct,true)
	AddToPartition(Abox,RoomID)
	callplot(Abox,"LuaQ_drBOX03",Abox)
end

function LuaQ_drBOX03(Abox)
	local O_ID=OwnerID()
	sleep(200)
	ScriptMessage(O_ID, 0 , 1 ,"[SC_DRBOX01_02]" ,0)			--�c�l�o�X�ةԪ��n�T��A���n�H���@������...
	DelObj(Abox)
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_dr424317_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if 	(ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764) and
		(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))>0.4  then
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_02]",0)				--�o���ͪ��A�ͩR�O�٤ӹL�j���L�k�����I
		return false
		elseif	(ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764) and
			(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))<=0.4 and
			ReadRoleValue(T_ID,EM_RoleValue_HP)~=0 then
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_03]",0)				--�o���ͪ��A�g�L�X�f�ä��٬O�Q�A�����F�I
			return true
		else 
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_01]",0)			 	--�o�u��ﾽ���̨ϥΡI
			return false
	end
end

function LuaQ_dr424317_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckAcceptQuest(O_ID,424317)==true and 
		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764 then
		CallPlot( T_ID, "LuaFunc_ResetObj",T_ID )
		GiveBodyItem(O_ID,240292,1)
		
	end
end
