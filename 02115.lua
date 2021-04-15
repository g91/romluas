--怪物用旗標 780794  NPC用旗標 780795  主控器用旗標 780796  走路用用旗標 780805 表演用 780830
--生小怪旗標 OK   
function ic_780796_01()  								---主控器
	local isaac = OwnerID()								---控制器					   						        
	local bossxx=0										---(EM_RoleValue_register9)	王死亡用 1王死=1 2王死=2 3王死=3 4王死=4 OPEN被觸發=5 BOSS贏=6
	local time1=0										---開戰出怪用
	local mob1=CreateObjByFlag(104814,780830,1,1)		---PE3表演NPC
	local mob2=CreateObjByFlag(104814,780830,3,1)		---PE3表演NPC
	local mob3=CreateObjByFlag(104814,780830,5,1)		---PE3表演NPC			
	local mob4=CreateObjByFlag(104814,780830,7,1)		---PE3表演NPC		
	local mob5=CreateObjByFlag(104814,780830,9,1)		---PE3表演NPC
	local mob6=CreateObjByFlag(104814,780830,11,1)		---PE3表演NPC			
	local time2=0										---開戰出怪用1王死	
	local time3=0										---開戰出怪用2王死
	local time4=0										---開戰出怪用3王死
	local time5=0										---時間到出王用1王
	local time6=0										---時間到出王用2王
	local time7=0										---時間到出王用3王
	local time8=0										---時間到出王用4王
	local time9=0										---時間到出王用4王
	local playtime=0
	local bossopentime1=0								---出王後計數器(EM_RoleValue_register3)1-3王
	local bossopentime2=0								---出王後計數器(EM_RoleValue_register2)2-4王
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local mob=CreateObjByFlag(104324,780795,2,1)		---(EM_RoleValue_register8)	生小怪用
	local opennpc=CreateObjByFlag(116838,780795,1,1) 	--(EM_RoleValue_PID)觸發NPC	
	local door	
	local door1
	AddToPartition(opennpc,RoomID)
	AddToPartition(mob,RoomID)
	AddToPartition(mob1,RoomID)
	AddToPartition(mob2,RoomID) 
	AddToPartition(mob3,RoomID) 
	AddToPartition(mob4,RoomID) 
	AddToPartition(mob5,RoomID) 
	AddToPartition(mob6,RoomID) 
	SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)			---索敵(否)
	SetModeEx( mob1 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob1 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob1 , EM_SetModeType_HideName, true)
	SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)			---索敵(否) 
	SetModeEx( mob2 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob2 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob2 , EM_SetModeType_HideName, true)
	SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)			---索敵(否)
	SetModeEx( mob3 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob3 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob3 , EM_SetModeType_HideName, true)
	SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)			---索敵(否)
	SetModeEx( mob4 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob4 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob4 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob4 , EM_SetModeType_HideName, true)
	SetModeEx( mob5 , EM_SetModeType_Searchenemy, false)			---索敵(否)
	SetModeEx( mob5 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob5 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob5 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob5 , EM_SetModeType_HideName, true)
	SetModeEx( mob6 , EM_SetModeType_Searchenemy, false)			---索敵(否)
	SetModeEx( mob6 , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob6 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob6 , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob6 , EM_SetModeType_HideName, true)	
	SetModeEx( mob , EM_SetModeType_Show, false)
	SetModeEx( mob , EM_SetModeType_Mark, false)					---可點選(否)
	SetModeEx( mob , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
	SetModeEx( mob , EM_SetModeType_Obstruct, false) 				---阻擋(否)
	SetModeEx( mob , EM_SetModeType_Strikback, false) 			---反擊(否)
	SetModeEx( mob , EM_SetModeType_Move, false) 					---移動	(否)
	SetModeEx( mob , EM_SetModeType_Fight, false) 				---可砍殺(否)
	SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
	SetModeEx( mob , EM_SetModeType_Searchenemy, false)			---索敵(否)
	BeginPlot(mob , "ic_780796_mobboss_03" , 0)  
	BeginPlot(opennpc , "ic_780796_opennpc_02" , 0)				---命令觸發NPC做事情
	BeginPlot(mob1 , "ic_PE398NPC_1" , 0)
	BeginPlot(mob2 , "ic_PE398NPC_2" , 0)
	BeginPlot(mob3 , "ic_PE398NPC_3" , 0)
	BeginPlot(mob4 , "ic_PE398NPC_4" , 0)
	BeginPlot(mob5 , "ic_PE398NPC_5" , 0)
	BeginPlot(mob6 , "ic_PE398NPC_6" , 0)
	WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   		---暫存口袋PID  open=isaac
	WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
	WriteRoleValue(isaac,EM_RoleValue_register8,mob)   		---暫存口袋 8 	isaac=mob
	WriteRoleValue(mob,EM_RoleValue_register8,isaac)
	while true do
			sleep(10)
			bossxx= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
			bossopentime1=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
			bossopentime2=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
			playtime=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if 	playtime==1 then
			time9=time9+1
		end
		if bossxx==5 then												--正式開始
			WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_register10,1)
			if bossopentime1==1 then
				time5=time5+1
				if time5>=300 then										---1王出後5分鐘強制進入第2階段(NPC撤退)
					WriteRoleValue(mob,EM_RoleValue_register4,1)
					sleep(5)	
					WriteRoleValue(opennpc,EM_RoleValue_register9,11)	---跟npc說PE1~失敗
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,1)	---失敗 PE3支援NPC少4之不一樣	---1=pE1失敗
					time5=0	
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,1)	---把口袋9歸1~強制進入第2階段
					WriteRoleValue(mob,EM_RoleValue_register9,0)
				end
			end	
			if time1==0 then											---1分鐘後開始出怪
			WriteRoleValue(mob,EM_RoleValue_PID,1)						---回傳4給小怪控制器---開始出怪了
			--WriteRoleValue(pe1,EM_RoleValue_register1,1)				---PE1開始
			WriteRoleValue(opennpc,EM_RoleValue_register8,1)			---傳給NPC說開戰了PE1開始
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_40]" , 2 )	---拯救隊員的行動已開始進行！
			time1=10
			end
		elseif	bossxx==6 then											--時間道沒打死王~BOSS贏了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_03]" , 2 )---這場戰役失敗了…面對這既定的事實，我們也只能選擇離開…
				star_WorldBattle_ScoreCal(0 , 3)		--IsWin  回傳勝負條件( 0表示輸，1表示贏 )，MapNumber 回傳是幾號戰場
				sleep(50)
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult() 
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==105066 or ID2==105065 or ID2==105064 or ID2==105063 or ID2==104898 or ID2==104897 or ID2==105068 
					or ID2==105039 or ID2==104920 or ID2==104894 or ID2==104878 or ID2==104879 or ID2==104880 or ID2==104881 
					or ID2==104882 or ID2==104883 or ID2==104884 or ID2==104885 or ID2==104886 or ID2==104887 or ID2==104888 
					or ID2==104889 or ID2==104890 or ID2==104891 or ID2==104892 or ID2==104893 or ID2==116839 or ID2==116840 
					or ID2==116841 or ID2==104904 or ID2==104906 or ID2==104908 or ID2==104910 or ID2==104912 or ID2==104905 
					or ID2==104907 or ID2==104909 or ID2==104911 or ID2==104913 or ID2==104915 or ID2==104914 or ID2==104918 
					or ID2==116907 or ID2==116908 or ID2==116909 or ID2==116910 or ID2==116933 or ID2==116934 or ID2==116935 
					or ID2==116838 or ID2==104959 or ID2==105040 or ID2==104810 or ID2==104958 or ID2==104812 or ID2==104899 
					or ID2==104814 or ID2==105198 or ID2==105199 or ID2==105359 or ID2==105358 or ID2==105360 or ID2==105363
					or ID2==105362 then
					DelObj(ID)
					end
				end
				if time9< 1800 then
					BeginPlot(OwnerID() , "ic_PEnpc_04BUFFxx_2" , 0)
				elseif time9> 1800 then
					BeginPlot(OwnerID() , "ic_PEnpc_04BUFFxx_1" , 0)
				end
				sleep(600)	
				break	
		elseif	bossxx==4 then		--4王死了~玩家贏了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_04]" , 2 )--我們成功了！你看那些魔族們狼狽的模樣，這都該感謝辛苦奮戰的各位！
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						Lua_bk_warplayerpoint( ThesePlayer[i] , 1155 )    --play代表玩家遊戲id      playpoint  代表玩家這場得到的個人積分
					end
				end	
				star_WorldBattle_ScoreCal(1 , 3)		  --IsWin  回傳勝負條件( 0表示輸，1表示贏 )，MapNumber 回傳是幾號戰場	
				sleep(20)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_ZONE190_WIN03]" , 2 )
				sleep(20)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_ZONE190_WIN06]" , 2 )
				door=CreateObjByFlag(105040,780794,200,1)
				door1=CreateObjByFlag(105040,780794,202,1)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door1 , EM_SetModeType_Mark, false)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
				AddToPartition(door1,RoomID)
				SetPlot( door,"collision","ic_780796_playfly_",30 ) 
				SetPlot( door1,"collision","ic_780796_playfly_",30 )
				sleep(2400)
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if  ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---玩家死亡
						AddBuff( ThesePlayer[i],508480,0 ,-1 )
						Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
						--ChangeZone( ThesePlayer[i], 6 , 0 , -23198 , -259 , 4435 , 320)
					elseif  ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then---玩家沒死
						AddBuff( ThesePlayer[i],508480,0 ,-1 )
						ChangeZone( ThesePlayer[i], 6 , 0 , -23198 , -259 , 4435 , 320)	
					end
				end					
				break	
		elseif	bossxx==3 then											---3王死了  15分鐘後出4王
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,3)			---跟PE3說撤退
				WriteRoleValue(opennpc,EM_RoleValue_register7,4)		---跟opennpc說贏了PE3
				WriteRoleValue(opennpc,EM_RoleValue_register9,44)		---跟npc說PE3~失敗
				time4=time4+1
			if bossopentime2==1 then	
				time8=time8+1
				if time8>=800 then											--4王出後6分鐘玩家失敗
				time8=0
				sleep(5)	
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,6)			---把口袋9歸6~時間道沒打死王~BOSS贏了
				WriteRoleValue(mob,EM_RoleValue_register9,0)	
				end
			end	
			if time4>=60 and time4<=65 then											---撤退時間2分(回傳後1分鐘出怪)
				time4=70
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_46]" , 2 )--毀滅之時來臨，魔族將領即將進攻主陣營！
				WriteRoleValue(mob,EM_RoleValue_PID,4)					---回傳1給小怪控制器---開始出怪了
			end	
		elseif	bossxx==2 then											--2王死了
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,2)			---跟PE2說撤退
				WriteRoleValue(opennpc,EM_RoleValue_register7,3)		---跟opennpc說贏了PE2
				time3=time3+1
			if bossopentime1==1 then	
				time7=time7+1
				if time7>=300 then											---3王出後5分鐘強制進入第4階段
					WriteRoleValue(mob,EM_RoleValue_register4,3)
					sleep(5)	
					WriteRoleValue(opennpc,EM_RoleValue_register9,33)		---跟npc說PE3~失敗
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,3)	---失敗 4王投石車不一樣---3=PE3失敗		
					time7=0
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,3)		---把口袋9歸3~強制進去第4階段
					WriteRoleValue(mob,EM_RoleValue_register9,0)
				end
			end	
			if time3>=60 and time3<=65 then									--撤退時間2分(回傳後1分鐘出怪)
				time3=70
				WriteRoleValue(mob,EM_RoleValue_PID,3)					---回傳2給小怪控制器---開始出怪了
				--WriteRoleValue(pe3,EM_RoleValue_register1,1)			---PE3開始
				WriteRoleValue(opennpc,EM_RoleValue_register8,3)		---傳給NPC說開戰了PE3開始
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_42]" , 2 )--運送糧車的車伕們已全數準備完畢等待出發！
				WriteRoleValue(mob1,EM_RoleValue_register9,1)
				WriteRoleValue(mob2,EM_RoleValue_register9,1)
				WriteRoleValue(mob3,EM_RoleValue_register9,1)
				WriteRoleValue(mob4,EM_RoleValue_register9,1)
				WriteRoleValue(mob5,EM_RoleValue_register9,1)
				WriteRoleValue(mob6,EM_RoleValue_register9,1)
			end	
		elseif	bossxx==1 then											---1王死了	 2分鐘後出小怪 (15分鐘後出2王NPC撤退)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,1)			---跟PE1說撤退
				WriteRoleValue(opennpc,EM_RoleValue_register7,2)		---跟opennpc說贏了PE1
				time2=time2+1
			if bossopentime2==1 then		
				time6=time6+1
				if time6>=300 then											---2王出後5分鐘強制進入第3階段
					WriteRoleValue(mob,EM_RoleValue_register4,2)	
					sleep(5)
					WriteRoleValue(opennpc,EM_RoleValue_register9,22)		---跟npc說PE2~失敗
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,1)	---失敗 4王投石車不一樣---2=PE2失敗	
					time6=0
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,2)		---把口袋9歸2~強制進去第3階段
					WriteRoleValue(mob,EM_RoleValue_register9,0)	
				end
			end	
			if time2>=60 and time2<=65 then											---撤退時間2分(回傳後1分鐘出怪)
				time2=70
				WriteRoleValue(mob,EM_RoleValue_PID,2)					---回傳3給小怪控制器---開始出怪了
				--WriteRoleValue(pe2,EM_RoleValue_register1,1)			---PE2開始
				WriteRoleValue(opennpc,EM_RoleValue_register8,2)		---傳給NPC說開戰了PE2開始
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_41]" , 2 )--魔族即將加快腳步來搶奪攻城車！
			end	
		end	
	end	
end
function ic_780796_opennpc_02() --NPC用----口袋4跟5還沒用
local opennpc = OwnerID()
local RoomID=ReadRoleValue(opennpc,EM_RoleValue_RoomID)
local isaac= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local npc1		--PE1完成	
local npc2		--PE2完成	
local npc3		--PE3完成
local time1=0	
local time2=0	
local time3=0	
local time4=0	
local PEopen=0	--PE開始了
local PEXX=0	--PEXX是否成功~ 11=PE1失敗 22=PE2失敗 33=PE3失敗
local PE=0		--PE是否成功~ 2=PE1贏了 3=PE2贏了 4=PE3贏了
local PE9898=0	--PENPC撤退用
local PE1WIN1=0
local PE1WIN2=0
local PE1WIN3=0
local PE3xxx=0  										---ReadRoleValue(opennpc,EM_RoleValue_register4)--看PE3己之NPC回到本陣
local PE2xxx=0  
local pe1npc=CreateObjByFlag(116839,780795,3,1) 		---PE1控制器	第1ㄍPE		
local pe2npc=CreateObjByFlag(116840,780795,4,1) 		---PE2控制器	第2ㄍPE
local pe3npc=CreateObjByFlag(116841,780795,5,1) 		---PE3控制器	第3個PE
local door3=CreateObjByFlag(104198,780794,25,1) 		---PE1控制器	第1ㄍPE	
local door4=CreateObjByFlag(104198,780794,26,1) 		---PE1控制器	第1ㄍPE	
--WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   		--暫存口袋PID  	open=isaac
WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
--WriteRoleValue(opennpc,EM_RoleValue_register1,pe1npc)   	---暫存口袋 1 	opennpc=pe1npc
WriteRoleValue(pe1npc,EM_RoleValue_register1,opennpc)
WriteRoleValue(pe1npc,EM_RoleValue_register9,pe3npc)
--WriteRoleValue(opennpc,EM_RoleValue_register2,pe2)   	---暫存口袋 2 	opennpc=pe2
WriteRoleValue(pe2npc,EM_RoleValue_register1,opennpc)
--WriteRoleValue(opennpc,EM_RoleValue_register3,pe3)   	---暫存口袋 3 	opennpc=pe3
WriteRoleValue(pe3npc,EM_RoleValue_register1,opennpc)
AddToPartition(pe1npc,RoomID)
AddToPartition(pe2npc,RoomID)
AddToPartition(pe3npc,RoomID)
AddToPartition(door3,RoomID)
AddToPartition(door4,RoomID)
SetModeEx( pe1npc , EM_SetModeType_Strikback, false) 	---反擊(否)
SetModeEx( pe1npc , EM_SetModeType_Move, false) 			---移動	(否)
SetModeEx( pe1npc , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( pe2npc , EM_SetModeType_Strikback, false) 	---反擊(否)
SetModeEx( pe2npc , EM_SetModeType_Move, false) 			---移動	(否)
SetModeEx( pe2npc , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( pe3npc , EM_SetModeType_Strikback, false) 	---反擊(否)
SetModeEx( pe3npc , EM_SetModeType_Move, false) 			---移動	(否)
SetModeEx( pe3npc , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( door3 , EM_SetModeType_Mark, false)
SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false) 	
SetModeEx( door3 , EM_SetModeType_Obstruct, true) 
SetModeEx( door3 , EM_SetModeType_Strikback, false) ---反擊
SetModeEx( door3 , EM_SetModeType_Move, false) ---移動	
SetModeEx( door3 , EM_SetModeType_Fight, false) ---可砍殺
SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 
SetModeEx( door3 , EM_SetModeType_Searchenemy, false)
SetModeEx( door4 , EM_SetModeType_Mark, false)
SetModeEx( door4 , EM_SetModeType_ShowRoleHead, false) 	
SetModeEx( door4 , EM_SetModeType_Obstruct, true) 
SetModeEx( door4 , EM_SetModeType_Strikback, false) ---反擊
SetModeEx( door4 , EM_SetModeType_Move, false) ---移動	
SetModeEx( door4 , EM_SetModeType_Fight, false) ---可砍殺
SetModeEx( door4 , EM_SetModeType_SearchenemyIgnore, false) 
SetModeEx( door4 , EM_SetModeType_Searchenemy, false)
BeginPlot(pe1npc , "ic_PE1NPC" , 0)					---命令角色做事情
BeginPlot(pe2npc , "ic_PE2NPC" , 0)					---命令角色做事情
BeginPlot(pe3npc , "ic_PE3NPC" , 0)					---命令角色做事情
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do 
		PE9898= ReadRoleValue(OwnerID(),EM_RoleValue_register6)
		PE= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		PEopen= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PEXX= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN1=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		PE1WIN2=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		PE1WIN3=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		PE2XXX=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		sleep(10)
		--say(OwnerID(),"PE3xxx="..PE3xxx)
		if PE2XXX==1 and time4==0 then
			WriteRoleValue(isaac,EM_RoleValue_register1,1)
			time4=1
		end
		if PE9898==1 then										---PE1NPC撤退用
			WriteRoleValue(pe1npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---把口袋6歸0
		elseif PE9898==2 then								  	---PE2NPC撤退用
			WriteRoleValue(pe2npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---把口袋6歸0
		elseif PE9898==3 then									--PE3NPC撤退用
			WriteRoleValue(pe3npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---把口袋6歸0
		end
		if	PEopen==1 then
			SetModeEx( pe1npc , EM_SetModeType_Mark, true)					---可點選(否)
			if PE==2 and PEXX==0 and time1==0 and PE1WIN1==1 or PE1WIN1==1 and time1==0 then
				time1=5
				sleep(40)
				npc1=CreateObjByFlag(116933,780795,6,1) 	-----NPC1創在 
				AddToPartition(npc1,RoomID)
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋7歸0
				SetModeEx( npc1 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( npc1 , EM_SetModeType_Fight, true) 				---可砍殺(是)
				AddBuff( npc1,508120,0 ,-1 )
				SetPlot( npc1,"dead","ic_PEnpc_01BUFFxx",0 )  
				BeginPlot(npc1 , "ic_PEnpc_01" , 0)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_45]" , 2 )--黑曜石要塞的子民祝福你們，有需要可以再來找我。
			elseif PE==2 and PEXX==11 and PE1WIN1==0 and time1==0  then
				time1=5
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
			end		
		end
		if	PEopen==2 then
			SetModeEx( pe2npc , EM_SetModeType_Mark, true)					---可點選(否)
			if PE==3 and PEXX==0 and time2==0 and PE1WIN2==1 or PE1WIN2==1 and time2==0 then
				time2=5
				Sleep(40)
				npc2=CreateObjByFlag(116934,780795,7,1) 	-----NPC2創在 
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋7歸0
				SetModeEx( npc2, EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( npc2 , EM_SetModeType_Fight, true) 				---可砍殺(是)
				AddToPartition(npc2,RoomID)
				AddBuff( npc2,508120,0 ,-1 )
				SetPlot( npc2,"dead","ic_PEnpc_02BUFFxx",0 ) 
				BeginPlot(npc2 , "ic_PEnpc_02" , 0)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_44]" , 2 )--凡瑞娜絲城的力量永存，有需要可以再來找我。
			elseif PE==3 and PEXX==22 and PE1WIN2==0 and time2==0 then
				time2=5
				WriteRoleValue(isaac,EM_RoleValue_register1,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0	
			end		
		end
		if	PEopen==3 then
			SetModeEx( pe3npc , EM_SetModeType_Mark, true)					---可點選(否)
			if  PE==4 and PEXX==0 and time3==0  or PE1WIN3==1 and time3==0   then
				time3=5
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local ThesePlayer = {}
				sleep(40)
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3創在
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋7歸0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---可砍殺(是)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--賢者之眼能量與你們同在，有需要可以再來找我。
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1	
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
							AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end	
				end	
			elseif  PEXX==33 and time3==0 or PE==4 and PEXX==33 and time3==0  then
				time3=5
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local ThesePlayer = {}
				sleep(40)
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3創在
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋7歸0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---可砍殺(是)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--賢者之眼能量與你們同在，有需要可以再來找我。
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
								AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end
				end	
			elseif	PEXX==44 and time3==0  then	
				time3=5
				sleep(40)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local ThesePlayer = {}
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3創在
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋7歸0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---可砍殺(是)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--賢者之眼能量與你們同在，有需要可以再來找我。
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
								AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end
				end	
			end
		end		
	end
end 
function ic_PEnpc_01BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 508115 ) == true then
					CancelBuff(ThesePlayer[i], 508115)
				end
		end					
	end
end
function ic_PEnpc_02BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 508116 ) == true then
					CancelBuff(ThesePlayer[i], 508116)
				end
		end					
	end
end
function ic_PEnpc_03BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 508117 ) == true then
					CancelBuff(ThesePlayer[i], 508117)
				end
		end					
	end
end
function ic_PEnpc_04BUFFxx_1() --刪除全部BUFF
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---玩家死亡
			---say(ThesePlayer[i],"123")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 385 )    --play代表玩家遊戲id      playpoint  代表玩家這場得到的個人積分
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
			--ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		elseif ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--玩家沒死
			---say(ThesePlayer[i],"456")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 385 )    --play代表玩家遊戲id      playpoint  代表玩家這場得到的個人積分
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		end	
	end					
end
function ic_PEnpc_04BUFFxx_2() --刪除全部BUFF
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---玩家死亡
			---say(ThesePlayer[i],"123")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 35 )    --play代表玩家遊戲id      playpoint  代表玩家這場得到的個人積分
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
			--ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		elseif ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--玩家沒死
			---say(ThesePlayer[i],"456")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 35 )    --play代表玩家遊戲id      playpoint  代表玩家這場得到的個人積分
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		end	
	end					
end

function ic_PEnpc_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 508115 ) == false then
					AddBuff( ThesePlayer[i],508115,0 ,-1 )
				end
		end					
	end
end
function ic_PEnpc_02()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 508116 ) == false then
					AddBuff( ThesePlayer[i],508116,0 ,-1 )
				end
		end					
	end
end
function ic_PE1BUFF_1() 	--觸發--對話~死亡後可以找NPC上BUFF		
local penpc=TargetID( )
	LoadQuestOption( OwnerID() )----秀 NPC對話內容
	SetPlot(TargetID( ),"touch","ic_PE1BUFF_2",40)									----觸發過後
end
function ic_PE1BUFF_2() 	--點擊過後的對話視窗
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
	Search = SearchRangePlayer ( penpc , 100 )
	say(TargetID(),"[SC_116838_51]")	
	for i = 0 , table.getn(Search)	do
		if CheckBuff( Search[i] , 508115 ) == false then
			AddBuff( Search[i],508115,0 ,-1 )
		end
	end
end
function ic_PE2BUFF_1() 	--觸發--對話死亡後可以找NPC上BUFF			
local penpc=TargetID( )
	LoadQuestOption( OwnerID() )----秀 NPC對話內容
	SetPlot(TargetID( ),"touch","ic_PE2BUFF_2",40)									----觸發過後
end
function ic_PE2BUFF_2() 	--點擊過後的對話視窗
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
Search = SearchRangePlayer ( penpc , 100 )
		say(TargetID(),"[SC_116838_50]")
		for i = 0 , table.getn(Search)	do
			if CheckBuff( Search[i] , 508116 ) == false then
			AddBuff( Search[i],508116,0 ,-1 )
			end
		end
end
function ic_PE3BUFF_1() 	--觸發--對話對話死亡後可以找NPC上BUFF			
local penpc=TargetID( )
local opennpc= ReadRoleValue(penpc,EM_RoleValue_register1)
	LoadQuestOption( OwnerID() )----秀 NPC對話內容
	SetPlot(TargetID( ),"touch","ic_PE3BUFF_2",40)									----觸發過後
end
function ic_PE3BUFF_2() 	--點擊過後的對話視窗
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
local opennpc= ReadRoleValue(penpc,EM_RoleValue_register1)
local PE3xxx=ReadRoleValue(opennpc,EM_RoleValue_register4)
Search = SearchRangePlayer ( penpc , 100 )
PE3xxx=ReadRoleValue(opennpc,EM_RoleValue_register4)
	say(TargetID(),"[SC_116838_49]")
	if 	PE3xxx~=0 then
		for i = 0 , table.getn(Search)	do
			if CheckBuff( Search[i] , 508117 ) == false then
			AddBuff(Search[i],508117,PE3xxx-1 ,-1 )
			end
		end
	end
end
function ic_PE398NPC_1()--1號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,2,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(300)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_2()--2號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,4,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(600)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_3()--3號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,6,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(900)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_4()--4號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,8,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(300)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_5()--5號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,10,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(600)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_6()--6號車伕
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,12,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---可點選(否)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---頭像框(否)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---可砍殺(否)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---索敵(否)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(900)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE3NPCXX9898_1() 	--對話NPC跟車走
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	while true do
		SetFollow( OwnerID(), mob)
		sleep(10)
	end
end
function ic_PE3NPCXX9898_2()---4-6號車伕路線
local mob=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)		
local mob1
local mob2
local mob3
local mob4		
	while true do
		sleep(10)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780830 ,40,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(10)
		elseif mob9898==1 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,41,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==2 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,42,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==3 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,43,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==4 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,44,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==5 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,45,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==6 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,46,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==7 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,47,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
					DelObj(OwnerID())
					DelObj(mob11)
		end
	end	
end
function ic_PE3NPCXX9898_3()---1-3號車伕路線
local mob=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)		
local mob1
local mob2
local mob3
local mob4		
	while true do
		sleep(10)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780830 ,30,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(10)
		elseif mob9898==1 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,31,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==2 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,32,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==3 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,33,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==4 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,34,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==5 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,35,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==6 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,36,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==7 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,37,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
					DelObj(OwnerID())
					DelObj(mob11)
		end
	end	
end
function ic_pe3mob_open() 	--對話--觸發小怪
local pe3npc=TargetID( )
	LoadQuestOption( OwnerID())----秀 NPC對話內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_06]" , "ic_pe3mob_yes", 0 ) --我願意
end
function ic_pe3mob_yes() 	--觸發--對話		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=TargetID( )
WriteRoleValue(mob,EM_RoleValue_register9,1)											----觸發NPC
SetModeEx( mob , EM_SetModeType_Mark, false)			---可點選(是)
			CloseSpeak(OwnerID())														---關掉視窗
end
function ic_780796_playfly_()  ---傳送門用
AddBuff( OwnerID(),508480,0 ,-1 )
ChangeZone( OwnerID() , 6 , 0 , -23198 , -259 , 4435 , 320 )
end
function ic_npc_saysay_1()
npcsay(OwnerID(),"[SC_116838_47]")	--身為戰場一員，必須隨時保持警戒，也許一眨眼敵人就在你眼前。
end
function ic_npc_saysay_2()
npcsay(OwnerID(),"[SC_116838_48]")	--別太鬆懈了！敵人隨時都有可能突襲進攻。
end
function ic_npc_saysay_3()
npcsay(OwnerID(),"[SC_116838_54]")	--別太鬆懈了！敵人隨時都有可能突襲進攻。
end
function ic_npc_saybuff_3()
AddBuff( OwnerID(),508120,0 ,-1 )
end
function ic_boss1()---測試用
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,1)
		WriteRoleValue(mob,EM_RoleValue_PID,0)
end
function ic_boss2()---測試用
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,2)	
		WriteRoleValue(mob,EM_RoleValue_PID,0)	
end
function ic_boss3()---測試用
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,3)
		WriteRoleValue(mob,EM_RoleValue_PID,0)
end
function ic_boss4()---測試用
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,4)
end