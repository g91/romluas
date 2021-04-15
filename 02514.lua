function ic_MOB_23_BOSS1_0()--(6人車對規律走)沒殺光BOSS開戰衝進去 
local isaac=OwnerID()
local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)	
local mob1
local mob2
local time1=0
local time2=0
local time3=0
local time4=0
local mob1XX=0
local boss1X=0
local boss1XX=0	
local Search = SearchRangePlayer (isaac, 100)
local gogo=0
WriteRoleValue(isaac,EM_RoleValue_register9,0)
local boss1_id={106382,106382,106382}														---1王
local mob1_id={106128,106128,106128}														---路上
local mob2_id={106129,106129,106129}														---王房間
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}																	
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,0,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,0)
	while true do
		sleep(10)
		gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
		if gogo==0 then
			Search = SearchRangePlayer (isaac, 100 )
			for i = 0 , table.getn(Search)	do
				if ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ~= 0 then 
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)	
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+1)
				elseif ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ==0 then
					--say(OwnerID(),"2")
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+0)
				end	
			end
		elseif gogo~=0 then
			time1=time1+1
			if time1>=10 then
				mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
				time3=ReadRoleValue(isaac, EM_RoleValue_register3)
				time4=ReadRoleValue(isaac, EM_RoleValue_register4)
				--say(OwnerID(),"time4="..time4)
				if mob1XX>0 and time2==1 or time2==0 then
					time2=1
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
							for i = 0 , NPCXX do
								ID=GetSearchResult() 	
								if ReadRoleValue(ID , EM_RoleValue_OrgID) == boss1_id[play_Mode] then ---1王號碼
									if hatelistcount(ID)~=0  then
										time2=0
									end	
									if hatelistcount(ID)~=0 and time3<3 then
										WriteRoleValue(isaac,EM_RoleValue_register4,1)
										time4=ReadRoleValue(isaac, EM_RoleValue_register4)
										--say(OwnerID(),"time4="..time4)
										WriteRoleValue(isaac,EM_RoleValue_Register3,time3+1)
										mob2=CreateObjByFlag(106134,781014,121,1)
										SetModeEx( mob2  , EM_SetModeType_HideName, false )					---名稱
										SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
										SetModeEx( mob2  , EM_SetModeType_Mark, false )						---標記
										SetModeEx( mob2  , EM_SetModeType_Show, false )						---秀出
										SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )				---索敵
										SetModeEx( mob2  , EM_SetModeType_Fight , false )					---可砍殺攻擊
										ic_WriteRoleValue(mob2,0,isaac)
										AddToPartition(mob2,RoomID)
										BeginPlot( mob2 , "ic_MOB_23_BOSS1_12" , 0 )
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,101,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,102,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,103,0)
										sleep(50)
										DelObj(mob2)
									end	
									if hatelistcount(ID)==0 then
										WriteRoleValue(isaac,EM_RoleValue_Register3,0)
										local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
										local ID=GetSearchResult()
										local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
											for i = 0 , NPCXX do
												ID=GetSearchResult() 
												ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
													if ID2==mob2_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0 then---衝王小怪
														DelObj(ID)
														WriteRoleValue(isaac,EM_RoleValue_register4,0)
													end
											end
									end
								end	
							end
					if time4==0 then		
						mob1=CreateObjByFlag(106134,781014,122,1)
						SetModeEx( mob1  , EM_SetModeType_HideName, false )					---名稱
						SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
						SetModeEx( mob1  , EM_SetModeType_Mark, false )						---標記
						SetModeEx( mob1  , EM_SetModeType_Show, false )						---秀出
						SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )				---索敵
						SetModeEx( mob1  , EM_SetModeType_Fight , false )					---可砍殺攻擊
						ic_WriteRoleValue(mob1,0,isaac)
						AddToPartition(mob1,RoomID)
						WriteRoleValue(isaac,EM_RoleValue_register1,0)
						BeginPlot( mob1 , "ic_MOB_23_BOSS1_1" , 0 )
						sleep(40)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,111,0)
						sleep(40)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,112,0)
						sleep(40)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,113,0)
						sleep(40)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,114,0)
						sleep(40)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,115,0)
						sleep(50)
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
							for i = 0 , NPCXX do
								ID=GetSearchResult() 
								ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
									if ID2==mob1_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0  then--路上小怪
										AddBuff(ID,620915,0 ,-1 )
										DelObj(ID)
										mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
										WriteRoleValue(isaac,EM_RoleValue_register1,mob1XX+1)
									end
							end
						DelObj(mob1)
					end	
				end
				if time4==0  then
					mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
					--say(OwnerID(),"mob1XX="..mob1XX)
					if mob1XX==0 then
						break
					end	
				end	
				time1=0
			end	
		end	
	end
end
function ic_MOB_23_BOSS1_1() --路上列車
	local isaac=OwnerID()
	local mob_id={106128,106128,106128}														---守衛號碼
	local dis = 15
	local count =3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	
end
function ic_MOB_23_BOSS1_12() --衝王列車
	local isaac=OwnerID()
	local mob_id={106129,106129,106129}														---守衛號碼
	local dis = 15
	local count =3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
end
function ic_MOB_23_BOSS1_3KK()---列車怪用ai
	local mob=OwnerID()
	local ZoneID=ic_ReadRoleValue(mob,17)
	local Zone={146,147,148}
	SetPlot(mob,"dead","ic_MOB_23_BOSS1_3XX",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_3(498316,0,30,5,1,0,
						498322,0,10,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_3(498316,0,30,5,1,0,
						498322,0,10,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_3(498316,0,30,5,1,0,
						498322,0,10,11,3,0,
						498306,0,10,20,3,0)
	end
end
function ic_MOB_23_BOSS1_3XX()---列車怪用ai
	DelObj(OwnerID())
end
----------------------------------------------------------------------2王列車
function ic_MOB_23_BOSS2_0()--(6人車對規律走)沒殺光BOSS開戰衝進去 
local isaac=OwnerID()
local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
local mob1
local mob2
local time1=0
local time2=0
local time3=0
local time4=0
local mob1XX=0
local boss1X=0
local boss1XX=0	
local Search = SearchRangePlayer (isaac, 100)
local gogo=0
WriteRoleValue(isaac,EM_RoleValue_register9,0)
local boss2_id={106307,106307,106307}														---2王
local mob1_id={106153,106153,106153}														---路上
local mob2_id={106152,106152,106152}														---王房間
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}																	
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,0,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,0)
	while true do
		sleep(10)
		gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
		if gogo==0 then
			Search = SearchRangePlayer (isaac, 100 )
			for i = 0 , table.getn(Search)	do
				if ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ~= 0 then 
					--say(OwnerID(),"1")
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)	
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+1)
				elseif ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ==0 then
					--say(OwnerID(),"2")
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+0)
				end	
			end
		elseif gogo~=0 then
			time1=time1+1
			if time1>=10 then
				mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
				time3=ReadRoleValue(isaac, EM_RoleValue_register3)
				time4=ReadRoleValue(isaac, EM_RoleValue_register4)
				--say(OwnerID(),"mob1XX="..mob1XX)
				if mob1XX>0 and time2==1 or time2==0 then
					time2=1
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
							for i = 0 , NPCXX do
								ID=GetSearchResult() 	
								if ReadRoleValue(ID , EM_RoleValue_OrgID) == boss2_id[play_Mode] then ---2王號碼
									if hatelistcount(ID)~=0  then
										time2=0
									end
									if hatelistcount(ID)~=0 and time3<3 then
										WriteRoleValue(isaac,EM_RoleValue_register4,1)
										time4=ReadRoleValue(isaac, EM_RoleValue_register4)
										WriteRoleValue(isaac,EM_RoleValue_Register3,time3+1)
										mob2=CreateObjByFlag(106134,781014,221,1)
										SetModeEx( mob2  , EM_SetModeType_HideName, false )					---名稱
										SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
										SetModeEx( mob2  , EM_SetModeType_Mark, false )						---標記
										SetModeEx( mob2  , EM_SetModeType_Show, false )						---秀出
										SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )				---索敵
										SetModeEx( mob2  , EM_SetModeType_Fight , false )					---可砍殺攻擊
										ic_WriteRoleValue(mob2,0,isaac)
										AddToPartition(mob2,RoomID)
										BeginPlot( mob2 , "ic_MOB_23_BOSS2_12" , 0 )
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,201,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,202,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,203,0)
										sleep(50)
										DelObj(mob2)
									end	
									if hatelistcount(ID)==0 then
										WriteRoleValue(isaac,EM_RoleValue_Register3,0)
										local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
										local ID=GetSearchResult()
										local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
											for i = 0 , NPCXX do
												ID=GetSearchResult() 
												ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
													if ID2==mob2_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0 then---衝王小怪
														DelObj(ID)
														WriteRoleValue(isaac,EM_RoleValue_register4,0)
													end
											end
									end
								end	
							end
					if time4==0 then		
						mob1=CreateObjByFlag(106134,781014,222,1)
						SetModeEx( mob1  , EM_SetModeType_HideName, false )					---名稱
						SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
						SetModeEx( mob1  , EM_SetModeType_Mark, false )						---標記
						SetModeEx( mob1  , EM_SetModeType_Show, false )						---秀出
						SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )				---索敵
						SetModeEx( mob1  , EM_SetModeType_Fight , false )					---可砍殺攻擊
						ic_WriteRoleValue(mob1,0,isaac)
						AddToPartition(mob1,RoomID)
						WriteRoleValue(isaac,EM_RoleValue_register1,0)
						BeginPlot( mob1 , "ic_MOB_23_BOSS2_1" , 0 )
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,211,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,212,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,213,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,214,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,215,0)
						sleep(50)
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
							for i = 0 , NPCXX do
								ID=GetSearchResult() 
								ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
									if ID2==mob1_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0  then--路上小怪
										AddBuff(ID,620915,0 ,-1 )
										DelObj(ID)
										mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
										WriteRoleValue(isaac,EM_RoleValue_register1,mob1XX+1)
									end
							end
						DelObj(mob1)
					end	
				end
				if time4==0 then
					mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
					--say(OwnerID(),"mob1XX="..mob1XX)
					if mob1XX==0 then
						break
					end	
				end	
				time1=0
			end	
		end	
	end
end
function ic_MOB_23_BOSS2_1() --路上列車
	local isaac=OwnerID()
	local mob_id={106153,106153,106153}														---守衛號碼
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	
end
function ic_MOB_23_BOSS2_12() --衝王列車
	local isaac=OwnerID()
	local mob_id={106152,106152,106152}														---守衛號碼
	local dis = 15
	local count =3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
end
----------------------------------------------------------------------3王列車
function ic_MOB_23_BOSS3_0()--(6人車對規律走)沒殺光BOSS開戰衝進去 
local isaac=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss3_id=106604																		---1王
local mob1_id=106155																		---路上
local mob2_id=106154																		---王房間
local mob1
local mob2
local time1=0
local time2=0
local time3=0
local time4=0
local mob1XX=0
local boss1X=0
local boss1XX=0	
local Search = SearchRangePlayer (isaac, 100)
local gogo=0
WriteRoleValue(isaac,EM_RoleValue_register9,0)
local boss3_id={106604,106604,106604}														---3王
local mob1_id={106155,106155,106155}														---路上
local mob2_id={106154,106154,106154}														---王房間
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}																	
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,0,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,0)
	while true do
		sleep(10)
		gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
		if gogo==0 then
			Search = SearchRangePlayer (isaac, 100 )
			for i = 0 , table.getn(Search)	do
				if ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ~= 0 then 
					--say(OwnerID(),"1")
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)	
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+1)
				elseif ReadRoleValue(Search[i]  , EM_RoleValue_VOC ) ==0 then
					--say(OwnerID(),"2")
					gogo=ReadRoleValue(isaac,EM_RoleValue_register9)
					WriteRoleValue(isaac,EM_RoleValue_register9,gogo+0)
				end	
			end
		elseif gogo~=0 then
			time1=time1+1
			if time1>=10 then
				mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
				time3=ReadRoleValue(isaac, EM_RoleValue_register3)
				time4=ReadRoleValue(isaac, EM_RoleValue_register4)
				--say(OwnerID(),"mob1XX="..mob1XX)
				if mob1XX>0 and time2==1 or time2==0 then
					time2=1
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
							for i = 0 , NPCXX do
								ID=GetSearchResult() 	
								if ReadRoleValue(ID , EM_RoleValue_OrgID) == boss3_id[play_Mode] then ---3王號碼
									if hatelistcount(ID)~=0  then
										time2=0
									end
									if hatelistcount(ID)~=0 and time3<3 then
										WriteRoleValue(isaac,EM_RoleValue_register4,1)
										time4=ReadRoleValue(isaac, EM_RoleValue_register4)
										WriteRoleValue(isaac,EM_RoleValue_Register3,time3+1)
										mob2=CreateObjByFlag(106134,781014,321,1)
										SetModeEx( mob2  , EM_SetModeType_HideName, false )					---名稱
										SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
										SetModeEx( mob2  , EM_SetModeType_Mark, false )						---標記
										SetModeEx( mob2  , EM_SetModeType_Show, false )						---秀出
										SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )				---索敵
										SetModeEx( mob2  , EM_SetModeType_Fight , false )					---可砍殺攻擊
										ic_WriteRoleValue(mob2,0,isaac)
										AddToPartition(mob2,RoomID)
										BeginPlot( mob2 , "ic_MOB_23_BOSS3_12" , 0 )
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,301,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,302,0)
										sleep(20)
										MoveToFlagEnabled(mob2, false)
										WriteRoleValue( mob2,EM_RoleValue_IsWalk,0)
										Hide(mob2)
										Show(mob2,RoomID)
										DW_MoveToFlag( mob2 , 781014 ,303,0)
										sleep(50)
										DelObj(mob2)
									end	
									if hatelistcount(ID)==0 then
										WriteRoleValue(isaac,EM_RoleValue_Register3,0)
										local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
										local ID=GetSearchResult()
										local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
											for i = 0 , NPCXX do
												ID=GetSearchResult() 
												ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
													if ID2==mob2_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0 then---衝王小怪
														DelObj(ID)
														WriteRoleValue(isaac,EM_RoleValue_register4,0)
													end
											end
									end
								end	
							end
					if time4==0 then		
						mob1=CreateObjByFlag(106134,781014,322,1)
						SetModeEx( mob1  , EM_SetModeType_HideName, false )					---名稱
						SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
						SetModeEx( mob1  , EM_SetModeType_Mark, false )						---標記
						SetModeEx( mob1  , EM_SetModeType_Show, false )						---秀出
						SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )				---索敵
						SetModeEx( mob1  , EM_SetModeType_Fight , false )					---可砍殺攻擊
						ic_WriteRoleValue(mob1,0,isaac)
						AddToPartition(mob1,RoomID)
						WriteRoleValue(isaac,EM_RoleValue_register1,0)
						BeginPlot( mob1 , "ic_MOB_23_BOSS3_1" , 0 )
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,311,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,312,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,313,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,314,0)
						sleep(20)
						MoveToFlagEnabled(mob1, false)
						WriteRoleValue( mob1,EM_RoleValue_IsWalk,0)
						Hide(mob1)
						Show(mob1,RoomID)
						DW_MoveToFlag( mob1 , 781014 ,315,0)
						sleep(50)
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
							for i = 0 , NPCXX do
								ID=GetSearchResult() 
								ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
									if ID2==mob1_id[play_Mode] and  ReadRoleValue(ID,EM_RoleValue_IsDead)== 0  then--路上小怪
										AddBuff(ID,620915,0 ,-1 )
										DelObj(ID)
										mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
										WriteRoleValue(isaac,EM_RoleValue_register1,mob1XX+1)
									end
							end
						DelObj(mob1)
					end	
				end
				if time4==0 then
					mob1XX=ReadRoleValue(isaac, EM_RoleValue_register1)
					--say(OwnerID(),"mob1XX="..mob1XX)
					if mob1XX==0 then
						break
					end	
				end	
				time1=0
			end	
		end	
	end
end
function ic_MOB_23_BOSS3_1() --路上列車
	local isaac=OwnerID()
	local mob_id={106155,106155,106155}														---守衛號碼
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	
end
function ic_MOB_23_BOSS3_12() --衝王列車
	local isaac=OwnerID()
	local mob_id={106154,106154,106154}														---守衛號碼
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local Luck=0
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域
	local Zone={146,147,148}
	local mob=ic_ReadRoleValue(isaac,0)
	local play_Mode=ic_ReadRoleValue(mob,0)
	Luck=DW_Rand(2)
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1	
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	if Luck==1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,0)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,0)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	if Luck==2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1,1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,1-1)
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,2,-1)
		ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(mob_id[play_Mode],Matrix,3,-1)
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
end