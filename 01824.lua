function LuaS_115143()

end

function LuaS_114367()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0)    	             ---大將軍初始=0
end

function LuaS_423222_0()                                     				             -----跳板
	if  ReadRoleValue( OwnerID(), EM_RoleValue_Register +1) == 0  then                   --+1用於423222
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423222_plot",1)
	else
		SetSpeakDetail(OwnerID(),"[SC_423222_1]")
	end	


end

function LuaS_423222_plot()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
 	SetPosByFlag( TargetID()  , 780604 , 4 )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506612 , 1 , 300 ) 				
--	local lance = Lua_DW_CreateObj("obj",115141,OwnerID()) 			  --lance假人
	local lance = LuaFunc_CreateObjByOBj( 115141, OwnerID() )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,114369  , 1000 , 0)
	--local kara2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115143  , 1000 , 0)
	local kara2 = Lua_DW_CreateObj("obj",115143,kara) 			 --kara假人

	DisableQuest( lance , true )
	DisableQuest( kara2 , true )
--	Lua_ObjDontTouch( kara2 ) 						 --不能碰kara假人
--	AdjustFaceDir( TargetID(),ith, 0 )	
	Hide(kara2)
	PlayMotionEX( kara2, ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
--	sleep(10)
	Show(kara2,Zone)

	--Lua_ObjDontTouch( lance ) 				--不能碰lance假人
	say(lance,"[SC_423222_2]")					--她來了
	sleep(20)
	local ith = Lua_DW_CreateObj("flag" ,115142,780604,1)	--伊崔妮假人
	DisableQuest( ith , true )
	--Lua_ObjDontTouch( ith ) 				--不能碰ith假人
	sleep(20)




	Lua_Drama_Radar( lance , 423222 )                           	 --檢驗玩家是否還在線上 

	DW_MoveToFlag(ith,780604 , 2,0 ,2)
	if Lua_Check_Drama_Statu(lance) == false then             	---不在線上
		CancelBuff( TargetID()  , 503977  ) 		--還玩家自由
		CancelBuff( TargetID()  , 506612  ) 		--
		SetFlag(TargetID(),543949,0)
		SetFlag(TargetID(),543951,0)	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(lance)
		delobj(ith)
		delobj(kara2)		
		return		
	end

	WriteRoleValue(ith, EM_RoleValue_IsWalk, 1)

	AdjustFaceDir( ith ,kara2, 0 )	
	AdjustFaceDir( lance,ith, 0 )
	sleep(10)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--舉手禮
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	--舉手禮
	sleep(20)
	AdjustFaceDir( ith ,lance, 0 )	
	say(ith,"[SC_423222_3]")					--聽說有重要的事情需要商討。
	sleep(20)

	say(lance,"[SC_423222_4]")					--嗯，妳應該知道，[ZONE_SHADOR]沒有出席領主國會議。
	sleep(30)
 	say(ith,"[SC_423222_5]")					--…是的，屬下也不明白原因…
	sleep(40)	
	say(lance,"[SC_423222_6]")					--除此之外，卡雅村最近屢遭襲擊，村民失蹤事件頻傳，但是[ZONE_SHADOR]拒絕了卡雅村的求援。
	sleep(40)				
 	say(ith,"[SC_423222_7]")					--拒絕支援？您說的是「[ZONE_SHADOR]」？怎麼會…以[ZONE_SHADOR]對生命的重視，不應該會坐視不管…
	sleep(40)	
	say(lance,"[SC_423222_8]")					--這是卡雅村的求援信。
	sleep(10)	
	if Lua_Check_Drama_Statu(lance) == false then
		CancelBuff( TargetID()  , 503977  ) 		--還玩家自由
		CancelBuff( TargetID()  , 506612  ) 		--
		SetFlag(TargetID(),543949,0)
		SetFlag(TargetID(),543951,0)	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(lance)
		delobj(ith)
		delobj(kara2)	
		return		
	end
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423222_9]", "0xff8080ff" )--([114367]把信交給[114368])
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423222_9]",  "0xff8080ff" )--([114367]把信交給[114368])
	sleep(30)		
	say(ith,"[SC_423222_10]")					--請讓屬下去[ZONE_SHADOR]了解情況！身為獅心騎士團副團長與[ZONE_SHADOR]第二王女，屬下有責任去釐清這一切的來龍去脈。
	sleep(40)	
	AdjustFaceDir( lance,kara2, 0 )
	say(lance,"[SC_423222_11]")					--人王的意思是？
	sleep(5)	
	AdjustFaceDir( ith,kara2, 0 )
	sleep(15)	
	say(kara2,"[SC_423222_12]")				--可以，我准許妳去夏多爾，一定要處理好！
	sleep(30)	
	AdjustFaceDir( lance,ith, 0 )
	sleep(5)	
	AdjustFaceDir( ith ,lance, 0 )	
	say(lance,"[SC_423222_13]")					--那麼，也帶那名初階騎士一同前往吧，他在艾翁的表現超乎期待，也許在[ZONE_SHADOR]能幫得上忙。
	sleep(40)	
	say(ith,"[SC_423222_14]")					--是！
	sleep(20)
	AdjustFaceDir( ith ,kara2, 0 )	
	sleep(10)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --舉手禮
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	   --舉手禮
	
	sleep(20)	
	DW_MoveToFlag(ith,780604 , 3,0 ,1)	
	delobj(lance)
	delobj(ith)
	delobj(kara2)
	if	CheckAcceptQuest ( TargetID()   , 423222 )	 == true	then	
		GiveBodyItem(TargetID(),543928,1)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	CancelBuff( TargetID()  , 506612  ) 			--還玩家自由
	CancelBuff( TargetID()  , 503977  ) 			--還玩家自由
end
