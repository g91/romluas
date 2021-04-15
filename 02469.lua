function ic_106021_BOSSXX()																	---死亡用---12人-簡單都一樣AI
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register10,1)
end 
function ic_106021_100()																	---測試距離用---12人-簡單都一樣AI
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local BOSS9898=GetDistance( OwnerID(), Boss)
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		if  BOSS9898>=400 then
			WriteRoleValue(isaac,EM_RoleValue_register9,1)
		end
	end
end
function ic_106021_mob()																	---石住走路用---12人-簡單都一樣AI
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local BOSS=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob0000	---哪根石柱
local mob9898	---開始走
local mob1234	---走哪個旗標
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		mob1234=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob0000=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if mob9898==1 then
			if mob1234==1 then
					sleep(5)
					DW_MoveToFlag( OwnerID() , 780934 ,52,0)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) 				---可砍殺
					if 	mob0000==1 then
						if CheckBuff( OwnerID(), 509621 ) == true then 
								CastSpellLV( OwnerID()  ,OwnerID() , 497595 ,0)
								AddBuff(Boss,509625,0 ,-1 )
								WriteRoleValue(isaac,EM_RoleValue_register1,1)
								CancelBuff(OwnerID(), 509621)
						end	
					end	
					if 	mob0000==2 then
						if CheckBuff( OwnerID(), 509622 ) == true then 
								CastSpellLV( OwnerID()  ,OwnerID() , 497596 ,0)
								AddBuff(Boss,509626,0 ,-1 )
								WriteRoleValue(isaac,EM_RoleValue_register2,1)
								CancelBuff(OwnerID(), 509622)
						end	
					end	
					if 	mob0000==3 then
						if CheckBuff( OwnerID(), 509623 ) == true then 	
								CastSpellLV( OwnerID()  ,OwnerID() , 497597 ,0)
								AddBuff(Boss,509627,0 ,-1 )
								WriteRoleValue(isaac,EM_RoleValue_register3,1)
								CancelBuff(OwnerID(), 509623)
						end	
					end
					if 	mob0000==4 then
						if CheckBuff( OwnerID(), 509624 ) == true then 	
								CastSpellLV( OwnerID()  ,OwnerID() , 497598 ,0)
								AddBuff(Boss,509628,0 ,-1 )
								WriteRoleValue(isaac,EM_RoleValue_register4,1)
								CancelBuff(OwnerID(), 509624)
						end	
					end
					WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,2)
			end	
			if	mob1234==2 then
					sleep(5)
					DW_MoveToFlag( OwnerID() , 780934 ,53,0)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) 				---可砍殺
				if 	mob0000==1 then
					if CheckBuff( OwnerID(), 509621 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497595 ,0)
							AddBuff(Boss,509625,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register1,1)
							CancelBuff(OwnerID(), 509621)
					end	
				end	
				if 	mob0000==2 then
					if CheckBuff( OwnerID(), 509622 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497596 ,0)
							AddBuff(Boss,509626,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register2,1)
							CancelBuff(OwnerID(), 509622)
					end	
				end	
				if 	mob0000==3 then
					if CheckBuff( OwnerID(), 509623 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497597 ,0)
							AddBuff(Boss,509627,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register3,1)
							CancelBuff(OwnerID(), 509623)
					end	
				end
				if 	mob0000==4 then
					if CheckBuff( OwnerID(), 509624 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497598 ,0)
							AddBuff(Boss,509628,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register4,1)
							CancelBuff(OwnerID(), 509624)
					end	
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,3)
			end	
			if	mob1234==3 then
					sleep(5)
					DW_MoveToFlag( OwnerID() , 780934 ,54,0)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) 				---可砍殺
				if 	mob0000==1 then
					if CheckBuff( OwnerID(), 509621 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497595 ,0)
							AddBuff(Boss,509625,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register1,1)
							CancelBuff(OwnerID(), 509621)
					end	
				end	
				if 	mob0000==2 then
					if CheckBuff( OwnerID(), 509622 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497596 ,0)
							AddBuff(Boss,509626,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register2,1)
							CancelBuff(OwnerID(), 509622)
					end	
				end	
				if 	mob0000==3 then
					if CheckBuff( OwnerID(), 509623 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497597 ,0)
							AddBuff(Boss,509627,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register3,1)
							CancelBuff(OwnerID(), 509623)
					end	
				end
				if 	mob0000==4 then
					if CheckBuff( OwnerID(), 509624 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497598 ,0)
							AddBuff(Boss,509628,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register4,1)
							CancelBuff(OwnerID(), 509624)
					end	
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,4)
			end	
			if	mob1234==4 then
					sleep(5)
					DW_MoveToFlag( OwnerID() , 780934 ,51,0)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) 				---可砍殺
				if 	mob0000==1 then
					if CheckBuff( OwnerID(), 509621 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497595 ,0)
							AddBuff(Boss,509625,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register1,1)
							CancelBuff(OwnerID(), 509621)
					end	
				end	
				if 	mob0000==2 then
					if CheckBuff( OwnerID(), 509622 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497596 ,0)
							AddBuff(Boss,509626,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register2,1)
							CancelBuff(OwnerID(), 509622)
					end	
				end	
				if 	mob0000==3 then
					if CheckBuff( OwnerID(), 509623 ) == true then 	
							CastSpellLV( OwnerID()  ,OwnerID() , 497597 ,0)
							AddBuff(Boss,509627,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register3,1)
							CancelBuff(OwnerID(), 509623)
					end	
				end
				if 	mob0000==4 then
					if CheckBuff( OwnerID(), 509624 ) == true then 
							CastSpellLV( OwnerID()  ,OwnerID() , 497598 ,0)
							AddBuff(Boss,509628,0 ,-1 )
							WriteRoleValue(isaac,EM_RoleValue_register4,1)
							CancelBuff(OwnerID(), 509624)
					end	
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,1)
			end
		
		end
		sleep(10)
	end
end											
function ic_106021_nokk() 																	--點石棺---12人-簡單都一樣AI		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local npc=TargetID()
local time1=0
local time2=0
	if CountBodyItem( OwnerID(), 209589 ) == 0 then 
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_01]" , 2 )
	elseif	CountBodyItem( OwnerID(), 209589 ) ~= 0 then
		ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_02]" , 2 )
		DelBodyItem ( OwnerID(), 209589, 1 )
		SetModeEx( npc , EM_SetModeType_Mark, false)										---可點選(否)
		CastSpellLV( npc ,npc, 497599 ,0)
		sleep(60)
		CancelBuff(npc, 507111)
		sleep(50)
		SetModeEx( npc , EM_SetModeType_Mark, true)
	end	
end
function ic_106021_mobonkk() 																--觸發--對話(物品)真符文---12人-簡單都一樣AI		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local npc=TargetID()
local time1=0
SetPlot(npc,"touch","",0)
SetModeEx( npc , EM_SetModeType_Mark, false)
time1=ReadRoleValue(npc,EM_RoleValue_register2)
	if time1==0 then
		WriteRoleValue(npc,EM_RoleValue_register2,1)
		if CountBodyItem( OwnerID(), 209589 ) == 0 then
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_07]" , 2 )
			GiveBodyItem( OwnerID(), 209589, 1 )
			DelObj(npc)
		elseif	CountBodyItem( OwnerID(), 209589 ) ~= 0 then
			WriteRoleValue(npc,EM_RoleValue_register2,0)
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_08]" , 2 )
			sleep(30)
			SetPlot(npc,"touch","ic_106028_mobonkk",5)
			SetModeEx( npc , EM_SetModeType_Mark, true)
		end	
	end	
end
function ic_106021_mobonkkk() 																--觸發--對話(物品)假符文---12人-簡單都一樣AI		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local npc=TargetID()
local time1=0
	if time1==0 then
		SetModeEx( npc , EM_SetModeType_Mark, false)
		if CountBodyItem( OwnerID(), 209589 ) == 0 then
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_09]" , 2 )
			--GiveBodyItem( OwnerID(), 209589, 1 )
			DelObj(npc)
		elseif	CountBodyItem( OwnerID(), 209589 ) ~= 0 then
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_105641_08]" , 2 )
			SetModeEx( npc , EM_SetModeType_Mark, true)
		end	
	end	
end			
function ic_106021_01()  																	---第10口袋固定死亡劇情用--第9口袋固定測試距離用					--say(OwnerID(),"boss44="..boss44)														
	local isaac=OwnerID()																	---控制器
	local open=0						  													---開戰旗標				        
	local killidtime=0																		---狂暴計時
	local BOSSXX=0																			---BOSS死亡				
	local door1																				---阻擋門
	local BOSS9898=0																		---測試距離
	local Boss100																			---測試距離用球
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(106021,780934,1,1) 											---BOSS創在  旗標1
	local door=CreateObjByFlag(106006,780934,2,1)											---阻擋門(王死才會消失)
	local NPC									
	local mobkkplay1=0																		---第1口袋	石住BUFF有沒有消失用
	local mobkkplay2=0																		---第2口袋	石住BUFF有沒有消失用
	local mobkkplay3=0																		---第3口袋	石住BUFF有沒有消失用
	local mobkkplay4=0																		---第4口袋	石住BUFF有沒有消失用
	local mob9898=0																			---第5口袋	石住走路用
	local mob1
	local mob2
	local mob3
	local mob4
	local mob01											
	local mob02
	local mob03
	local mob04
	local mob05
	local mob06
	local mob07
	local mob08
	local mob09
	local mob10
	local mob11
	local mob12
	local mob13
	local mob14
	local mob15
	local mob16
	local mob17
	local mob18
	local mob19
	local mob20
	local mob21
	local mob22
	local mob23
	local mob24
	local bossstop=0
	local time1=0
	local time2=0
	local time3=0
	local Luck=0
	local Luck1=0
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )							 ---讀取血量
	local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )     						 ---讀取目前血量
	local HPPercent = NowHP / MaxHP	
	SetModeEx( Boss , EM_SetModeType_Move, false) 							---移動	
	SetModeEx( Boss , EM_SetModeType_Fight, false) 						---可砍殺
		mob1=CreateObjByFlag(106035,780934,51,1)
			SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)								---索敵(否)
			SetModeEx( mob1 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob1 , EM_SetModeType_Strikback, false) 									---反擊
		mob2=CreateObjByFlag(106036,780934,52,1)
			SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)								---索敵(否)
			SetModeEx( mob2 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob2 , EM_SetModeType_Strikback, false) 									---反擊
		mob3=CreateObjByFlag(106037,780934,53,1)
			SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)								---索敵(否)
			SetModeEx( mob3 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob3 , EM_SetModeType_Strikback, false) 
		mob4=CreateObjByFlag(106038,780934,54,1)
			SetModeEx( mob4 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)								---索敵(否)
			SetModeEx( mob4 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob4 , EM_SetModeType_Strikback, false)
		Luck1=DW_Rand(6)		
		mob01=CreateObjByFlag(105650,780934,61,1)
		SetModeEx( mob01 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob01 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob01 , EM_SetModeType_NotShowHPMP, true)								---索敵(否)
		mob02=CreateObjByFlag(105650,780934,62,1)
		SetModeEx( mob02 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob02 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob02 , EM_SetModeType_NotShowHPMP, true)
		mob03=CreateObjByFlag(105650,780934,63,1)
		SetModeEx( mob03 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob03 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob03 , EM_SetModeType_NotShowHPMP, true)
		mob04=CreateObjByFlag(105650,780934,64,1)
		SetModeEx( mob04 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob04 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob04 , EM_SetModeType_NotShowHPMP, true)
		mob05=CreateObjByFlag(105650,780934,65,1)
		SetModeEx( mob05 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob05 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob05 , EM_SetModeType_NotShowHPMP, true)
		mob06=CreateObjByFlag(105650,780934,66,1)
		SetModeEx( mob06 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob06 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob06 , EM_SetModeType_NotShowHPMP, true)
		mob07=CreateObjByFlag(105650,780934,67,1)
		SetModeEx( mob07 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob07 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob07 , EM_SetModeType_NotShowHPMP, true)
		mob08=CreateObjByFlag(105650,780934,68,1)
		SetModeEx( mob08 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob08 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob08 , EM_SetModeType_NotShowHPMP, true)
		mob09=CreateObjByFlag(105650,780934,69,1)
		SetModeEx( mob09 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob09 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob09 , EM_SetModeType_NotShowHPMP, true)
		mob010=CreateObjByFlag(105650,780934,70,1)
		SetModeEx( mob010 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob010 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob010 , EM_SetModeType_NotShowHPMP, true)
		mob011=CreateObjByFlag(105650,780934,71,1)
		SetModeEx( mob011 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob011 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob011 , EM_SetModeType_NotShowHPMP, true)
		mob012=CreateObjByFlag(105650,780934,72,1)
		SetModeEx( mob012 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob012 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob012 , EM_SetModeType_NotShowHPMP, true)
		mob013=CreateObjByFlag(105650,780934,73,1)
		SetModeEx( mob013 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob013 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob013 , EM_SetModeType_NotShowHPMP, true)
		mob014=CreateObjByFlag(105650,780934,74,1)
		SetModeEx( mob014 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob014 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob014 , EM_SetModeType_NotShowHPMP, true)
		mob015=CreateObjByFlag(105650,780934,75,1)
		SetModeEx( mob015 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob015 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob015 , EM_SetModeType_NotShowHPMP, true)
		mob016=CreateObjByFlag(105650,780934,76,1)
		SetModeEx( mob016 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob016 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob016 , EM_SetModeType_NotShowHPMP, true)
		mob017=CreateObjByFlag(105650,780934,77,1)
		SetModeEx( mob017 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob017 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob017 , EM_SetModeType_NotShowHPMP, true)
		mob018=CreateObjByFlag(105650,780934,78,1)
		SetModeEx( mob018 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob018 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob018 , EM_SetModeType_NotShowHPMP, true)
		mob019=CreateObjByFlag(105650,780934,79,1)
		SetModeEx( mob019 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob019 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob019 , EM_SetModeType_NotShowHPMP, true)
		mob020=CreateObjByFlag(105650,780934,80,1)
		SetModeEx( mob020 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob020 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob020 , EM_SetModeType_NotShowHPMP, true)
		mob021=CreateObjByFlag(105650,780934,81,1)
		SetModeEx( mob021 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob021 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob021 , EM_SetModeType_NotShowHPMP, true)
		mob022=CreateObjByFlag(105650,780934,82,1)
		SetModeEx( mob022 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob022 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob022 , EM_SetModeType_NotShowHPMP, true)
		mob023=CreateObjByFlag(105650,780934,83,1)
		SetModeEx( mob023 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob023 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob023 , EM_SetModeType_NotShowHPMP, true)
		mob024=CreateObjByFlag(105650,780934,84,1)
		SetModeEx( mob024 , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( mob024 , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( mob024 , EM_SetModeType_NotShowHPMP, true)
		AddToPartition(mob01,RoomID)
		AddToPartition(mob02,RoomID)
		AddToPartition(mob03,RoomID)
		AddToPartition(mob04,RoomID)
		AddToPartition(mob05,RoomID)
		AddToPartition(mob06,RoomID)
		AddToPartition(mob07,RoomID)
		AddToPartition(mob08,RoomID)
		AddToPartition(mob09,RoomID)
		AddToPartition(mob010,RoomID)
		AddToPartition(mob011,RoomID)
		AddToPartition(mob012,RoomID)
		AddToPartition(mob013,RoomID)
		AddToPartition(mob014,RoomID)
		AddToPartition(mob015,RoomID)
		AddToPartition(mob016,RoomID)
		AddToPartition(mob017,RoomID)
		AddToPartition(mob018,RoomID)
		AddToPartition(mob019,RoomID)
		AddToPartition(mob020,RoomID)
		AddToPartition(mob021,RoomID)
		AddToPartition(mob022,RoomID)
		AddToPartition(mob023,RoomID)
		AddToPartition(mob024,RoomID)
		if Luck1==1 or Luck1==3 or Luck1==5 then	---12人-簡單都一樣AI
			SetPlot(mob01,"touch","ic_106021_mobonkk",5)
			SetPlot(mob02,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob03,"touch","ic_106021_mobonkk",5)
			SetPlot(mob04,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob05,"touch","ic_106021_mobonkk",5)
			SetPlot(mob06,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob07,"touch","ic_106021_mobonkk",5)
			SetPlot(mob08,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob09,"touch","ic_106021_mobonkk",5)
			SetPlot(mob010,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob011,"touch","ic_106021_mobonkk",5)
			SetPlot(mob012,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob013,"touch","ic_106021_mobonkk",5)
			SetPlot(mob014,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob015,"touch","ic_106021_mobonkk",5)
			SetPlot(mob016,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob017,"touch","ic_106021_mobonkk",5)
			SetPlot(mob018,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob019,"touch","ic_106021_mobonkk",5)
			SetPlot(mob020,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob021,"touch","ic_106021_mobonkk",5)
			SetPlot(mob022,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob023,"touch","ic_106021_mobonkk",5)
			SetPlot(mob024,"touch","ic_106021_mobonkkk",5)
		elseif Luck1==2 or Luck1==4 or Luck1==6 then	---12人-簡單都一樣AI
			SetPlot(mob01,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob02,"touch","ic_106021_mobonkk",5)
			SetPlot(mob03,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob04,"touch","ic_106021_mobonkk",5)
			SetPlot(mob05,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob06,"touch","ic_106021_mobonkk",5)
			SetPlot(mob07,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob08,"touch","ic_106021_mobonkk",5)
			SetPlot(mob09,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob010,"touch","ic_106021_mobonkk",5)
			SetPlot(mob011,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob012,"touch","ic_106021_mobonkk",5)
			SetPlot(mob013,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob014,"touch","ic_106021_mobonkk",5)
			SetPlot(mob015,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob016,"touch","ic_106021_mobonkk",5)
			SetPlot(mob017,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob018,"touch","ic_106021_mobonkk",5)
			SetPlot(mob019,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob020,"touch","ic_106021_mobonkk",5)
			SetPlot(mob021,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob022,"touch","ic_106021_mobonkk",5)
			SetPlot(mob023,"touch","ic_106021_mobonkkk",5)
			SetPlot(mob024,"touch","ic_106021_mobonkk",5)
		end
		AddBuff(mob1,509641,0 ,-1 )
		AddBuff(mob2,509641,0 ,-1 )	
		AddBuff(mob3,509641,0 ,-1 )
		AddBuff(mob4,509641,0 ,-1 )	
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		WriteRoleValue(mob1,EM_RoleValue_register2,1)
		WriteRoleValue(mob2,EM_RoleValue_register2,2)
		WriteRoleValue(mob3,EM_RoleValue_register2,3)
		WriteRoleValue(mob4,EM_RoleValue_register2,4)
		WriteRoleValue(mob1,EM_RoleValue_register10,1)
		WriteRoleValue(mob2,EM_RoleValue_register10,2)
		WriteRoleValue(mob3,EM_RoleValue_register10,3)
		WriteRoleValue(mob4,EM_RoleValue_register10,4)
		WriteRoleValue(mob1,EM_RoleValue_register8,BOSS)
		WriteRoleValue(mob2,EM_RoleValue_register8,BOSS)
		WriteRoleValue(mob3,EM_RoleValue_register8,BOSS)
		WriteRoleValue(mob4,EM_RoleValue_register8,BOSS)
		WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
		WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
		WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
		WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
		NPC=CreateObjByFlag(105649,780934,5,1)
		SetModeEx( NPC , EM_SetModeType_Mark, false)										---可點選(否)
		SetModeEx( NPC , EM_SetModeType_ShowRoleHead, false) 								---頭相框(否)
		SetModeEx( NPC , EM_SetModeType_Obstruct, false) 									---阻擋(是)
		SetModeEx( NPC , EM_SetModeType_Strikback, false) 									---反擊
		SetModeEx( NPC , EM_SetModeType_Move, false) 										---移動	
		SetModeEx( NPC , EM_SetModeType_Fight, false) 										---可砍殺
		SetModeEx( NPC , EM_SetModeType_Searchenemy, false)								---索敵(否)
		SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( door , EM_SetModeType_Mark, false)										---可點選(否)
			SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 								---頭相框(否)
			SetModeEx( door , EM_SetModeType_Obstruct, true) 									---阻擋(是)
			SetModeEx( door , EM_SetModeType_Strikback, false) 									---反擊
			SetModeEx( door , EM_SetModeType_Move, false) 										---移動	
			SetModeEx( door , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
			SetModeEx( door , EM_SetModeType_Searchenemy, false)								---索敵(否)
		door1=CreateObjByFlag(106006,780934,3,1)									---王身後阻擋門
			SetModeEx( door1 , EM_SetModeType_Mark, false)							---可點選(否)
			SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 					---頭像框(否)
			SetModeEx( door1 , EM_SetModeType_Obstruct, true) 						---阻擋(是)
			SetModeEx( door1 , EM_SetModeType_Strikback, false) 					---反擊
			SetModeEx( door1 , EM_SetModeType_Move, false) 							---移動	
			SetModeEx( door1 , EM_SetModeType_Fight, false) 						---可砍殺
			SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 			---是否被搜尋(否)
			SetModeEx( door1 , EM_SetModeType_Searchenemy, false)					---索敵(否)	
			AddToPartition(door1,RoomID)	
		AddToPartition(door,RoomID)	
		AddToPartition(NPC,RoomID)	
		AddToPartition(Boss,RoomID)
		SetPlot( Boss,"dead","ic_106021_BOSSXX",0 )											---掛死亡劇情---12人-簡單都一樣AI
		SetPlot(NPC,"touch","ic_106021_nokk",20)
		SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_END)
		WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   										---BOSS暫存口袋PID BOSS=isaac
		WriteRoleValue(isaac,EM_RoleValue_PID,Boss)											---isaac暫存口袋PID isaac=BOSS
	while true do
		sleep(10)
		mob9898=ReadRoleValue(isaac , EM_RoleValue_register5)	
		BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register9)								
		BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
		MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )						 		---讀取血量
		NowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )     					 		---讀取目前血量
		HPPercent = NowHP / MaxHP
			if hatelistcount(boss)==0 and open==0 then 
				if bossstop==0 then
					PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
					bossstop=1
				elseif bossstop==1 then
					SetIdleMotion( Boss ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------維持動作
					bossstop=2
				end	
			end
			if hatelistcount(boss)~=0 then    												---讀仇恨人數
				killidtime=killidtime+1
				if time2==1 then
					time3=time3+1
				end
				if mob9898==1 and time1==0 then												--- 叫石住走路
					time1=1
					time2=1
					mobkkplay1=0
					mobkkplay2=0
					mobkkplay3=0
					mobkkplay4=0
					WriteRoleValue(isaac,EM_RoleValue_register1,0)
					WriteRoleValue(isaac,EM_RoleValue_register2,0)
					WriteRoleValue(isaac,EM_RoleValue_register3,0)
					WriteRoleValue(isaac,EM_RoleValue_register4,0)
					WriteRoleValue(mob1,EM_RoleValue_register1,1)
					WriteRoleValue(mob2,EM_RoleValue_register1,1)
					WriteRoleValue(mob3,EM_RoleValue_register1,1)
					WriteRoleValue(mob4,EM_RoleValue_register1,1)
					WriteRoleValue(isaac,EM_RoleValue_register5,0)
					if HPPercent>0.6 then
						Luck=DW_Rand(6)
						if Luck==1 then
							AddBuff(mob1,509621,319 ,-1 )
							AddBuff(mob3,509623,319 ,-1 )
							SetModeEx( mob1 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob3 , EM_SetModeType_Fight, true) 										---可砍殺
						elseif Luck==2 then
							AddBuff(mob2,509622,319 ,-1 )
							AddBuff(mob4,509624,319 ,-1 )
							SetModeEx( mob2 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob4 , EM_SetModeType_Fight, true) 										---可砍殺
						elseif Luck==3 then
							AddBuff(mob1,509621,319 ,-1 )
							AddBuff(mob2,509622,319 ,-1 )
							SetModeEx( mob1 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob2 , EM_SetModeType_Fight, true) 										---可砍殺
						elseif Luck==4 then
							AddBuff(mob3,509623,319 ,-1 )
							AddBuff(mob4,509624,319 ,-1 )	
							SetModeEx( mob3 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob4 , EM_SetModeType_Fight, true) 										---可砍殺
						elseif Luck==5 then
							AddBuff(mob1,509621,319 ,-1 )
							AddBuff(mob4,509624,319 ,-1 )	
							SetModeEx( mob1 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob4 , EM_SetModeType_Fight, true) 										---可砍殺
						elseif Luck==6 then
							AddBuff(mob2,509622,319 ,-1 )
							AddBuff(mob3,509623,319,-1 )	
							SetModeEx( mob2 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob3 , EM_SetModeType_Fight, true) 										---可砍殺	
						end
					elseif	HPPercent<0.6 then
							AddBuff(mob1,509621,319 ,-1 )
							AddBuff(mob2,509622,319 ,-1 )
							AddBuff(mob3,509623,319 ,-1 )
							AddBuff(mob4,509624,319 ,-1 )	
							SetModeEx( mob1 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob2 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob3 , EM_SetModeType_Fight, true) 										---可砍殺
							SetModeEx( mob4 , EM_SetModeType_Fight, true)
					end
				end
				if time3>=10 then
					mobkkplay1=ReadRoleValue(isaac , EM_RoleValue_register1)
					mobkkplay2=ReadRoleValue(isaac , EM_RoleValue_register2)
					mobkkplay3=ReadRoleValue(isaac , EM_RoleValue_register3)
					mobkkplay4=ReadRoleValue(isaac , EM_RoleValue_register4)
						WriteRoleValue(Boss,EM_RoleValue_register1,1)
						time1=0
						time2=0
						time3=0
				end	
				if killidtime==360 then														---狂暴時間
					WriteRoleValue(boss,EM_RoleValue_register10,1)							---狂爆了
					killidtime=0
				end
				if open==0 then
					open=1																	----開打了
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
				Boss100=Lua_DW_CreateObj("flag",104693,780934,1,0)							---測試距離用
					SetModeEx( Boss100  , EM_SetModeType_HideName, false )					---名稱
					SetModeEX( Boss100  , EM_SetModeType_Gravity , false )					---重力
					SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				---不秀頭像框
					SetModeEx( Boss100  , EM_SetModeType_Mark, false )						---標記
					SetModeEx( Boss100  , EM_SetModeType_Move, false )						---移動
					SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				---索敵
					SetModeEx( Boss100  , EM_SetModeType_Fight , false )					---可砍殺攻擊
					SetModeEx( Boss100  , EM_SetModeType_Strikback, false )					---反擊	
					AddToPartition(Boss100,RoomID)
					WriteRoleValue(Boss100,EM_RoleValue_PID,isaac)
					WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
					BeginPlot(Boss100 , "ic_106021_100" , 0)								---測試距離---12人-簡單都一樣AI	
					ScriptMessage( Boss, -1 , 2 , "[SC_105641_03]" , 2 )				---開打對話---
					PlayMotion ( boss,ruFUSION_ACTORSTATE_SLEEP_END	 )---------------第1ㄍ動作
					sleep(20)
					SetModeEx( Boss , EM_SetModeType_Move, true) 							---移動	
					SetModeEx( Boss , EM_SetModeType_Fight, true) 						---可砍殺
					BeginPlot(boss , "ic_106021_02" , 0)									---命令角色做事情
					BeginPlot(mob1 , "ic_106021_mob" , 0)									---命令角色做事情---12人-簡單都一樣AI
					BeginPlot(mob2 , "ic_106021_mob" , 0)									---命令角色做事情---12人-簡單都一樣AI
					BeginPlot(mob3 , "ic_106021_mob" , 0)									---命令角色做事情---12人-簡單都一樣AI
					BeginPlot(mob4 , "ic_106021_mob" , 0)									---命令角色做事情---12人-簡單都一樣AI
					SetModeEx( NPC , EM_SetModeType_Mark, true)								---可點選
				end
			end	
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then										---開戰後仇恨表沒人
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					---王沒死 玩家滅團
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(20)
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					sleep(20)
					DelObj(boss)                                        					---沒死自己殺死王
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					DelObj(mob01)
					DelObj(mob02)
					DelObj(mob03)
					DelObj(mob04)
					DelObj(mob05)
					DelObj(mob06)
					DelObj(mob07)
					DelObj(mob08)
					DelObj(mob09)
					DelObj(mob010)
					DelObj(mob011)
					DelObj(mob012)
					DelObj(mob013)
					DelObj(mob014)
					DelObj(mob015)
					DelObj(mob016)
					DelObj(mob017)
					DelObj(mob018)
					DelObj(mob019)
					DelObj(mob020)
					DelObj(mob021)
					DelObj(mob022)
					DelObj(mob023)
					DelObj(mob024)
					DelObj(NPC)
					DelObj(Boss100)
					mobkkplay1=0
					mobkkplay2=0
					mobkkplay3=0
					mobkkplay4=0
					bossstop=0
					WriteRoleValue(isaac,EM_RoleValue_register1,0)
					WriteRoleValue(isaac,EM_RoleValue_register2,0)
					WriteRoleValue(isaac,EM_RoleValue_register3,0)
					WriteRoleValue(isaac,EM_RoleValue_register4,0)
					WriteRoleValue(isaac,EM_RoleValue_register5,0)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register10,0)
					sleep(30)
					mob1=CreateObjByFlag(106035,780934,51,1)
						SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
						SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)								---索敵(否)
						SetModeEx( mob1 , EM_SetModeType_Fight, false) 										---可砍殺
						SetModeEx( mob1 , EM_SetModeType_Strikback, false) 									---反擊
					mob2=CreateObjByFlag(106036,780934,52,1)
						SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
						SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)								---索敵(否)
						SetModeEx( mob2 , EM_SetModeType_Fight, false) 										---可砍殺
						SetModeEx( mob2 , EM_SetModeType_Strikback, false) 									---反擊
					mob3=CreateObjByFlag(106037,780934,53,1)
						SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
						SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)								---索敵(否)
						SetModeEx( mob3 , EM_SetModeType_Fight, false) 										---可砍殺
						SetModeEx( mob3 , EM_SetModeType_Strikback, false) 
					mob4=CreateObjByFlag(106038,780934,54,1)
						SetModeEx( mob4 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
						SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)								---索敵(否)
						SetModeEx( mob4 , EM_SetModeType_Fight, false) 										---可砍殺
						SetModeEx( mob4 , EM_SetModeType_Strikback, false)
					Luck1=DW_Rand(6)		
					mob01=CreateObjByFlag(105650,780934,61,1)
					SetModeEx( mob01 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob01 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob01 , EM_SetModeType_NotShowHPMP, true)								---索敵(否)
					mob02=CreateObjByFlag(105650,780934,62,1)
					SetModeEx( mob02 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob02 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob02 , EM_SetModeType_NotShowHPMP, true)
					mob03=CreateObjByFlag(105650,780934,63,1)
					SetModeEx( mob03 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob03 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob03 , EM_SetModeType_NotShowHPMP, true)
					mob04=CreateObjByFlag(105650,780934,64,1)
					SetModeEx( mob04 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob04 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob04 , EM_SetModeType_NotShowHPMP, true)
					mob05=CreateObjByFlag(105650,780934,65,1)
					SetModeEx( mob05 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob05 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob05 , EM_SetModeType_NotShowHPMP, true)
					mob06=CreateObjByFlag(105650,780934,66,1)
					SetModeEx( mob06 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob06 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob06 , EM_SetModeType_NotShowHPMP, true)
					mob07=CreateObjByFlag(105650,780934,67,1)
					SetModeEx( mob07 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob07 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob07 , EM_SetModeType_NotShowHPMP, true)
					mob08=CreateObjByFlag(105650,780934,68,1)
					SetModeEx( mob08 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob08 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob08 , EM_SetModeType_NotShowHPMP, true)
					mob09=CreateObjByFlag(105650,780934,69,1)
					SetModeEx( mob09 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob09 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob09 , EM_SetModeType_NotShowHPMP, true)
					mob010=CreateObjByFlag(105650,780934,70,1)
					SetModeEx( mob010 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob010 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob010 , EM_SetModeType_NotShowHPMP, true)
					mob011=CreateObjByFlag(105650,780934,71,1)
					SetModeEx( mob011 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob011 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob011 , EM_SetModeType_NotShowHPMP, true)
					mob012=CreateObjByFlag(105650,780934,72,1)
					SetModeEx( mob012 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob012 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob012 , EM_SetModeType_NotShowHPMP, true)
					mob013=CreateObjByFlag(105650,780934,73,1)
					SetModeEx( mob013 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob013 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob013 , EM_SetModeType_NotShowHPMP, true)
					mob014=CreateObjByFlag(105650,780934,74,1)
					SetModeEx( mob014 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob014 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob014 , EM_SetModeType_NotShowHPMP, true)
					mob015=CreateObjByFlag(105650,780934,75,1)
					SetModeEx( mob015 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob015 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob015 , EM_SetModeType_NotShowHPMP, true)
					mob016=CreateObjByFlag(105650,780934,76,1)
					SetModeEx( mob016 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob016 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob016 , EM_SetModeType_NotShowHPMP, true)
					mob017=CreateObjByFlag(105650,780934,77,1)
					SetModeEx( mob017 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob017 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob017 , EM_SetModeType_NotShowHPMP, true)
					mob018=CreateObjByFlag(105650,780934,78,1)
					SetModeEx( mob018 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob018 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob018 , EM_SetModeType_NotShowHPMP, true)
					mob019=CreateObjByFlag(105650,780934,79,1)
					SetModeEx( mob019 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob019 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob019 , EM_SetModeType_NotShowHPMP, true)
					mob020=CreateObjByFlag(105650,780934,80,1)
					SetModeEx( mob020 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob020 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob020 , EM_SetModeType_NotShowHPMP, true)
					mob021=CreateObjByFlag(105650,780934,81,1)
					SetModeEx( mob021 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob021 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob021 , EM_SetModeType_NotShowHPMP, true)
					mob022=CreateObjByFlag(105650,780934,82,1)
					SetModeEx( mob022 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob022 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob022 , EM_SetModeType_NotShowHPMP, true)
					mob023=CreateObjByFlag(105650,780934,83,1)
					SetModeEx( mob023 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob023 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob023 , EM_SetModeType_NotShowHPMP, true)
					mob024=CreateObjByFlag(105650,780934,84,1)
					SetModeEx( mob024 , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( mob024 , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( mob024 , EM_SetModeType_NotShowHPMP, true)
					AddToPartition(mob01,RoomID)
					AddToPartition(mob02,RoomID)
					AddToPartition(mob03,RoomID)
					AddToPartition(mob04,RoomID)
					AddToPartition(mob05,RoomID)
					AddToPartition(mob06,RoomID)
					AddToPartition(mob07,RoomID)
					AddToPartition(mob08,RoomID)
					AddToPartition(mob09,RoomID)
					AddToPartition(mob010,RoomID)
					AddToPartition(mob011,RoomID)
					AddToPartition(mob012,RoomID)
					AddToPartition(mob013,RoomID)
					AddToPartition(mob014,RoomID)
					AddToPartition(mob015,RoomID)
					AddToPartition(mob016,RoomID)
					AddToPartition(mob017,RoomID)
					AddToPartition(mob018,RoomID)
					AddToPartition(mob019,RoomID)
					AddToPartition(mob020,RoomID)
					AddToPartition(mob021,RoomID)
					AddToPartition(mob022,RoomID)
					AddToPartition(mob023,RoomID)
					AddToPartition(mob024,RoomID)
					if Luck1==1 or Luck1==3 or Luck1==5 then	---12人-簡單都一樣AI
						SetPlot(mob01,"touch","ic_106021_mobonkk",5)	
						SetPlot(mob02,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob03,"touch","ic_106021_mobonkk",5)
						SetPlot(mob04,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob05,"touch","ic_106021_mobonkk",5)
						SetPlot(mob06,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob07,"touch","ic_106021_mobonkk",5)
						SetPlot(mob08,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob09,"touch","ic_106021_mobonkk",5)
						SetPlot(mob010,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob011,"touch","ic_106021_mobonkk",5)
						SetPlot(mob012,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob013,"touch","ic_106021_mobonkk",5)
						SetPlot(mob014,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob015,"touch","ic_106021_mobonkk",5)
						SetPlot(mob016,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob017,"touch","ic_106021_mobonkk",5)
						SetPlot(mob018,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob019,"touch","ic_106021_mobonkk",5)
						SetPlot(mob020,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob021,"touch","ic_106021_mobonkk",5)
						SetPlot(mob022,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob023,"touch","ic_106021_mobonkk",5)
						SetPlot(mob024,"touch","ic_106021_mobonkkk",5)
					elseif Luck1==2 or Luck1==4 or Luck1==6 then	---12人-簡單都一樣AI
						SetPlot(mob01,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob02,"touch","ic_106021_mobonkk",5)
						SetPlot(mob03,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob04,"touch","ic_106021_mobonkk",5)
						SetPlot(mob05,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob06,"touch","ic_106021_mobonkk",5)
						SetPlot(mob07,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob08,"touch","ic_106021_mobonkk",5)
						SetPlot(mob09,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob010,"touch","ic_106021_mobonkk",5)
						SetPlot(mob011,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob012,"touch","ic_106021_mobonkk",5)
						SetPlot(mob013,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob014,"touch","ic_106021_mobonkk",5)
						SetPlot(mob015,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob016,"touch","ic_106021_mobonkk",5)
						SetPlot(mob017,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob018,"touch","ic_106021_mobonkk",5)
						SetPlot(mob019,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob020,"touch","ic_106021_mobonkk",5)
						SetPlot(mob021,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob022,"touch","ic_106021_mobonkk",5)
						SetPlot(mob023,"touch","ic_106021_mobonkkk",5)
						SetPlot(mob024,"touch","ic_106021_mobonkk",5)
					end
					AddBuff(mob1,509641,0 ,-1 )
					AddBuff(mob2,509641,0 ,-1 )	
					AddBuff(mob3,509641,0 ,-1 )
					AddBuff(mob4,509641,0 ,-1 )			
					AddToPartition(mob1,RoomID)
					AddToPartition(mob2,RoomID)
					AddToPartition(mob3,RoomID)
					AddToPartition(mob4,RoomID)
					NPC=CreateObjByFlag(105649,780934,5,1)
					SetModeEx( NPC , EM_SetModeType_Mark, false)										---可點選(否)
					SetModeEx( NPC , EM_SetModeType_ShowRoleHead, false) 								---頭相框(否)
					SetModeEx( NPC , EM_SetModeType_Obstruct, false) 									---阻擋(是)
					SetModeEx( NPC , EM_SetModeType_Strikback, false) 									---反擊
					SetModeEx( NPC , EM_SetModeType_Move, false) 										---移動	
					SetModeEx( NPC , EM_SetModeType_Fight, false) 										---可砍殺
					SetModeEx( NPC , EM_SetModeType_Searchenemy, false)								---索敵(否)
					SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
					AddToPartition(NPC,RoomID)
					SetPlot(NPC,"touch","ic_106021_nokk",20)										---12人-簡單都一樣AI
					WriteRoleValue(mob1,EM_RoleValue_register2,1)
					WriteRoleValue(mob2,EM_RoleValue_register2,2)
					WriteRoleValue(mob3,EM_RoleValue_register2,3)
					WriteRoleValue(mob4,EM_RoleValue_register2,4)
					WriteRoleValue(mob1,EM_RoleValue_register10,1)
					WriteRoleValue(mob2,EM_RoleValue_register10,2)
					WriteRoleValue(mob3,EM_RoleValue_register10,3)
					WriteRoleValue(mob4,EM_RoleValue_register10,4)
					WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
					Boss=CreateObjByFlag(106021,780934,1,1)           						---再創造1之	
					AddToPartition(Boss,RoomID)	                               				---創造王 必要	
					SetModeEx( Boss , EM_SetModeType_Move, false) 
					SetModeEx( Boss , EM_SetModeType_Fight, false) 							
					SetPlot( Boss,"dead","ic_106021_BOSSXX",0 )								---掛死亡劇情---12人-簡單都一樣AI
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob1,EM_RoleValue_register8,BOSS)
					WriteRoleValue(mob2,EM_RoleValue_register8,BOSS)
					WriteRoleValue(mob3,EM_RoleValue_register8,BOSS)
					WriteRoleValue(mob4,EM_RoleValue_register8,BOSS)
					BeginPlot(isaac, "ic_106021_BUFFXX" , 0)								---刪除BUFF
					time1=0
					time2=0
					time3=0
					mob9898=0	
					open=0																	---重置戰鬥
					killidtime=0
				elseif	BOSSXX==1 and open==1 then											---王死了
					ScriptMessage( Boss, -1 , 2 , "[SC_105641_04]" , 2 )				---死亡對話---
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)					
					DelObj(Boss100)
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					mobkkplay1=0
					mobkkplay2=0
					mobkkplay3=0
					mobkkplay4=0
					bossstop=0
					WriteRoleValue(isaac,EM_RoleValue_register1,0)
					WriteRoleValue(isaac,EM_RoleValue_register2,0)
					WriteRoleValue(isaac,EM_RoleValue_register3,0)
					WriteRoleValue(isaac,EM_RoleValue_register4,0)
					WriteRoleValue(isaac,EM_RoleValue_register5,0)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register10,0)
					SetModeEx( NPC , EM_SetModeType_Mark, false)							---可點選(否)
					BeginPlot(isaac, "ic_106021_BUFFXX" , 0)								---刪除BUFF
					open=0																	---重置戰鬥
					killidtime=0
					time1=0
					time2=0
					time3=0
					mob9898=0	
					BOSSXX=2
					sleep(100)
					break
				end				
			end	
			if BOSSXX==1  then															   ---無敵殺了王
					ScriptMessage( Boss, -1 , 2 , "[SC_105641_04]" , 2 )			   ---我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register10,0)
					SetModeEx( NPC , EM_SetModeType_Mark, false)						   ---可點選(否)
					BeginPlot(isaac, "ic_106021_BUFFXX" , 0)							   ---刪除BUFF
					open=0	
					killidtime=0
					BOSSXX=2
					sleep(100)	
					DelObj(door)
					DelObj(door1)	
					break	
			end	
	end		
end  
function ic_106021_BUFFXX()																	---刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)											---找區域所有玩家
	local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() 												---接暫存值
			if CheckID( ThesePlayer[i] ) == true and 										---檢查玩家是不是還在；檢查是否死亡
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 				---EM_RoleValue_IsDead   =1  =死亡
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then			---EM_RoleValue_IsPlayer =1  =玩家
				if CheckBuff( ThesePlayer[i] , 509629 ) == true or 
				   CheckBuff( ThesePlayer[i] , 509630 ) == true or 
				   CheckBuff( ThesePlayer[i] , 509631 ) == true or 
				   CheckBuff( ThesePlayer[i] , 509632 ) == true then						---確認BUFF
					CancelBuff(ThesePlayer[i], 509629)										---要刪除的BUFF
					CancelBuff(ThesePlayer[i], 509630)
					CancelBuff(ThesePlayer[i], 509631)
					CancelBuff(ThesePlayer[i], 509632)
				end
			end					
		end
end	------