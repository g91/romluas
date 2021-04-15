--205807  205808 火堆 + 打火石
--SC_unwarm_1 字串系列
function un_Xmas2012_warmwinter_die(num)  --暖冬火堆熄滅出小怪
local own = OwnerID()
if num == nil then
	num = DW_Rand(10)
end
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
local create 
	if num == 5 then       --10%機率出冰晶
		ScriptMessage( own, 0, 2, "[SC_UNWARM_1]", 0 ) --你感覺到周圍溫度急速降低。
		local x,y,z = ReadRoleValue(own,EM_RoleValue_X),ReadRoleValue(own,EM_RoleValue_Y),ReadRoleValue(own,EM_RoleValue_Z)
		create = Az_RND_Ary(-70,70,2)  --隨機生怪點用
		local x1  
		local z2 
		if create[1] >= 0 then
			x1 = -50
		else
			x1 = 50
		end
		if create[2] >= 0 then
			z2 = -50
		else
			z2 = 50
		end
		local monstar = CreateObj ( 121596 , x+(create[1]+x1*2) , y , z+(create[2]+z2*2) , 0 , 1) 
		AddToPartition( monstar, RoomID)
		BeginPlot(monstar , "un_warmwinter_diemonster" ,0 )
		WriteRoleValue(monstar,EM_RoleValue_register1,0)
		WriteRoleValue(monstar,EM_RoleValue_LiveTime,30)
		SetModeEx(monstar,EM_SetModeType_Gravity, false)
		
	end
end

function un_warmwinter_diemonster()  --小怪的AI
	local own = OwnerID()
	local timee = 0 --免疫火堆的時間 3秒
	SetModeEx(own,EM_SetModeType_Mark, false)  --一開始不給玩家點選
	MoveToFlagEnabled( own, false )
	SetPlot( own,"touch","un_warmwinter_diemonster_1",30 )
	--一出生判斷最近的玩家****
	--CallPlot( own, "un_warmwinter_diemonster_3", Player )
	local allplayer = {}
	allplayer = SearchRangePlayer ( own , 300 )
	if #allplayer == 0 then
		Delobj(own)  --周圍沒人，自刪
	end
	--*****
	while 1 do
		sleep(10)
		timee = timee+1
		if timee <=3 then
			cancelbuff(own,504457)
		end
		if checkbuff(own,504457) == false  then
			sysCastSpelllv(own,own,499752,0) --每秒施放
			if checkID(allplayer[0]) == false then --人不見自刪!
				Delobj(own)
			end
			local x,y,z,dir = DW_Location( allplayer[0] )
			local RunTime = Move( own, x, y, z )
		else
			SetModeEx(own,EM_SetModeType_Mark, true)
			MoveToFlagEnabled( own, true) 
			addbuff(own,623750,0,-1)
			break
		end
		--499752 極度冰凍 504457
	end
end

function un_warmwinter_diemonster_1()  --小怪被點以後1
	local tar = TargetID()
		--if ReadRoleValue(tar,EM_RoleValue_register1) ==0 then
			--WriteRoleValue(tar,EM_RoleValue_register1,1) 
			BeginCastBarEvent( OwnerID(), tar, "[SC_UNWARM_2]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "un_warmwinter_diemonster_3" )
		--end
end
function un_warmwinter_diemonster_2()  --小怪打到人自刪
Delobj(OwnerID())
end

function un_warmwinter_diemonster_3(Obj,CheckResult)  --小怪被點以後2
	if CheckResult > 0 then
		local tar = TargetID()
		SetModeEx(tar,EM_SetModeType_Mark, false)
		GiveBodyItem( OwnerID(), 205809, 1 ) --給玩家冰晶
		Delobj(tar)
	end
	EndCastBar( OwnerID(), CheckResult )
end
function un_warmwinter_diemonster_4() --任務完成刪除旗標
	DelBodyItem( TargetID(), 547191, 1 )
	SetFlag( TargetID(), 547333, 1 )	--FN添加的全勤獎判斷旗標
	DesignLog( TargetID() , 1209951 , "complete" )
end