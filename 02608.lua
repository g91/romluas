

-------------------遊戲劇情--------------------------


------------------花粉的系列劇情------------------------
--丟掉花粉時觸發的刪除劇情
function lua_nehelia_flowerPow()
	local Player=OwnerID() 
		if CheckFlag( Player , 546161 ) == true then --判定旗標任務進行中C
			SetFlag ( Player , 546161 , 0 ) --關閉旗標C
			CancelBuff ( Player , 621944 ) --刪除蝴蝶
			CancelBuff ( Player , 621946 ) --2014/1/15 奈奈新增刪除物品會刪除玩家身上的捉蝴蝶技能
		 	ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_31]" , 0 ) --無法達成伊文的請求，任務失敗。
		end
end

--刪除種子劇情
function lua_nehelia_flowerseed()
	local Player=OwnerID() 
	local NPC = TargetID()
		if CheckFlag( Player , 546161 ) == true then --判定旗標任務進行中C
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_35]") --發生什麼事情了嗎？明明已經答應我了…
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_36]" , "lua_nehelia_flowerseed01", 0 )
		end
end

--放棄任務
function lua_nehelia_flowerseed01()
	local Player=OwnerID() 
			SetFlag ( Player , 546161 , 0 ) --關閉旗標C
		 	ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_31]" , 0 ) --無法達成伊文的請求，任務失敗。
			Closespeak( Player )			
end


--使用花粉的劇情---
function lua_nehelia_fPowUseing(intOBJ) 					--花粉灑在木頭上產生劇情。需輸入物品編號。
local Player = OwnerID()							
local WOOD = TargetID()
local pollen = intOBJ								--花粉的ID						
local CheckP = CheckBuff( Player , 621946)					--檢查玩家身上有無抓蝴蝶
local Tid = ReadRoleValue(WOOD,EM_RoleValue_OrgID)			--目標得原始ID
local  lock = ReadRoleValue(WOOD,EM_RoleValue_Register10)
local  Range = GetDistance(Player,WOOD)            
		if pollen  == 241040 then
			WriteRoleValue(Player,EM_RoleValue_Register2,1)
		elseif pollen== 241041 then
			WriteRoleValue(Player,EM_RoleValue_Register2,2)
		elseif pollen == 241042 then
			WriteRoleValue(Player,EM_RoleValue_Register2,3)
		end   
	if CheckP == FALSE and lock == 0 then
		if Tid == 120325 and Range <= 25 then			--當玩家身上沒有抓蝴蝶技能跟目標是WOOD的時候成功使用
			CastSpell(Player,WOOD,499117)
			AddBuff(Player,621946,1,-1)
			BeginPlot(WOOD,"lua_nehelia_fPowWood",0)
			WriteRoleValue(WOOD,EM_RoleValue_PID,Player)
		else
			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_32]" , 0 )--使用目標錯誤或施法距離太遠。
			return FALSE
		end
	elseif CheckP == FALSE and lock~=0 then
		ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_37]",0)--此[120325]正被其他人使用中。
		return FALSE
	elseif CheckP ==true then
		ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_38]",0)--已經出現[120321]，先捉取[120321]吧。
		return FALSE
	else									--其他狀況
		ScriptMessage( Player , Player , 1 ,"[EM_201167_3] " , 0 )		--目標錯誤。
		return FALSE
	end		
end


function lua_nehelia_fPowWood()						--蝴蝶產生用劇情，Owner為木頭
local OID = OwnerID()
local fly = {}
local Player = ReadRoleValue(OID, EM_RoleValue_PID)
local create = 0									--已產生數
local num 
	if CountBodyItem(Player,241040) >=1 then
		num =1
	elseif CountBodyItem(Player,241041) >= 1 then
		num = 2
	elseif CountBodyItem(Player,241042) >=1 then
		num = 3
	end
--2014/1/15 奈奈修改下列劇情
--		fly = Lua_CreateObjToRandownPos( OID, 120321 , 1 , 50 , true ) 	--隨機產生蝴蝶
--		SetModeEx( fly[1], EM_SetModeType_Show, true )			--顯示
--		SetModeEx( fly[1], EM_SetModeType_ShowRoleHead, true )		--頭像框
--		SetModeEx( fly[1], EM_SetModeType_Gravity , false )			--重力
--		SetModeEx( fly[1], EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
--		SetModeEx( fly[1], EM_SetModeType_Obstruct, false )			--阻擋
--		WriteRoleValue ( fly[1], EM_RoleValue_PID , Player ) 			--記住玩家
--		MoveToFlagEnabled(fly[1],FALSE)
--		AddBuff( fly[1] , 507594 , 7 , -1 )
--		BeginPlot(fly[1],"lua_nehelia_flowerAT2",0)
--		WriteRoleValue(OID,EM_RoleValue_Register10,1)
--		Say( fly[1] , "Create ="..create.. "& num ="..num)
		Sleep(20)

	while create < num do
		if fly[1] == nil or CheckID( fly[1] ) == FALSE then
	--		if create <num then
			fly = Lua_CreateObjToRandownPos( OID, 120321 , 1 , 50 , true ) 	--隨機產生蝴蝶
			SetModeEx( fly[1], EM_SetModeType_Show, true )			--顯示
			SetModeEx( fly[1], EM_SetModeType_ShowRoleHead, true )		--頭像框
			SetModeEx( fly[1], EM_SetModeType_Gravity , false )			--重力
			SetModeEx( fly[1], EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
			SetModeEx( fly[1], EM_SetModeType_Obstruct, false )			--阻擋
			WriteRoleValue ( fly[1], EM_RoleValue_PID , Player ) 			--記住玩家
			MoveToFlagEnabled(fly[1],FALSE)
			AddBuff( fly[1] , 507594 , 7 , -1 )
			BeginPlot(fly[1],"lua_nehelia_flowerAT2",0)
			create = create+1
	--	else
		end
	--	Say( fly[1] , "Create1 ="..create.. "& num1 ="..num)

		if create >= num and CheckID(fly[1]) == FALSE then
			WriteRoleValue(OID,EM_RoleValue_Register10,0)
			break
	 	end					--產生到指定隻數以後斷開迴圈

		Sleep(15)
	end
end

function lua_nehelia_flowerPow5() --鎖定只能對蝴蝶捕捉的法術劇情
	local Player=OwnerID() 
	local Target = TargetID()
	local Name = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local Create = ReadRoleValue( Target, EM_RoleValue_PID)
		if Name == 120321 and Create == Player  then
			return true
		elseif Name == 120321 and Create~= Player then
			ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_33]",0)
			return FALSE
		else
			ScriptMessage( Player , Player , 1 ,"[EM_201167_3]" , 0 )--目標錯誤。
			return false
		end
end




----------抓蝴蝶劇情
function lua_nehelia_flowerA()
	local Player = OwnerID()
	local NPC=TargetID()
	local Random = Rand(100)+1 --local Random = DW_Rand(100)
	local CheckPoint = CheckBuff( Player , 621944)
	local lv = 0
	local num = ReadRoleValue(Player,EM_RoleValue_Register2)
		if CheckPoint == TRUE then
			local pos = Lua_BuffPosSearch( Player, 621944 )
			lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )+1
		end
		if  lv <= 4 then
			if Random <= 30 then 
			WriteRoleValue(Player,EM_RoleValue_Register2,num-1)
 			AddBuff( Player , 621945 , 0 , -1 )
 			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_27]" , C_SYSTEM ) --一個不小心，吸到鱗粉暈眩了。
			BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)
				if ReadRoleValue(Player,EM_RoleValue_Register2)<= 0 then
					CancelBuff(Player,621946)
				end
			elseif Random> 30 then
				KORS_buffUpDown( Player , 621944 , 0 , 1 )
				WriteRoleValue(Player,EM_RoleValue_Register2,num-1)
 				if CheckPoint == false then
 				ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_29]".."1/5" , C_SYSTEM ) --達到伊文要求的蝴蝶數量X/5 (黃字)
 				else
 				ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_29]".. lv+1 .."/5" , C_SYSTEM ) --達到伊文要求的蝴蝶數量 X/5 (黃字)
 				end
				BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)	
				if ReadRoleValue(Player,EM_RoleValue_Register2)<= 0 then
					CancelBuff(Player,621946)
				end
			end

		elseif lv>4 then	
 			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_30]" , C_SYSTEM ) --數量已足夠，快向伊文．潔芙琳回報吧！
			BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)
			CancelBuff(Player,621946)
		end

end

function lua_nehelia_flowerA1() --中了暈眩不給做的事情
	local Player=OwnerID() --玩家
	local CheckA=CheckBuff( Player , 621945 )
		if CheckA == true then			
			return false
		end
end


function lua_nehelia_flowerAT1() --刪除蝴蝶劇情
	local NPC=OwnerID() --蝴蝶
	local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
		if OrgID == 120321 then			
			DelObj(NPC)
		end
end


--function lua_nehelia_flowerAT2(WOOD)--掛在蝴蝶身上蝴蝶被放置PLAY的劇情

function lua_nehelia_flowerAT2()--掛在蝴蝶身上蝴蝶被放置PLAY的劇情
	local OID = OwnerID()
	local time = 0
	local Player = ReadRoleValue(OID,EM_RoleValue_PID)
	while time < 61 do
		time =time +1
		Sleep(10)
	end
	CancelBuff( Player , 621946 )
	DelObj(OID)
end




--------------------獎勵劇情--------------------------
--抓蝴蝶獎勵
function lua_nehelia_flowerB() 
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckA = CheckFlag ( Player , 546159 ) --檢查旗標A
	local CheckB = CheckFlag ( Player , 546160 ) --檢查旗標B
	local Point = FA_BuffInfo( Player , 621944 , 3 ) --檢查蝴蝶隻數 (3不要理他也不要改)

		if CheckA==true and CheckB==false then --有A沒B第二次玩的玩家
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]".."[SC_VALENTINE_2012NE_12]") --完成任務+跑腿對話劇情
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_13]" , "lua_nehelia_flowerS01", 0 ) --聆聽伊文．潔芙琳的心事

			SetFlag ( Player , 546160 , 1 ) --開啟旗標B
			SetFlag ( Player , 546161 , 0 ) --關閉旗標C
			CancelBuff ( Player , 621944 ) --刪除蝴蝶
			DelBodyItem( Player, 241040, 1 ) --砍掉普通花粉
			DelBodyItem( Player, 241041, 1 ) --砍掉高級花粉
			DelBodyItem( Player, 241042, 1 ) --砍掉光輝花粉
			GiveBodyItem( Player , 209161 , 1 ) --給予獎勵
		else
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]" ) --完成任務的對話劇情
			SetFlag ( Player , 546159 , 1 ) --開啟旗標A
			SetFlag ( Player , 546161 , 0 ) --關閉旗標C
			CancelBuff ( Player , 621944 ) --刪除蝴蝶
			DelBodyItem( Player, 241040, 1 ) --砍掉普通花粉
			DelBodyItem( Player, 241041, 1 ) --砍掉高級花粉
			DelBodyItem( Player, 241042, 1 ) --砍掉光輝花粉
			GiveBodyItem( Player , 209161 , 1 ) --給予獎勵
		end

end
 
--花神節由來
function lua_nehelia_flowerC() 
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_112150_YU_05]") 
end


--跑腿任務獎勵
function lua_nehelia_flowerD() --選擇告訴她求婚事情的獎勵
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_24]".."[SC_VALENTINE_2012NE_26]" ) --求婚!是真的嗎!
	SetFlag ( Player , 546182 , 0 ) --關閉跑腿旗標Z
	SetFlag ( Player , 546169 , 1 ) --開啟跑腿旗標D
	GiveBodyItem( Player , 209161 , 1 ) --給予獎勵
	GiveBodyItem( Player , 530873 , 1 ) --給予獎勵
	DelBodyItem( Player, 241056, 1 ) --砍掉回信
end


function lua_nehelia_flowerE() --選擇隱瞞求婚事情的獎勵
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_25]".."[SC_VALENTINE_2012NE_26]" ) --哦…他現在也是一個人住嗎，那太好了…。哦，不！我是說好辛苦啊。
	SetFlag ( Player , 546182 , 0 ) --關閉跑腿旗標Z
	SetFlag ( Player , 546169 , 1 ) --開啟跑腿旗標D
	GiveBodyItem( Player , 209161 , 1 ) --給予獎勵
	GiveBodyItem( Player , 530874 , 1 ) --給予獎勵
	DelBodyItem( Player, 241056, 1 ) --砍掉回信
end



------------------------------------------NPC對話劇情 ---------------------------------------------------

--女NPC對話劇情 
function lua_nehelia_flower01() --起始對話
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckB = CheckFlag ( Player , 546160 ) --檢查旗標B
	local CheckC = CheckFlag ( Player , 546161 ) --檢查旗標C
	local CheckD = CheckFlag ( Player , 546169 ) --檢查旗標D
	local CheckX = CheckFlag ( Player , 546180 ) --檢查每日旗標X
	local CheckY = CheckFlag ( Player , 546181 ) --檢查跑腿旗標Y
	local CheckZ = CheckFlag ( Player , 546182 ) --檢查跑腿旗標Z
	local Point = FA_BuffInfo( Player , 621944 , 3 ) --檢查蝴蝶隻數
	local CheckPoint = CheckBuff( Player , 621944) --檢查蝴蝶
	local Powder1 = CountBodyItem( Player , 241040 )
	local Powder2 = CountBodyItem( Player , 241041 )
	local Powder3 = CountBodyItem( Player , 241042 )
	local Letter = CountBodyItem( Player , 241056 )
	local CountSeed=CountItem( Player , 241039 )
	local CountPowder0=CountItem( Player , 241040 )
	local CountPowder1=CountItem( Player , 241041 )
	local CountPowder2=CountItem( Player , 241042 )

	AdjustFaceDir( NPC , Player , 0 ) --NPC面向玩家


		if CheckY==true then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]")  --請你將這朵花交給納姆吉．菲爾
				if CountBodyItem( Player , 241055 )==0 then
					GiveBodyItem ( Player , 241055 , 1 )
				end
		elseif CheckZ==true and Letter==1 then --確認是否有跑腿的回信
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_21] ") --謝謝你幫我大老遠地跑一趟。		
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_22]" , "lua_nehelia_flowerD", 0 ) --把信交給NPC.並告訴他OO想求婚的事情
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_23]" , "lua_nehelia_flowerE", 0 ) --把信交給NPC.不告訴他OO想求婚的事情

		elseif CheckC==true then --檢查旗標C,確認任務是否進行中
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_08]") --你好啊[$playername]，碰到什麼困難了嗎？還是說你幫我帶來5隻授粉蝶了？		

				if Point==4  then
					if  Powder1==1 or Powder2==1 or Powder3==1 then
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_10]" , "lua_nehelia_flowerB", 0 ) --是的，我帶來了--跳轉獎勵劇情
					end
				else 
					AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_09]" , "lua_nehelia_flower04", 0 ) --想再次聽取說明
					if CountSeed==0 and CountPowder0==0 and CountPowder1==0 and CountPowder2==0 then
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_34]" , "lua_nehelia_flowerseed", 0 )
					end
				end

		elseif CheckX==true then --確認是否有今日旗標
			if CheckB==true and CheckD==false then--有B
					if CheckY==true then
						SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]") --跑腿任務說明
					else
						SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]".."[SC_VALENTINE_2012NE_12]") --今日已完成對話劇情+對了…坦白說
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_13]" , "lua_nehelia_flowerS01", 0 ) --聆聽伊文．潔芙琳的心事
					end
			else
				SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]") --今日已完成對話劇情
				AddSpeakOption( Player , NPC , "[SC_112150_YU_02]" , "lua_nehelia_flowerC", 0 ) --花神節的由來
			end

		else	--除此之外都會進行的任務
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_01]")  --NPC的碎碎念
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_02]" , "lua_nehelia_flower02", 0 ) 
				if CheckB==true and CheckD==false then
					AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_15]" , "lua_nehelia_flowerS01", 0 ) --關於上次提及的事情
				end
		end
end




function lua_nehelia_flower02() --授粉蝶事情
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_03]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_04]" , "lua_nehelia_flower03", 0 ) --詢問是否能夠幫忙
end


function lua_nehelia_flower03() --說明內容
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_05]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flower05", 0 ) --沒問題，交給我吧！
end


function lua_nehelia_flower04() --再說明一次蝴蝶規則
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_05]") 
end


function lua_nehelia_flower05() --沒問題，交給我吧！
	local Player = OwnerID()
	local CheckA = CheckFlag ( Player , 546159 ) --檢查旗標A
	local CheckB = CheckFlag ( Player , 546160 ) --檢查旗標B
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_07]") 
	SetFlag ( Player , 546161 , 1 ) --開啟旗標C
	SetFlag ( Player , 546180 , 1 ) --開啟每日旗標X
	GiveBodyItem( Player , 241039 , 1 ) --給予種子
end





--------兩次之後才會開啟的跑腿任務------
function lua_nehelia_flowerS01()--伊文扭捏劇情
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_14]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flowerS02", 0 ) --沒問題，交給我吧！
end


function lua_nehelia_flowerS02()--伊文說明+給予花
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]") --跑腿任務說明
	SetFlag ( Player , 546181 , 1 ) --開啟跑腿旗標Y
	GiveBodyItem( Player , 241055 , 1 ) --給予花
end


--男NPC的劇情對話
function lua_nehelia_flowerS03()
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckY = CheckFlag ( Player , 546181 ) --檢查跑腿旗標Y
	local CheckZ = CheckFlag ( Player , 546182 ) --檢查跑腿旗標Z
	local Flower = CountBodyItem( Player , 241055 )--抓到玩家身上伊文的花

		if CheckY==true and Flower==1 then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_17]")-- 最近工作越來越繁忙了，連休息都覺得是種奢侈…
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_18]" , "lua_nehelia_flowerS05", 0 ) --伊文吩咐的物品
		elseif CheckZ==true then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_20]")-- 謝謝你了，儘管我的工作並不怎麼樣，我還是拚命的工作想存多一點錢。
				if CountBodyItem( Player , 241056 )==0 then
					GiveBodyItem ( Player , 241056 , 1 )
				end
		else
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_17]")-- 最近工作越來越繁忙了，連休息都覺得是種奢侈…
		end
end


function lua_nehelia_flowerS04()--給予回信
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_20]")-- 謝謝你了，儘管我的工作並不怎麼樣，我還是拚命的工作想存多一點錢。
	SetFlag ( Player , 546181 , 0 ) --關閉跑腿旗標Y
	SetFlag ( Player , 546182 , 1 ) --開啟跑腿旗標Z
	DelBodyItem( Player, 241055, 1 ) --砍掉花
	GiveBodyItem( Player , 241056 , 1 ) --給予回信
end


function lua_nehelia_flowerS05()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_19]")-- 這是…！原來她還記得我，他現在一個人過得很好嗎？
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flowerS04", 0 ) --沒問題!
end



function lua_nehelia_redo() --全部重置
	local player = OwnerID()
	local KeyTable ={ 546159,546160,546161,546169,546180,546181,546182}
	local ItemTable = {241039,241040,241041,241042,241055,241056}
		for i = 1, table.getn(KeyTable) do
			SetFlag(player,KeyTable[i],0)
		end
		
		for x = 1,table.getn(ItemTable) do
			local count = CountBodyItem(player,ItemTable[x])
			if count ~= 0 then
				DelBodyItem(player,ItemTable[x],count)
			end
		end
end

function lua_nehelia_redo01() --跑腿活動重置
	local player = OwnerID()
	local KeyTable ={ 546169,546181,546182}
	local ItemTable = {241055,241056}
		for i = 1, table.getn(KeyTable) do
			SetFlag(player,KeyTable[i],0)
		end
		
		for x = 1,table.getn(ItemTable) do
			local count = CountBodyItem(player,ItemTable[x])
			if count ~= 0 then
				DelBodyItem(player,ItemTable[x],count)
			end
		end
end