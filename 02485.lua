--押漁貨的保鏢(424425 ) / 幽寧谷專車 (424637) (424563)

function Lua_na_119231()
	LoadQuestOption( OwnerID() ) --載入任務模板
	if CheckQuest( OwnerID() , 424425 , 0 ) == true then
		AddSpeakOption( OwnerID() , TargetID(), "[SC_119231_OPTION]" , "Lua_na_119231_1", 0 ) --丹尼爾．杜南鐸要我來保護漁貨運送
	end
end

function Lua_na_119231_1()
	SetSpeakDetail( OwnerID(), "[SC_119231_SPEAK]" )
end



--424632掌握情報 / 424633替換裝置
function LuaI_240632_1() --檢查範圍內NPC
	local X = SearchRangeNPC( OwnerID(), 30)
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 0 then --非戰鬥狀態
		for i = 0 , table.getn(X) do
			if ReadRoleValue( X[i] ,EM_RoleValue_OrgID) == 119243 then
				AddBuff( OwnerID(), 620879 ,0 ,4);
				return true
			end
			if	i==(table.getn(X))	then
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_240632_0]", 0)  --尚未到達指定位置
				return false
			end
		end
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_0]",0 ) --此物品戰鬥中不能使用。
		return false
	end
end


function LuaI_240632_2() --在監聽裝置範圍內
	local Obj = OwnerID();
	local X = SearchRangeNPC( OwnerID(), 30)
	for i = 0 , table.getn(X) do
		if ReadRoleValue( X[i] ,EM_RoleValue_OrgID) == 119243 then
			CallPlot(X[i],"LuaFunc_ResetObj",X[i]); 
			break
		end
	end
	CancelBuff_NoEvent(Obj,620879);
	DW_QietKillOne(Obj,106121);
end

function LuaI_240632_3(QuestID)
	local Obj = OwnerID();
	local Tar = TargetID();
	SetQuestState(Tar,QuestID,0);
	DisableQuest(Obj,false);
	if	QuestID==424645	then
		Lua_ZonePE_3th_GetScore(200);
	end
	return true;
end


--任務 424634 演戲道具 / 424635 更多演戲道具
function LuaI_240630() --新鮮塔塔尼肉的腐壞劇情
	local Obj = OwnerID()
	if 	CheckAcceptQuest(Obj,424634)	or
		CheckAcceptQuest(Obj,424635)	or
		CheckAcceptQuest(Obj,424646)	then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_240630_0]", 0 )
	end
end 