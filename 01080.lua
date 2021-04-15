function lua_star_resetmagic()
	CancelBuff( OwnerID() , 500662 )
end
-------------------------------------------------------------------------------------------------------------------------銀河check
function lua_star_galaxy_check()
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 
		if GetDistance( OwnerID(), TargetID() ) <= 165 then
			if CheckBuff( OwnerID() , 501549 ) == false then
				--AddBuff( OwnerID() , 501549 , 1 , 3 )  --小橘20120523槓掉
				return true
			elseif CheckBuff( OwnerID() , 501549 ) == true then
				return false
			end	
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_8]" , 1 ) -----------施法距離過遠
			return false
		end			
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----技能目標錯誤
		return false
	end	
end

---------------------------------------------------------------------------------------------------------清除電能啟發Buff
function lua_star_cancelelect()
	CancelBuff( OwnerID() , 501554 )
   	 return true
end
---------------------------------------------------------------------------------------------------------行者流血技能
function lua_star_laceration_bleed()             ----傷口攻擊流血額外傷害
	local bleedbuffpos1 = {}
	local bleedbuffpos2 = {}
	local bleedbuffpos3 = {}	
	local Count = BuffCount( TargetID() )
	if CheckBuff( TargetID() , 500654 ) == true then				
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500654 then
				bleedbuffpos1[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos1[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos1[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then											
					return true
				end
			end
		end		
	elseif CheckBuff( TargetID() , 500655 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500655 then
				bleedbuffpos2[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos2[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos2[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620313 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620313 then
				bleedbuffpos2[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos2[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos2[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end		
	elseif CheckBuff( TargetID() , 500726 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500726 then
				bleedbuffpos3[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos3[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos3[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620297 ) == true then
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620297 then
				bleedbuffpos3[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if bleedbuffpos3[i] ~= nil then
				if BuffInfo( TargetID() , bleedbuffpos3[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end		
	else	
		return false
	end	
end

---------------------------------------------------------------------------------------------------------行者放血技能
function lua_star_laceration_wound()             ----傷口攻擊放血額外傷害
	local woundbuffpos = {}
	local Count = BuffCount( TargetID() )
	if CheckBuff( TargetID() , 500704 ) == true then		
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 500704 then
				woundbuffpos[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if woundbuffpos[i] ~= nil then
				if BuffInfo( TargetID() , woundbuffpos[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	elseif CheckBuff( TargetID() , 620314 ) == true then		
		for i = 0 , Count-1 , 1 do
			if BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID ) == 620314 then
				woundbuffpos[i] = i				
			end
		end
		for i = 0 , Count-1 , 1 do			
			if woundbuffpos[i] ~= nil then
				if BuffInfo( TargetID() , woundbuffpos[i] , EM_BuffInfoType_OwnerID ) == OwnerID() then 				
					return true
				end
			end
		end	
	else
		return false
	end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------電能之網
function lua_star_electnet()
	CancelBuff( OwnerID(), 501554 )
	lua_star_controlcheck( 501555 )
	return true
end
function lua_star_electnet_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	CancelBuff( OwnerID(), 501554 )
	lua_star_controlcheck( 501555 )
	return IsMob
end
function lua_star_electnet_ForPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		CancelBuff( OwnerID(), 501554 )
		lua_star_controlcheck( 503838 )
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------控場回血
function lua_star_controlhealing()
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	if (NowHP+MaxHP*0.25) <= MaxHP then
		AddRoleValue( TargetID() , EM_RoleValue_HP , MaxHP*0.25 )	--------改為每2秒回25%
	else
		WriteRoleValue( TargetID() , EM_RoleValue_HP , MaxHP )		--------補的量超過最大值時直接寫入最大值
	end	
end		
----------------------------------------------------------------------------------------------------------------------------------------------控場只能同時控制一個目標
function lua_star_controlcheck( CCBuffId )
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( ID , CCBuffId ) == true and ID ~= TargetID() then
			local BuffPos = Lua_BuffPosSearch( ID , CCBuffId )			
			if BuffPos >= 0 and BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() then
				CancelBuff( ID , CCBuffId )				
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------麻醉飛刃
function lua_star_SleepDagger()
	lua_star_controlcheck( 500737 )
	return true
end
function lua_star_SleepDagger_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	lua_star_controlcheck( 500737 )
	return IsMob
end
function lua_star_SleepDagger_ForPlayer()
	local IsPlayer = lua_star_Skill_ForPlayer()
	lua_star_controlcheck( 503046 )
	return IsPlayer
end
------------------------------------------------------------------------------------------------------------------------------------------------套索工具
function lua_star_RopeTool()	
	lua_star_controlcheck( 500924 )		
	return true
end
function lua_star_RopeTool_ForMob()			-------對怪物效果
	lua_star_controlcheck( 500924 )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end	
end

function lua_star_RopeTool_ForPlayer()			-------對玩家效果
	lua_star_controlcheck( 502955 )		------1214小鑫修改buff編號
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end
function lua_star_RopeTool2_ForMob()			-------對怪物效果
	lua_star_controlcheck( 502559 )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	else 
		return true
	end	
end

function lua_star_RopeTool2_ForPlayer()			-------對玩家效果
	lua_star_controlcheck( 503849)			------1214小鑫修改buff編號
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return true								
	else 
		return false
	end	
end

------------------------------------------------------------------------------------------------------------------------------------------------即凍術
function lua_star_Freeze()
	lua_star_controlcheck( 501961 )
	return true
end
function lua_star_Freeze_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	lua_star_controlcheck( 501961 )
	return IsMob
end
function lua_star_Freeze_ForPlayer()
	local IsPlayer = lua_star_Skill_ForPlayer()
	lua_star_controlcheck( 503844 )
	--if IsPlayer == true then
		--Say(OwnerID() , "true")
	--else
		--Say(OwnerID() , "false")
	--end
	return IsPlayer
end
------------------------------------------------------------------------------------------------------------------------------------------------------主戰副影『精神削弱』
function lua_star_SpiritCurse_Master()	
	local MaxMP = ReadRoleValue( TargetID() , EM_RoleValue_MaxMP )
	local MaxSP = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP )		
	local MaxSP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP_Sub )
	local MP = 0
	local SP = 0
	local SP_Sub = 0
		
	if MaxMP ~= 0  then
		MP = ReadRoleValue( TargetID() , EM_RoleValue_MP )
		WriteRoleValue( TargetID() , EM_RoleValue_MP , MP-MaxMP*0.15 )
	end
	if MaxSP ~= 0  then
		SP = ReadRoleValue( TargetID() , EM_RoleValue_SP )
		WriteRoleValue( TargetID() , EM_RoleValue_SP , SP-MaxSP*0.5 )	
	end
	if MaxSP_Sub ~= 0 then
		SP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_SP_Sub )
		WriteRoleValue( TargetID() , EM_RoleValue_SP_Sub , SP_Sub-MaxSP_Sub*0.5 )
	end	
end
--------------------------------------------------Lv50 戰影 精神削弱
function lua_Dy_weaksoul(Condition)	
	if Condition == 1 then
		AddBuff( TargetID() , 503721 , 0 , 25)	
	end	
end
------------------------------------------------影戰35LV 毒性感染
function lua_Dy_DrugCancel()
local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+24 )
SysCastSpellLv	( OwnerID(), TargetID() , 492955 , PLevel)
CancelBuff( TargetID(), 502894 )
end

-------------------------------------------------------------------------------------------------------------------------------騎士 魔力回饋新版
function star_skill_Knight_ReMPCheck()
	if CheckBuff(TargetID() , 501773) == true or
	 CheckBuff(TargetID() , 501774) == true or
	 CheckBuff(TargetID() , 501775) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_16]" , 1 )		------目標身上沒有聖印，無法使用此技能!
		return false
	end	
end

function star_skill_Knight_ReMP()
	local PLV = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+2 )
	if CheckBuff(TargetID() , 501773) == true then			-----聖印1
		SysCastSpellLv( OwnerID() , OwnerID() , 495075 , PLV )
		CancelBuff(TargetID() , 501773)
	elseif CheckBuff(TargetID() , 501774) == true then		-----聖印2
		SysCastSpellLv( OwnerID() , OwnerID() , 495076 , PLV )
		CancelBuff(TargetID() , 501774)
	elseif CheckBuff(TargetID() , 501775) == true then		-----聖印3
		SysCastSpellLv( OwnerID() , OwnerID() , 495077 , PLV )
		CancelBuff(TargetID() , 501775)
	end
end
----------------------------------------------------------------------------------------------------------------------------騎士 聖印新版
function star_skill_Knight_HolySym()
	if CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == false then
		AddBuff(TargetID() , 501773 , 0 , -1)
	elseif CheckBuff(TargetID() , 501773) == true and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == false then
		CancelBuff(TargetID() , 501773)
		AddBuff(TargetID() , 501774 , 0 , -1)
	elseif CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == true and
	 CheckBuff(TargetID() , 501775) == false then
		CancelBuff(TargetID() , 501774)
		AddBuff(TargetID() , 501775 , 0 , -1)		
	elseif CheckBuff(TargetID() , 501773) == false and
	 CheckBuff(TargetID() , 501774) == false and
	 CheckBuff(TargetID() , 501775) == true then
		CancelBuff(TargetID() , 501775)
		AddBuff(TargetID() , 501775 , 0 , -1)
	end
end
--------------------------------------------------------------------------------------------------------------------------------騎法35 強力魔力回饋新版
function star_skill_KM35_ReMPCheck()
	if CheckBuff(TargetID() , 501773) == true or
	 CheckBuff(TargetID() , 501774) == true or
	 CheckBuff(TargetID() , 501775) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_16]" , 1 )		------目標身上沒有聖印，無法使用此技能!
		return false
	end	
end

function star_skill_KM35_ReMP()
	local PLV = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+2 )
	if CheckBuff(TargetID() , 501773) == true then			-----聖印1
		SysCastSpellLv( OwnerID() , OwnerID() , 495078 , PLV )
		CancelBuff(TargetID() , 501773)
	elseif CheckBuff(TargetID() , 501774) == true then		-----聖印2
		SysCastSpellLv( OwnerID() , OwnerID() , 495079, PLV )
		CancelBuff(TargetID() , 501774)
	elseif CheckBuff(TargetID() , 501775) == true then		-----聖印3
		SysCastSpellLv( OwnerID() , OwnerID() , 495080 , PLV )
		CancelBuff(TargetID() , 501775)
	end
end
--------------------------------------------------------------------------------------------------------------------------------騎士 制裁新版
function star_skill_Kight_Punish()
	if CheckBuff(TargetID() , 500137) == true or
	 CheckBuff(TargetID() , 500138) == true or
	 CheckBuff(TargetID() , 500139) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_17]" , 1 )		------目標身上沒有光印，無法使用此技能!
		return false
	end	
end

function star_skill_Kight_Punish_2(PLV)	-----根據光印數耗魔
	local MpSpell = 495102
	SysCastSpellLv( OwnerID() , OwnerID() , MpSpell , PLV ) 	------0級扣2%魔力	
end

--------------------------------------祭司妖精光環系列上主人特殊Buff
function lua_Dy_spirit(BUFFID)
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) ---抓主人ID
AddBuff( Master , BUFFID , 0 , 900 ) ---阿龐修改為900秒
end
--------------------------------------祭遊50雙祐光環冰刃+10%法傷
function lua_Dy_IceKnife()
if CheckBuff( OwnerID() , 506317) == false then
	return true
elseif CheckBuff( OwnerID() , 506317) == true then 
	AddBuff( OwnerID() ,506319 ,0 , 3)
	ReCalculate(OwnerID() )
	--say (OwnerID(), "submit")
	return true
	end
end
--------------------------------------祭戰50命中光環鬥氣炸裂+20%傷害
function lua_Dy_PW50()
if CheckBuff( OwnerID() , 506351) == false then
		return true
elseif CheckBuff( OwnerID() , 506351) == true then
		AddBuff( OwnerID() ,506353 ,0 , 3)
		ReCalculate(OwnerID() )
		--say (OwnerID(), "submit")
		return true
	end
end	
--------------------------------------祭法50 治癒術+15%治療威力
function lua_Dy_PM50heal()
if CheckBuff( OwnerID() , 506534) == false then
	--say (OwnerID(), "submit")
	return true
elseif CheckBuff( OwnerID() , 506534) == true then 
	AddBuff( OwnerID() ,506535 ,0 , 3)
	ReCalculate(OwnerID() )
	--say (OwnerID(), "submit")
		return true
	end
end
function lua_Dy_PM50dealheal()
CancelBuff(OwnerID() , 506535)
--say (OwnerID() , "O_O")
end	
---------------------------------妖精隱藏上玩家
function lua_Dy_PRIHideBuff(BUFFID1)
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	AddBuff( Master ,BUFFID1 ,0 , 7)
end
----------------------------影戰50 能量奪返精力CD
function lua_Dy_ENGCD()
	if CheckBuff( TargetID() , 506219) == true then		
		return false
	else
		AddBuff( TargetID(),506219 ,0 ,3 )
		return true
	end
end
function dy_tm15() --劇毒陷阱
	local Master = ReadRoleValue( OwnerID() ,EM_RoleValue_OwnerGUID ) --抓出放陷阱的人
	local PLV = ReadRoleValue( Master ,EM_RoleValue_MagicPowerLv_SP+35 )
	--say (Master , "Master")
	SysCastSpellLv( Master , TargetID() , 491444 , PLV )

end