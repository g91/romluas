-----------------------------------------------------------------------------------------------ZONE22 ���~�p�ǥ�
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
function ic_All_MOB_dead_22()---���~�p�ǥ�
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
				local mob = star_CreateObj_NoAdd( OwnerID() , 105982 , 0 , 0 , 0 , RoomID , 0 ) ---�Ͳy
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				SetModeEx( mob , EM_SetModeType_Mark, true)			---�i�I��(�_)
				SetModeEx( mob , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�_)
				SetModeEx( mob , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( mob , EM_SetModeType_Strikback, false) ---����
				SetModeEx( mob , EM_SetModeType_Move, false) ---����	
				SetModeEx( mob , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false)---�O�_�Q�j�M(�_)
				SetModeEx( mob , EM_SetModeType_Searchenemy, false)			--����(�_)	
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