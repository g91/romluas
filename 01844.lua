function ic123456()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	---local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	---local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	---local Attackplayer = Lua_AP_HateTargetID( boss )  -----抓取仇恨表內隨機一個人,這裡是包好的function ,Attackplayer=是我抓出來的那個人
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	---SetAttack( ownerid() , Attackplayer)
	---say ( Attackplayer , "==0")
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep (10)
		say ( OwnerID(), "456")
		---local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		---if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
		say ( OwnerID() , "123")
			--if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
			   --CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			--end
			--if CombatBegin == 1 then
				--skill = skill + 1
				--say ( OwnerID() , "skill="..skill)
				--if skill >= 5 then
				--	CastSpelllv ( OwnerID() , AttackTarget , 496542 , 0 )
				--end
				--skill = 0
				--skill1 = skill1 + 1
				--if skill1 >= 7 then
				--	CastSpelllv ( OwnerID() , AttackTarget , 491020 , 0 )
				--end
				--skill1 = 0
			--end
		--elseif HateListCount ( OwnerID() ) == 0 then --非戰鬥中 ---如果王的仇恨表內沒有人就要傳回給中控器
			--if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				--CombatBegin = 0 ------所以因為王的仇恨表內沒有人就該離開戰鬥了~這時候就必須將這個值寫回去原來的0~不然王會一直保持戰鬥狀態
			--end
		--end
	end
end