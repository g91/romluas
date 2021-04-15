-- Pcall用函式，許多影響npc用的請善用 %t_id 來改變Owner，在一些佈置上可得奇效

-- FA_SetHP：直接設定HP量
-- FA_SetHP_Per：直接設定HP（以百分比）
-- FA_Buff：取得或解除buff
-- FA_SearchGetPos：以OrgID搜尋，掃到會把位置資訊貼出來，範圍300
-- FA_SearchGetPos_Insane：以OrgID搜尋，掃到會把位置資訊貼出來，範圍300
-- FA_SearchDel：以OrgID搜尋，掃到就殺掉。會傳相關資訊給使用者，保留救回機會。範圍300
-- FA_SearchDel_Insane：上面的範圍3000版，但實際上除非全域顯示物件，否則可能沒辦法掃到這麼大
-- FA_SearchModeShow：以OrgID搜尋，掃到後把顯示勾選。範圍300
-- FA_SearchModeShow_Insane：上面的範圍3000版，但實際上除非全域顯示物件，否則可能沒辦法掃到這麼大
-- FA_SearchModeHide：以OrgID搜尋，掃到後把顯示取消勾選。範圍300
-- FA_SearchModeHide_Insane：上面的範圍3000版，但實際上除非全域顯示物件，否則可能沒辦法掃到這麼大
-- FA_NonSaveDel：以OrgID搜尋，掃到後把「沒有勾選儲存的物件」刪除。範圍300
-- FA_NonSaveDel_Insane：上面的範圍3000版，但實際上除非全域顯示物件，否則可能沒辦法掃到這麼大
-- FA_GOTO：可以給NPC名字的全部或片段一部分，掃出來後把人物傳送過去。但超過範圍800的物件抓不到...
-- FA_Fly：飛，改用SetPos而非ChangeZone。如果給負數那就會變成往下鑽。
-- FA_Rotate：把物件旋轉指定的角度，順時鐘。
-- FA_Tele：往前傳，會上下「暴力」抓地板（跟飛鼠版等等只抓一次地板的不同），所以除非是非常極端的例子，否則絕不會鑽進土裡或異次元
-- FA_TeleInto：往前傳，完全不會抓地板的版本，可以用來鑽牆壁，探勘未完成場景很方便
-- FA_Digg：往下鑽，只是把Fly反過來操作，給負數就會變成飛
-- FA_GOGO：直接把Owner傳到指定編號（GUID）的物件上
-- FA_Who：用DebugMSG報Owner的GUID（包括玩家），某些情況下有用，尤其是想知道其他玩家或自己的GUID時
-- FA_FollowMe：跟著我走（測試用Func
-- FA_AttachMe：貼著我走（測試用Func
-- FA_X：依著X軸移動指定的值，可正負數
-- FA_Y：依著Y軸移動指定的值，可正負數
-- FA_Z：依著Z軸移動指定的值，可正負數
-- FA_Dir：改變物件的Dir（面向
-- FA_GoHigh：天梯，在你指定的高度放一塊地磚然後把你丟上去，讓你站在天空俯瞰地面。你離遠了他就自然會不見。
-- FA_OverLook：鳥瞰，跟天梯一樣，但是會你跟地磚隱形，可以拍鳥瞰圖。離遠了之後一切都會恢復
-- FA_Show：把指定物件「Show」出來（指用Hide或者未AddToPartition的，未被真正放在地圖上的物件）
-- FA_CreateByObj：以Owner為準，建立一個你指定資料庫編號的NPC。補種要用client切換的npc之類的時候很方便
-- FA_FaceTo：讓Owner面向你指定的GUID編號的物件。



function FA_SetHP (Int)
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,Int)
end

function FA_SetHP_Per (Int)
	local Owner = OwnerID()
	local NewHP = math.ceil(int * (ReadRoleValue(Owner,EM_RoleValue_MaxHP)/100))
	WriteRoleValue(Owner,EM_RoleValue_HP,NewHP)
end

function FA_Buff (BuffID)
	if CheckBuff(OwnerID(), BuffID) == false then
		AddBuff(OwnerID(),BuffID,0,-1)
	else
		CancelBuff(OwnerID(), BuffID)
	end
end

function FA_SearchGetPos(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
		end
	end
end

function FA_SearchGetPos_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
		end
	end
end

function FA_SearchDel(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_SearchDel_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_SearchModeShow(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm showing")
			SetModeEx(Temp,EM_SetModeType_Show,TRUE)
		end
	end
end

function FA_SearchModeShow_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm showing")
			SetModeEx(Temp,EM_SetModeType_Show,TRUE)
		end
	end
end

function FA_SearchModeHide(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 300 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm hiding")
			SetModeEx(Temp,EM_SetModeType_Show,FALSE)
		end
	end
end

function FA_SearchModeHide_Insane(ID)
	local Owner = OwnerID()
	local WanttoFind = ID
	local Array = {}
	local Temp
	local TempPos
	Array = SearchRangeNPC ( Owner , 3000 )
	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==WanttoFind	then
			Tell(Owner,Temp,"My GID is "..Temp..", i'm hiding")
			SetModeEx(Temp,EM_SetModeType_Show,FALSE)
		end
	end
end

function FA_NonSaveDel(ID)
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local TempPos
	local TempOrgID

	ID = ID or 0
	Array = SearchRangeNPC ( Owner , 300 )

	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		TempOrgID = ReadRoleValue(Temp,EM_RoleValue_OrgID)

		if (TempOrgID < 780000 or TempOrgID > 789999)
		and (ID == 0 or TempOrgID == ID)
		and GetModeEx(Temp, EM_SetModeType_Save) == FALSE then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_NonSaveDel_Insane(ID)
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local TempPos
	local TempOrgID

	ID = ID or 0
	Array = SearchRangeNPC ( Owner , 3000 )

	for i=0,table.getn(Array),1 do
		Temp = Array[i]
		TempPos = {kg_GetPos(Temp)}
		TempOrgID = ReadRoleValue(Temp,EM_RoleValue_OrgID)

		if (TempOrgID < 780000 or TempOrgID > 789999)
		and (ID == 0 or TempOrgID == ID)
		and GetModeEx(Temp, EM_SetModeType_Save) == FALSE then
			Tell(Owner,Temp,"My GID is "..Temp..", I'm posed "..TempPos[1]..", "..TempPos[2]..", "..TempPos[3]..", Dir = "..TempPos[4])
			Tell(Owner,Temp,"I'm deleted.")
			DelObj(Temp)
		end
	end
end

function FA_GOTO(Target)
	CallPlot(OwnerID(), "FA_GOTO_02",Target)
end

function FA_GOTO_02(Target)
	local ArgType = Type(Target)
	if ArgType ~= "string" and ArgType ~= "number" then return end
	local Owner = OwnerID()
	local Array = {}
	local Temp
	local IfNext
	Array = SearchRangeNPC ( Owner , 1000 )
	for	i=0,table.getn(Array),1	do
		Temp = Array[i]
		if	(ArgType == "number" and ReadRoleValue(Temp,EM_RoleValue_OrgID) == Target)	or
			(ArgType == "string" and string.find(GetName(Temp),Target) ~= nil)	then
			FA_SetPosByObj(Owner,Temp)
			DialogCreate( Owner,EM_LuaDialogType_YesNo,"Next?")
			DialogSelectStr( Owner , "[SO_YES]" )
			DialogSelectStr( Owner , "[SO_NO]" );
			IfNext = ks_DialogRePort_TwoChoose(Owner,100,100)
			if	IfNext == "No"	then
				return
			end
		end
	end

end

function FA_Fly( Dis )
	local AddHeight = Dis or 200
	local Owner = OwnerID()
	local Pos = {	ReadRoleValue(Owner,EM_RoleValue_X)		,
			ReadRoleValue(Owner,EM_RoleValue_Y) + AddHeight	,
			ReadRoleValue(Owner,EM_RoleValue_Z)		,
			ReadRoleValue(Owner,EM_RoleValue_Dir)			}

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos(Owner, Unpack(Pos))
	
end

function FA_Rotate( Angle )
	local Owner = OwnerID()
	AdjustDir(Owner,Angle )
end

function FA_Tele( Dis )
	local Owner = OwnerID()
	local Dis = Dis or 300
	local Pos

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos( Owner , kg_GetPosRX( Owner , nil , Dis ,0) )
--	SetPos( Owner , kg_GetPosRX( Owner , nil , 0 ,0) )

	AddBuff(Owner, 508560, 0, -1)

	Pos = {	ReadRoleValue(Owner,EM_RoleValue_X)		,
		ReadRoleValue(Owner,EM_RoleValue_Y) + 10000	,
		ReadRoleValue(Owner,EM_RoleValue_Z)			}

	Pos[2] = GetHeight(Unpack(Pos))
	Pos[4] = ReadRoleValue(Owner,EM_RoleValue_Dir)

	SetPos( Owner , Unpack(Pos))

	for i = 1, 20	do
--		Sleep(1)
		Pos[2] = Pos[2] - 500
		SetPos( Owner , Unpack(Pos))
	end

	CancelBuff(Owner,508560)
end

function FA_TeleInto( Dis )
	local Owner = OwnerID()
	local Dis = Dis or 300

	SysCastSpellLv( Owner, Owner, 496177, 0 )

	SetPos( Owner , kg_GetPosRX( Owner , nil , Dis ,1) )
end

function FA_Digg( Dis )
	FA_Fly( Dis * -1 )
end

function FA_GOGO(goal)
	FA_SetPosByObj(OwnerID(),goal)
end

function FA_Who ()
	DebugMsg(0,0,OwnerID())
end

function FA_FollowMe(who)
	AddBuff( who, 504312, 0, -1)
	AttachObj( who, OwnerID(), 0, "p_down","p_top" )
end

function FA_AttachMe(who)
	AddBuff( who, 504312, 0, -1)
	AttachObj( who, OwnerID(), 1, "back_shield","hit_point01" )
end

function FA_X(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[1] = Pos[1] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Y(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[2] = Pos[2] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Z(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[3] = Pos[3] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_Dir(add)
	local Owner = OwnerID()
	local Pos = kg_GetPosTable(Owner)
	Pos[4] = Pos[4] + add

	SetPos( Owner , Unpack(Pos))
end

function FA_GoHigh(Dis,OverLook)
	local AddHeight = Dis or 200
	local Owner = OwnerID()
	local RoomID =	ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Floor
	local Pos = {	ReadRoleValue( Owner, EM_RoleValue_X )			,
			ReadRoleValue( Owner, EM_RoleValue_Y ) + AddHeight + 5	,
			ReadRoleValue( Owner, EM_RoleValue_Z )			,
			ReadRoleValue( Owner, EM_RoleValue_Dir )			}

	Floor = CreateObj(113042, Pos[1], Pos[2] - 5, Pos[3], Pos[4], 1)
	AddToPartition( Floor , RoomID )
	SetModeEx(Floor, EM_SetModeType_Gravity, FALSE)
	SetModeEx(Floor, EM_SetModeType_Obstruct, TRUE)
	SetModeEx(Floor, EM_SetModeType_HideName, TRUE)
	SetModeEx(Floor, EM_SetModeType_Mark, TRUE)
	SetModeEx(Floor, EM_SetModeType_Show, not OverLook)

	SysCastSpellLv( Owner, Owner, 496177, 0 )
	SetPos(Owner, Unpack(Pos))

	Sleep(40)
	SysCastSpellLv( Owner, Owner, 497848, 0 )
	addbuff(Owner,500535,0,-1)
	CallPlot(Floor,"FA_GoHigh_CheckDis",Owner,OverLook)
end

function FA_GoHigh_CheckDis(Player,OverLook)
	local Floor = OwnerID()
	local DisY = 0

	While CheckID(Player) and CheckDistance(Floor, Player, 50) and DisY < 50 do
		sleep(100)
		DisY = math.abs((ReadRoleValue( Floor, EM_RoleValue_Y ) - ReadRoleValue( Player, EM_RoleValue_Y )))
	end
	DelObj (Floor)
	if OverLook == true then CancelBuff(Player,620024) end
end

function FA_OverLook(Dis)
	FA_GoHigh(Dis,true)
	AddBuff( OwnerID(), 620024, 0, -1 )
end

function FA_Show(GUID)
	Show(GUID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID))
end

function FA_CreateByObj( OrgID )
	Lua_DW_CreateObj("obj", OrgID, OwnerID(), 1, 1 )
end

function FA_FaceTo(Target)
	AdjustFaceDir(OwnerID(), Target, 0)
end