function lua_star_CreateNPC(originalid , objPID , artifactid , Xordinator , roomid2)
	local Obj = Role:new( originalid ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local artifact1  = CreateObj(artifactid, BaseX +Xordinator, BaseY, BaseZ, BaseDir , 1 )		
	AddToPartition( artifact1 , roomid2 )	
	WriteRoleValue( artifact1 , EM_RoleValue_PID , objPID ) 	
	return artifact1
end

function lua_star_ResetObj()
	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------------------------------------------------------------�̾ڥؼЮy��(�i�[�J�U�b�ܤƶq)���ͪ���
function star_CreateObj( TargetObj , ObjDBID , X , Y , Z , Room , Dir) 
------------------------------------1.TargetObj:�ؼ�   2. ObjDBID:�n���ͪ���DBID  3.X,Y,Z:�y���ܤƶq  4.Dir����
	local Obj = Role:new( TargetObj ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local SpawnObj = CreateObj(ObjDBID, BaseX +X, BaseY+Y , BaseZ+Z , BaseDir+Dir, 1 )		
	AddToPartition( SpawnObj , Room )	 	
	return SpawnObj
end
----------------------------------------------------------------------------------------------------------------�̾ڥؼЮy��(�i�[�J�U�b�ܤƶq)���ͪ���(���tAddtoPartition)
function star_CreateObj_NoAdd( TargetObj , ObjDBID , X , Y , Z , Room , Dir) 
------------------------------------1.TargetObj:�ؼ�   2. ObjDBID:�n���ͪ���DBID  3.X,Y,Z:�y���ܤƶq  4.Dir����
	local Obj = Role:new( TargetObj ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local SpawnObj = CreateObj(ObjDBID, BaseX +X, BaseY+Y , BaseZ+Z , BaseDir+Dir, 1 )			 	
	return SpawnObj
end
------------------------------------------------------------------------------------------------------------------------------------------------�q���_�c
function lua_star_TreasureBox()
	SetPlot( OwnerID() ,"touch", "lua_star_TreasureBox_1" ,40 )
end
function lua_star_TreasureBox_1()
	--BeginPlot( TargetID() , "lua_star_TreasureBox_2", 1 )
	--WriteRoleValue( TargetID() , EM_RoleValue_PID , TargetID() )
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end

-----------------------------------------------------------------------------------------��^�ޯ�X��
function star_EliteSkillKey()
	local Button = {"Get All Skill!" , "Forget it!"}
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Chose One!" )
	for i=1 , table.getn(Button) do
		DialogSelectStr( OwnerID() , Button[i] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return
	end
	local SelectID = Hsiang_GetDialogResoult( OwnerID() )
	--Say(OwnerID() , SelectID)
	DialogClose( OwnerID() )
	if SelectID == 0 then
		lua_star_EliteSkill()
	elseif SelectID == 1 then
		lua_star_DelEliteSkill()
	end
end

function lua_star_EliteSkill()			-------����
	local FlagNum =541885    
	for i=1,241 do	
		if FlagNum ~= 542000 then 
			SetFlag( OwnerID()  , FlagNum , 1 )
		end
		FlagNum=FlagNum+1
	end
	local ElfFlagNum = 543016
	for j=1,144 do
		SetFlag( OwnerID()  , ElfFlagNum , 1 )
		ElfFlagNum = ElfFlagNum + 1
	end
	local shadowFlagNum1 = 545880
	for j=1,120 do
		SetFlag( OwnerID()  , shadowFlagNum1 , 1 )
		shadowFlagNum1 = shadowFlagNum1 + 1
	end	
	local shadowFlagNum2 = 546015
	for j=1,24 do
		SetFlag( OwnerID()  , shadowFlagNum2 , 1 )
		shadowFlagNum2 = shadowFlagNum2 + 1
	end	
	local LV6070FlagNum1 = 546730 --Dy0524�s�W6070���ŭ��n���~
	for k=1,65 do
		SetFlag( OwnerID()  , LV6070FlagNum1 , 1 )
		LV6070FlagNum1 = LV6070FlagNum1 + 1
	end	
	local LV6070FlagNum2 = 546796
	for k=1,67 do
		SetFlag( OwnerID()  , LV6070FlagNum2 , 1 )
		LV6070FlagNum2 = LV6070FlagNum2 + 1
	end
end

function lua_star_DelEliteSkill()			-------�R��
	local FlagNum =541885    
	for i=1,241 do	
		if FlagNum ~= 542000 then 
			SetFlag( OwnerID()  , FlagNum , 0 )
		end
		FlagNum=FlagNum+1
	end
	local ElfFlagNum = 543016
	for j=1,144 do
		SetFlag( OwnerID()  , ElfFlagNum , 0 )
		ElfFlagNum = ElfFlagNum + 1
	end
	local shadowFlagNum1 = 545880
	for j=1,120 do
		SetFlag( OwnerID()  , shadowFlagNum1 , 0 )
		shadowFlagNum1 = shadowFlagNum1 + 1
	end	
	local shadowFlagNum2 = 546015
	for j=1,24 do
		SetFlag( OwnerID()  , shadowFlagNum2 , 0 )
		shadowFlagNum2 = shadowFlagNum2 + 1
	end
	local LV6070FlagNum1 = 546730 --Dy0524�s�W6070���ŭ��n���~
	for k=1,65 do
		SetFlag( OwnerID()  , LV6070FlagNum1 , 0 )
		LV6070FlagNum1 = LV6070FlagNum1 + 1
	end	
	local LV6070FlagNum2 = 546796
	for k=1,67 do
		SetFlag( OwnerID()  , LV6070FlagNum2 , 0 )
		LV6070FlagNum2 = LV6070FlagNum2 + 1
	end	
end
-----------------------------------------------------------------------�ˬd�ޯ�ؼЬO�_���ۤv
function lua_star_SkillCheck_NoneSelf()
	local partymember = LuaFunc_PartyData( OwnerID() )
	local InParty = 0	
	for i = 1 , partymember[0] , 1 do
		if TargetID() == partymember[i]  then
			InParty = 1 
		end
	end
	if InParty == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼЫD������I
		return false
	elseif ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼп��~
		return false
	elseif TargetID() ~= OwnerID() then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ؼп��~
		return false
	end	
end
-----------------------------------------------------------------------------------------�����ܼư�

--------------------------------------------------------------------------------------------------���Ⱦ�

function lua_star_Boss_GoldenTreeBuff()		-------���𵹪��aBuff
	lua_star_controlcheck(503868)
	return true
end
function lua_star_Boss_SilverTreeBuff()		-------�Ⱦ𵹪��aBuff
	lua_star_controlcheck(503869)
	return true
end

----------------------------------------------------------------------------------------------------------------�����ޯ�P�_�缾�a�ι�Ǫ��ϥ�
function lua_star_Skill_ForMob()		--------���Ǫ��ĪG
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end
end

function lua_star_Skill_ForPlayer()		---------��缾�a�ĪG
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end


-----------------------------------------------------------------------------------------------------------------�����Ƨ�
function star_HateListSort(ObjGID)	-------------------------------�ϥΫ�|�^�Ǥ@�Ө̾ڤ���ȥѤj�ܤp�ƦC�n��table�Atable�s�񪺭ȴN�O���a��GID( ���]�t�d��)
	local Count = HateListCount(ObjGID)	
	local TempGID = 0
	local TempHate = 0
	--local SwitchTemp = 0
	local TempList = {}
	local SortedList = {}
	local NameSort = {}
	local IsSmaller = 0
	for i=0 , Count-1 do
		TempGID = HateListInfo(ObjGID,i,EM_HateListInfoType_GItemID)
		TempHate = HateListInfo(ObjGID,i,EM_HateListInfoType_HatePoint)
		if ReadRoleValue(TempGID,EM_RoleValue_IsPlayer)==1 then	--------�O���a�~��itable
			if table.getn(TempList) > 0 then
				for j=1 , table.getn(TempList) do					
					if TempHate > TempList[j] then
						table.insert(TempList , j , TempHate)
						table.insert(NameSort , j , TempGID)						
						IsSmaller = 0
						break
					else
						IsSmaller = IsSmaller + 1
					end
				end	
			else
				TempList[table.getn(TempList)+1] = TempHate
				NameSort[table.getn(NameSort)+1] = TempGID
			end	
			if IsSmaller == table.getn(TempList) then
				TempList[table.getn(TempList)+1] = TempHate
				NameSort[table.getn(NameSort)+1] = TempGID
			end	
		end
	end
	return NameSort
end

-----------------------------------------------------------------------------------------------------------------Buff��T
function star_BuffInfo( CheckTarget , buffid , arg )

	local pos = star_BuffPos( CheckTarget , buffid )
	local result = BuffInfo( CheckTarget , pos , arg ) 
	return result
end


function star_BuffPos( CheckTarget , buffid)				-----CheckTarget , buffid
	local count = BuffCount( CheckTarget )  
	local pos = 0
	if CheckBuff( OwnerID() , buffid ) == true then
		for i=0 , count do
			if BuffInfo( CheckTarget , i , EM_BuffInfoType_BuffID ) == buffid then
				--Yell( TargetID() ,  "pos ="..i )
				pos = i
				break
			end	
		end
	end
	return pos
end

----------------------------------------------------------------------------------------------------------------�ˬd�d���D�H( �P�_����d���Ӯ��� )
function star_skill_PetSpawnBuff(Voc)							------���b�C���d���X�ͼ@���AOringinalVOC��J�i�H�ۦ����d����¾�~
	local SpawnBuff = 504641	
	AddBuff( OwnerID() , SpawnBuff , 0 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8 , Voc )	
end

function star_skill_CheckPet()							
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local MasterVoc = ReadRoleValue( MasterGID , EM_RoleValue_VOC )			-------�D�H��e�D¾	
	local OriginalVOC = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
	local MasterSubVoc = ReadRoleValue( MasterGID , EM_RoleValue_VOC_SUB )	-------�D�H��e��¾
	local OriginalSub = ReadRoleValue( OwnerID() , EM_RoleValue_Register10 )
	local Voc = ReadRoleValue( OwnerID() , EM_RoleValue_Register8 )
	
	--Say(OwnerID() , "Voc="..Voc)
	if OriginalVOC ~= 0 then 
		if OriginalVOC ~= MasterVoc 
		 or MasterVoc ~= Voc then		
			DelObj(OwnerID())			
		elseif OriginalSub ~= 0 then
			if OriginalSub ~= MasterSubVoc then
				DelObj(OwnerID())				
			end	
		--elseif GetDistance( OwnerID(), PetGID ) > 500 then
			--DelObj(PetGID)
		end				
	end	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register9 , MasterVoc )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , MasterSubVoc )
end		


----------------------------------------------���m�ޯ�MTP(�w�g�b700788)
function lua_star_EliteSkillNew()			-------����
	local FlagNum =541885    
	for i=1,241 do	
		if FlagNum ~= 542000 then 
			SetFlag( OwnerID()  , FlagNum , 1 )
		end
		FlagNum=FlagNum+1
	end
	local ElfFlagNum = 543016
	for j=1,144 do
		SetFlag( OwnerID()  , ElfFlagNum , 1 )
		ElfFlagNum = ElfFlagNum + 1
	end
	local shadowFlagNum1 = 545880
	for j=1,120 do
		SetFlag( OwnerID()  , shadowFlagNum1 , 1 )
		shadowFlagNum1 = shadowFlagNum1 + 1
	end	
	local shadowFlagNum2 = 546015
	for j=1,24 do
		SetFlag( OwnerID()  , shadowFlagNum2 , 1 )
		shadowFlagNum2 = shadowFlagNum2 + 1
	end	
	local LV6070FlagNum1 = 546730 --Dy0524�s�W6070���ŭ��n���~
	for k=1,65 do
		SetFlag( OwnerID()  , LV6070FlagNum1 , 1 )
		LV6070FlagNum1 = LV6070FlagNum1 + 1
	end	
	local LV6070FlagNum2 = 546796
	for k=1,67 do
		SetFlag( OwnerID()  , LV6070FlagNum2 , 1 )
		LV6070FlagNum2 = LV6070FlagNum2 + 1
	end	
end