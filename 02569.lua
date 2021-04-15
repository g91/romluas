--技能

function Lua_na_11xmas_warmbuff()  --溫暖守護BUFF
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local Player = ReadRoleValue( T_ID , EM_RoleValue_IsPlayer )

	if Player == 1 then
		local Count = BuffCount ( T_ID )		-- 讀取玩家身上的所有法術數量
		for i = 0 , Count do
			local BuffID = BuffInfo ( T_ID , i , EM_BuffInfoType_BuffID )		-- 讀取玩家身上的法術ID
			if BuffID == 621897 then
				local BuffLv = BuffInfo (  T_ID , i , EM_BuffInfoType_Power )
				if BuffLv >= 2 then
					CancelBuff( T_ID , 621897 )
					AddBuff ( T_ID , 621897 , BuffLv - 1 , 120 )
				elseif BuffLv == 1 then
					CancelBuff( T_ID , 621897 )
					AddBuff ( T_ID ,621897 , 0 , -1 )
				else
					CancelBuff( T_ID , 621897 )	
				end	
				break
			end
		end
		return true 
	else
		return false
	end				
end


function Lua_na_11xmas_coldbuff() --寒冷值
	local O_ID = OwnerID()
	while true do  --活動結束之前， 每3秒施放一次寒冷BUFF 
		SysCastSpellLv( O_ID , O_ID , 498902, 0 )
	--	say( O_ID , " COLD")
		sleep(30)
	end
end



function Lua_na_11xmas_saintfire_CHECK()  --檢查對象是否可以傳遞聖焰
	local Owner = OwnerID()
	local Target = TargetID()

	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1  then  -- 目標是玩家
		if CheckBuff( Target , 621727 ) == true then --如果目標玩家身上有"殘留的聖焰"，BUFF持續時間內無法成為使者
			ScriptMessage( Owner, Owner ,  1 , "[SC_2011XMAS_04]" , 0) --目標對象身上有殘留的聖焰，暫時無法接替成為使者
			ScriptMessage( Owner , Owner ,  0 , "[SC_2011XMAS_04]" , 0) --目標對象身上有殘留的聖焰，暫時無法接替成為使者	
			return false
		elseif Owner ~= Target and CheckBuff ( Target , 621731) == true and  CheckBuff ( Target , 621715) == false then --如果目標玩家擁有燃火的技能或是目標為BOSS
			return true
			
		else --其他不可考的情況
			ScriptMessage( Owner, Owner ,  1 ,"[ SC_204425_1]" , 0 ) --目標不正確
			return false
		end
	elseif ReadRoleValue( Target , EM_RoleValue_OrgID ) == 106539 then
		return true
	else
		return false
	end
end


function Lua_na_11xmas_saintfire_CHECK1()  --檢查對象是否可以傳遞聖焰
	local Owner = OwnerID()
	local Target = TargetID()

	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1  then -- 目標是玩家
		return true
	else
		return false
	end
end
--
--
--
function Lua_na_11xmas_saintfire_CHECK2()  --檢查對象是否為Boss
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ==106539 then --如果目標是王
		return true
	else --其他不可考的情況
		return false
	end
end


		
function Lua_na_11xmas_saintfire_change()  --聖焰傳遞
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local O_score = ReadRoleValue( O_ID , EM_RoleValue_Register2 )
	local T_score = ReadRoleValue( T_ID , EM_RoleValue_Register2 )
--	CastSpell(  O_ID  , T_ID  , 498909 ) --對目標施放聖焰傳遞的技能
	AddBuff(  O_ID  , 621731 , 0 , -1 ) --得到燃火BUFF，擠掉聖焰使者
	AddBuff(  O_ID  , 621727, 0 , 90) --得到殘留的聖焰

	local CountHateList_Mob = HateListCount(StormMan)
	local HatePos_Scout = -1	
	for j=0 , CountHateList_Mob-1 do
		if HateListInfo( StormMan , j , EM_HateListInfoType_GItemID ) == O_ID then
			HateValue1 = HateListInfo( StormMan , j , EM_HateListInfoType_HatePoint)
			HatePos_Scout = j			
		end	
	end
	if ( HatePos_Scout > -1 ) then	--若是設定仇恨值目標不存在	
		SetHateListPoint( StormMan , HatePos_Scout , 0 )
	end

	AddBuff ( T_ID , 621729 , 0 , 60) --給予目標聖焰
	AddRoleValue( T_ID , EM_RoleValue_Register2 , 10 )
	local newscore = ReadRoleValue ( T_ID, EM_RoleValue_Register2)
	CancelBuff( T_ID , 621897 ) --刪除目標身上的寒冷值
--	local StormMan = LuaFunc_SearchNPCbyOrgID( O_ID , 106539  ,1400 , 0 )
	SysCastSpellLv( T_ID , StormMan , 498905 , 1 )
	SetAttack( StormMan , T_ID )
end


function Lua_na_11xmas_saintfire_attack()  --對雪人施放嘲諷	
	local O_ID = OwnerID() --前任聖焰使者
	local T_ID = TargetID() --接任的聖焰使者
--	local StormMan = LuaFunc_SearchNPCbyOrgID( O_ID , 106539  ,1400 , 0 )
	CastSpell( T_ID , StormMan , 498905 )
end


--玩家使用點火技能
function Lua_na_11xmas_fire_check()--燃火技能檢查目標
	local Owner = OwnerID()
	local Target = TargetID()
	local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local wood =  120083--木材堆
	local Boss = 106539

	if OrgID == wood then -- 若目標為乾燥的木材堆: 執行法術
		return true
	elseif ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==1 and CheckBuff ( Target , 621715) ==true then --點擊對象是玩家，且身上有冰凍的狀態
		if Target == Owner then
			ScriptMessage( Owner , Owner  ,  1 , "[SC_2011XMAS_15]" , C_SYSTEM )  --此技能無法對自己使用！
			ScriptMessage( Owner , Owner , 0 , "[SC_2011XMAS_15]" , 0 ) --此技能無法對自己使用！	
		else
			CancelBuff( Target , 621715) --刪除冷凍狀態
			AddRoleValue ( Owner , EM_RoleValue_Register2, 10 ) -- 1幫助目標對象解凍，在玩家身上記分數+10
		end
		return false
	elseif OrgID == Boss then --如果目標是暴風雪人
		ScriptMessage( Owner , Owner  ,  1 , "[SC_204425_1]" , C_SYSTEM ) --目標不正確
		ScriptMessage( Owner , Owner , 0 , "[SC_204425_1]" , 0 )	--目標不正確
		return false
	elseif Target == Owner then
		ScriptMessage( Owner , Owner  ,  1 , "[SC_2011XMAS_15]" , C_SYSTEM )  --此技能無法對自己使用！
		ScriptMessage( Owner , Owner , 0 , "[SC_2011XMAS_15]" , 0 ) --此技能無法對自己使用！
		return false	
	end

end



function Lua_na_11xmas_fire()-- 燃火
	local Owner = OwnerID()
	local Target = TargetID()
	local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
	sleep(10)
	ChangeObjID( Target , 120084 )  -- 轉換成有火的狀態	
	AddRoleValue ( Owner , EM_RoleValue_Register2, 5 ) -- 在玩家身上記分數+5
	local newscore = ReadRoleValue ( Owner  , EM_RoleValue_Register2 ) --最新分數
--	say( Owner, newscore)
end



----小火堆對王的傷害判斷
function Lua_na_11xmas_checkboss()  --檢查目標是否為王
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local OrgID = ReadRoleValue( T_ID , EM_RoleValue_OrgID )
	if OrgID  == 106539 then --如果目標是王
		if CheckBuff( T_ID , 621724 ) == true then --如果王身上有暴雪護盾
			BeginPlot ( O_ID , "Lua_na_11xmas_delfire", 0 ) --刪除火堆
			CancelBuff( T_ID , 621724 )  --刪除護盾
			return false --不予以傷害
		else --沒有護盾
			BeginPlot ( O_ID , "Lua_na_11xmas_delfire" , 0 ) --刪除火堆
			return true --給予傷害
		end
	else
		return false --非玩家，不予以傷害
	end				
end


function Lua_na_11xmas_delfire()  --對王造成傷害之後隱藏，轉換成無火的狀態再次顯示
	local Owner = OwnerID()
--	Hide( Owner)
	SetDefIdleMotion( Owner , 242 ) 	
	Hide( Owner)
	sleep(300)
	ChangeObjID( Owner , 120083 )  -- 轉換成有火的狀態
	Show( Owner , 0)			
end

-----

function Lua_na_11xmas_checkcold() --能夠疊加到19層
	local Owner = OwnerID()
	local Target = TargetID()
 	local Count = BuffCount ( Target )		-- 讀取玩家身上的所有法術數量
--	Say( Target , "Hello")
	if CheckBuff ( Target , 621713 ) == true then --溫暖守護
		return false	
	else
		return true
	end				
end


function Lua_na_11xmas_checkcold1() --能夠疊加到19層
	local Owner = OwnerID()
	local Target = TargetID()
 	local Count = BuffCount ( Target) -- 讀取玩家身上的所有法術數量
	if  CheckBuff( Target , 621715) == true or CheckBuff( Target , 621729) == true then --如果有冰凍、聖焰使者，不執行疊加寒冷值
		return false
	elseif CheckBuff( Target , 621897 ) == true then 
		for i = 0 , Count do
			local BuffID = BuffInfo (  Target , i , EM_BuffInfoType_BuffID )	--讀取玩家身上的法術ID
			if BuffID == 621897 then
				local BuffLv = BuffInfo ( Target, i , EM_BuffInfoType_Power )
				if BuffLv < 18 then 			
					AddBuff( Target , 621897 , 0 , 120 )
				elseif  BuffLv ==18 then
					CancelBuff( Target, 621897)
					AddBuff( Target , 621715 , 0 ,10 ) --0為1層，2為2層
				end
			end
		end
	else
		AddBuff( Target , 621897 , 0 , 120 )
	end				
end

--function Lua_na_11xmas_checkcold2() -- 施放冰凍BUFF前的檢查
--	local T_ID = TargetID()
--	local Count = BuffCount ( T_ID )		-- 讀取玩家身上的所有法術數量
--	if CheckBuff (T_ID , 621713 ) == true then
--		return false
--	else
--		for i = 0 , Count do
--			local BuffID = BuffInfo (  T_ID , i , EM_BuffInfoType_BuffID )		-- 讀取玩家身上的法術ID
--			if BuffID == 621897 then
--				local BuffLv = BuffInfo (  T_ID , i , EM_BuffInfoType_Power )
--				if BuffLv <19  then 		
--					return false
--				elseif  BuffLv ==19 then
--					CancelBuff( T_ID , 621897 )
--					return true
--				end
--			elseif BuffID == 621715 or BuffID == 621729 then --如果有冰凍、聖焰使者、溫暖守護，不會觸發冰凍
--				return false
--			end
--		end
--	end				
--end
--


function Lua_na_11xmas_clearReg()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
--	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register2 )
--	Say( Owner , "Reg = "..Reg )
end


----------------
--暴風雪人初始劇情
--冰霜王的劇情
function Lua_na_stormborn() --暴風雪人，一般攻擊無效
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_na_storm_attack",0)
end

function Lua_na_storm_attack()
	local Owner = OwnerID()

	while true do
	local attack = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local random= Rand(15)
	local NowHP = ReadRoleValue( Owner , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then
			local ran1 = Rand(3)
			if ran1 < 1 then
				say( Owner, "[SC_STORMSPEAK_02]") --火光！我要撲滅它！！
			end
			if  X > 50 then
				PlayMotion( Owner, 31 )
				sleep(20)
				CastSpell( Owner, Owner, 498970) --撲滅火花
				sleep(50)

			elseif X <=50 and X >=30 then
				if random <5 then --5/15
					local ran2 = Rand(3)
					if ran2 <=1 then
						say( Owner, "[SC_STORMSPEAK_02]") --火光！我要撲滅它！！
					end
					PlayMotion( Owner, 31 )
					sleep(20)
					CastSpell( Owner , Owner, 498970) --撲滅火花
					sleep(50)
				else	
					PlayMotion( Owner , 31 )
					sleep(20)
					say( Owner , "[SC_STORMSPEAK_01]") --冰凍氣息讓我更堅強！！！
					CastSpell( Owner, Owner, 498969) --暴雪護盾
					sleep(50)
				end
			elseif X < 30 then --當雪人的血量低於30%
				if random <=2 then -- 2/15
					Say( Owner , "[SC_STORMSPEAK_03]" ) --好熱......好熱呀！我需要一些冷空氣！
					PlayMotion(  Owner , 60)
					CastSpell( Owner, Owner , 498972) --冷氣環繞

				elseif random >3 and random <10 then -- 8/15
					say( Owner , "[SC_STORMSPEAK_04]") -- 滑溜溜！結冰的地面滑溜溜！
					PlayMotion( Owner , 51 )
					sleep(20)
					CastSpell( Owner , Owner, 498971) --腳底滑溜溜
					sleep(50)
				else
					PlayMotion( Owner , 31 )
					sleep(20)
					say( Owner , "[SC_STORMSPEAK_01]") --冰凍氣息讓我更堅強！！！
					CastSpell(  Owner , Owner , 498969) --暴雪護盾
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end


function Lua_na_Fireskill() --暴風雪人的技能
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_OrgID) == 120084 then
		BeginPlot( Target ,"Lua_na_11xmas_delfire" , 0 )
	end
end