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
----------------------------------------------------------------------------------------------------------------依據目標座標(可加入各軸變化量)產生物件
function star_CreateObj( TargetObj , ObjDBID , X , Y , Z , Room , Dir) 
------------------------------------1.TargetObj:目標   2. ObjDBID:要產生物件的DBID  3.X,Y,Z:座標變化量  4.Dir面相
	local Obj = Role:new( TargetObj ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local SpawnObj = CreateObj(ObjDBID, BaseX +X, BaseY+Y , BaseZ+Z , BaseDir+Dir, 1 )		
	AddToPartition( SpawnObj , Room )	 	
	return SpawnObj
end
----------------------------------------------------------------------------------------------------------------依據目標座標(可加入各軸變化量)產生物件(不含AddtoPartition)
function star_CreateObj_NoAdd( TargetObj , ObjDBID , X , Y , Z , Room , Dir) 
------------------------------------1.TargetObj:目標   2. ObjDBID:要產生物件的DBID  3.X,Y,Z:座標變化量  4.Dir面相
	local Obj = Role:new( TargetObj ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local SpawnObj = CreateObj(ObjDBID, BaseX +X, BaseY+Y , BaseZ+Z , BaseDir+Dir, 1 )			 	
	return SpawnObj
end
------------------------------------------------------------------------------------------------------------------------------------------------通用寶箱
function lua_star_TreasureBox()
	SetPlot( OwnerID() ,"touch", "lua_star_TreasureBox_1" ,40 )
end
function lua_star_TreasureBox_1()
	--BeginPlot( TargetID() , "lua_star_TreasureBox_2", 1 )
	--WriteRoleValue( TargetID() , EM_RoleValue_PID , TargetID() )
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end

-----------------------------------------------------------------------------------------精英技能旗標
function star_EliteSkillKey()
	local Button = {"Get All Skill!" , "Forget it!"}
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Chose One!" )
	for i=1 , table.getn(Button) do
		DialogSelectStr( OwnerID() , Button[i] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
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

function lua_star_EliteSkill()			-------給予
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
	local LV6070FlagNum1 = 546730 --Dy0524新增6070等級重要物品
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

function lua_star_DelEliteSkill()			-------刪除
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
	local LV6070FlagNum1 = 546730 --Dy0524新增6070等級重要物品
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
-----------------------------------------------------------------------檢查技能目標是否為自己
function lua_star_SkillCheck_NoneSelf()
	local partymember = LuaFunc_PartyData( OwnerID() )
	local InParty = 0	
	for i = 1 , partymember[0] , 1 do
		if TargetID() == partymember[i]  then
			InParty = 1 
		end
	end
	if InParty == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----目標非隊伍成員！
		return false
	elseif ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----目標錯誤
		return false
	elseif TargetID() ~= OwnerID() then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----目標錯誤
		return false
	end	
end
-----------------------------------------------------------------------------------------全域變數區

--------------------------------------------------------------------------------------------------金銀樹

function lua_star_Boss_GoldenTreeBuff()		-------金樹給玩家Buff
	lua_star_controlcheck(503868)
	return true
end
function lua_star_Boss_SilverTreeBuff()		-------銀樹給玩家Buff
	lua_star_controlcheck(503869)
	return true
end

----------------------------------------------------------------------------------------------------------------控場技能判斷對玩家或對怪物使用
function lua_star_Skill_ForMob()		--------填對怪物效果
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end
end

function lua_star_Skill_ForPlayer()		---------填對玩家效果
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end


-----------------------------------------------------------------------------------------------------------------仇恨表排序
function star_HateListSort(ObjGID)	-------------------------------使用後會回傳一個依據仇恨值由大至小排列好的table，table存放的值就是玩家的GID( 不包含寵物)
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
		if ReadRoleValue(TempGID,EM_RoleValue_IsPlayer)==1 then	--------是玩家才丟進table
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

-----------------------------------------------------------------------------------------------------------------Buff資訊
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

----------------------------------------------------------------------------------------------------------------檢查寵物主人( 判斷何時寵物該消失 )
function star_skill_PetSpawnBuff(Voc)							------掛在每隻寵物出生劇情，OringinalVOC填入可以招此種寵物的職業
	local SpawnBuff = 504641	
	AddBuff( OwnerID() , SpawnBuff , 0 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8 , Voc )	
end

function star_skill_CheckPet()							
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local MasterVoc = ReadRoleValue( MasterGID , EM_RoleValue_VOC )			-------主人當前主職	
	local OriginalVOC = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
	local MasterSubVoc = ReadRoleValue( MasterGID , EM_RoleValue_VOC_SUB )	-------主人當前副職
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


----------------------------------------------重置技能和TP(已寫在700788)
function lua_star_EliteSkillNew()			-------給予
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
	local LV6070FlagNum1 = 546730 --Dy0524新增6070等級重要物品
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