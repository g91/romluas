--戰士
function lua_bico_warr_ro_es_70()    --絕地逢生判斷函式         
	local own = OwnerID()
	if CheckBuff( own , 622950 ) == true then
		return true
	else
		return false
	end
end

function lua_bico_warr_ward_es_70() --野蠻處決判斷函式
	local tar = TargetID()  --怪本身
	local own = OwnerID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --剩餘HP百分比
	if nowhp<30 then
		--Say(own,"1")  --如果目標血量<30,有觸發法術,玩家會say"1"
		return true
	else
		--Say(own,"2")  --如果目標血量>30,無觸發法術,玩家會say"2"
		return false
	end
end

function lua_bico_secondhandcheck_shield( )--GUID==目標   Type=裝備位置 16=副手  (判斷角色裝備欄位物品)
	local own = OwnerID()
	local DBID = GetItemInfo ( own , EM_ItemPacketType_EQ , 16 , 0 )
	local DBTYPE = GameObjInfo_Int( DBID , "ArmorType" )
	if DBTYPE == 5 then
		return true
	else
		return false
	end
end

function lua_bico_warr_knight_es_60() --聖靈制裁盾牌的判斷
	local own = OwnerID()
	if lua_bico_secondhandcheck_shield() == true then
	--Say(own,"1")
		return true
	else
	--Say(own,"2")
		return false
	end
end

--祭司
function lua_bico_pri_sco_es_60() --光之鏈擊範圍補血(系統施法)
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+9 )
	local tar_X = ReadRoleValue( tar , EM_RoleValue_X )
	local tar_Y = ReadRoleValue( tar , EM_RoleValue_Y )
	local tar_Z = ReadRoleValue( tar , EM_RoleValue_Z )
	--sysCastSpelllv ( own , tar , 499964 , powerLV )
	SysCastSpellLv_Pos ( own , tar_X , tar_Y , tar_Z , 499964 , powerLV ) 
end

function lua_bico_pri_sco_es_70() --療癒箭瞬發
	local own = OwnerID()
	KS_ResetColdown( own , 492636 , 0 )
end

function lua_bico_pri_ro_es_60_1() --毒蛇詛咒重置CD用
local own = OwnerID()
local Pos = Lua_BuffPosSearch( own , 623030 )                      ---------------------抓出身上的法術代號
local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
local x = DW_rand(2) --50%機率觸發
	if x == 1 then
		addbuff(BuffOwner,623038,0,-1)
		SetFlag(BuffOwner,546866,1) --給治療術瞬發旗標
	end
end

function lua_bico_pri_ro_es_60_4() --治療量加倍buff
	local own = OwnerID()
	addbuff(own,623007,0,2)
	return true
end

function lua_bico_pri_ro_es_60_3() --治癒術瞬發 刪除旗標
	local own = OwnerID()
	SetFlag( own, 546866, 0 )
	CancelBuff( own, 623038 )
end

function lua_bico_pri_ro_es_60_2() 
	local own = OwnerID()
	SetFlag( own, 546866, 0 )
	CancelBuff( own, 623007 )
	return true
end

function lua_bico_holuikencheck()
	local own = OwnerID()
	local tar = TargetID()
	if CheckBuff(tar,623001) == true or 
	CheckBuff(tar,623050) == true then
	--Say(own,"false")
	return false
	else
	--Say(own,"true")
	return true
	end
end

--神官

function lua_bico_dru_warr_es_60() --十字荊棘打擊共用函式(荊棘戰法)
	local own = OwnerID()
	local plv = FN_CountBuffLevel(own,623080)
	if  CheckFlag(own,546833) == true then --檢查自己身上是否有荊棘戰法的keyitem
		if	plv == 4	then
			addbuff(own,623080,plv,15)
		else
			cancelbuff(own,623080) --要cancel掉一次,才會1.2.3.4~疊上去
			addbuff(own,623080,plv+1,15)
		end
	else
	return true
	end
end

function Lua_Skill499935_main()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+32 )
	local BuffTable = {623109, 623111, 623115}
	--say(OwnerID(),"powerLV = "..powerLV)
	if Lua_PercentHP(tar)<50 then
		for i=1,table.getn(BuffTable) do
			CancelBuff(tar, BuffTable[i])
		end
		--AddBuff(tar, 623115, powerLV, 6)
		sysCastSpellLv(own,tar,499654,powerLV)
		return false
	end
	if CheckBuff( tar, 503753 ) == true then
		return false
	end 
	return true
end

function Lua_Skill499935_main_fixPet()	--排除會導致祭司寵物"隱藏自我"消失問題
	if CheckBuff( TargetID() , 503753 ) == true then
		return false
	else
		return true
	end
end


function lua_bico_dru_mag_es_70()    --靈感示現判斷函式         
	local own = OwnerID()
	if CheckBuff( own , 505163 ) == true then
		return true
	else
		return false
	end
end

function star_skill_DM50_bico()  --盛夏之力範圍法術
	local SummerBuff = 623141
	local SummerPowerBuff = 499932
	local Pos = Lua_BuffPosSearch( OwnerID() , SummerBuff )
	local BuffOwner = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_OwnerID)
	local own = OwnerID()
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if GetDistance( OwnerID() , BuffOwner ) < 500 then
		if ReadRoleValue(OwnerID() , EM_RoleValue_ParryState) == 1 then
			SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , SummerPowerBuff  , 0 ) 
		end
	end	
end

function lua_bico_dru_warr_es_60_heal() --神森60範圍治療
	local own = OwnerID()
	local BuffOwner 

	if CheckBuff(own, 623124) == true then
		local Pos = Lua_BuffPosSearch( own , 623124 )                      		--抓出身上的法術代號 
		BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )	--抓出此法術是誰放的
		local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
		sysCastSpellLv(BuffOwner,own,499939,powerLV)
	elseif CheckBuff(own, 623126) == true then
		BuffOwner = own
		local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
		sysCastSpellLv(BuffOwner,own,499939,powerLV)
	end
	
--	local powerLV = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+77 )
--	--
--	--if powerLV ~= 0 then
--		sysCastSpellLv(BuffOwner,own,499939,powerLV)
--	--end
end

function lua_bico_dru_ward_es_70()   --神森70範圍治療
	local	own = OwnerID()
	local	plv = FN_CountBuffLevel(own,503827)
			--Cl_Read_BuffLv( ObjID , BuffID , Value ) --0=BUFF等級 , 1=BUFF施展者
			sysCastSpellLv(own,own,499937,plv)
			CancelBuff( own, 503827 )
end

function lua_bico_dru_ward_es_70_1()    --恩賜脈動判斷函式         
	local own = OwnerID()
	if CheckBuff( own , 503827 ) == true then
		return true
	else
		return false
	end
end

--騎士

function lua_bico_kni_warr_es_70_1(PLV)	-----根據光印數耗魔70級精英技能修正耗魔量
	local MpSpell = 499927
	SysCastSpellLv( OwnerID() , OwnerID() , MpSpell , PLV ) 	------0級扣1%魔力	
end


function lua_bico_kni_sco_es_60()
	local race = ReadRoleValue( TargetID() , EM_RoleValue_Race ) 
   	if Race == 5  then                    -----不死
		return true
	elseif Race == 12  then	              -----惡魔
		return true	
	else
		return false
	end	
end

function lua_bico_kni_sco_es_70() --血之制裁提高傷害
	local own = OwnerID()
	if CheckBuff(TargetID() , 500137) == true or
	 CheckBuff(TargetID() , 500138) == true or
	 CheckBuff(TargetID() , 500139) == true then
		if CheckBuff( own , 500871 ) == true then
		Addbuff (own,623168,0,-1)   --增傷buff
		end
	 return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_17]" , 1 )		------目標身上沒有光印，無法使用此技能!
		return false
	end	
end

function lua_bico_kni_sco_es_70_bloodcheck() --血之制裁消除增傷buff
	local own = OwnerID()
	CancelBuff( own , 623168 )
end

function lua_bico_kni_sco_es_70_blood() --血箭檢查
	local own = OwnerID()
	if  CheckBuff( own , 500871 ) == false then 
		CancelBuff( own , 623167 )
	end
end

function lua_bico_kni_rag_es_70() --獵豹本能降CD
	local own = OwnerID()
	KS_ResetColdown( own , 495402 , 10 )
end

function lua_bico_kni_pri_es_70()
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+72 )
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499911 , powerLV ) 
end



function lua_bico_kni_pri_es_15()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+50 )
	if  CheckBuff(tar, 623188) == false and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == false then
		SysCastSpellLv( own , tar , 499880 , powerLV )
	elseif CheckBuff(tar, 623188) == true and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == false then
		CancelBuff(tar, 623188)
		SysCastSpellLv( own , tar , 499881 , powerLV )
	elseif CheckBuff(tar , 623188) == false and
		CheckBuff(tar , 623189) == true and
		CheckBuff(tar, 623190) == false then
		CancelBuff(tar, 623189)
		SysCastSpellLv( own , tar , 499882 , powerLV )
	elseif CheckBuff(tar, 623188) == false and
		CheckBuff(tar, 623189) == false and
		CheckBuff(tar, 623190) == true then
		CancelBuff(tar, 623190)
		SysCastSpellLv( own , tar , 499882 , powerLV )
	end
end


function lua_bico_kni_pri_es_20() --神聖掃蕩
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+51 )
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if	CheckBuff( tar , 623188 ) == true then
	CancelBuff( tar , 623188 )
	sysCastSpelllv ( own , own , 499904 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499907 , powerLV )
	end
	if	CheckBuff( tar , 623189 ) == true then
	CancelBuff( tar , 623189 )
	sysCastSpelllv ( own , own , 499905 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499908 , powerLV )
	end
	if	CheckBuff( tar , 623190 ) == true then
	CancelBuff( tar , 623190 )
	sysCastSpelllv ( own , own , 499906 , powerLV )
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499890 , powerLV )
	end
end

function lua_bico_kni_warr_es_70_2()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623155,powerLV,-1)
end

function lua_bico_kni_warr_es_70_3()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623234,powerLV,-1)
end

function lua_bico_kni_warr_es_70_4()
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+64 )
	Addbuff(own,623235,powerLV,-1)
end

--森林牧者

function lua_bico_ward_warr_es_70()
	local own = OwnerID()
	local tar = TargetID()
	local own_X = ReadRoleValue( own , EM_RoleValue_X )
	local own_Y = ReadRoleValue( own , EM_RoleValue_Y )
	local own_Z = ReadRoleValue( own , EM_RoleValue_Z )
	if CheckBuff(own,623248) == true then
	SysCastSpellLv_Pos ( own , own_X , own_Y , own_Z , 499901 , 0 ) 
	end
end

function lua_bico_ward_mage_es_60()
	local own = OwnerID()
	--KS_ResetColdown( own , 493347 , 5 )
	Lua_CDtime_set(own,493347,-5)
end

function lua_bico_ward_mage_es_70() --森法狂野攻勢-肌力爆發
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		AddBuff( MyPet , 623265 , PLevel, 30 )
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		--say (OwnerID(), "PLevel ="..PLevel )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end

function lua_bico_ward_dri_es_70()
	local own = OwnerID()
	KS_ResetColdown( own , 499885 , 5 )
end

function bico_check()    --檢查用
	local own = OwnerID()
	say(own,"1")
end


function un_499482() --白金之星的替身
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
	
	SetModeEx(OwnerID(),EM_SetModeType_Mark, false)
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
local own = OwnerID()
addbuff(own,623024,0,20)
	while 1 do
		CastSpellLV(own,own,499503,0)
		sleep(20)
	end
end

--靈能者
function bico_623416_cooldown()
	local own = OwnerID()
	--say(own,"hi")
	KS_ResetColdown( own , 498739 , 0 )
end

function bico_623419_cooldown()
	local own = OwnerID()
	--say(own,"hi")
	KS_ResetColdown( own , 498742 , 3 )
end

--戰匠
function bico_623422_bloodact()
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+111 )
	sysCastSpelllv ( own , own , 499821 , powerLV )
end

--影靈
function bico_499803_check() --lv60靈魂迅捷檢查
	local own = OwnerID()
	if Checkbuff(own,621568) == false then
	Cancelbuff(own,623424)
	end
end

function bico_RangeSkill_623430() --迷惑機關--相對於60級的精英技能
	local own = OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local monster = LuaFunc_CreateObjByObj ( 106517 , tar )
	--local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+88 )
	--local table = {498826,498830,498837,498828,499816}	
	--for i = 1 , #(table) do
		--KS_ResetColdown( own , table[i] , 5 )
	--end	
	WriteRoleValue(monster,EM_RoleValue_register2,tar)
	WriteRoleValue(monster,EM_RoleValue_register3,own)
	addbuff(monster,621602,0,-1) 					   --給減傷buff
	WriteRoleValue(monster,EM_RoleValue_register1,tar) --目標寫給陷阱
	WriteRoleValue(monster,EM_RoleValue_Livetime,4)
		SetModeEx(monster,EM_SetModeType_Mark,true)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, true) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	AddToPartition( monster, RoomID)
	Beginplot(monster,"bico_RangeSkill_623430_1",0)
end

function bico_RangeSkill_623430_1() --迷惑機關1--相對於60級的精英技能
	local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_register1)
	local master =ReadRoleValue(own,EM_RoleValue_register3)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+88 )
	--local table = {498826,498830,498837,498828,499816}	
	--for i = 1 , #(table) do
	--	KS_ResetColdown( master , table[i] , 5 )
	--end	
	while 1 do
		sleep(10)
		SysCastSpellLv(own,tar,498827,skilllv)
	end
end

function bico_RangeSkill_623428()--步枷機關
	local own = OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )-- 抓到主人
	local x = ReadRoleValue(own,EM_RoleValue_X)
	local y = ReadRoleValue(own,EM_RoleValue_Y)
	local z = ReadRoleValue(own,EM_RoleValue_Z)
	local monster = CreateObj ( 106524 , x , y , z, 0 , 1)
	--local monster = LuaFunc_CreateObjByObj ( 106524 , own ) 
		SetModeEx(monster,EM_SetModeType_Mark,false)
		SetModeEx(monster,EM_SetModeType_Searchenemy,false)
		SetModeEx(monster, EM_SetModeType_Move, false)
		SetModeEx(monster,EM_SetModeType_Fight, false) 
		SetModeEx(monster,EM_SetModeType_Strikback, false) 
		SetModeEx(monster,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(monster,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(monster,EM_SetModeType_NotShowHPMP,true)           ---不顯示血條
	AddToPartition(monster,RoomID)
	WriteRoleValue(monster,EM_RoleValue_register1,Master)
	WriteRoleValue(monster,EM_RoleValue_Livetime,5)
	Beginplot(monster,"bico_RangeSkill_623428_1",0)

end
function bico_RangeSkill_623428_1()--步枷機關效果
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	local skilllv = ReadRoleValue( master , EM_RoleValue_MagicPowerLv_SP+90 )
	--local table = {498826,498830,498837,498828,499816}
	--for i = 1 , #(table) do
	--	KS_ResetColdown( master , table[i] , 5 )
	--end
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,498832,skilllv)
	end
end

function bico_RangeSkill_498828() --翼足機關--對應質能傳導回饋
	local own = OwnerID()
	local table = {498826,498830,498837,499816}
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	--SetPlot( tar,"range","",0 )
	for i = 1 , #(table) do
		KS_ResetColdown( Master , table[i] , 5 )
	end
	SetPlot( OwnerID(),"range","bico_RangeSkill_498828_1",20 ) --觸發35碼
end
function bico_RangeSkill_498828_1() --翼足機關1--此時的「OwnerID」是指玩家，「TargetID」是翼足機關--對應質能傳導回饋
	local tar = TargetID()
	local point = ReadRoleValue(tar,EM_RoleValue_register1)
	local own = OwnerID()
	SysCastSpellLv(tar,own,498829,0)
	sleep(5)
	WriteRoleValue(tar,EM_RoleValue_register1,point+1)
	point = ReadRoleValue(tar,EM_RoleValue_register1)
	--say(tar,"point = "..point)
	if point == 6 then
		delobj(tar)
	end
	BeginPlot(tar , "un_RangeSkill_498828" , 0)
end

function bico_trapcooldown() --lv60質能傳導回饋判斷--埋葬機關
	local own = OwnerID()
	--local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	local table = {498826,498830,498837,498828,499816}
	for i = 1 , #(table) do
	KS_ResetColdown(own , table[i] , 5 )
    end
	return true
end

--法靈lv 70
function bico_firecri_check1(result)
	local own = OwnerID()
	local tar = TargetID()
	--say(own,"hi")
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+112 )
	if result == 2 then
	addbuff(tar,623436,powerLV,10)
	end
end

--法匠 lv 70
function bico_623445_check()
	local own = OwnerID()
	if CheckBuff(own,621634) == false then
	Cancelbuff(own,623444)
	end	
end

--祭匠 lv 70
function bico_622994_addbuff()--光之聯繫
	local own = OwnerID()
	local tar = TargetID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+102 )
	Addbuff(tar,623068,powerLV,2)
	Addbuff(own,622622,powerLV,2)
end

--祭靈 lv 60
function bico_623175_Check()--空間之躍(498628)
	local OID = OwnerID()
	local TID = TargetID()
	--local TID = {}
	--TID = SearchRangePlayer( OwnerID() , 180 )
--for i = 0 , #(TID)-1 do 
	if ReadRoleValue( TID, EM_RoleValue_IsNPC ) == 1 then
		if GetModeEx(TID,EM_SetModeType_Strikback)==false or GetModeEx(TID,EM_SetModeType_Move)==false then--不反擊or不移動的物件無效
			return;
		end
		local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		for i=1, 5 do
			if GameObjInfo_Int( OrgID, "AvoidMagicType"..i ) == 101 then
				return;
			end
		end
	end
--end
	local Dis = 0
	local PosX = ReadRoleValue( OID, EM_RoleValue_X )
	local PosY = ReadRoleValue( OID, EM_RoleValue_Y )
	local PosZ = ReadRoleValue( OID, EM_RoleValue_Z )
	local PosDir = ReadRoleValue( OID, EM_RoleValue_Dir )
	local radian = (math.pi/180)*( PosDir )--徑度
	PosX = PosX +(Dis*math.cos(radian))
	PosZ = PosZ -(Dis*math.sin(radian))
	PosY  = GetHeight( PosX, PosY, PosZ )
	--for i = 0 , #(TID)-1 do
	SetPos( TID, PosX, PosY, PosZ, PosDir )
	--end
end

--影匠lv 70
function bico_623471_strick()
	local own = OwnerID()
	local tar = TargetID()
	--local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_Normal+1 )
	addbuff(tar,621166,0,10)
end

function lua_bico_targetisfaile_notself()
	local own = OwnerID()
	local tar = TargetID()
	if own == tar then
--	KS_ScriptMessage("[SYS_CASTSPELL_TARGET_ERROR]")
	ScriptMessage( own, own, 1, "[SYS_CASTSPELL_TARGET_ERROR]", "|cffff0000" )
	return false
	else
	return true
	end
end

function bioc_Shutdown_debuff()
	local own= OwnerID()
	SysCastSpellLv( own, own, 499849,0 )
end

function bico_499816() --電刑機關招換物
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)    --播放攻擊動作
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
	local table = {498826,498830,498837,498828}
	for i = 1 , #(table) do
		KS_ResetColdown( Master , table[i] , 5 )
	end
	sleep(10)
	--KS_ResetColdown( Master , 499816 , 5 )
local own = OwnerID()
	while 1 do
		SysCastSpellLv(own,own,499815,0)
		sleep(10)
	end
end