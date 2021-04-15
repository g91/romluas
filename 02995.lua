--帶隊用蘑菇人--107860--
--※ 水母3人團 ※--

function Nana_157_jelly_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 157 , 158 , 159} --Raid , Normal, easy
	local Monster = { 107884 , 108219 , 108228 } --棘藻小水母
	local dis = 5	--可看物件大小調整距離寬度
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
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
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 1 , 0 )
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 3 , 1 )
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 2 , -1 )
			break
		end
	end

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_157_jelly_walk" , 0 )
end
function Nana_157_jelly_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_jelly_group" , 0 )
end

------------------------------------------------------------------------------------------------------
--小怪相關
------------------------------------------------------------------------------------------------------
function Lua_na_107878_skill1() --海盜殘骸警戒兵，當血量低於1/3時，會求救
	local Owner = OwnerID() --警戒兵
	local Target = TargetID() --玩家
	local NPC = SearchRangeNPC( Owner , 200)
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == 107879 or ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == 107878 then
			SetAttack( NPC[i]  ,HateListInfo(Owner , 0 , EM_HateListInfoType_GItemID ) ) 
		end
	end
end


function Lua_na_107878_reset() --重置怪物的仇恨值
--	DebugMsg( 0 , 0 , "CLEAR")
	ClearHateList( OwnerID() ,-1)
end


function Lua_na_107884_skill1() --小水母自爆
	local Owner = OwnerID()
--	Say( Owner , "ABC")
	DebugMsg( 0,0,"CDE")
	killId( Owner , Owner)
end
