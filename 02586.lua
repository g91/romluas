function Cl_Show_Stage()
	local Show_ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( Show_ctarlAI , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Show_ctarlAI , EM_RoleValue_PID )
	local CrackID_Door = ReadRoleValue ( ctarlAI , EM_RoleValue_Register2 )
	local Npc_Table = {}
		Npc_Table["Big_Magic"] = 120216	--卡爾穆斯
		Npc_Table["Magic"] = 120101		--賢者之眼法師
		Npc_Table["Police"] = 120186		--120186
		Npc_Table["Big_PolicePolice"] = 120188--巴納吉
	local Show_Npc = {}
	local Police_Npc = {}
	local Magic_Npc = {}
	local Rand_Time = 0
	local FlagObjID = 781060
	local Dir_Table = {}
	local ShowTime_1 = 0
	local ShowTime_2 = 15
	local ShowTime_3 = 3
	local Rand = DW_Rand(30)  ---取隨機TABLE的位置
	local Rand_2 = DW_Rand(10)  ---取隨機TABLE的位置
	local Rand_3 = DW_Rand(10)  ---取隨機TABLE的位置
	local Rand_Npc = DW_Rand(4)  ---取隨機TABLE的位置
	local Rand_Flag = 0
	local CastSpell = 0
	local PlayMotion_Flag = 0
	local MonsterID = 106582
	local Monster = 0
	local CastSpell_Light = 0
	local Light_Ball = 0
	local Light_BallID = 120198
	local Light_BallID_2 = 120199
	local Light_Ball_3 = 0
	local Light_BallID_3 = 120204
	local Old_Magic_Npc = 0
	local Old_MagicID = 120201
	local Eric_Npc = 0
	local Eric_NpcID = 120205
	local HiDayton = 0
	local HiDaytonID = 120206
	local DelNpc_Table = {}   --
	local String_Table = {}
		String_Table[1] = "[SC_WBP3_SHOWNPC_01]" ---
		String_Table[2] = "[SC_WBP3_SHOWNPC_02]" ---法師: XXX首席大法師，我們現在該怎麼辦?
		String_Table[3] = "[SC_WBP3_SHOWNPC_03]" ----大法師: 只能先想辦法將其封印起來，但是封印的方式還不明朗
		String_Table[4] = "[SC_WBP3_SHOWNPC_04]" ----大法師: 畢竟我們對亂渦之地的了解還不多，不過黑石晶片的共振力量
		String_Table[5] = "[SC_WBP3_SHOWNPC_05]" ----大法師: 我們已經掌握7-8成，就等長老法師將最後的封印之謎解開
		String_Table[6] = "[SC_WBP3_SHOWNPC_06]" ----法師: 那麼我們現在能做的是.....?
		String_Table[7] = "[SC_WBP3_SHOWNPC_07]" ----大法師:先想辦法不要讓裂縫在繼續膨脹下去，否則亂渦之地內的魔物，會不斷湧出
		String_Table[8] = "[SC_WBP3_SHOWNPC_08]" ----法師: 不過周圍依然有許多受到的民眾，在這邊施展符文之力，居民們不會受到影響嗎?
		String_Table[9] = "[SC_WBP3_SHOWNPC_09]" ----警備隊隊長: XXX首席大法師，不好意思，我們趕到了
		String_Table[10] = "[SC_WBP3_SHOWNPC_10]"  --大法師: 沒關係，整個凡瑞娜絲城現正陷入一片恐慌，我了解你們警備隊人手不足的問題
		String_Table[11] = "[SC_WBP3_SHOWNPC_11]"  ---警備隊隊長: 目前我手上的人手就剩下這裡，我們現在能幫上什麼忙呢?
		String_Table[12] = "[SC_WBP3_SHOWNPC_12]"   ---大法師: 那請你們協助我們，不要再讓凡瑞娜絲城的居民靠近這裡
		String_Table[13] = "[SC_WBP3_SHOWNPC_13]"   ---大法師: 而且現在裂縫持續膨脹，或許等等會有亂渦之地的魔物趁機從裂縫中逃出
		String_Table[14] = "[SC_WBP3_SHOWNPC_14]"   ---大法師: 屆時還得請你們保護居民
		String_Table[15] = "[SC_WBP3_SHOWNPC_15]"   ---警備隊隊長: 好的，我們會盡力保護你們的安全以及附近居民的安全
		String_Table[16] = "[SC_WBP3_SHOWNPC_16]"   ---大法師:那就麻煩你們了
		String_Table[17] = "[SC_WBP3_SHOWNPC_17]"   ---警備隊隊長:所有人注意到這邊!!(講話動作)
		String_Table[18] = "[SC_WBP3_SHOWNPC_18]"   ---警備隊隊長:待會我們負責保護賢者之眼法師的安全
		String_Table[19] = "[SC_WBP3_SHOWNPC_19]"   ---警備隊隊長:如果有民眾靠近的話，為了安全起見，進行驅離的動作
		String_Table[20] = "[SC_WBP3_SHOWNPC_20]"   ---警備隊隊長:所有人都了解了嗎?(指揮前進的動作)
		String_Table[21] = "[SC_WBP3_SHOWNPC_21]"   ---隊員:都了解了(敬禮動作)
		String_Table[22] = "[SC_WBP3_SHOWNPC_22]"   ---警備隊隊長:那所有人各自到自己的崗位上，凡瑞娜絲城的安危就交給你們了
		String_Table[23] = "[SC_WBP3_SHOWNPC_23]"   ---隊員:是!!
		String_Table[24] = "[SC_WBP3_SHOWNPC_24]"   ---大法師:裂縫持續擴張著，我們先試著讓裂縫停止擴張
		String_Table[25] = "[SC_WBP3_SHOWNPC_25]"   ---大法師:準備好，切記要心如止水
		String_Table[26] = "[SC_WBP3_SHOWNPC_26]"   ---法師:準備好了!
		String_Table[27] = "[SC_WBP3_SHOWNPC_27]"   ---大法師:還是不足以阻止裂縫擴張嗎?
		String_Table[28] = "[SC_WBP3_SHOWNPC_28]"   ---大法師:休息一會兒，等等再來過
		String_Table[29] = "[SC_WBP3_SHOWNPC_29]"   ---法師:我好多了，我們繼續吧
		String_Table[30] = "[SC_WBP3_SHOWNPC_30]"   ---法師:啊!一一一一一一
		String_Table[31] = "[SC_WBP3_SHOWNPC_31]"   ---黃字廣播:裂縫突然快速膨脹，一股邪惡的能量散發出來
		String_Table[32] = "[SC_WBP3_SHOWNPC_32]"   ---警備隊長:危險!!
		String_Table[33] = "[SC_WBP3_SHOWNPC_33]"   ---警備隊長:天那!這是什麼鬼東西
		String_Table[34] = "[SC_WBP3_SHOWNPC_34]"   ---警備隊長:你們沒事吧?
		String_Table[35] = "[SC_WBP3_SHOWNPC_35]"   ---法師:___首席!!!
		String_Table[36] = "[SC_WBP3_SHOWNPC_36]"   ---警備隊長:___首席怎麼了
		String_Table[37] = "[SC_WBP3_SHOWNPC_37]"   ---法師:___首席尚有氣息，他應該只是昏過去了
		String_Table[38] = "[SC_WBP3_SHOWNPC_38]"   ---警備隊長:來一個將___首席先帶下去休息
		String_Table[39] = "[SC_WBP3_SHOWNPC_39]"   ---警備隊長:這裂縫似乎又變得更大了，這下越來越危險了
		String_Table[40] = "[SC_WBP3_SHOWNPC_40]"   ---法師:剛才所射下的結界也開始崩壞
		String_Table[41] = "[SC_WBP3_SHOWNPC_41]"   ---法師:這下該如何是好，真是令人頭疼...
		String_Table[42] = "[SC_WBP3_SHOWNPC_42]"   ---古魔法文研究者:黑水裂縫已經無法關閉了，使用現有的符文技術
		String_Table[43] = "[SC_WBP3_SHOWNPC_43]"   ---古魔法文研究者:已經無法讓黑水裂縫關閉起來
		String_Table[44] = "[SC_WBP3_SHOWNPC_44]"   ---警備隊長:那這樣該怎麼辦，總不能讓他一直這樣下去
		String_Table[45] = "[SC_WBP3_SHOWNPC_45]"   ---警備隊長:總是得想想辦法的呀
		String_Table[46] = "[SC_WBP3_SHOWNPC_46]"   ---古魔法文研究者:我現在要重新架構新的符文法陣，讓他穩定下來
		String_Table[47] = "[SC_WBP3_SHOWNPC_47]"   ---古魔法文研究者:但是這些需要你們的協助
		String_Table[48] = "[SC_WBP3_SHOWNPC_48]"   ---法師:好的，我們會盡力的
		String_Table[49] = "[SC_WBP3_SHOWNPC_49]"   ---古魔法文研究者:但是光是這樣只是穩定下來是不夠的，需要有人進入裂縫內，阻止最深層的力量來源
		String_Table[50] = "[SC_WBP3_SHOWNPC_50]"   ---警備隊長:最深層的力量來源??
		String_Table[51] = "[SC_WBP3_SHOWNPC_51]"   ---古魔法文研究者:象徵貪婪與恐懼的帕洛格斯，文獻上的記載沒錯的話，應該最深層的力量來源就是他
		String_Table[52] = "[SC_WBP3_SHOWNPC_52]"   ---古魔法文研究者:我先將裂縫裡通往異空間的通道穩定下來，好讓你們可以平安的通過
		String_Table[53] = "[SC_WBP3_SHOWNPC_53]"   ---古魔法文研究者:這段時間，你就盡快招集人馬，進入通道內，削弱"帕洛格斯"
		String_Table[54] = "[SC_WBP3_SHOWNPC_54]"   ---警備隊長:好，我這就馬上去，你們千萬要小心
		String_Table[55] = "[SC_WBP3_SHOWNPC_55]"   ---好吧，讓我們開始吧
		String_Table[56] = "[SC_WBP3_SHOWNPC_56]"   ---黑暗的力量漸漸穩定下，但黑暗的深處又出現了新的干擾
		String_Table[57] = "[SC_WBP3_SHOWNPC_57]"   ---應該可以了，通道已經成功開啟，但是還是要持續觀察著
		String_Table[58] = "[SC_WBP3_SHOWNPC_58]"   ---大長老，我人員已經招集好了
		String_Table[59] = "[SC_WBP3_SHOWNPC_59]"   ---除了艾立克研究團，以及海堤頓工匠團以外，還會有從各地來的冒險者們協助我們
		String_Table[60] = "[SC_WBP3_SHOWNPC_60]"   ---我們隨時都可以出發
		String_Table[61] = "[SC_WBP3_SHOWNPC_61]"   ---那待會你們與___隊長一同進入維持亂渦之地與外部連結，必要的時候協助他們撤退
		String_Table[62] = "[SC_WBP3_SHOWNPC_62]"   ---那我會在外部維持通道的穩定，好讓你們可以安全的返回
		String_Table[63] = "[SC_WBP3_SHOWNPC_63]"   ---了解了
		String_Table[64] = "[SC_WBP3_SHOWNPC_64]"   ---___隊長，我們艾力克研究團已經準備好了
		String_Table[65] = "[SC_WBP3_SHOWNPC_65]"   ---___隊長，海堤盾工匠團也準備好了
		String_Table[66] = "[SC_WBP3_SHOWNPC_66]"   ---警備隊的注意
		String_Table[67] = "[SC_WBP3_SHOWNPC_67]"   ---待會跟我一同進入亂渦之地，裡面非常危險
		String_Table[68] = "[SC_WBP3_SHOWNPC_68]"   ---所以我讓你們自己決定，有誰要去的?
		String_Table[69] = "[SC_WBP3_SHOWNPC_69]"   ---___隊長，我們可以自己回來
		String_Table[70] = "[SC_WBP3_SHOWNPC_70]"   ---好!那我們準備出發
		String_Table[71] = "[SC_WBP3_SHOWNPC_71]"   ---___長老，我們隨時可以動身了
		String_Table[72] = "[SC_WBP3_SHOWNPC_72]"   ---好，那你們先進入建立防線，不要讓亂渦之地的魔物穿過通道
		String_Table[73] = "[SC_WBP3_SHOWNPC_73]"   ---裡面的"帕洛格斯"就讓冒險者們去，切記凡事小心
		String_Table[74] = "[SC_WBP3_SHOWNPC_74]"   ---好，那我們就先出發了!!
	--產生大法師
	local Big_Magic_Npc = cl_ObjShowNpc( Npc_Table["Big_Magic"],FlagObjID,50)
		Cl_MoveToFlag( Big_Magic_Npc , FlagObjID , 60 , 0 , 1 )
		say ( Big_Magic_Npc , String_Table[1] )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	--記錄面向？
	Dir_Table[1] = ReadRoleValue ( Big_Magic_Npc , EM_RoleValue_Dir )
	sleep ( 30 )
	for i = 1 , 4 , 1 do
		--產生四隻賢者之眼法師並記錄起來
		Magic_Npc[i] = cl_ObjShowNpc( Npc_Table["Magic"],FlagObjID,50+i)
		if i == 1 then
			--第一隻走向前
			Cl_MoveToFlag( Magic_Npc[i] , FlagObjID , 60+i , 0 , 1 )
		else
			--其它三隻移動到旗子
			CallPlot( Magic_Npc[i], "Cl_MoveToFlag_for", 60+i )
		end
	end
	
		say ( Magic_Npc[1] , String_Table[2] )
		PlayMotion ( Magic_Npc[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		AdjustFaceDir( Big_Magic_Npc , Magic_Npc[1] , 0 )
		sleep ( 30 )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )

	for i = 3 , 5 , 1 do
		say (Big_Magic_Npc , String_Table[i] )
		sleep ( 40 )
	end

		say (Magic_Npc[1] , String_Table[6] )
		PlayMotion ( Magic_Npc[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep ( 30 )
		say (Big_Magic_Npc ,String_Table[7] )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep ( 30 )
		say (Magic_Npc[1] , String_Table[8])
		sleep ( 40 )

	for i = 1 , 4 , 1 do
		--產生四隻守衛向前
		Police_Npc[i] = cl_ObjShowNpc( Npc_Table["Police"],FlagObjID,50+i)
		CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 70+i )
	end

	sleep ( 10 )
		--產生巴吉納
	local Big_Police_Npc = cl_ObjShowNpc( Npc_Table["Big_PolicePolice"],FlagObjID,50)
		Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 70 , 0 , 0 )
		say ( Big_Police_Npc , String_Table[9] )
		AdjustFaceDir( Big_Magic_Npc , Big_Police_Npc , 0 )
		sleep ( 30 )
	for i = 1 , 4 , 1 do
		Dir_Table[i+1] = ReadRoleValue ( Magic_Npc[i] , EM_RoleValue_Dir )
		AdjustFaceDir( Magic_Npc[i] , Big_Police_Npc , 0 )
	end
		sleep ( 20 )
		say ( Big_Magic_Npc ,String_Table[10] )
		sleep ( 30 )
		say ( Big_Police_Npc ,String_Table[11] )
		sleep ( 30 )
	for i = 12 , 14 , 1 do
		say ( Big_Magic_Npc ,String_Table[i] )
		sleep ( 30 )
	end
		say ( Big_Police_Npc ,String_Table[15] )
		sleep ( 30 )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		say ( Big_Magic_Npc ,String_Table[16] )
		sleep ( 30 )
		SetDir( Big_Magic_Npc , Dir_Table[1] )
	for i = 1 , 4 , 1 do
		SetDir( Magic_Npc[i] , Dir_Table[i+1] )
	end
		sleep ( 10 )
		SetDir( Big_Police_Npc , Dir_Table[1]-180 )
		sleep ( 20 )
	for i = 17 , 20 , 1 do
		if i == 17 then
			PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			sleep ( 10 )
			for i = 1 , 4 , 1 do
				AdjustFaceDir( Police_Npc[i] , Big_Police_Npc , 0 )
			end
		elseif i == 20 then
			PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_POINT )
		end
		say ( Big_Police_Npc ,String_Table[i] )
		sleep ( 30 )
	end
	for i = 1 , 4 , 1 do
		PlayMotion ( Police_Npc[i] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		say ( Police_Npc[i] ,String_Table[21] )
	end
		sleep ( 20 )
		say ( Big_Police_Npc ,String_Table[22] )
		PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		sleep ( 20 )
	for i = 1 , 4 , 1 do
		say ( Police_Npc[i] ,String_Table[23] )
	end
	for i = 1 , 4 , 1 do
		CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 80+i )
	end
	--
	while 1 do
		sleep ( 10 )
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			ShowTime_1 = ShowTime_1 + 1
			ShowTime_2 = ShowTime_2 + 1
			if ShowTime_1 >= Rand + 15 then
				Rand_Flag = DW_Rand(4)
				Cl_Police_Npc_Expelled(FlagObjID,Rand_Flag,Police_Npc[Rand_Flag])
				Rand = DW_Rand(30)  ---取隨機TABLE的位置
				ShowTime_1 = 0
			end
			if ShowTime_2 >= Rand_2 +15 then
				if CastSpell == 0 then
					say ( Big_Magic_Npc ,String_Table[24] )
					CastSpell = 1
				elseif CastSpell == 1 then
					say ( Magic_Npc[Rand_Npc]  ,String_Table[29] )
					PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_END )
					sleep ( 10 )
				end
				for i = 1 , 5 , 1 do
					if i == 5 then
						AdjustFaceDir( Big_Magic_Npc , CrackID_Door , 0 )
					else
						AdjustFaceDir( Magic_Npc[i] , CrackID_Door , 0 )
					end
				end
				sleep ( 20 )
				say ( Big_Magic_Npc ,String_Table[25] )
				sleep ( 10 )
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] ,String_Table[26] )
				end
				sleep ( 10 )
				for i = 1 , 5 , 1 do
					if i == 5 then
						CastSpelllv ( Big_Magic_Npc , CrackID_Door , 498925 , 0 ) 
						Addbuff (  CrackID_Door , 621746 , 0 , 3 ) 
					else
						CastSpelllv ( Magic_Npc[i] , CrackID_Door , 498925 , 0 ) 
					end
				end
				if CastSpell_Light == 0 then
					Light_Ball = Cl_CreateObjByFlag( Light_BallID , FlagObjID , 10 , RoomID ) ---表演物件用
					CastSpell_Light = 1
				end				
				sleep ( 40 )
				Rand_Npc = DW_Rand(4)
				CastSpelllv ( Magic_Npc[Rand_Npc] , Magic_Npc[Rand_Npc] , 498923 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
				say ( Magic_Npc[Rand_Npc] , String_Table[30] )
				PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
				sleep ( 10 )
				SetIdleMotion( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_LOOP )----------------------維持動作  589651
				for i = 1 , 5 , 1 do
					if i ~= Rand_Npc and i ~= 5 then
						AdjustFaceDir( Magic_Npc[i] , Magic_Npc[Rand_Npc] , 0 )
					elseif i == 5 then
						AdjustFaceDir( Big_Magic_Npc , Magic_Npc[Rand_Npc] , 0 )
					end
				end
				say ( Big_Magic_Npc ,String_Table[27] )
				sleep ( 20 )
				PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				say ( Big_Magic_Npc ,String_Table[28] )
				Rand_2 = DW_Rand(10)  ---取隨機TABLE的位置
				ShowTime_2 = 0
			end
		elseif  ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			if PlayMotion_Flag == 0 then
				ScriptMessage( ctarlAI , -1 , 2 , String_Table[31] , 2 ) 
				PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_END )
				Addbuff (  CrackID_Door , 621745 , 0 , -1 ) 
				PlayMotion_Flag = 1
				Monster = cl_ObjShowNpc( MonsterID , FlagObjID , 10 ) 
				CastSpelllv ( Monster , Monster , 498922 , 0 ) 
				for i = 1 , 4 , 1 do
					Addbuff (  Magic_Npc[i] , 621743 , 0 , 1 ) 
					say ( Magic_Npc[i] , String_Table[30] )
				end
				PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
				sleep ( 5 )
				SetIdleMotion( Big_Magic_Npc , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )----------------------維持動作  589651
				delobj ( Light_Ball )
				Cl_MoveToFlag( Monster , FlagObjID , 100 , 0 , 0 )
				say ( Big_Police_Npc , String_Table[32] )
				CastSpelllv ( Big_Police_Npc , Monster , 498921 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
				sleep ( 10 )
				killid ( Big_Police_Npc , Monster )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , Big_Magic_Npc , 0 )
					say ( Magic_Npc[i] , String_Table[35] )
				end
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[33] )
				sleep ( 30 )
				AdjustFaceDir( Big_Police_Npc , Big_Magic_Npc , 0 )
				say ( Big_Police_Npc , String_Table[34] )
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[36] )
				sleep ( 30 )
				say ( Magic_Npc[1] , String_Table[37] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[38] )
				sleep ( 20 )
				Cl_MoveToFlag( Police_Npc[1] , FlagObjID , 101 , 0 , 0 )
				PlayMotion ( Police_Npc[1] , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
				sleep ( 20 )
				delobj ( Big_Magic_Npc )
				PlayMotion ( Police_Npc[1] , ruFUSION_ACTORSTATE_CROUCH_END )
				sleep ( 10 )
				Cl_MoveToFlag( Police_Npc[1] , FlagObjID , 102 , 0 , 0 )
				delobj ( Police_Npc[1] )
				table.remove ( Police_Npc , 1 )
				say ( Big_Police_Npc , String_Table[39] )
				AdjustFaceDir(  Big_Police_Npc , CrackID_Door , 0 )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , CrackID_Door , 0 )
				end
				sleep ( 30 )
				say ( Magic_Npc[1] , String_Table[40] )
				sleep ( 20 )
				say ( Magic_Npc[1] , String_Table[41] )
				sleep ( 20 )
				Old_Magic_Npc = cl_ObjShowNpc( Old_MagicID , FlagObjID , 102 )
				say ( Old_Magic_Npc , String_Table[42] )
				sleep ( 20 )
				say ( Old_Magic_Npc , String_Table[43] )
				Cl_MoveToFlag( Old_Magic_Npc , FlagObjID , 60 , 0 , 1 )
				AdjustFaceDir(  Old_Magic_Npc , Big_Police_Npc , 0 )
				say ( Big_Police_Npc , String_Table[44] )
				AdjustFaceDir(  Big_Police_Npc , Old_Magic_Npc , 0 )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[45] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[46] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[47] )
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] , String_Table[48] )
				end
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[49] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[50] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[51] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[52] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[53] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[54] )
				sleep ( 20 )
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 50 , 0 , 0 )
				delobj ( Big_Police_Npc )
				AdjustFaceDir(  Old_Magic_Npc , CrackID_Door , 0 )
				say ( Old_Magic_Npc , String_Table[55] )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , CrackID_Door , 0 )
				end
			end
			ShowTime_3 = ShowTime_3 + 1
			if ShowTime_3 >= 3 then
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
				for i = 1 , 4 , 1 do
					CastSpelllv ( Magic_Npc[i] , Magic_Npc[i] , 498925 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
				end
				if CastSpell_Light == 1 then
					Light_Ball = Cl_CreateObjByFlag( Light_BallID_2 , FlagObjID , 10 , RoomID ) ---表演物件用
					CastSpell_Light = 2
				end
				ShowTime_3 = 0
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then   ---使用其標110以後
			if PlayMotion_Flag == 1 then
				Addbuff (  CrackID_Door , 621744 , 0 , -1 )
				ScriptMessage( CrackID_Door , -1 , 2 , String_Table[56] , 2 ) ----開場說話
				Big_Police_Npc = cl_ObjShowNpc( Npc_Table["Big_PolicePolice"],FlagObjID,110)
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 111 , 0 , 0 )
				say ( Big_Police_Npc , String_Table[57] )
				AdjustFaceDir(  Old_Magic_Npc , Big_Police_Npc , 0 )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , Big_Police_Npc , 0 )
				end
				sleep ( 20 )
				for i = 58 , 60 , 1 do
					say ( Big_Police_Npc , String_Table[i] )
					sleep ( 20 )
				end
				AdjustFaceDir(  Old_Magic_Npc , Magic_Npc[1] , 0 )
				for i = 61 , 62 , 1 do
					say ( Old_Magic_Npc , String_Table[i] )
					sleep ( 20 )
				end
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] , String_Table[63] )
				end
				sleep ( 20 )
				Eric_Npc = cl_ObjShowNpc( Eric_NpcID,FlagObjID,120)
				HiDayton = cl_ObjShowNpc( HiDaytonID,FlagObjID,130)
				Cl_MoveToFlag( Eric_Npc , FlagObjID , 121 , 0 , 1 )
				Cl_MoveToFlag( HiDayton , FlagObjID , 131 , 0 , 1 )
				say ( Eric_Npc , String_Table[64] )
				sleep ( 10 )
				say ( HiDayton , String_Table[65] )
				sleep ( 20 )
				AdjustFaceDir(  Big_Police_Npc , Police_Npc[1] , 0 )
				say ( Big_Police_Npc , String_Table[66] )
				for i = 1 , 3 , 1 do
					AdjustFaceDir(  Police_Npc[i] , Big_Police_Npc , 0 )
				end
				sleep ( 20 )
				for i = 67 , 68 , 1 do
					say ( Big_Police_Npc , String_Table[i] )
					sleep ( 20 )
				end
				say ( Police_Npc[3] , String_Table[69] )
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[70] )
				sleep ( 20 )
				AdjustFaceDir(  Big_Police_Npc , Old_Magic_Npc , 0 )
				sleep ( 10 )
				say ( Big_Police_Npc , String_Table[71] )
				sleep ( 20 )
				for i = 72 , 73 , 1 do
					say ( Old_Magic_Npc , String_Table[i] )
					sleep ( 20 )
				end
				say ( Big_Police_Npc ,  String_Table[74] )
				AdjustFaceDir(  Old_Magic_Npc , CrackID_Door , 0 )
				sleep ( 20 )
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 10 , 0 , 0 )
				delobj ( Big_Police_Npc )
				for i = 1 , 3 , 1 do
					CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 10 )
					delobj ( Police_Npc[i] )
				end
				sleep ( 10 )
				for i = 1 , 4 , 1 do
					CallPlot( Magic_Npc[i], "Cl_MoveToFlag_for", 10 )
					delobj ( Magic_Npc[i] )
				end
				Cl_MoveToFlag( Eric_Npc , FlagObjID , 10 , 0 , 0 )
				delobj ( Eric_Npc )
				Cl_MoveToFlag( HiDayton , FlagObjID , 10 , 0 , 0 )
				delobj ( HiDayton )
				PlayMotion_Flag = 2
			end
			ShowTime_3 = ShowTime_3 + 1
			if ShowTime_3 >= 3 then
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) 
				ShowTime_3 = 0
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 4 then
			delobj ( Light_Ball )
			delobj ( Old_Magic_Npc )
			return	--結束這個function
--			ShowTime_3 = ShowTime_3 + 1
--			if ShowTime_3 >= 3 then
--				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
--				ShowTime_3 = 0
--			end
--		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 5 then
--			delobj ( Light_Ball )
--			delobj ( Old_Magic_Npc )
		end
	end
end