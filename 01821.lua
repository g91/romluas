function Lua_207183() --心語的花瓣
	BeginPlot( OwnerID(), "Lua_207183_do", 0 )
end

function Lua_207183_do() --心語的花瓣
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207183_1]", C_SYSTEM );
	Sleep(80)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207183_2]", C_SYSTEM );
	GiveBodyItem( OwnerID(), 543909, 1)
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_207160() --腥臭的乓骨肉
	BeginPlot( OwnerID(), "Lua_207160_do", 0)
end

function Lua_207160_do()
	local result
	if CountBodyItem ( OwnerID(), 207160 )  >9 then
		BeginCastBar( OwnerID(), "[SYS_GAMEMSGEVENT_163]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 )
		while true do
			sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if  CastBarStatus > 0 then
				result = "OK"
				EndCastBar( OwnerID() , CastBarStatus )
				break
			elseif CastBarStatus < 0 then
				EndCastBar( OwnerID() , CastBarStatus )
				break
			end			
		end
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_0908SEANSON_26]",0) --你所持的物品數量不足。
	end
	
	if ( result == "OK" ) then
		DelBodyItem( OwnerID(), 207160, 10)
		GiveBodyItem( OwnerID(), 207195, 1 )	
	end	
end
------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_207195() 
	BeginPlot( OwnerID(), "Lua_207195_1", 0)	
end

function Lua_207195_1()
	local target = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115055, 200 , 0) --搜尋"200"範圍內的物件"100103"
	if target ~= -1 then		
		local meat = LuaFunc_CreateObjByObj ( 115025, target ) --創造"肉115025"在"目標位置target"
		AddToPartition( meat , 0 )
		DelBodyItem( OwnerID(), 207195, 1) --刪除物品
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_207195]", 0 )--等待狡猾的卻普瑞...
		CallPlot( OwnerID(), "Lua_207195_2", meat )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SYS_SUITSKILL_POS_ERROR]", 0 ) --位置錯誤!!
	end
end

function Lua_207195_2(meat)
	sleep(30)
	local Monster = LuaFunc_CreateObjByObj ( 103590, meat ) --在指定位置產生怪物"103590" 
	AddToPartition( Monster, 0 )
	sleep(20)
	DelObj( meat )
	BeginPlot(Monster,"LuaS_Discowood_CheckPeace",0) --8.5秒內未進入戰鬥狀態就會消失
end
----------------------------------------------------------------------------------
function LuaS_423220()		--痛苦的單戀
	LoadQuestOption( OwnerID() ) --讀取任務模版	
	if	CheckAcceptQuest( OwnerID() ,423220 ) == true	then  --檢查任務  		
		SetSpeakDetail(OwnerID(),"[ZONE16_K1]")  --顯示字串設定本文
		if	 CheckFlag( OwnerID(), 543950 )==false	then --檢查重要旗標  
			AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K2]" , "Lua_423220_1", 0 )		--有個只能以劍技自豪的衛兵跟我提起妳。
		end
	elseif CheckAcceptQuest( OwnerID() ,423229 ) == true	then  --解語花
		SetSpeakDetail(OwnerID(),"[ZONE16_K4]")
		if	CheckFlag( OwnerID(), 543966 ) ==false then --檢查重要旗標
			if	CountBodyItem ( OwnerID(), 207181 ) >0 then
				AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K5]" , "Lua_423229_1", 0 )		--不是的，我只是想請問這朵花的名字。
			end
		end
	elseif CheckAcceptQuest( OwnerID() ,423231 ) == true then --拖延時間
		SetSpeakDetail(OwnerID(),"[ZONE16_K9]")
		if	CheckFlag( OwnerID(), 543967 ) ==false then --檢查重要旗標
			AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K10]" , "Lua_423231_1", 0 )
		end
	end
end
----------------------------------------------------------------
function Lua_423229_1()--下一段對話
	SetSpeakDetail(OwnerID(),"[ZONE16_K6]")--菲菈斯回話本文
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K7]" , "Lua_423229_2", 0 )		--妳討厭拿莫克嗎？
end

function Lua_423229_2()--下一段對話
	SetSpeakDetail(OwnerID(),"[ZONE16_K8]")--菲菈斯回話本文
	SetFlag( OwnerID() , 543966 , 1 )--給玩家一個旗標
	DelBodyItem ( OwnerID(), 207181, 1 )
	GiveBodyItem ( OwnerID() , 207182, 1 )
end
------------------------------------------------------------------
function Lua_423220_1()--下一段對話
	SetSpeakDetail(OwnerID(),"[ZONE16_K3]")--菲菈斯回話本文
	SetFlag( OwnerID(), 543950 , 1 )--給玩家一個旗標
end
----------------------------------------------------------
function Lua_423231_1()--下一段對話
	SetSpeakDetail(OwnerID(),"[ZONE16_K11]")--菲菈斯回話本文
	SetFlag( OwnerID(), 543967 , 1 )--給玩家一個旗標
end

---------------------------------------------------------------------------

function Lua_115026() --伐木工頭
	LoadQuestOption( OwnerID() ) --讀取任務模版	
	if CheckAcceptQuest( OwnerID() ,423240 ) == true and CountBodyItem( OwnerID(), 207196) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_115026_0]" , "Lua_115026_1", 0 ) --取得樹苗
	end
end

function Lua_115026_1() 
	SetSpeakDetail( OwnerID() , "[SC_115026_1]" ) --看來比想像中的還要難栽種。
	GiveBodyItem( OwnerID(), 207196, 5 )	
end


function Lua_423240(item,count) --生生不息
	if count > 0 and CheckFlag( OwnerID(), 543969 ) ~= true then
		if CountBodyItem( OwnerID() , Item) >= count  then
			DelBodyItem( OwnerID() , Item , count )
			CallPlot( OwnerID(), "Lua_423240_do", TargetID() )
			return 1
		else
			return -1
		end
	else
		return -1
	end	
end

function Lua_423240_do( target )
	if rand(5)+1 == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_423240_1]", 0 ) --種植成功
		SetFlag(OwnerID(), 543969, 1 )	--得到勝利旗標
		local tree = LuaFunc_CreateObjByObj ( 115190, target ) --在指定位置"target"產生物件 
		AddToPartition( tree, 0 )
		WriteRoleValue( tree, EM_RoleValue_LiveTime, 10 )
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_423240_2]", 0 ) --種植失敗			
	end
	--CallPlot(OwnerID(), "LuaFunc_ResetObj", target)
	--WriteRoleValue( target , EM_RoleValue_PID, 0 )
end

--行前準備一連串相關任務--
function LuaS_423232()	--掛在恩達洛的死對頭身上
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--身上有423231且
		CheckCompleteQuest	( OwnerID(), 423232 ) == true  and	--完成過423232且
		CountBodyItem ( OwnerID(), 207280 ) == 0 then --身上沒有207280 那麼
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423232_1",0) --「我把東西弄丟了......」
	end
end

function LuaS_423232_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_2]")	--我還以為是你不要了呢，拿去吧，別再弄丟了
	GiveBodyItem ( OwnerID(), 207280 , 1 )
end


function LuaS_423233()	--掛在受欺負的小貴族身上
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--身上有423231且
		CheckCompleteQuest	( OwnerID(), 423233 ) == true  and	--完成過423232且
		CountBodyItem ( OwnerID(), 207281 ) == 0 then --身上沒有207280 那麼
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423233_1",0) --「我把東西弄丟了......」
	end
end

function LuaS_423233_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_3]")	--我還以為是你不要了呢，拿去吧，別再弄丟了
	GiveBodyItem ( OwnerID(), 207281 , 1 )
end


function LuaS_423234()	--掛在卑鄙的競爭者身上
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--身上有423231且
		CheckCompleteQuest	( OwnerID(), 423234 ) == true  and	--完成過423232且
		CountBodyItem ( OwnerID(), 207282 ) == 0 and CountBodyItem ( OwnerID(), 207283 ) == 0  then --身上沒有207280 那麼
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423234_1",0) --「我把東西弄丟了......」
	end
end

function LuaS_423234_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_4]")	--我還以為是你不要了呢，拿去吧，別再弄丟了
	GiveBodyItem ( OwnerID(), 207282 , 1 )
	GiveBodyItem ( OwnerID(), 207283 , 1 )
end