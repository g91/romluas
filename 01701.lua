function LuaS_114350_0()
	if CheckFlag( OwnerID() , 543616 ) then
		SetSpeakDetail( OwnerID(),  "[SC_114350_0]" ) 
		--你表現的很好！水晶再次回到能量界中。
		--雖然是暫時的，但我們可以安心一陣子了。
		--謝謝你的幫助。
	else
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_1]" ,"LuaS_114350_1", 0 ) --詢問他在這裡的原因
	if (CheckAcceptQuest( OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true ) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --詢問要怎麼幫忙
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_3]" ,"LuaS_114350_3", 0 ) --提出由自己來幫忙的建議
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --詢問自己有什麼能幫忙的
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_3]" ,"LuaS_114350_3", 0 ) --提出由自己來幫忙的建議
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == OwnerID() and ReadRoleValue(TargetID() , EM_RoleValue_Register + 1 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_13]" ,"LuaS_114350_5", 0 ) --宣告暫時放棄
	end
end

function LuaS_114350_1()
		SetSpeakDetail( OwnerID(),  "[SC_114350_4]" )
		 --這裡出現了會散發出詭異魔法能量的水晶，這些魔法能量影響了這附近的自然之力，造成環境以及生物產生混亂。
		 --我找到方法可以將水晶送至能量界中，在那裡它們無法影響我們所處得世界，但似乎有另一股力量吸引著他們來到這個世界......
		 --因此我必須守護在這裡，等待水晶重現出來的時候再次將他們壓回能量界。
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
end

function LuaS_114350_2()
		SetSpeakDetail( OwnerID(),  "[SC_114350_5]" )
		 --幫忙嗎？嗯......你是個森林牧者......好！
		 --如果被動的等待水晶出現，我壓制的時候會耗費大量精神，但如果在水晶能量尚不充沛的時候就把它們從能量界拉出來，並強迫讓他們把力量釋放掉，這樣就可以不花精神地讓它們回到能量界。
		 --而且這樣釋放出來的能量在我們的監控下也不會對周遭造成影響。
		 --
		 --方法是這樣的，這兩個水晶分別帶著不同相位的能量，只要有生物接近，這些能量就會累積在生物的體內。
		 --而這些能量有個特色，不同相位的能量接近時會互相抵銷，並且會釋放出能夠削減周遭異常波動的力量，我們就是要利用這個特徵把水晶上的異常波動能量削減至零。
		 --
		 --你和你的夥伴要做的事情就是各自攜帶一種相位的能量，並在水晶附近釋放出削減異常波動的力量。
		 --但這兩個水晶會彼此牽制影響，如果一個水晶失去了力量而另一個水晶還具有力量的話，過一段時間失去力量的水晶也會回到充滿力量的狀態，所以維持兩個水晶在短時間內同時進入失去力量的情況是很重要的。
		 --
		 --還有，注意一件事，你的身體在釋放出力量後短時間內會無法再次承受之前所承受的相同力量，如果在受到相同力量的影響，你身體不僅會受傷，還會散發出增幅的力量讓水晶獲得充能。
		 --除了這種情形以外，力量在你體內積蓄太久或是你在體內的力量尚未消失前又接受了更多同樣的力量，這都會造成相同的狀況。
		 --
		 --說明有點複雜，但你試過幾次應該就能瞭解我所說的。
		 --如果你感到有危險就先暫時離水晶遠一點，等恢復之後再繼續這個任務。
		 --不過如果超過一定的時間，水晶會對周遭開始產生永久的影響，為了避免發生這個事情，我會強制將水晶送回能量界，所以你必須儘快完成這個任務。
		if (CheckAcceptQuest(OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
		 	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --已經知道方式，開始執行任務
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then	
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --已經知道方式，開始執行任務	 
		end
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
end

function LuaS_114350_3()
		SetSpeakDetail( OwnerID(),  "[SC_114350_6]" )
		 --你知道要做的事情是什麼嗎？
 		if (CheckAcceptQuest(OwnerID() , 422862 ) == true or CheckAcceptQuest( OwnerID() , 422929 ) == true) and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 7 then
 			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --詢問要怎麼幫忙
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --已經知道方式，開始執行任務
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 0  then
 			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_2]" ,"LuaS_114350_2", 0 ) --詢問要怎麼幫忙
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_114350_7]" ,"LuaS_114350_4", 0 ) --已經知道方式，開始執行任務
		end
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
end

function LuaS_114350_4()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		CloseSpeak( OwnerID() )
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
				local ID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
				if CheckID(ID) == false or ReadRoleValue(ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(ID , EM_RoleValue_IsNPC ) == 1 then
					Say( TargetID() , "[SC_114350_12]" ) --現在水晶的能量還沒完全耗盡，我需要你的力量。
				else
					local Name = GetName( ID )
					local Str = "[SC_114350_8][$SETVAR1="..Name.."]" --目前[$VAR1]正在執行這個任務，或許你可以幫助他。
					Say( TargetID() ,  Str ) 
				end
		else
				WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , 777 )				
				Say( TargetID() ,  "[SC_114350_9]" ) --我現在立刻把水晶從能量界中引出來。
				BeginPlot( TargetID() , "LuaS_114350_Work" , 0 )
		end
	else
		local Name = GetName( ReadRoleValue( OwnerID() , EM_RoleValue_Register ) )
		local Str = "[SC_114350_8][$SETVAR1="..Name.."]" --目前[$VAR1]正在執行這個任務，或許你可以幫助他。
		SetSpeakDetail( OwnerID(),  Str )
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
	end
end

function LuaS_114350_5()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , 0 )
end

function LuaS_114350_Work()
	Addbuff( OwnerID() , 504935 , 0 , -1 )
	Addbuff( OwnerID() , 504936 , 0 , -1 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )
	local Flag = 780534
	local Tower = {}
	local Point = {}
	Tower[1] = CreateObjByFlag( 102977 , Flag , 1 , 1 )
	Tower[2] = CreateObjByFlag( 102977 , Flag , 2 , 1 )
	Point[1] = CreateObjByFlag( 112307 , Flag , 1 , 1 )
	Point[2] = CreateObjByFlag( 112307 , Flag , 2 , 1 )
	for i = 1 , 2 , 1 do
		Lua_ObjDontTouch( Point[i] ) 
		AddToPartition( Point[i] , 0 )
	end
	local Buff = { 505856 , 505857 }
	local DeBuff = {505860 , 505861 }
	local Result = 0
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	for i = 1 , 2 , 1 do
		if i == 1 then
			WriteRoleValue( Tower[i], EM_RoleValue_PID , Tower[2] )
			WriteRoleValue( Tower[i] , EM_RoleValue_Register , Buff[2] )
		else
			WriteRoleValue( Tower[i] , EM_RoleValue_PID , Tower[1] )
			WriteRoleValue( Tower[i] , EM_RoleValue_Register , Buff[1] )
		end
		SetModeEX( Tower[i] , EM_SetModeType_Move , false )
		AddToPartition( Tower[i] , 0 )
		SetPlot( Tower[i] , "dead" , "LuaI_102977_dead" , 0 )
		BeginPlot( Tower[i] , "LuaI_102977_ReBuff" , 0 )
		AddBuff( Tower[i] , Buff[i] , 9 , -1 )
		AddBuff( Tower[i] , 504113 , 0 , -1 )
		WriteRoleValue( Tower[i] , EM_RoleValue_Register+1 , Buff[i] )
		CastSpell( Point[i] , Point[i] ,493776 )
	end
	for i = 1 , 300 , 1 do
		if CheckBuff(Tower[1] , DeBuff[1]) == true and CheckBuff(Tower[2] , DeBuff[2]) == true then
			Result = 1
			break 
		end
		if ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1 ) == 0 then
			Result = 2
			break
		end
		if i > 30 then
			if CheckID(player) == false or ReadRoleValue(player , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(player , EM_RoleValue_IsNPC ) == 1 or GetDistance( OwnerID() , Player ) > 350 then
				local Check = 0
				for i = 1 , 2 , 1 do
					if 	HateListCount( Tower[i] ) > 0 then
						for i = 1 , HateListCount( Tower[i] ) , 1 do
							local ID = HateListInfo(Tower[i]  ,i-1 , EM_HateListInfoType_GItemID )
							if ReadRoleValue(ID , EM_RoleValue_IsPlayer ) == 1 then
								player = ID
								WriteRoleValue( OwnerID() , EM_RoleValue_Register ,player)
								break
							end
						end
						Check = 1
						break 
					end
				end
				if Check == 0 then
					Result = 2
					break
				end
			end
		end
		if i/10 == math.floor( i / 10 ) then
			for j = 1 , 2 , 1 do
			--	if CheckBuff(Tower[j] , Buff[j] ) == true then
					CastSpell( Tower[j] , Tower[j] , 495033 )
			--	end
			end
		end
		if i == 270 then
				Yell(  OwnerID() , "[SC_102977_TIME_LIMIT_1]" , 3 ) --請儘快，水晶對環境的影響開始增強了！
		end
		if i == 290 then
				Yell(  OwnerID() , "[SC_102977_TIME_LIMIT_2]" , 3 ) --快來不及了，我要準備開始將這些水晶壓回能量界了！
		end
		sleep(10)
	end
	Cancelbuff( OwnerID() , 504935 )
	Cancelbuff( OwnerID() , 504936 )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_END)
	if Result == 1 then
		Yell( OwnerID() ,  "[SC_114350_10]" , 3) --很好！水晶要回到能量界了！
	else
		if Result == 0 then
			Yell( OwnerID() ,  "[SC_114350_11]" , 3) --不行！不能再拖下去了！我必須立刻壓制這些水晶回到能量界！
		else
			Yell( OwnerID() ,  "[SC_114350_14]" , 3) --看來事情進行的並不順利......我馬上將水晶壓制回能量界。
		end
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_SP01 )
	end
	for i = 1 , 2 , 1 do
		CastSpell( Point[i] , Point[i] ,492668 )
		WriteRoleValue( Point[i] , EM_RoleValue_LiveTime , 3 )
	end
	for i = 1 , 2 , 1 do
		DelObj( Tower[i] )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_102977_dead()
	return false
end

function LuaI_102977_ReBuff()
	local Battle = 0
	local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			if Battle == 0 then
				Battle = 1
			end
		else
			if Battle == 1 then
				Battle = 0
				if CheckBuff( OwnerID() , Reload + 4 ) == false then
					Lua_CancelAllBuff( OwnerID() ) 
					local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
					local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
					AddBuff( OwnerID() , Reload , 9 , -1 )
				end
			end
		end
		sleep( 60 )
	end
end

function Lua_505858_Check() 
	if CheckBuff( OwnerID() , 505860 ) == false then
		if CheckBuff(TargetID() , 505858 ) == true then
			CastSpell( TargetID() , TargetID() , 495035 )
			return false
		end
		if CheckBuff(TargetID() , 505860 ) == true then
			CancelBuff( TargetID() , 505860 )
			CastSpell( TargetID() , TargetID() , 495035 )
			return true
		end
	else
		if CheckBuff(TargetID() , 505858 ) == true then
			return false
		end
		if CheckBuff(TargetID() , 505860 ) == true then
			CancelBuff( TargetID() , 505860 )
			return true
		end	
	end
	return true
end

function Lua_505859_Check() 
	if CheckBuff( OwnerID() , 505861 ) == false then
		if CheckBuff(TargetID() , 505859 ) == true then
			CastSpell( TargetID() , TargetID() , 495035 )
			return false
		end
		if CheckBuff(TargetID() , 505861 ) == true then
			CancelBuff( TargetID() , 505861 )
			CastSpell( TargetID() , TargetID() , 495035 )
			return true
		end
	else
		if CheckBuff(TargetID() , 505859 ) == true then
			return false
		end
		if CheckBuff(TargetID() , 505861 ) == true then
			CancelBuff( TargetID() , 505861 )
			return true
		end
	end
	return true
end

function Lua_505863_Check() 
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ==  102977 then
		local Buff = 0
		if CheckBuff( TargetID() , 505856 ) == true then
			Buff = 505856 
		end
		if CheckBuff( TargetID() , 505857 ) == true then
			Buff = 505857
		end
		if Buff~= 0 then
			Lua_SubtractBuff( TargetID() , Buff , 0 , 0 ) 
			if CheckBuff( TargetID() , Buff ) == false then
				local Another = ReadRoleValue( TargetID() , EM_RoleValue_PID )
				local AnotherBuff = ReadRoleValue( TargetID() , EM_RoleValue_Register )
				if CheckBuff( Another , AnotherBuff ) == false then
					local Count = HateListCount( TargetID() )
					for i = 1 , Count , 1 do
						local ID = HateListInfo(TargetID() ,i-1 , EM_HateListInfoType_GItemID )
						if CheckAcceptQuest( ID , 422862 ) == true or CheckAcceptQuest( ID , 422929 ) == true then
							SetFlag( ID , 543616 , 1 )
						end
					end
				end
				Lua_CancelAllBuff( TargetID()) 
				SetStopAttack(TargetID() )
				AddBuff( OwnerID() , 504113 , 0 , -1 )
				--SetRoleCamp( TargetID() , "Visitor" )
				AddBuff( TargetID()  , Buff + 4 , 0 , 15 )
			end
		end
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
		local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 , 102106 , 102107, 102108, 102297, 102324, 102325, 102803 }	
		for pry , obj in pairs(PetID) do
			if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == obj then
				return true
			end
		end
		return false
	end
	return true
end
function Lua_505864_Check() 
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ==  102977 then
		local Buff = 0
		if CheckBuff( TargetID() , 505856 ) == true then
			Buff = 505856 
		end
		if CheckBuff( TargetID() , 505857 ) == true then
			Buff = 505857
		end
		if Buff~= 0 then
			local BuffPos = Lua_BuffPosSearch(TargetID()  , Buff )
			local OrgLv = BuffInfo( TargetID() , BuffPos , EM_BuffInfoType_Power ) + 1
			if OrgLv < 10 then
				AddBuff(TargetID() , Buff , 0 , -1 )
			end
		end
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
		local PetID = {100944 , 100945 , 101524 , 101525 , 101526 , 101527 , 101686 , 102104 , 102105 , 102106 , 102107, 102108, 102297, 102324, 102325, 102803 }	
		for pry , obj in pairs(PetID) do
			if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == obj then
				return true
			end
		end
		return false
	end
	return true
end
function Lua_505862_Check()
	local BuffSelf , BuffTarget = 0 , 0 
	if CheckBuff( OwnerID() , 505858 ) == true then
		BuffSelf = 505858
		BuffTarget = 505859
	end
	if CheckBuff( OwnerID() , 505859 ) == true then
		BuffSelf = 505859
		BuffTarget = 505858
	end
	if BuffSelf ~= 0 and BuffTarget ~= 0 then
		if CheckBuff( TargetID() , BuffSelf ) == true and TargetID() ~= OwnerID() then
			CancelBuff_NoEvent( OwnerID() , BuffSelf )
			CancelBuff_NoEvent( TargetID() , BuffSelf )
			CastSpell( OwnerID() , OwnerID() , 495035 )
			AddBuff( OwnerID() , BuffSelf + 2 , 0 , 15 )
			AddBuff( TargetID() , BuffSelf + 2 , 0 , 15 )
		end
		if CheckBuff( TargetID() , BuffTarget ) == true and TargetID() ~= OwnerID() then
			CancelBuff_NoEvent( OwnerID() , BuffSelf )
			CancelBuff_NoEvent( TargetID() , BuffTarget )
			CastSpell( OwnerID() , OwnerID() , 495036 )
			AddBuff( OwnerID() , BuffSelf + 2 , 0 , 15 )
			AddBuff( TargetID() , BuffTarget + 2 , 0 , 15 )
		end	
	end
end

function Lua_505896_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102977 then
		return true
	else
		return false
	end
end

function Lua_505896_Use()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102977 then
		Lua_CancelAllBuff( OwnerID() ) 
		AddBuff( OwnerID() , 504113 , 0 , -1 )
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		local Reload = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
		AddBuff( OwnerID() , Reload , 9 , -1 )
--		SetRoleCamp( OwnerID() , "Wagon" )
	end
end

function Lua_114350_TEST_CMD()
	CastSpell( OwnerID() , OwnerID() , 495036 )
end