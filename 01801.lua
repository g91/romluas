----------------------------------------------------祭司 魔力符石
function lua_Dy_MANARUNES()
	GiveBodyItem( OwnerID(), 203607, 1 )
end

function AP_MANARUNES_Check() ---2010-0830，阿龐新增背包空間判斷，法術集合
	if EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	end
end
---------------------------------------祭司套裝技能2 
function lua_Dy_Priset2()
CancelBuff(OwnerID() , 506515)
end
-----------------------------------------神官倒數種子
function lua_Dy_MathSeed()
local Pos = Lua_BuffPosSearch( OwnerID() , 506518 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	SysCastSpellLv	( BuffOwner, OwnerID(), 495558 , 0 ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 506518)
	--say (OwnerID(), "+++")
end
function Dy_MathSeed_65()
local Pos = Lua_BuffPosSearch( OwnerID() , 506518 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	SysCastSpellLv	( BuffOwner, OwnerID(), 497852 , 0 ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 506518)
	--say (OwnerID(), "+++")
end
------------------------------------------------森牧58LV套裝技能 舞惑鐘聲
function lua_Dy_DancewithCheck()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( Mypet ) == false or ReadRoleValue( MyPet , EM_RoleValue_IsDead) ==1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		--say ( OwnerID() , "BUBU")
		return false
	end
local MypetID = ReadRoleValue( Mypet , EM_RoleValue_OrgID )
	if CheckID( Mypet ) == true then 
		if MypetID == 102324 then
			return true
		elseif MypetID ~= 102324 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_14]" , 1 )
			--say ( Mypet , "BUBUBU")
			return false
		end
	end
end
function lua_Dy_DancewithCK2()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	SysCastSpellLv( MyPet , MyPet , 495721 , 0 ) 
	--say ( Mypet , "DINDON")
end
------------------------------------------------------------------------目標控場遞減+禁制
function lua_Dy_Skill_ForMobCD(BuffID)		--------填對怪物效果
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then			
		return false								
	elseif CheckBuff( TargetID() , BuffID ) == true then
		return false
	else	
		return true
	end
end

function lua_Dy_Skill_ForPlayerCD(BuffID)		---------填對玩家效果
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		if CheckBuff( TargetID() , BuffID ) == true then
			return false
		else
			return true
		end
	else
		return false
	end	
end

-----------------------------------------------Z17 森牧解?免點寵物劇情
function lua_Dy_Z17WA_NoClick()
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
function lua_Dy_Z17WA()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 507489 , 0 , 5 )
		return true
end
--------------------------------------------------Z17 遊俠製作蔓生劇情
function lua_Dy_Z17SC()
	GiveBodyItem( OwnerID(), 212754, 999 )
end
function lua_Dy_Z17SC_DEL()
	local X = CountBodyItem( OwnerID(), 212754 ) 
	DelBodyItem( OwnerID(), 212754, X );
	--say (OwnerID() , "X="..CountBodyItem( OwnerID(), 212754 ))
end
--------------------------------------------------Z17 神官翠生種子劇情
function lua_Dy_Z17DRU()
	GiveBodyItem( OwnerID(), 208120, 1 )
end
function lua_Dy_Z17DRU_Check(count)
	local Nature = 503827		----------------自然之力
	local FreePower = 503817	--------大地融合
	if Checkbuff( OwnerID() , FreePower ) == false then
		if Checkbuff( OwnerID() , Nature ) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local NowCount = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )+1
			if NowCount < Count then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
				return false
			elseif NowCount >= Count then
				if EmptyPacketCount( OwnerID() ) >= 1 then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
					return false
				end	
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
			return false
		end
	elseif EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	elseif EmptyPacketCount( OwnerID() ) < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	else
		return true
	end
end
----------------------世界戰場2.3套裝技能傳送門
----------------------在zone100以下跟400的小屋才能使用技能
----------------------技能CD10分鐘，開門的時候同時給隊友入門資格，BUFF跟門都存在3分鐘
function un_zone191_magiccheck() --技能判斷zone
	local roneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)--讀取施放的人的zone
	if roneID<=100 then
	return true
	else
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE191_GET]" , 1 ) --回傳false同時跟玩家表示"需要在一般區域以及小屋才能開啟"
	return false
	end
end
function un_zone191_door_open()  --創出傳送門
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = LuaFunc_CreateObjByObj ( 117210 , OwnerID())
	WriteRoleValue(door,EM_RoleValue_Livetime,180)            --存在3分鐘
	SetModeEx(door,EM_SetModeType_NotShowHPMP,false)
	SetModeEx(door,EM_SetModeType_HideName,true)
	WriteRoleValue(door,EM_RoleValue_Register1,0)
	AddToPartition( door, RoomID)
	BeginPlot(door,"zone191_in",0)
end
function zone191_in()  --觸碰劇情
	SetPlot( OwnerID(),"touch","zone191_in_02",30 )
end
function zone191_in_02()  --觸碰劇情檢查

		if CheckBuff( OwnerID(), 508480 )==true then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
		BeginPlot(TargetID(),"zone191_in",0)
		elseif CheckBuff( OwnerID(), 508428 )==true then
		BeginPlot( OwnerID(), "un_zone191_in", 0 )
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
		BeginPlot(TargetID(),"zone191_in",0)
		end

	sleep(5) --避免重複點選出線區域未開放

end
function un_zone191_in() --觸碰結果
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----判斷有沒有隊伍
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then------------讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 191 , -1 , -2815 , 211 , -15 , 45 ) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 191 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end

		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 or  PartyInstanceLv( OwnerID() ) == 1 then--讀取隊伍的困難度選擇
			if ChangeZone( OwnerID() , 191 , -1 , -2815 , 211 , -15 , 45 ) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 191 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone191_Out()
	SetPlot( OwnerID() , "Collision" , "un_zone191_Out" , 0 )
end
function un_zone191_Out()
	if ChangeZone( OwnerID() , 2 , 0, 4936 , 115 , -2228 , 240 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
--*****************************************************************************************************************
                                            --以下為世界戰場3
--*****************************************************************************************************************
function un_zone192_magiccheck() --技能判斷zone
	local roneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)--讀取施放的人的zone
	if roneID<=100 then
	return true
	else
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE191_GET]" , 1 ) --回傳false同時跟玩家表示"需要在一般區域以及小屋才能開啟"
	return false
	end
end
function un_zone192_door_open()  --創出傳送門
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = LuaFunc_CreateObjByObj ( 117209 , OwnerID())
	WriteRoleValue(door,EM_RoleValue_Livetime,180)            --存在3分鐘
	SetModeEx(door,EM_SetModeType_NotShowHPMP,false)
	SetModeEx(door,EM_SetModeType_HideName,true)
	AddToPartition( door, RoomID)
	WriteRoleValue(door,EM_RoleValue_Register1,0)
	BeginPlot(door,"zone192_in",0)
end
function zone192_in()  --觸碰劇情
	SetPlot( OwnerID(),"touch","zone192_in_02",30 )
end
function zone192_in_02()  --觸碰劇情檢查
		if CheckBuff( OwnerID(), 508480 )==true then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
			BeginPlot(TargetID(),"zone192_in",0)
		elseif CheckBuff( OwnerID(), 508431 )==true then
			BeginPlot( OwnerID(), "un_zone192_in", 0 )
		else
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_OPEN]",0)
			BeginPlot(TargetID(),"zone192_in",0)
		end
	sleep(5)--避免重複點選出線區域未開放
end
function un_zone192_in() --碰撞結果
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----判斷有沒有隊伍
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then------------讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 192 , -1 , 2273 , -6 , -2371 , 180 ) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 192 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 or  PartyInstanceLv( OwnerID() ) == 1 then--讀取隊伍的困難度選擇
			if ChangeZone( OwnerID() , 192 , -1 , 2273 , -6 , -2371 , 180 ) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 192 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone192_Out()
	SetPlot( OwnerID() , "Collision" , "un_zone192_Out" , 0 )
end
function un_zone192_Out()
	if ChangeZone( OwnerID() , 6 , 0, -23232 ,-260 , 4726 , 57 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end											
-----------------------65影行者套裝技能_獅爪痕
function lua_Dy_Z19THI()
	sysCastSpellLV( OwnerID() , TargetID() , 497133 , 0 )
end
function lua_Dy_Z19THI_check()
	if Checkbuff ( TargetID() , 508530 ) ==  true then
		return false
	elseif Checkbuff ( TargetID() , 508530 ) ==  false then
		return true
	end
end

---------------------- 65森林牧者套裝技能_獸靈蝕 
function Dy_Z19WARDEN()
	if Checkbuff( TargetID() , 508639 ) == false then
		AddBuff( OwnerID() , 508639 , 0 , 25 )
	end
end
function Dy_Z19WARDEN_2() --上自己羚羊之足
	if Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		
	elseif Checkbuff( OwnerID() , 508639 ) == false or Checkbuff( OwnerID() , 508638 ) == false then	
		AddBuff( OwnerID() , 508638 , 0 , 10 )
	end
end
function Dy_Z19WARDEN_Check() -- 65森林牧者套裝技能_獸靈蝕
	if Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		return false
	elseif Checkbuff( OwnerID() , 508639 ) == true or Checkbuff( OwnerID() , 508638 ) == true then
		return true
	end
end		
-------------------65法師套裝技能_魔術把戲
function Dy_Z19mag() ---法師套裝技能_魔術把戲二選一用
	local Buff_1 = 508534
	local Buff_2 = 508539
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	end
end																						
----------------------------------------------------65套裝技能_祭司_魔術師的償還 
function Dy_Z19aug()
	GiveBodyItem( OwnerID(), 205730, 1 )
end

function Dy_Z19aug_Check() --65套裝技能_祭司_魔術師的償還 背包檢查
	if EmptyPacketCount( OwnerID() ) >= 1 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TREASURE_NOSPACE]" , 0 )
		return false
	end
end	
-----------------------------------------------67套裝技能_森牧_夥伴
function Dy_Z20WARDEN()
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( MyPet ) == true then
		if Checkbuff( MyPet , 620125 ) == true or Checkbuff( MyPet , 620120 ) == true then --寵物身上有禁制與支援效果時
			SysCastSpellLv	( OwnerID(), MyPet, 497793 , 0 ) ---施放回血
		elseif Checkbuff( MyPet , 620125 ) == false and Checkbuff( MyPet , 620120 ) == false then
			SysCastSpellLv	( OwnerID(), MyPet, 497793 , 0 ) ---施放回血
			AddBuff (MyPet , 620120 , 0 , 20) --上支援
		end
	elseif CheckID( MyPet ) == true then
	end
end
--------------------------------------------------Z21 70遊俠千羽之影劇情
function lua_Dy_Z21SC()
	GiveBodyItem( OwnerID(), 213620, 999 )
end
function lua_Dy_Z21SC_DEL()
	local X = CountBodyItem( OwnerID(), 213620 ) 
	DelBodyItem( OwnerID(), 213620, X );
	--say (OwnerID() , "X="..CountBodyItem( OwnerID(), 212754 ))
end					
-----------------------------------------Z21 70神官倒數種子2
function Dy_MathSeed_70()
local Pos = Lua_BuffPosSearch( OwnerID() , 620970 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	--SysCastSpellLv	( BuffOwner, OwnerID(), 498377 , 0 ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	--CancelBuff(OwnerID() , 620970)
	SysCastSpellLv	( OwnerID() , OwnerID(), 498377 , 0 ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	SysCastSpellLv	( OwnerID() , OwnerID(), 498387 , 0 ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	--say (OwnerID(), "+++")
end
--※※Z23區域※※
-------------------------------------Z23 73 法師套裝技能_瑟坦波非的智庫
function Dy_Z23mag() ---法師套裝技能_瑟坦波非的智庫三選一用
	local Buff_1 = 622434 --風
	local Buff_2 = 622435 --火
	local Buff_3 = 622436 --地
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_3 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_3 , 0 , 10)	
	end
end	
function Dy_clearbuff(Buff1,Buff2,Buff3)  --BUFF檢查存在即刪掉自己的劇情
	if CheckBuff( OwnerID() , Buff1) == true then
		Cancelbuff(OwnerID(),Buff1)
	end
	if CheckBuff( OwnerID() , Buff2) == true then
		Cancelbuff(OwnerID(),Buff2)
	end
	if CheckBuff( OwnerID() , Buff3) == true then
		Cancelbuff(OwnerID(),Buff3)
	end
end