function ic_104622_01()   ------�D����
	local Ctrl = OwnerID()					--���
	local open=0						    --�}�ԺX��				        
	--local killidtime=0
	local luck=0							---�ͤ�����
	local luck1=0							---�ͤ�����
	local luck2=0							---�ͤ�����
	local luck3=0							---�ͤ�����
	local time1=0							---��ޯ�						
	local time4=0
	local mob1
	local mob2
	local mob3
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local BOSS9898=0
	local timeXX=0
	local Boss1
	local Boss100
	Boss1=Lua_DW_CreateObj("flag",104693,780763,1,0)---��k�N��
	SetModeEx( Boss1  , EM_SetModeType_HideName, false )--�W��
	SetModeEX( Boss1  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Boss1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Boss1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Boss1  , EM_SetModeType_Move, false )--����
	SetModeEx( Boss1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Boss1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Boss1  , EM_SetModeType_Strikback, false )--����	
	AddToPartition(Boss1,RoomID)
	CastSpellLv( Boss1 , Boss1 , 496327 , 0 )
	sleep(30)
	DelObj(boss1)
	local Boss=CreateObjByFlag(104622,780763,1,1) 	-----BOSS�Цb  �X��1
	AddToPartition(Boss,RoomID)
	SetPlot( Boss,"dead","un_zone190_boss4",0 )
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
	while true do
		timeXX=ReadRoleValue(Ctrl,EM_RoleValue_register3)
		BOSS9898=ReadRoleValue(Ctrl,EM_RoleValue_register10)		
		sleep(10)
		--say(OwnerID(),"BOSS9898"..BOSS9898)
		if BOSS9898==1 then 
			local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621  or ID2==104693 then
					DelObj(ID)
					end
				end
				DelObj(boss)                                        --�S���ۤv������
				sleep(30)                                           --5��
				Boss=CreateObjByFlag(104622,780763,1,1)           --�A�гy1��				
				AddToPartition(Boss,RoomID)	                                ---�гy�� ���n		
				SetPlot( Boss,"dead","un_zone190_boss4",0 )	
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
				open=0					--���m�԰�
				time1=0
				time4=0
				killidtime=0
		end
		if timeXX==2 then	-----�ɶ���R�� BOSS��
			local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621 or ID2==104693 then
					DelObj(ID)
					end
				end
				DelObj(boss)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				break
		end
		if hatelistcount(boss)~=0 then    		---Ū����H��
			Boss100=Lua_DW_CreateObj("flag",104693,780763,1,0)--���նZ����
			SetModeEx( Boss100  , EM_SetModeType_HideName, false )--�W��
			SetModeEX( Boss100  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( Boss100  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Boss100  , EM_SetModeType_Move, false )--����
			SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Boss100  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Boss100  , EM_SetModeType_Strikback, false )--����	
			
			AddToPartition(Boss100,RoomID)
			WriteRoleValue(Boss100,EM_RoleValue_PID,Ctrl)
			WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
			BeginPlot(Boss100 , "ic_104622_100" , 0)---���նZ��
			WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
			WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
			--killidtime=killidtime+1
			time1=time1+1
			time4= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
			---say(OwnerID(),"killidtime"..killidtime)
			if time4>=1 then
				time4=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)---��f�U5�k0
				Luck=DW_Rand(7)
				Luck1=Luck+10												---�q11�}�l
				Luck2=Luck1+1
				Luck3=Luck1+2
				sleep(50)
				---ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_01]" , 2 )
				mob1=CreateObjByFlag(104621,780763,Luck1,1)---����1
					SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx(mob1 , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
					SetModeEx( mob1 , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
					SetModeEx( mob1 , EM_SetModeType_Searchenemy, true)--����(�O)
					SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob1 , EM_SetModeType_Move, false) ---����
					SetModeEx( mob1 , EM_SetModeType_Mark, true)
					SetModeEx( mob1 , EM_SetModeType_Fight, true)
					SetModeEx( mob1 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob1 , EM_SetModeType_Strikback, true)	---����(�_)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck1)
					AddToPartition(mob1,RoomID)
					SetPlot( mob1,"dead","ic_104622_07",0 )  
					WriteRoleValue(mob1,EM_RoleValue_PID,boss)
				BeginPlot(mob1 , "ic_104622_03" , 0)					---����AI
				mob2=CreateObjByFlag(104621,780763,Luck2,1)---����2
					SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx(mob2 , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
					SetModeEx( mob2 , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
					SetModeEx( mob2 , EM_SetModeType_Searchenemy, true)--����(�O)
					SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob2 , EM_SetModeType_Move, false) ---����
					SetModeEx( mob2 , EM_SetModeType_Mark, true)
					SetModeEx( mob2 , EM_SetModeType_Fight, true)
					SetModeEx( mob2 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob2 , EM_SetModeType_Strikback, true)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck2)
					AddToPartition(mob2,RoomID)
					SetPlot( mob2,"dead","ic_104622_07",0 ) 
					WriteRoleValue(mob2,EM_RoleValue_PID,boss)
				BeginPlot(mob2 , "ic_104622_03" , 0)					---����AI
				mob3=CreateObjByFlag(104621,780763,Luck3,1)---����3
					SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx(mob3 , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
					SetModeEx( mob3 , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
					SetModeEx( mob3 , EM_SetModeType_Searchenemy, true)--����(�O)
					SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob3 , EM_SetModeType_Move, false) ---����
					SetModeEx( mob3 , EM_SetModeType_Mark, true)
					SetModeEx( mob3 , EM_SetModeType_Fight, true)
					SetModeEx( mob3 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob3 , EM_SetModeType_Strikback, true)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck3)
					AddToPartition(mob3,RoomID)
					SetPlot( mob3,"dead","ic_104622_07",0 )  
					WriteRoleValue(mob3,EM_RoleValue_PID,boss)
				BeginPlot(mob3 , "ic_104622_03" , 0)					---����AI
				time4=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
			end
			if time1>=5 then
				WriteRoleValue(boss,EM_RoleValue_register9,1)---�^��1��BOSS
				time1=0
			end
			--if killidtime>=480 then
				--WriteRoleValue(boss,EM_RoleValue_register8,1)---�^��1��BOSS
				--killidtime=0
			--end
			if open==0 then
				open=1										--�}���F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_01]" , 2 )	-------�u��~�u��~�H�O? �ݨӻݭn�ڿ˦ۤW���F~
				BeginPlot(boss , "ic_104622_02" , 0)				------�R�O���ⰵ�Ʊ�
			end
		end	
		if hatelistcount(boss)==0 and open==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
				--local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				--local ID=GetSearchResult()
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--for i = 0 , NPCXX do
				--	ID=GetSearchResult()
				--	ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--	if ID2==104621  or ID2==104693 then
				--	DelObj(ID)
				--	end
				--end
				sleep(150)
				DelObj(boss)                                        --�S���ۤv������
				sleep(30)                                           --5��
				Boss=CreateObjByFlag(104622,780763,1,1)           --�A�гy1��				
				AddToPartition(Boss,RoomID)	                                ---�гy�� ���n				
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				open=0					--���m�԰�
				time1=0
				time4=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�����F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_02]" , 2 )----���i��....�ڷ|�Q����...�ڷ|�A�^�Ӫ�...--���`
				--local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				--local ID=GetSearchResult()
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--for i = 0 , NPCXX do
				--	ID=GetSearchResult()
				--	ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
				--	if ID2==104621 or ID2==104693   then
				--	DelObj(ID)
				--	end
				--end
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---��f�U3�k1
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				open=0										--���m�԰�
				time1=0
				time4=0
				killidtime=0
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�L�ı��F��
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_02]" , 2 )----���i��....�ڷ|�Q����...�ڷ|�A�^�Ӫ�...---���`
				local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621  or ID2==104693  then
					DelObj(ID)
					end
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---��f�U3�k1
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				open=0	
				time1=0
				time4=0		
				killidtime=0
				break	
		end	
	end		
end  
function ic_104622_02()    ------��AI
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=OwnerID()
	local time2=0 	----�p�ɾ�
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	--local killidtime1 =0---�g�ɥ�
	local time3 =0---�ޯ��
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		--killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		time3= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		--say(OwnerID(),"time3"..time3)
		if time3==1 then---5��1���d��ޯ�
			CastSpellLV( OwnerID() , Boss , 496322,11)
			time3=0
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
		end
		--if killidtime1>=1 then
			--AddBuff( OwnerID(),507663,0 ,-1 )
			--killidtime1=0
			--WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---��f�U8�k0
			--sleep(600)
		--end
		time2=time2+1
			---say(OwnerID(),"time"..time4)
		if time2==7 or time2==14 then ---����ޯ�
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				CastSpellLV( OwnerID() , BossTarget , 496323 , 160)
		elseif time2==20 then ---�H��3�H�rBUFF
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				CastSpellLV( OwnerID(),Boss , 496324, 5 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_03]" , 2 )---�P���@�U�@�r���O�q
				WriteRoleValue(Ctrl,EM_RoleValue_register5,1)---�^��1�����
				time2=0	
		end
	end
end

function ic_104622_03()----����AI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local time10=0
local X0=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
local Y0=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
local Z0=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
local mob11		
	while true do
	---say(OwnerID(),"1")
	X0=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
	Y0=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	Z0=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
		sleep(10)
		time10=time10+1
		if time10>=10 and time10<=12 then
		time10=30
		SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�_)
		CastSpellLV( OwnerID() ,boss, 496325,0)
		mob11=CreateObj(104693,X0,Y0,Z0,0,1)-------�����βy 
		SetModeEx( mob11  , EM_SetModeType_HideName, false )--�W��
		SetModeEX( mob11  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( mob11  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( mob11  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( mob11  , EM_SetModeType_Move, false )--����
		SetModeEx( mob11  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( mob11  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( mob11  , EM_SetModeType_Strikback, false )--����	
		AddToPartition(mob11,RoomID)
		CastSpellLv( mob11 , mob11 , 496326 , 0 )
		sleep(40)
		DelObj(mob11)
		DelObj(OwnerID())
		end
	end	
end
function ic_104622_04()----�R��BUFF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 507816 ) == true then
					CancelBuff(ThesePlayer[i], 507816)
				end
				if CheckBuff( ThesePlayer[i] , 507819 ) == true then
					CancelBuff(ThesePlayer[i], 507819)
				end
		end					
	end
end
function ic_104622_07()
local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----Ū�b���@�h
local mob10 = star_CreateObj_NoAdd( OwnerID() , 104693 , 0 , 0 , 0 , Room , 0 ) 			----�p�Ǧ����Ͳy
local poison = 496326					----����AE
	SetModeEx( mob10  , EM_SetModeType_HideName, false )--�W��
	SetModeEX( mob10  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( mob10  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( mob10  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( mob10  , EM_SetModeType_Move, false )--����
	SetModeEx( mob10  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( mob10  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( mob10  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( mob10 , Room )
	WriteRoleValue( mob10, EM_RoleValue_Livetime, 5)				--�s�b���
	CastSpellLv( mob10 , mob10 , poison , 0 )
	sleep(50)
	DelObj(OwnerID())
end
function ic_104622_100()---���ե�
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local BOSS9898=GetDistance( OwnerID(), Boss)
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if  BOSS9898>=580 then
			WriteRoleValue(Ctrl,EM_RoleValue_register10,1)
		end
	end
end
function ic_104622_100_1()	---�Z�J�]
--GiveBodyItem( OwnerID(), 725596, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725596 , 1 } } ----725596�������X
return BaseTressureProc(   itemset , 1 ) -- 1  �O�ݨD�I�]��?
end
function ic_104622_100_2()	---��ҥ]
--GiveBodyItem( OwnerID(), 725602, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725602 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  �O�ݨD�I�]��?
end
function ic_104622_100_3()	---�֥ҥ]
--GiveBodyItem( OwnerID(), 725603, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725603 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  �O�ݨD�I�]��?
end
function ic_104622_100_4()	---����]
--GiveBodyItem( OwnerID(), 725604, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725604 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  �O�ݨD�I�]��?
end