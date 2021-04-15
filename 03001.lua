----遠古夢境出口，通往Z27-----

function Lua_Z27_ADSpace_DoorOutSet()
	SetPlot(OwnerID() ,"touch","Lua_Z27_ADSpace_DoorOut",150) 
end

function Lua_Z27_ADSpace_DoorOut()
	if CheckCompleteQuest(OwnerID(),426472)==true then
		ChangeZone( OwnerID(), 27 , 0 , -9971, 25, 2180, 87)
	else
		ScriptMessage( OwnerID(), OwnerID() , 0,"[SC_426472_0]", 0 )		
	end
end



function LuaQ_426476_Flag_1()
	setplot(OwnerID(),"range","LuaQ_426476_Flag_1_1",50)
end

function LuaQ_426476_Flag_1_1()
	local Tplayer=SearchRangePlayer(TargetID(),250)
	for i=0,#Tplayer do
		if CheckAcceptQuest(Tplayer[i],426476)==true then
			SetFlag(Tplayer[i],548384,1)
		else
			return
		end
	end
end


--	ruFUSION_MIME_CAST_SP02
function LuaQ_Z27_Mob_0_Set_0()	--惡魔花
	SetModeEx(OwnerID(),EM_SetModeType_HideName,true)
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead,true)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CAST_SP02) 
end

function LuaQ_Z27_Mob_0_Set_1()	--惡魔花
	SetModeEx(OwnerID(),EM_SetModeType_HideName,false)
end

function LuaQ_Z27_Mob_1_Set_0()	--岩蟲
	SetModeEx(OwnerID(),EM_SetModeType_HideName,true)
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead,true)
end