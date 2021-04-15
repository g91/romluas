--帶隊用蘑菇人--107860--
--※ 風野奴隸3人團 ※--

function Nana_160_slave_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 160, 161 , 162 } --Raid , Normal, easy
	local Monster = { 	[1] ={108210 , 107957 , 107957 , 108208 } , 
				[2] ={108355 , 108351 , 108351 , 108353 } , 								
				[3] ={108370 , 108366 , 108366 , 108368 } 	} -- 風野氏族督役 / 風野氏族奴隸/ 風野氏族奴隸 / 初階演奏音匠

	local dis = 15	--可看物件大小調整距離寬度
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif  SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}

	for i = 1 , #ZoneID do
		if Zone == ZoneID[i] then	
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i][1] , Matrix , 1 , 0 )  --風野氏族督役
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i][2] , Matrix , 2 , 1 ) -- 風野氏族奴隸
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i][3] , Matrix , 2 , -1 ) -- 風野氏族奴隸
			ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( Monster[i][4] , Matrix , 3 , 0 ) -- 初階演奏音匠
			break
		end
	end

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_160_slave_walk" , 0 )
end
function Nana_160_slave_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_160_slave_group" , 0 )
end



function Nana_160_Uro_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 160, 161 , 162 } --Raid , Normal, easy
	local Monster = { 	[1] ={108208 , 108289 } , 
				[2] ={108353 , 108357 } , 								
				[3] ={108368 , 108372 } 	} -- 初階演奏音匠/ 音律基礎工匠/ 音律基礎工匠/ 音律基礎工匠
	local dis = 15	--可看物件大小調整距離寬度
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif  SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	for i = 1 , #ZoneID do
		if Zone == ZoneID[i] then	
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i][1]  , Matrix , 1 , 0 )  --初階演奏音匠
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i][2] , Matrix , 2 , 1 ) -- 音律基礎工匠
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i][2], Matrix , 2 , -1 ) -- 音律基礎工匠
			ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( Monster[i][2], Matrix , 2 , 0 ) -- 音律基礎工匠
			break
		end
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_160_Uro_walk" , 0 )
end
function Nana_160_Uro_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_160_Uro_group" , 0 )
end

------------------------------------------------------------------------------------------------------
--小怪相關
------------------------------------------------------------------------------------------------------

function Nana_160_108288_attack() --音律工匠進入戰鬥後出現三隻音律基礎工匠
	local Owner = OwnerID() --音律工匠
	local MonOrg = {	[160] = 108289 ,
				[161] =	108357 , 
				[162] = 108372		}
	local Zone = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local Monster = {} 
	local x,y,z,dir = DW_Location( Owner )
	for i = 1, 3 do
		local Angle = 100+40*i
		local Nx,Ny,Nz,Ndir = DW_NewLocation(Angle,30,x,y,z,Dir)
		Monster[i] = CreateObj( MonOrg[Zone] , Nx, Ny, Nz, Ndir, 1 ) --音律基礎工匠
		SetModeEx( Monster[i], EM_SetModeType_Mark, true )	--標記
		AddToPartition( Monster[i], RoomID )
		BeginPlot( Monster[i] , "Nana_160_108289_Check" , 50)
	end
end
		

function Nana_160_108289_Check() --音律基礎工匠，檢查是否在戰鬥中
	local Owner = OwnerID()
	while true do
		if ReadRoleValue( Owner , EM_RoleValue_IsAttackMode ) == 0 then  --判斷是否進入戰鬥 1= 是 0= 否
			DelObj( Owner )
		end
		sleep(10)
	end
end


function Lua_160_Uro_heal_check() --幽羅音律工匠，治癒時檢查同類
	local Owner = OwnerID()
	local Target = TargetID()
	local Orgid = ReadRoleValue( Target , EM_RoleValue_OrgID )
	if Orgid == 108208 or Orgid == 108209 or Orgid == 108288 or Orgid == 108289 or Orgid == 103380 or Orgid == 107424 or Orgid == 107959 or Orgid == 107960 or Orgid == 107961 or Orgid == 107962 or Orgid == 107963 then
		return true 
	else
		return false
	end
end		


function Lua_160_108289_Buff() --
	local Owner = OwnerID()
	AddBuff( Owner , 624987 , 0 , -1) 
end