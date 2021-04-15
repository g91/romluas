--Pet_NPC      542203
function LuaYU_PetSystemGG_00()

	SetPlot( OwnerID(),"touch","LuaYU_PetSystemGG_01",20 )
end

function LuaYU_PetSystemGG_01()

--	Say(OwnerID(), "OwnerID".."1"  ) 玩家
--	Say(TargetID(), "TargetID".."1"  ) 雞
	MoveToFlagEnabled(TargetID (), false )

	local food =  CountBodyItem( OwnerID() , 204789 ) --飼料包
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) 
	local GG = ReadRoleValue( TargetID() , EM_RoleValue_Register+5  ) --判斷雞是否要生蛋了
	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) --判斷餵他到要生蛋的是誰
	local Xgg = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --判斷雞的初始位置

	local P = 100
	local XX = Rand( P )    

--	Say(  TargetID() , GG )
--	Say(  TargetID() , GGsMaster )
--	Say(  OwnerID() , GGsMaster )

	if GG == 6 then --雞要生蛋了，限定權限

		if GGsMaster == OwnerID()  then

			Say(  OwnerID(), "[SC_PETSYS_02]" )--玩家對雞喊 加油
			if BeginCastBar( OwnerID(), "[SC_PETSYS_03]", 10 , ruFUSION_ACTORSTATE_EMOTE_VICTORY , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	

				while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end

				if ( result == "OKOK" ) then

					local TargetX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
					local TargetY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
					local TargetZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 

					PlayMotion( TargetID(), 161) 	
					sleep(10)
					PlayMotion( TargetID(), 120) 	
					sleep(20)
					PlayMotion( TargetID(), 33) 	
					sleep(10)

					WriteRoleValue( TargetID()  , EM_RoleValue_IsWalk , 1 )

					WriteRoleValue( TargetID()  , EM_RoleValue_Register+5 , 0 ) --清除雞生蛋狀態
					WriteRoleValue( TargetID()  , EM_RoleValue_Register+1  , 0  ) --清除雞記憶玩家

					local NewEgg = 0 --宣告一顆蛋

					local GMtest =  CountBodyItem( OwnerID() , 203477 ) --特殊劇情觸發鑰匙
				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.03.30 將產生金雞蛋(204792)的5%機率永久移除，母雞現在只會產生新鮮的雞蛋(204795)
						NewEgg = CreateObj ( 114931 , TargetX , TargetY+1 , TargetZ , 0 , 1) --金G蛋出現了
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --是金蛋！
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --是金蛋！
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--金蛋劇情
					else
						NewEgg = CreateObj ( 112958 , TargetX , TargetY+1 , TargetZ , 0 , 1) --蛋出現了
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --有蛋了
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --有蛋了
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
					end
					SetModeEx( NewEgg , EM_SetModeType_Gravity, false )--重力
					AddToPartition( NewEgg , RoomID )  
					AddBuff( NewEgg , 503589 , 1 , -1 )--亮晶晶
				--	if (XX < 5) or (GMtest > 0)  then
				--	if GMtest > 0 then	-- 2012.03.30 將母雞生產出金雞蛋(204792)的5%機率移除，現在，母雞只會生產出新鮮的雞蛋(204795)
				--		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --是金蛋！
				--		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --是金蛋！
				--		WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
				--		SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--金蛋劇情
				--	else
				--		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --有蛋了
				--		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --有蛋了
				--		WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
				--		SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
				--	end
					BeginPlot( NewEgg , "LuaYU_PetSystemGG_07" , 0 ) --時間到無主權
					SetPlot( TargetID(),"touch","",0 )
					LuaFunc_MoveToFlag( TargetID() , 780307 , Xgg-1 , 0 ) --雞生完蛋走向初始點
					SetPlot( TargetID(),"touch","LuaYU_PetSystemGG_01",20 )
					MoveToFlagEnabled( TargetID(), true )
				end
			end
		else
--			ScriptMessage(OwnerID(), OwnerID() , 1 , " NO~~~It's not your G~ " , 0 )  --不能拿蛋
--			ScriptMessage(OwnerID(), OwnerID() , 0 , " NO~~~It's not your G~ " , 0 )  --不能拿蛋
		end

	elseif GG == 5 then  --15秒後沒人管要生蛋的雞，無權限任何人皆可拿蛋

			Say(  OwnerID(), "[SC_PETSYS_02]" )--玩家對雞喊 加油
			if BeginCastBar( OwnerID(), "[SC_PETSYS_03]", 10 , ruFUSION_ACTORSTATE_EMOTE_VICTORY , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	

				while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end

				if ( result == "OKOK" ) then

					local TargetX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
					local TargetY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
					local TargetZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 

					PlayMotion( TargetID(), 161) 	
					sleep(10)
					PlayMotion( TargetID(), 120) 	
					sleep(20)
					PlayMotion( TargetID(), 33) 	
					sleep(10)

					WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 1 )

					WriteRoleValue(  TargetID()  , EM_RoleValue_Register+5 ,  0 ) --清除雞生蛋狀態
					WriteRoleValue(  TargetID()  , EM_RoleValue_Register+1  , 0  ) --清除雞記憶玩家


					local NewEgg = 0 --宣告一顆蛋

					local GMtest =  CountBodyItem( OwnerID() , 203477 ) --特殊劇情觸發鑰匙
				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.04.13 將產生金雞蛋(204792)的5%機率永久移除，母雞現在只會產生新鮮的雞蛋(204795)
						NewEgg = CreateObj ( 114931 , TargetX , TargetY+1 , TargetZ , 0 , 1) --金G蛋出現了
					else
						NewEgg = CreateObj ( 112958 , TargetX , TargetY+1 , TargetZ , 0 , 1) --蛋出現了
					end
					SetModeEx( NewEgg   , EM_SetModeType_Gravity, false )--重力
					AddToPartition( NewEgg , RoomID )  

					AddBuff( NewEgg ,503589 ,1 ,-1 )--亮晶晶

				--	if (XX < 5) or (GMtest > 0)  then
					if GMtest > 0 then	-- 2012.03.30 將產生金雞蛋(204792)的5%機率永久移除，母雞現在只會產生新鮮的雞蛋(204795)
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_04]" , "0xffffff00")  --是金蛋！
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_04]", "0xffffff00")  --是金蛋！
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06_golden",40 )--金蛋劇情
					else
						ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_05]" , "0xffffff00")  --是蛋！
						ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_05]", "0xffffff00")  --是蛋！
						WriteRoleValue(  NewEgg  , EM_RoleValue_PID  , OwnerID()  ) --蛋將玩家記起來(所有權)
						SetPlot( NewEgg,"touch","LuaYU_PetSystemGG_06",40 )
					end

					BeginPlot( NewEgg , "LuaYU_PetSystemGG_07" , 0 ) --時間到無主權
					SetPlot( TargetID(),"touch","",0 )
					LuaFunc_MoveToFlag( TargetID() , 780307 , Xgg-1 , 0 ) --雞生完蛋走向初始點
					SetPlot( TargetID(),"touch","LuaYU_PetSystemGG_01",20 )
					MoveToFlagEnabled( TargetID(), true )
				end
			end

	elseif GG == 0 and  food >= 1 then --沒人餵

		if XX >50 and XX < 100 then --40%
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  )
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1  , OwnerID()  ) --記住玩家
			BeginPlot( OwnerID() , "LuaYU_PetSystemGG_02" , 0 ) --玩家餵養
			BeginPlot( TargetID() , "LuaYU_PetSystemGG_04" , 0 )--動物動作回饋 
		else -- 60%
			WriteRoleValue(  OwnerID() , EM_RoleValue_Register+8 , TargetID()  )
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1  , OwnerID()  ) --記住玩家
			BeginPlot( OwnerID() , "LuaYU_PetSystemGG_03" , 0 ) 
			BeginPlot( TargetID() , "LuaYU_PetSystemGG_04" , 0 ) 
		end

	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_74]" , 0 )  --沒草不能餵
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_74]" , 0 )  --沒草不能餵
			MoveToFlagEnabled(TargetID (), true )
	end
end


function LuaYU_PetSystemGG_02() --玩家餵食

--	Say(OwnerID(), "OwnerID".."2"  )
--	Say(TargetID(), "TargetID".."2"  )
	local GG = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8  ) --雞

	SetPlot( GG,"touch","",0 )

	if BeginCastBar( OwnerID(), "[SC_PETSYS_06]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	

		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_07]" , "0xffffff00")  --你很順利的餵食完畢。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_07]" , "0xffffff00")  --你很順利的餵食完畢。
			DelBodyItem( OwnerID() , 204789 , 1 )
			WriteRoleValue(  GG , EM_RoleValue_Register+1  , OwnerID()  ) --將玩家記起來
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_08]" , "0xffffff00")  --雞要生蛋了。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_08]" , "0xffffff00")  --雞要生蛋了。
			SetPlot( GG,"touch","",0 )
			BeginPlot( GG , "LuaYU_PetSystemGG_05" , 0 ) 

		elseif  ( result == "DAME" ) then

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )


		end


	end


end



function LuaYU_PetSystemGG_03() --玩家餵食

	local GG = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8  ) --雞

	SetPlot( GG,"touch","",0 )

	if BeginCastBar( OwnerID(), "[SC_PETSYS_06]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	

		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_09]" , 0 )  --你手忙腳亂的餵食完畢。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_09]" , 0 )  --你手忙腳亂的餵食完畢。

			DelBodyItem( OwnerID() , 204789 , 1 )

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )


		elseif  ( result == "DAME" ) then

			SetPlot( GG,"touch","LuaYU_PetSystemGG_01",20 )
			MoveToFlagEnabled( GG, true )

		end
	end



end

function LuaYU_PetSystemGG_04() -- 動物動作回饋

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --玩家

--	Say(Player, "Player".."2"  )
--	Say(OwnerID(), "OwnerID".."2"  )	

	AdjustFaceDir( OwnerID(), Player , 0 ) --面向
	sleep(10)
	PlayMotion( OwnerID(), 121) 	
		
	sleep(20)
	PlayMotion( OwnerID(), 121) 	

	sleep(20)
	PlayMotion( OwnerID(), 122) 	


end

function LuaYU_PetSystemGG_05() -- 雞生蛋劇情

--	Say(OwnerID(), "OwnerID")
--	Say(TargetID(), "TargetID")

	local Xegg = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --判斷生蛋位置
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --玩家

	AddBuff( OwnerID() ,503141 ,1 ,20 )--驚訝
	sleep(10)

	WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 0 )

	LuaFunc_MoveToFlag( OwnerID() , 780307 , Xegg , 0 )
--	sleep(5)
	SetPosByFlag( OwnerID(), 780307 , Xegg )

	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+5 , 6  )
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemGG_01",20 )

	BeginPlot( OwnerID() , "LuaYU_PetSystemGG_08" , 0 ) --時間到，雞無主權
	

end

function LuaYU_PetSystemGG_06() -- 取蛋劇情

--	Say(OwnerID(), "OwnerID" )
--	Say(TargetID(), "TargetID" )

	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --判斷蛋的所有權

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+3) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 ) --鎖定拾取中

	if GGsMaster == OwnerID()  then

		if BeginCastBar( OwnerID(), "[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_10]" , "0xffffff00")  --拿到蛋
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_10]", "0xffffff00")  --拿到蛋
				SetPlot( TargetID(),"touch","",0 )--金蛋劇情			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204795 , 1 ) --新鮮的雞蛋

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --解除鎖定

			end


		end

	elseif GGsMaster == 0 then


		if BeginCastBar( OwnerID(),"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_10]" , "0xffffff00")  --拿到蛋
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_10]", "0xffffff00")  --拿到蛋
				SetPlot( TargetID(),"touch","",0 )--金蛋劇情			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204795 , 1 ) --新鮮的雞蛋

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --解除鎖定

			end


		end

	end

end

function LuaYU_PetSystemGG_06_golden() -- 取金蛋劇情

--	Say(OwnerID(), "OwnerID" )
--	Say(TargetID(), "TargetID" )

	local GGsMaster = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --判斷蛋的所有權

	if ReadRoleValue( TargetID() , EM_RoleValue_Register+3) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 ) --鎖定拾取中

	if GGsMaster == OwnerID()  then

		if BeginCastBar( OwnerID(),"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_11]" , "0xffffff00")  --拿到蛋
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_11]", "0xffffff00")  --拿到蛋
				SetPlot( TargetID(),"touch","",0 )--金蛋劇情			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204792 , 1 ) --金蛋

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --解除鎖定

			end


		end

	elseif GGsMaster == 0 then


		if BeginCastBar( OwnerID() ,"[SC_RUNRUNPUMPKIN_05]", 15 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_11]" , "0xffffff00")  --拿到蛋
				ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_11]", "0xffffff00")  --拿到蛋
				SetPlot( TargetID(),"touch","",0 )--金蛋劇情			
				Delobj( TargetID()  )
				GiveBodyItem( OwnerID() , 204792 , 1 ) --金蛋

			elseif ( result == "DAME" ) then	
				WriteRoleValue( TargetID() , EM_RoleValue_Register+3 , 0 ) --解除鎖定

			end


		end

	end

end



function LuaYU_PetSystemGG_07() -- 時間到，蛋無主權

--	sleep(150)
	if CheckID(  OwnerID()  ) == true then
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID  , 0  ) --蛋將玩家記起來(所有權)
	end
end

function LuaYU_PetSystemGG_08() -- 時間到，雞無主權

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --玩家

--	sleep(150)

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+5  ) == 6 and Player == ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )  then
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+5 , 5 )
	end	
end

function Lua_Hao_PetSystem_Egg()	-- 2012.03.30 新增，對應玩家每天首次完成母雞媽媽加油時，必定會領取到一顆金雞蛋(204792)。
	
	local Player = TargetID()
	local Key = { 542576 , 542578 }
	SetFlag( Player , Key[1] , 1 )
	SetFlag( Player , Key[2] , 0 )
end

function Lua_Hao_PetSystem_Egg_0()	-- 2012.04.02 新增，進Zone時給予玩家每日旗標 - 542577，同時，依照旗標給予永久性重要物品 - 542578

	local Npc = OwnerID()
	SetPlot( Npc , "Range" , "Lua_Hao_PetSystem_Egg_1" , 500 )
end

function Lua_Hao_PetSystem_Egg_1()	-- 2012.04.02 新增
	
	local Player = OwnerID()
	local Key = { 542576 , 542577 , 542578 }
	local QuestID = 425174	

	if CheckFlag( Player , Key[2] ) == false then
		SetFlag( Player , Key[2] , 1 )
		SetFlag( Player , Key[3] , 1 )
	--	DeleteQuest( Player , QuestID )
	end
end

function Lua_Hao_PetSystem_Egg_2()	-- 2012.03.30 新增，當玩家與npc對話時，若身上沒有重要物品542576，則強制刪除重覆任務
	
	local Player = OwnerID()
	local QuestID = 425174
	local Key = { 542576 , 542577 , 542578 }
	
	if CheckFlag( Player , Key[1] ) == false then
		SetFlag( Player , Key[2] , 1 )
		SetFlag( Player , Key[3] , 1 )
		DeleteQuest( Player , QuestID )
	end
	LoadQuestOption( Player )
end

function Lua_Hao_PetSystem_Egg_Reset()	-- 2012.04.02 新增，重置玩家當日未接任務的狀態
	
	local Player = OwnerID()
	local QuestID = 425174
	local Key = { 542576 , 542577 , 542578 }
	
	for i = 1 , table.getn(Key) , 1 do
		SetFlag( Player , Key[i] , 0 )
	end
end