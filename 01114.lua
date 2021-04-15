function LuaS_111770_0()
	LoadQuestOption(OwnerID())

	if CheckAcceptQuest( OwnerID() , 421581 ) == true and CheckFlag( OwnerID() , 542213 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_1",0) --塔塔莎，我要抽一支籤。
	elseif CheckAcceptQuest( OwnerID() , 421583 ) == true and CheckFlag( OwnerID() , 542289 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_2",0) --塔塔莎，我要抽一支籤。
	elseif CheckAcceptQuest( OwnerID() , 421585 ) == true and CheckFlag( OwnerID() , 542290 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_3",0) --塔塔莎，我要抽一支籤。
	elseif CheckAcceptQuest( OwnerID() , 421587 ) == true and CheckFlag( OwnerID() , 542291 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_0]","LuaS_111770_4",0) --塔塔莎，我要抽一支籤。
	end

	if CheckAcceptQuest( OwnerID() , 421589 ) == true and CheckFlag( OwnerID() , 542227 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111770_11]","LuaS_111770_5",0) --不氣了！我原諒妳了～
	end
end

function LuaS_111770_1()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542213 ) == false then
		SetFlag( OwnerID() , 542213 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_2()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542289 ) == false then
		SetFlag( OwnerID() , 542289 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_3()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542290 ) == false then
		SetFlag( OwnerID() , 542290 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_4()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542291 ) == false then
		SetFlag( OwnerID() , 542291 , 1 )
		local Num = Rand(100)
		Num = Num - (math.floor(Num/10)*10) + 1
		AddBuff(OwnerID() , 502490 , Num , -1 )
		GiveBodyItem( OwnerID() , Card[Num] , 1)
	end
end

function LuaS_111770_5()
	CloseSpeak( OwnerID() )
	local Card = {[1] = 203531 , [2] = 203532 , [3] = 203533 , [4] = 203534 , [5] = 203535 , [6] = 203537 , [7] = 203538 , [8] = 203539 , [9] = 203540 , [10] = 203541 }
	if CheckFlag( OwnerID() , 542227 ) == false then
		SetFlag( OwnerID() , 542227 , 1 )
	end
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
end

function LuaQ_421582_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111771 then
		Tell( OwnerID() , TargetID() , "[SC_542214]" ) 
		--在「寒霜死神」巴奈齊亞斯的頭被砍下來後，又一個魔族帝國被併吞了。然而，魔族互相爭奪權力與領土的戰爭，依舊在這塊大陸的各處展開著。
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111772 then
		Tell( OwnerID() , TargetID() , "[SC_542215]" ) 
		--今天，瑪拉瑞克‧鑄風終於決定執行我們先前的討論，打造一把可以終止紛亂的符文劍。
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111773 then
		Tell( OwnerID() , TargetID() , "[SC_542216]" ) 
		--擁有混亂能量的禁忌符文終於到手了，這是尤瑪特失去一隻手臂所換來的，不過無妨，瑪拉瑞克會為他裝上另一隻更好的，由符文打造的手臂。
	end
	return true
end

function LuaQ_421584_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111774 then
		Tell( OwnerID() , TargetID() , "[SC_542217]" ) 
		--今天，我們將擁有巨大力量的符文融入劍中，以我們的同伴，法穆‧荷茲的鮮血作為媒介，他將會驕傲自己能與這把偉大的符文劍，永遠地合為一體。
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111775 then
		Tell( OwnerID() , TargetID() , "[SC_542218]" ) 
		--劍的過程遇到瓶頸……符文劍強烈排斥著禁忌的「精神符文」能量，對於這個排斥現象，我們束手無策。
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111776 then
		Tell( OwnerID() , TargetID() , "[SC_542219]" ) 
		--瑪拉瑞克‧鑄風帶回來10顆新鮮的頭顱---來自那群軟弱的普通人類，他將頭顱在地上排成法陣，終於，才使得符文劍不再排斥「精神符文」的能量。
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111777 then
		Tell( OwnerID() , TargetID() , "[SC_542220]" ) 
		--可怕的事情發生了！造劍的事情不知為何，被鮮血之王安德薩斯發現......喬瑞德犧牲了自己的生命，才得以在鮮血之王的拷問下，保住了造劍地點在何處的秘密。
	end
	return true
end

function LuaQ_421586_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111778 then
		Tell( OwnerID() , TargetID() , "[SC_542221]" ) 
		--瑪拉瑞克‧鑄風決定將符文劍移至更隱密的地點繼續鑄造，並佈置許多造劍的場所來混淆，以躲避鮮血之王安德薩斯的追殺。
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111779 then
		Tell( OwnerID() , TargetID() , "[SC_542222]" ) 
		--我們在北方的據點被安德薩斯發現了，殘忍的魔王將我們同伴身上的符文力量全部奪走，並留下他們空洞的軀殼，懸掛在雪海的最高處，警惕著所有的魔族，大家都慌了......
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111781 then
		Tell( OwnerID() , TargetID() , "[SC_542223]" ) 
		--瑪拉瑞克‧鑄風決定加快鑄劍的速度，目前，唯有將符文劍獻給另一名與安德薩斯對立的魔將，才有可能保護我們逃離安德薩斯恐怖的追殺。
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	end
	return true
end

function LuaQ_421588_AfterClick()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111782 then
		Tell( OwnerID() , TargetID() , "[SC_542224]" ) 
		--在我們的同伴，利澤‧喬森抱著最後一顆禁忌符文，投身跳入鑄劍熔爐之後，擁有所有禁忌符文力量的符文劍終於誕生了！瑪拉瑞克‧鑄風用他沙啞的聲音，唸出了這個爾後所有的人皆會聞風喪膽的名字-符文劍‧瑪拉瑞克。
		BeginPlot( TargetID() , "LuaQ_Zone5_Epic_Zo" , 0 )
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111783 then
		Tell( OwnerID() , TargetID() , "[SC_542225]" ) 
		--「符文劍‧瑪拉瑞克」雖然誕生，卻依舊處於沈睡之中，必須有辦法來喚醒他那還被封印著的強大力量，巫女緹亞使用占卜告訴大家唯一的喚醒方法：「想要駕馭符文劍‧瑪拉瑞克的人，必須使用對自己而言最重要的人的鮮血，才能喚醒它沈睡的力量......」
	elseif ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111784 then
		Tell( OwnerID() , TargetID() , "[SC_542226]" ) 
		--安德薩斯最後還是找到我們了！他全身沾滿了我們同伴的鮮血，朝我走來……在我斷氣之前，我必須將我所看到的，清楚的記載下來，安德薩斯拿起了那把劍，而他身旁的魔女塔塔莎，則建議著鮮血之王，用她的鮮血來喚醒符文劍‧屠風者‧瑪拉瑞克...
		BeginPlot( TargetID() , "LuaQ_Tatasa_Curse_Result" , 0 )
	end
	return true
end

function LuaQ_Tatasa_Curse_Result()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 10 )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MonsterID = {[111772] = 100268 , [111776] = 100267 , [111781] = 100574 , [111784] = 100367 }
	local Monster = LuaFunc_CreateObjbyObj(MonsterID[OrgID] , OwnerID() )

	local Buff = {  [1] = 501016 ,[2] = 501007 ,[3] = 502494, [4] = 502495, [5] = 502496,
			[6] = 500918 ,[7] = 502497 ,[8] = 502499 ,[9] = 501011, [10] = 502498 }
	local LV   = {  [1] = 1 ,[2] = 900 ,[3] = 4, [4] = 4,[5] = 4,[6] = 1, [7] = 4,[8] = 49 ,[9] = 74, [10] = 4 }

	local CursePos = Lua_BuffPosSearch( TargetID() , 502490 )
	local Num =  BuffInfo( TargetID(), CursePos , EM_BuffInfoType_Power )

	if AddBuff( TargetID() , Buff[Num] , LV[Num] , 60 ) then
		CancelBuff( TargetID() , 502490 )
	end
	BeginPlot( Monster , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	SetAttack( Monster , TargetID() )
	while 1 do
		if CheckID( Monster ) == False or ReadRoleValue( Monster ,EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Monster ,EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(60)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaQ_Zone5_Epic_Zo()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 10 )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MonsterID = {[111774] = 101453 , [111778] = 101454 ,[111782] = 101455 }
	local Monster = LuaFunc_CreateObjbyObj(MonsterID[OrgID] , OwnerID() )
	BeginPlot( Monster , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	SetAttack( Monster , TargetID() )
	while 1 do
		if CheckID( Monster ) == False or ReadRoleValue( Monster ,EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Monster ,EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(60)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaQ_Zone5_Epic_NPCDead()
	LuaFunc_Obj_Suicide(150)
end