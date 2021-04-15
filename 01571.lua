
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW11() --在突擊隊長身上執行的劇情
-----------------------------------------------------------------------------------------------
--使用旗子 780023 編號 1之外的all(聯軍出現的位置)
--使用旗子 780082 編號 1(隊長移動的路徑)
--使用旗子 780083 編號 1(隊長移動的路徑)
--使用旗子 780084 編號 1(隊長移動的路徑)
--使用旗子 780085 編號 1(隊長移動的路徑)
--使用旗子 780086 編號 1(隊長移動的路徑)
--使用旗子 780082 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780083 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780084 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780085 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780086 編號 1之外的all(聯軍移動的路徑)

--使用旗子 780184 編號 1(隊長前往爆破的隱形物件)
--使用旗子 780185 編號 1(隊長前往爆破的隱形物件)
--使用旗子 780186 編號 1(隊長前往爆破的隱形物件)
--使用旗子 780187 編號 1(隊長前往爆破的隱形物件)
--使用旗子 780188 編號 1(隊長前往爆破的隱形物件)
--使用旗子 780184 編號 1之外的all(蛇人出現的位置)
--使用旗子 780185 編號 1之外的all(蛇人出現的位置)
--使用旗子 780186 編號 1之外的all(蛇人出現的位置)
--使用旗子 780187 編號 1之外的all(蛇人出現的位置)
--使用旗子 780188 編號 1之外的all(蛇人出現的位置)
	local MapID = 731
	local Humen = {}
	local HumenCount = 6
	local HumenRand = {102817,102818}
	local Snake = {}
	local SnakeCount = 6
	local SnakeRand = {102514,102529,102530,102531}


--依照旗子產生眾生突擊隊員
--陣列亂數產生男女隊員
	for i=1,HumenCount,1 do
		Humen[i] = Lua_DW_CreateObj("flag",HumenRand[DW_Rand(table.getn(HumenRand))],780023,i+1)
		WriteRoleValue(Humen[i],EM_RoleValue_IsWalk,0)
		BeginPlot(Humen[i],"LuaPE_9_1_DW12",0)
		Hide(Humen[i])
	end
	sleep(10)
	for i=1,HumenCount,1 do
		Show(Humen[i],0)
	end
	sleep(15)
	local j=1
--迴圈！！
--執行5次的迴圈  讓隊長一共破壞5個點
--完成迴圈代表階段完成
	while j<9 do
--前往標的物
--將成員編號記入PID
--前往標的標號就是依照PID編號前往
		for i=1,table.getn(Humen),1 do
			if	CheckID(Humen[i])	then
				WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
				CallPlot(Humen[i],"LuaPE_9_1_DW14",780082+(j-1)/2)
			end
		end
		DW_MoveToFlag( OwnerID() , 780082+(j-1)/2 , 1 , 0 , 1  )
		sleep(10)
--到達破壞點
--判斷是否要建立蛇人援軍(蛇人的階段死亡數量要不滿10)
--旗標的建立一定要多1號(不能使用同一組)
--蛇人援軍都攻擊隊長
		local Pass = true
		if	PE_Zone9_1_Global_1 < 10	then
			for i=1,SnakeCount,1 do
				Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780184+(j-1)/2,i+1)
				WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
				Hide(Snake[i])
				Show(Snake[i],0)
				SetAttack(Snake[i],OwnerID())
			end
			sleep(10)
--訊息：蛇人派出了援軍展開截擊！消滅他們！  SC_PE_9_1_13
			DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_13]",C_Red,MapID)
		else
			Pass = false
		end
--確認所有的蛇人都已經死亡
--利用迴圈來確認
--id不存在或是已死亡都算
		while	Pass	do
			sleep(10)
			for i=1,table.getn(Snake),1 do
				if	CheckID(Snake[i])	then
					if	ReadRoleValue(Snake[i],EM_RoleValue_IsDead)==0	then
						break
					end
				end
				if	i==table.getn(Snake)	then
					Pass = false
				end
			end
		end
		PE_Zone9_1_Global_1 = 0
		sleep(5)
		Pass = true
		local AllPlayer = {}
		local AllPlayerNum
		while Pass do
			sleep(10)
--產生隱形的標的物
			local book = Lua_DW_CreateObj("flag",112399,780184+(j-1)/2,1,0)
			SetModeEx(book,EM_SetModeType_Mark,false) 
			SetModeEx(book,EM_SetModeType_ShowRoleHead,false) 
			AddToPartition(book,0)
			if	HateListCount( OwnerID()) == 0 then
--隊長耍酷走去
--蹲下
--站起走回來
				SetFightMode(OwnerID(),0,1,0,0 )
				FaceObj( OwnerID(), book )
				sleep(20)
				PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
				sleep(20)
				PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
				BeginPlot(book,"LuaPE_9_1_DW15",0)
				DW_MoveToFlag( OwnerID() , 780082+(j-1)/2 , 1 , 0 , 1  )
				Pass = false
				sleep(20)
				SetFightMode(OwnerID(),1,1,0,1 )
--搜尋所有的玩家
--只要存在血戰谷&未死的
--給予任務完成旗標
				AllPlayerNum = SetSearchAllPlayer(0)
				for k=1,AllPlayerNum,1 do
					AllPlayer[k] = GetSearchResult()
					if	DW_CheckMap(AllPlayer[k],MapID)	and
						ReadRoleValue(AllPlayer[k],EM_RoleValue_IsDead)==0	then
						SetFlag(AllPlayer[k],543564+(j-1)/2,1)
					end
				end
--隨機發話
			end
		end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register2,ReadRoleValue(OwnerID(),EM_RoleValue_Register2)+1)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]"..ReadRoleValue(OwnerID(),EM_RoleValue_Register2).."/".."4",C_Yellow,MapID)
		j=j+2
	end
--第四根旗子之後
--遠方亮起警示煙火
--準備演戲進入第四階段
	for i=1,table.getn(Humen),1 do
		if	CheckID(Humen[i])	then
			WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
			CallPlot(Humen[i],"LuaPE_9_1_DW14",780086)
		end
	end
	DW_MoveToFlag( OwnerID() , 780086 , 1 , 0 , 1  )
--讓隊長注意某個方向(改變面向)
	SetFightMode(OwnerID(),0,1,0,0 )
	SetDir( OwnerID(), 0 )
--說：咦？這信號......
	Yell(OwnerID(),"[SC_PE_9_1_16]",4)
--建立隱形物件二枚
--使之互相施法
	local XYZ = {-6226,484,29769}
	local CastFire = Lua_DW_CreateObj("xyz",112399,XYZ)
	XYZ[2] = XYZ[2]+350
	local Bomb = Lua_DW_CreateObj("xyz",112307,XYZ,0)
	SetModeEx(Bomb,EM_SetModeType_Gravity,false) 
	AddToPartition(Bomb,0)
	AddBuff(Bomb,505012,1,-1)
	CastSpell(CastFire,Bomb,494400)
--隊長指向煙火的位置
	sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
--說：可惡！[102532]來了！
	Yell(OwnerID(),"[SC_PE_9_1_17]",5)
	sleep(20)
--說：沒關係，我們已經破壞了一部份的軍備物資！先撤退吧！
	Yell(OwnerID(),"[SC_PE_9_1_18]",5)
--5次迴圈完成  進入第四階段
	PE_Zone9_1_GlobalStep = 4
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]".."4".."/".."4",C_Yellow,MapID)
	sleep(20)
--說：利用蛇人的火藥桶掩護我們撤退！小心自己人！
	Yell(OwnerID(),"[SC_PE_9_1_35]",5)
--使用旗子 780205 編號 1(隊長移動的路徑)
--使用旗子 780206 編號 1(隊長移動的路徑)
--使用旗子 780207 編號 1(隊長移動的路徑)
--使用旗子 780208 編號 1(隊長移動的路徑)
--使用旗子 780209 編號 1(隊長移動的路徑)
--使用旗子 780205 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780206 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780207 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780208 編號 1之外的all(聯軍移動的路徑)
--使用旗子 780209 編號 1之外的all(聯軍移動的路徑)

--使用旗子 780214 編號 1(強大蛇人出現的位置)
--使用旗子 780215 編號 1(強大蛇人出現的位置)
--使用旗子 780216 編號 1(強大蛇人出現的位置)
--使用旗子 780217 編號 1(強大蛇人出現的位置)
--使用旗子 780218 編號 1(強大蛇人出現的位置)
--使用旗子 780214 編號 1之外的all(蛇人出現的位置)
--使用旗子 780215 編號 1之外的all(蛇人出現的位置)
--使用旗子 780216 編號 1之外的all(蛇人出現的位置)
--使用旗子 780217 編號 1之外的all(蛇人出現的位置)
--使用旗子 780218 編號 1之外的all(蛇人出現的位置)

	Snake = {}
	SnakeCount = 2
	SnakeRand = {102514,102529,102530,102531}
--進入逃跑迴圈
	j=1
	while J<11 do
--控制還存活的隊員前往下個點
		for i=1,table.getn(Humen),1 do
			if	CheckID(Humen[i])	then
--此階段之後不會再回血
				AddBuff(Humen[i],502707,1,-1)
				WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
				WriteRoleValue(Humen[i],EM_RoleValue_Register1,780205+(j-1)/2)
				WriteRoleValue(Humen[i],EM_RoleValue_Register2,0)
				if	j==1	then
					BeginPlot(Humen[i],"LuaPE_9_1_DW17",0)
				end
			end
		end
--自己也前往下個點
--此階段後不會再回血
		AddBuff(OwnerID(),502707,1,-1)
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,780205+(j-1)/2)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
		if	j==1	then
DeBugMSG(0,0,"Captain GoGoGo !!!")
			SetFightMode(OwnerID(),0,1,0,1 )
			BeginPlot(OwnerID(),"LuaPE_9_1_DW17",0)
		end
--階段報告
		DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_27]",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_27]",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."0".."/".."1",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
--產生下個節點的蛇人
		Snake[1] = Lua_DW_CreateObj("flag",102848,780214+(j-1)/2,1)
		for i=2,SnakeCount,1 do
			Snake[i] = Lua_DW_CreateObj("flag", SnakeRand[DW_Rand(table.getn(SnakeRand))] ,780214+(j-1)/2,i+1)
		end
		for i=1,table.getn(Snake),1 do
--更改狀態：跑步
			WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
			Hide(Snake[i])
			Show(Snake[i],0)

			MoveToFlagEnabled(Snake[i], false)
			BeginPlot(Snake[i],"LuaPE_9_1_DW42",0)
		end
--判斷離指定旗子還有多遠
		while DW_CheckDis(OwnerID(),780205+(j-1)/2,1,50)==false do
			sleep(5)
		end
		sleep(5)
		j=j+2
		PE_Zone9_1_Global_1 = PE_Zone9_1_Global_1 + 1
	end
--成功到達指定的位置
--讓階段成功
--演戲讓他們逃走
--暫時不能消失
	sleep(40)
	PE_Zone9_1_GlobalStep = 5
	PE_Zone9_1_Global_1 = 0
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."1".."/".."1",C_Yellow,MapID)
--搜尋所有的玩家
--只要存在血戰谷&未死的
--給予任務完成旗標
	local AllPlayer = {}
	local AllPlayerNum
	AllPlayerNum = SetSearchAllPlayer(0)
	for k=1,AllPlayerNum,1 do
		AllPlayer[k] = GetSearchResult()
		if	DW_CheckMap(AllPlayer[k],MapID)	and
			ReadRoleValue(AllPlayer[k],EM_RoleValue_IsDead)==0	then
			SetFlag(AllPlayer[k],543568,1)
		end
		CancelBuff_NoEvent(AllPlayer[k],505112)
	end
	DelObj(OwnerID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW12() --如果隊長離場就提供自己刪除的理由
-----------------------------------------------------------------------------------------------
	while CheckID(TargetID())==true do
		sleep(10)
	end
	if	PE_Zone9_1_GlobalStep < 4	then
		WriteRoleValue(OwnerID(),EM_RoleValue_LiveTime,12)
		sleep(120)
--範圍紅字訊息：在[102816]死後，突擊隊員紛紛撤出了血戰谷！   SC_PE_9_1_10
		ScriptMessage( OwnerID(), 0, 1, "[SC_PE_9_1_10]", C_Red )
	else
--隊長成功逃離就進行刪除
		DelObj(OwnerID())
	end
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW13()  --約翰．路藍格隊長的死亡劇情(導致PE劇情重置)
-----------------------------------------------------------------------------------------------
	local MapID = 731
--重置階段
	PE_Zone9_1_Global_1 = 0
	PE_Zone9_1_GlobalStep = 0
DeBugMSG(0,0,"PE_Zone9_1_GlobalStep="..PE_Zone9_1_GlobalStep)
--訊息：[102816]不幸在突擊行動中戰死！SC_PE_9_1_11
--訊息：另一方面，炎魔也難以再對這種乏味的戰鬥提起興趣，漸漸離開了血戰谷...           SC_PE_9_1_12
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."1".."/".."1",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_11]",C_Red,MapID)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_12]",C_Yellow,MapID)
	local AllPlayer = {}
	local AllPlayerNum
	AllPlayerNum = SetSearchAllPlayer(0)
	for k=1,AllPlayerNum,1 do
		AllPlayer[k] = GetSearchResult()
		CancelBuff_NoEvent(AllPlayer[k],505112)
	end
	return true
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW14(flag) --指定移動座標
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,99)
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DW_MoveToFlag( OwnerID() , flag , Num ,30 , 1  )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
end




-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW15() --爆炸特效
-----------------------------------------------------------------------------------------------
	sleep(20)
	local Target = {114028,114030,114032,114034,114036,114037}
	local NPC = SearchRangeNPC ( OwnerID() , 300 )
	for i=0,table.getn(NPC)-1,1 do
		for j=1,table.getn(Target),1 do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==114040		then
--判斷要放火還是放特效
				if	ReadRoleValue(NPC[i],EM_RoleValue_PID)==113940	then
--放火
					BeginPlot(NPC[i],"LuaPE_9_1_DW25",0)
				else
--放特效
					BeginPlot(NPC[i],"LuaPE_9_1_DW38",0)
				end
				break
			end
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Target[j]	then
				BeginPlot(NPC[i],"LuaPE_9_1_DW25",0)
			end
		end
	end
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW16() --翼蛇將軍的移動控制
-----------------------------------------------------------------------------------------------
--更改狀態：跑步
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--使用旗子  780030 編號all(翼蛇將軍巡邏的路線)
	local Flag = 1
--雙重迴圈機制
--製造出來回搜尋的感覺
	while true do
--向編號少的方向搜尋
--如果編號已經少於全域變數 代表搜尋過頭
--跳出 前往少編號的迴圈
		while flag > 1	do
			sleep(10)
			if	Flag <= (PE_Zone9_1_Global_1+1)*2	then
				break
			end
			Flag = Flag - 1
--			Say(OwnerID(),"PE_Zone9_1_Global_1="..PE_Zone9_1_Global_1.."###Flag="..Flag)
			DW_MoveToFlag( OwnerID() , 780030 , Flag,10 , 1  )
		end
--向編號多的方向搜尋
--如果編號已經大於全域變數 代表搜尋過頭
--跳出 前往最終編號的迴圈
		while Flag <= GetMoveFlagCount(780030)-1 do
			sleep(10)
			if	Flag > (PE_Zone9_1_Global_1+1)*2	then
				break
			end
			Flag = Flag + 1
--			Say(OwnerID(),"PE_Zone9_1_Global_1="..PE_Zone9_1_Global_1.."###Flag="..Flag)
			DW_MoveToFlag( OwnerID() , 780030 , Flag,10 , 1  )
		end
--迴圈結束 重頭開始
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW17() --打帶跑的戰鬥ai劇情
-----------------------------------------------------------------------------------------------
--更改狀態：跑步
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--初始化
	local TempID
	while true do
		sleep(10)
--如果停留原地的處理
		if	HateListCount( OwnerID())==0	then
--去除無敵buff
			CancelBuff(OwnerID(),505380)
--不開索敵
			SetFightMode ( OwnerID(),0,1,0,1 )
--重新發送移動指令
			if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2) == 0	then
				CallPlot(OwnerID(),"LuaPE_9_1_DW41",ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
			end
		else
--如果剛進入戰鬥
--中斷移動的狀況
			sleep(10)
			for i=0,HateListCount( OwnerID()),1 do
				TempID = HateListInfo(OwnerID(),i, EM_HateListInfoType_GItemID)
--如果有人的目標是自己「而且」距離在200以內
				if	ReadRoleValue(TempID,EM_RoleValue_AttackTargetID)==OwnerID()	and
					CheckDistance(OwnerID(),TempID, 200)	then
					break
				end
--如果所有的敵人都沒有在攻擊自己
				if	HateListCount( OwnerID())==i	then
--繼續移動(如果狀態是停下的)
--掛上不能攻擊的buff
--發送離開戰鬥的指令
					SetFightMode ( OwnerID(),0,1,0,0 )
					AddBuff(OwnerID(),505380,9,10)
					SetStopAttack(OwnerID())
					if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2) == 0	then
if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==102816		then
	DeBugMSG(0,0,"out Fight Mode3")
end
						if	DW_Rand(100)>50	then
							if	DW_Rand(100) > 50	then
--台詞：我們快沒時間了！你一定要跟上來！   SC_PE_9_1_19
								Say(OwnerID(),"[SC_PE_9_1_19]")
							else
--台詞：你絕對不可以死在他們手上！聽清楚了嗎！  SC_PE_9_1_20
								Say(OwnerID(),"[SC_PE_9_1_20]")
							end
						end
						CallPlot(OwnerID(),"LuaPE_9_1_DW41",ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW18() --爆桶的觸碰劇情
-----------------------------------------------------------------------------------------------
--關掉再次觸發的可能
	SetPlot(TargetID(),"touch","",0)
--在爆桶身上執行劇情
	BeginPlot(TargetID(),"LuaPE_9_1_DW43",0)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW19() --爆桶buff的放下劇情
-----------------------------------------------------------------------------------------------
--判斷階段可不可以觸發
--取消buff(不觸發法術的版本)
	if	PE_Zone9_1_GlobalStep ~= 0	and
		PE_Zone9_1_GlobalStep ~= 4	and
		PE_Zone9_1_GlobalStep ~= 5	then
		CancelBuff_NoEvent(OwnerID(),505112)
		return
	end
--產生火藥桶(貨物)可攻擊的
	local Powder = Lua_CreateObjByDir( OwnerID() , 102845 , 30 , 0) 
	SetPlot(Powder,"dead","LuaPE_9_1_DW21",0)
	AddToPartition(Powder,0)
	BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	BeginPlot(Powder,"LuaPE_9_1_DW20",0)
--取消buff(不觸發法術的版本)
	CancelBuff_NoEvent(OwnerID(),505112)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW20() --爆桶的自動回收劇情
-----------------------------------------------------------------------------------------------
--時限內沒有被打爆會還原...
	sleep(200)
	if	PE_Zone9_1_GlobalStep == 0	or
		PE_Zone9_1_GlobalStep == 4	or
		PE_Zone9_1_GlobalStep == 5	then
		local Powder = Lua_DW_CreateObj("obj",113941,OwnerID())
		SetPlot(Powder,"touch","LuaPE_9_1_DW18",50)
		BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	end
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW21() --爆桶的死亡劇情
-----------------------------------------------------------------------------------------------
--300%的隱形球
--施法特效
	local Ball = Lua_DW_CreateObj("obj",112307,OwnerID(),0)
	SetModeEx(Ball,EM_SetModeType_Mark,false) 
	SetModeEx(Ball,EM_SetModeType_ShowRoleHead,false) 
	AddToPartition(Ball,0)
	BeginPlot(Ball,"LuaPE_9_1_DW46",0)
--施放最後殺招
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW22() --法術的檢查script
-----------------------------------------------------------------------------------------------
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102816	or
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102532 	then
		AddBuff(TargetID(),505124,5,5)
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102817	or
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102818 	then
		AddBuff(TargetID(),505126,1,10)
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_CampID)==6	then
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW23() --爆桶掉下的觸發劇情
-----------------------------------------------------------------------------------------------
--判斷階段可不可以種出新的爆桶
--不行直接跳掉
	if	PE_Zone9_1_GlobalStep ~= 0	and
		PE_Zone9_1_GlobalStep ~= 4	and
		PE_Zone9_1_GlobalStep ~= 5	then
		CancelBuff_NoEvent(OwnerID(),505112)
		return
	end
--消失的buff要變回正常的爆桶
	local Powder = Lua_DW_CreateObj("obj",113941,OwnerID())
--觸碰劇情
	SetPlot(Powder,"touch","LuaPE_9_1_DW18",50)
--判斷階段消失
	BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	CancelBuff_NoEvent(OwnerID(),505112)
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW24() --爆桶判斷階段消失的劇情
-----------------------------------------------------------------------------------------------
--只存活在第四階段
	while	PE_Zone9_1_GlobalStep == 0	or
		PE_Zone9_1_GlobalStep == 4	or
		PE_Zone9_1_GlobalStep == 5	do
		sleep(10)
	end
--脫離第四階段就立刻消失
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW25() --物件變化的劇情
-----------------------------------------------------------------------------------------------
	sleep(15)
--讀出對應被破壞的物件
--根據自身的位置種到場上
	local Broken
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	then
		Broken = Lua_DW_CreateObj("obj",ReadRoleValue(OwnerID(),EM_RoleValue_PID),OwnerID(),0)
		SetModeEx(Broken,EM_SetModeType_Mark,false) 
		SetModeEx(Broken,EM_SetModeType_ShowRoleHead,false) 
		AddToPartition(Broken,0)
	end
--隱藏自身
	Hide(OwnerID())
--迴圈檢查階段
--階段數不符合的話
--刪除broken 秀出自己
	while	true	do
		sleep(10)
		if	PE_Zone9_1_GlobalStep==1	then
			if	Broken~=nil	then
				DelObj(Broken)
			end
			Show(OwnerID(),0)
			return
		end
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW26() --物件初始化的劇情114028
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114029)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW27() --物件初始化的劇情114030
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114031)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW28() --物件初始化的劇情114032
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114033)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW29() --物件初始化的劇情114034
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114035)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW30() --物件初始化的劇情114036
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113714)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW31() --物件初始化的劇情114037
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113715)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW32() --物件會消失變成火
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113940)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW33() --執行劇情用的自殺術
-----------------------------------------------------------------------------------------------
	KillID(TargetID(),TargetID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW34()--測試用後門
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_GlobalStep = 0
	PE_Zone9_1_Global_1 = 0
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW35(Num)--測試用後門 設定條件
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_Global_1 = Num
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW36(Num)--測試用後門 設定階段
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_GlobalStep = Num
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW37() --物件初始化劇情 設定爆炸點在斜上
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,9)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW38() --爆炸特效劇情
-----------------------------------------------------------------------------------------------
	local RandSec = DW_Rand(3)
	sleep(RandSec*5)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==9	then
		CastSpell(OwnerID(),OwnerID(),494406)
	else
		CastSpell(OwnerID(),OwnerID(),494640)
	end
end



-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW39( ObjID , FlagObjID , FlagID,Range , Enable  ) -- 特殊移動
-----------------------------------------------------------------------------------------------
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return LuaPE_9_1_DW40( ObjID , X , Y  , Z );
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW40( ObjID , X , Y, Z)
-----------------------------------------------------------------------------------------------
	local Obj = Role:new( ObjID )
	local LastX = 0
	local LastZ = 0
	local NowX,NowZ
	local DW = 0
	Obj:Move(  X , Y ,Z  )
	while 1 do
		for i = 0 , 60 , 1 do
			NowX = Obj:X()
			NowZ = Obj:Z()

			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end

			if	(LastX == NowX 	and LastZ == NowZ) and
				ReadRoleValue(ObjID,EM_RoleValue_IsAttackMode)==0	then
				DW = DW + 1
				Obj:Move(  X , Y ,Z  )
			else
				if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
					if	ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)==0	then
						if	LastX == NowX 	and
							LastZ == NowZ		then
							DW = DW + 1
						end
					else
						DW = 0
					end
				else
					DW = 0
				end
			end

			if	DW >1	then
				return true
			end

			LastX = NowX
			LastZ = NowZ
			Sleep( 10 )
		end 
	end
	return false
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW41(flag) --指定移動座標
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,99)
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	LuaPE_9_1_DW39( OwnerID() , flag , Num ,30 , 1  )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW42() --重置階段結束時刪除
-----------------------------------------------------------------------------------------------
	while	PE_Zone9_1_GlobalStep~=1	do
		sleep(10)
	end
	while	HateListCount( OwnerID())~=0	do
		sleep(10)
	end
	DelObj(OwnerID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW43() -- 
-----------------------------------------------------------------------------------------------
	local CheckBar
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
	CallPlot(OwnerID(),"LuaPE_9_1_DW44",TargetID())
	if	BeginCastBar( TargetID(), "[SC_PE_9_1_21]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1	then
			ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
	end
	while	true	do
		sleep(2)
		CheckBar = CheckCastBar(TargetID())
		if	CheckBar~=0	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=TargetID()	then
				ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
				return
			end
--如果執行成功
--給玩家BUFF
--刪除自己
			if	CheckBar > 0	then
				EndCastBar(TargetID(),CheckCastBar(TargetID()))
				AddBuff(TargetID(),505112,1,-1)
				DelObj(OwnerID())
			else
--如果執行失敗
--重設PID
--重設觸碰劇情
				if	CheckBar<0	then
					EndCastBar(TargetID(),CheckCastBar(TargetID()))
					WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
					SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
					return
				end
			end
		end
	end
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW44()
-----------------------------------------------------------------------------------------------
	for i=1,10,1 do
		sleep(2)
--如果PID不相等
--等於執行結束
--跳掉SCRIPT
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=TargetID()	then
			return
		end
	end
	sleep(10)
--如果一秒之後
--仍然等於就是出錯沒有重置
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==TargetID()	then
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
		SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
		return
	end
	return
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW45()
-----------------------------------------------------------------------------------------------
	SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW46()
-----------------------------------------------------------------------------------------------
	CastSpell(OwnerID(),OwnerID(),494640)
	sleep(10)
	SysCastSpellLv(OwnerID(),OwnerID(),494641,200)
	sleep(10)
	DelObj(OwnerID())
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW47() -- 陣形劇情
-------------------------------------------------------------------------
	local dis = 20
	local count = 7 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local ReviveTime = -1  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	local SnakeRand = {102926,102927}
	local FinalRand = DW_Rand(table.getn(SnakeRand))

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,-3)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,3)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,-3)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,-1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,3)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,-3)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,-1)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,1)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,3)
	ObjMatrix[13] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,-3)
	ObjMatrix[14] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,-1)
	ObjMatrix[15] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,1)
	ObjMatrix[16] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,3)

	LuaFunc_ResetMatrix( ReviveTime , Matrix)
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW48() --訓話表演劇情
-------------------------------------------------------------------------
	local Now = DW_Rand(10)
	if	Now==1	then	Yell(OwnerID(),"[SC_PE_9_1_36]",2)	end
	if	Now==3	then	Yell(OwnerID(),"[SC_PE_9_1_37]",2)	end
	if	Now==5	then	Yell(OwnerID(),"[SC_PE_9_1_38]",2)	end
	if	Now==7	then	Yell(OwnerID(),"[SC_PE_9_1_39]",2)	end
	if	Now==8	then	Yell(OwnerID(),"[SC_PE_9_1_40]",2)	end
	return
end