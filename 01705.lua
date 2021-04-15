function LuaS_114351_0()
	if CheckFlag( OwnerID() , 543617 ) then
		SetSpeakDetail( OwnerID(),  "[SC_114351_OK]" ) 
		--你在這個訓練之中是否學習到掌控自然之力平衡的要領呢？或許你並未察覺，但請你相信我，你的確有所成長了。
		--如果你還認為自己有所不足，接下來就要從實戰中來獲取更多的經驗了。
		--希望將來在護衛我們聖地的戰爭中，我能看到你成熟的力量以及智慧。
	else
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_0]" ,"LuaS_114351_1", 0 ) --詢問她在這裡負責的事情
	if CheckAcceptQuest( OwnerID() , 422863 ) == true or CheckAcceptQuest( OwnerID() , 422930 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_1]" ,"LuaS_114351_2", 0 ) --詢問自然神官訓練的事情
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_2]" ,"LuaS_114351_3", 0 ) --申請接受訓練
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 0  then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_1]" ,"LuaS_114351_2", 0 ) --詢問自然神官訓練的事情
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_114351_2]" ,"LuaS_114351_3", 0 ) --申請接受訓練
	end
end

function LuaS_114351_1()
		SetSpeakDetail( OwnerID(),  "[SC_114351_3]" )
		 --如果你現在往更深入的地方前進，你會發現我們古老的聖地正被一群恐怖的蟲子所破壞著，他們正侵蝕著這塊聖地的自然之力。
		 --但由於我們精靈已經有很長的歷史未曾經歷過戰鬥，因此雖然我們擁有足以對抗這些敵人的力量，卻缺乏將自然之力運用到實戰的經驗。
		 --我會來到這邊就是為了訓練我們族人運用自然之力的方式。
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114351_0", 0 ) --回到上一頁
end

function LuaS_114351_2()
		SetSpeakDetail( OwnerID(),  "[SC_114351_4]" )
		 --我將建立一個幻象，模擬敵人侵蝕一個自然之力來源的情景，同時賦予接受試煉者召喚植物幻象來對抗敵人的能力。
		 --每種植物幻象都有不同的功能，但要召喚他們必須消耗自然之力，自然之力來源會定期產生自然之力，只要接近便可以獲得自然之力。
		 --接受試煉者必須在時間內阻止自然之力來源被敵人所接觸，這就是我的訓練。
		AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114351_0", 0 ) --回到上一頁
end

function LuaS_114351_3()
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
			if OwnerID() ~= ReadRoleValue( OwnerID() , EM_RoleValue_Register ) then
				local Name = GetName( ReadRoleValue( OwnerID() , EM_RoleValue_Register ) )
				local Str = "[SC_114351_5][$SETVAR1="..Name.."]" --目前[$VAR1]正在接受試煉，你可以在旁邊先看看戰鬥的情況，接下來換你的時候你就會比較知道該怎麼做了。
				SetSpeakDetail( OwnerID(),  Str )
				AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(),  "[SC_114351_7]" )
				AddSpeakOption( OwnerID(), TargetID( ),"[SO_BACK]" ,"LuaS_114350_0", 0 ) --回到上一頁
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 8 and ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
			SetSpeakDetail( OwnerID(),  "[SC_114351_JOB_ERROR]" ) --我所教授以及訓練的是使用自然之力的方式，如果你不是自然神官的話是無法運用這門知識的。
		else
			CloseSpeak( OwnerID() )
			if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
				Say( TargetID() ,  "[SC_114351_6]" ) --現在有人正在接受試煉，你先觀摩一下，看看對方怎麼運用自然之力。
			else
				WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				Say( TargetID() ,  "[SC_114351_7]" ) --你可以看到那座塔嗎？去那邊等待吧！訓練已經開始了。
				AddBuff( OwnerID() , 505865 , 0 , 330 )
				BeginPlot( TargetID() , "LuaS_114351_Train" , 0 )
			end
		end
end

function LuaS_114351_Train()
	--Flag 1 是塔 2～10 是自然之力產生點 11～20 是敵人的產生點
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780534 
	local Count = 60
	local MonsterGroup = {103096 , 103097 , 103095 }
	local Wave = 0
	local NatureTower = CreateObjByFlag(102978 , Flag , 1 , 1 )
	SetModeEX( NatureTower , EM_SetModeType_Move , false )
	SetModeEX( NatureTower , EM_SetModeType_Mark , false )
	AddToPartition( NatureTower , RoomID )
	local ObjIDGroup = {103096 , 103097 , 103095 , 103072 , 103091 , 103092 , 103093 , 103094 , 103022 , 102978 }
	local ObjList = {}
	local Result = 0
	local temp = 0
	local WaveTable = {}
	local Seed = 1
	table.insert(ObjList, NatureTower) 
	for i = 1 , 300 , 1 do
		local HP = ReadRoleValue( NatureTower , EM_RoleValue_HP )
		local MaxHP = ReadRoleValue( NatureTower , EM_RoleValue_MaxHP )
		if CheckID( Player ) == false or CheckBuff( Player , 505865 ) == false or ReadRoleValue( Player , EM_RoleValue_RoomID) ~= RoomID then
			Result = 1
			break
		end
		if CheckID( NatureTower ) == false then
			Result = 1
			break
		end
		if Wave == 4 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_1]" , 0 ) --開始先不用急，以收集自然之力為主，先以[103091]以及[103072]建立防禦線。
		end
		if Wave == 8 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_2]" , 0 ) --注意，敵人的飛行單位出現了，[103091]是無法阻擋飛行單位的。
		end	
		if Wave == 12 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_3]" , 0 ) --敵人數量開始增加，有必要的時候就召喚[103093]，他可以吸引敵人攻擊來爭取時間。
		end	
		if Wave == 16 and Count == 0 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_ADDOIL_4]" , 0 ) --再一點時間就成功了，但此時敵人會盡全力來襲的，千萬不可放鬆。
		end	
		if Count/5 == math.floor(Count/5) then --每 5 秒產生一個自然之力，存在 10 秒，第 12 波之後一次產生 2 個
			if Wave >= 12 then
				temp = 3
			elseif Wave >= 6 then
				temp = 2
			else
				temp = 1
			end
			for i = 1 , temp , 1 do
				local Num = DW_Rand( 9 ) + 1
				local Power = CreateObjbyFlag( 103022 , Flag , 1 , 1 )
				SetModeEX( Power , EM_SetModeType_Mark , false )	
				AddToPartition( Power , RoomID )
				if ( Wave == 4 or Wave == 8 or Wave == 12 or Wave==16 ) and Seed == 1 and i == 1 and Count/15 == math.floor(Count/15) then
						AddBuff( Power , 505895 , 0 , -1 )
						WriteRoleValue( Power , EM_RoleValue_LiveTime , 10 )
						Seed = 0
				else
						AddBuff( Power , 502456 , 0 , -1 )
						AddBuff( Power , 505877 , 0 , -1 )
						WriteRoleValue( Power , EM_RoleValue_LiveTime , 20 )
				end
				SetPlot( Power , "range" , "LuaI_103022_Range" , 15 )
				table.insert(ObjList, Power) 
				CallPlot( Power , "LuaFunc_MoveToFlag" , Power , Flag , Num , 0 )
			end
			if HP/MAXHP < 0.1 then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_114351_LIFE_ALERT_1]" , 0 ) --[102978]已經接近完全損毀					
			elseif HP/MAXHP < 0.5  then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_114351_LIFE_ALERT_2]" , 0 ) --[102978]已經損毀一半					
			end
		end
		if Count/15 == math.floor(Count/15) and Count ~= 60 then --每 15 秒產生一波敵襲
			Wave = Wave + 1
			if Wave <= 3 then
				WaveTable = { 1 , 0 , 0 }
			end
			if Wave > 3 and Wave <= 6 then
				WaveTable = { 2 , 1 , 0 }
			end	
			if Wave > 6 and Wave <= 9 then
				WaveTable = { 3 , 1 , 1 }
			end	
			if Wave > 9 and Wave <= 12 then
				WaveTable = { 3 , 2 , 2 }
			end
			if Wave > 12 and Wave <= 15 then
				WaveTable = { 5 , 2 , 2 }
			end
			if Wave > 15 and Wave <= 18 then
				WaveTable = { 5 , 3 , 3 }
			end
			for pry , obj in pairs(MonsterGroup) do
				if WaveTable[pry] ~= 0 then
					for i = 1 , WaveTable[pry] , 1 do
						local Num = DW_Rand( 10 ) + 10
						local Bugs = CreateObjbyFlag( obj , Flag , Num , 1 )
						local WaitTime = ( i - 1 ) * DW_Rand(3) * 10  
						SetModeEX( Bugs , EM_SetModeType_Mark , false )	
						table.insert(ObjList, Bugs) 
						CallPlot( Bugs , "LuaS_114351_AttackTower" , NatureTower , WaitTime )
					end
				end
			end
		end
		Count = Count + 1
		if Count >= 60 then
			seed = 1
			Count = 0
		end
		sleep( 10 )
	end
	for pry , obj in pairs(ObjList) do --清除所有叫出來的物件
		if CheckID( obj ) == true  and ReadRoleValue( obj , EM_RoleValue_RoomID ) == RoomID then
			for i = 1 , 10 , 1 do
				if ReadRoleValue( obj , EM_RoleValue_OrgID ) == ObjIDGroup[i] then	
					Delobj( Obj )
					break
				end
			end
		end
	end
	
	if CheckID( Player ) == true then
		CancelBuff( Player , 505865 )
		CancelBuff_NoEvent( Player , 505876 )
		if Result == 1 then
			Yell( OwnerID() ,  "[SC_114351_8]" , 3 ) --很可惜，下次再試試看吧！
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_8]" , 0 )
		else
			Yell( OwnerID() ,  "[SC_114351_9]" , 3 ) --你表現的很好，恭喜你通過了訓練。
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_114351_9]" , 0 )
			if CheckAcceptQuest( Player , 422863 ) == true or CheckAcceptQuest( Player , 422930 ) == true then
				SetFlag( player , 543617 , 1 )
			end
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_103022_Range()
	if CheckBuff( OwnerID() , 505865 ) == true then
			if CheckBuff( TargetID() , 505895 ) == true then
				if CheckBuff( OwnerID() , 505876 ) == false then
					AddBuff( OwnerID() , 505876 , 0 , -1 )
					CastSpell(  OwnerID() , TargetID() , 493776 )
					Delobj( TargetID() )
				else
					return
				end
			else
				local BuffPos = Lua_BuffPosSearch(OwnerID()  , 503827 )
				local OrgLv = BuffInfo( OwnerID() , BuffPos , EM_BuffInfoType_Power ) + 1
				if OrgLv  < 10 then
					AddBuff(  OwnerID(), 503827 , 0 , -1 )
					CastSpell(  OwnerID() , TargetID() , 493776 )
					Delobj( TargetID() )
				end
			end
	end
end

function LuaM_505867_Check()
	if CheckBuff( TargetID() , 505865 ) == true then
		local BuffPos = Lua_BuffPosSearch(TargetID() , 503827 )
		local OrgLv = BuffInfo( TargetID() , BuffPos , EM_BuffInfoType_Power ) + 1
		if OrgLv  < 10 then
			return true
		end
	end
	return false
end

function LuaM_505867_Do()
	AddBuff(  TargetID(), 503827 , 0 , -1 )
	CastSpell(  TargetID(),  TargetID() , 493776 )
	Delobj( OwnerID() )
end

function LuaS_114351_AttackTower(tar , time)
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Obj = Role:new( tar )
	if time ~= 0 then
		sleep( time )
	end
	AddToPartition( OwnerID() , RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 103097 then
		AddBuff( OwnerID() , 505869 , 0 , -1 )
	end
	while 1 do
		if HateListCount( OwnerID() ) == 0 then
			if GetDistance( OwnerID() , tar ) > 30 and CheckBuff( OwnerID() , 505875 ) == false then
				Move( OwnerID() , Obj:X() , Obj:Y() , Obj:Z() )
			else
				SetAttack( OwnerID() , tar )
			end
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			break
		end
		sleep( 10 )
	end
end

function LuaS_114351_CheckPlayer()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		if CheckID( TargetID() ) == false or CheckBuff( TargetID() , 505865 ) == false or ReadRoleValue( TargetID() , EM_RoleValue_RoomID) ~= RoomID then
			break
		end
		if CheckBuff( TargetID() , 505865 ) == false then
			break
		end
		sleep( 10 )
	end
	Delobj( OwnerID() )
end

function LuaI_114351_BeginBuff()
	AddBuff( OwnerID() , 505868 , 0 , -1 )
end

function LuaI_SpellCheck_Plants()
	local IDTable = {103096 , 103097 , 103095 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaI_SpellCheck_Bugs()
	local IDTable = {103072 , 103091 , 103092 , 103093 , 103094 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaI_103094_Heal()
	local Count = 0
	for i = 1 , 10 , 1 do
		if i == 5 then
			AddBuff( OwnerID() , 505873 , 0 , -1 )
		end
		if i == 9 then
			AddBuff( OwnerID() , 505874 , 0 , -1)
		end
		if i == 10 then
			CastSpell( OwnerID() , OwnerID() , 495046 )
		end
		sleep( 10 )
	end
	DelObj( OwnerID() )
end

function LuaM_495047_Check()
	local IDTable = {103096 , 103097  }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaM_505878_Use()
	local IDTable = {103096 , 103097 , 103095 }
	local Check = "No"
	for pry , obj in pairs(IDTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if Check == "No" then
		return 
	else
		Delobj( TargetID() )
	end
end

function LuaM_505878_Check( result )
	if result == 1 then
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , 5*MaxHP/100 )
		AddBuff( OwnerID() , 505866 , 0 , 15 )
	end
end

function LuaM_CreatePlant_UseCheck(BuffCount)
	local Pos = Lua_BuffPosSearch( OwnerID() , 503827 )	
	local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )	
	if PLV+1 < BuffCount then
		ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_MAGICSTRING_7]" , 0 )
		return false
	end
	return true
end
function LuaM_CreatePlant_Check(obj , BuffCount)
	local Me = Role:new( OwnerID() )
	local AddBuffCheck = "NO"
	if Obj == 103072 then
		local Grass = LuaFunc_SearchNPCbyOrgID( OwnerID() , 103072 , 20 , 1 )
		if Grass[0] ~= -1 then
			for pry , obj in pairs(Grass) do
				if CheckID(obj) ~= false then
					if CheckBuff( obj , 505870 ) == false and CheckBuff( obj , 505871 ) == false then
						AddBuff( obj , 505870 , 0 , -1 )
						WriteRoleValue( obj , EM_RoleValue_HP , ReadRoleValue( obj , EM_RoleValue_MaxHP ) )
						AddBuffCheck = "Yes"
						CastSpell( obj , obj , 494396 )
						break
					end 
					if CheckBuff( obj , 505870 ) == true and CheckBuff( obj , 505871 ) == false then
						CancelBuff( obj , 505870  )
						AddBuff( obj , 505871 , 0 , -1 )
						WriteRoleValue( obj , EM_RoleValue_HP , ReadRoleValue( obj , EM_RoleValue_MaxHP ) )
						AddBuffCheck = "Yes"
						CastSpell( obj , obj , 494396 )
						break
					end
				end
			end
		end
	end
	if AddBuffCheck == "Yes" then
		AddBuff(OwnerID() , 503827, -BuffCount-1 , -1 )
		return
	end
	local Plant = CreateObj( obj , Me:X() , Me:Y() , Me:Z() , Me:DIR() , 1 )
	SetModeEX( Plant , EM_SetModeType_Mark , false )
	SetModeEX( Plant , EM_SetModeType_Move , false )	
	AddToPartition( Plant , Me:RoomID() )
	if obj == 103094 then
		BeginPlot( Plant , "LuaI_103094_Heal" , 0 )
	else
		BeginPlot( Plant , "LuaS_114351_CheckPlayer" , 0 )
	end
	if obj == 103093 then
		AddBuff(Plant , 505872 , 0 , -1 )
		CastSpell( Plant , Plant , 495045 )
	end
	CastSpell( Plant , Plant , 494747 )
	AddBuff(OwnerID() , 503827, -BuffCount-1 , -1 )
end

function LuaM_505884_Check()
	local PlantID = {103072 , 103091 , 103092 , 103093 , 103094 }
	local Check = "No"
	for pry , obj in pairs(PlantID) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == obj then
			Check = "Yes"
			break
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102978 then
		AddRoleValue( TargetID() , EM_RoleValue_HP , ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) / 100  )
		CastSpell( TargetID() , TargetID() , 493776 )
		return false
	end
	if Check == "No" then
		return false
	end
	return true
end

function LuaM_505875_Hit(result)
	if result == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 1 )
	end
end

function LuaM_505876_Check()
	if CheckBuff( OwnerID() , 505876 ) == false then
		AddBuff(OwnerID() , 503827, -7-1 , -1 )
		return true
	end
	return false
end

function LuaM_505761_Do()
	SetRoleCamp( TargetID() , "SNPC" )
	SetStopAttack( TargetID() )
	if CheckBuff( TargetID() , 505875 ) == true then
		CancelBuff( TargetID() , 505875 ) 
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 777 )
end