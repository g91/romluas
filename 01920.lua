------------423327------------------
function LuaS_115764()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if CheckAcceptQuest( OwnerID() , 423327 ) == true  and	CheckFlag( OwnerID(),544229 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423327_1]","LuaS_423327_1",0)	--我們要跟拉夏娜說什麼呢？
	end	--<=423327用
end
	
function LuaS_423327_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423327_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423327_2]")			---拉夏娜剛才說要讓他靜一靜...	
	end
end

function LuaS_423327_false()
	SetSpeakDetail(OwnerID(),"[SC_423327_2]")			---拉夏娜剛才說要讓他靜一靜...
end		
	
function LuaS_423327_2()
	AddBuff( TargetID()  , 506998 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423327 , 506998,TargetID(),OwnerID(),150)		
	
	local tony = Lua_DW_CreateObj("obj",115770,OwnerID())   --tony假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115765  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115771,NPC)   --ith假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115772,NPC1)   --lasha假人
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )	
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---用走的
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---用走的
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	AdjustFaceDir( lasha ,tony, 0 )
	Yell(tony,"[SC_423327_3]",3)						---拉夏娜...令堂的事我很抱歉...身為人王,卻無法阻止這種事情...
	sleep(35)	
	Yell(tony,"[SC_423327_4]",3)						---我以人王的身分保證,絕對不會讓這種事情再次發生！
	sleep(15)	
	if	CheckBuff( TargetID() , 506998 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423327_5]", "0xff8080ff" )--(拉夏娜眼神中帶著憤怒)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423327_5]",  "0xff8080ff" )--
	end
	sleep(20)
	Yell(lasha,"[SC_423327_6]",3)						---保證？你用什麼保證?用你那弱不禁風的身體,還是連樹幹都舉不起來的手臂?難道你可以像初代人王坦帝歐斯.卡薩姆那樣用生命保證嗎！
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(15)	
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)		
	Yell(ith,"[SC_423327_7]",3)							---拉夏娜,不准對人王無禮!!
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(25)
		
	if	CheckBuff(TargetID() , 506998 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423327_8]",3)						---....是的，我用生命像你保證。
	sleep(15)
	AdjustFaceDir( ith ,tony, 0 )
	sleep(5)
	Yell(ith,"[SC_423225_3]",3)							---陛下！
	sleep(20)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell(lasha,"[SC_423327_9]",3)						---你瘋了嗎！居然如此輕視自己的生命，虧你還是人王後代。太令我失望了！
	sleep(35)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(lasha,"[SC_423327_10]",3)						---滾出去!安格爾城不歡迎瘋瘋癲癲的人王小鬼！
	sleep(10)
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(5)
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_POINT)				
	Yell(ith,"[SC_423322_7]",3)							---拉夏娜！
	DW_MoveToFlag(ith,780679 , 11 ,0 ,1)		
	sleep(15)
		
	if	CheckBuff(TargetID() , 506998 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(tony,"[SC_423327_11]",3)						---說的沒錯...我會待在雷安卡營地等待你的消息。
	AdjustFaceDir( ith ,tony, 0 )
	sleep(15)
	AdjustFaceDir( ith ,lasha, 0 )		
	DW_MoveToFlag(tony,780679 , 3 ,0 ,1)	
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
	CallPlot(tony,"MK_MoveToFlag_End",tony,780679 , 1,0 ,1)
	sleep(15)
	DW_MoveToFlag(ith,780679 , 3 ,0 ,1)	
	MK_MoveToFlag_End(ith,780679 , 1 ,0 ,1)
	sleep(20)	
	AdjustFaceDir( lasha ,TargetID(), 0 )	
	sleep(5)
	Yell(lasha,"[SC_423327_12]",3)						---達拉尼斯的騎士，我有些話要跟你說。
	delobj(lasha)
	if	CheckBuff( TargetID() , 506998 ) == true	then
		CancelBuff( TargetID()  , 506998  ) 	--
		SetFlag(TargetID(),544229,1)
	end	
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )		
end
-------------------------423329-----------------------------
function LuaS_115773()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if CheckAcceptQuest( OwnerID() , 423329 ) == true  and	CheckFlag( OwnerID(),544230 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423329_1]","LuaS_423329_1",0)	--伊崔妮回報，我們遭到跟蹤了，陛下有何指示？
	end	--<=423329用
	if	CheckAcceptQuest( OwnerID() , 423330 ) == true	and	CheckFlag( OwnerID(),544231 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423330_1]","LuaS_423330_3",0)		---陛下想說甚麼呢？
	end	--<=423321用	
end

function LuaS_423329_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423329_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423329_2]")			---會是誰呢？我相信拉夏娜跟精靈族不會向我出手....
	end
end

function LuaS_423329_false()
	SetSpeakDetail(OwnerID(),"[SC_423329_2]")			---會是誰呢？我相信拉夏娜跟精靈族不會向我出手....
end	

function LuaS_423329_2()
	AddBuff( TargetID()  , 507072 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423327 , 506998,TargetID(),OwnerID(),150)		
	local tony = Lua_DW_CreateObj("obj",115775,OwnerID())   --tony假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115774  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115776,NPC)   --ith假人	
	local derak = Lua_DW_CreateObj("flag" ,115777,780681,1)		---derak假人
	MoveToFlagEnabled(derak,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	DisableQuest( ith , true )							---演員不可對話
	DisableQuest( tony , true )	
	DisableQuest( derak , true )		
	sleep(20)
	WriteRoleValue(derak , EM_RoleValue_IsWalk, 1 )		---用走的
	Yell(derak,"[SC_423329_3]",3)						---別交頭接耳的，我真要下殺手這裡也沒人攔的住我。
	sleep(5)
	AdjustFaceDir( tony ,derak, 0 )
	Yell( ith ,"[SC_423329_13]",3)
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)	
	sleep(5)
	PlayMotion( tony ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( tony ,"[SC_423329_14]",3)	
	CallPlot(ith,"LuaS_face_someone", derak,6)			---持續面對某人
	DW_MoveToFlag(derak,780681 , 2 ,0 ,1)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(derak,"[SC_423329_4]",3)						---安格爾人說的對，你瘋了。
	sleep(15)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(15)
	Yell(derak,"[SC_423329_5]",3)						---不過算你走運，如果是我就殺了你。
	sleep(35)
	
	if	CheckBuff(TargetID() , 507072 ) == false	then
		delobj(tony)
		delobj(derak)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
	
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423329_6]",3)						---哈...沒錯，或許我是瘋了,但只有瘋狂才能讓我超越坦帝歐斯.卡薩姆...
	sleep(40)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(derak,"[SC_423329_7]",3)						---哈哈哈哈哈哈！好個狂妄的小鬼！
	sleep(35)
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
	Yell(ith,"[SC_423329_8]",3)							---無禮者！住口！
	sleep(10)
	AdjustFaceDir( derak ,ith, 0 )
	sleep(10)
		
	if	CheckBuff(TargetID() , 507072 ) == false	then
		delobj(tony)
		delobj(derak)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		
		
	PlayMotionEX( derak , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Yell(derak,"[SC_423329_9]",3)						---叫我住口？沒有那個精靈在，我隨時都可以殺了你們！
	sleep(30)
	AdjustFaceDir( derak ,tony, 0 )
	sleep(5)
	Yell(derak,"[SC_423329_10]",3)						---不過我今天心情不錯，還要忙著回去揍扁討厭的傢伙。
	sleep(30)
	AdjustFaceDir( derak ,tony, 180 )
	sleep(5)
	Yell(derak,"[SC_423329_11]",3)						---千萬別來找我喔，我可不想要你死在犬族人的地盤，人王小鬼。
	sleep(35)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(derak,"[SC_423329_12]",3)						---哈哈哈哈哈哈哈！
	CallPlot(ith,"LuaS_face_someone", derak,6)
	MK_MoveToFlag_End(derak,780681 , 1 ,0 ,1)
	delobj(tony)
	delobj(ith)
	if	CheckBuff( TargetID() , 507072 ) == true	then
		SetFlag(TargetID(),544230,1)
	end	
	CancelBuff( TargetID()  , 507072  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )		
end
---------------------------423330----------------------------
function LuaS_423330_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423330_2]")			---回想起來一開始我們是追著德瑞克的腳步來到這裡，但幾次思考下總覺得這應該是他的計畫。
		if	CheckAcceptQuest ( OwnerID()   , 423330 )	 == true	then
			SetFlag(OwnerID(),544231,1)
		end	
	end
end

---------------------------423302---------------------------

function LuaS_423302()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423302_0",150)
end

function LuaS_423302_0()		----player => owner   ;  隱形球 => target
	--say(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_Register +1))	
	if 	CheckAcceptQuest( OwnerID() , 423302 ) == true	and	----有接423302
		CheckFlag( OwnerID() , 544190) == false	and	----沒有任務flag
		CheckBuff(OwnerID() , 507083) == false	and
		CheckBuff(OwnerID() , 507082) == false	then	----沒有演戲buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) > 1	then			----buzy then 給等待buff
				BeginPlot(TargetID(),"LuaS_423302_1",1)
		elseif		ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then 
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
				BeginPlot(TargetID(),"LuaS_423302_2",1)
		else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
		end
	end 
end

function LuaS_423302_1()		----player => target   ;  隱形球 => Owner	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423302_8]" ,  "0xFFFFFF00" ) 		-----菲恩彌爾說在這裡等他，不妨在這裡多等一會。
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423302_8]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),507083,1,60)				---給予等待BUFF
end

function LuaS_423302_2()	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 1 )
	Local buzy = 1
	local time = 0
	local Target = 0
-----------------------
	while buzy == 1 do	
-----------------------設定戰鬥前-----------------------------------
		Local okd =    Lua_DW_CreateObj("flag" ,104076,780682,1)			----種出吉兒,勞勃,摩瑞克並設定為visitor
		Local elf =    Lua_DW_CreateObj("flag" ,104077,780682,2)
		WriteRoleValue( okd , EM_RoleValue_Register + 1 , OwnerID() )
		WriteRoleValue( okd , EM_RoleValue_Register + 2 , elf )
		WriteRoleValue( elf , EM_RoleValue_Register + 1 , OwnerID() )
		SetRoleCamp( okd , "Visitor" )
		SetRoleCamp( elf , "Visitor" )	
		SetIdleMotion( okd,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		SetIdleMotion( elf,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		MoveToFlagEnabled(okd,false)
		MoveToFlagEnabled(elf,false)
		CallPlot(okd,"LuaS_423302_okd_check",elf,OwnerID())	-------------檢查玩家是否打他
		SetPlot(okd , "Dead","LuaS_423302_okddead",100)		-------------設定死亡劇情
		SetPlot(elf , "Dead","LuaS_423302_elfdead",100)
		sleep(20)
		WriteRoleValue(elf , EM_RoleValue_IsWalk, 0 )		-------------用走的到定點
		WriteRoleValue(okd , EM_RoleValue_IsWalk, 0 )				
		CallPlot(okd,"DW_MoveToFlag",okd,780682 , 6 ,0 ,1	)	
		DW_MoveToFlag(elf,780682 , 7 ,0 ,1	)
		SetRoleCamp( okd , "Wagon" )
		SetRoleCamp( elf , "Monster" )		
------------------------開始戰鬥------------------------------
		while	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 1  do
			SetAttack(okd,elf)	
			SetAttack(elf,okd)	
			sleep(5)

		end
-----------------------直到戰鬥結束-----2:精靈死亡----3:獸人死亡
		if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then	
			Yell(okd,"[SC_423302_9]",3)
			CallPlot(okd,"MK_MoveToFlag_End",okd,780682 , 1 ,0 ,1)	
			sleep(5)
			Yell(elf,"[SC_423317_8]",3)							----....	
			CallPlot(elf,"MK_MoveToFlag_End",elf,780682 , 2 ,0 ,1)		
			sleep(30)
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
		end
----------------------戰鬥結束後獸人維持中立狀態,有人扁他就結束----------------------------
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
			CallPlot(elf,"MK_MoveToFlag_End",elf,780682 , 2 ,0 ,1)
			Yell(okd,"[SC_423302_0]",3)	
			Target = 0
			local Player = SearchRangePlayer ( elf , 200 )			----搜尋區域內玩家
			for i = 0 , table.getn(Player) do
				if	CheckFlag( Player[i] , 544190) == false	and	CheckAcceptQuest( Player[i] , 423302 ) == true	and	CheckBuff(player[i] , 507082) == true	then
					Target = 1
					ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_1]" ,  "0xFFFFFF00" ) 		-----(眼前的[115599]對你懷有強烈的敵意)
					ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_1]" ,  "0xFFFFFF00" ) 	
				end			
			end	
			--say(okd,Target)
			if	Target ~= 0	then
				for i = 0 , table.getn(Player) do
					if	CheckBuff(player[i] , 507082) == true	then
						AdjustFaceDir( okd,player[i], 0 )
						sleep(8)
						time = time + 8		
						if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then
							MK_MoveToFlag_End(okd,780682 , 1 ,0 ,1)	
							for i = 0 , table.getn(Player) do
								if	CheckBuff(player[i] , 507082) == true	then
									ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 		-----(安格爾族人被攻擊而撤退了，無法進一步接觸，請重新嘗試。)
									ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 	
									CancelBuff( player[i]  , 507082  ) 	--	
									CancelBuff( player[i]  , 507083  ) 	--
								end			
							end		
							WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
							break
						end
						if	time > 45	then
							break
						end
					end
				end	

				while	time < 45	do
					sleep(8)
					time = time + 8	
					if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then
						SetRoleCamp( okd , "Visitor" )
						MK_MoveToFlag_End(okd,780682 , 1 ,0 ,1)	
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 		-----(安格爾族人被攻擊而撤退了，無法進一步接觸，請重新嘗試。)
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 	
							end			
						end		
						WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
						break
					end
				end
			end
			if	Target == 0	then
				--say(okd,"is 0")
				WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
			end
			--say(okd,ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) )
			local okd3 = Lua_DW_CreateObj("obj",115782,okd)   --假人
			WriteRoleValue(okd3 , EM_RoleValue_IsWalk, 0 )	
			DisableQuest( okd3 , true )			
			delobj(okd)
			CallPlot(okd3,"MK_MoveToFlag_End",okd3,780682 , 1 ,0 ,1)	
	-------------------------
			if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
				local okd2 = Lua_DW_CreateObj("obj",115780,okd3)   --假人					
				CallPlot(okd2,"LuaS_423302_cancel",250)
				local continue = 0
				for i = 0 , table.getn(Player) do
					if	CheckBuff(player[i] , 507082) == true	then
						continue = 1
						break
					end			
				end		
				if	continue == 0	then
					delobj(okd2)
					WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
				end
		
				if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
					for i = 0 , table.getn(Player) do
						if	CheckBuff(player[i] , 507082) == true	then
							ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_0]" ,  "0xFFFFFF00" ) 		-----一陣騷動傳來，似乎有什麼東西靠近了
							ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_0]" ,  "0xFFFFFF00" ) 	
						end			
					end	
					Local shop =    Lua_DW_CreateObj("flag" ,115781,780682,1)	
					AdjustFaceDir( okd2,shop, 0 )
					CastSpell(shop,shop,494027)
					CastSpell(shop,shop,495606)	
					MoveToFlagEnabled(okd2,false)
					MoveToFlagEnabled(shop,false)
					DisableQuest( okd2 , true )	
					DisableQuest( shop , true )	
					sleep(20)
					WriteRoleValue(shop , EM_RoleValue_IsWalk, 1 )		
					WriteRoleValue(okd2 , EM_RoleValue_IsWalk, 0 )		
					sleep(10)
					local close = 10000
					Target = 0
					--say(Target,"Target = " .. Target)
					for i = 0 , table.getn(Player) do
						if	CheckBuff(player[i] , 507082) == true	and	GetDistance( shop , Player[i] ) < close then
							close = GetDistance( shop , Player[i] )
							Target = Player[i]
						end			
					end
					CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 3, 0 , 1 ,Target  )		
					if	Target ~= 0	then
						AddBuff( Target  , 503977 , 1 , 300 ) 				--凍住玩家
						DW_GetClose(shop,Target,40)
						CancelBuff( Target  , 503977  ) 			--還玩家自由
					else
						delobj(okd2)
						delobj(shop)
						WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )				
					end
					if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
						Sleep(30)
						Yell(okd2,"[SC_423302_2_4]",3)		--這不是......獸靈守護者的使者嗎？為什麼會出現在這裡？
						Sleep(30)
						if	CheckBuff(Target , 507082) == true	then
							ScriptMessage(  Target,  Target , 0 , "[SC_423302_2]" ,  "0xFFFFFF00" ) 		-----獸靈守護者之使在你身上嗅了嗅，似乎很喜歡親近你
							ScriptMessage(  Target ,  Target , 1 , "[SC_423302_2]" ,  "0xFFFFFF00" ) 	
						end
						sleep(50)
						AdjustFaceDir( shop ,okd2, 0 )
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_1]" ,  "0xFFFFFF00" ) 		-----一陣騷動傳來，似乎有什麼東西靠近了
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_1]" ,  "0xFFFFFF00" ) 	
							end			
						end	
						sleep(30)
						Yell(okd2,"[SC_423302_3]",3)			--獸靈守護者之使，我是您最虔誠的信徒啊！那邊的才是敵人！
						sleep(30)		
						WriteRoleValue(shop , EM_RoleValue_IsWalk, 0 )		
						PlayMotion(okd2,ruFUSION_ACTORSTATE_EMOTE_POINT)		
						CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 4, 0 , 1 ,Target )		
						MK_MoveToFlag_Face( shop , 780682 , 3, 0 , 1 ,okd2 )
						sleep(20)
						PlayMotion(okd2,ruFUSION_ACTORSTATE_EMOTE_POINT)
						sleep(10)
						Yell(okd2,"[SC_423302_4]",3)			--敵人是他們才對啊！
						sleep(20)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_2]" ,  "0xFFFFFF00" ) 		-----
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_2]" ,  "0xFFFFFF00" ) 	
							end			
						end	
						CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 5, 0 , 1 ,shop )	
						MK_MoveToFlag_Face( shop , 780682 , 9, 0 , 1 ,okd2 )	
						Yell(okd2,"[SC_423302_5]",3)			--難道......難道說他就是被[115630]選中的人！？
						sleep(30)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_5]" ,  "0xFFFFFF00" ) 		-----
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_5]" ,  "0xFFFFFF00" ) 	
							end			
						end	

						sleep(30)
						WriteRoleValue(okd2 , EM_RoleValue_IsWalk, 1 )	
						WriteRoleValue(shop , EM_RoleValue_IsWalk, 1 )		
						Yell(okd2,"[SC_423302_6]",3)			--我知道了，既然如此，我會將這位尊貴的客人帶回[ZONE_ANGAREN]去的。
						sleep(30)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_6]" ,  "0xFFFFFF00" ) 		-----獸靈守護者之使滿意的離去
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_6]" ,  "0xFFFFFF00" ) 	
							end			
						end		
						sleep(10)
						--CallPlot(okd2,"LuaS_face_someone", shop,5)			---持續面對某人	
						MK_MoveToFlag_End(shop,780682 , 10 ,0 ,1)		
						Yell(okd2,"[SC_423302_7]",3)			--既然你是被選中的人，那就不是[ZONE_ANGAREN]的敵人了，我得先回城去通知大家這個消息。
						time = 0
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								AdjustFaceDir( okd,player[i], 0 )
								sleep(8)
								time = time + 8		
								if	time > 45	then
									break
								end
							end
						end		
						sleep(8)
						MK_MoveToFlag_End(okd2,780682 , 10 ,0 ,1)
						for i = 0 , table.getn(Player) do								---仍有BUFF的玩家可以得到旗標
							if	CheckBuff(player[i] , 507082) == true	and	CheckAcceptQuest( player[i] , 423302 ) == true		then
								SetFlag(player[i],544190,1)	--give mission flag
								CancelBuff( player[i]  , 507082  ) 	--
							end
						end
					end
				end	
			end
			for i = 0 , table.getn(Player) do
				CancelBuff( Player[i]  , 507082  ) 	--	
				CancelBuff( Player[i]  , 507083  ) 	--		
			end	
		end
		buzy = 0
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
		local Player3 = SearchRangePlayer ( OwnerID() , 200 )			----觸發點附近有玩家有等待BUFF,BUZY=1,重複演戲
		for i = 0 , table.getn(Player3) do	--CheckBuff(player3[i] , 507083) == true		and	
			if	CheckAcceptQuest( player3[i] , 423302 ) == true	and				
				CheckFlag( player3[i] , 544190) == false	then
				CancelBuff( player3[i]  , 507083  ) 	--
				buzy = 1
				WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 1 )	
				ScriptMessage( player3[i] , player3[i] , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( player3[i] , player3[i] , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
			end
		end
		--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )
	end	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
	--say(TargetID(),ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) )
end

function LuaS_423302_okddead()
	Lua_CancelAllBuff( OwnerID() )

--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 2	then
--		say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
		local Player = SearchRangePlayer ( OwnerID() , 300 )			----搜尋區域內玩家
		for i = 0 , table.getn(Player) do
			if	CheckAcceptQuest( Player[i] , 423302 ) == true	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( Player[i]  , 507082  ) 	--
			end			
		end	
	end
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 1	then
		WriteRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1 ,  3 )	
	end	

	SetRoleCamp( OwnerID() , "Visitor" )
	SetRoleCamp( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2  ), "Visitor" )
	return false
end

function LuaS_423302_elfdead()
	Lua_CancelAllBuff( OwnerID() )

--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) ~= 3	then
--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
		local Player 
		for i=0, HateListCount( OwnerID() )-1 do
			Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	CheckAcceptQuest ( Player   , 423302 )	 == true	and
				GetDistance(OwnerID(),player) < 250	then
				AddBuff(player,507082,1,-1)
				--say(player,"i get buff")
			end	
		end
		SetRoleCamp( OwnerID() , "Visitor" )
		if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 1	then
			WriteRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1 ,  2 )
		end	
	end

	return false
end

function LuaS_423302_okd_check(elf,boss)
	while	ReadRoleValue(boss , EM_RoleValue_Register + 1  ) == 1	do
		sleep(10)
		for i=0, HateListCount( OwnerID() )-1 do
			if	HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) ~= elf	and	CheckBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098) == false	then
				ScriptMessage( HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , 0 , "[SC_423302_10]" ,  "0xFFFFFF00" ) 	---(你攻擊了安格爾族人，他狠狠的瞪了你一眼後繼續專心對付[104077])
				ScriptMessage( HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ), HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , 1 , "[SC_423302_10]" ,  "0xFFFFFF00" )
				AddBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098,1,120)
				SetAttack(OwnerID(),elf)	
			end	
		end
	end
	ClearHateList( OwnerID() , -1 )
	SetStopAttack( OwnerID() )	
	while	ReadRoleValue(boss , EM_RoleValue_Register + 1  ) == 2	do
		sleep(10)
		for i=0, HateListCount( OwnerID() )-1 do
			Target = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) ~= elf	and	CheckBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098) == false	then
				ClearHateList( OwnerID() , -1 )
				SetStopAttack( OwnerID() )
				SetRoleCamp( OwnerID() , "Visitor" )								
				WriteRoleValue( boss , EM_RoleValue_Register + 1 ,  3 )					
			end	
		end
	end
end

function LuaS_meek_debuff()
				CancelBuff( OwnerID() , 507082  ) 	--
end

function LuaS_meek_checkbuff()
	if	CheckBuff(OwnerID() , 507082) == true	then
		say(OwnerID(),"i have buff")
	else
		say(OwnerID(),"i have no buff")
	end
end

function LuaS_423302_cancel(range)
	local Player = SearchRangePlayer ( OwnerID() , 1000 )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(Player) do
			if	GetDistance( player[i] , OwnerID() ) > range	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( player[i]  , 507082  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 		-----距離跟隨的目標太遠，請回到起點重試。
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423302 ) == false	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( player[i]  , 507082  ) 	--				
			end
		end
	end
end

function LuaS_423302_complete()
	AddBuff( TargetID(),  507082 , 1 , -1)                                         ---剛過任務的玩家才看到
	local okd = Lua_DW_CreateObj("obj",115780,OwnerID())   --okd假人
	MoveToFlagEnabled(okd,false)
	DisableQuest( okd , true )	
	DW_MoveToFlag(okd,780682 , 8,0 ,1)	
	delobj(okd)
	CancelBuff( TargetID()  , 507082  ) 	--	
end

function LuaS_anger_checker()
	local XD
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115971  , 200 , 0)		---
	while	true	do
		XD = 0
		sleep(20)
		local HowManyPlayer = SetSearchAllPlayer(0)
		local player
		for i = 1,HowManyPlayer,1 do
			Player = GetSearchResult()
			if CheckMapID( ReadRoleValue(Player,EM_RoleValue_X) ,ReadRoleValue(Player,EM_RoleValue_Y) ,ReadRoleValue(Player,EM_RoleValue_Z) , 932) == true	and	CheckCompleteQuest( player , 423302 ) == false	then
				--FindMapID( ReadRoleValue(OwnerID(),EM_RoleValue_X) , ReadRoleValue(OwnerID(),EM_RoleValue_Y) , ReadRoleValue(OwnerID(),EM_RoleValue_Z) ) )
				SetPosByFlag( player , 780675 , 1 )
				XD = 1
			end
		end
		if	XD == 1	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			CallPlot(OwnerID(),"LuaS_anger_checker_say",NPC)
		end
	end
end

function LuaS_anger_checker_say(player)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AdjustFaceDir( OwnerID() ,player, 0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(OwnerID(),"[SC_423302_13]",3)
	sleep(40)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end