

--------------------------------------------------------------
function LuaS_422715_0() -- 掛在 422715 接受任務執行劇情
--------------------------------------------------------------
--鎖死NPC互動
	DisableQuest(OwnerID(),true)
--施法
	CastSpell(OwnerID(),TargetID(),494221)
--執行傳送動作
	sleep(20)
	
	if 	ChangeZone(TargetID(),118,-1,563,676.3,-137,270)	 then
		local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )					-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		DesignLog( TargetID() , 117 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
	else
		ScriptMessage( TargetID() , TargetID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
--解開
	DisableQuest(OwnerID(),false)
end
--------------------------------------------------------------
function LuaS_422725_0() -- 掛在 422725 接受任務執行劇情
--------------------------------------------------------------
--鎖死NPC互動
	DisableQuest(OwnerID(),true)
	sleep(10)
	Say(OwnerID(),"[SC_422725_0]")
	sleep(25)
	Say(OwnerID(),"[SC_422725_1]")
	sleep(15)
--開啟NPC互動
	DisableQuest(OwnerID(),false)
end

--------------------------------------------------------------
function LuaS_422716_0() --掛在422717 的完成任務執行劇情
--------------------------------------------------------------
	AddBuff(TargetID(),504308,1,180)
end

--------------------------------------------------------------
function LuaS_422717_6() -- 掛在 422718 & 422725完成任務執行劇情
--------------------------------------------------------------
--buff結束的時候
--執行法術494225
--會跑scirpt LuaS_422717_7 判斷任務完成的進度
	AddBuff(TargetID(),504729,1,180)
end

--------------------------------------------------------------
function LuaS_422717_7() --buff結束的執行劇情
--------------------------------------------------------------
	if	CheckCompleteQuest(OwnerID(),422718)	and
		CheckCompleteQuest(OwnerID(),422725)	then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_422717_6]", 0 )
		SetFlag(OwnerID(),543283,1)
	end
end




---------------------------------------
function LuaS_422724_0() --掛在物品(可疑的信件)的使用劇情
---------------------------------------
	DW_Border(422724)
end


---------------------------------------
function LuaS_422724_1() --掛在102261 蛇人女祭司的出生劇情
---------------------------------------
	SetPlot(OwnerID(),"dead","LuaS_422724_2",0)
end


---------------------------------------
function LuaS_422724_2() --蛇人女祭司的死亡劇情
---------------------------------------
	local Temp = 0
	for i=0,HateListCount( OwnerID())-1,1	do
		Temp = HateListInfo(OwnerID(),i, EM_HateListInfoType_GItemID)
		if	not CheckCompleteQuest(Temp,422723)	then
			if	not CheckAcceptQuest(Temp,422724)	then
				GiveBodyItem(Temp,205843,1)
			end
		end
	end
end