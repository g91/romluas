---------------------------------------------------------------------------------------------------------------------------------------------------------
--121988 布里吉初始/對話劇情
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_na_2013music_121988() --布里吉初始劇情，隱藏守衛
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 200)
	local OrgID = 100938	
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
		LuaN_miyon_action02()
end


--布里吉的對話劇情
function Lua_na_2013music_121988_0() 
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag( Owner , 547704) == true then --本日已完成過任務
		SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_5]") --
		AddSpeakOption(Owner , Target , "[SC_2013MUSIC_121988_01]","Lua_na_2013music_121988_1",0 ) 
		AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --用20個[241640]兌換1個[204428]。音符	
	else
 		SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_0]")
		AddSpeakOption( Owner , Owner , "[SC_2013MUSIC_121988_00]" , "Lua_na_2013music_121988_2" , 0 ) --驅動留聲機，玩法
--		AddSpeakOption( Owner , Owner  , "[SC_2013MUSIC_121988_02]", "Lua_na_2013music_item1" , 0 ) --用20個[241640]兌換[241640]。樂章
	end	
end

--說明樂譜殘頁的功能
function Lua_na_2013music_121988_1() 
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_1]") --說明關於樂譜殘頁的訊息
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --用20個[241640]兌換1個[204428]。音符	
end

--留聲機的規則
function Lua_na_2013music_121988_2() 
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_2]" )
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_02]" , "Lua_na_2013music_item1",0 )  --用10個[241640]兌換[241640]。樂章
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --用20個[241640]兌換1個[204428]。音符	
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--兌換物品
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--兌換修復的樂章，一日限領一次，唯一物品
function Lua_na_2013music_item1() 
	local Owner = OwnerID()
	CloseSpeak(Owner)
	if  CountBodyItem( Owner , 241641 ) == 1 then --身上已經有樂章
		ScriptMessage( Owner , Owner , 1 , "[SC_Z23Q425436_2]" , 0 ) --你已經擁有相同的東西了。
	else --身上沒有樂章
		if CountBodyItem( Owner , 241640 ) >= 10 then --身上擁有10張以上的破損的樂譜
			DelBodyItem( Owner , 241640 , 10 )
			GiveBodyItem( Owner , 241641 , 1 ) --給予修復的樂章
		--	SetFlag( Owner ,547703 , 1 ) --給予本日已領取的旗標
		else
			ScriptMessage( Owner , Owner , 1 ,  "[SC_112311_6]" , 0 ) --您所持有的數量不足，還不能兌換喔。
		end
		
	end
end

--兌換音符
function Lua_na_2013music_item2() 
	local Owner = OwnerID()
	CloseSpeak(Owner)
	if CountBodyItem( Owner , 241640 ) >= 20 then --身上擁有20張以上的破損的樂譜
		DelBodyItem( Owner , 241640 , 20 )
		GiveBodyItem( Owner , 204428 , 1 ) --給予音符
	else
		ScriptMessage( Owner , Owner , 1 ,  "[SC_112311_6]" , 0 ) --您所持有的數量不足，還不能兌換喔。
	end
end




function Lua_na_test_motion()
	local Owner = OwnerID()
	for i=1, 5 do
		sleep(20)
		Say( Owner , 1)
		PlayMotion( Owner , 145)
		sleep(20)
		Say( Owner , 2)
		PlayMotion( Owner , 146)
		Sleep(50)
		Say( Owner ,3)
		PlayMotion( Owner , 146)
	end
end
	


--------------------------------------------------------------------
--測試指令
--------------------------------------------------------------------
function Lua_na_2013music_clear()
	local Owner = OwnerID()
	SetFlag( Owner , 547703 , 0 ) --樂譜
	SetFlag( Owner , 547704 , 0 ) --活動
end


function Lua_na_2013Music_test1(Round) --群體分數
	local Owner = OwnerID()
	local BuffLv =  FN_CountBuffLevel(Owner , 624054 ) --檢查玩家身上BUFF
	AddBuff(Owner, 624054 , Round , 150 )
end

function Lua_na_2013Music_test2(Score) --個人分數
	local Owner = OwnerID()
	local BuffLv =  FN_CountBuffLevel(Owner , 624135 ) --檢查玩家身上BUFF
	AddBuff(Owner, 624135 , Score , 150 )
end