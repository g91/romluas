function FN_Skill_BattleStyle()	--兩種變身狀態的時間到處理
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)

	WriteRoleValue( own, EM_RoleValue_SoulPoint, 0)
	--------一般影響

	--------精英技能影響
	--靈/影
	if MainClass == 9 and SubClass == 3 and CheckFlag( own, 545890 ) == true then 
		WriteRoleValue( own, EM_RoleValue_SoulPoint, 1)
	end
	return true
end

--增加靈能點的判斷，掛在基本法術的結果LUA 檢查
function Add_SoulP_1()	--增加 1 點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+1)	
	end
end

function Add_SoulP_2()	--增加 2 點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+2)	
	end
end

function Add_SoulP_3()	--增加 3 點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+3)	
	end
end
function Add_SoulP_6()	--增加 6 點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+6)	
	end
end
function Add_SoulP_10()	--增加 10 點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	
	if CheckBuff(own, 501571) == FALSE and CheckBuff(own, 501572) == FALSE then
		WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+10)	
	end
end

function Add_SoulP_1_1()	--增加 1 點 狀態內也可加點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+1)	
end

function Add_SoulP_2_2()	--增加 2 點 狀態內也可加點
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, SoulP+2)	
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------

function un_skill_498556()  --趁虛而入影響凝心打擊(498545)以及惑心謎題(498553)
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV

	--------本職技能強化
	--趁虛而入(498556)
	powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+18 )
	--say(own,"plv = "..powerLV)
	if powerLV ~= 0 and CheckBuff(tar,501577) == true and CheckBuff(own,621281)==false then
		AddBuff(own,621281,powerLV,-1)
	end
	return TRUE
end

function un_skill_497957_1()  --靈能箭、曲速衝擊、耗弱織咒時傷害的額外效果表----靈/祭
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)	----靈/戰
	if MainClass == 9 and SubClass == 1 then
		--調息(498634)
		local RandNum = DW_Rand(100)
		if CheckFlag(own,545883) == TRUE and RandNum <= 20 then	
			 Lua_CDtime_set(own,498639,0)
		else
			DebugMsg( own , RoomID , "set CoolDown fail")
		end
	end
	----靈/祭
	if MainClass == 9 and SubClass == 5 then
		--機緣治療(498633)
		if CheckFlag( own, 545904 ) == true and DW_Rand(4) == 1 then 
			GiveBodyItem( own, 546056, 1 )
			addbuff(own,621324,0,-1)
		end
	end
	return TRUE
end

function un_skill_497958()	--曲速衝擊的額外效果表
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV = 0
	--------本職技能強化
	--耗弱狀態強化傷害
	powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+2 )
	if CheckBuff(tar,501577) == true then
		AddBuff(own,501588,powerLV,-1)
	end
	--------精英技能強化
	----靈/戰
	
	return TRUE
end

function un_skill_497959()	--耗弱織咒的額外效果表
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV
	--------本職技能強化
	--------精英技能強化
	----靈/戰
	if MainClass == 9 and SubClass == 1 then
		--調息(498634)
		--powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+22 )
		local RandNum = DW_Rand(100)
		if CheckFlag(own,545883) == TRUE and RandNum <= 20 then
			
			 Lua_CDtime_set(own,498639,0)
		end
	end
	return TRUE
end
function un_RangeSkill_498542() --心念屏障
	local OwnerID = OwnerID()
	addbuff(OwnerID,621202,0,-1)
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+6 ) --+12是讀取主職專屬的職業列表
	for i= 1 , 5 do
		SysCastSpellLv(OwnerID,OwnerID,498543,powerLV)
		sleep(20)
	end
end	
function un_skill_498544() --無情宣判
	local tar = TargetID()  --怪本身
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+7 )  --+12是讀取主職專屬的職業列表
	sleep(5)
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --賸餘HP百分比
	--say(own,"hp ="..nowhp)
	if powerLV >=50 then
		powerLV = 50
	end
	if nowhp<20 then
		addbuff(own,621199,powerLV,20)
	end
end
function un_skill_498545() --失衡打擊
	local tar = TargetID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --賸餘HP百分比
	--say(tar,"hp = "..nowhp)
	if nowhp >70 then
		return true
	else
		return false
	end
end

function un_skill_497964() --心靈苦痛的額外效果表
	local tar = TargetID()
	local own = OwnerID()
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local powerLV
	--------精英技能強化
	----靈/戰
	if MainClass == 9 and SubClass == 1 then
		--心體合一(498636)
		powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+28 )
		if CheckFlag(own,545887) == TRUE then
			AddBuff(own,621327,powerLV,-1)
		end
	end
	return TRUE
end
----------------------------------------------------------------------------------------精英技能
----靈/祭
function un_skill_498633() --刪除緊急回復術瞬發旗標
	local own = OwnerID()
	SetFlag( own, 546056, 0 )
	if CheckBuff(own, 621324) == TRUE then
		 CancelBuff( own, 621324 )
	end
end

function un_skill_498644_check() --靈魂激流 讓緊急回復術變為瞬發
	local own = OwnerID()
	local Type  = GameObjInfo_Int( 498644 , "ColdownType" )	-- 抓這個法術的次分類冷卻類別
	if ReadRoleValue( own , EM_RoleValue_Coldown_Job + Type ) == 0 then	--如果這個法術在CD中，就不會給予增強Buff
		addbuff(own,621322,0,-1)	--因為變瞬發 強化靈魂激流的傷害
	end
	return true
end

function un_skill_498644()	--靈魂激流 緊急回復術瞬發
	local own = OwnerID()
	local x = DW_rand(4)
	if x ==1 then
		SetFlag( own, 546056, 1 )
		addbuff(own,621324,0,-1)
	end	
end

function un_skill_498648() --心境庇護 緊急回復術有18%機率重置舒心之環的冷卻時間
	Lua_CDtime_set(OwnerID(),498641,0)
end

function un_skill_498663() --信念之觸重置CD用
local own = OwnerID()
local Pos = Lua_BuffPosSearch( own , 621330 )                      ---------------------抓出身上的法術代號
local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
local x = DW_rand(2) --50%機率觸發
	if x == 1 then
		addbuff(BuffOwner,621394,0,-1)
		SetFlag( BuffOwner, 541860, 1 ) --給靈能箭瞬發旗標
		Lua_CDtime_set(BuffOwner,498644,0)  --重置激流衝擊CD時間
	end
end

function un_skill_498666() --靈能箭瞬發 刪除旗標
	local own = OwnerID()
	Add_SoulP_1()
	SetFlag( own, 541860, 0 )
	CancelBuff( own, 621394 )
end

function un_skill_498786()
	local own = OwnerID()
	SetFlag( own, 541860, 0 )
	return true
end

function un_skill_498668() --神來一筆觸發靈感
	local own = OwnerID()
	local bufflv = FN_CountBuffLevel(own,621398) --讀取buff層數
	--say(own,"buff = "..bufflv)
	if bufflv == 6  then 
		Lua_CDtime_set(own,498777,0)
		CancelBuff( OwnerID(), 621398 )
		return false
	end	
end
----靈/戰
function FN_skill_498637()	--靈能箭 被心體合一強化
	local tar = TargetID()
	local own = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)

	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage+20))
	return TRUE
end

function FN_skill_498642()	--意念流轉
	local Player = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local SoulPoint = ReadRoleValue(Player, EM_RoleValue_SoulPoint)
	local Add

	Add = Math.floor(Rage/35)
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-Add*35))
	WriteRoleValue(Player, EM_RoleValue_SoulPoint, (SoulPoint+Add))
end

function FN_skill_498645()	--劃心為籬
	local Player = OwnerID()
	local Target = TargetID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local AddTime = Math.floor(Rage/20)
	
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-20*AddTime))
	AddBuff(Target, 621321, 0, 2+AddTime)
end

function FN_skill_498646_end()	--貫心擊
	local Player = OwnerID()
	local Tar = TargetID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local powerLV = ReadRoleValue( Player , EM_RoleValue_MagicPowerLv_normal+1 )

	if CheckBuff(Tar, 501577) == TRUE then
		--Say(Player, "powerLV="..powerLV)
		AddBuff(Tar, 501577, powerLV, 15)
		WriteRoleValue(Player, EM_RoleValue_SP_Sub, 100)
	end
end

---------------------------------------------靈/影

function un_skill_498695()
	local own = OwnerID()
	local PartyNum = GetPartyID( own, -1 )
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+34 )

	for i=1,PartyNum do
		local PartyMember = GetPartyID( own, i )
		if checkbuff(PartyMember,621432) == false then
			AddBuff(PartyMember, 621433, powerLV, 10)
		end
	end
end

function un_skill_498699_check()	--終結意念
	local own = OwnerID()
	local tar = TargetID()
	--Say(own,"1")
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --HP百分比
	if nowhp <= 35 then
		--Say(own,"2")
		AddBuff(own, 621436, 0, 4)
	end
end

function un_skill_498699() --終結意念
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	WriteRoleValue( own, EM_RoleValue_SoulPoint, (SoulP+1))
end

function un_skill_498700() --罪與罰
	
	local own = OwnerID()
	local tar = TargetID()
	local skilllv = 0     --buff層數
	local powerLV
	local buff = {621188,621701,621399} --要判斷的3個buff
	local Spell = {498557,498559,498782} --要施展的3個技能
	local MagicPowerLv = { EM_RoleValue_MagicPowerLv_normal, EM_RoleValue_MagicPowerLv_normal, EM_RoleValue_MagicPowerLv_SP }
	local MagicPowerPos = { 4, 0, 29 }

	if CheckBuff(own, 501571) == false then
		return false
	end

	for i = 1, 3 do
		if  checkbuff(tar,buff[i]) == true then
			powerLV = ReadRoleValue( own , MagicPowerLv[i]+MagicPowerPos[i] )
			SysCastSpellLv(own,tar,Spell[i],powerLV) --心靈苦痛
			skilllv = skilllv + 1
		end
	end
	if skilllv > 0 then  --層數有一層以上才放
			addbuff(own, 621441, (skilllv-1), 4) --增加法傷的buff
	end
	return true
end

--function un_skill_498700() --罪與罰
--	
--	local own = OwnerID()
--	local tar = TargetID()
--	local skilllv = 0     --buff層數
--	local powerLV
--	local buff = {621188,621701,621399} --要判斷的3個buff
--	for i= 1 , 3 do
--		if checkbuff(tar,buff[i]) == true then
--			if buff[i] == buff[1] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+0 )
--				--say(own,"skill1"..powerLV)
--				SysCastSpellLv(own,tar,498557,powerLV) --心靈苦痛
--			elseif buff[i] == buff[2] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+4 )
--				--say(own,"skill2"..powerLV)
--				SysCastSpellLv(own,tar,498559,powerLV) --感知搾取
--			elseif buff[i] == buff[3] then
--				powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+29 )
--				--say(own,"skill3"..powerLV)
--				SysCastSpellLv(own,tar,498782,powerLV) --心靈毒牙
--			end
--			--say(own,"buff = "..powerLV)
--			skilllv = skilllv+1
--		end
--	end
--		
--	if skilllv>0 then  --層數有一層以上才放
--			addbuff(own,621441,skilllv,-1) --增加法傷的buff
--	end
--	return true
--end----靈/工
function FN_skill_498650_add5()	--薩瑟斯的怒火(執行劇情)
	AddBuff(OwnerID(), 621331, 4, -1)
end

function FN_skill_498650()	--薩瑟斯的怒火(消除狀態)
	local Player = OwnerID()
	local Tar = TargetID()
	local BuffLV = FN_CountBuffLevel(Tar,621331)

	CancelBuff(Tar, 621331)
	if BuffLV == 0 then
		return
	else
		AddBuff(Tar, 621331, BuffLV-1, -1)
	end

end

function FN_skill_500279()	--薩瑟斯的怒火(定時檢查)
	if FN_CountBuffLevel( OwnerID() , 621331 ) < 0 then	--若身上的BuffLV < 0，則直接關閉
		CancelBuff( OwnerID() , 621331 )
	end
end

function FN_skill_498676()	--思緒奔放
	local Player = OwnerID()
	local Tar = TargetID()
	local Focus = ReadRoleValue(Player, EM_RoleValue_SP)

	CancelBuff(Tar, 621190)
	WriteRoleValue(Player, EM_RoleValue_SP, Focus+35)
end

----靈/法
function Skill_lua_498701()	--曲速閃燃
	local own = OwnerID()
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_Normal+2 )

	SysCastSpellLv( own, own, 498702, powerLV)
end

function Skill_Lua_498711_check()	--思緒超載
	local Player = OwnerID()
	local Focus = ReadRoleValue(Player, EM_RoleValue_SP)
	local MaxFocus = ReadRoleValue(Player, EM_RoleValue_MaxSP)

	if Focus == MaxFocus then
		return TRUE
	end
	return FALSE
end

function Skill_Lua_498710_ReSetCD()	--烙魂釘刺
	local own = OwnerID()
	Lua_CDtime_set(own,498697,0)
end

------------------------------------戰/靈
function un_skill_498706() --怒靈重擊
local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_AttackTargetID)
	local Targ=ReadRoleValue(tar,EM_RoleValue_AttackTargetID) --目標的攻擊目標

	if Targ == own then
		
		--say(OWnerID(),"1")
		return true
	else
		--say(OWnerID(),"2")
		return false
	end
end
function un_skill_498706_2() --怒靈重擊
local own = OwnerID()
	local tar = ReadRoleValue(own,EM_RoleValue_AttackTargetID)
	local Targ=ReadRoleValue(tar,EM_RoleValue_AttackTargetID) --目標的攻擊目標

	if Targ == own then
		
		--say(OWnerID(),"1")
		return false
	else
		--say(OWnerID(),"2")
		return true
	end
end
function un_skill_498735() --靈能戰吼81
	local own = OwnerID()
	if checkbuff( own, 621478 ) == true then  
		local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+81 )
		SysCastSpellLv(own,own,498736,powerLV)
	end
end
function un_skill_498739() --靈能鬼步
	cancelbuff(OwnerID(),621477)
	return true
end
function un_RangeSkill_498742() --靈刃風暴
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)
	addbuff(OwnerID,621499,0,-1)
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+85 ) --+12是讀取主職專屬的職業列表
	for i= 1 , 6 do
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498743 , powerLV )
		sleep(10)
	end
end	
------------------------------------祭/符
function FN_skill_498612_HPcheck()	--癒心符能 被迅癒強化
	local tar = TargetID()
	local hp = ReadRoleValue(tar,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(tar,EM_RoleValue_MaxHP)
	local nowhp = (hp / maxhp) *100 --HP百分比
	
	if nowhp <=40 then
		return TRUE
	end
	return FALSE
end

function FN_skill_498620()	--創生信標
	local own = OwnerID()
	local tar = ReadRoleValue(own, EM_RoleValue_Register10)
	--Say(own, "OwnerID")
	--Say(own, "TargetID="..tar)
	--Say(tar, "TargetID")
	if ReadRoleValue(own, EM_RoleValue_Register10) == 0 then
		local PartyNum = GetPartyID(own , -1)
		local TempID
		--Say(own, "1")
		--
		for i=1,PartyNum do
			TempID = GetPartyID(own , i)
			local Pos = Lua_BuffPosSearch( TempID , 620489 )
			local BuffOwner = BuffInfo( TempID , Pos , EM_BuffInfoType_OwnerID )  
			--
			if CheckBuff(TempID, 620489) == TRUE and BuffOwner == own then
				--Say(TempID, "TempID is me")
				tar = TempID
				WriteRoleValue(own, EM_RoleValue_Register10, tar)
			end
		end
	else
		--Say(own, "3")
		tar = ReadRoleValue(own, EM_RoleValue_Register10)
	--	Say(tar, "tar is me")
	end
	------
	--Say(own, "4")
	local powerLV = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+88 )
	SysCastSpellLv( own, tar, 498622, powerLV )
	--Say(own, "5")
end

function FN_skill_498620_cleanRegister()
	local own = OwnerID()

	WriteRoleValue(own, EM_RoleValue_Register10, 0)
end

function FN_lua_Skill_498614()	--護佑符印
	local own = OwnerID()

	if CheckBuff(own, 621548) == FALSE then
		CancelBuff(own, 621549)
		return TRUE
	end

	local Pos = Lua_BuffPosSearch( own , 621548 )                      		--抓出身上的法術代號
	local BuffOwner = BuffInfo( own , Pos , EM_BuffInfoType_OwnerID )	--抓出此法術是誰放的
	local Ran = DW_Rand(100)

	if Ran <= 12 then
		Lua_CDtime_set(BuffOwner,498612,0)
	end
	return TRUE
end
function Dy_newhpcheck() --法術集合的血量檢查
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
	if HPPercent < 5 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_18]" , 1 )
		return false
	else
		return true
	end	
end	
function Un_skill_499869()	--強化意念流轉
	local Player = OwnerID()
	local Rage = ReadRoleValue(Player, EM_RoleValue_SP_Sub)
	local SoulPoint = ReadRoleValue(Player, EM_RoleValue_SoulPoint)
	local Add

	Add = Math.floor(Rage/20)
	WriteRoleValue(Player, EM_RoleValue_SP_Sub, (Rage-Add*20))
	WriteRoleValue(Player, EM_RoleValue_SoulPoint, (SoulPoint+Add))
end	

function YoYo_Skill_501573_EndUse()	--2014/05/26修改：使用後會解除工匠的"連鎖驅動"狀態
	Add_SoulP_1()	--給予1點靈能點
	Cl_ArtisanSkillChackBuff()	--解除"連鎖驅動"狀態
end