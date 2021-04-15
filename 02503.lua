--------------------------------------------------
function Z21_Hostage_A1()
	SetModeEx( OwnerID(),EM_SetModeType_Mark ,false )
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local xyz1={x+5,y,z}
	local xyz2={x-5,y,z}
	local xyz3={x,y,z+5}
	local npc1=Lua_DW_CreateObj( "xyz" , 119426, xyz1 , 1 , 60 , 1 ) --人質1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,npc1)
	WriteRoleValue(npc1,EM_RoleValue_Register1,OwnerID())
	local npc2=Lua_DW_CreateObj( "xyz" , 119427, xyz2 , 1 , 120 , 1 ) --人質2
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,npc2)
	local npc3=Lua_DW_CreateObj( "xyz" , 119428, xyz3 , 1 , 180 , 1 ) --人質3
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,npc3)
end
--------------------------------------------------
function Z21_Hostage_A2()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	DelObj (x)
	DelObj (y)
	DelObj (z)
	DW_QietKillOne(TargetID(),106191)
	DW_QietKillOne(TargetID(),106191)
	DW_QietKillOne(TargetID(),106191)
end
------------------------------------------------------------------------
function Z21_Hostage_B1()
	SetModeEx( OwnerID(),EM_SetModeType_Mark ,false )
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local xyz1={x+5,y,z}
	local xyz2={x-5,y,z}
	local npc1=Lua_DW_CreateObj( "xyz" , 119426, xyz1 , 1 , 45 , 1 ) --人質1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,npc1)
	WriteRoleValue(npc1,EM_RoleValue_Register1,OwnerID())
	local npc2=Lua_DW_CreateObj( "xyz" , 119427, xyz2 , 1 , 90 , 1 ) --人質2
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,npc2)
end
--------------------------------------------------
function Z21_Hostage_B2()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	DelObj (x)
	DelObj (y)
	DW_QietKillOne(TargetID(),106191)
	DW_QietKillOne(TargetID(),106191)
end
------------------------------------------------------------------------
function Z21_Hostage_C1()
	SetModeEx( OwnerID(),EM_SetModeType_Mark ,false )
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)--讀取自身的X座標
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)--讀取自身的Y座標
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)--讀取自身的Z座標
	local xyz1={x,y,z}--宣告將產生怪物的座標位置
	local npc1=Lua_DW_CreateObj( "xyz" , 119426, xyz1 , 1 , 1 , 1 ) --人質1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,npc1)
	WriteRoleValue(npc1,EM_RoleValue_Register1,OwnerID())
end
--------------------------------------------------
function Z21_Hostage_C2()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	DelObj (x)
	DW_QietKillOne(TargetID(),106191)
end
------------------------------------------------------------------------
function Z21_Hostage_people01()
	local Cage=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	CallPlot( OwnerID(),"Z21William_SetMode01",OwnerID())
	CallPlot( Cage,"Z21William_SetMode01",Cage)
	SetModeEx( Cage,EM_SetModeType_Mark , true )
	while 1 do
	local num=dw_rand(9)
		if num==1 then
		   Say( OwnerID(), "[SC_Z21HOSTAGE_01]" ) --你們這群可惡的盜賊！
		end 
		if num==2 then
		   Say( OwnerID(), "[SC_Z21HOSTAGE_02]" ) --哼...！
		end 
		if num==3 then
		   Say( OwnerID(), "[SC_Z21HOSTAGE_03]" ) --我絕對不會饒了你們！
		end 
		if num>=4 then
		   sleep(50)
		end 
	sleep(100)
	end
end
------------------------------------------------------------------------
function Z21_Hostage_cage01()
	SetModeEx( TargetID(),EM_SetModeType_Mark ,false)
	local x=ReadRoleValue(TargetID(),EM_RoleValue_Register1)
	local y=ReadRoleValue(TargetID(),EM_RoleValue_Register2)
	local z=ReadRoleValue(TargetID(),EM_RoleValue_Register3)
		if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119486 then
		   DelObj (x)
		   DelObj (y)
		   DelObj (z)
		   CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
		   DW_QietKillOne(OwnerID(),106191)
		   DW_QietKillOne(OwnerID(),106191)
		   DW_QietKillOne(OwnerID(),106191)
		return 1
		end
		if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119487 then
		   DelObj (x)
		   DelObj (y)
		   CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
		   DW_QietKillOne(OwnerID(),106191)
		   DW_QietKillOne(OwnerID(),106191)
		return 1
		end
		if ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==119488 then
		   DelObj (x)
		   CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
		   DW_QietKillOne(OwnerID(),106191)
		return 1
		end
end
--------------------------------------------------
function Z21William_SetMode01()
	SetModeEx( OwnerID()  ,EM_SetModeType_Show, true )--顯示*
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --索敵*
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --儲存*
	SetModeEx( OwnerID()  ,EM_SetModeType_Revive , true ) --重生*
	SetModeEx( OwnerID()  ,EM_SetModeType_Obstruct , true )--阻擋*
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --反擊*
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --砍殺*
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --重力*	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , false ) --移動*
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --頭像框*
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false) --物件頭上的名稱是否顯示*
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , false ) --此物件不會被搜尋到*
end
--------------------------------------------------