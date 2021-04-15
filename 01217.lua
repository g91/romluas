function YUYULua_PetsGo_00()

	SetPlot( OwnerID() , "dead","YUYULua_PetsGo_01",0 )           

end

function YUYULua_PetsGo_01()

--	local HateC = HateListCount( OwnerID() ) --仇恨列表
	local MaxHate = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID ) --仇恨列表最高者

	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID  ) --該怪在資料庫的統一ID

	local PlayerLV = ReadRoleValue( MaxHate , EM_RoleValue_LV  ) --該仇恨最高者之等級
	local MonsterLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  ) --該怪之等級

	Say(   MaxHate , PlayerLV )

	local P = 100
	local XX = Rand( P )    
  

	if Math.abs(MonsterLV - PlayerLV) <= 5 then

	
		if XX >= 95 and XX <= 100 then   --5%

			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() ) 
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )

		elseif XX >= 55 and XX <= 60 then   --5%


			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() )
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )

--		elseif XX >= 0 and XX <= 5 then   --5%
		else
--		elseif XX >= 0 and XX <= 30 then   --30%

			local Peter = LuaFunc_CreateObjByObj ( 112770 , OwnerID() ) 
			AddToPartition( Peter , 0 )  

			WriteRoleValue( Peter ,EM_RoleValue_PID  , MaxHate  )
			WriteRoleValue( Peter ,EM_RoleValue_Register+1  , MonsterID  )

			BeginPlot( Peter , "YUYULua_PetsGo_02" , 0 )    
--			Say(   Peter , "YES" )
		
		end
	else

		ScriptMessage( OwnerID() , -1 , 1 , "Your LV - Monster's LV must =< 5 " , C_SYSTEM )      -- 等級太高不可能出寵物。5級內才有
		ScriptMessage( OwnerID() , -1 , 0 , "Your LV - Monster's LV must =< 5" , C_SYSTEM )

	end




end


function YUYULua_PetsGo_02()

	local Player = ReadRoleValue( OwnerID()  , EM_RoleValue_PID  ) 
	local MonsterID = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+1  ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

--	Say( OwnerID() , "OwnerID!!" ) --NPC
--	Say( TargetID() , "TargetID!!" ) --怪物
--	Say( Player , "Player" ) --玩家


	ScriptMessage( Player , Player , 1 , "Peter is coming!" , C_SYSTEM )      -- 發現了生物研究員！他似乎有危險了！請趕快幫助他！
	ScriptMessage( Player , Player , 0 , "Peter is coming!" , C_SYSTEM )

	local X = ReadRoleValue( OwnerID()  , EM_RoleValue_X  ) 
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y  ) 
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z  ) 
	local D = ReadRoleValue( OwnerID()  , EM_RoleValue_Dir  ) 

	local M1 = CreateObj ( MonsterID , X , Y , Z , D , 1)
	local M2 = CreateObj ( MonsterID , X , Y , Z , D , 1)
	local M3 = CreateObj ( MonsterID , X , Y , Z , D , 1)

	SetFollow( OwnerID() , Player )

	Say( OwnerID() , "Help!!" ) --救命呀！
	sleep(25)

	AddToPartition( M1 , RoomID) 
	SetPlot( M1 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M1 , Player  )
	sleep(15)

	Say( OwnerID() , "Help!!" ) --救命呀！
	AddToPartition( M2 , RoomID) 
	SetPlot( M2 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M2 , Player  )
	sleep(15)

	Say( OwnerID() , "Help!!" ) --救命呀！
	AddToPartition( M3 , RoomID) 
	SetPlot( M3 , "dead","YUYULua_PetsGo_06",0 )        
	SetAttack( M3 , Player  )

	while true do
	sleep(10)
		if ReadRoleValue( M1 , EM_RoleValue_IsDead ) == 1 or CheckID( M1 ) == false or ReadRoleValue( M1 , EM_RoleValue_IsPlayer ) == 1 then
			if ReadRoleValue( M2 , EM_RoleValue_IsDead ) == 1 or CheckID( M2 ) == false or ReadRoleValue( M2 , EM_RoleValue_IsPlayer ) == 1 then
				if ReadRoleValue( M3 , EM_RoleValue_IsDead ) == 1 or CheckID( M3 ) == false or ReadRoleValue( M3 , EM_RoleValue_IsPlayer ) == 1 then


					Say( OwnerID() , "Thank You!! I've a gift fot you!!" ) -- 謝謝你救了我！可否收下我的小禮物？
					sleep(10)

					WriteRoleValue( OwnerID()  , EM_RoleValue_Register+2  , 5  )
--					Say( OwnerID() , ReadRoleValue( OwnerID()  , EM_RoleValue_Register+2  ) )

					sleep(10)
					SetFollow( OwnerID() ,  OwnerID() )
					BeginPlot( OwnerID() , "YUYULua_PetsGo_05" , 0 )    
					break

				end
			end



		elseif ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or CheckID( Player ) == false  then
			
			if CheckID(M1) == true then
				SetAttack( M1 , OwnerID()  )
			end
			if CheckID(M2) == true then
				SetAttack( M2 , OwnerID()  )
			end
			if CheckID(M3) == true then
				SetAttack( M3 , OwnerID()  )
			end
			sleep(600)
			BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
			sleep(30)
			Delobj( OwnerID() )
			break
		end
	end

end

function YUYULua_PetsGo_03() -- 掛在任務NPC   112770

--	local Player = ReadRoleValue( OwnerID()  , EM_RoleValue_PID  ) 
--	local MonsterID = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+1  ) 
--	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 




--	while true do
--	sleep(10)

--Say( OwnerID() , "OwnerID!!" ) 
--Say( TargetID() , "TargetID!!" ) 

		local Petgive = ReadRoleValue( TargetID()  , EM_RoleValue_Register+2  ) --是否殺光怪物

--		Say( OwnerID() , ReadRoleValue( OwnerID()  , EM_RoleValue_Register+2  ) )

		if Petgive == 5 then

			SetSpeakDetail( OwnerID(), "OK,I take it!"  ) --確認
			AddSpeakOption( OwnerID(), TargetID( ), "OK" , "YUYULua_PetsGo_04", 0 )

		else
			SetSpeakDetail( OwnerID(), "Help!!"  ) 
		end
--	end


end


function YUYULua_PetsGo_04()

--Say( OwnerID() , "OwnerID!!" ) 
--Say( TargetID() , "TargetID!!" ) 

	local Player = ReadRoleValue( TargetID()  , EM_RoleValue_PID  ) 
	local NowMID = ReadRoleValue( TargetID()  , EM_RoleValue_Register+1  ) --打死的怪的ID
	local Petgive = ReadRoleValue( TargetID()  , EM_RoleValue_Register+2  ) --是否殺光怪物


--以下為怪物、寵物蛋對照表

	local EggID= {	204236,
			204236,
			204227
			}
	local MonsterID= {	100643,
				101996,
				100878
			}


	local NewEgg = 0

	for i= 1 , table.getn(MonsterID) do

		if NowMID == MonsterID[i] then 
			NewEgg = EggID[i]
		end
	end

	if Petgive == 5 and Player == OwnerID()  then	 --加入"非 鎖定之玩家 不可觸發觸碰劇情"

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

			CloseSpeak( OwnerID()  )	
			GiveBodyItem( OwnerID() ,  NewEgg  , 1 ) --寵物蛋
			WriteRoleValue( TargetID()  ,EM_RoleValue_Register+2  , 0  )	

			Say( TargetID() , "Bye~" ) --謝謝你！再見！
			PlayMotion( TargetID() , 116) 
			sleep(20)
			Delobj( TargetID() )


		else
			SetSpeakDetail( OwnerID(), "[SC_111576_YU_05]"   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
		end
	end


end


function YUYULua_PetsGo_05()


	sleep(600)

	Say( TargetID() , "You don't want it ? OK!Bye~" ) --謝謝你！再見！
	PlayMotion( TargetID() , 116) 
	sleep(50)
	Delobj( TargetID() )




end

function YUYULua_PetsGo_06()--出現的怪馬上死

	Delobj( OwnerID() )

end

