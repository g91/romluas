--------------------------------------------------------------------好喝的酒
Function LuaI_421507_Quest()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 421507, 1 ));
	ShowBorder( OwnerID(), 421507,str , "ScriptBorder_Texture_Paper" )	
end

--------------------------------------------------------------------向原‧灰瑪露拿萬能鑰匙
function LuaS_421496()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421496)==true )and(CountBodyItem( OwnerID(), 203117 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_421496_0"),"LuaS_421496_1",0)
	end
end

function LuaS_421496_1()
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	GiveBodyItem( OwnerID(), 203117, 1 )
end

--------------------------------------------------------------------向馬克拿一捆木柴

function LuaS_421503()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421503)==true )and(CountBodyItem( OwnerID(), 203133 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_421503_0"),"LuaS_421503_1",0)
	end
end

function LuaS_421503_1()
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	GiveBodyItem( OwnerID(), 203133, 1 )
end

--------------------------------------------------------------------試驗毒藥藥劑任務
function LuaS_421505()
	local Pig = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if Pig == 100745 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421505_2") , 0 )	--  必須對冠毛皮豬才能使用劇烈毒藥！
		return false
	end
end

function LuaS_421505_1()
	local Small_Pig = LuaFunc_CreateObjByObj ( 101294 , TargetID() )
--	AddToPartition( Small_Pig ,    0 )
	SetFlag(OwnerID() , 542153 , 1 )
	BeginPlot(Small_Pig , "LuaS_421505_2" , 0 )
	BeginPlot( TargetID() , "LuaS_421505_3" , 0 )
--	BeginPlot( OwnerID() , "LuaS_421505_4" , 0 )
end

function LuaS_421505_2()
	sleep(100)
	while true do
		local AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0  then
			if ReadRoleValue(OwnerID() , EM_RoleValue_IsDead) == 0 then
				DelObj(OwnerID())
				break
			end
		end
		sleep(20)
	end
end

function LuaS_421505_3()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_421505_4()
	--DelBodyItem( OwnerID(), 203135 , 1 )  -- 刪除劇烈毒藥
	UseItemDestroy() 		--刪除使用中的物品
end

---------------------------------------------------------------









