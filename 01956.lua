function UN_chiaAI_zone17()                        --BOSS AI
    WriteRoleValue(OwnerID(),EM_RoleValue_register2,3)--BOSS�n�۳���˪��ƶq
	WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)--���T�����BOSS�H����@�Ӫ��a����BUFF
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,OwnerID())
    local AllTime = 0                              --�D�ɶ�
	local locoTime = 0
	local Fightskill = {495937,495936}             --�ޯ�table.����޶¤�+��L����
	local Ran
	local GameStart = 0                            --�P�_�԰��}�l
	local TotemGroup = {}
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = {104201,104202}
	local totandie 
	local doorchick1
	local doorchick2
	local TargetPlayer = {}
	local newboss
	local dim
	local Check_pet = 0
	local Sktalk = {"[SC_104140_01]","[SC_104140_02]","[SC_104140_03]","[SC_104140_04]","[SC_104140_05]","[SC_104140_06]",} 
																  --��ܡG ����:�J�I�̡A�|�|�ڪ����㤧���C
                                                                  --�l������:
																  --�g�z:
																  --���� 
																  --���`:
																  --�H������:
	doorchick2 = CreateObjByFlag( door[1] , 780714 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register5,doorchick2)
	SetPlot( OwnerID(),"dead","UN_chiaDead_zone17",0 )
	while true do
		sleep(10)
		if HateListCount(OwnerID()) ~=0 then
			GameStart = 1 
			AllTime = AllTime + 1
			locoTime = locoTime +1 	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
				local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
				SetPosByFlag( Pet_owner , 780714, 3 )
				Check_pet = 1
			end			
			if AllTime == 1 then
			
				doorchick1 = CreateObjByFlag( door[2] , 780714 , 2 , 1 )
				SetModeEx(doorchick1,EM_SetModeType_Mark, false)
				SetModeEx(doorchick1,EM_SetModeType_HideName, false)
				SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
				SetModeEx(doorchick1,EM_SetModeType_Move, false)
				SetModeEx(doorchick1,EM_SetModeType_Fight, false)
				SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
				SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
				AddToPartition( doorchick1, RoomID)
				WriteRoleValue(doorchick1,EM_RoleValue_register1,OwnerID())
			end
			totandie = ReadRoleValue(OwnerID(),EM_RoleValue_register6)
			if totandie ==3 then
				TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)
				--say(TargetPlayer[1],"I got it!")
				Addbuff(TargetPlayer[1],507241,0,30)
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
			end
			if locoTime%20==0 then
				--BeginPlot(OwnerID(),"UN_weapen1_zone17",0)            --�۴�����
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[4] , 2 )
				TotemGroup = UN_weapen1_zone17(OwnerID(),TotemGroup) 
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				sleep(10)
			elseif Alltime%7  == 0 then
				Ran = DW_rand(2)
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[1] , 2 )
				CastSpellLv(OwnerID(),OwnerID(),Fightskill[Ran],0) --�H���񴶧�ۦ�2��1
				sleep(20)
			elseif Alltime >=480 then	
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[3] , 2 )
				AddBuff( OwnerID(),507364,0 ,-1 )                   --�g�z
			end
			if locoTime%31 == 0 then
				BeginPlot(OwnerID(),"UN_jeten_zone17",0)           --�l������
				sleep(10)
				locoTime = 0
			end
		elseif  HateListCount(OwnerID()) == 0 and GameStart == 1 then  --���a���Χ���k�s���k0
			if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead)==0 then
				GameStart = 0
				AllTime = 0 
				locoTime = 0
				dim = ReadRoleValue(OwnerID(),EM_RoleValue_register8)
				if CheckID(dim) == true then
						DelObj(dim)
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,3)
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				CancelBuff(OwnerID(),507430)
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[6] , 2 )
				for i = 1 ,table.getn(TotemGroup) do                   --�R�����˥�
					if CheckID(TotemGroup[i]) == true then
						DelObj(TotemGroup[i])
					end	
				end
				if CheckID(doorchick1) == true then
						DelObj(doorchick1)
				end
				Delobj(doorchick2)
				newboss= CreateObjByFlag( 104140 , 780704 , 0 , 1 )
				AddToPartition(newboss,roomID )
				delobj(OwnerID())
			elseif ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1 then  --kill��������
					if CheckID(dim) == true then
						DelObj(dim)
					end
				break	   
			end	 
		end
    end
end

function UN_chiaDead_zone17()    --BOSS���`�@��
	local x = ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_104140_05]", 2 )
	DelObj(x)                                                      --�R����
end
-----------------------------------------------------------------------------------------------------****
                                            --�۴�����
-----------------------------------------------------------------------------------------------------****
function UN_weapen1_zone17(Boss,TotemGroup)                                 --�۳����+������
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local person = ReadRoleValue(Boss,EM_RoleValue_register2)  --�۳���˼ƶq
	local TargetPlayer = {} --= Lua_RandomPlayerFromHateList(person)    --���o����C���H�����a?�H-TargetPlayer�}�C
	local weapen = {104150,104151,104152}                        --�T�ع��˰}�C
	local skill1 = {}    	--���ͥX�Ӫ����˥Ϊ��}�C
	local Skill2 = {}
	local X
	local rany
	local y = person - 1 
	Skill2 = SearchRangeNPC ( OwnerID() , 500 )	
	for i=0 , table.getn(skill2) do
		for j=1,table.getn(TotemGroup) do
			if	skill2[i] == TotemGroup[j] then
				DelObj(TotemGroup[j])
				SysCastSpellLv(OwnerID(),OwnerID(),495996,0) --����-10%HP
			end	
		end		
	end
	
	sleep(20)
	AddBuff(OwnerID(),507430,y ,-1)
    for i = 1 ,person do                   --table.getn(TargetPlayer)���oTargetPlayer�̤j��
		--TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)
		--LuaFunc_CreateObjByObj ( weapen[i] , TargetPlayer[i])	 --Ū��TargetPlayer��l���͹���
		X = dw_rand(3)
		rany = dw_rand(34)
		skill1[i] = CreateObjByFlag(weapen[X] , 780715 , rany , 1 )
		--skill1[i] = LuaFunc_CreateObjByObj ( weapen[X] , TargetPlayer[1])
		WriteRoleValue(skill1[i],EM_RoleValue_register1,Boss)
		WriteRoleValue(skill1[i],EM_RoleValue_register6,Boss)
		SetModeEx(skill1[i], EM_SetModeType_Move, false)         --���ˤ�����
		AddToPartition(skill1[i], RoomID)
	end
	return skill1
end

function UN_Totemcheck_zone17()                                 --���˽T�{BOSS����S�H�N�R��
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	sleep(10)
	while true do
		if hatelistcount(X) == 0 then
			DelObj(OwnerID())
		end
		sleep(20)
	end
end
function UN_Totemcheck2_zone17()                                 --�v�����˱M��
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	sleep(10)
	while true do
		if hatelistcount(X) == 0 then
			DelObj(OwnerID())
		elseif 	hatelistcount(X) ~= 0 then
			CastSpellLv(OwnerID(),X,495995,0)
		end
		sleep(20)
	end
end

function Lua_totemdie()             --���P���˵����PBUFF
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local totandead = ReadRoleValue(Boss,EM_RoleValue_register6)
	--say(OwnerID(),Boss)
	--local TargetPlayer = {}
	--TargetPlayer = Lua_RandomPlayerFromHateList(Boss,1)
	WriteRoleValue(Boss,EM_RoleValue_register6,totandead + 1 )
	--Addbuff(TargetPlayer[1],507241,0,30)
	pos=Lua_BuffPosSearch(Boss,507430)
	BuffLv=BuffInfo(Boss,pos,EM_BuffInfoType_Power)
	if CheckBuff(Boss,507430) then						--���W���oBUFF
		CancelBuff(Boss,507430)						--�M��
			if BuffLv>0	then 										--�YBUFF�j��1��
				BuffLv=BuffLv-1
				AddBuff(Boss,507430,BuffLv,-1)				--��1�ť[�^�h
			end 
	end
	DelObj(OwnerID())
end
function Lua_totemdie2()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local totandead = ReadRoleValue(Boss,EM_RoleValue_register6)
	--say(OwnerID(),Boss)
	--local TargetPlayer = {}
	--TargetPlayer = Lua_RandomPlayerFromHateList(Boss,1)
	WriteRoleValue(Boss,EM_RoleValue_register6,totandead + 1 )
	--Addbuff(TargetPlayer[1],507241,0,30)
	pos=Lua_BuffPosSearch(Boss,507430)
	BuffLv=BuffInfo(Boss,pos,EM_BuffInfoType_Power)
	if CheckBuff(Boss,507430) then						--���W���oBUFF
		CancelBuff(Boss,507430)						--�M��
			if BuffLv>0	then 										--�YBUFF�j��1��
				BuffLv=BuffLv-1
				AddBuff(Boss,507430,BuffLv,-1)				--��1�ť[�^�h
			end
	end
	DelObj(OwnerID())
end
function Lua_totemdie3()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local totandead = ReadRoleValue(Boss,EM_RoleValue_register6)
	--local TargetPlayer = {}
	--TargetPlayer = Lua_RandomPlayerFromHateList(Boss,1)
	WriteRoleValue(Boss,EM_RoleValue_register6,totandead + 1 )
	--Addbuff(TargetPlayer[1],507241,0,30)
	pos=Lua_BuffPosSearch(Boss,507430)
	BuffLv=BuffInfo(Boss,pos,EM_BuffInfoType_Power)
	if CheckBuff(Boss,507430) then						--���W���oBUFF
		CancelBuff(Boss,507430)						--�M��
			if BuffLv>0	then 										--�YBUFF�j��1��
				BuffLv=BuffLv-1
				AddBuff(Boss,507430,BuffLv,-1)				--��1�ť[�^�h
			end
	end
	DelObj(OwnerID())
end
---------------------------------------------------------------------------------------------------****
                                                       --����&����
---------------------------------------------------------------------------------------------------****
function UN_dead_zone17()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
    SetPlot( OwnerID(),"dead","UN_get_zone17",40 )
end
function UN_jeten_zone17()                                 --�l������
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempX
	local TempY =ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local rany
	local BossHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
    --TempX = CreateObjByFlag( 104153 , 780704 , 1 , 1 )  --���Ͳ��¡AFlagObjID=�X�l�N��
	rany = dw_rand(34)
	TempX = CreateObjByFlag(104153 , 780715 , rany , 1 )
	SetModeEx(TempX,EM_SetModeType_Fight,false)
	SetModeEx(TempX,EM_SetModeType_Move, false)
	WriteRoleValue(OwnerID(),EM_RoleValue_register8,TempX)
	AddToPartition(TempX,RoomID)
	Addbuff(TempX,507247,0,-1)
	WriteRoleValue(TempX,EM_RoleValue_register2, 0)
	sleep(70)                                              --����5��
	local jetenhp = ReadRoleValue(TempX, EM_RoleValue_IsDead)
	--say(OwnerID(),"jetenhp="..jetenhp)
	if jetenhp == 0 then
		if TempY < 7 then
			WriteRoleValue(OwnerID(),EM_RoleValue_register2, TempY + 1)   --register2+1 = �۴����˼ƶq+1
		end
		ScriptMessage( OwnerID(), -1 , 2 ,"[SC_104140_02]" , 2 )
		DelObj( TempX )                                                               --�R������
	elseif 	BossHP>=260000 then
		SysCastSpellLv(OwnerID(),OwnerID(),496112,1)
	end
end
-------------------------------------------------------------------------------------------------------------****
                                                --�H�U���l�����¤��O--**
-------------------------------------------------------------------------------------------------------------****
function UN_test1_zone17()
	local bufflv 
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_104140_07][$SETVAR1="..PlayerName.."]"
    AddBuff( TargetID() ,507244 ,0 ,4 )
	if 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   then --------���S�����b�I��ޯ�
		bufflv  = ReadRoleValue(TargetID() ,EM_RoleValue_register4 )
		CastSpell( TargetID(), OwnerID(),495943)                  --���¹缾�a��Y�k�N
		WriteRoleValue(TargetID(),EM_RoleValue_register4, bufflv + 1)
	end	
	if bufflv==1 then
		--SysCastSpellLv( OwnerID() , OwnerID() ,495973,0 )	
		Addbuff(OwnerID(),507402,0,15)
		ScriptMessage( OwnerID(), -1 , 2 ,MsgStr , 2 )
		NPCDead( TargetID(), OwnerID() )
		DelObj(TargetID())
	end  
	CancelBuff( OwnerID(), 507241 )
end
function UN_QQ_zone17()
	WriteRoleValue(TargetID(),EM_RoleValue_register4,0)
end
function UN_addbuff_zone17()
	if	CheckBuff(TargetID(),507247) then           --�P�_�O�_������
		if CheckBuff(TargetID(),507244) == true then--�ˬdBUFF 
			return false
		elseif 	CheckBuff(TargetID(),507244) == false then
			return true
		end	
	end	
end	
function UN_jetenbuff_zone17()
	Addbuff(OwnerID(),507247,0,-1)
end