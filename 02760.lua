function sean_121398_speak() --對話劇情
	local Owner = OwnerID()
	local Target = TargetID()
	local Player = SearchRangePlayer( Owner , 10)
	local secondseat = Lua_Mounts_Copilot( Owner )--有無騎乘雙人座騎
	for i = 0 , table.getn( Player) do
		DW_CancelTypeBuff(68,Player[i])--騎乘坐騎時，點擊下馬	
	end
--	if secondseat == false then --有在後座
--		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GAME_WARNING]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
--	else
	
		if CheckFlag(Owner,547083)==true and CheckBuff( Owner , 623495 )==true then
			SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")--活動結束
			AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 ) --領取獎勵！

		elseif CheckFlag(Owner,547083)==true then
			SetSpeakDetail( Owner , "[SC_2012_GAME_NPC09]")--檢查有無遭淘汰過

		else
			if CheckFlag(Owner,547027)==true then--檢查有無領取獎勵
				SetSpeakDetail( Owner , "[SC_2012_GAME_NPC06]")

			else 
				if CheckFlag(Owner,547026)==true then--先檢查玩家是否玩過
					SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")--活動結束
					AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 ) --領取獎勵！

				else 
					SetSpeakDetail( Owner , "[SC_2012_GAME_NPC01]") --唉呀呀！一年一度的南瓜節又到了。
					if CheckBuff(Owner,623484) ==true then
						SetSpeakDetail( Owner  ,"[SC_2012_GAME_NPC04]"  )--玩家有變身BUFF下顯示

					elseif CheckFlag(Owner,547084)==true then--檢查有無離線過
						SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 )
						SetFlag(Owner,547026,1)

					else	
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT03]" ,  "sean_121398_speak2",0 )--聽規則
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT01]" ,  "sean_121398_start",0 ) --參加
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT02]" ,  "sean_121398_speak3",0 ) --不參加
					end
				end
			end
		end
--	end
end


function sean_121398_speak2() --規則說明
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC02]") --規則說明
	AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT05]" ,  "sean_121398_start",0 )--好！乾了！
	AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT02]" ,  "sean_121398_speak3",0 ) --我一秒幾十萬上下，沒空理你
end




function sean_121398_speak3() --不參加活動
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC03]") --好吧！那我另外找人好了。
end




function sean_121398_start() --活動開始，給予玩家3分鐘的活動BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	local secondseat = Lua_Mounts_Copilot( Owner )--有無騎乘雙人座騎
	DW_CancelTypeBuff(68, Owner)
	if secondseat == false then --有在後座
		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GAME_WARNING]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
	else
		CloseSpeak( Owner)
		setflag(Owner,547084,1)--給予離線判定旗標
		SysCastSpellLv(Owner,Target,850406,0)  
	end
		DesignLog( Owner , 121398 , "Lv = "..Lv.." SubLv = "..SubLv )--回傳活動參與值
end




function sean_121398_frightenNPC()
	local Owner = OwnerID()
	local Target = TargetID()
	local CheckTable = {[110612]=1;[110613]=1;[110614]=1;[110619]=1;[110621]=1;
			       [110622]=1;[110623]=1;[110624]=1;[110629]=1;[110630]=1;
			       [110632]=1;[110637]=1;[110638]=1;[121415]=1;[121432]=1;--小孩1

			       [110021]=2;[110022]=2;[110386]=2;[110387]=2;[110389]=2;
			       [110390]=2;[110406]=2;[110407]=2;[110409]=2;[110412]=2;
			       [110536]=2;[110541]=2;[110565]=2;[110566]=2;[110567]=2;
			       [110568]=2;[110569]=2;[110573]=2;[110576]=2;[110596]=2;
			       [110609]=2;[110610]=2;[110611]=2;[110627]=2;[110628]=2;
			       [110633]=2;[110634]=2;[110635]=2;[110636]=2;[110639]=2;
			       [110642]=2;[110643]=2;[110651]=2;[110728]=2;[110752]=2;
			       [110993]=2;[111528]=2;[111621]=2;[111629]=2;[111699]=2;
			       [111745]=2;[113089]=2;[113139]=2;[113140]=2;[113351]=2;
			       [113354]=2;[116843]=2;[116847]=2;[119135]=2;[120342]=2;
			       [120344]=2;--大人2

			       [100938]=3;[100946]=3;[100947]=3;[110182]=3;[110784]=3;
			       [117211]=3;[117310]=3;[118128]=3;[118132]=3; --警衛3

			       [100135]=4;[110170]=4;[110177]=4;[110504]=4;[110505]=4;
			       [110507]=4;[110509]=4;[110510]=4;[110511]=4;[110512]=4;
		  	       [110513]=4;[110515]=4;[110516]=4;[110518]=4;[110519]=4;
			       [110520]=4;[111583]=4;[110585]=4;[110631]=4;[110688]=4;
			       [110774]=4;[110775]=4;[110776]=4;[110778]=4;[111432]=4;
			       [111606]=4;[113199]=4;[113339]=4;[113350]=4;[113352]=4;
			       [121398]=4;}--特殊4 






	local BuffID = 623486
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	local Num = ReadRoleValue( Target, EM_RoleValue_OrgID )
	local R=Rand(10)
	local A=Rand(9)

	if ReadRoleValue(TargetID(), EM_RoleValue_IsPlayer ) == 1 then--判斷嚇的是否為玩家
		ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_SPECIAL2]",0)
	else
		if CheckTable[Num] == 1 then --嚇小孩的狀況
			if BuffLv<4 then
				if A>=6 then 
					say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

				else 
					say(Target,"[SC_2012_GAME_NPCSAY2]")--嚇人成功,NPC說話
				end

				addbuff(Owner,623486,0,25)--嚇人成功，擁有25秒buff
				addbuff(Target,623487,0,25)--嚇人成功，NPC擁有35秒buff	

			else 
				ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_BUFFLV5]",0)--小孩的尖叫聲似乎太少了...
			
			end	
		end

		if CheckTable[Num] == 2 then --嚇大人的狀況
			if BuffLv==-1 then--無Buff的情況去嚇大人
				if R<9 then--嚇失敗
					say(Target,"[SC_2012_GAME_NPCHIT]")
					addbuff(Owner,507264,0,3)
					addbuff(Owner,623493,0,3)--處罰-恐懼3秒
					addbuff(Target,623487,0,20)
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end
					addbuff(Owner,623486,4,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,20)--嚇人，NPC擁有50秒buff
				end
				
			elseif BuffLv<=2 then--Buff小於3層的情況去嚇大人
				if R<4 then--嚇失敗
					CancelBuff(Owner,623486)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
					addbuff(Target,623487,0,20)
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end
					addbuff(Owner,623486,4,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,20)--嚇人，NPC擁有50秒buff
				end

			elseif BuffLv<4 then--Buff小於5層的情況去嚇大人
				if R<3 then--嚇失敗
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-3,25)
					addbuff(Target,623487,0,20)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
						end
					addbuff(Owner,623486,4,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,20)--嚇人，NPC擁有50秒buff
				end
			elseif BuffLv>=4 then--Buff大於5層的情況去嚇大人
				if R<2 then--嚇失敗
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-3,25)
					addbuff(Target,623487,0,20)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end

					addbuff(Owner,623486,4,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,20)--嚇人，NPC擁有50秒buff
				end
			end
		end

		if CheckTable[Num] == 3 then --嚇守衛的狀況
			if BuffLv==-1 then--無Buff去嚇守衛
				if R<9 then
					say(Target,"[SC_2012_GAME_NPCHIT3]")
					addbuff(Owner,623494,0,5)--處罰-定身5秒
					addbuff(Target,623487,0,20)--嚇人，NPC擁有50秒buff
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end

					addbuff(Owner,623486,9,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,15)--嚇人，NPC擁有60秒buff
				end
			elseif BuffLv<=6 then--Buff小於7層的情況去嚇守衛
				if R<7 then--嚇失敗
					CancelBuff(Owner,623486)
					addbuff(Target,623487,0,15)
					addbuff(Owner,623494,0,3)--處罰-定身3秒
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end

					addbuff(Owner,623486,9,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,15)--嚇人，NPC擁有60秒buff
				end
			elseif BuffLv<69 then--Buff小於70層的情況去嚇守衛
				if R<6 then--嚇失敗
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-7,25)--嚇失敗，buff-7層
					addbuff(Owner,623494,0,3)--處罰-定身3秒
					addbuff(Target,623487,0,15)
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--嚇人成功,NPC說話
					end

					addbuff(Owner,623486,9,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,15)--嚇人，NPC擁有60秒buff
				end

			elseif BuffLv>=69 then--Buff大於70層的情況去嚇守衛
				if R<5 then--嚇失敗
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-7,40)
					addbuff(Owner,623494,0,3)--處罰-定身3秒
					addbuff(Target,623487,0,15)
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--嚇人成功,NPC說話

					else 
						say(Target,"[SC_2012_GAME_NPCSAY4]")--嚇人成功,NPC說話
					end

					addbuff(Owner,623486,9,25)--嚇人成功，擁有25秒buff
					addbuff(Target,623487,0,15)--嚇人，NPC擁有60秒buff
				end
			end
		end

		if CheckTable[Num] == 4 then --嚇特殊物件的狀況
			ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_SPECIAL]",0)--嚇他沒有用
		end
	end
end





function sean_121398_checkBuff()--系統檢查NPC身上是否有被嚇的buff
	local Owner = OwnerID()
	local Target = TargetID()
	local R=Rand(10)

	if CheckBuff(Target,623487)==true then  --系統檢查NPC發現有BUFF	
		ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_BUFFWARNING]",0)--(紅字)告訴玩家不能短時間重複對目標施放
		return false--系統檢查NPC沒發現BUFF

	else 
		return true--玩家可以對NPC施放
	end
end





function sean_121398_BuffValue()--計算分數
	local Owner = OwnerID()
	local BuffID = 623486
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)

	if BuffLv ==-1 then
		ScriptMessage(Owner,Owner,3,"[SC_2012_GAME_BUFFSCORE]",0) 
	else
		ScriptMessage(Owner,Owner,3,"[SC_2012_GAME_BUFFSCORE2]",0) 
		CancelBuff( Owner , 623486 )
		addbuff(Owner,623495,BuffLv,600)
	end

	SetFlag(Owner,547026,1)
	setflag(Owner,547084,0)
end




function sean_121398_getgift()--給予玩家禮物
	local Owner=OwnerID()
	local Target=TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )

	local BuffID = 623495
	local Bufflv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC07]")
	if Score==-1 or checkflag(Owner,547084)==true then
		GiveBodyItem(  Owner, 724059 , 1 )	
		SetSpeakDetail( Owner , "[SC_2012_GAME_NPC08]")--安慰獎
	elseif Score<=29 then
		GiveBodyItem(Owner,209433,1)--給獎勵1
	elseif Score<=59 then
		GiveBodyItem(Owner,209433,2)--給獎勵2
	elseif Score<=99 then
		GiveBodyItem(Owner,209433,3)--給獎勵3
		GiveBodyItem(Owner,240525,3)
	else 
		GiveBodyItem(Owner,209433,3)--給獎勵4
		GiveBodyItem(Owner,240742,1)
	end

	setflag(Owner,547027,1)
	
	CancelBuff( Owner , 623495 )	
	Lua_Festival_10_All(Owner) 
	DesignLog( Owner , 1213981 , "Lv = "..Lv.." SubLv = "..SubLv )--回傳活動參與值
end




function sean_121398_Range()--活動範圍
	local Target = OwnerID()--玩家
	local Owner = TargetID()--npc
	BeginPlot( Target, "LuaN_miyon_action02", -1 )--讓npc頭上有活動圖示
	local Players = { }--參與活動的玩家列表

--	table.insert(Players, Owner)
	--say(Target, "start")
	while true do
		Sleep(1)
		local SearchTable = SearchRangePlayer( Target,  50 ) --NPC掃描附近50碼內的玩家
		--say(Owner, "1")
		for n= 0, table.getn(SearchTable) do
			--say(Owner, "2")
			if CheckBuff(SearchTable[n],623484 )==true then --如果玩家有活動Buff,則把玩家放入玩家列表
				if CheckFlag(SearchTable[n],547081) ==false then--檢查是否有重要物品
					--say(Owner, "3")
					setflag(SearchTable[n],547081,1)--給重要物品
					table.insert(Players, SearchTable[n])
				end
		--	else
		--		table.remove(SearchTable,n)
		--		setflag(Owner,547081,0)
			end
		end
		if table.getn(Players)>0 then
			local NewTable= {}
			for i= 1, table.getn(Players) do --掃描玩家與NPC之間的距離,超出範圍會警告
				--say ( Target, "i="..i)
				local distance = GetDistance( Target, Players[i] )
				--say ( Target, "5")
				
					if CheckBuff( Players[i] , 623484) == true and CheckFlag( Players[i] , 547027 ) == false then
						if distance > 1015  then
							--say(Players[i],i)
							ScriptMessage(Players[i],Players[i],1,"[SC_2012_GAME_BUFFWARNING3]",0)
							CancelBuff( Players[i] , 623484 )--玩家被取消資格	
							CancelBuff( Players[i] , 623486 )--玩家尖叫聲被取消
						--	CancelBuff( Players[i] , 623495 )--玩家總分被取消
							setflag(Players[i],547081,0)
							--say(Players[i],"test")
							setflag(Players[i],547083,1)
						else
							table.insert(NewTable, Players[i])
							if distance >= 965 and distance < 1015 then--玩家與NPC距離880碼,警告玩家
								--say( Owner,"6")
								ScriptMessage(Players[i],Players[i],1,"[SC_2012_GAME_BUFFWARNING2]",0)--警告玩家趕快回去否則會取消資格	
							end
						end
					end
				
			end
			Players = NewTable
		end	
	end
end

-----------------------------------------------------以下為測試專用指令-----------------------------------------------------

function sean_replay()--重玩一次
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	CancelBuff( Owner , 623486 )
	CancelBuff( Owner , 623495 )
	setflag(Owner,547026,0)
	setflag(Owner,547027,0)
	setflag(Owner,547081,0)
	setflag(Owner,547083,0)
	setflag(Owner,547084,0)
end

function sean_buff0()----沒有分數
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547026,1)
	setflag(Owner,547081,1)
end

function sean_buff(LV)----活動分數，請將所需測試BUFF等級填入LV的位置
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547026,1)
	setflag(Owner,547081,1)
	addbuff(Owner,623495,LV,600)
end