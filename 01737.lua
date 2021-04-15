function LuaI_114495_0()
	local Count = 0
	local Nick =  Lua_CreateObjByDir( OwnerID() , 114496 , 20 , 0 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	SetModeEX( Nick , EM_SetModeType_Mark , false )
	AddToPartition( Nick , RoomID )
	SetPlot( OwnerID() , "touch" , "LuaI_114495_1" , 30 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Nick )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
	SetIdleMotion( Nick,ruFUSION_MIME_SIT_CHAIR_LOOP)		
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
			if Count == 4 then
				Yell( OwnerID() , "[SC_422966_0]" , 2 ) --剛剛說到哪裡了？對了！你上次請我喝的酒一點味道也沒有！還是這種[114497]夠勁！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_EAT )
			end
			if Count == 8 then
				Yell( Nick , "[SC_422966_1]" , 2 ) --咯～喝酒啊～是要喝酒的味道的，像你這種喝法完全不行啦！
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 12 then
				Yell( OwnerID() , "[SC_422966_2]" , 2 ) --喝酒就是要大口的喝啊～像個娘們似的喝法才是不行的啊！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 16 then
				Yell( Nick , "[SC_422966_3]" , 2 ) --你這種蠢豬似的喝法......咯～跟外面那些盜賊一樣下流！咯～
				PlayMotion( Nick ,  ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 20 then
				Yell( OwnerID() , "[SC_422966_4]" , 2 ) --盜賊在哪？是在那邊的犬族傢伙嗎？老子要砍幾個盜賊來下酒啊！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
			if Count == 24 then
				Yell( Nick , "[SC_422966_5]" , 2 ) --咯...別鬧了...你哪打的過犬族人啊？唉喲！他們好像聽到了，嘻嘻......
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_EAT  )
			end
			if Count == 28 then
				Yell( OwnerID() , "[SC_422966_6]" , 2 ) --老子才不怕，不過今天老子心情好......就饒了他們！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )
			end
		else
			local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
			if CheckID( Player ) == true then
				AdjustFaceDir( OwnerID(), Player, 0 )
				Yell( OwnerID() , "[SC_422966_7]" , 2 ) --喂！這裡是喝酒吃飯的地方，我大聲講話有什麼不行的！
				sleep( 10 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SHIELD_BASH )
				sleep( 20 )
				AdjustFaceDir( Nick, Player, 0 )
				Yell( Nick , "[SC_422966_8]" , 2 ) --咯......嘻嘻......沒用的啦！這傢伙是不會安靜下來的。
				sleep( 10 )
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
				sleep( 20 )
				Yell( OwnerID() , "[SC_422966_9]" , 2 ) --沒錯！酒沒喝完老子是不會離開的！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
				sleep( 30 )
				Yell( Nick , "[SC_422966_10]" , 2 ) --咯～這個主意好！如果你把那一大桶麥酒喝光，這傢伙就非走不可了！
				PlayMotion( Nick , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				sleep( 30 )
				AdjustFaceDir( OwnerID(), Nick, 0 )	
				Yell( OwnerID() , "[SC_422966_11]" , 2 ) --喲～不敢跟老子拼酒就說一聲，老子今天就放過你啦！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
				sleep( 30 )
				AdjustFaceDir(  Nick, OwnerID(), 0 )
				Yell( Nick , "[SC_422966_12]" , 2 ) --[114495]！別小看我......咯！
				PlayMotion( Nick , ruFUSION_ACTORSTATE_ATTACK_UNARMED )			
				sleep( 30 )
				Yell( OwnerID() , "[SC_422966_13]" , 2 ) --哈哈～如果那一大桶酒真的被那傢伙喝光的話，我也只能到其他地方找酒喝了～
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
				sleep( 30 )
				SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
				SetIdleMotion( Nick,ruFUSION_MIME_SIT_CHAIR_LOOP)
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		end
		sleep( 10 )
		Count = Count + 1
		if Count > 30 then
			Count = 0
		end
	end 
end

function LuaI_114495_1()
	local Buff = 506100 --喝酒中的Buff
	local Keyitem = 543743 --能夠喝酒的旗標
	local Keyitem2 = 543744--完成喝酒的旗標
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 or ReadRoleValue( TargetID() , EM_RoleValue_Register ) == OwnerID() then
		if CheckAcceptQuest( OwnerID() , 422966 ) == true then --有接任務
			if CheckFlag( OwnerID() , KeyItem ) == false and CheckBuff( OwnerID() , Buff ) == false then --還沒喝酒時的處理
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_14]" , 1 ) --你試圖制止他們的大聲交談
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_14]" , 1 )
				SetFlag(  OwnerID() , Keyitem , 1 ) --給予能夠喝酒的旗標		
				if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
				end
				return
			end
			if CheckFlag( OwnerID() , KeyItem ) == true and CheckBuff( OwnerID() , Buff ) == false then --可以喝酒時的處理		
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_15]" , 1 ) --看樣子這兩人完全不想理會你，除非那一整桶麥酒真的被你喝光......
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_15]" , 1 )
				return
			end	
			if CheckBuff( OwnerID() , Buff ) == true and CheckFlag( OwnerID() , KeyItem2 ) == false then --喝完酒的處理
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_16]" , 1 ) --你指了指旁邊的空酒桶，跟他們示意你喝完了
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_16]" , 1 )
				SetFlag(  OwnerID() , Keyitem2 , 1 ) --給予完成任務的旗標
				SetFlag(  OwnerID() , Keyitem , 0 ) --刪除可以喝酒的旗標
				BeginPlot( TargetID() , "LuaI_114495_2" , 0 )
				return
			end		
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_17]" , 1 ) --這些人看起來已經喝醉了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_17]" , 1 ) --這些人看起來已經喝醉了。	
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_18]" , 1 ) --他們似乎沒空理你。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_18]" , 1 ) --他們似乎沒空理你。
	end
end

function LuaI_114495_2()
	local Flag = 780557
	local Nick = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Hide( Nick )
	Hide( OwnerID() )
	local Dummy1 = CreateObjByObj( 114687 , OwnerID() )
	local Dummy2 = CreateObjByObj( 114688 , Nick )
	MoveToflagEnabled( Dummy1 , false )
	MoveToflagEnabled( Dummy2 , false )
	Hide( Dummy1 )
	Hide( Dummy2 )
	WriteRoleValue( Dummy1 , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Dummy2 , EM_RoleValue_IsWalk , 1 )
	Show( Dummy1 , RoomID )
	Show( Dummy2 , RoomID )
	WriteRoleValue( Dummy1 , EM_RoleValue_LiveTime , 20 )
	WriteRoleValue( Dummy2 , EM_RoleValue_LiveTime , 20 )
	SetPlot( Dummy1 , "touch" , "LuaFunc_Obj_BUSY" , 30 )
	SetPlot( Dummy2 , "touch" , "LuaFunc_Obj_BUSY" , 30 )
	Yell( Dummy1 , "[SC_422966_19]" , 2 ) --我欣賞你！現在～我要去其他地方找酒了......
	BeginPlot( Dummy1 , "LuaI_114495_Move" , 0 )
	sleep( 20 )
	Yell( Dummy2 , "[SC_422966_20]" , 2 ) --哇！你還真能喝，好吧、好吧，我們這就走～
	BeginPlot( Dummy2 , "LuaI_114495_Move_1" , 0 )
	sleep( 300 )
	Show( OwnerID() , RoomID )
	Show( Nick , RoomID )
end

function LuaI_114495_Move()
	local Flag = 780579
	local FlagNum = GetMoveFlagCount( Flag )
	for i = 1 , FlagNum - 1 , 1 do
		LuaFunc_MoveToFlag( OwnerID() , Flag , i , 0 )
	end
	DelObj( OwnerID() )
end

function LuaI_114495_Move_1()
	local Flag = 780350
	local FlagNum = GetMoveFlagCount( Flag )
	for i = 1 , FlagNum - 1 , 1 do
		LuaFunc_MoveToFlag( OwnerID() , Flag , i , 0 )
	end
	DelObj( OwnerID() )
end


function LuaI_114497_0() --酒桶
	Setplot( OwnerID() , "touch" , "LuaI_114497_1" , 30 )
end

function LuaI_114497_1()
	local KeyItem = 543743 --可以喝酒的旗標
	local KeyItem2 = 543744 --喝完酒的旗標
	local Buff = 506099 --計算喝酒的buff
	local Buff2 = 506100 --酒醉的buff
	if CheckFlag( OwnerID() , KeyItem ) == true and CheckBuff( OwnerID() , Buff2 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_21]" , 1 ) --咕嘟～你灌下一大口[114497]......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_21]" , 1 ) --咕嘟～你灌下一大口[114497]......
		AddBuff( OwnerID() , Buff , 0 , -1 )
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Buff )
		local OrgLv = BuffInfo( OwnerID() , BuffPos , EM_BuffInfoType_Power ) +1
		if OrgLv == 3 then
--			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_22]" , 1 ) --你開始覺得想吐......
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_22]" , 1 ) --你開始覺得想吐......
		end
		if OrgLv == 4 then
--			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_23]" , 1 ) --桶子似乎快見底...似乎...
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_23]" , 1 ) --桶子似乎快見底...似乎...
		end
		if OrgLv == 5 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_27]" , 1 ) --現在可以去找[114497]好好談談了
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422966_24]" , 1 ) --嗝...喝完了...
			CancelBuff( OwnerID() , Buff )
			AddBuff( OwnerID() , Buff2 , 0 , 27 )
		end
	elseif CheckBuff( OwnerID() , Buff2 ) == true or CheckFlag( OwnerID() , 543744 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_25]" , 1 ) --裡面的酒已經被你喝完了		
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422966_26]" , 1 ) --這是一大桶濃烈的[114497]	
	end
end

function LuaI_114545_0() --屠龍者酒吧中的，
	local Count = 0
	local Barnight =  Lua_CreateObjByDir( OwnerID() , 114544 , 20 , 0 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddToPartition( Barnight , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Barnight )
	SetPlot( OwnerID() , "range" , "LuaI_114545_1" , 70 )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)
	SetIdleMotion( Barnight,ruFUSION_MIME_SIT_CHAIR_LOOP)

end
function LuaI_114545_1() --屠龍者酒吧中的，
	if CheckCompleteQuest( OwnerID() , 423014 ) == false and CheckCompleteQuest( OwnerID() , 422966 ) == true and CheckFlag( OwnerID() , 543746 ) == false then
		if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
			BeginPlot( TargetID() , "LuaI_114545_2" , 0 )
		end
	end
end
function LuaI_114545_2() --屠龍者酒吧中的，
	local Barnight = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	SetIdleMotion( OwnerID(),ruFUSION_MIME_NONE)	
	SetIdleMotion( Barnight,ruFUSION_MIME_NONE)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	for i = 1 , 20 , 1 do
			if i == 2 then
				Yell( Barnight , "[SC_423014_C_0]" , 2 ) --拿一把爛劍也敢出來闖，看你什麼時候被馬龍兄弟砍了！
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_POINT )
			end
			if i == 4 then
				Yell( OwnerID() , "[SC_423014_C_1]" , 2 ) --哼！我向卡爾買的劍怎樣都比你那一把強，放心好了，你死了我再請午夜幫你收屍～
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SHIELD_BASH )
			end
			if i == 6 then
				Yell( Barnight , "[SC_423014_C_2]" , 2 ) --卡爾？買一把劍還記得賣的人是誰？「小妞」就是「小妞」。
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
			end
			if i == 8 then
				Yell( OwnerID() , "[SC_423014_C_3]" , 2 ) --不會吧？你不知道卡爾是誰？就是那一個卡爾．戴維斯啊，黑市武器商的龍頭，連他都不知道，你真是白混了
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			end
			if i == 10 then
				Yell( OwnerID() , "[SC_423014_C_4]" , 2 ) --蠢貨！比沼地裡的豬還笨，有你這種哥哥，難怪你弟也不怎麼樣。
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )			
			end
			if i == 12 then
				Yell( Barnight , "[SC_423014_C_5]" , 2 ) --做什麼扯到我弟？他比你弟那種躲在城裡的弱雞好太多了～
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_EMOTE_POINT )
			end
			if i == 14 then
				Yell( OwnerID() , "[SC_423014_C_6]" , 2 ) --你！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_DODGE )
			end
			if i == 16 then
				Yell( Barnight , "[SC_423014_C_7]" , 2 ) --敢不敢賭？叫你弟拿一把冒牌卡爾賣的爛劍去跟我弟決鬥，我送他的寶劍絕對會輕鬆贏你那個弱雞弟弟！
				PlayMotion( Barnight , ruFUSION_ACTORSTATE_SHIELD_BASH )
			end
			if i == 18 then
				Yell( OwnerID() , "[SC_423014_C_8]" , 2 ) --賭就賭，你會後悔今天污辱了我弟和「夜梟」卡爾！
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
				local Ball = Lua_CreateObjByDir( OwnerID() , 114040 , 1 , 0) 
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				WriteRoleValue( Ball , EM_RoleValue_LiveTime , 2 )
				Lua_ObjDontTouch( Ball ) 
				AddToPartition( Ball , RoomID )
				SetPlot( Ball , "Range" , "LuaI_114545_Range" , 100 )
			end
		sleep( 10 )
	end 
	SetIdleMotion( OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)	
	SetIdleMotion( Barnight,ruFUSION_MIME_SIT_CHAIR_LOOP)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114545_Range() --屠龍者酒吧中的，
	if CheckCompleteQuest( OwnerID() , 423014 ) == false and CheckCompleteQuest( OwnerID() , 422966 ) == true and CheckFlag( OwnerID() , 543746 ) == false then
		SetFlag( OwnerID() , 543746 , 1 )
	end
end

function LuaS_114546_0()
	if CheckAcceptQuest( OwnerID() , 423014 ) == true then
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		local Sword = CountBodyItem( OwnerID() , 203464 )
		if Sword > 0 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_8]" ) -- 黑市的規矩是交易結束，買賣雙方之間就沒有任何關聯，你能理解吧？理解的話就快走開！
		elseif Ring < 1 and MoneyBeg < 1 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_0]" ) -- 唔？怎麼支支吾吾的，想跟我借錢？
		elseif Ring > 0 and MoneyBeg < 1 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_1]" ) -- 哦？這枚戒指你從哪兒弄來的？如果再有一些錢，我們可以談點別的事情～
		elseif Ring < 1 and MoneyBeg > 0 then
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_2]" ) -- 嗯？這錢袋要送我？
		else
			SetSpeakDetail (  OwnerID() ,"[SC_423014_T_3]" ) --戒指...你要找的人現在不在這裡，找我也是一樣的意思。
			AddSpeakOption(  OwnerID(), TargetID(),"[SC_423014_T_4]" ,  "LuaS_423014_1",  0 );  --我想確認一下，你是不是...
		end
	else
		LoadQuestOption( OwnerID() )
	end
	if	( CheckCompleteQuest( OwnerID(),423014)==true)	and	(CheckAcceptQuest(OwnerID(),422981)==true )	and
		( CheckCompleteQuest( OwnerID(),422981)==false)	and	(CountBodyItem( OwnerID(),206816) >0)	and
		CheckFlag( OwnerID() , 543708 ) == false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_91]","LuaS_114546_100",0)	--想請你幫個忙。
	end
	
end

function LuaS_423014_1()
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		SetSpeakDetail (  OwnerID() ,"[SC_423014_T_5]" ) 
		--[114546]，「夜梟」卡爾的助手。
		--([114546] 微微傾身迅速翻開背心，一瞬間在心臟部位似乎閃過奇特的S.S.S.E字樣。)
		--你帶來的戒指原本應該在一個落腮鬍手裡，嗯...你身上沾過的血腥味沒包含他，他託你來幫他買武器，是吧？
		if Ring > 0 and MoneyBeg > 0 and  CheckAcceptQuest( OwnerID() , 423014 ) == true then
			AddSpeakOption(  OwnerID(), TargetID(),"[SC_423014_T_6]" ,  "LuaS_423014_2",  0 );  --的確，他需要一把劍。
		end
end

function LuaS_423014_2()
		local Ring = CountBodyItem( OwnerID() , 206814 )
		local MoneyBeg = CountBodyItem( OwnerID() , 206815 )
		SetSpeakDetail (  OwnerID() ,"[SC_423014_T_7]" ) 
		--([114546]掂了掂錢袋重量。)
		--好了，就這把，給你～銀貨兩訖，慢走。
		if Ring > 0 and MoneyBeg > 0 and  CheckAcceptQuest( OwnerID() , 423014 ) == true then
			if 	GiveBodyItem( OwnerID() , 203464 , 1 ) then
				DelBodyItem( OwnerID() , 206814 , Ring )
				DelBodyItem( OwnerID() , 206815 , MoneyBeg )
			end
		end
end


Function LuaP_RidingDatanieeSL()
	if CheckBuff( OwnerID() , 506264) == false then
		AddBuff( OwnerID() , 506264, 0 , -1 )
	end
		SetModeEx(114817,EM_SetModeType_Obstruct,true) 

end

Function LuaP_RidingDatanieeSLsit()
		SetModeEx(OwnerID(),EM_SetModeType_Obstruct,true) 
end


function LuaArea_IronCastal_KeepOut() --每兩秒檢查一次，把不該進入的玩家驅趕出去--在門口附近放了一個箱子
	local Player
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AreaID = 756
	local  X , Y , Z, Dir = -8902 , -150 , 7930 , 270
	while 1 do
		Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , AreaID ) == true then
				if CheckAcceptQuest( ID , 422996 ) == false and CheckCompleteQuest( ID , 422996 ) == false and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_Y ) > -150 then
					SetPos( ID , X , Y , Z, Dir )
					ScriptMessage( ID , ID , 1 , "[SC_IRONCASTAL_KEEPOUT]" , 0 ) --你未獲得進入艾翁城的許可
					ScriptMessage( ID , ID , 0 , "[SC_IRONCASTAL_KEEPOUT]" , 0 )
				end
			end
		end		
		sleep( 20 )
	end
end

function LuaI_IronCastal_GateGuard()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Keeper = {}
	for i = 1 , 2 , 1 do
		Keeper[i] = Lua_CreateObjByDir( OwnerID() , 114504 , 40-80*(i-1) , 90 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + i , Keeper[i] )
		AddToPartition( Keeper[i] , RoomID )
	end
	SetPlot( OwnerID() , "Range" , "LuaI_IronCastal_GateGuard_1" , 100 )
end

function LuaI_IronCastal_GateGuard_1()
	if CheckAcceptQuest( OwnerID() , 422996 ) == false and CheckCompleteQuest( OwnerID() , 422996 ) == false then
		BeginPlot( TargetID() , "LuaI_IronCastal_GateGuard_2" , 0 )
	end
end

function LuaI_IronCastal_GateGuard_2()
	local Keeper1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local Keeper2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	Yell(  Keeper1 , "[SC_422991_KEEPOUT_1]" , 3 ) --止步！
	SetIdleMotion( Keeper1 , ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	SetIdleMotion( Keeper2 , ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	BeginPlot( Keeper1 , "LuaI_IronCastal_GateGuard_3" , 0 )
	BeginPlot( Keeper2 , "LuaI_IronCastal_GateGuard_3" , 0 )	
	sleep( 20 )
	Yell(  Keeper2 , "[SC_422991_KEEPOUT_2]" , 3 ) --艾翁不許外人進入！
	if CheckID( TargetID() )== true and CheckAcceptQuest( TargetID() , 422991 ) == true then
		sleep( 20 )
		Yell(  Keeper1 , "[SC_422991_KEEPOUT_3]" , 3 ) --你因何事前來？
	end
end

function LuaI_IronCastal_GateGuard_3()
	sleep( 150 )
	SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
end

function LuaS_IronCastal_GateGuard_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422991 ) == true then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_0]" ,  "LuaS_IronCastal_GateGuard_1",  0 );  --我是來自達拉尼斯城的使節，想見領主傑斯．莫克里夫。
	end
end

function LuaS_IronCastal_GateGuard_1()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_1]" ) --來自達拉尼斯城的使節？這…就算你想見傑斯．莫克里夫大人，他已經不在艾翁城內很久了…
	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_2]" ,  "LuaS_IronCastal_GateGuard_2",  0 );  --這是什麼意思？
end

function LuaS_IronCastal_GateGuard_2()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_3]" ) --傑斯．莫克里夫大人在幾年前出城，住在艾翁附近的布拉村，大人他…不讓我們稱他為領主...
	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422991_4]" ,  "LuaS_IronCastal_GateGuard_3",  0 );  --為什麼？
end

function LuaS_IronCastal_GateGuard_3()
	SetSpeakDetail (  OwnerID() ,"[SC_422991_5]" ) 
	--詳細原因我不清楚，既然你是來自達拉尼斯城的使節，請你直接去布拉村找大人吧！
	--順著道路走，你就能看見村子了，也許一切就能產生改變也說不定…
end

--function LuaS_114366_0()
--	LoadQuestOption( OwnerID() )
--	if CheckAcceptQuest( OwnerID() , 422992 ) == true then
--		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_0]" ,  "LuaS_422992_0",  0 );  --達拉尼斯城方面想了解，這次舉行的領主國會議，你因為什麼原因沒有代表艾翁出席？
--	end
--end

--function LuaS_422992_0()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_1]" ) 
	--艾翁沒有出席領主國會議？！....我很抱歉，發生這種事情驚擾到大家，還讓您辛苦前來。
	--艾翁正由我的弟弟們治理，我相信他們一定有什麼為難的原因才會沒有出席，真的很抱歉。
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_2]" ,  "LuaS_422992_1",  0 );  --弟弟們？
--end

--function LuaS_422992_1()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_3]" ) 
	--對，勞爾．莫克里夫、傑諾．莫克里夫是我的弟弟，能力都非常優秀。
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_4]" ,  "LuaS_422992_2",  0 );  --不是你治理艾翁…那為什麼你會留在布拉村？
--end

--function LuaS_422992_2()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_5]" ) 
	--離開艾翁，城內的狀況才能單純一點，等到大臣們看見勞爾和傑諾的治理能力，他們會全力支持的。
	--而且在布拉村裡，我可以幫村民們阻擋到處襲擊村落的盜賊，這是我可以做到的事情，我想要守護大家。
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_6]" ,  "LuaS_422992_3",  0 );  --為什麼艾翁阻止外人進入？
--end

--function LuaS_422992_3()
--	SetSpeakDetail (  OwnerID() ,"[SC_422992_7]" ) 
	--勞爾和傑諾對彼此有些誤會，有時候有也會引發一些紛爭，暫時把艾翁封城，可以避免波及到外面。
	--他們本性都不壞，等誤會解開，一切就能回復原狀了，這些都只是暫時的而已。
--	AddSpeakOption(  OwnerID(), TargetID(),"[SC_422992_6]" ,  "LuaS_114366_0",  0 );  --結束對話
--end

function LuaS_114513_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423006 ) == true and CheckFlag( OwnerID() , 543745 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423006_Q1]" ,  "LuaS_114513_1",  0 );  --我要怎麼幫忙？
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	then		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_0]","LuaS_423007_2",0)	--我幫忙奧力維爾‧哈利斯想解開艾翁兩位王子彼此的誤會，後來分頭進行的時候，他說要親自去見維多莉亞王妃。	
	end
end

function LuaS_114513_1()
	CloseSpeak( OwnerID() )
	local Buff = {506138,506139,506140,506141,506142,506143,506144}
	Tell( OwnerID() ,TargetID() , "[SC_423006_Q2]" ) --只要照小的說的去做就好囉～
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID())
	AddBuff( OwnerID() , Buff[DW_Rand(7)] , 0 , 15 )
end

function LuaM_423006_MSG()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local String
	local StringA
	local StringB
	local Buff = 0
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 114513 then
		Target = TargetID()
	end
	local StringC = {"SC_423006_F0" , "SC_423006_F1"}

	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	
	if Buff == 0 then
		return
	end
	
	local BuffPos = Lua_BuffPosSearch(OwnerID() , BuffID[Buff] )
	local Time = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Time )
	String = "["..BuffID[Buff].."]"
	if Time == 14 then
		StringA = "[SC_423006_A][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 0 , StringA , "0xFFFFFFFF" )
	end
	if Time == 13 then
		StringB = "[SC_423006_B][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 2 , StringB , 0 )
	end
	if Time == 5 then
		Tell( OwnerID() ,Target , "["..StringC[DW_Rand(2)].."]" )
	end
end
function LuaM_423006_Failed()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local Success = 506145
	for pry , obj in pairs(BuffID) do
		CancelBuff_NoEvent( OwnerID() , obj )
	end
	CancelBuff_NoEvent( OwnerID() , Success )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 114513 then
		Target = TargetID()
	end
	Tell( OwnerID() ,Target , "[SC_423006_F2]" )	--哎哎～看樣子要重來了～

end

function LuaI_423006_OBJ()
	AddBuff( OwnerID() , 502546 , 0 , -1 )
	SetPlot( OwnerID() , "Touch" , "LuaI_423006_OBJ2" , 30 )
end

function LuaI_423006_OBJ2()
	if CheckAcceptQuest( OwnerID() , 423006 ) == true then
		local BuffID = {506138,506139,506140,506141,506142,506143,506144}
		local Buff = 0

		for pry , obj in pairs(BuffID) do
			if CheckBuff( OwnerID() , Obj ) == true then
				Buff = pry
				break
			end
		end
		
		if Buff == 0 then
			return
		end	
		BeginPlot( TargetID() , "LuaI_423006_OBJ3" , 0 )
	end
end

function LuaI_423006_OBJ3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Thing = {[114518] = 206825 , [114516] = 206826 , [114520] = 206827 , [114515] = 206828 , [114521] = 206829 , [114517] = 206830 , [114519] = 206869 }
	GiveBodyItem( TargetID() , Thing[OrgID] , 1 )
	Hide( OwnerID() )
	sleep( 50 )
	Show( OwnerID() , RoomID )
end

function LuaI_114514_0()
	SetPlot( OwnerID() , "Touch" , "LuaI_114514_1" , 30 )
end

function LuaI_114514_1()
	local BuffID = {506138,506139,506140,506141,506142,506143,506144}
	local ObjID = {206825,206826,206827,206828,206829,206830,206869}
	local Success = 506145
	local Buff = 0
	local KeyItem = 543745
	local Count = 0
		
	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	if Buff ~= 0 then 
		Count = CountBodyItem( OwnerID() , ObjID[Buff] )	
		--不管玩家拿什麼過來，全部回收！
		for pry , obj in pairs(ObjID) do
				local Num = CountBodyItem( OwnerID() , Obj )
				if Num > 0 then
					DelBodyItem( OwnerID() , obj , Num )
				end
		end
	end
	--如果身上沒有需要的物品時的判斷
	if Count < 1 then
		Tell(OwnerID() ,TargetID() , "[SC_423006_Q3]" ) --騎士大人，你拿來的不是我要的東西啊！
		return
	end				
	--如果身上有需要的物品時的判斷
	if  Count > 0 then
		AddBuff( OwnerID() , Success , 0 , -1 )
		local String = {"SC_423006_C0" , "SC_423006_C1" , "SC_423006_C2" , "SC_423006_C3" , "SC_423006_C4" , "SC_423006_C5" , "SC_423006_C6" , "SC_423006_C7" , "SC_423006_C8" , "SC_423006_C9"}
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Success )	
		local LV = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Power  ) + 1
		Tell(OwnerID() ,TargetID() , "["..String[LV].."]" )
		if LV >= 10 then --判斷是否已經成功
			for pry , obj in pairs(BuffID) do
				CancelBuff_NoEvent( OwnerID() , obj )
			end
			CancelBuff_NoEvent( OwnerID() , Success )
			if CheckAcceptQuest( OwnerID() , 423006 ) == true then
				SetFlag( OwnerID() , KeyItem , 1 )
			end
		else
			CancelBuff_NoEvent( OwnerID() , BuffID[Buff] )
		 	local Num = DW_Rand(7) --避免取得和前一次相同的物品
		 	if Num == Buff then
		 		Num = Num + 1
		 	end
		 	if Num > 7 then
		 		Num = 1
		 	end
			AddBuff( OwnerID() , BuffID[Num] , 0 , 15 )
		end
	end
end

function LuaS_114510_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422974 ) == true and CheckFlag( OwnerID() , 780535 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_0]" ,  "LuaS_114510_1",  0 );  --我準備好了。
	end
end

function LuaS_114510_1()
	SetSpeakDetail (  OwnerID() ,"[SC_422974_1]" ) --真的？身心都在最～佳～狀態了？嗯，[$playername]，我很期待你再度展露當初的不凡身手。所謂的注意事項就是～隨時隨地都保持精力旺盛，貫徹正義！明白？
	if CheckAcceptQuest( OwnerID() , 422974 ) == true and CheckFlag( OwnerID() , 780535 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_2]" ,  "LuaS_114510_2",  0 );  --…明白了。
	end
end

function LuaS_114510_2()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		SetSpeakDetail (  OwnerID() ,"[SC_422974_3]" ) --先等一下，[114499]以及[114500]還沒有到，如果我們先行動的話等於是拋棄了他們，我無法忍受拋棄夥伴這種事情啊！
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot( TargetID() , "LuaI_114510_0" , 0 )
	end
end

function LuaI_114510_0()
	local Student = {}
	local Bandit = {}
	local Flag = 780535
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tag = Role:new( OwnerID() )
	local Xi , Yi , Zi , Diri = Tag:X() , Tag:Y() , Tag:Z() , Tag:Dir()
	local Master = LuaFunc_CreateObjbyObj( 103445 , OwnerID() )
	local Goal = CreateObjByFlag( 114040 , Flag , 1 , 1) --旗標 1 是終點
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local KeyItem = 543747
	local Result = "YES"
	
	Hide( OwnerID() )
	
	AddBuff( Player , 506212, 0 , 60 )
	Lua_ObjDontTouch( Goal ) 
	MoveToFlagEnabled( Master , false )
	WriteRoleValue( Master , EM_RoleValue_IsWalk , 1 )
	SetRoleCamp( Master , "Visitor" )
	AddToPartition(  Master , RoomID )
	AddToPartition(  Goal , RoomID )

	SetPlot( Master , "dead" , "LuaI_114510_NoDead" , 0 )	
	
	Student[1] = CreateObj( 103446 , Xi , Yi , Zi+50 , Diri , 1 )
	Student[2] = CreateObj( 103497 , Xi , Yi , Zi-50 , Diri , 1 )

	for i = 1 , 2 , 1 do
		WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 0 )
		WriteRoleValue( Student[i] , EM_RoleValue_PID , Master )
		WriteRoleValue( Student[i] , EM_RoleValue_Register , i+1 )
		WriteRoleValue( Master , EM_RoleValue_Register + i  , Student[i] )
		SetRoleCamp( Student[i] , "Visitor" )
		AddToPartition(  Student[i] , RoomID )
		MoveToflagEnabled( Student[i]  , False )
		SetPlot( Student[i] , "dead" , "LuaI_114510_NoDead" , 0 )
		Yell( Student[i] , "[SC_422974_4]" , 3 ) --師範！我們來了！
		BeginPlot( Student[i] , "LuaI_114510_FlagMove" , 0)
	end
	
	AdjustFaceDir( Master , Goal , 180 )
	sleep( 50 )
	Yell( Master , "[SC_422974_5]" , 3 ) --非常好！既然都到齊了！都跟我走吧！
	AdjustFaceDir( Master , Goal , 0 )
	sleep( 10 )
	PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir( Student[1] , Master , 0 )
	AdjustFaceDir( Student[2] , Master , 0 )	
	sleep( 20 )
	Yell( Student[1] , "[SC_422974_6]" , 3 ) --師範，我們要做什麼？
	PlayMotion( Student[1] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 20 )
	Yell( Master , "[SC_422974_7]" , 3 ) --哈哈哈！當然是貫徹正義啦！
	PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	sleep( 20 )
	AdjustFaceDir( Student[1] , Student[2] , 0 )
	sleep( 5 )
	AdjustFaceDir( Student[2] , Student[1] , 0 )
	PlayMotion( Student[1] , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 20 )
	PlayMotion( Student[2] , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	
	SetRoleCamp( Master , "SNPC" )
	WriteRoleValue( Master , EM_RoleValue_Register , 4 )
	BeginPlot( Master , "LuaI_114510_FlagMove" , 0)
	for i = 1 , 2 , 1 do
		Hide(  Student[i] )
		WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 1 )
		SetRoleCamp( Student[i] , "SNPC" )
		Show(  Student[i] , RoomID )
		WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+4 )
	end	
	
	local FlagNum = 4
	local Stage = FlagNum
	local Count = 0 
		
	while 1 do	
		if FlagNum >= 7 and ( CheckID( Player ) == false or ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or GetDistance( Player , Master ) > 500 or CheckAcceptQuest( Player , 422974 ) == false ) then
			if CheckID( Player ) == true then
				if CheckAcceptQuest( Player , 422974 ) == true then
					ScriptMessage( Player , Player , 1 , "[SC_422974_FAILED]" , 0 ) --任務失敗，請重新再來
					ScriptMessage( Player , Player , 0 , "[SC_422974_FAILED]" , 0 )
				end
				CancelBuff( Player   , 506212)
				Result = "NO"
			end
			break
		end
	
		local X , Y , Z
		local Me = Role:new( Master )
		X = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_X )
		Y = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Y )
		Z = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Z )	
		if ( X-Me:X() ) ^2 + ( Y-Me:Y() ) ^2 + ( Z-Me:Z() ) ^2 < 400 then
			FlagNum = FlagNum + 3
		end

		if FlagNum >= 7 then
			Count = Count + 1
		end
		
		if FlagNum ~= Stage then
			WriteRoleValue( Master , EM_RoleValue_Register , FlagNum )	
			for i = 1 , 2 , 1 do
				WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+FlagNum )
			end	
			if FlagNum == 7 then
				Show( OwnerID() , RoomID)
			end
			if FlagNum == 10 then
				for i = 1 , 10 , 1 do
					local OrgID = 103303
					if i == 1 then	OrgID = 103302 end
					Bandit[i] = CreateObjByFlag( OrgID , Flag , 15 + i , 1 )
					MoveToflagEnabled( Bandit[i] , false )
					WriteRoleValue( Bandit[i] , EM_RoleValue_Register , 25 + i )
					WriteRoleValue( Bandit[i] , EM_RoleValue_IsWalk , 1 )
					SetRoleCamp( Bandit[i] , "Visitor" )
					AddToPartition( Bandit[i] , RoomID )
					WriteRoleValue( Bandit[i] , EM_RoleValue_Register + 1 , Master )
					AddBuff( Bandit[i] , 500675 , 55 , -1 )
					if OrgID == 103302 then
						SetPlot( Bandit[i] , "dead" , "LuaI_114510_NoDead" , 0 )
						BeginPlot( Bandit[i] , "LuaI_114510_SOB" , 0)
					else
						WriteRoleValue( Bandit[i] , EM_RoleValue_PID , Bandit[1] )
						BeginPlot( Bandit[i] , "LuaI_114510_Bandit" , 0)
					end
				end
			end
			if FlagNum == 13 then	
				Yell( Student[1]  , "[SC_422974_13]" , 3 ) --老師......
				sleep( 30 )
				ScriptMessage( Player , Player , 0 , "[SC_422974_14]" , 0 ) --[114498]眨了眨眼，示意[114499]稍安勿躁
				ScriptMessage( Player , Player , 2 , "[SC_422974_14]" , 0 ) --[114498]眨了眨眼，示意[114499]稍安勿躁
				sleep( 30 )
				Yell( Student[2]  , "[SC_422974_15]" , 3 ) --數量還真多。
				sleep( 30 )
				WriteRoleValue( Master , EM_RoleValue_PID , 777 ) 
				Yell( Bandit[3] , "[SC_422974_16]" , 3 ) --被他們發現了！
				Yell( Bandit[7] , "[SC_422974_17]" , 3 ) --大夥兒上啊！
				sleep( 20 )
				Yell( Master  , "[SC_422974_18]" , 3 ) --來了～來了～
				sleep( 20 )
				Yell( Master  , "[SC_422974_19]" , 3 ) --接受正義的制裁吧！
				SetAttack( Master , Bandit[DW_Rand(table.getn(Bandit))] )
				SetAttack( Student[1] , Bandit[DW_Rand(table.getn(Bandit))] )
				SetAttack( Student[2] , Bandit[DW_Rand(table.getn(Bandit))] )
			end
			Stage = FlagNum
		end
		
		if Count == 1 then
			Yell( Student[1]  , "[SC_422974_8]" , 3 ) --…老師，我們這麼直接沒關係嗎？
		end
		if Count == 3 then
			Yell( Student[1]  , "[SC_422974_9]" , 3 ) --都不用藏匿行蹤？
		end	
		if Count == 7 then
			Yell( Master  , "[SC_422974_10]" , 3 ) --藏匿行蹤？需要嗎？
		end	
		if Count == 9 then
			Yell( Student[2]  , "[SC_422974_11]" , 3 ) --不怕他們先發制人？
		end
		if Count == 11 then
			Yell( Master  , "[SC_422974_12]" , 3 ) --他們先出手的話，我們只要反擊就能解決了！
		end	
		if FlagNum > 13 and ReadRoleValue( Bandit[1] , EM_RoleValue_PID ) > 0 then
			Lua_CancelAllBuff( Master ) 
			SetStopAttack(Master )
			SetRoleCamp( Master , "Visitor" )
			for i = 1 , 2 , 1 do
				Lua_CancelAllBuff( Student[i] ) 
				SetStopAttack(Student[i] )
				SetRoleCamp( Student[i], "Visitor" )
			end
			PlayMotionEX( Master , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
			Yell( Master  , "[SC_422974_20]" , 3 ) --咦，掉了一個懷錶？
			sleep( 30 )
			PlayMotion( Master , ruFUSION_ACTORSTATE_CROUCH_END)
			Yell( Master  , "[SC_422974_21]" , 3 ) --我看看，嗯......刻了名字......[114501]......
			sleep( 20 )
			AdjustFaceDir( Bandit[1] , Master, 0 )
			AdjustFaceDir( Student[1] , Master, 0 )
			AdjustFaceDir( Student[2] , Master, 0 )
			sleep( 5 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_CROUCH_END) 
			Yell( Bandit[1]   , "[SC_422974_22]" , 3 ) --別用你的爛手碰它！
			sleep( 10 )
			FaceObj(  Master, Bandit[1]  )
			sleep( 10 )
			Yell( Master  , "[SC_422974_23]" , 3 ) --我的......爛手？......[114501]，你是她的兒子？
			sleep( 20 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE) 
			Yell( Bandit[1]   , "[SC_422974_24]" , 3 ) --你認識我的母親？
			sleep( 20 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_EMOTE_POINT) 
			Yell( Bandit[1]   , "[SC_422974_25]" , 3 ) --說！你對她做了什麼？
			FaceObj(  Student[1], Bandit[1]  )
			FaceObj(  Student[2], Bandit[1]  )
			sleep( 50 )
			Yell( Master  , "[SC_422974_26]" , 3 ) --我用我的愛感動她，她很擔心你，來，跟我們回去吧～
			PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			sleep( 30 )
			PlayMotion( Bandit[1] , ruFUSION_ACTORSTATE_SHIELD_BASH) 
			Yell( Bandit[1]   , "[SC_422974_27]" , 3 ) --放手！我為什麼要相信你？
			sleep( 20 )
			PlayMotion( Master , ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP) 
			Yell( Master   , "[SC_422974_28]" , 3 ) --不須多說，你就親身感受愛的力量吧！
			Delobj( Bandit[1] )
			sleep( 30 )
			
			ScriptMessage( Player , Player , 0 , "[SC_422974_29]" , 0 ) --[114498]將[103302]打暈後提在手上
			ScriptMessage( Player , Player , 2 , "[SC_422974_29]" , 0 ) --[114498]將[103302]打暈後提在手上
			Hide( Master )
			WriteRoleValue( Master , EM_RoleValue_IsWalk , 1 )
			Show( Master , RoomID )
			WriteRoleValue( Master , EM_RoleValue_Register , 4 )
			BeginPlot( Master , "LuaI_114510_FlagMove" , 0)
			sleep( 30 )


			for i = 1 , 2 , 1 do
				Hide(  Student[i] )
				WriteRoleValue( Student[i] , EM_RoleValue_IsWalk , 1 )
				Show(  Student[i] , RoomID )
				WriteRoleValue( Student[i] ,  EM_RoleValue_Register , i+4 )
				BeginPlot( Student[i] , "LuaI_114510_FlagMove" , 0)				
			end	
			
			Yell( Master   , "[SC_422974_30]" , 3 ) --好了！輕鬆解決～可愛的你們記得跟上囉～
			PlayMotion( Master , ruFUSION_ACTORSTATE_EMOTE_WAVE) 
			CancelBuff( Player   , 505457)
			sleep( 100 )
			break
		end	
		if FlagNum > 13 then
			if CheckID( Bandit[1] ) == false or ReadRoleValue( Bandit[1] , EM_RoleValue_OrgID ) ~= 103302 then
				Result = "NO"
				break
			end
		end
		sleep( 10 )
	end
	--重置
	DelObj( Master )
	CancelBuff( Player   , 506212)
	for pry , obj in pairs( Student ) do
		DelObj( obj )
	end
	for pry , obj in pairs( Bandit ) do
		local OrgID = ReadRoleValue( obj , EM_RoleValue_OrgID)
		if CheckID( Obj ) == true and ( OrgID == 103302 or OrgID == 103303 ) then
			DelObj( obj )
		end
	end
	if CheckID( Player ) == true and CheckAcceptQuest( Player , 422974 ) == true and Result == "YES" then
		SetFlag( Player , KeyItem , 1 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114510_FlagMove()
	local Flag = 780535
	local FlagNum 
	local X , Y , Z
	local Helper = {}
	local Time = 10
	local Me = Role:new( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 114498 then
		Helper[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
		Helper[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	else
		Helper[1] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		Helper[2] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	end
	while 1 do
		FlagNum = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
		if FlagNum == 0 or FlagNum > 15 then
			break
		end
		if HateListCount( OwnerID() ) > 0 then
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
				for i = 1 , 2 , 1 do
					if HateListCount( Helper[i] ) == 0 then
						local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
						SetAttack(Helper[i] , AttackTarget )
					end
				end
			end
			sleep( 10 )
		else
			if FlagNum > 3 then
				WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
			end
			X = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_X )
			Y = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Y )
			Z = GetMoveFlagValue( Flag , FlagNum , EM_RoleValue_Z )
			if ( X-Me:X() ) ^2 + ( Y-Me:Y() ) ^2 + ( Z-Me:Z() ) ^2 > 400 then
				Time = Move( OwnerID() , X , Y , Z )
			else
				Time = 10
			end
			sleep( Time )
		end
	end
end

function LuaI_114510_NoDead()
	return false
end

function LuaI_114510_SOB()
	local Master = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780535
	local Result = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Fight = 0 
	local Count = 0
	
	LuaFunc_MoveToFlag( OwnerID() , Flag , Num , 0 )
	
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP ) < ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) * 20 / 100 then
			Result = 1
			break
		end
		if CheckID( Master ) == false then
			break
		end
		if  HateListCount( OwnerID() ) < 1 and Fight == 1 and Count > 30 then
			break
		end
		if ReadRoleValue( Master , EM_RoleValue_PID ) > 0 and Fight == 0 then
			SetRoleCamp( OwnerID() , "Monster" )
			SetAttack( OwnerID() , Master )
			Fight = 1
		end
		sleep( 10 )
		Count = Count + 1	
	end
	if Result == 0 then
		DelObj( OwnerID() )
	else
		Lua_CancelAllBuff( OwnerID() ) 
		SetStopAttack(OwnerID() )
		SetRoleCamp( OwnerID() , "Visitor" )
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 777 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
	end
end

function LuaI_114510_Bandit()
	local Master = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local SOB = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Flag = 780535
	local Result = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Fight = 0 
	local Count = 0
	
	LuaFunc_MoveToFlag( OwnerID() , Flag , Num , 0 )

	while 1 do
		if CheckID( Master ) == false then
			break
		end
		if  CheckID( SOB ) == false then
			break
		end
		if  HateListCount( OwnerID() ) < 1 and Fight == 1 and Count > 30 then
			break
		end
		if ReadRoleValue( SOB , EM_RoleValue_PID ) > 0 then
			Result = 1
			break
		end
		if ReadRoleValue( Master , EM_RoleValue_PID ) > 0 and Fight == 0 then
			SetRoleCamp( OwnerID() , "Monster" )
			SetAttack( OwnerID() , Master )
			Fight = 1
		end
		sleep( 10 )
		Count = Count + 1
	end
	
	if Result == 0 then
		DelObj( OwnerID() )
	else
		Hide( OwnerID() )
		Lua_CancelAllBuff( OwnerID() ) 
		SetStopAttack(OwnerID() )
		SetRoleCamp( OwnerID() , "Visitor" )
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 3 )
		Show( OwnerID() , RoomID )
		LuaFunc_MoveToFlag( OwnerID() , Flag , Num + 10 , 0 )
	end
end