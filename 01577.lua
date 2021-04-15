--422818 村莊隱憂	所需編號： 伊蘭妲銘印206146	普羅米修113667	旗標 543411

function LuaS_206146_0()--使用物品前檢查	
	if	CheckAcceptQuest( OwnerID() , 422818 ) == true then
		if	CheckFlag( OwnerID() , 543411 ) == true	then
			if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113667	then
--				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
--				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_END)
--				sleep(10)
				PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_BUFF_END)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_0]" , 0 ) 	--結界的流動籠罩[113667]，把這項訊息告訴村裡的波伽利長者吧！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_0]" , 0 ) 
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--目標不正確
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
				return false
			end
		end

		local PORO =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113667 , 70 )
		if Type(PORO) == "number" and CheckID(PORO) == false then
			PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
			PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_BUFF_END)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_1]" , 0 ) 	--你必須更靠近[113667]一點。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_1]" , 0 ) 
			return false 
		end
		
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 113667	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end

		if	 (CountBodyItem( OwnerID(),206146) >0) and CheckFlag( OwnerID() , 543411 ) ==false	then
			return true
		end
	end


	if	CheckAcceptQuest( OwnerID() , 422820 ) == true  then
--判斷目標是否在戰鬥中
		if	HateListCount( TargetID())~=0	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_USECHECK_BATTLE_0]", 0 )
			return false
		end


		if	CountBodyItem( OwnerID() , 206148)>0	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_4]" , 0 ) 	--你已經取得[206148]，艾薇莎祭司正等你拿回去給她。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_4]" , 0 ) 
			return false
		end
		
		local INMI =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102755 , 70 )
		if 	Type(INMI) == "number" and CheckID(INMI) == false	 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 ) 	--你必須更靠近[102755]一點。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
			return false 
		end
	
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102755	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end		


		if	(CountBodyItem( OwnerID(),206146) >0) and   (CountBodyItem( OwnerID(),206148) <1) then
			return true
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
	return false 
end

--成功使用
function LuaS_206146_2()
	if CheckID( TargetID() ) == true and  CheckAcceptQuest( OwnerID() , 422818 ) == true  then
		PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
		PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_END)
		CastSpell( TargetID(), TargetID(), 494493)
		sleep(20)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_2]" , 0 ) 		--一個結界籠罩在普羅米修身上，伊蘭妲銘印對牠毫無反應。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_2]" , 0 ) 
		SetFlag( OwnerID() , 543411 , 1 )						--給旗標
	end
	
	if CheckID( TargetID() ) == true   and CheckAcceptQuest( OwnerID() , 422820 ) == true  then
--成功使用後使其成為無敵狀態
		SetFightMode ( TargetID(),0,1,0,0 )

		SetFlag( OwnerID() , 543412 , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_1]" , 0 ) 			--一道光束降臨在印米克提身上，伊蘭妲銘印在牠周圍產生出一顆
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_1]" , 0 ) 
		BeginPlot( TargetID() , "LuaS_206146_3" , 0 )
		BeginPlot( OwnerID(), "LuaS_206146_4" , 0 )
	end
end

function LuaS_206146_3()
		CastSpell( OwnerID(), OwnerID(), 494393)
		local BL = Lua_DW_CreateObj("obj" ,113910,OwnerID(),0,1)				--施法 浮出闇核的感覺
		WriteRoleValue( BL , EM_RoleValue_LiveTime , 2 )
		Lua_ObjDontTouch( BL) 
		AddToPartition( BL , 0 )
		sleep(30)
--回復狀態
		SetFightMode( OwnerID(),1,1,0,1 )
end

function LuaS_206146_4()
		sleep(30)
		if	(CountBodyItem( OwnerID(),206148) <1)	then 
			GiveBodyItem( OwnerID(), 206148 , 1 )					--給物品
		end
end

--洞裡的隱形球：
function LuaS_113674_0()
	SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
end

function LuaI_113674_1()
	if 	CheckAcceptQuest( OwnerID() , 422818 ) == true	then
		ScriptMessage( OwnerID()  , OwnerID() , 1 , "[SC_113674_0]" , 0 ) 		--流動四周的光芒與蜘蛛洞氣氛差異甚大，這看起來是個最近才被加諸在普羅米修身上
		ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_113674_0]" , 0 ) 
		CastSpell( TargetID(), TargetID(), 494393)			--普羅米修結界
		--SetPlot( TargetID() , "range" , "" , 200 )
		--BeginPlot( TargetID(), "LuaI_113674_2", 0 )
	end
end

function LuaI_113674_2()
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_113674_0]" , 0 ) 		--流動四周的光芒與蜘蛛洞氣氛差異甚大，這看起來是個最近才被加諸在普羅米修身上
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_113674_0]" , 0 ) 
	while true do
		sleep(10)
		CastSpell( OwnerID(), OwnerID(), 494291 )	--洞內氣氛
		if 	CheckID( TargetID()) == false		then			--TargetID是玩家
			SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
			break
		end

		if 	CheckFlag(TargetID(),543413) == true	then
			BeginPlot( OwnerID(), "LuaI_113674_3", 0 )
	--		SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
	--		break
		end
	end
end

function LuaI_113674_3()
	sleep(50)
	BeginPlot( OwnerID(), "LuaI_113674_1", 0 )
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422819 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------艾薇莎的下落
--422819 艾薇莎的下落	所需編號：雙修洞艾薇莎113669 旗子：780471	 旗標：543415找到艾薇莎 543415告知普羅米修 543428詢問艾薇莎的疲累貌 543427安德薩斯

function LuaS_422819_1()
	SetSpeakDetail(OwnerID(),"[SC_422819_1]")				--對，艾薇莎祭司請我幫忙把你送過去，但是...我看看...哎！這小東西要怎麼用、這個...嗯...								
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_2]","LuaS_422819_2",0) --...請問您研究好了嗎？
		else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_2]","LuaS_422819_3",0)	--...請問您研究好了嗎？
	end
end


function LuaS_422819_2()
	CloseSpeak( OwnerID())
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
		say(TargetID(),"[SC_422819_3]")					--別催～這不正要傳送你了～這是我第一次用這種傳送石！
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
		BeginPlot( TargetID(), "LuaS_422819_4", 0 )	
	end
end
	
function LuaS_422819_3()
	SetSpeakDetail(OwnerID(),"[SC_422819_4]")				--還沒、還沒，我怕把你送進大塊頭的地盤裡～
  									--你要給我一點時間找找艾薇莎祭司的位置，意念最強的地方就能找到她...什麼意思...
end


function LuaS_113909_0()	--特效球
	AddBuff( OwnerID()  , 500899, 0 , -1 )		--洞內氣氛		--TargetID特效球
--	if 	CheckAcceptQuest( OwnerID() , 422819 ) == true	then
--	SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 200 )
--	end
end


function LuaI_113909_1()
		SetPlot( TargetID() , "range" , "" , 0 )
		BeginPlot( TargetID(), "LuaI_113909_2", 0 )
end


function LuaI_113909_2()
	while true do
		sleep(10)
		AddBuff( OwnerID()  , 500899, 1 , -1 )		--洞內氣氛		--OwnerID特效球
		if 	CheckID( TargetID()) == false		then			--TargetID是玩家
			SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 100 )
			CancelBuff( OwnerID()  , 500899)  
			break
		end
		if 	CheckFlag(TargetID(),543413) == true	then	
			SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 200 )
			CancelBuff( OwnerID()  , 500899)  
			break
		end
	end
end


function LuaS_422819_4()	
	WriteRoleValue ( OwnerID()  , EM_RoleValue_PID, TargetID())			--owner是長者波伽利
	if CheckID( TargetID() ) == true then				
		SetPosByFlag( TargetID()  , 780471 , 1 )						--傳到洞穴
	end
	local TI = Lua_DW_CreateObj("flag" ,113672,780471,2,1)				--產生緹亞娜
	SetDefIdleMotion( TI, ruFUSION_MIME_CROUCH_BEGIN)
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	MoveToFlagEnabled(TI , false )	
	DisableQuest(TI , true )
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID()  , 504766, 1 , -1 )						--給玩家BUFF 
		AddBuff( TargetID()  , 503977 , 1 , 60 )						--玩家被定在地上
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422819_5]" , 0 ) 			--波伽利長者把你傳送到...一個奇怪洞穴內？
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422819_5]" , 0 ) 
	end
	--BeginPlot( OwnerID() , "LuaS_422819_6" , 0 )					--放入檢查
	local ANDD =  Lua_DW_CreateObj( "flag"  ,113673,780471,7,1)			
	for i = 1 , 20 , 1 do
		if CheckID(TargetID() ) == false then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
			Delobj(ANDD)
			Delobj(TI)
			return
		end
		if GetDistance(TargetID() ,ANDD ) < 100 then
 			break
		end
		sleep( 10 )
	end
	PlayMotion(  ANDD ,ruFUSION_ACTORSTATE_DEAD)	
	say(TI,"[SC_422819_6]")							--安德薩斯，終於～你是我的了～
	sleep(20)
	say(TI,"[SC_422819_7]")							--這副身軀是我幫你用符文補全的唷！
	sleep(20)
	say(TI,"[SC_422819_8]")							--別忘記救了你的人是我，緹亞娜～
	sleep(20)
	say(TI,"[SC_422819_9]")							--你的眼裡從此以後都只能有我～
	sleep(20)
	DelObj(TI)	
	DelObj(ANDD )
	sleep(30)
	local AN = Lua_DW_CreateObj("flag" ,113673,780471,3,1)				--產生安德薩斯		
	MoveToFlagEnabled(AN , false )	
	DisableQuest(AN , true )
	WriteRoleValue( TargetID() ,EM_RoleValue_IsWalk , 1 )				--用走的
	local TIA = Lua_DW_CreateObj("flag" ,113672,780471,4,1)				--產生緹亞娜
	AdjustFaceDir( AN, TIA, 180 ) 						--安德薩斯面向左邊<背對緹亞娜><玩家看到側臉>
	MoveToFlagEnabled(TIA , false )	
	DisableQuest(TIA , true )
	AdjustFaceDir( TIA , AN , 0 ) 							--緹亞娜在他右邊<也是側面
	SetDefIdleMotion( TIA, ruFUSION_MIME_EMOTE_SPEAK)
	say(TIA,"[SC_422819_10]")							--她只是比我早一步搶到你的靈魂！
	sleep(20)
	say(TIA,"[SC_422819_11]")							--為什麼你的眼中就只有她！她到底為你做過什麼？
	sleep(20)
	say(AN,"[SC_422819_12]")							--......
	sleep(20)
	say(TIA,"[SC_422819_13]")							--你已經是個魔族了！我們一起對卡薩姆復仇過，人王軍不會接受你…
	sleep(20)
	PlayMotion(  AN ,ruFUSION_ACTORSTATE_ATTACK_2H)			--安德薩斯舉劍插向洞壁
	sleep(20)
	CastSpell( AN, AN, 494290 )							--產生特效裂地之類
	--AddBuff( AN  , 502724, 1 , 20 )
	SetDefIdleMotion( TIA, ruFUSION_MIME_NONE)
	sleep(20)
	BeginPlot( AN , "LuaS_422819_5" , 0 )
	sleep(15)
	AdjustFaceDir( TIA , AN , 0 )
	--LuaFunc_MoveToFlag( TIA ,780471,8,0)	
	PlayMotion(  TIA ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	say(TIA,"[SC_422819_14]")						--安德薩斯...
	PlayMotion(  TIA ,ruFUSION_ACTORSTATE_SIT_BEGIN)			--<緹亞娜跪坐在地>
	sleep(30)
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543413  , 1 )
		SetPosByFlag( TargetID()  , 780471 , 6 )					--玩家被傳出洞穴外 給予<找到艾薇莎543415旗標>
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	if	CheckID( TargetID() ) == true and CheckBuff( TargetID() , 504766 ) == true	then
		CancelBuff( TargetID() , 504766 )  
	end

	if	CheckID( TargetID() ) == true and CheckBuff( TargetID() , 503977 ) == true	then
		CancelBuff( TargetID()  , 503977 )  
	end
	DelObj(TIA)
end

function LuaS_422819_5()
	LuaFunc_MoveToFlag( OwnerID(),780471,5,0)	--安走向玩家方向，穿越、消失>
	DelObj(OwnerID())
end


--檢查：
function LuaS_422819_6()			--秒數配合劇情調整
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	for i = 1, 45 , 1 do
		if  CheckID( player ) == false	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
			break
		end
		sleep(10)
	end
end

--點擊雙修洞的艾薇莎：
function LuaS_113669_0()

	LoadQuestOption( OwnerID() )

	if CheckAcceptQuest( OwnerID() ,422819 ) == true and CheckFlag(OwnerID(),543413) == true	then
		if	CheckFlag(OwnerID(),543428) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_0]","LuaS_113669_1",0) --妳看起來似乎很疲累？
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_1]","LuaS_113669_2",0) --剛剛...我好像進入一個幻境...
	end
	
	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == false and ReadRoleValue(TargetID() ,EM_RoleValue_Register ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_1]","LuaS_422823_2",0)		--放心交給我，妳專心融合吧！
	end

	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_11]","LuaS_422823_6",0)	--艾薇莎...
	end

	if CheckAcceptQuest( OwnerID() ,422824 ) == true and CheckFlag(OwnerID(),543417) == false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_0]","LuaS_422824_1",0)	--我願意去檢測水元素王的狀況。
	end
end

function LuaS_113669_1()
	SetSpeakDetail(OwnerID(),"[SC_113669_2]")	--嗯…不要緊，用了太多淨化之力還有追蹤那名女子，耗費太多精神才稍微休息一下。她的身影太模糊…就像是被某種東西圍繞…
	SetFlag( OwnerID() , 543428  , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_3]","LuaS_113669_2",0)	--詢問剛剛不知道是幻境還是真實的景象。
end

function LuaS_113669_2()
	SetSpeakDetail(OwnerID(),"[SC_113669_4]")				--(艾薇莎略顯疲憊的神態竄出一抹光芒。)幻境？你看見什麼？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_5]","LuaS_113669_3",0)	--有兩個人...從對話聽起來名字是緹亞娜的和安德薩斯。
end

function LuaS_113669_3()
	SetSpeakDetail(OwnerID(),"[SC_113669_6]")	--是嗎？這裡的氣息不純淨，你看到的或許是事實也可能是虛構的幻影，不用放在心上。
	if	CheckFlag(OwnerID(),543428) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_7]","LuaS_113669_4",0)  --詢問她為什麼看起來似乎很疲累。
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_8]","LuaS_113669_5",0)	--告訴她普羅米修被結界包圍的事。
end

function LuaS_113669_4()
	SetSpeakDetail(OwnerID(),"[SC_113669_2]")	--嗯…不要緊，用了太多淨化之力還有追蹤那名女子，耗費太多精神才稍微休息一下，她的身影太模糊…就像是被某種東西圍繞…
	SetFlag( OwnerID() , 543428  , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_8]","LuaS_113669_5",0)	--告訴她普羅米修被結界包圍的事。
end

function LuaS_113669_5()
	SetSpeakDetail(OwnerID(),"[SC_113669_9]")	--結界、光芒，我明白了，是那名女子早我們一步下手。
	SetFlag( OwnerID() , 543415  , 1 )
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422820
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------反噬追蹤
--422820反噬追蹤	所需編號：印米克提113668 旗標：543412使用伊蘭妲銘印  543414潑灑淨化瓶液體 印米克提闇核206148

function LuaS_206149_0()	
--判斷目標是否否在戰鬥中
	if	HateListCount( TargetID())~=0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_USECHECK_BATTLE_0]", 0 )
		return false
	end


	if	CheckAcceptQuest( OwnerID() , 422820 ) == true	then
		if CheckFlag( OwnerID() , 543414 ) == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_2]" , 0 ) --淨化瓶中的液體成功潑灑到印米克提身上了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_2]" , 0 ) 
			return false
		end
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102755	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--目標不正確
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end

		local INMI =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,102755, 70 )	
		if Type(INMI) == "number" and CheckID(INMI) == false	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 ) --你必須更靠近[102755]一點。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
			return false 
		end
	
	
		if	(CountBodyItem( OwnerID(),206149) >0) and CheckFlag( OwnerID() , 543414 ) ==false	then
			UseItemDestroy( OwnerID() , 206149 )
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
			return false 
		end
	end

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
			return false 
end

--成功使用淨化瓶
function LuaS_206149_1()
	if CheckID( TargetID() ) == true then
		CastSpell( TargetID(), TargetID(), 494394)--印米克提身上出現施法特效
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_3]" , 0 ) 		--你將淨化瓶中的液體潑到[113668]身上。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_3]" , 0 ) 
		SetFlag( OwnerID() , 543414 , 1 )					--給旗標
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422821 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------引誘
--422821 引誘	所需編號： 維爾德113666	諾芙113633

function LuaS_113666()

	LoadQuestOption( OwnerID() )

	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == false and CheckFlag(OwnerID(),543423) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_0]","LuaS_113666_1",0)		 --你是維爾德？
	end
	
	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_4]","LuaS_113666_3",0) 	--我現在要做什麼？
	end

	if CheckAcceptQuest( OwnerID() ,422822 ) == true and  CheckFlag(OwnerID(),543402) == false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422822_0]","LuaS_422822_1",0) --應該再等一下她就會出來了。
	end

end

function LuaS_113666_1()
	SetSpeakDetail(OwnerID(),"[SC_422821_1]") 						--啊！你是跟美麗的艾薇莎祭司一起追捕那個可怕女人的…[$playername]？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_2]","LuaS_113666_2",0)			 --躲藏…她跟我說過，她是在裡面養傷…
end

function LuaS_113666_2()
	SetSpeakDetail(OwnerID(),"[SC_422821_3]")
	SetFlag( OwnerID() , 543422 , 1 )
end

function LuaS_113666_3()
	SetSpeakDetail(OwnerID(),"[SC_422821_5]")						--進去英雄之墓把那個叫「諾芙」的可怕女人引誘出來，她見過你，妳成功的機率比我高。							
end

--掛在諾芙身上
--function LuaS_113633()	--放在諾芙113633的SCRIPT內
--	LoadQuestOption( OwnerID() )
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false  and CheckFlag(OwnerID(),543433) == false	then
--		if	CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_6]","LuaS_422821_1",0) 	--妳之前說的淨化、治療那些事情真的都是騙我的？
--		SetFlag( OwnerID() , 543433 , 1 )
--		end
--	end
	
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543434) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_7]","LuaS_422821_2",0) 	--我曾經相信過妳…沒想到妳是這種人…
--		SetFlag( OwnerID() , 543434 , 1 )
--		end
--	end

--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543435) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_8]","LuaS_422821_3",0)	 	--我看到英雄之墓外有一些…妳曾說過遭到血污污染的焦油獸。
--		SetFlag( OwnerID() , 543435 , 1 )
--		end
--	end
	
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543436) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_9]","LuaS_422821_4",0)		 --妳在我眼前淨化過焦油獸，但牠們大部分是逃離或消失…現在英雄之墓外又有一批生物…
--		SetFlag( OwnerID() , 543436 , 1 )
--		end
--	end
--end

function LuaS_422821_1()		
	SetSpeakDetail(OwnerID(),"[SC_422821_10]")						--怎麼了？鎮定一點[$playername]，是發生了什麼事讓你有這些質疑？
	SetFlag( OwnerID() , 543433 , 1 )	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_11]","LuaS_422821_5",0)		--…不，沒什麼。(諾芙神使，我還是願意相信妳。)現在英雄之墓外頭有許多變異的焦油獸，牠們需要妳的治療。
end

function LuaS_422821_2()
	SetSpeakDetail(OwnerID(),"[SC_422821_12]")						--發生了什麼事？[$playername]？
	SetFlag( OwnerID() , 543434 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_13]","LuaS_422821_6",0)		--那就把英雄之墓外受到污染的生物回復正常吧。
end

function LuaS_422821_3()
	SetSpeakDetail(OwnerID(),"[SC_422821_14]")						--牠們怎麼了嗎？莫非邪惡的能量又再度侵襲牠們？
	SetFlag( OwnerID() , 543435 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_15]","LuaS_422821_7",0)		--不清楚，要請妳親自走一趟。(證明給我看，妳沒有編織謊言騙我…)
end

function LuaS_422821_4()
	SetSpeakDetail(OwnerID(),"[SC_422821_16]")						--生物？[$playername]先別過於緊張，首先，告訴我是什麼樣的生物？
	SetFlag( OwnerID() , 543436 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_17]","LuaS_422821_8",0)		--發生異變…與妳先前帶我看的生物一樣...(或許艾薇莎說的沒錯，諾芙只是在演戲，不是真心要淨化。)
end


function LuaS_422821_5()
	SetSpeakDetail(OwnerID(),"[SC_422821_18]")						--[$playername]，你擁有良善、溫和的特質。關懷萬物的本質，將領導你走入璀璨的光明裡。
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_6()
	SetSpeakDetail(OwnerID(),"[SC_422821_19]")						--[$playername]，我會盡我所能的讓牠們恢復原來的樣貌，請別擔心、憂慮。
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_7()
	SetSpeakDetail(OwnerID(),"[SC_422821_20]")						--我想也許是淨化石，不夠穩定……凝聚著我的精神與力量的淨化石，發生了異變？這是否也顯示著，我的力量持續削弱？
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_8()
	SetSpeakDetail(OwnerID(),"[SC_422821_21]")						--我明白了，也許是淨化的過程，發生了一些異變，必須盡快處理才可以。[$playername]，不必憂心，我會盡我所能，讓牠們的心靈恢復寧靜。
	SetFlag( OwnerID() , 543423 , 1 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422822 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------異變的元兇
--422822 異變的元兇 所需編號：旗子780456 1-3	780457	1-6	諾芙113679	旗標543402觀察		780457	--女王尤米多葛演1分鐘左右(先針對單人，細修再考慮隊伍)

function LuaS_422822_1()
	CloseSpeak( OwnerID())
	if CheckAcceptQuest( OwnerID() ,422822 ) == true and  CheckFlag(OwnerID(),543402) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register )==0	then
		WriteRoleValue(TargetID() ,EM_RoleValue_Register , 1 )
		BeginPlot( TargetID(), "LuaS_422822_2" , 0 )
	end

end

function LuaS_422822_2()
	DisableQuest( OwnerID(),  true)							--關對話	TargetID是維爾德
	sleep(10)
	Yell( OwnerID() , "[SC_422822_1]" , 3 )						--嗯…還沒來…
	sleep(20)
	Yell( OwnerID() , "[SC_422822_2]" , 3 )						--你真的有跟她說清楚嗎？
	sleep(20)
	Yell( OwnerID() , "[SC_422822_3]" , 3 )						--啊！來了！來了～
	sleep(10)
	Yell( OwnerID() , "[SC_422822_4]" , 3 )						--快點！別亂跑～來我身邊躲好！<把玩家傳送到身旁>
	sleep(20)
	local Player = SearchRangePlayer(OwnerID() , 200)
	if	Player[0]==-1	then
		WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
		DisableQuest( OwnerID(),  false)
		return
	end
	for i=0,table.getn(Player) do
		if	CheckID(Player[i]) == true and CheckAcceptQuest( Player[i], 422822 ) == true	then
			SetPosByFlag( Player[i]  , 780456 , 1 )				--傳送玩家	
			AddBuff(  Player[i], 504766 , 1 , -1 )				--給玩家BUFF <說明文寫維爾德叮嚀你小心躲好，你發現他似乎緊張的扣住你>
			AddBuff(  Player[i] ,503977 , 1 , 60 )				--給玩家BUFF 乖乖看戲
		end
	end

	local MOM = {}
		for i=1,3,1 do
		MOM[i] = CreateObjByFlag( 113676 , 780457 , i , 0 ) --3隻焦油獸
		AddToPartition( MOM[i] , 0 )
		SetFightMode( MOM[i] , 0 , 1 , 1 , 0)
	end

	sleep(20)
	local NO = Lua_DW_CreateObj("flag" ,113741,780456,2,1)
	DisableQuest( NO ,  true)
	MoveToFlagEnabled( NO, false )
	local AA  = Lua_DW_CreateObj("flag" ,113734,780456,3,1)
	DisableQuest( AA  ,  true)
	MoveToFlagEnabled( AA  , false )
	BeginPlot(AA  ,"LuaS_422822_3",0)
	LuaFunc_MoveToFlag( NO,780456,4,0)
	sleep(10)	
	AdjustFaceDir( NO,TargetID()  , 0 )					--諾芙左右望	
	sleep(10)	
	AdjustFaceDir( NO,AA  , 0 )
	tell(TargetID()  ,OwnerID(),"[SC_422822_5]")				--看！她在張望～八成是想確認有沒有別人在～
	sleep(20)	
	AdjustFaceDir( NO,MOM[2], 0 )
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_EMOTE_POINT)		--諾芙指點的動作
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_LOOP)	
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_BEGIN)	
	sleep(30)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_END)			--諾芙施法發出淨化之光
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
	CastSpell( MOM[3] ,NO  , 494494)					
	CastSpell( MOM[2] ,NO  , 494494)
	CastSpell( MOM[1] ,NO  , 494494)

	sleep(10)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_BUFF_SP01)

	LuaFunc_MoveToFlag( MOM[1] ,780457 ,4,0)	
	CastSpell( MOM[2] ,MOM[2]  , 491153)
	LuaFunc_MoveToFlag( MOM[1] ,780457 ,6,0)
	--LuaFunc_MoveToFlag( NO,780457 ,5,0)
	--CastSpell( MOM[3] ,MOM[3]  , 491153)
	LuaFunc_MoveToFlag( MOM[3]  ,780457 ,5,0)
	sleep(20)
	tell(TargetID() ,OwnerID(),"[SC_422822_6]")				--看到沒人在，她動手了！
	sleep(20)	
	--AddBuff(MOM[1] , 500654 , 10 , -1 ) 			
	--AddBuff(MOM[2] , 500654 , 10 , -1 ) 					
	--AddBuff(MOM[3] , 502501 , 10 , -1 ) 	

	tell(TargetID() ,OwnerID(),"[SC_422822_7]")				--…你看到了嗎？血污獸突然開始暴走～
	DelObj( MOM[1])
	DelObj( MOM[2])
	DelObj( MOM[3])
	sleep(20)	



	local WOW = {}
		for i=1,3,1 do
		WOW[i] = CreateObjByFlag( 113675 , 780457 , i , 0 ) --3隻蠑螈
		AddToPartition( WOW[i] , 0 )
		SetFightMode( WOW[i] , 0 , 1 , 1 , 0)
	end


	SetDefIdleMotion(  WOW[1],ruFUSION_MIME_CAST_BEGIN)
	SetDefIdleMotion(  WOW[2],ruFUSION_MIME_CAST_BEGIN)
	SetDefIdleMotion(  WOW[3],ruFUSION_MIME_CAST_BEGIN)
	sleep(10)
	SetDefIdleMotion(  WOW[1], ruFUSION_MIME_CAST_END)
	SetDefIdleMotion(  WOW[2], ruFUSION_MIME_CAST_END)
	SetDefIdleMotion(  WOW[3], ruFUSION_MIME_CAST_END)
	sleep(10)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_END)			--諾芙施法發出淨化之光
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( WOW[1], NO ,  494495)
	CastSpell( WOW[2], NO ,  494495)
	CastSpell( WOW[3], NO ,  494495)				--施法
	AddBuff( WOW[1] , 503974 , 1 , 60 )
	AddBuff( WOW[2] , 503974 , 1 , 60 )
	AddBuff( WOW[3] , 503974 , 1 , 60 )
	--CastSpell( WOW[2], WOW[2],  492667)
	LuaFunc_MoveToFlag( WOW[1] ,780457 ,4,0)
	LuaFunc_MoveToFlag( WOW[3] ,780457 ,5,0)
	sleep(20)
	SetDefIdleMotion( WOW[1], ruFUSION_MIME_DEATH_LOOP)		--給蠑螈死掉動
	SetDefIdleMotion( WOW[2], ruFUSION_MIME_DEATH_LOOP)
	SetDefIdleMotion( WOW[3], ruFUSION_MIME_DEATH_LOOP)
	sleep(10)	
	LuaFunc_MoveToFlag( NO,780456,6,0)	
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)		--諾芙蹲下察看
	sleep(20)
	tell(TargetID() ,OwnerID(),"[SC_422822_8]")				--蠑螈死掉了…她竟然殺了蠑螈…
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(20)
	DelObj( WOW[1])
	DelObj( WOW[2])
	DelObj( WOW[3])
	LuaFunc_MoveToFlag( NO,780456,2,0)	
	DelObj (NO)	
	sleep(10)	
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)						
	tell(TargetID() ,OwnerID(),"[SC_422822_9]")				--可惡！還若無其事走回去！旁邊那個幫她的人到底是誰？又是被騙的嗎？
	Player = SearchRangePlayer(OwnerID() , 200)
	if	Player[0]==-1	then
		WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
		DisableQuest( OwnerID(),  false)
		return
	end
	for i=0,table.getn(Player)-1 do
			--	say(Player ,"77777")
			--	say(Player[i],"88888")			
		if	CheckID(Player[i]) == true and CheckAcceptQuest( Player[i], 422822 ) == true	then  		
			SetFlag(Player[i], 543402 , 1)
			AdjustFaceDir( OwnerID()  ,Player[i], 0 )
			tell(Player[i],OwnerID(),"[SC_422822_10]")	--快去跟艾薇莎祭司說，可怕女人又動手了！
			DisableQuest( OwnerID(),  false)
		end
		if	CheckID(Player[i]) == true and CheckBuff( Player[i] , 504766 ) == true then
			CancelBuff( Player[i] , 504766 )  
		end

		if	CheckID(Player[i]) == true and CheckBuff( Player[i] , 503977 ) == true then
			CancelBuff( Player[i] , 503977 )  
		end
	end
	WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
end

function LuaS_422822_3()
	LuaFunc_MoveToFlag( OwnerID(),780456,5,0)
	sleep(50)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)			--配合劇情做動作
	sleep(180)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	LuaFunc_MoveToFlag( OwnerID(),780456,3,0)	
	DelObj (OwnerID())
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422823 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------保護艾薇莎
--422823 保護艾薇莎	所需編號：旗子780458 1-	旗標543416保護艾薇莎  543437擊退	襲擊者NPC 102795

function LuaS_422823_2()
	CloseSpeak( OwnerID() )						--OwnerID 啊哈TargetID艾薇莎				
	--say(OwnerID(),"447788" )		
	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == false and ReadRoleValue(TargetID() ,EM_RoleValue_Register ) == 0 then
		BeginPlot(TargetID(),"LuaS_422823_9",0)
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
	end
end

function LuaS_422823_9()		
	DisableQuest( OwnerID(),  true)					--TargetID是玩家 
	say(OwnerID(),"[SC_422823_3]")					--沒問題～ OwnerID緹亞娜
	Hide(OwnerID())									--最後要讓她現出來
	local IV = Lua_DW_CreateObj("flag" ,102847,780458,1 ) 			--SNPC艾薇莎
	DisableQuest( IV , true)
	WriteRoleValue ( IV  , EM_RoleValue_PID, OwnerID())
	MoveToFlagEnabled(IV, false )
	LuaFunc_MoveToFlag( IV ,780458,2,0)					--艾薇莎走向做傀儡的器具旁	
	PlayMotion( IV , ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(50)	
	PlayMotion( IV , ruFUSION_ACTORSTATE_CRAFTING_END)
	local FOE = Lua_DW_CreateObj("flag" ,102795,780458,3 ) 			--襲擊者NPC出現<中途使用水系法術--請夜倉設>--艾薇莎要比FOE弱
	SetAttack(FOE ,IV)
	--BeginPlot(OwnerID(),"LuaS_422823_10",0)
	WriteRoleValue ( FOE  , EM_RoleValue_PID, IV)
	WriteRoleValue ( FOE , EM_RoleValue_Register, 0 )
	BeginPlot(IV, "LuaS_Discowood_CheckPeace" , 0 )
	SetPlot(FOE,"dead","LuaS_422823_4",0 )
	BeginPlot(FOE,"LuaS_422823_5",0)
	local Speak = 0

	while true do
		if Speak == 0 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_4]")						--敵人來了！
		end
		if Speak == 2 and CheckID(IV) == true and CheckID(FOE) == true then
			say(FOE,"[SC_422823_5]")						--襲擊者：別再誆騙無辜的人！緹亞娜！
		end
		if Speak == 4 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_6]")						--艾薇莎：你在胡說什麼？我的名字是艾薇莎。
		end
		if Speak == 6 and CheckID(IV) == true and CheckID(FOE) == true then
			say(FOE,"[SC_422823_7]")						--襲擊者：那些生物是妳故意安排的吧？把牠們變成只要使用淨化力量就會死亡，諾芙大人因為這樣傷心自責～
		end
		if Speak == 8 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_8]")						--她殘酷殺生不只一人親眼看見，你才是被她的演技矇騙了。
		end
		sleep(10)
		if Speak < 10 then
			Speak = Speak + 1
		end
		if CheckID(IV)==false then					--如果SNPC不在
			if CheckID( FOE ) == true and ReadRoleValue( FOE , EM_RoleValue_OrgID ) == 102795 then
				DelObj (FOE)					--刪除襲擊者
			end
			Show(OwnerID(), 0)				--秀出原本艾薇莎
			break
		end
	end
	WriteRoleValue( OwnerID(), EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID() , false )
end
		
function LuaS_422823_4()	--怪的死亡劇情
	local IV =ReadRoleValue( OwnerID() , EM_RoleValue_PID )		--TargetID 是IV
	local TI =ReadRoleValue( IV , EM_RoleValue_PID )
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	CheckAcceptQuest( Player ,422823 )==true	then	
			--	say(Player,"45" )
				setFlag( Player, 543437 , 1 )
			end
	DelObj (IV)
	Show(TI , 0)
	end
	return true
end
	
function LuaS_422823_5()	--檢查---襲擊者血量低於一半時SAY：
	while 1 do
		if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)< 0.5 then 
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register )  == 0 then	
			say(OwnerID(),"[SC_422823_9]")				--冒險者！她對你說過實話嗎？你真的知道她計畫要做的事？
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register, 1 )	
			end
			sleep(30)
			if	ReadRoleValue( OwnerID() , EM_RoleValue_Register )  == 1 then
			say(OwnerID(),"[SC_422823_10]")				--認清真正的敵人吧！
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register, 2 )
			end
		end	
	sleep(10)
	end				
end		
		
function LuaS_422823_6()
	SetSpeakDetail(OwnerID(),"[SC_422823_12]")					--諾芙派來的襲擊者又想用謊言混淆真相，故意說些挑撥離間的話分化我們，你不會真的相信他說的那些吧？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_13]","LuaS_422823_7",0)	--我相信妳，她們不應該用這種卑鄙手段。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_14]","LuaS_422823_8",0)	--艾薇莎…妳…是不是真的有事瞞著我？
end

function LuaS_422823_7()
	--PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	SetSpeakDetail(OwnerID(),"[SC_422823_15]")				--是啊～不會讓她得意太久，只差最後幾步就能完成，到時候肯定逼她露出猙獰的醜陋面孔…
	SetFlag( OwnerID() , 543416 , 1 )					--給旗標
end
	
function LuaS_422823_8()
	SetSpeakDetail(OwnerID(),"[SC_422823_16]")				--所以…儘管我們相處這麼久一段時間，你還是選擇相信諾芙？…到最後，我竟然還是每次都輸給她…
	SetFlag( OwnerID() , 543416 , 1 )					--給旗標
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422825 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------真相
--422825 真相	<考慮加動作>所需編號：	旗子780460	旗標：543418	543428諾芙現身

function LuaS_422825()	--水元素前的艾薇莎
	DisableQuest( OwnerID() , true)
	SetPlot( OwnerID() , "touch" ,"LuaFunc_Obj_BUSY" , 40 )
	SetFlag( TargetID() , 543418 , 0 )
	SetPosByFlag( TargetID()  , 780460 , 1 )									--傳送玩家到「某個地方」
	local TI  = Lua_DW_CreateObj("flag" ,113671,780460,2,1)
	WriteRoleValue( TI  , EM_RoleValue_PID , TargetID() )
	DisableQuest( TI,  true)
	AddBuff( TargetID()  , 505009 , 1 , 60)										--給玩家BUFF 
	AddBuff( TargetID()  , 503977 , 1 , 60 )										--玩家被定在地上

	 BeginPlot( TI   , "LuaS_422825_2" , 0 )	--放入檢查
									
	AddBuff( TI  , 505074, 1 , 60 )									--艾薇莎身上有暗色氣息籠罩
	SetDefIdleMotion( TI, ruFUSION_MIME_EMOTE_SPEAK)
	for i = 1 , 20 , 1 do
		if CheckID( TargetID() ) == false then
			Delobj(TI)
			SetPlot( OwnerID() , "touch" ,"" , 0 )
			DisableQuest( OwnerID() , false)
			return
		end
		if GetDistance( TargetID() , TI ) < 150 then
			break
		end
		sleep(10)
	end
	sleep(50)
	say(TI  ,"[SC_422825_0]")		--蘊含邪惡波動的血液…黑水王素王能量…心臟…木雕娃娃…
	sleep(30)
	say(TI  ,"[SC_422825_1]")		--再把印米克提闇核存進我想要的記憶…現在，只剩下你的靈魂碎片…
	sleep(30)
	say(TI  ,"[SC_422825_2]")		--很久、很久不曾有這種即將手到擒來的甜美戰慄，就像是我當初要擄獲到安德薩斯的感覺～
	sleep(20)
	SetDefIdleMotion( TI, ruFUSION_MIME_NONE)
	sleep(10)
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	say(TI  ,"[SC_422825_3]")		--就快了，擁抱他的滋味，瞧！真美～你的靈魂，和水元素王戰鬥後變得更加璀璨～
	sleep(20)
	say(TI  ,"[SC_422825_4]")		--你很優秀哪～除卻容易被我欺騙的部分，再艱鉅的事情你都能辦妥，可惜…我心中的完美只有他，安德薩斯。
	sleep(30)
	say(TI  ,"[SC_422825_5]")		--幾千年前我救不了他，至少我可以做出一個像他一樣的傀儡，會聽我的話，不再受到諾芙那個女人迷惑，就讓你成為他的一部份～
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)

	--BeginPlot( TI , "LuaS_422825_3", 0 )	
	say(TI,"[SC_422825_6]")		--「緹亞娜」～我的名，你可以這樣喚我，因為當我抽取你的靈魂碎片融進他的體內後，你也會一直記得這個名字
	sleep(30)
	
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CAST_BEGIN)					--做動作

	--CastSpell( TI , TI , 494410 )

	CastSpell( TI , TargetID(), 492184)								--施法
--	SetDefIdleMotion( TargetID(), ruFUSION_MIME_CROUCH_BEGIN)							--玩家
	say(TI,"[SC_422825_7]")		--感動的顫抖吧～親愛的[$playername]，你的靈魂從此刻開始歸屬於我～
	sleep(20)
	local NO  = Lua_DW_CreateObj("flag" ,113741,780460,4,1)
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CAST_END)		
	DisableQuest( NO,  true)
	AdjustFaceDir( NO  ,TI , 0 ) 	
	local NPC = Lua_DW_CreateObj("flag" ,113734,780460,5,1 )		----路人出現
	DisableQuest( NPC,  true)
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422825_3" , 0 )
	AddBuff( TI , 502383 , 0 , 1 )
	sleep(10)
	PlayMotion( NO , ruFUSION_ACTORSTATE_CAST_INSTANT)	--諾芙施法破壞緹亞娜法術	
	sleep(10)
	AddBuff(TI ,502730 , 0, 1)
	sleep(20)
	SetDefIdleMotion( NO, ruFUSION_MIME_EMOTE_SPEAK)
	say(NO  ,"[SC_422825_8]")			--迷途的靈魂...緹亞娜...別再繼續錯下去了...
	sleep(20)
	say(TI,"[SC_422825_9]")			--哼！諾芙，畏縮躲起來的傢伙，收起妳眼中噁心的憐憫～
	sleep(20)
	say(NO  ,"[SC_422825_10]")			--安德薩斯已經不在了，就算做出傀儡又能如何呢？
	sleep(20)
	SetDefIdleMotion( NO, ruFUSION_MIME_NONE)
	say(TI,"[SC_422825_11]")			--沒錯！他不在了，而那正是妳害的！
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	AdjustFaceDir(  TI,NO , 0 ) 
	sleep(20)
	say(TI,"[SC_422825_12]")  			--就算犧牲我的靈魂、就算妳不停阻撓，我也 會把他做出來，妳等著瞧吧！
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_ATTACK_1H)

	--CastSpell( TI, TI, 490169)			--緹亞娜對自己施法
	DelObj( TI )
	if	CheckBuff( TargetID() , 505009) == true then
		CancelBuff( TargetID() , 505009 )  
	end

	if	CheckBuff( TargetID() , 503977 ) == true then
		CancelBuff( TargetID() , 503977 )  
	end
	AdjustFaceDir( NPC,NO , 0 ) 	
	sleep(20)
	say(NPC,"[SC_422825_14]")			--我先回村裡看看情況。
	PlayMotion(  NPC ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(20)
	BeginPlot( NPC , "LuaS_422825_1" , 0 )
	AdjustFaceDir( NO  ,TargetID(), 0 ) 	
	sleep( 10 )
	DelObj( NO )
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543418 , 1 )
	end
	SetPlot( OwnerID() , "touch" ,"" , 0 )
	DisableQuest( OwnerID() , false)
end

function LuaS_422825_1()
	LuaFunc_MoveToFlag( OwnerID(),780460,7,0)
	DelObj( OwnerID() )
end

function LuaS_422825_2()			--秒數配合劇情調整
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	for i = 1, 60, 1 do
		if  CheckID( player ) == false	then
			break
		end
		sleep(10)
	end
	
end

function LuaS_422825_3()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag( OwnerID(),780460,6,0)			--tar是艾薇莎	
	if CheckID( Player ) == true then
		AdjustFaceDir( OwnerID(),Player , 0 ) 
		sleep(10)
	end	
	PlayMotion(   OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)	--做動作關心玩家
	say( OwnerID(),"[SC_422825_13]")				--你還好嗎？
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------水元素
function LuaS_422824_1()
	say(TargetID(),"[SC_422824_1]")		--TargetID是緹亞娜 say我送你過去吧～
	SetPosByFlag( OwnerID(), 780459 , 1)		--傳送
--	SetFlag( OwnerID() , 543429 , 1 )		--<給玩家一個旗標，之後看不到原本的緹亞娜<成功檢測後也看不到原本的>>，新的緹亞娜在水元素王座>
end


function LuaS_102796_1()
	CloseSpeak( OwnerID())				--結束、不可叫
	ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_422824_7]" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_7]" , 0 ) 
end

function LuaS_102796_2()
	CloseSpeak( OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register +2 ) == 0 then
		WriteRoleValue ( TargetID()  , EM_RoleValue_Register+2, 1 )			--TargetID是水元素王
		if	(CheckAcceptQuest(OwnerID(),422814)==true )	then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422814_1]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422814_1]" , 0 ) 
		end
		if	(CheckAcceptQuest(OwnerID(),422824)==true )	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422824_3]" , 0 ) --你的話尚未說完，水元素王普力席亞茲的模樣突然有些不對勁...扭曲痛苦...他似乎開始產生變化...
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_3]" , 0 ) 
		end
		BeginPlot( TargetID() , "LuaS_102796_3" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_422824_7]" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_7]" , 0 ) 
	end
end



function LuaS_102796_3()
	Hide(OwnerID())	
	local BlackMist = ReadRoleValue( OwnerID() , EM_RoleValue_PID )							--OwnerID是水元素
	Hide( BlackMist )
	local WATER = Lua_DW_CreateObj("flag" ,102796,780459,2 ) 			--種出白水元素
	AddBuff( WATER , 500900 , 0 , 600 )
	SetPlot( WATER , "dead" , "LuaS_KK_Dead" , 0 )					--死亡劇情--讓水元素王不會死
	--DisableQuest( WATER,  true)							--關對話
	--MoveToFlagEnabled( WATER  , false )						--關巡邏

	
	local NOF = Lua_DW_CreateObj("flag" ,113812,780459,3 ) 				--種出諾芙
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+7 , NOF)			--將諾芙寫進WATER水元素裡
	WriteRoleValue ( NOF ,  EM_RoleValue_Register+7 , WATER )
	local MM = Lua_DW_CreateObj("flag" ,113935,780459,3 )
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+6 , MM)
	DisableQuest( NOF,  true)							--關對話
	MoveToFlagEnabled( NOF  , false )						--關巡邏

	local TI = Lua_DW_CreateObj("flag" ,114093,780459,4 ) 				--種出緹亞娜
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+8 , TI)			--將緹亞娜寫進WATER水元素裡
	WriteRoleValue ( TI,  EM_RoleValue_Register+8 , WATER  )		
	DisableQuest( TI,  true)							--關對話
	MoveToFlagEnabled( TI  , false )						--關巡邏

	BeginPlot( NOF , "LuaS_102796_4" , 0 )					--諾芙
	BeginPlot( TI  , "LuaS_102796_5" , 0 )						--緹亞娜
	
	BeginPlot( MM , "LuaS_102796_7" , 0 )

--	--離開戰鬥條件--超過限時時間<暫訂4分鐘>
	for j =0,240,1 do
		local  TT=ReadRoleValue(WATER ,EM_RoleValue_MaxHP)
		local  EE= ReadRoleValue(WATER ,EM_RoleValue_HP)
		sleep(10)
		local TempID
		if CheckID( WATER ) == false then 	--持續檢查黑水元素NPC在不在
			break
		end
		if	EE/TT<0.5	then

			for i=0 , HateListCount( WATER )-1 do 
				TempID = HateListInfo(WATER ,i , EM_HateListInfoType_GItemID )
				
				if	CheckAcceptQuest( TempID , 422814)==true	then
					SetFlag( TempID, 543451, 1 )
				end
				if	CheckAcceptQuest( TempID , 422824)==true 	then
					SetFlag( TempID, 543417, 1 )
					SetFlag( TempID, 543454, 1 )
				end
			end

			SetStopAttack( WATER )
			Lua_CancelAllBuff( WATER ) 
			SetRoleCamp( WATER  , "Visitor" ) 			--改變陣營
			SetFightMode ( WATER ,0,0, 0,0 )
			break
		end
		if HateListCount( WATER ) == 0 and j > 30 then 	--離開戰鬥條件--仇恨列表的玩家不在--可能死掉或離開、斷線
			break
		end
		
	end
	if CheckID(WATER) == true then
		DelObj( WATER )						--刪除黑水元素NPC
	end
	if CheckID(NOF) == true then
		DelObj( NOF )
	end
	if CheckID(TI) == true then	
		DelObj( TI )
	end
	if CheckID(MM) == true then	
		DelObj( MM)
	end
	Show( BlackMist , 0 )
	Show(OwnerID() , 0)							--秀出白水元素
	WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+2, 0 )

end
function LuaS_102796_4()
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )  
	local TT = Lua_DW_CreateObj("flag" ,113935,780459,3,1 )
	SAY(OwnerID(),"[SC_422814_2]")---[102796]，是我，你聽得見嗎？
	sleep(30)
	SAY(OwnerID(),"[SC_422814_3]")--清醒過來，別讓瘋狂擊敗你聖潔的心靈。
	sleep(30)
	SAY(OwnerID(),"[SC_422814_4]")--不行，[113736]的心靈被憤怒所操控，現在的他聽不下我的言語。必須盡快讓他清醒過來！
	CastSpell(OwnerID(),MM,  494407 )
	SAY(MM,"[SC_422814_2]")---[102796]，是我，你聽得見嗎？
end
function LuaS_102796_5()
	local WATER=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )  
	--TI對WATER施法<引導型法術的感覺、只有特效>
	WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 0 )
	sleep(30)
	while 1 do
			CastSpell(OwnerID(),WATER,  492184)	
			--	CastSpell(WATER,OwnerID(),  494407 )
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 0 then	
			say(OwnerID(),"[SC_422824_4]")				--水元素...果然被影響了…擋住他的攻勢！我來協助你。 
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 1 )	
			end
			sleep(50)
			if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 1 then
			say(OwnerID(),"[SC_422824_5]")				--普力席亞茲，你也沒想過會變成這樣吧？
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 2 )
			end
			sleep(50)
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 2 then	
			say(OwnerID(),"[SC_422824_6]")				--再一段時間～你的痛苦就會結束，趁現在盡情釋放你的憤怒～
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 3 )	
			end	
	sleep(10)
	end				
end
function LuaI_112506_0()
	local BlackMist = LuaFunc_CreateObjByObj( 113677 , OwnerID() )
	Lua_ObjDontTouch( BlackMist )
	BeginPlot( BlackMist , "LuaS_113677" , 0 )
	WriteRoleValue( OwneRID() ,EM_RoleValue_PID , BlackMist )
end
function LuaS_113677()	--水元素特效黑霧
	while true do
		AddBuff( OwnerID() , 500900 , 0 , 600 )
		sleep(600)
	end
end

function LuaS_102796_7()
 	CastSpell( OwnerID(), OwnerID(),  494408 )
end