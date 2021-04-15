
function Yuyu_SetPetEgg_1_00(Pos,Type) -- 寵物蛋置入劇情
--Say(OwnerID(),OwnerID())
--Say(TargetID(),TargetID())

--Pos 寵物位置
--Type 0 放入 1 拿出
--ReadPetValue( GItemID , PetPos , ValueType )    讀取寵物(OwnerID(主人), 第幾隻寵物,什麼屬性)
--WritePetValue( GItemID , PetPos , ValueType , Value )  寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)
--AddPetValue( GItemID , PetPos , ValueType , Value )  加寫入寵物(OwnerID(主人), 第幾隻寵物,什麼屬性,寫入值)

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local Loyal = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Loyal )				--忠誠度
	local Hunger = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Hunger )			--飽食度
	local Talent = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Talent )			--資質
	local Spirit = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Spirit )				--歷練值

	local Z = 10
	local Add = Rand( Z )    --修正值

	if Type == 0 then--蛋蛋放進去之後

		local P = 70
		local Loyal = Rand( P )    
		if Loyal < 50 then
			Loyal = 50+Add
		end
		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Loyal , Loyal ) --寫入 忠誠度
		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Hunger , 60 ) --寫入 飽食度
--		Spirit = (Spirit+Add)*2
--		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Spirit , Spirit ) --寫入 歷練值

	end
end

--**********************************************************************************************************************
--**********************************************************************************************************************
--*********************************************突破每日可融合次數上限**************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************

--◎ 測試指令：可突破每日可融合次數上限。
--WriteRoleValue( OwnerID() , EM_RoleValue_CultivatePet_NextMergeResetTime  , 0 )

function LuaYU_Pets_Mesh_CountOpen_00(Option)--寵物寶貝蛋欄位開通劇情
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local Mesh_CountOpen = ReadRoleValue( PlayerID ,EM_RoleValue_CultivatePet_NextMergeResetTime) 

	if ( Option == "CHECK" ) then

		return true

	elseif ( Option == "USE" ) then
		Beginplot( PlayerID ,"LuaYU_Pets_Mesh_CountOpen_01", 0 )
	end
end

function LuaYU_Pets_Mesh_CountOpen_01()
	local PlayerID = OwnerID()
	WriteRoleValue( OwnerID() , EM_RoleValue_CultivatePet_NextMergeResetTime  , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_70]" , 0 )--成功重置所有寵物本日之可融合次數。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_70]" , 0 )
end

--**********************************************************************************************************************
--**********************************************************************************************************************
--*********************************************寵物寶貝蛋欄位開通劇情**************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************

function LuaYU_Pets_House_Open_00(Option)--寵物寶貝蛋欄位開通劇情
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--空白的欄位號碼

	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1表示該欄位尚未開啟。
			PageEmpty = i					--目前空白的欄位號碼中序號最小的
			break
		end

	end

	if ( Option == "CHECK" ) then
		if PageEmpty ~= 0 then					--如果目前有空白的欄位
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_63]" , 0 )--目前開通欄位已達上限！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_63]" , 0 )
			return false
		end
	elseif ( Option == "USE" ) then
		Beginplot( PlayerID ,"LuaYU_Pets_House_Open_01", 0 )
	end
end

function LuaYU_Pets_House_Open_01()
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--空白的欄位號碼
	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1表示該欄位尚未開啟。
			PageEmpty = i					--目前空白的欄位號碼中序號最小的
			break
		end

	end


	if PageEmpty ~= 0 then					--如果目前有空白的欄位					--空白的欄位號碼

		local Ticket =  CountBodyItem( PlayerID , 204513 ) --角色身上是否有 寶貝蛋培育欄

		if Ticket >0 then
			if PageEmpty == 1 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )--恭喜！已成功開通第[$VAR1]欄的寶貝蛋培育欄。
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 2 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 3 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 4 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			end
			Beginplot( PlayerID ,"LuaYU_Pets_House_Open_02", 0 )
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_66]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_66]" , 0 )
		end
	end
end

function LuaYU_Pets_House_Open_02()
	local ID = OwnerID() --玩家
	DelBodyItem( ID , 204513 , 1 ) -- 扣除一個 寶貝蛋培育欄
end

--*********************************************寵物寶貝蛋欄位開通劇情  程式 測試用**************************************************

function LuaYU_Pets_House_Open_Test()--寵物寶貝蛋欄位開通劇情
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--空白的欄位號碼
	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1表示該欄位尚未開啟。
			PageEmpty = i					--目前空白的欄位號碼中序號最小的
			break
		end

	end


	if PageEmpty ~= 0 then					--如果目前有空白的欄位
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		TransferSelect[0] = { "-------- YES --------" }
		TransferSelect[1] = { "-------- NO --------" }

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Do You Want To Open The Pet's House ?" )
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
			return 0
		end
		while true do
			Sleep( 5 )
			RunTime = RunTime + 1
			if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
				DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
				DialogClose( PlayerID )
				break
			end

			DialogStatus = DialogGetResult( PlayerID )
			--Say( PlayerID , DialogStatus )

			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == 1 or DialogStatus == -1 then
				DialogClose( PlayerID )
				break
			elseif DialogStatus == 0 then

				if PageEmpty == 1 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 2 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 3 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 4 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180分 = 3小時
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				end
				DialogClose( PlayerID )
				break
			end
		end

	else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "Your Have No EmptyPetPage." , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "Your Have No EmptyPetPage." , 0 )
	end

end

function LuaYU_Pets_House_Colse_Test()--寵物寶貝蛋欄位3~6欄關閉劇情

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--空白的欄位號碼
															--for J = 1,4 do
															--	Say(PlayerID,"PetPageStatus = "..PetPage[J])
															--end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1表示該欄位尚未開啟。
			PageEmpty = i					--目前空白的欄位號碼中序號最小的
			break
		end

	end


	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , -1 )
	Say(PlayerID,"OK!!Set 3~6 is Empty!!!")
end

function LuaYU_Pets_AutoGetTreauses_00()--判斷是否身上已有帕奇香水的BUFF

	if CheckBuff( OwnerID() , 503479 ) == true then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_PETSYS_71]",0)--身上已噴灑了足夠的帕奇香水
		return false
	else
		return true
	end
end