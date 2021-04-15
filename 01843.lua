

---------------------423194--------------------------------
function LuaS_423194_0()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423194_1",100)
end

function LuaS_423194_1()		----player => owner   ;  隱形球 => target	
	if 	CheckAcceptQuest( OwnerID() , 423194 ) == true	and	----有接423194
		CheckFlag( OwnerID() , 543996) == false	and	----沒有任務flag
		CheckBuff(OwnerID() , 506728) == false	and	----沒有等待buff
		CheckBuff(OwnerID() , 506727) == false	then	----沒有演戲buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then	----not buzy then 演戲,給演戲buff
				WriteRoleValue ( TargetID() , EM_RoleValue_Register +2,0 )
				AddBuff(OwnerID(),506728,1,600)				
				BeginPlot(TargetID(),"LuaS_423194_3",1)
		else									----buzy then 給等待buff
				BeginPlot(TargetID(),"LuaS_423194_2",1)
		end
	end 
end

function LuaS_423194_2()		----player => target   ;  隱形球 => Owner	
	tell(TargetID()  ,OwnerID()  , "[SC_423194_0]")	
	tell(OwnerID()  ,TargetID()  , "[SC_423194_0]")	
	--WriteRoleValue(OwnerID()  , EM_RoleValue_Register +1,0)	
	AddBuff(TargetID(),506728,1,60)				---給予等待BUFF

end

function LuaS_423194_3()		----player => target   ;  隱形球 => Owner
	

	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)			---buzy		
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Local buzy = 1
	while buzy == 1 do							---只要BUZY為1即重複演戲
	
		if	 ReadRoleValue( OwnerID(), EM_RoleValue_Register +2) == 0	then
			BeginPlot(OwnerID(),"LuaS_423194_noquest",0)
		end  
		local Player = SearchRangePlayer ( OwnerID() , 100 )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506728) == true	then
				CancelBuff( player[i]  , 506728  ) 	--
				AddBuff(player[i],506727,1,400)
			end
		end		
---------------------
		Local be =    Lua_DW_CreateObj("flag" ,115350,780609,0)		---種出龍
		Local gu =    Lua_DW_CreateObj("flag" ,115351,780609,1)
		local mo2 = LuaFunc_SearchNPCbyOrgID( be,115356 , 10000 , 0)	---用mo位置創造演戲用mo假人
		local mo = Lua_DW_CreateObj("obj",115352,mo2)   --mo假人
		DisableQuest( be , true )
		DisableQuest( gu , true )
		DisableQuest( mo , true )
		PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --跪下				
		sleep(20)
		WriteRoleValue(be , EM_RoleValue_IsWalk, 1 )	
		WriteRoleValue(gu , EM_RoleValue_IsWalk, 1 )	

	
		Yell(be,"[SC_423194_1]",3)								-----這下罪證確鑿了吧？上面的爪印不是你留下的還會有誰？龍和人生的孩子，到底就是低劣了一點，做出這種事情，你以為其他龍還容得下你嗎？

		sleep(50)



		Yell(gu,"[SC_423194_2]",3)								-----不會是摩瑞克．渥林特做的，我信任他。摩瑞克．渥林特不可能是你做的對吧！對不起，原本我只是有點想念你、想幫忙你，沒有想到會被貝納德利給知道……
		sleep(50)
		Yell(be,"[SC_423194_3]",3)								-----不用為摩瑞克．渥林特狡辯了。那些什麼龍襲擊村莊的八成也是他幹出來，果然是繼承低劣的血統所生下的孩子。
		sleep(50)



		PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_END)	   --舉手禮
		Yell(mo,"[SC_423194_4]",3)								-----我會證明自己的清白，貝納德利。我的同伴是最好的證人，至於這謠言的真相，我會詳加調查並親自向女王莉蓮維斯答覆。

		sleep(50)	
		Yell(be,"[SC_423194_5]",3)								-----哼，從現在起你最好快編織好你的藉口，否則我絕不會遲疑向女王莉蓮維斯建議對你像馬提洛斯一樣剝奪走使用元素的權利，剝奪你身為龍族的資格。
	
		sleep(20)
		DW_MoveToFlag(be,780609 , 3,0 ,1)	



		delobj(be)
		Yell(gu,"[SC_423194_6]",3)								-----摩瑞克．渥林特，在貝納德利尚未跟上之際，我曾瞥到和你相似的身影飛向了阿利瑪墓穴。我會回去向母親確認這些年是否還有像你一樣的半龍人，還你清白。

		sleep(30)				
		DW_MoveToFlag(gu,780609 , 3,0 ,1)	
		delobj(gu)

		local Player5 = SearchRangePlayer ( OwnerID() , 300 )					----正在看戲才看的到
		for i = 0 , table.getn(Player5) do
			if	CheckBuff(player5[i] , 506727) == true	then
				ScriptMessage( player5[i] , player5[i] , 0 , "[SC_423194_7]" ,  "0xFFFFFF00" ) 		-----摩瑞克．渥林特臉色的神情帶著一些落。
				ScriptMessage( player5[i] , player5[i] , 1 , "[SC_423194_7]" ,  "0xFFFFFF00" ) 
			end
		end

		sleep(30)
		AdjustFaceDir( mo ,TargetID(), 0 )							----摩瑞克轉向玩家
		sleep(10)
		Yell(mo,"[SC_423194_8]",3)								-----嗯，你來了？
		sleep(30)								
		delobj(mo)
------------------------
		local Player2 = SearchRangePlayer ( OwnerID() , 150 )			----在觸發點附近且有演戲BUFF的玩家給予旗標
		for i = 0 , table.getn(Player2) do
			if	CheckBuff(player2[i] , 506727) == true	and	CheckAcceptQuest( player2[i] , 423194 ) == true		then
				SetFlag(player2[i],543996,1)	--give mission flag
				CancelBuff( player2[i]  , 506727  ) 	--
			end
		end

		local Player22 = SearchRangePlayer ( mo2 , 150 )			----在摩瑞克附近且有演戲BUFF的玩家給予旗標
		for i = 0 , table.getn(Player22) do
			if	CheckBuff(player22[i] , 506727) == true	and	CheckAcceptQuest( player22[i] , 423194 ) == true		then
				SetFlag(player22[i],543996,1)	--give mission flag
				CancelBuff( player22[i]  , 506727  ) 	--
			end
		end	

		local Player4 = SetSearchAllPlayer ( 0 )			----刪除所有玩家的演戲BUFF
		for i = 1 , Player4 , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckBuff(	ID , 506727) == true	then
				CancelBuff( ID  , 506727  ) 	--
			end
		end
------------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() , 100 )			----觸發點附近有玩家有等待BUFF,BUZY=1,重複演戲
		for i = 0 , table.getn(Player3) do			
			if	CheckBuff(player3[i] , 506728) == true	and	CheckAcceptQuest( player3[i] , 423194 ) == true		then
				buzy = 1
			end
		end
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )

	end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end

function LuaS_423194_noquest()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,1 )
	local Players
	local ID	
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register +2) == 1	do
		Players = SetSearchAllPlayer ( 0 )
		for i = 1 , Players , 1 do 
			ID = GetSearchResult()
			if CheckID(ID) == true and 	CheckAcceptQuest( ID , 423194 ) == false	and	CheckBuff(ID , 506727) == true	then
				CancelBuff( ID  , 506727  ) 	--
			end
		end	
		sleep(20)
	end
end




------------------------------423195------------------------------------

function LuaS_423195_0()
	SetPlot(OwnerID() , "range","LuaS_423195_check",250)
end

function LuaS_423195_check()
	local O_ID = OwnerID()
	local T_ID = TargetID()
	if	CheckAcceptQuest( O_ID ,423195 ) == true	and 	CheckFlag( O_ID , 543997 ) == false	and	CheckBuff( O_ID ,  506729) == false	then		--有任務無旗標
		if	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 0	then						--還沒開始
			WriteRoleValue( T_ID,EM_RoleValue_Register+1, 1 )	--讓NPC忙
			AddBuff( O_ID, 506729 , 0 , 40 )
			BeginPlot( T_ID, "LuaS_423195_1", 0 )
		elseif	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 1	then						--仍再戰鬥
			ScriptMessage( O_ID , O_ID , 1 , "[SC_423195_0]" , "0xFFFFFF00"  ) 
			ScriptMessage(O_ID , O_ID , 0 , "[SC_423195_0]" , "0xFFFFFF00"  )
			AddBuff( O_ID, 506729 , 0 , 40 )
		else												--戰鬥結束正在演戲
			ScriptMessage( O_ID , O_ID , 1 , "[SC_423195_6]" , "0xFFFFFF00"  ) 
			ScriptMessage(O_ID , O_ID , 0 , "[SC_423195_6]" , "0xFFFFFF00"  )			
		end
	end
end

function LuaS_423195_1()		----player => target   ;  隱形球 => Owner

		local Player5 = SearchRangePlayer ( OwnerID() , 300 )					----有接任務才看的到
		for i = 0 , table.getn(Player5) do
			if	CheckAcceptQuest ( Player5[i]   , 423195 ) == true	then
				ScriptMessage( player5[i] , player5[i] , 0 , "[SC_423195_0]" ,  "0xFFFFFF00" ) 		-----附近有騷動。
				ScriptMessage( player5[i] , player5[i] , 1 , "[SC_423195_0]" ,  "0xFFFFFF00" ) 
			end
		end

	Local jill =    Lua_DW_CreateObj("flag" ,115358,780610,0)	---種出JILL
	DisableQuest( jill , true )
	Yell(jill,"[SC_423195_1]",3)
	DW_MoveToFlag(jill,780610 , 1,0 ,1)
	Local jillmonster =    Lua_DW_CreateObj("obj" ,103895,jill)	---刪除JILL並種出怪物JILL
	delobj(jill)
	SetPlot(jillmonster , "Dead","LuaS_423195_dead",100)						---jill怪物死後給予參加者buff,create drama jill
	WriteRoleValue( jillmonster,EM_RoleValue_Register+1, OwnerID() )
	SetAttack( jillmonster , TargetID())								--攻擊玩家
	CallPlot(jillmonster, "LuaS_423195_3" , OwnerID() )							--離開戰鬥後刪掉自己
end

function LuaS_423195_dead()									---jill怪物死後給予參加者演戲buff,種出JILL後以JILL為owner演戲
	Hide(OwnerID())
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423195 )	 == true	and
			GetDistance(OwnerID(),player) < 400	then
			AddBuff(player,506729,1,-1)
		end	
	end
	local jill = Lua_DW_CreateObj("obj",115362,OwnerID())   --fight後給jill假人
	WriteRoleValue( jill,EM_RoleValue_Register+1, ReadRoleValue(OwnerID(),EM_RoleValue_Register+1) )	
	DisableQuest( jill , true )
	CallPlot(jill, "LuaS_423195_2",player)	
	WriteRoleValue( ReadRoleValue( OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 2 )
	delobj(OwnerID())
	return true
end
function LuaS_423195_2(player)									----
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --JILL跪下

	local mo 
	local jill = OwnerID()						
	local Target = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115361 , 10000 , 0)	---search ball位置
	local NPC = SetSearchAllNPC(0)
	local mo2
	for i = 1 , NPC, 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == 115360 and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
			mo2 = ID
			break
		end
	end
	--local mo2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115360 , 10000 , 0)	---search mo位置	
									

	---SetDefIdleMotion(jill ,ruFUSION_MIME_IDLE_SIT)	--持續跪坐在地
	
	if GetDistance(Target,OwnerID()) < 150 then				----與觸發點超過150則摩瑞克從下一個任務點走來,否則從指定旗標走來

		mo = LuaS_MK_MoveToObj("flag",115357,OwnerID(),780610,2,15,70,1)				
	else
		mo = LuaS_MK_MoveToObj("obj",115357,OwnerID(),mo2,15,70,1)	
	end	
	sleep(20)
	WriteRoleValue(mo , EM_RoleValue_IsWalk, 0 )				---摩瑞克的下一次移動用跑的
	sleep(20)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)	   --JILL起來	
	AdjustFaceDir( OwnerID() ,mo, 0 )				---JILL面對摩瑞克

	Yell(mo,"[SC_423195_2]",3)			----還好嗎？
	sleep(30)
	Yell(mo,"[SC_423195_3]",3)			----妳的身體？和那些詭異士兵有關聯嗎？
	sleep(40)
	Yell(jill,"[SC_423195_4]",3)			----哼，滾遠一點，別以為我不知道你們在打的主意，別以為現在我占了下風，你們就能稱心如意的抓到我。
	sleep(10)
	CastSpell(jill,jill,495668)			----JILL放法術逃離
	SetIdleMotion( mo,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(15)
	Hide(jill)
	sleep(5)
	local x = ReadRoleValue ( jill, EM_RoleValue_X)
	local y = ReadRoleValue ( jill, EM_RoleValue_Y)
	local z = ReadRoleValue ( jill, EM_RoleValue_Z)

	Move(mo,x,y,z)					----摩瑞克跑到JILL原來的位置
	
	sleep(40)		
	AdjustFaceDir( mo ,jill, 90 )			----面對右邊
	sleep(10)
	AdjustFaceDir( mo ,mo2, 0 )			----面對下一個任務點的位置
	sleep(10)	
	SetIdleMotion( mo,ruFUSION_ACTORSTATE_NORMAL)

	AdjustFaceDir( mo ,player, 0 )			----面對其中一個玩家
	sleep(10)
	Yell(mo,"[SC_423195_5]",3)			----我先追過去，你待會兒跟上。
	sleep(40)



	x = ReadRoleValue ( mo2, EM_RoleValue_X)
	y = ReadRoleValue ( mo2, EM_RoleValue_Y)
	z = ReadRoleValue ( mo2, EM_RoleValue_Z)
	Move(mo,x,y,z)	
	sleep(20)

	local Player2 = SearchRangePlayer ( mo , 200 )			----附近有演戲BUFF的玩家給予旗標
	for i = 0 , table.getn(Player2) do
		if	CheckBuff(player2[i] , 506729) == true	and	CheckAcceptQuest ( Player2[i]   , 423195 )	 == true	then
			SetFlag(player2[i],543997,1)	--give mission flag
		end
	end
	delobj(mo)
	sleep(10)

		local Player4 = SetSearchAllPlayer ( 0 )			----刪除所有玩家的演戲BUFF
		for i = 1 , Player4 , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckBuff(	ID , 506729) == true	then
				CancelBuff( ID  , 506729  ) 	--
			end
		end


	WriteRoleValue( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 0 )	--讓NPC忙
	local ctrl = ks_resetObj( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1), nil )
	delobj(jill)
end

function LuaS_423195_3(Target)

	while true do
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == true then
			delobj(OwnerID())
		end
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	and 
			CheckID( OwnerID() ) == true				then  --檢查是否離開戰鬥
			Sleep( 20 )
		else
			if CheckID( OwnerID() ) == true	then
				sleep(5)	
				DelObj( OwnerID() )

			end 
			
			break
		end

	end
	WriteRoleValue( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 0 )	--讓NPC忙
end

--------------423196----------------------


function LuaS_115359()
	SetPlot(OwnerID() , "range","LuaS_423196_flag",100)	
end

function LuaS_423196_flag()

	if 	CheckAcceptQuest( OwnerID() , 423196 ) == true	and	----有接423196
		CheckFlag( OwnerID() , 543998) == false	then	----沒有flag
			ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_423196_0]" ,  "0xFFFFFF00" ) 		-----這附近出現了打鬥的痕跡。
			ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_423196_0]" ,  "0xFFFFFF00" ) 		
			SetFlag(OwnerID(),543998,1)	--給予任物旗標
	end 
	return true
end

		
function LuaS_423196_complete()					-----任務完成後摩瑞克站起來
	AddBuff(TargetID(),506731,1,100)	
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local mo = Lua_DW_CreateObj("obj",115365,OwnerID())   --mo假人
	DisableQuest( mo , true )	
	Hide(mo)
	sleep(20)
	Show(mo,Zone)
	AddBuff(TargetID(),506730,1,100)
	--say(mo,"I'm here")
	PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_END)	   
	sleep(20)
	delobj(mo)
	CancelBuff( TargetID()  , 506730  ) 	
	CancelBuff( TargetID()  , 506731  )
			
end


-----------423197-----------------
function LuaS_423197()				----問話
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423197 ) == true  and CheckFlag( OwnerID() , 543999) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423197_0]","LuaS_423197_0",0)	--這是什麼意思？
	end
end

function LuaS_423197_0()
	SetSpeakDetail(OwnerID(),"[SC_423197_1]")			---
	SetFlag(OwnerID(),543999,1)
end

----------423198------------------


function LuaS_115433()
	SetPlot(OwnerID() , "range","LuaS_115433_flag",50)	
end

function LuaS_115433_flag()

	if 	CheckAcceptQuest( OwnerID() , 423198 ) == true	and	----有接423198
		CheckFlag( OwnerID() , 544000) == false	then	----沒有flag
			ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_423198_5]" ,  "0xFFFFFF00" ) 		-----前方出現了詭異的足跡，夾雜了痛苦的哀鳴聲。
			ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_423198_5]" ,  "0xFFFFFF00" ) 		
	end 
	return true
end


function LuaS_115428()
	CallPlot(OwnerID(),"LuaS_Discowood_NowToHide")		----保持潛行
	CallPlot(OwnerID(),"LuaP_Sitting")			----一直坐著
	SetPlot(OwnerID(),"range","LuaS_115428_0",100)
end

function LuaS_115428_0()					----有接任務的被密語
	if  CheckAcceptQuest( OwnerID() , 423198 ) == true  then
		tell(OwnerID()  ,TargetID()  , "[SC_423198_0]")	
	end
end
function LuaS_423198()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423198 ) == true	and	CheckFlag(OwnerID(),544001) == false 	then
		if CheckFlag(OwnerID(),544000) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_1]","LuaS_423198_0",0)	--		怎麼了？
		end
		if CheckFlag(OwnerID(),544000) == true	and	CountBodyItem ( OwnerID(), 207291 ) == 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_7]","LuaS_423198_2",0)	--		沒看到？
		end		
		if CountBodyItem ( OwnerID(), 207291 ) > 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_3]","LuaS_423198_1",0)	--將包裹交到布列爾．德拉曼的手上。
		end
	end
end

function LuaS_423198_0()

		SetSpeakDetail(OwnerID(),"[SC_423198_2]")	---好疼……真的好疼。呼……真的好疼啊。幫幫我，到前方不遠處拿回一個紅色的包裹，呼……我的身體實在太痛了……沒辦法動。
		SetFlag(OwnerID(),544000,1)


end


function LuaS_423198_1()
	if CountBodyItem ( OwnerID(), 207291 ) > 0 then
		SetSpeakDetail(OwnerID(),"[SC_423198_4]")	---嗯……謝謝，謝謝你，可以幫我從裡頭拿出膏藥嗎？
		DelBodyItem(OwnerID(),207291,1)
		SetFlag(OwnerID(),544001,1)	
	else
		SetSpeakDetail(OwnerID(),"[SC_423198_6]")
	end
end

function LuaS_423198_2()

		SetSpeakDetail(OwnerID(),"[SC_423198_8]")	---前面不遠處。


end


function LuaS_115367()
	SetPlot(OwnerID(),"touch","LuaS_115367_1",30)
end

function LuaS_115367_1()
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID() , 207291 ) < 1 then
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --
		GiveBodyItem ( OwnerID(), 207291, 1 )
	sleep(10)

	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --
	
	end
	SetPlot(TargetID(),"touch","LuaS_115367_1",30)
end

--------------------423199------------------------------

function LuaS_423199_accept()
	SetFlag(TargetID(),544002,1)				----給予可看見水晶旗標
	local mo = Lua_DW_CreateObj("obj",115369,OwnerID())   --MO假人	
	tell(TargetID()  ,mo  , "[SC_423199_0]")		
	sleep(10)
	tell(TargetID()  ,mo  , "[SC_423199_1]")
	delobj(mo)
end

function LuaS_115371()
	SetPlot(OwnerID(),"touch","LuaS_115371_1",30)
end

function LuaS_115371_1()					---拿取水晶
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID() , 207288 ) < 1 then
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --
		GiveBodyItem ( OwnerID(), 207288, 1 )
	sleep(10)

	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --
	

	end
	SetPlot(TargetID(),"touch","LuaS_115371_1",30)
end


function LuaS_423199_complete()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	


	local bu = Lua_DW_CreateObj("obj",115368,OwnerID())   --bu假人
	DisableQuest( bu , true )	
	Hide(bu)	
	sleep(25)
	Show(bu,Zone)

	Playmotion(bu,ruFUSION_ACTORSTATE_SIT_END)	---bu站起來
	AddBuff( TargetID() ,506732,1,600)		---給予演戲BUFF,這之後玩家才看的見
	sleep(20)

	PlayMotion( bu  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --蹲下
	
	sleep(10)
	Local cry =    Lua_DW_CreateObj("flag" ,115429,780646,0)			---種出水晶
	DisableQuest( cry , true )
	sleep(20)
	
	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_2]" ,  "0xFFFFFF00" ) 		-----貝兒‧愛林頓所說的能把我身體恢復成原本模樣的東西就在這，我要找到它才行。
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_2]" ,  "0xFFFFFF00" ) 	
	
	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_3]" ,  "0xFFFFFF00" ) 		-----可是姐姐……那些狙擊我們的詭異士兵，就像是無止盡的出現在我們面前，我怕……
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_3]" ,  "0xFFFFFF00" ) 

	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_4]" ,  "0xFFFFFF00" ) 		-----怕什麼？我都已經是現在的這副鬼模樣了，我還害怕什麼？我恨不得殺光他們。
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_4]" ,  "0xFFFFFF00" ) 

	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_5]" ,  "0xFFFFFF00" ) 		-----又有聲音了！
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_5]" ,  "0xFFFFFF00" ) 

	sleep(30)

	Yell(bu,"[SC_423199_6]",3)				----奇怪，水晶到底記錄了什麼？我之前的紀錄呢？不會全部不見了吧？
	delobj(cry)
	sleep(10)

	PlayMotion( bu  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --bu站起來
 	sleep(20)
	CallPlot(bu,"LuaP_Sitting")					----bu坐回去
	sleep(20)	


	CancelBuff( TargetID()  , 506732  ) 	

	delobj(bu)
end