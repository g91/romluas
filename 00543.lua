function counterx()
	--test--
	--宣告區域變數
	--無窮迴圈的計數值
	local n=0
	--Ret是用來紀錄怪物id的陣列
	local Ret = {}
	--將 自己	原本的狀態宣告
	local hp1=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
	local mp1	=ReadRoleValue(OwnerID(),EM_RoleValue_MaxMP)
	--有一些還不確定的值 要先宣告以利使用
	local hp2=0 --用來紀錄最後的生命值還剩多少
	local mp2=0--用來紀錄最後的魔力值還剩多少	
	local dmg1=0 --紀錄怪物的最大血量
	local dmg2=0--紀錄怪物的最後血量
	local sec=0--紀錄自你進入戰鬥起的時間
	local sec1=0--紀錄自怪物開始反擊起的時間

	--建立迴圈
	while 1 do
		--防止無窮迴圈
		if n>3000 then
			ScriptMessage(OwnerID(),OwnerID(),0,"無窮迴圈",0)
			break
		end
		--判斷是否在戰鬥狀態
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 then
			--戰鬥狀態是持續的，以下執行只需一次的動作
			if sec ==0 then
				--進入戰鬥狀態 原因是我攻擊怪物 所以該怪物目標是我 以此為標準搜尋目標是我的怪物
				local Obj
				local Count = SetSearchRangeInfo( OwnerID() , 250 )
				local NPCCount = 0
				ScriptMessage( OwnerID(), OwnerID(), 0, "start", 0 )
				 for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsNPC() == True and Obj:AttackTargetID() == OwnerID() then
						Ret[NPCCount] = ID
						NPCCount = NPCCount + 1;
					end
				end	
				Ret[ NPCCount ] = -1;
				--經過上面 的式子得出Ret[0]就是該怪物的 id
				--命令此怪物執行無窮迴圈
				BeginPlot( Ret[0], "mobcounterx", 0 )
			end
			--回到無限迴圈&戰鬥狀態中
			--計時進入戰鬥狀態經過了多久的時間
			sec = sec+1
			--讓hp2取自己目前的血
			hp2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
			--利用判斷自己的血有沒有滿來確定怪物是否展開反擊
			if hp1~= hp2 then
				--計時怪物展開反擊之後過了多久的時間
				sec1=sec1+1
			end
		else
			--非戰鬥狀態
			--非戰鬥狀態&已有進入戰鬥狀態的計時=離開戰鬥
			if sec > 0 then
				--取得現在的戰鬥資料
				--玩家現在的血量
				hp2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
				--玩家目前的法力值
				mp2 = ReadRoleValue(OwnerID(),EM_RoleValue_MP)
				--讓玩家得到回報的數值
				--從我開火到離開戰鬥過後多久，0.1秒加一次，所以最後除10就得到秒數
				tell(TargetID(),OwnerID(),"Time="..sec/10);
				--從怪物反擊到離開戰鬥過後多久，0.1秒加一次，所以最後除10就得到秒數			
				tell(TargetID(),OwnerID(),"Time1="..sec1/10);
				--這次戰鬥中我損失了多少的血
				tell(TargetID(),OwnerID(),"HP="..hp1-hp2);
				--怪物己死亡，怪物的血量有多少
				tell(TargetID(),OwnerID(),"DMG="..dmg1);
				--這次戰鬥我用了多少的魔力
				tell(TargetID(),OwnerID(),"MP="..mp1-mp2);
				--讓一切值回復原狀
				--計時器歸零
				sec = 0
				sec1=0
				--角色的數值
				hp2=hp1
				mp2=mp1
				dmg1=0
				--確認戰鬥狀態結束
				WriteRoleValue( OwnerID() , EM_RoleValue_IsAttackMode,0)
			end
	
		end
		--防無窮迴圈的計數
		n=n+1
		--等待0.1秒
		sleep(1)
	end
end


--在怪勿身上執行的無窮迴圈
function mobcounterx()
	--宣告區域變數
	--無窮迴圈的計數值
	local n=0
	--將 自己原本的狀態宣告
	local hp1=ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
	local mp1=ReadRoleValue(TargetID(),EM_RoleValue_MaxMP)
	--有一些還不確定的值 要先宣告以利使用
	local hp2=0 --用來紀錄最後的生命值還剩多少
	local mp2=0--用來紀錄最後的魔力值還剩多少
	local dmg1=0--紀錄怪物的最大血量
	local dmg2=0--紀錄怪物的最後血量
	local sec=0--紀錄自你進入戰鬥起的時間
	local sec1=0--紀錄自怪物開始反擊起的時間
	--建立迴圈
	while 1 do
		--防止無窮迴圈
		if n>3000 then
			break
		end
		--判斷是否在戰鬥狀態
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "start", 0 )

			--戰鬥狀態中（無窮迴圈)
			--計時進入戰鬥狀態經過了多久的時間
			sec = sec+1
			--讓hp2取自己目前的血
			hp2=ReadRoleValue(TargetID(),EM_RoleValue_HP)
			--利用判斷自己的血有沒有滿來確定怪物是否展開反擊
			if hp1~= hp2 then
				--計時怪物展開反擊之後過了多久的時間
				sec1=sec1+1
			end
		else
			--非戰鬥狀態
			--非戰鬥狀態&已有進入戰鬥狀態的計時=離開戰鬥
			if sec > 0 then
				--取得現在的戰鬥資料
				--玩家現在的血量
				hp2=ReadRoleValue(TargetID(),EM_RoleValue_HP)
				--玩家目前的法力值
				mp2 = ReadRoleValue(TargetID(),EM_RoleValue_MP)
				--怪物目前的生命數值
				dmg1=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
				dmg2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
				--讓玩家得到回報的數值
				--從我開火到離開戰鬥過後多久，0.1秒加一次，所以最後除10就得到秒數
				ScriptMessage( TargetID(), TargetID(), 0,"Time="..sec/10 , 0 )
				--從怪物反擊到離開戰鬥過後多久，0.1秒加一次，所以最後除10就得到秒數	
				ScriptMessage( TargetID(), TargetID(), 0,"Time1="..sec1/10 , 0 )		
				--這次戰鬥中我損失了多少的血
				ScriptMessage( TargetID(), TargetID(), 0,"HP="..hp1-hp2 , 0 )
				--怪物己死亡，怪物的血量有多少
				ScriptMessage( TargetID(), TargetID(), 0,"DMG="..dmg1-dmg2 , 0 )
				--這次戰鬥我用了多少的魔力
				ScriptMessage( TargetID(), TargetID(), 0,"MP="..mp1-mp2 , 0 )
				--任務完成，跳出無限迴圈
				break
			end

		end
		--防無窮迴圈的計數
		n=n+1
		--等待0.1秒
		sleep(1)
	end

end

