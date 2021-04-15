---------南瓜節幸運禮盒----------------------------------------------------------------------------------
function LuaI_206812()

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM_1][$SETVAR1="..RoleName.."][$SETVAR2=[206812]][$SETVAR3=[203229]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM_1][$SETVAR1="..RoleName.."][$SETVAR2=[206812]][$SETVAR3=[203274]]"
	local itemset = { }

	itemset = {	2 , Prize1Str 	, { 203229 , 1 } , --永久南瓜寶寶寵物蛋		機率	2/ 100
			4 , Prize2Str 	, { 203274 , 1 } , --永久南瓜怪寵物蛋		機率	2/ 100
			7 , "" 		, { 206238 , 1 } , --30天搗蛋3000坐騎		機率	3/ 100
			12 , "" 		, { 203878 , 1 } , --極效清除負債券		機率	5/ 100
			20 , "" 		, { 203877 , 1 } , --強效清除負債券		機率	8/ 100
			30 , "" 		, { 240741 , 1 } , --南瓜派禮盒			機率	10/ 100
			40 , "" 		, { 240742 , 2 } , --美味南瓜燉飯			機率	10/ 100
			 55, "" 		, { 240525 , 3 } , --七彩棒棒糖			機率	15/ 100
			 70, "" 		, { 240524 , 3 } , --牛奶夾心糖			機率	15/ 100
			 100, "" 	, { 207963 , 3 } } --公會資源包			機率	30/ 100

	return BaseTressureProc(   itemset , 1 )
end
----------南瓜節獎勵兌換員-----------------------------------------------------------------------------------
function Lua_ying_Pumpkin_119980speak()


	local Player = OwnerID()
	local NPC = TargetID()

	AdjustFaceDir( NPC , Player , 0 ) --NPC面向玩家
	SetSpeakDetail( Player , "[SC_PUMPKIN_2011_1]" ) --冒險者，你好～我是南瓜節活動獎勵兌換員！ 
	AddSpeakOption( Player , NPC , "[SC_111490_DIALOG1]" , "LuaS_111490_1", 0 )  -- 我想了解南瓜節的由來 
	AddSpeakOption( Player , NPC , "[SC_PUMPKIN_2012_01]" , "Lua_ying_Pumpkin_119980speak2(".."119980"..")", 0 ) -- 我想用20個[209433]兌換些特別的...
	AddSpeakOption( Player , NPC , "[SC_PUMPKIN_2012_02]" , "Lua_ying_Pumpkin_119980speak2(".."1199801"..")", 0 ) -- 我想用20個[209433]兌換些特別的...
end
--------我想兌換獎勵-------------------------------------------------------------------------------------------
function Lua_ying_Pumpkin_119980speak2(Num)

	local Player = OwnerID()
	local NPC = TargetID()
	local Count = CountBodyItem( Player , 209433 ) --檢查南瓜硬幣
	local Itemset = {}
	local NpcID = { 119980 , 1199801 }	-- 南瓜節Npc ID	119980 = 選擇2011年獎勵、1199801 = 選擇2012年獎勵
	local Random
	local Status = 0
	local Sex = ReadRoleValue( Player , EM_RoleValue_Sex )	-- 性別
	local Costume

	if Num == NpcID[1] then
		if Count < 10 then
			SetSpeakDetail( Player , "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			if Check_Bag_Space( Player , 1 ) == false then
				SetSpeakDetail( Player , "[SC_CHANGEGOOD_1_2]" ) -- 您的背包空間不足，請清理一下再來吧。
				return false
			else	
				SetSpeakDetail ( Player , "[SC_111490_DIALOG8]" ) --祝您南瓜節快樂！
				GiveBodyItem( Player , 206812 , 1 ) --給予南瓜節幸運禮盒
				DelBodyItem( Player , 209433 , 10 )
				PlayMotion( Npc , 106 ) -- 點頭
				DesignLog( Player , Num , "Accept" )
			end
		end
	elseif Num == NpcID[2] then
		if Count < 20 then
			SetSpeakDetail( Player , "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			if Check_Bag_Space( Player , 2 ) == false then
				SetSpeakDetail( Player , "[SC_CHANGEGOOD_1_2]" ) -- 您的背包空間不足，請清理一下再來吧。
				PlayMotion( Npc , 107 )	-- 搖頭
				return false
			else
				if Sex == 0 then	-- 男性
					Costume = 241847	-- 攝魂魔丑驚喜禮盒
				else			-- 女性
					Costume = 241848	-- 攝魂魔丑驚喜禮盒
				end
			
			--	itemset[1]  = {	30	,	{ 725649 , 1 } ,		-- 能力藥水
			--			40	,	{ 726135 , 1 } ,		-- 公會大型工具箱
			--			50	,	{ 201141 , 1 } ,		-- 菲尼克斯的救贖
			--			75	,	{ 201139 , 1 } ,		-- 大天使的救贖
			--			80	,	{ 241845 , 1 } ,		-- 愛搞怪裝飾包
			--			95	,	{ 241846 , 1 } ,		-- 小搗蛋夥伴包
			--			100	,	{ Costume , 1 }	}	-- 攝魂魔丑驚喜禮盒
			--   2013獎勵，請遮掉上面的部分
				itemset[1]  = {	15	,	{ 242521 , 1 } ,		-- 星屑裝備鍛造包
						25	,	{ 242514 , 1 } ,		-- 潛能護符包
						40	,	{ 242517 , 1 } ,		-- 風之元素材料包
						50	,	{ 201141 , 1 } ,		-- 菲尼克斯的救贖
						75	,	{ 201139 , 1 } ,		-- 大天使的救贖
						80	,	{ 241845 , 1 } ,		-- 愛搞怪裝飾包
						95	,	{ 241846 , 1 } ,		-- 小搗蛋夥伴包
						100	,	{ Costume , 1 }	}	-- 攝魂魔丑驚喜禮盒


						
				itemset[2] = { 3 , 241460 , 1 }	-- 天秤幻獸結晶
				itemset[3] = { 241479 , 15 }	-- 暴風元素*15
				
				Random = rand(100)
				for i = 1 , #(itemset[1]) , 2 do
					if Random < itemset[1][i] and Status == 0 then
						for j = 1 , #(itemset[1][i+1]) , 2 do
							GiveBodyItem( Player , itemset[1][i+1][j] , itemset[1][i+1][j+1] )
							Status = 1
						end
					--	DebugMsg( Player , 0 , "Random = "..Random.." itemset = "..itemset[1][i].." Status = "..Status )
					end
				end
				
				Random = rand(100)
			--	DebugMsg( Player , 0 , "Random2 = "..Random.." itemset = "..itemset[2][1] )
				if Random < itemset[2][1] then
					GiveBodyItem( Player , itemset[2][2] , itemset[2][3] )
				end				
				GiveBodyItem( Player , itemset[3][1] , itemset[3][2] )
				SetSpeakDetail( Player , "[SC_111490_DIALOG8]" ) -- 祝您南瓜節快樂！
				DelBodyItem( Player , 209433 , 20 )
				PlayMotion( Npc , 106 ) -- 點頭
				DesignLog( Player , Num , "Accept" )
			end
		end
	end
end

function lua_KORS_hollowen_itemgive()
local OID = OwnerID()
local item ={240913,240914,240915,240928,240929,240930,240931,240932,240933,240934,240935,240936,240937,227539}
	for i = 1 , 14 do
		GiveBodyItem( OID , item[i] , 1)
	end
end