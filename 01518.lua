-----------------------點擊給予任務422648樹人之歌--------------------------

function LuaI_205758_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 422648, 1 ) )
	ShowBorder( OwnerID(), 422648, str ,"ScriptBorder_Texture_Paper" )	
end

-------------------------------422649夏伊洛古---------------------------------------

function LuaS_422649()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422649)==true )and( Checkflag( OwnerID() , 543004) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422649_0]","LuaS_422649_1",0) --好，我想了解。
	end
end


function LuaS_422649_1()  
	SetSpeakDetail(OwnerID(),"[SC_422649_1]")				--你知道嗎？傑出的森林牧者......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422649_2]","LuaS_422649_2",0)	--那位森林牧者的名字是？
end

function LuaS_422649_2()  
	SetSpeakDetail(OwnerID(),"[SC_422649_3]")				--一個優雅且帶有和平使者之意的名字～森林牧者的名字是夏伊洛古～
	SetFlag(OwnerID() ,543004, 1 )
end

----------------------------422651緬懷過往---------------------------------------

function LuaS_422651()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422651)==true )and( Checkflag( OwnerID() , 543003) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_0]","LuaS_422651_1",0) --嗯，我會聽你說。
	end
end

function LuaS_422651_1()  
	SetSpeakDetail(OwnerID(),"[SC_422651_1]")				--認識他們的初始要從很久、很久之前說起，那時他們的相處情形
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_2]","LuaS_422651_2",0)	--他們一直在互相競爭？
end


function LuaS_422651_2()  
	SetSpeakDetail(OwnerID(),"[SC_422651_3]")				--是的，直到他們再度為了無聊的好勝心展開
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_4]","LuaS_422651_3",0)	--很有趣的發展。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_5]","LuaS_422651_3",0)	--呵～從仇人變成摯友啊～
end


function LuaS_422651_3()  
	SetSpeakDetail(OwnerID(),"[SC_422651_6]")				--沒錯，所有樹人就屬他們兩個的關係最特別
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_7]","LuaS_422651_4",0)	--......唉，我明白了...
end

function LuaS_422651_4()  
	closespeak(OwnerID())
	SetFlag(OwnerID() ,543003, 1 )					
end

-------------------------422652遲來的道別---------------------------------------

function LuaS_422652()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422652)==true )and( Checkflag( OwnerID() , 543001) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422652_0]","LuaS_422652_1",0)	--請冷靜下來，夏伊洛古請我向你們說出他來不及說出口的道別。
	end
end

function LuaS_422652_1()
	SetSpeakDetail(OwnerID(),"[SC_422652_1]")					--什…麼？夏伊洛古、夏伊洛古請你來？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422652_2]","LuaS_422652_2",0)		--…恐怕不行，他現在沒有實體，他說...可能是我身上有神官殘留的氣息才能見到他…
end

function LuaS_422652_2()  
	SetFlag(OwnerID() ,543001, 1 )
	CloseSpeak( OwnerID())
end

------------------------493830夢的異象---------------------------------------
	
function LuaM_493830_0()	--檢查
	if CheckAcceptQuest( OwnerID() , 422647 ) == false or CheckFlag( OwnerID() , 543000) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422591_0]" , 0 ) --你目前不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422591_0]" , 0 ) 
		return false
	end
	local Obj =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113392 , 100 )
	if Obj< 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422647_0]" , 0 ) --必須接近呈現壞紫色的地表才能使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422647_0]" , 0 ) 
		return false
	end
	return true
end

function LuaM_504229_0()
	if CheckAcceptQuest( OwnerID() , 422647 ) == true then
	--local soil=LuaFunc_CreateObjByObj ( 113393 , 113392 )
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422647_1]", 0 )
		SetFlag( OwnerID() , 543000 , 1 )
	--sleep(50)
	--delobj(soil)
	end
end

function LuaQ_422647_Complete()
	BeginPlot( TargetID() , "LuaQ_422647_Complete_2" , 0 )
end

function LuaQ_422647_Complete_2()
	local Count = CountBodyItem( OwnerID() , 205756 )
	if Count > 0 then
		DelBodyItem( OwnerID() , 205756 , Count )
	end
end

-----------------------無法隱藏的邪念

function LuaS_205757()
	CastSpell( OwnerID(),TargetID(), 493887 )
end

function LuaS_205757_0()
	if CheckAcceptQuest( OwnerID() , 422644 ) == true then
		if CheckFlag( OwnerID() , 542999 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_1]" , 0 ) --你已經知道情況了，趕快帶著儲思水晶回去跟[113378]神官報告。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_1]" , 0 ) 
			return 
		end
		local foe =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102170 , 70 )
		if foe< 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_2]" , 0 ) --你必須先接近[102170]才能使用[205757]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_2]" , 0 ) 
			return 
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_3]" , 0 ) --一陣斷斷續續的話語從眼前的索雷爾頓入侵者傳出…
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_3]" , 0 ) 
			BeginPlot( foe , "LuaS_205757_1" , 20 )
			
			return 
		end
	end
end



function LuaS_205757_1()
	tell(TargetID(),OwnerID(),"[SC_422644_0]")	--嘿～「生命之源」保管再嚴密，那群沒用的樹人和精靈也一定想不到我們用這種方式竊得自然之力～	
	sleep(20)	
	tell(TargetID(),OwnerID(),"[SC_422644_1]")	--生命盜取者不愧是最新改良的魔獸～吸取自然之力到最後，「生命之源」被我們全部帶走也是遲早的事。
	sleep(20)
	tell(TargetID(),OwnerID(),"[SC_422644_2]")	--讓巨蟲王去干擾那棵礙眼老樹的方法真是做對了，這些蠢貨竟然都沒發現不對勁～
	sleep(20)
	tell(TargetID(),OwnerID(),"[SC_422644_3]")
	sleep(10)
	SetFlag( TargetID() , 542999 , 1 )
end

-----------------------------422650 一絲希望

function LuaI_205759_0()
	if CheckAcceptQuest( OwnerID() , 422650 ) == false or Checkflag( OwnerID() , 543002 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 102192 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 )
		return false
	end

	if GetDistance( OwnerID() , TargetID() ) > 100 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]" , 0 )
		return false
	end

	return true
end


function LuaI_205759_1()	--點擊物品觸發
	BeginPlot( TargetID() , "LuaI_205759_2" , 0 )
end

function LuaI_205759_2()
	AddBuff( OwnerID() , 504306 , 1 , 10 )
	Hide( OwnerID() )
	local Obj = Role:new( OwnerID() )
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Forg = CreateObj( 113395 , Obj:X() , Obj:Y() , Obj:Z() ,Obj:Dir() , 1 )
	WriteRoleValue( Forg , EM_RoleValue_LiveTime , 30 )
	SetModeEx( Forg , EM_SetModeType_Strikback , false )
	SetModeEx( Forg , EM_SetModeType_Move , false )
	SetModeEx( Forg , EM_SetModeType_Searchenemy , false )
	SetModeEx( Forg , EM_SetModeType_Fight , false )
	WriteRoleValue( Forg , EM_RoleValue_PID , OwnerID() )
	AddToPartition( Forg , Room )
	say(Forg,"[SC_422650_0]")
	sleep(30)
	say(Forg,"[SC_422650_1]")
	sleep(30)
	say(Forg,"[SC_422650_2]")
	setflag(TargetID(),543002,1)
	sleep( 10 )
	delobj(Forg)
	CancelBuff( OwnerID(), 504306 )
	Show( OwnerID() , Room )
end

