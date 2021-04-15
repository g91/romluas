-----------------------------------------------------------------------------------------------ZONE22 野外小怪用
function ic_MOB_BUFF_22()
local Luck
Luck=DW_Rand(100)
--say(OwnerID(),"Luck="..Luck)
	if Luck<=5  then--1.2.3.4.5
		AddBuff(OwnerID(),620148,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_22",0 )	
	end
	if Luck>35 and Luck<=40  then--36.37.38.39.40
		AddBuff(OwnerID(),620149,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_22",0 )	
	end
	if Luck>60 and Luck<=65  then--61.62.63.64.65
		AddBuff(OwnerID(),620150,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_22",0 )	
	end
	if Luck>95 and Luck<=100  then--96.97.98.99.100
		AddBuff(OwnerID(),620151,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_22",0 )	
	end
	if Luck>5 and Luck<=35 or Luck>40 and Luck<=60 or Luck>65 and Luck<=95 then 
	--6-35-----41-60-----66-95
		AddBuff(OwnerID(),620152,0 ,-1 )				
	end
end
function ic_All_MOB_dead_22()---野外小怪用
local play=hatelistcount(OwnerID())
local bosskkpaly = {}
	  bosskkpaly = ic_HateListSort(OwnerID())  
local Tank
local time1=0
local Luck=0
	for i=1,play,1 do
		--say(OwnerID(),"i="..i)
		Tank=bosskkpaly[i]
		if ReadRoleValue(Tank, EM_RoleValue_IsPlayer ) == 1 and time1==0 then
			Luck=DW_Rand(100)
			--Luck=75
			--say(OwnerID(),"Luck="..Luck)
			if Luck==75 then
				local mob = star_CreateObj_NoAdd( OwnerID() , 105982 , 0 , 0 , 0 , RoomID , 0 ) ---生球
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				SetModeEx( mob , EM_SetModeType_Mark, true)			---可點選(否)
				SetModeEx( mob , EM_SetModeType_ShowRoleHead, true) 		---頭像框(否)
				SetModeEx( mob , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( mob , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false)---是否被搜尋(否)
				SetModeEx( mob , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				SetModeEx( mob , EM_SetModeType_NotShowHPMP, true) --
				AddToPartition(mob,RoomID)
				break
			end	
		end
	end
end

function ic__MOB_BUFF_22()
SetPlot( OwnerID(),"dead","ic_All_MOB_dead_22",0 )	
end