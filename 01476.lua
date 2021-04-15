--------------------------------------------------------------------------------------------------------------------------
-- 種植四階npc (6.0.4)  [開放 新的盆栽, 種子, 等級開放81-100 ]
-- 四階第二階段 開放91級 盆栽, 種子, 灌溉物品  (與Z30一同開放)
-- 四階第三階段 開放97級 盆栽, 種子  (與Z33一同開放)

function luaN_plantnpc_level4_0() -- 四階NPC初始對話
	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Plant )   --玩家目前種植等級
	local Key = CheckFlag( Player , 543535 )  -- 檢查是否已有種植-傳奇資格(等級上限100)
	local shopkey = CheckFlag(Player, 543610)  -- 檢查是否有KEY - 開放種植兌換商店

--	local PlantShop = 600353 	-- 6.0.4 開放 - 85級 盆栽, 種子   ==================  600353	
	local PlantShop = 600354	 --Z30 - 91級 盆栽, 種子, 灌溉物品 
--	local PlantShop =  600355 	-- Z33 -  97級 盆栽, 種子


	CloseShop( TargetID() )
	AdjustFaceDir( TargetID() , Player , 0 )

	if Key == true then	-- 已取得種植傳奇
		SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_4]" )  -- 你好，我的朋友，今天想種哪些植物啊？
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop..")", 0 ) --購買種子
		if shopkey == true then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_7]", "luaN_plantnpc_level4_2", 0 ) --我要兌換物品
		end
	else	-- 未取得種植傳奇
		if Lv == 80 then
			SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_2]" )  -- 達80級對話
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MARRY_15]", "luaN_plantnpc_level4_1", 0 ) -- 是的，我願意。
		else
			SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_1]" )  -- 未達種植80級時
		end
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop..")", 0 ) --購買種子
	end
end

-- 四階npc 取得資格
function luaN_plantnpc_level4_1() 
	CloseSpeak( OwnerID())
	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	Setflag(OwnerID() , 543535 , 1 )  --給予 種植-傳奇資格
	Setflag(OwnerID() , 543610 , 1 )  --給予	開放種植兌換商店
	CastSpell( OwnerID() , OwnerID() , 491010 )
	PlayMotion( TargetID() , 102 )
	sleep(5)
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_LV4_5]", C_SYSTEM ) --你已取得種植傳奇資格。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_LV4_6]", C_SYSTEM ) --訊息視窗訊息：你已取得種植傳奇資格，種植等級上限提升為100級。
	Tell(OwnerID(), TargetID(), "[SC_PLANT_LV4_3]")   -- ( 受話者, 發話者)  npc對玩家悄悄話
end

function luaN_plantnpc_level4_2()
	SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_8]" )  --  兌換對話
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_9]", "luaN_plantnpc_level4_3(1)", 0 ) --我要以[205084]兌換魔法灌溉藥劑包
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_10]", "luaN_plantnpc_level4_3(2)", 0 ) --我要以[205085]兌換魔法灌溉藥劑包
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_11]", "luaN_plantnpc_level4_3(3)", 0 ) --我要以[205086]兌換魔法灌溉藥劑包
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_12]", "luaN_plantnpc_level4_4", 0 ) -- 我要兌換綠意夥伴寵物箱
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_13]", "luaN_plantnpc_level4_5", 0 ) --我要兌換幸福滿盈盆栽箱 
end

-- 我要以[xxx]兌換魔法灌溉藥劑包
function luaN_plantnpc_level4_3(number)
	local needitem ={205084, 205085, 205086}
	local itemcount = CountBodyItem(OwnerID(), needitem[number] )
	local needcount = 10

--	say(OwnerID(), "Needitemid ="..needitem[number].." , number = "..number)
	if itemcount <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- 你持有的物品數量不足喔！
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[number], needcount )
		GiveBodyItem(OwnerID(), 243036, 1)  -- 魔法灌溉藥劑包
	end
end

-- 我要兌換綠意夥伴寵物箱
function luaN_plantnpc_level4_4()
	local needitem ={205084, 205085, 205086}
	local itemcount1 = CountBodyItem(OwnerID(), needitem[1] )
	local itemcount2 = CountBodyItem(OwnerID(), needitem[2] )
	local itemcount3 = CountBodyItem(OwnerID(), needitem[3] )
	local needcount = 5

--	say(OwnerID(), "itemcount 1 ="..itemcount1.." , itemcount 2 = "..itemcount2..", itemcount 3 = "..itemcount3 )
	if itemcount1 <= needcount or itemcount2 <= needcount or itemcount3 <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- 你持有的物品數量不足喔！
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[1], needcount )
		DelBodyItem(OwnerID(), needitem[2], needcount )
		DelBodyItem(OwnerID(), needitem[3], needcount )
		GiveBodyItem(OwnerID(), 243038, 1)  -- 綠意夥伴寵物箱
	end
end

-- 我要兌換幸福滿盈盆栽箱
function luaN_plantnpc_level4_5()
	local needitem ={205084, 205085, 205086}
	local itemcount1 = CountBodyItem(OwnerID(), needitem[1] )
	local itemcount2 = CountBodyItem(OwnerID(), needitem[2] )
	local itemcount3 = CountBodyItem(OwnerID(), needitem[3] )
	local needcount = 10

--	say(OwnerID(), "itemcount 1 ="..itemcount1.." , itemcount 2 = "..itemcount2..", itemcount 3 = "..itemcount3 )
	if itemcount1 <= needcount or itemcount2 <= needcount or itemcount3 <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- 你持有的物品數量不足喔！
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[1], needcount )
		DelBodyItem(OwnerID(), needitem[2], needcount )
		DelBodyItem(OwnerID(), needitem[3], needcount )
		GiveBodyItem(OwnerID(), 243037, 1)  -- 幸福滿盈盆栽箱
	end
end
					
--------- 兌換物品內容 ------

-- 魔法灌溉藥劑包 243036
function LuaI_243036()
	local itemset  = {  4 ,"" , { 203881 , 1 },	
			  14, ""	, { 203884 , 1 },
			  20 ,""	, { 243017 , 1 },
			  25 ,""	, { 203881 , 2 },
			  32 ,""	, { 203884 , 2 },
			  35 ,""	, { 243017 , 2 },
			  36 ,""	, { 203881 , 3 },
			  39 ,""	, { 203884 , 3 },
			  40 ,""	, { 243017 , 3 },
			  55 ,""	, { 208623 , 15 },
			  70 ,""	, { 208622 , 15 },
			  80 ,""	, { 208623 , 20 },
			  90 ,""	, { 208622 , 20 },
			  95 ,""	, { 208623 , 30 },
			  100 ,"", { 208622 , 30 },
			}

	return BaseTressureProc(   itemset , 1  )
end						

-- 幸福滿盈盆栽箱 243037
function LuaI_243037()
	local itemset  = {  14 ,"" , { 203901 , 1 },	
			  28 ,""	, { 204241 , 1 },
			  42 ,""	, { 204244 , 1 },
			  56 ,""	, { 203903 , 1 },
			  70 ,""	, { 204245 , 1 },
			  84 ,""	, { 203907 , 1 },
			  88 ,""	, { 203910 , 1 },
			  92 ,""	, { 204257 , 1 },
			  96 ,""	, { 203893 , 1 },
			  100 ,"" , { 206181 , 1 }	
			}

	return BaseTressureProc(   itemset , 1  )
end

-- 綠意夥伴寵物箱 243038
function LuaI_243038()
	local itemset  = {  8 ,"" , { 243034 , 1 },	
			  16 ,""	, { 243035 , 1 },
			  40 ,""	, { 203210 , 1 },
			  64 ,""	, { 203211 , 1 },
			  82 ,""	, { 243032 , 1 },
			  100 ,"", { 243033 , 1 }
			}

	return BaseTressureProc(   itemset , 1  )
end

-- 測試指令

-- 獲得1~80級 種植重要物品
function mika_PlantSkill_test1()
	local key = {542886, 542887, 542888, 542889 }
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 1)
	end
	say(OwnerID(), "1 -80 keyget ok ")
end

-- 獲得1~100級 種植重要物品 & 商店開放資格
function mika_PlantSkill_test2()
	local key = {542886, 542887, 542888, 542889, 543535 , 543610}
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 1)
	end
	say(OwnerID(), "1 -100 keyget ok ")
end

-- 清除 1~100級 種植重要物品 & 商店開放資格
function mika_PlantSkill_test3()
	local key = {542886, 542887, 542888, 542889, 543535 , 543610}
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 0)
	end
	say(OwnerID(), "delete ok")
end