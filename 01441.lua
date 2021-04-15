--===============================================================================================================================--
function LuaI_PQControlCenter_TEST() --階段控制器產生script
	local NumSet = { 3 , 3 , 3 } --每一個階段所要到達的數字，負值代表到達這個數字回到重置階段，正值代表到達這個數字進入下一階段，0 代表不計數
	local TimeSet = { 10 , 10 , 10 , 10 } --單位為秒，負值代表到達這個數字回到重置階段，正值代表到達這個數字進入下一階段，最後一位為重置所需的時間，0 代表不限時

--	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --辨識旗標，當一個 Zone 擁有兩個以上階段控制器的時候需要加辨識旗標，來分開兩者的全域變數
--	LuaPQ_CreatePQStage(NumSet,TimeSet,CheckFlag) --自動依據上面的資訊產生全域變數的函式

	LuaPQ_CreatePQStage(NumSet,TimeSet) --也可以不加CheckFlag，不加的狀況會自動取 RoomID 作為辨識旗標

	LuaI_PQ_AllBeControledByOne()   --開始回圈，執行階段控制的工作
end
--===============================================================================================================================--
--物件控制用script，在物件上的 PID 將決定在哪幾個階段顯示，比方說 23 就會讓物件在第 2 以及第 3 階段顯示，103則是第 1 3 以及重置階段會出現，使用的物件建議將”刪除後立即消失”勾起，這樣玩家才不會看到出現又消失的情況。

function LuaI_PQ_ObjectMob_TEST1() 
	LuaI_PQ_ObjectInitial() --初始化，執行控制物件依不同階段來顯示或不顯示的動作
--	LuaI_PQ_ObjectInitial_RH() --另一種初始化，使用此函式會略過以中控函式關閉顯示的動作
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST1" , 0 ) --設定物件劇情，必須在回圈前設定，這將決定物件用何種方式來改變計數器的數字，這邊是殺死物件時改變數字，來統計殺死幾個物件
end
function LuaI_PQ_ObjectDead_TEST1()
	local Stage = LuaPQ_GetStage() --取得現在的階段
	if Stage == 1 then --判定這個階段是不是該改變計數器數字
		LuaPQ_ChangeNum(1) --改變這個階段的計數器數字，正值代表推進，負值代表倒退
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 ) --發送訊息
	end
	return true
end
--==================================================================================================================================--
function LuaI_PQ_ObjectMob_TEST2()
	LuaI_PQ_ObjectInitial() --初始化，執行控制物件依不同階段來顯示的動作，這個函式並不做不顯示的處理
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST2" , 0 )
end
function LuaI_PQ_ObjectDead_TEST2()
	local Stage = LuaPQ_GetStage()
	if Stage == 2 then
		LuaPQ_ChangeNum(1)
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 )
		ScriptMessage( OwnerID() , -1 , 2 , "We have Only "..LuaPQ_GetTime().." seconds" , 0 )
	end
	return true
end

function LuaI_PQ_ObjectMob_TEST3()
	LuaI_PQ_ObjectInitial()
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST3" , 0 )
end
function LuaI_PQ_ObjectDead_TEST3()
	local Stage = LuaPQ_GetStage()
	if Stage == 3 then
		LuaPQ_ChangeNum(1)
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 )
		ScriptMessage( OwnerID() , -1 , 2 , "We have Only "..LuaPQ_GetTime().." seconds" , 0 )
	end
	return true
end


function LauI_PQ_MSG_TEST()
	local Stage = 0
	local OrgNum = 0
	local Num = 0
	local OrgTime = 0
	local Time = 0
	local Str = ""
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		Stage = LuaPQ_GetStage()
		Yell( OwnerID() , "Now Stage is "..Stage , 5 )
		if Stage ~= 0 then
			OrgNum = math.abs(LuaPQ_GetOrgNum())
			Num = LuaPQ_GetNum()
			OrgTime = math.abs(LuaPQ_GetOrgTime())
			Time = LuaPQ_GetTime()
			Yell( OwnerID() , "Need "..OrgNum.." corpers , Now We Have "..Num.." . " , 5 )
			if OrgTime ~= 0 then
				Yell( OwnerID() , "We have "..OrgTime.." seconds for working , Now We leave "..Time.." seconds . " , 5 )
			end
			Str = ""

			if table.getn(ZonePQ_ValueGroup_Drama[Room]["Mob"][Stage])  > 0 then
				for pry , obj in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"][Stage])  do  
					Str = Str..pry.." ="..obj.."= "
				end
				Yell( OwnerID() , "Mobs : "..Str , 5 )
			end
		else
			OrgTime = math.abs(LuaPQ_GetOrgTime())
			Time = LuaPQ_GetTime()
			if OrgTime ~= 0 then
				Yell( OwnerID() , "We have "..OrgTime.." seconds for rest , Now We leave "..Time.." seconds . " , 5 )
			end
		end
		sleep( 30 )
	end
end

function LuaI_PQ_TEST_GOGO()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	local Stage = LuaPQ_GetStage() 
	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Stage ~= 0 then
		if OrgNum > 0 then
			LuaPQ_ChangeNum(OrgNum)
		else
			ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
		end
	else
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	end
end

function LuaI_PQ_TEST_GOGO_LIMIT()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	local Stage = LuaPQ_GetStage() 
	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Stage ~= 0 then
		if OrgNum > 0 then
			LuaPQ_ChangeNum(OrgNum)
		end
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	else
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	end
end

function LuaI_PQ_TEST_SHOWALL()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Str = ""
	local Sg = LuaPQ_GetStage()

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"])  do
		Str = "Stage = "..pry.." Mob : "
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"][pry])  do  
			Str = Str..pry2.." ="..obj2.."= "
		end
		Yell( OwnerID() , Str , 5 )
	end

	Str = " Time : "
	for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["CheckTime"])  do  
		Str = Str..pry2.." ="..obj2.."= "
	end
	Yell( OwnerID() , Str , 5 )

	local Time = LuaPQ_GetTime()
	local OrgTime = math.abs(LuaPQ_GetOrgTime())
	Yell( OwnerID() , "Stage "..Sg.." ,Time is "..Time.."/"..OrgTime , 5 )

	Str = " Number : "
	for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["CheckNum"])  do  
		Str = Str..pry2.." ="..obj2.."= "
	end
	Yell( OwnerID() , Str , 5 )

	local Num = LuaPQ_GetNum()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	Yell( OwnerID() , "Stage "..Sg.." , Number is "..Num.."/"..OrgNum , 5 )
end
