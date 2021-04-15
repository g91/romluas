

function LuaS_420826()
	SetPlot( OwnerID(),"touch","LuaS_420826_0",35 )
end

function LuaS_420826_0()
	if CountBodyItem( OwnerID(), 201440)>4 and CountBodyItem( OwnerID(), 201441)>0 then
		BeginPlot(OwnerID(),"LuaS_420826_1",0)--在玩家身上放一段程式
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420826_0"), 0 )--你還沒準備好!
	end
end


function LuaS_420826_1()

	local CheckFood = SearchRangeNPC ( OwnerID() , 150 , 1 ) --將附近的NPC抓進來
	local CheckEnd = false
	for i=0,table.getn(CheckFood) do
		if 	ReadRoleValue( CheckFood[i] , EM_RoleValue_OrgID)==110967 or
			ReadRoleValue( CheckFood[i] , EM_RoleValue_OrgID)==100674 then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420826_1"), 0 )--看來你得等一陣子...
			CheckEnd = true
			break
		end
	end

	if CheckEnd == false then
		local Food=CreateObj( 110967 , 1387 , -22 , 3561.6 , 0 , 1)--固定地點
		AddToPartition( Food ,    0 ) --放入場景
		BeginPlot( Food , "LuaS_420826_5" , 0 )--在它身上放一段倒數銷毀的程式
		BeginPlot( Food , "LuaS_420826_2" , 0 )--在它身上放一段檢查程式

		local r = ""
		if BeginCastBar( OwnerID(), GetString("EM_420826_1_1") , 40 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end-- 烤肉
		while true do
			sleep( 2 );
			local c = CheckCastBar( OwnerID() )
			if ( c ~= 0 ) then 
				if ( c > 0) then -- 成功，值會是1
					r = "ok"
					EndCastBar( OwnerID() , c )
					break
				else
					if ( c < 0 ) then -- 失敗，值會是-1
						r = "dame"
						DelObj(food)
						EndCastBar( OwnerID() , c )
						break;
					end
				end
			end
		end

		if ( r == "ok" ) then
			DelBodyItem( OwnerID(), 201440, 5 )
			DelBodyItem( OwnerID(), 201441, 1 )
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("EM_420826_1_2") , 0 )		--你成功的引來了犬王布諾克!
			BeginPlot(OwnerID(),"LuaS_420826_3",0)
			DelObj(food)
		end
	end
end

function LuaS_420826_2()
	local sec = 0
	local PlayerGroup = {}
	local PlayerCheck = false
	while true do
		if sec > 300 then
			break
		end

		PlayerGroup = SearchRangePlayer( OwnerID() , 150 )

		for i = 0 , table.getn(PlayerGroup) do
			if PlayerGroup[i] == TargetID() then
				PlayerCheck = true
				break
			end
		end

		if PlayerCheck == false then
			DelObj( OwnerID() )
			break
		else
			sec = sec + 1
		end

		sleep(10)
		PlayerCheck = false
	end
end


function LuaS_420826_3()
	local Bunok = CreateObj(100674,1164.6,19,3554.2,0,1)--p1叫出布諾克
	AddToPartition( Bunok ,    0 ) --放入場景
	SetAttack( Bunok , OwnerID())
	BeginPlot( Bunok ,"LuaS_420826_4", 0)

	local mm2=CreateObj(100456 ,1586.9,-40,3425.5,0,1)--p2
	AddToPartition( mm2 ,    0 ) --放入場景
	SetAttack( mm2 , OwnerID())
	BeginPlot( mm2 ,"LuaS_420826_4", 0)

	local mm3=CreateObj(100456 ,1520.2,-48,3743.0,0,1)--p3
	AddToPartition( mm3 ,    0 ) --放入場景
	SetAttack( mm3 , OwnerID())
	BeginPlot( mm3 ,"LuaS_420826_4", 0)

end


function LuaS_420826_4()
	LuaFunc_Obj_Suicide(60)
end

function LuaS_420826_5()
	for i =1,15 do
		sleep(10)
	end
	DelObj(OwnerID())
end