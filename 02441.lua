-----------------------------------------------------------------------------------------------ZONE21 ���~�p�ǥ�
function ic__MOB_BUFF_21()
local Luck
Luck=DW_Rand(100)
--say(OwnerID(),"Luck="..Luck)
	if Luck<=5  then--1.2.3.4.5
		AddBuff(OwnerID(),620148,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_21",0 )	
	end
	if Luck>35 and Luck<=40  then--36.37.38.39.40
		AddBuff(OwnerID(),620149,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_21",0 )	
	end
	if Luck>60 and Luck<=65  then--61.62.63.64.65
		AddBuff(OwnerID(),620150,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_21",0 )	
	end
	if Luck>95 and Luck<=100  then--96.97.98.99.100
		AddBuff(OwnerID(),620151,0 ,-1 )
		SetPlot( OwnerID(),"dead","ic_All_MOB_dead_21",0 )	
	end
	if Luck>5 and Luck<=35 or Luck>40 and Luck<=60 or Luck>65 and Luck<=95 then 
	--6-35-----41-60-----66-95
		AddBuff(OwnerID(),620152,0 ,-1 )				
	end
end
function ic_All_MOB_dead_21()---���~�p�ǥ�
Luck=DW_Rand(100)
---say(OwnerID(),"Luck="..Luck)
	if Luck==75 then
		local mob = star_CreateObj_NoAdd( OwnerID() , 105930 , 0 , 0 , 0 , RoomID , 0 ) ---�Ͳy
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		SetModeEx( mob , EM_SetModeType_Mark, true)			---�i�I��(�_)
		SetModeEx( mob , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�_)
		SetModeEx( mob , EM_SetModeType_Obstruct, true) 			--����(�O)
		SetModeEx( mob , EM_SetModeType_Strikback, false) ---����
		SetModeEx( mob , EM_SetModeType_Move, false) ---����	
		SetModeEx( mob , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
		SetModeEx( mob , EM_SetModeType_Searchenemy, false)			--����(�_)	
		SetModeEx( mob , EM_SetModeType_NotShowHPMP, true) --
		AddToPartition(mob,RoomID)
	end	
end

function ic__MOB_BUFF_999()
SetPlot( OwnerID(),"dead","ic_All_MOB_dead_21",0 )	
end