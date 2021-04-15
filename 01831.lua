function LuaS_423228()
	LoadQuestOption( OwnerID() )

	if CheckFlag(OwnerID() , 543914) == true then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_1]","LuaS_423228_1",0)    --你還記得剛剛的事嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_2]","LuaS_423228_2",0)    --為什麼會突然間攻擊第一王女？	
		return
	end					
	if CheckFlag(OwnerID() , 543949) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_7]","LuaS_423228_1",0)    --你還記得剛剛的事嗎？
		return
	end		
	if CheckFlag(OwnerID() , 543951) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_8]","LuaS_423228_1",0)    --為什麼會突然間攻擊第一王女？	
		return
	else
		if CountBodyItem( OwnerID() , 207270 ) > 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423228]","LuaS_423228_0",0)	--你還好嗎？還給你，這是剛剛被扯掉的項鍊。 
		end
	end

end

function LuaS_423228_0()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]仔細審視密函的內容)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_0]")
		DelBodyItem(OwnerID(),207270,1)
		SetFlag(OwnerID(),543914,1)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_1]","LuaS_423228_1",0)    --你還記得剛剛的事嗎？

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_2]","LuaS_423228_2",0)    --為什麼會突然間攻擊第一王女？
	end

end

function LuaS_423228_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	
		ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_1_1]")
		SetFlag(OwnerID(),543949,1)
		SetFlag(OwnerID(),543914,0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_3]","LuaS_423228_3",0)    --不，我想不是。

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_4]","LuaS_423228_3",0)    --是，也許妳真的瘋了。
	end

end

function LuaS_423228_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]仔細審視密函的內容)
		ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_2_1]")
		SetFlag(OwnerID(),543951,1)
		SetFlag(OwnerID(),543914,0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_3]","LuaS_423228_3",0)    --不，我想不是。

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_4]","LuaS_423228_3",0)    --是，也許妳真的瘋了。
	end

end

function LuaS_423228_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]仔細審視密函的內容)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_5]")
		SetFlag(OwnerID(),543953,1)
	end

	--say(OwnerID(),"OwnerID")
	--say(TargetID(),"TargetID")	
end

function LuaS_423228_complete()
	--say(OwnerID(),"OwnerID")
	--say(TargetID(),"TargetID")	
	AddBuff( TargetID()  , 506698 , 1 , 300 ) 	
	local ith = Lua_DW_CreateObj("obj",115201,OwnerID())   --ith假人	
	local baden = Lua_DW_CreateObj("flag" ,115165,780606 ,6)	     ---baden假人
	DisableQuest( ith , true )
	DisableQuest( baden , true )
	DW_MoveToFlag(baden,780606 , 7,0 ,1)	
	AdjustFaceDir( baden ,ith, 0 )	
	AdjustFaceDir( ith ,baden, 0 )	
	sleep(10)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(20)
	say(ith,"[SC_423228_6]")       		---你回來得正好，將這份密函送回達拉尼斯給「大將軍」蘭斯，有件事情需要調查。
	sleep(30)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---是!
	sleep(30)	
	DW_MoveToFlag(baden,780606 , 6,0 ,1)

	delobj(baden)
	delobj(ith)	
	CancelBuff( TargetID()  , 506698  ) 	--	
end


function LuaS_423279_cant()
SetSpeakDetail(OwnerID(),"[SC_423279_26]")

end

function LuaS_423279_can()
	CloseSpeak(OwnerID())

	BeginPlot(TargetID(),"LuaS_423279_accept",2)	
end
function LuaS_423279_accept()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506695 , 1 , 300 ) 

	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423279 , 506695,TargetID(),OwnerID(),100)	

	local hadi2 = Lua_DW_CreateObj("obj",115203,OwnerID())   --hadi假人	
	DisableQuest( hadi2 , true )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---用kara位置創造演戲用kara假人
	local kara2 = Lua_DW_CreateObj("obj",115204,kara)   --kara假人	
	DisableQuest( kara2 , true )
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---用hadi位置創造演戲用ith假人
	local ith = Lua_DW_CreateObj("obj",115202,ith2)   --ith假人
	DisableQuest( ith , true )
	Check_Drama_DA( ith , 423279 , 100 , 506695 ) 				---check distance
	sleep(10)
	
	say(kara2,"[SC_423279_0]")			---既然如此，[ZONE_SHADOR]先去處理妳們的千羽曆問題吧！
	sleep(30)
	say(kara2,"[SC_423279_1]")			---我留下來，[ZONE_KAIYA_VILLAGE]的失蹤事件交給我來解決。
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end
	AdjustFaceDir( ith ,kara2, 0 )	
	say(ith,"[SC_423279_2]")			---屬下不能讓您置身在危險之中。
	sleep(30)
	say(hadi2,"[SC_423279_3]")			---這一位究竟是誰？
	sleep(30)
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(kara2,"[SC_423279_4]")			---我就是「人王」[114369]！
	sleep(20)	
	say(hadi2,"[SC_423279_5]")			---人王！


	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423279_6]" ,  "0xFFFFFF00" ) 	---(突然一陣輕柔薰風悠然而至～)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423279_6]" ,  "0xFFFFFF00" ) 
	local shine = Lua_DW_CreateObj("flag" ,115219,780607,1)	     ---種特效隱形球
	DisableQuest( shine , true )
	CastSpell(shine,shine,495606)					----
	DW_MoveToFlag(shine,780607 , 2,0 ,1)			----隱形球飄過


	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(shine)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end


	
	--local ant = Lua_DW_CreateObj("flag" ,115205,780607,0)	     ---ant假人

	local ant2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115196 , 10000 , 0)	---用位置創造演戲用假人
	local ant = Lua_DW_CreateObj("obj",115205,ant2)   --假人
	DisableQuest( ant , true )
	MoveToFlagEnabled(ant,false)	
	AdjustFaceDir( ant ,kara2, 0 )	
	sleep(20)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(shine)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	DW_MoveToFlag(shine,780607 , 3,0 ,1)			----隱形球飄過
	delobj(shine)
	PlayMotion(ant,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	say(ant,"[SC_423279_7]")			---讓人王親自幫忙[ZONE_KAIYA_VILLAGE]居民的確不錯。
	sleep(30)

	AdjustFaceDir( kara2 ,ant, 0 )
	AdjustFaceDir( ith ,ant, 0 )	
	sleep(10)
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point ant
	say(kara2,"[SC_423279_8]")			---你是誰？
	sleep(20)		
	AdjustFaceDir( ant ,kara2, 0 )	
	sleep(10)
	say(ant,"[SC_423279_9]")			---我是精靈，[115205]。
	sleep(30)
	say(ant,"[SC_423279_10]")			---與你的祖先，坦帝歐斯．卡薩姆認識。
	sleep(30)

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(hadi2,"[SC_423279_11]")			-----[115205]…這個名字…千羽曆記載的封印之戰…你是「精靈王」[115205]！
	sleep(5)
	AdjustFaceDir( ith ,hadi2, 0 )	
	sleep(35)
	say(kara2,"[SC_423279_12]")			----與初代人王認識的精靈王，為什麼現在還…活著？
	sleep(5)
	AdjustFaceDir( ith ,ant, 0 )	
	sleep(30)

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(ant,"[SC_423279_13]")			---因為一些原因…那些已經是過去了。
	sleep(30)
	say(ant,"[SC_423279_14]")			----故人之後代，擁有初生嫩芽蓬勃旺盛的生命力，耀眼光芒熾熱閃爍。在你眼中，風雨是否不足為懼？
	sleep(45)
	say(kara2,"[SC_423279_15]")		---當然！無論如何，我都會親自解決[ZONE_KAIYA_VILLAGE]的問題！
	sleep(30)	
	say(ith,"[SC_423279_16]")			---這樣陛下會置身危險中，[114367]不會認同的！


	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end


	sleep(30)
	say(ant,"[SC_423279_17]")			---不用擔心，他知道此事，也同意這麼做。
	sleep(35)
	say(kara2,"[SC_423279_18]")		---那個頑固的蘭斯竟然會點頭同意……
	sleep(40)	
	say(ant,"[SC_423279_19]")			---面臨無法度過的危機時，我會在那裡，這一趟旅程裡請你不要以「人王」之名示人。
	sleep(40)
	say(kara2,"[SC_423279_20]")			---為什麼？
	sleep(20)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(ant,"[SC_423279_21]")			---坦帝歐斯．卡薩姆在成為被敬重的「人王」之前，只是一名平凡人。
	sleep(35)
	say(kara2,"[SC_423279_22]")			---哼！你等著看好了，我不會輸的！
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---離太遠
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	AdjustFaceDir( ant ,hadi2, 0 )
	say(ant,"[SC_423279_23]")			---此外，千羽曆確實產生一些問題，我將協助解決。
	sleep(30)
	say(hadi2,"[SC_423279_24]")			---能得到兩位的援助是[ZONE_SHADOR]的榮幸，我先代表[ZONE_SHADOR]向你們致上謝意。
	sleep(5)
	AdjustFaceDir( ith ,hadi2, 0 )	
	AdjustFaceDir( kara2 ,hadi2, 0 )	
	sleep(30)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	delobj(ith)
	delobj(kara2)
	delobj(hadi2)
	delobj(ant)
	CancelBuff( TargetID()  , 506695  ) 	--
	if	CheckAcceptQuest ( TargetID()   , 423279 )	 == true	then
		SetFlag(TargetID(),543974,1)
	end
end



function killball()
		local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115218 , 10000 , 1)
	say(OwnerID(),KK[1])
	say(OwnerID(),KK[2])
	say(OwnerID(),KK[3])	
	delobj(KK[1])
	delobj(KK[2])
end

function LuaS_wind()	--特效
	--AddBuff(OwnerID(),502928,1,300)
	--CastSpell(OwnerID() ,  OwnerID(), 495606)
end

function LuaS_423280()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423280 ) == true  and CheckFlag( OwnerID() , 543916) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423280_0]","LuaS_423280_0",0)	--
	end
	if CheckAcceptQuest( OwnerID() , 423279 ) == true  and CheckCompleteQuest( OwnerID() , 423279 ) == false   and CheckFlag( OwnerID() , 543974) == false  	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423279_25]","LuaS_423279_can",0)	
	end	
end

function LuaS_423280_0()
	SetSpeakDetail(OwnerID(),"[SC_423280_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423280_2]","LuaS_423280_1",0)	--
end

function LuaS_423280_1()
	SetSpeakDetail(OwnerID(),"[SC_423280_3]")
	SetFlag(OwnerID(),543916,1)
end

function LuaS_423280_complete()
	AddBuff( TargetID()  , 506701 , 1 , 300 ) 	
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---用hadi位置創造演戲用ith假人
	local ith = Lua_DW_CreateObj("obj",115222,ith2)   --ith假人
	DisableQuest( ith , true )
	local baden = Lua_DW_CreateObj("flag" ,115221,780606,6)	     ---tony假人
	DisableQuest( baden , true )
	DW_MoveToFlag(baden,780606 , 7,0 ,1)	
	AdjustFaceDir( baden ,ith, 0 )	
	AdjustFaceDir( ith ,baden, 0 )	
	sleep(10)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(20)
	say(baden,"[SC_423280_4]")		---副團長，這是[114367]回覆的密函。
	sleep(30)	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423280_5]" ,  "0xFFFFFF00" ) 	---([114368]仔細審視密函的內容)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423280_5]" ,  "0xFFFFFF00" ) 
	sleep(30)		
	say(ith,"[SC_423280_6]")       		---果然！那名使者接下出使[ZONE_SHADOR]的任務後就已經死亡，而且刻意選在大將軍與我不在時回[ZONE_DAELANIS]報告。
	sleep(40)
	say(ith,"[SC_423280_7]")       		---這一趟在[ZONE_SOUTHERN_JANOST_FOREST ]的行動，務必要找出在暗中操控屍體的人！
	sleep(40)
	say(ith,"[SC_423280_8]")       		---[115146]，你回去協助[114367]，有任何消息，第一時間回報。
	sleep(40)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---是!
	sleep(30)	
	DW_MoveToFlag(baden,780606 , 6,0 ,1)
	delobj(baden)
	delobj(ith)	
	CancelBuff( TargetID()  , 506701  ) 	--
end

function LuaS_423281_accept()

 	SetPosByFlag( TargetID()  , 780606 , 2 )
	CancelBuff( TargetID()  , 506703  ) 	--
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
	AddBuff( TargetID()  , 506702 , 1 , 300 ) 
	DisableQuest(OwnerID(),true)
	local hadi2 = Lua_DW_CreateObj("obj",115232,OwnerID())   --hadi假人	
	DisableQuest( hadi2 , true )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---用kara位置創造演戲用kara假人
	local kara2 = Lua_DW_CreateObj("obj",115233,kara)   --kara假人	
	DisableQuest( kara2 , true )
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---用hadi位置創造演戲用ith假人
	local ith = Lua_DW_CreateObj("obj",115231,ith2)   --ith假人
	DisableQuest( ith , true )
	local ant2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115196 , 10000 , 0)	---用kara位置創造演戲用kara假人
	local ant = Lua_DW_CreateObj("obj",115234,ant2)   --kara假人
	DisableQuest( ant , true )

	sleep(25)
	MoveToFlagEnabled(ith,false)
	MoveToFlagEnabled(kara2,false)
	MoveToFlagEnabled(ant,false)
	WriteRoleValue(kara2 , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )
	local pag = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115229 , 10000 , 0)	---用pag xyz
	local X = ReadRoleValue ( pag, EM_RoleValue_X)
	local Y = ReadRoleValue ( pag, EM_RoleValue_Y)
	local Z = ReadRoleValue ( pag, EM_RoleValue_Z)

	Check_Drama_DA( hadi2 , 423281 , 150 , 506702) 				---check distance

	say(kara2,"[SC_423281_0]")		---不用這麼麻煩！快點隨我去解決卡雅村的問題。
	sleep(10)		
	--LuaFunc_MoveToFlag( kara2, 780606 , 1 , 0 )
	Move(kara2,X,Y,Z)
	sleep(10)	
	say(ith,"[SC_423281_1]")		---陛下！
	AdjustFaceDir( ant ,kara, 0 )
	AdjustFaceDir( ith ,kara, 0 )

	--LuaFunc_MoveToFlag( ith, 780606 , 1 , 5 )
	Move(ith,X,Y,Z)
	sleep(10)		
	delobj(kara2)

	--sleep(10)
	Move(ant,X,Y,Z)
	sleep(10)
	delobj(ith)

	if Lua_Check_Drama_Statu(hadi2) == false then			---離太遠
		DisableQuest(OwnerID(),false)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506702  ) 
		CancelBuff( TargetID()  , 503977  ) 	--給玩家自由	
		return	
	end

	--DW_MoveToFlag(ant,780606 , 1,0 ,1)	
	sleep(60)
	delobj(ant)

	if Lua_Check_Drama_Statu(hadi2) == false then			---離太遠
		DisableQuest(OwnerID(),false)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506702  ) 
		CancelBuff( TargetID()  , 503977  ) 	--給玩家自由	
		return	
	end	

	AddBuff( TargetID()  , 506703 , 1 ,-1 ) 	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423281_2]" ,  "0xFFFFFF00" ) 	---(地上閃過一絲亮澤…)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423281_2]" ,  "0xFFFFFF00" ) 
	CastSpell(pag,pag,494493)

	say(hadi2,"[SC_423281_3]")		---哎！人王如此急切，他們之中有人把隨身物品遺落了。
	sleep(30)		
	say(hadi2,"[SC_423281_4]")		---你把物品拾起，趕緊追上他們吧，我直接請人把護具拿到門口，你待會記得找依耶塔‧摩爾拿取。
	sleep(30)	
	DisableQuest(OwnerID(),false)
	delobj(hadi2)
	CancelBuff( TargetID()  , 506702  ) 	--
	CancelBuff( TargetID()  , 503977  ) 	--給玩家自由
	
end

function LuaS_115229()

	SetPlot(OwnerID(),"touch","LuaS_115229_1",30)
end

function LuaS_115229_1()
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID() , 207272 ) < 1 then
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --
		GiveBodyItem ( OwnerID(), 207272, 1 )
	sleep(10)

	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --

	end
	SetPlot(TargetID(),"touch","LuaS_115229_1",30)
end

function LuaS_115253()
	LoadQuestOption( OwnerID() )
	if CountBodyItem ( OwnerID(), 207271 ) == 0 then
		if CheckFlag( OwnerID() , 543954 ) == false then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423281_5]","LuaS_115253_1",0)	--			
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423281_6]","LuaS_115253_2",0)	--
		end
	end
end

function LuaS_115253_1()
	SetSpeakDetail(OwnerID(),"[SC_423281_7]")
	SetFlag(OwnerID(),543954,1)
	GiveBodyItem ( OwnerID(), 207271, 1 )	
end

function LuaS_115253_2()
	SetSpeakDetail(OwnerID(),"[SC_423281_8]")
	GiveBodyItem ( OwnerID(), 207271, 1 )
end

function LuaS_115257()

	LoadQuestOption( OwnerID() )

	if	(CheckAcceptQuest(OwnerID(),423281)==true )and( CheckCompleteQuest( OwnerID(),423281)==false) then
		if CountBodyItem ( OwnerID(), 207271 ) > 0 then
			SetFlag(OwnerID(),543979,1)
			DelBodyItem(OwnerID(),207271,1)
		end
		if CountBodyItem ( OwnerID(), 207272 ) > 0 then
			SetFlag(OwnerID(),543980,1)
			DelBodyItem(OwnerID(),207272,1)
		end	
	
		if CheckFlag( OwnerID() , 543979 ) == false then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423281_10]" ,  "0xFFFFFF00" ) 	---第一王女赫蒂爾．吉昂特請你務必要從依耶塔‧摩爾手裡拿皮製護具交給人王。

			ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_423281_10]" ,  "0xFFFFFF00" ) 			
		end
		if CheckFlag( OwnerID() , 543980 ) == false then
			say(TargetID(),"[SC_423281_9]")				---我掉了一個星芒陣盒，你去幫我找回來！
		
		end
	end


end



