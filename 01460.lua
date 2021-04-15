------------------------------------------------------------- 森林牧者 傷害移轉
function lua_Dy_ChangeHert()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp ) --抓最後的傷害
	local TransDamage = (LastDamage/ (1-(0.30)) )*(0.30)
	local TD = math.floor(abs(TransDamage))		
	SysCastSpellLv(OwnerID() , Mypet , 493417 , TD )
	--say (OwnerID(), "B")
end
---------------------------------------------------------------------------------------------------- 森林牧者 傷害移轉免點寵
function lua_Dy_ChangeHert_NoClick()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503637 , 0 , 10 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
------------------------------------------------------------森林牧者 靈魂衝擊 
function lua_Dy_SoulAtk_PetCheck()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	 ------抓寵物ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP )	 ------抓寵物HP上限
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) 	-----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100	
	if CheckID( MyPet ) == true then 	
		if HPPercent < 30 or HPPercent == 30 then	--HP百分比小於30%時回傳錯誤
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "1")
			return false
		end
		--say (OwnerID(), "2")
		return true
	elseif CheckID( MyPet ) == false then 	--沒有寵物ID時回傳錯誤
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say (OwnerID(), "3")
		return false 
	end
end
function lua_Dy_SoulAtk()	--法術發動成功時扣血用
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.3))
	if HPPercent > 30 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			--say (OwnerID(), "A")
			return true
	elseif HPPercent < 30 or HPPercent == 30 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end
------------------------------------------------------------森法LV35 靈魂衝擊-20%HP 
function lua_Dy_SoulAtk_PetCheck_2()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	 ------抓寵物ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP )	 ------抓寵物HP上限
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) 	-----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100	
	if CheckID( MyPet ) == true then 	
		if HPPercent < 20 or HPPercent == 20 then	--HP百分比小於30%時回傳錯誤
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "1")
			return false
		end
		--say (OwnerID(), "2")
		return true
	elseif CheckID( MyPet ) == false then 	--沒有寵物ID時回傳錯誤
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say (OwnerID(), "3")
		return false 
	end
end
function lua_Dy_SoulAtk_2()	--法術發動成功時扣血用
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local MyPetMaxHp = ReadRoleValue ( MyPet, EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyPetHp = ReadRoleValue ( MyPet, EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100
	local HP = math.floor(abs(MyPetMaxHp*0.2))
	if HPPercent > 20 then 
			WriteRoleValue ( MyPet , EM_RoleValue_HP, MyPetHp-HP)
			--say (OwnerID(), MyPetHp-HP)
			return true
	elseif HPPercent < 20 or HPPercent == 20 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_6]" , 1 )
			--say (OwnerID(), "B")
			return false
		end
end
---------------------------------------------------------森林牧者 行動制約
function lua_Dy_Actionstop()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503943 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )		 -------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+5 )
	SysCastSpellLv( BuffOwner, OwnerID(), 493418 , PLevel ) 		 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 503943)
end
-----------------------------------------------------------------------------------------------------------------------------森林牧者 精靈的引導 寵物打回自己SP 
function lua_Dy_Elfintro2()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+24 ) --抓主人職業列表的等級
	if CheckBuff( OwnerID() , 503643 ) == true then
		AddBuff( Master ,503651 , PLevel, 1 )
		end
end
----------------------------------------------------------------森牧 精靈的引導免點寵劇情
function lua_Dy_Elfintro_NoClick()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+24 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503643 , 0 , 15 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
---------------------------------------------------------森林牧者 棘刺藤蔓
function lua_Dy_rattan()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503962 ) 	---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID ) 	-------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power ) 	-------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+3 )
	SysCastSpellLv( BuffOwner , OwnerID() , 493415 , PLevel ) 	----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
end
function lua_Dy_rattan_4()
	--say (TargetID() , "1")
	CancelBuff(TargetID() , 503962)
	CancelBuff(TargetID() , 503634)
end

----------------------------------------------------------------森林牧者 Buff自己 KillPet
--function lua_Dy_GoodByeMyPet_1()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102297 then
--			if CheckBuff( OwnerID() , 620682) == true then --檢查自己有無橡樹之靈被動
--				CancelBuff_NoEvent( OwnerID(), 620682 )
--			end
--			DelObj ( MyPet ) ---刪除寵物
--			return true
--		elseif MypetID ~= 102297 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
--function lua_Dy_GoodByeMyPet_2()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102324 then
--			if CheckBuff(OwnerID() , 620678) == true then
--				CancelBuff(OwnerID() , 620678) --檢查有無橡樹行者被動
--			elseif CheckBuff(OwnerID() , 620709) == true then
--				CancelBuff(OwnerID() , 620709) --檢查自己有無橡樹行者35被動
--			end
--			DelObj ( MyPet ) ---刪除寵物
--			return true
--		elseif MypetID ~= 102324 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
--function lua_Dy_GoodByeMyPet_3()
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
--	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
--		return false
--	end
--	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
--	if CheckID( Mypet ) == true then 
--		if MypetID == 102325 then
--			DelObj ( MyPet ) ---刪除寵物
--			return true
--		elseif MypetID ~= 102325 then
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_10]" , 1 )
			--say ( Mypet , "11")
--			return false
--		end
--	end
--end
-----------------------------------------------------------------------森林牧者 晶體爆裂
function lua_Dy_crystalburst()
	--say ( OwnerID(), "bye")
	DelObj ( OwnerID() )
end	
function lua_Dy_crystalburstcheck(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 	--抓主人ID
	local MyPetMaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) 	------抓寵物HP上限
	local MyPetHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) 		-----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100 --HP/MAXHP 的百分比
	if HPPercent < 10  then						--HP百分比小於10%時回傳錯誤
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_6]" , 1 )
		--say (OwnerID(), "B")
		return false
	elseif HPPercent == 10 or HPPercent > 10 then
		if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
			local Petrange = GetDistance( OwnerID(), TargetID() )
			if Petrange < Skillrange or Petrange == Skillrange  then
				--say ( OwnerID(), "True")
				return true
			elseif Petrange > Skillrange then
				ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
				--say ( OwnerID(), "nooooooo")
				return false
			end
		else
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
			return false
		end
	end
end
function lua_Dy_crystalburst_00(Condition)--法術發動成功時扣血用
	--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*1.1))
	if Condition == 0 or Condition == 1 or  Condition == 2  or Condition == 10 then
			KillId( OwnerID() , OwnerID() )
			--WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
			--say (OwnerID() , HP)
	end
end

function lua_Dy_crystalbuffup()
	AddBuff( OwnerID() ,504597 ,0 ,15 )
	return true
end
-----------------------------------------------------------------森林牧者 PET攻擊過遠喊話　無自動循環之技能才能用
function lua_Dy_SoFarAwayForEnemy(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
		local Petrange = GetDistance( OwnerID(), TargetID() )
		if Petrange < Skillrange or Petrange == Skillrange  then
			--say ( OwnerID(), "True")
			return true
		elseif Petrange > Skillrange then
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
			--say ( OwnerID(), "nooooooo")
			return false
		end
	else
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
		return false
	end	
end
-----------------------------------------------------------------森林牧者 PET攻擊過遠喊話 -- 友方目標用
function lua_Dy_SoFarAwayForParty(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == false then
		local Petrange = GetDistance( OwnerID(), TargetID() )
		if Petrange < Skillrange or Petrange == Skillrange  then
			--say ( OwnerID(), "True")
			return true
		elseif Petrange > Skillrange then
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
			--say ( OwnerID(), "nooooooo")
			return false
		end
	else
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
		return false
	end	
end
----------------------------------------------------------------------森林牧者 招回寵物
function lua_Dy_PetBackCheck()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
function lua_Dy_PetBack()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	DelObj ( MyPet ) ---刪除寵物
	if CheckBuff( OwnerID() , 620682) == true then --檢查自己有無橡樹之靈被動
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --檢查自己有無橡樹行者被動
		CancelBuff(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --檢查自己有無橡樹行者森法35被動
		CancelBuff(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --檢查自己有無自然晶體被動
		CancelBuff( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499 ) == true then --檢查自己有無森遊人馬被動
		CancelBuff( OwnerID(), 500499 )
	end
end

function lua_Dy_Petcheckbuff(Master)  --刪除前一隻寵物的被動效果
	if CheckBuff( Master , 620682) == true then --檢查自己有無橡樹之靈被動
		CancelBuff_NoEvent( Master, 620682 )
	elseif CheckBuff( Master , 620678) == true then --檢查自己有無橡樹行者被動
		CancelBuff(Master,620678)
	elseif CheckBuff( Master , 620709) == true then --檢查自己有無橡樹行者森法35被動
		CancelBuff(Master,620709)
	elseif CheckBuff( Master, 503948 ) == true then --檢查自己有無自然晶體被動
		CancelBuff( Master, 503948 )
	elseif CheckBuff( Master, 500499 ) == true then --檢查自己有無森遊人馬被動
		CancelBuff( Master, 500499 )
	end
end
-------------------------------------------------------------------------------森林牧者　肌力爆發自動放寵物
function lua_Dy_MadMyPet()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 503641 , PLevel, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
---------------------------------------------------------------------------------------------森牧 共用的檢查有無寵物與距離150內
function lua_Dy_PetNearU_Check() 
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local Range = GetDistance( OwnerID(), MyPet )
	if Range < 300 or Range == 300 then
		if CheckID( MyPet ) == true then
			--say (OwnerID(), "havepetnearyou")
			return true
		elseif CheckID( MyPet ) == false then
			--say (OwnerID(), "Nooooooo")
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
			return false
		end
	elseif Range > 300 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_11]" , 1 )
		--say (OwnerID(), "havenottpet")
		return false
		
	end
end
---------------------------------------------------------------------------------------------------------------------- 森戰20 猛獸斬上寵物
function lua_Dy_ViolentPet()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+28)
	if CheckBuff( MyPet , 504843) == true then ------------檢查有無冷卻時間的Buff
		return false
	else
		AddBuff( MyPet ,504564 , PLevel, 10 )
		return true
	end
end
function lua_Dy_Hitweak()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+43)
	if CheckBuff( OwnerID() , 504715) == true then ------------檢查有無冷卻時間的Buff
		return false
	else
		AddBuff( MyPet ,504569 , PLevel, 15) ---阿龐修改秒數--原本10秒
		AddBuff( OwnerID() ,504569 , PLevel, 15) ---阿龐修改秒數--原本10秒
		--say (OwnerID() , "1")
	end
end

-----------------------------------------------------------------------------森法25 碎石擊
function lua_Dy_RockHitMana()
	local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+45 ) ---------填資料表的時候記得把LV位置填上去
	local MAXMP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxMP )
	--say(OwnerID() , PLevel)
	if MP >= 5+(2.4*1*PLevel)  then
		AddRoleValue( OwnerID() , EM_RoleValue_MP , -1*(5+(2.4*PLevel)) )
		--say (OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_MP ))
		return true
	elseif MP < 5+(2.4*PLevel)  then
		--say (OwnerID() , "NOMP") 
		return false
	end
end
-----------------------------------------------------------------------------森法25 風斬
function lua_Dy_WindHitMana()
	local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+51 ) ---------填資料表的時候記得把LV位置填上去
	local MAXMP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxMP )
	--say(OwnerID() , PLevel)
	if MP >= (20*0.1*PLevel)+22+(1*PLevel)  then
		AddRoleValue( OwnerID() , EM_RoleValue_MP , -1*(2+(1*PLevel)) )
		--say (OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_MP ))
		return true
	elseif MP < (20*0.1*PLevel)+22+(1*PLevel)  then
		--say (OwnerID() , "NOMP") 
		return false
	end
end
-------------------------------------------------------------------------戰森25 生物學識
function lua_Dy_BiologyFortrue()
	if ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 4 or ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 6 then
		return true
	else 
		return false
	end
end
function lua_Dy_BiologyForfalse()
	if ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 4 or ReadRoleValue ( TargetID() , EM_RoleValue_RACE ) == 6 then
		return false
	else 
		return true
	end
end
-------------------------------------------------------------------------------------棘刺藤蔓(森林牧者)
function star_skill_RattanCheck()
	AddBuff( OwnerID() , 503962 , 0 , -1 )
end

function star_skill_rattan()
	local RattanBuff = 503628
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 7 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 5 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+3 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 3 then	
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+6 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 493415 , PLV+9 )
					end
				end
			end	
		end
	end	
end
-------------------------------------------------------------------------------------森影20 棘刺藤蔓
function lua_Dy_skill_RattanCheck()
	AddBuff( OwnerID() , 504609 , 0 , -1 )
end

function lua_Dy_skill_rattan()
	local RattanBuff = 503628
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , RattanBuff ) == true then
			local Count = BuffCount(ID)				
			for BuffPos=0 , Count-1 do
				--local BuffPos = Lua_BuffPosSearch( ID , RattanBuff )			
				if BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() 
					and BuffInfo(ID , BuffPos , EM_BuffInfoType_BuffID ) == RattanBuff then
					local PLV = BuffInfo( ID , BuffPos , EM_BuffInfoType_Power )	
					--say(OwnerID() , PLV)
					if BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 7 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 5 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+3 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 3 then	
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+6 )
					elseif BuffInfo(ID , BuffPos , EM_BuffInfoType_Time ) == 1 then
						SysCastSpellLv( OwnerID() , ID , 494205 , PLV+9 )
						SysCastSpellLv( OwnerID() , OwnerID() , 494206 , PLV )
					end
				end
			end	
		end
	end	
end
------------------------------------------------------------------------------------------------------------森牧召喚寵物 檢查用 森遊快速召喚用 森遊50使用後不可招寵物用 0727新增70套裝技能協定契約
--function lua_Dy_PetHelpCheck_01()
--	if CheckBuff( OwnerID() , 503946) == true or CheckBuff( OwnerID() , 503953 ) == true then ---已把寵物吃了
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 504892) == true then -----森戰35生命共鳴使用後無法召喚橡樹之靈
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----森遊50使用後無法召喚所有寵物
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() , 503946) == false 
	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---沒吃男樹+森遊快速召喚(刪除) + 套裝技能被動協定契約
--			AddBuff( OwnerID() ,504566 ,0 , 3) --原服從契約的效果，協定契約續用
--			ReCalculate(OwnerID() )
			--CancelBuff(OwnerID() , 504515)
			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503946) == false and CheckBuff( OwnerID() , 506461) == true then ---沒吃男樹+套裝技能寵物大師-50%施法速度
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add 施法減短的實際效果
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503946) == false then ---還沒吃男樹
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end		
--function lua_Dy_PetHelpCheck_02()
--	if CheckBuff( OwnerID() , 503580) == true then ---已把寵物吃了
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----森遊50使用後無法召喚所有寵物
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() , 503580) == false 
--	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---沒吃女樹+森遊快速召喚(刪除) + 套裝技能被動協定契約
--			AddBuff( OwnerID() ,504566 ,0 , 3)--原服從契約的效果，協定契約續用
--			ReCalculate(OwnerID() )
--			--CancelBuff(OwnerID() , 504515)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503580) == false and CheckBuff( OwnerID() , 506461) == true then ---沒吃女樹+套裝技能寵物大師-50%施法速度
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add 施法減短的實際效果
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503580) == false then --還沒吃女樹
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end	
--function lua_Dy_PetHelpCheck_03()
--	if CheckBuff( OwnerID() , 503581) == true then ---已把寵物吃了
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_13]" , 1 )
--		return false
--	elseif CheckBuff( OwnerID() , 506229) == true then -----森法40使用後無法召喚自然晶體
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM40")
--		return false
--	elseif CheckBuff( OwnerID() , 505748) == true then -----森遊50使用後無法召喚所有寵物
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif CheckBuff( OwnerID() ,503581) == false 
--	--and CheckBuff( OwnerID() , 504515) == true 
--	and CheckBuff (OwnerID() , 620951) == true then ---沒吃晶體+森遊快速召喚(刪除) + 套裝技能被動協定契約
--			AddBuff( OwnerID() ,504566 ,0 , 3) --原服從契約的效果，協定契約續用
--			ReCalculate(OwnerID() )
--			--CancelBuff(OwnerID() , 504515)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503581) == false and CheckBuff( OwnerID() , 506461) == true then ---沒吃晶體+套裝技能寵物大師-50%施法速度
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add 施法減短的實際效果
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 503581) == false then ---還沒吃晶體
--		--say (OwnerID(), "NOsubmit")
--		return true
--	end
--end	
--function lua_Dy_PetHelpCheck_04()
--	if CheckBuff( OwnerID() , 505748) == true then -----森遊50使用後無法召喚所有寵物
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_15]" , 1 )
--		--say (OwnerID(), "WM50")
--		return false
--	elseif --CheckBuff( OwnerID() , 504515) == true and
--	CheckBuff( OwnerID() , 620951) == true then ----快速召喚(刪除) + 套裝技能被動協定契約
--		AddBuff( OwnerID() ,504566 ,0 , 3) --原服從契約的效果，協定契約續用
--		ReCalculate(OwnerID() )
--		--CancelBuff(OwnerID() , 504515)
--		--say (OwnerID(), "submit")
--		return true
--	elseif CheckBuff( OwnerID() , 506461) == true then ---套裝技能寵物大師-50%施法速度
--			AddBuff( OwnerID() ,506517 ,0 , 1) ------add 施法減短的實際效果
--			ReCalculate(OwnerID() )
--			CancelBuff(OwnerID() , 506517)
--			--say (OwnerID(), "submit")
--		return true
--	else
--		--say (OwnerID(), "NOsubmit") --身上不論有無存在其他寵物的強化力量也可以召喚出人馬20100614
--		return true
--	end
--end
-------------------------------------------------------------------------遊森25 匿蹤暗箭
function lua_Dy_DarkShooter()
	if CheckBuff( OwnerID() , 504588) == true then
		AddBuff( OwnerID() ,504721 ,0 , 1)
			ReCalculate(OwnerID() )
			CancelBuff(OwnerID() , 504588)
			--say (OwnerID(), "submit")
			return true
	elseif CheckBuff( OwnerID() , 504588) == false then
		--say (OwnerID(), "NOsubmit")
		return true
	end
end	
function lua_Dy_DarkShooter_Del()
	CancelBuff(OwnerID() , 504588)
end
-----------------------------------------------------------------------------------------------影森 Lv20藏匿大師
function lua_Dy_HideMaster()
CancelBuff( OwnerID(), 504553 )
	-- 2013.06.20 阿浩:修改觸法法術，Buff結束時，施放法術集合(494343)，回傳當前持有的Buff清單至後台。
	BeginPlot( OwnerID() ,  "Hao_500675_Disappear_BuffList" , 0 )
	--
end
-------------------------------------------------------------------------------------森戰LV30 羈絆
function star_skill_WW30()		-------森戰30級羈絆
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local PLevel = ReadRoleValue( MasterGID , EM_RoleValue_MagicPowerLv_SP+30 )
	AddBuff( MasterGID , 504604 , PLevel , -1 )
	AddBuff( MasterGID , 504892 , 0 , -1 )
end
---------------------------------------------森影LV40 爆擊共感
function lua_Dy_CRIWithPet()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	if CheckBuff( Master , 505206)  == true then
		--say (OwnerID(), "no")
		return false
	else
		SysCastSpellLv	( Master, Master, 494600 , 0)
		AddBuff( Master ,505206, 0, 45 )
		--say (OwnerID(), "CRI")
	end
end
---------------------------------------------森神LV35 自然泉源
function lua_Dy_Mana1PWithPet()
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	if CheckBuff( Master , 505205)  == true then
		return false
	else 
		SysCastSpellLv(Master, Master, 494606 , 0 )
		AddBuff( Master , 505205 , 0, 20 )
		--say (OwnerID(), "CRI")
		return true	
	end
end

--------------------------------------------------------------------------遊森40 隱藏氣息 匿蹤暗箭傷害+20%	
function lua_Dy_HideBreath()		
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505193)  == true then
			AddBuff( OwnerID() , 505194, 0 , 3)
			CancelBuff(OwnerID() , 505193)
			return true
		else
			return true
		end
	else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end
------------------------------------------------影森 Lv40 木靈掌握
function lua_Dy_HoldWoodSpirit()
	AddBuff( OwnerID() ,505172 , 0, 1 )
End

----------------------------------------------------------------------森遊50 
--function lua_Dy_PetByeWS50() 
--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
--	if ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then ----------------寵物死亡時
		--say (OwnerID(), "dead")
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
--		return false
--	elseif CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
--			DelObj ( MyPet )
--			return true
--	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
--		return false
--	end
--end
------------------------------------------------------------------------------------------------------------------------------------------------遊森50	-- 0731--阿龐新增一個內建CD與判斷
function lua_Dy_SW50CRI(Condition)	
	if Condition == 2 and CheckBuff( OwnerID() , 505715) == false then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+9 )
		AddBuff( TargetID() , 505681 , PLevel , 15)
		AddBuff( OwnerID() , 505715 , 0 , 45)
	end
end
----------------------------------------------------------------------------------------------------------------森遊45 寵物技能+主人與自己攻擊強度8%
function lua_Dy_WS45ATKPLUS()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )---抓主人ID
	--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+43)
	if CheckBuff( OwnerID() , 505746) or CheckBuff( Master , 505746) == true then ------------檢查有無冷卻時間的Buff
		--say (OwnerID() , "0")
		return false
	else
		AddBuff( Master ,505745 , 0, 15 )
		AddBuff( OwnerID() ,505745 , 0, 15 )
		--say (OwnerID() , "1")
	end
end
--------------------------------------------------------------------------------------影森45 傷口掩飾
function lua_Dy_HideHeart()
local MP = ReadRoleValue( OwnerID(), EM_RoleValue_MP )
if CheckBuff( OwnerID() , 505731 ) == true then
	return false
elseif CheckBuff( OwnerID() , 505731 ) == false then
	AddBuff( OwnerID()  , 505731 , 0 , 30)
	--say (OwnerID() , "001")
	return true
	end
end
------------------------------------------------------------森法50 晶體強化
function lua_Dy_crystalburstcheck_02(Skillrange)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 	--抓主人ID
	local MyPetMaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) 	------抓寵物HP上限
	local MyPetHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) 		-----抓寵物HP
	local HPPercent =( MyPetHp / MyPetMaxHp)*100 --HP/MAXHP 的百分比
	if HPPercent < 20  then						--HP百分比小於20%時回傳錯誤
		ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_6]" , 1 )
		--say (OwnerID(), "B")
		return false
	elseif HPPercent == 20 or HPPercent > 20 then
		if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable  ) == true then
			local Petrange = GetDistance( OwnerID(), TargetID() )
			if Petrange < Skillrange or Petrange == Skillrange  then
				--say ( OwnerID(), "True")
				return true
			elseif Petrange > Skillrange then
				ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_8]", 1 )
				--say ( OwnerID(), "nooooooo")
				return false
			end
		else
			ScriptMessage( Master , Master , 1 , "[SC_MAGICSTRING_9]", 1 )
			return false
		end
	end
end
--------------------------------------森法50 晶體強化+MANA&-80%HP
function lua_Dy_crystalbuffup_02() 
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --主人ID
	local PetLV = ReadRoleValue ( Master , EM_RoleValue_MagicPowerLv_SP+23) 
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*0.8))
	if MyHp-HP > 0 then
		WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
		SysCastSpellLv( OwnerID() , OwnerID() , 494012 , PetLV )
	elseif MyHp-HP < 0 or MyHp-HP == 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494012 , PetLV )
		KillId( OwnerID() , OwnerID() )
		--say (OwnerID() , "OK")
	end
end  
 -------------森神50 晶體治療-80%HP
 function lua_Dy_crystalbuffup_03()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --主人ID
	local PetLV = ReadRoleValue ( Master , EM_RoleValue_MagicPowerLv_SP+23) 
	local MaxHp = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP ) ------抓寵物滿血HP
	local MyHp = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) -----抓寵物HP
	local HPPercent =( MyHp / MaxHp)*100
	local HP = math.floor(abs(MaxHp*0.8))
	if MyHp-HP > 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494014 , PetLV )
		WriteRoleValue ( OwnerID(),  EM_RoleValue_HP, MyHp-HP)
		--say (OwnerID() , MyHp-HP)
	elseif MyHp-HP < 0 or MyHp-HP == 0 then
		SysCastSpellLv( OwnerID() , OwnerID() , 494014 , PetLV )
		KillId( OwnerID() , OwnerID() )
		--say (OwnerID() , "bye")
	end
end
----------------------------------------------------------------------戰森50 大氣振盪AE傷害
function lua_Dy_AirQuake()		
local PLevel = ReadRoleValue ( OwnerID() , EM_RoleValue_MagicPowerLv_SP+64 )
	SysCastSpellLv(OwnerID(), TargetID(), 494975 , 0 )	
end	
-----------------------------------------------------------------------森戰45 意志打擊
function lua_Dy_VolitionAttackEqCheck_00() -----------身上已有凝聚Buff用
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505850)  == true then ---------------蓄力斬施法為1秒的Buff
			AddBuff( OwnerID() , 505813, 0 , 3)	-------------------------實際效果的Buff		
			ReCalculate(OwnerID() )
			CancelBuff(OwnerID() , 505850)   -----------------刪除掉兩個Buff
			return true
		end
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end
function lua_Dy_VolitionAttackEqCheck_01() -----------身上已有猛獸Buff用
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if CheckBuff( OwnerID() , 505849)  == true then ---------------猛獸傷害X2的Buff
			AddBuff( OwnerID() , 505807, 0 , 3)	-------------------------實際效果的Buff		
			CancelBuff(OwnerID() , 505849)   -----------------刪除掉兩個Buff
			return true
		end
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
		
	end	
end
function lua_Dy_VolitionAttackEqCheck_02() -----------------身上已有另一個Buff&檢查禁制用
	if CheckBuff( OwnerID() , 505842   ) == true then		-----有禁制
		return false
	elseif CheckBuff( OwnerID() , 505849   ) == true then   -----有猛獸意志空
		return false
	elseif CheckBuff( OwnerID() , 505850   ) == true then   -----有凝聚意志空
		return false
	else
		return true
	end
end

----------------------------------------------------------森法45 死裡逃生
function star_skill_WM45()
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	local RebirthBuff = 505705
	Setplot( PetGID , "dead" , "star_skill_WM45_PetDead" , 30)
	AddBuff(PetGID , RebirthBuff , 0 , -1)
end

function star_skill_WM45_PetDead()
	--lua_Dy_Protectwm40()						-----------------森法LV40 結晶護佑(因為他的死亡劇情會被死裡逃生蓋掉)
	local MasterGID = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
--	local ReSummon1 = 495059
--	local ReSummon2 = 495060
--	local ReSummon3 = 495061
	if ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102297 then			----橡樹之靈
		SysCastSpellLv( MasterGID , MasterGID , 493333 , 0 )
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102324 then		----橡樹行者
		SysCastSpellLv( MasterGID , MasterGID , 493343 , 0 )
	elseif ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) == 102325 then		----自然晶體
		SysCastSpellLv( MasterGID , MasterGID , 493344 , 0 )	
	end
end

function star_skill_WM45_Check()
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	if CheckID(PetGID) == true and 
	 ReadRoleValue(PetGID , EM_RoleValue_IsDead) == 0 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )	-----你身邊沒有寵物
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------法森50 大地刻痕
function star_skill_MWD50(Condition)
	local Buff = 505690
	local ExtraBuff = 505904
	if Condition == 1 or Condition == 2 then
		if CheckBuff(OwnerID() , Buff) == true and 
		 CheckBuff(OwnerID() , ExtraBuff) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , ExtraBuff )
			local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)	
			--Say(OwnerID() , PLV)
			if PLV < 9 then				
				AddBuff(OwnerID() , ExtraBuff , 0 , -1)								
			end	
		elseif CheckBuff(OwnerID() , Buff) == true and 
		 CheckBuff(OwnerID() , ExtraBuff) == false then
			AddBuff(OwnerID() , ExtraBuff , 0 , -1)
			local Pos = Lua_BuffPosSearch( OwnerID() , ExtraBuff )
			local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)	
			--Say(OwnerID() , PLV)
		end	
	end
end
--------------------------------------------------------------------------------------------------------------------森影50 同心
function star_skill_WDR50()
	--local ChargeSpell = 495071 	-----同心攻擊	
	local DamageBuff = 505939
	local PetGID = ReadRoleValue( OwnerID() ,EM_RoleValue_PetID )
	--Say(PetGID , GetName(TargetID()))
	AddBuff(OwnerID() , DamageBuff , 0 , -1)
	AddBuff(PetGID , DamageBuff , 0 , -1)
	--SysCastSpellLv( PetGID , TargetID() , ChargeSpell , 0 )
end
---------------------------------------------------------------------------------------------------------------------影森50 幻影血刃
function star_skill_RWD50_Damage()
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8 , TargetID() )
	return true
end

function star_skill_RWD50_Pet1()	
	AddBuff(OwnerID() , 505848 , 0 , 5)
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	WriteRoleValue( Master , EM_LuaValueFlag_SkillUse6 , OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------不移動
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	------不show血條
	BeginPlot( Master , "star_skill_RWD50_Master" , 0 )	
end

function star_skill_RWD50_Pet2()	
	AddBuff(OwnerID() , 505848 , 0 , 5)
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	WriteRoleValue( Master , EM_LuaValueFlag_SkillUse7 , OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------不移動
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	------不show血條	
end

function star_skill_RWD50_Master()
	local pet1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse6)
	local pet2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse7)
	local Target = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8)
	local TauntSpell = 495072 
	for i=1 , 10 do
		sleep(10)
		--Say(OwnerID() , "pet1="..pet1)
		--Say(OwnerID() , "pet2="..pet2)
		--Say(OwnerID() , "Target="..Target)
		if pet1 ~= 0 and pet2 ~= 0 and Target ~=0 then
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse6 , 0 )
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse7 , 0 )
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse8 , 0 )
			if CheckRelation( OwnerID() , Target , EM_CheckRelationType_Attackable) == true then
				SetModeEx( pet1 , EM_SetModeType_Move , true )			------移動
				SetModeEx( pet1 , EM_SetModeType_Strikback , true )	------反擊
				SetModeEx( pet1 , EM_SetModeType_Fight , true )		------可砍殺
				SetModeEx( pet1 , EM_SetModeType_Searchenemy , true )	------索敵
				SetModeEx( pet1 , EM_SetModeType_Mark , true )			------可點選
				SetModeEx( pet1 , EM_SetModeType_NotShowHPMP , true )	------show血條
				SetModeEx( pet2 , EM_SetModeType_Move , true )			------移動
				SetModeEx( pet2 , EM_SetModeType_Strikback , true )	------反擊
				SetModeEx( pet2 , EM_SetModeType_Fight , true )		------可砍殺
				SetModeEx( pet2 , EM_SetModeType_Searchenemy , true )	------索敵
				SetModeEx( pet2 , EM_SetModeType_Mark , true )			------可點選
				SetModeEx( pet2 , EM_SetModeType_NotShowHPMP , true )	------show血條
				SetAttack(pet1 , Target)
				SetAttack(pet2 , Target)
				SysCastSpellLv( Target , pet1 , TauntSpell , 0 )
				SysCastSpellLv( Target , pet2 , TauntSpell , 0 )
				BeginPlot( pet1 , "star_skill_RWD50_PetSkill" , 0 )
				BeginPlot( pet2 , "star_skill_RWD50_PetSkill" , 0 )
				break
			else
				SetModeEx( pet1 , EM_SetModeType_Move , true )			------移動
				SetModeEx( pet1 , EM_SetModeType_Strikback , true )	------反擊
				SetModeEx( pet1 , EM_SetModeType_Fight , true )		------可砍殺
				SetModeEx( pet1 , EM_SetModeType_Searchenemy , true )	------索敵
				SetModeEx( pet1 , EM_SetModeType_Mark , true )			------可點選
				SetModeEx( pet1 , EM_SetModeType_NotShowHPMP , true )	------show血條
				SetModeEx( pet2 , EM_SetModeType_Move , true )			------移動
				SetModeEx( pet2 , EM_SetModeType_Strikback , true )	------反擊
				SetModeEx( pet2 , EM_SetModeType_Fight , true )		------可砍殺
				SetModeEx( pet2 , EM_SetModeType_Searchenemy , true )	------索敵
				SetModeEx( pet2 , EM_SetModeType_Mark , true )			------可點選
				SetModeEx( pet2 , EM_SetModeType_NotShowHPMP , true )	------show血條
				BeginPlot( pet1 , "star_skill_RWD50_PetSkill" , 0 )
				BeginPlot( pet2 , "star_skill_RWD50_PetSkill" , 0 )
			end	
		end
	end
end

function star_skill_RWD50_PetSkill()
	local Spell = 495105
	local Counter = 0
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID )
	local PLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+66)
	for i=1 , 20 do
		sleep(10)
		Counter = Counter+1
		
		if Counter == 5 then
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			SysCastSpellLv( OwnerID() , AttackTarget , Spell , PLV )
			Counter = 0
		end
	end
end	
--------------------------------------------------------------------------------------------------------------------法森45 精靈恩寵
function star_skill_MWD45() 		------觸發buff結束觸發 and 禁制結束觸發
	local AmuletBuff = 503957		------精靈護符
	local TriggerBuff = 505759
	local ElfBuff = 505755			------顯示次數用
	local EffectBuff = 505689
	local ForbiddenBuff = 505903
	if CheckBuff(OwnerID() , AmuletBuff) == true and
	 CheckBuff(OwnerID() , EffectBuff) == false and
	 CheckBuff(OwnerID() , ElfBuff) == false then
		AddBuff(OwnerID() , TriggerBuff , 0 , -1)		
		AddBuff(OwnerID() , ElfBuff , 1 , 10)
		ReCalculate(OwnerID() )
		AddBuff(OwnerID() , EffectBuff , 0 , 10)
	elseif CheckBuff(OwnerID() , ElfBuff) == true then
		ReCalculate(OwnerID() )
		AddBuff(OwnerID() , EffectBuff , 0 , 10)
	end	
end
 
function star_skill_MWD45_2() 		------效果Buff結束觸發
	local AmuletBuff = 503957		------精靈護符
	local TriggerBuff = 505759
	local ElfBuff = 505755			------顯示次數用
	local EffectBuff = 505689
	local ForbiddenBuff = 505903
	local Pos = Lua_BuffPosSearch( OwnerID() , ElfBuff )
	local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)
	if PLV == 1 then
		AddBuff(OwnerID() , ForbiddenBuff , 0 , -1)
		CancelBuff(OwnerID() , ElfBuff)
		AddBuff(OwnerID() , ElfBuff , 0 , 10)
	elseif PLV == 0 then
		CancelBuff(OwnerID() , ElfBuff)
	end
end
---------------------------------------------------森法40結晶護佑
function lua_Dy_WM35ADD()
	AddBuff( OwnerID()  , 507332 , 0 , 10)
	AddBuff( OwnerID()  , 507333 , 0 , 10)
end
function lua_Dy_WM35DEL()
	local own = OwnerID()
	if checkbuff(Own,507333) == false then
		if checkbuff(Own,507332) == true then
			CancelBuff_NoEvent( Own, 507332 )
		end
		if checkbuff(Own,505154) ==true then
			CancelBuff( Own, 505154 )
		end
	elseif checkbuff(Own,50732) == false then
		if checkbuff(Own,507333) ==true then
			CancelBuff_NoEvent( Own, 507333 )
		end
		if checkbuff(Own,505154) ==true then
		CancelBuff( Own, 505154 )
		end
	end
end
----------------------------------------------------新森法50寵物強化
function Dy_NEWWM50()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
		if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 620713 , 0, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
-------------------------------------------------------新森法40結晶護佑
function Dy_NEWWM40_CHECK()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "11")
		return false
	end
	local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102325 then
			return true
		elseif MypetID ~= 102325 then
			return false	
		end
	end	
end
function Dy_NEWWM40()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	SysCastSpellLv ( Master, Master, 498221,  0  )	
end
----------------------------------------新自然晶體技能 守護結晶 晶體加速
function Dy_NEWW14() --晶體加速
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	SysCastSpellLv ( Master, Master, 498224,  0  )
end
function Dy_NEWW46() --守護結晶
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	SysCastSpellLv ( Master, Master, 498222,  0  )
end
function Dy_NEWW14_2() --森法晶體加速
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	SysCastSpellLv ( Master, Master, 498225,  0  )
end
function Dy_NEWW46_2() --森法守護結晶
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) --抓主人ID
	SysCastSpellLv ( Master, Master, 498223,  0  )
end