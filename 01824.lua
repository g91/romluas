function LuaS_115143()

end

function LuaS_114367()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0)    	             ---盢瓁﹍=0
end

function LuaS_423222_0()                                     				             -----铬狾
	if  ReadRoleValue( OwnerID(), EM_RoleValue_Register +1) == 0  then                   --+1ノ423222
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423222_plot",1)
	else
		SetSpeakDetail(OwnerID(),"[SC_423222_1]")
	end	


end

function LuaS_423222_plot()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
 	SetPosByFlag( TargetID()  , 780604 , 4 )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--產
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506612 , 1 , 300 ) 				
--	local lance = Lua_DW_CreateObj("obj",115141,OwnerID()) 			  --lance安
	local lance = LuaFunc_CreateObjByOBj( 115141, OwnerID() )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,114369  , 1000 , 0)
	--local kara2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115143  , 1000 , 0)
	local kara2 = Lua_DW_CreateObj("obj",115143,kara) 			 --kara安

	DisableQuest( lance , true )
	DisableQuest( kara2 , true )
--	Lua_ObjDontTouch( kara2 ) 						 --ぃ窱kara安
--	AdjustFaceDir( TargetID(),ith, 0 )	
	Hide(kara2)
	PlayMotionEX( kara2, ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
--	sleep(10)
	Show(kara2,Zone)

	--Lua_ObjDontTouch( lance ) 				--ぃ窱lance安
	say(lance,"[SC_423222_2]")					--ㄓ
	sleep(20)
	local ith = Lua_DW_CreateObj("flag" ,115142,780604,1)	--レ盳ゞ安
	DisableQuest( ith , true )
	--Lua_ObjDontTouch( ith ) 				--ぃ窱ith安
	sleep(20)




	Lua_Drama_Radar( lance , 423222 )                           	 --浪喷產琌临絬 

	DW_MoveToFlag(ith,780604 , 2,0 ,2)
	if Lua_Check_Drama_Statu(lance) == false then             	---ぃ絬
		CancelBuff( TargetID()  , 503977  ) 		--临產パ
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
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--羭も搂
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	--羭も搂
	sleep(20)
	AdjustFaceDir( ith ,lance, 0 )	
	say(ith,"[SC_423222_3]")					--钮弧Τ璶ㄆ薄惠璶坝癚
	sleep(20)

	say(lance,"[SC_423222_4]")					--垛﹑莱赣笵[ZONE_SHADOR]⊿Τ畊烩瓣穦某
	sleep(30)
 	say(ith,"[SC_423222_5]")					--琌妮ぃフ
	sleep(40)	
	say(lance,"[SC_423222_6]")					--埃ぇ懂程桂綝脓阑チア萝ㄆン繵肚琌[ZONE_SHADOR]┶荡懂―穿
	sleep(40)				
 	say(ith,"[SC_423222_7]")					--┶荡や穿眤弧琌[ZONE_SHADOR]或穦[ZONE_SHADOR]癸ネ㏑跌ぃ莱赣穦Г跌ぃ恨
	sleep(40)	
	say(lance,"[SC_423222_8]")					--硂琌懂―穿獺
	sleep(10)	
	if Lua_Check_Drama_Statu(lance) == false then
		CancelBuff( TargetID()  , 503977  ) 		--临產パ
		CancelBuff( TargetID()  , 506612  ) 		--
		SetFlag(TargetID(),543949,0)
		SetFlag(TargetID(),543951,0)	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(lance)
		delobj(ith)
		delobj(kara2)	
		return		
	end
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423222_9]", "0xff8080ff" )--([114367]р獺ユ倒[114368])
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423222_9]",  "0xff8080ff" )--([114367]р獺ユ倒[114368])
	sleep(30)		
	say(ith,"[SC_423222_10]")					--叫琵妮[ZONE_SHADOR]秆薄猵ō粪み肕刮捌刮籔[ZONE_SHADOR]材妮Τ砫ヴ络睲硂ちㄓ纒
	sleep(40)	
	AdjustFaceDir( lance,kara2, 0 )
	say(lance,"[SC_423222_11]")					--種琌
	sleep(5)	
	AdjustFaceDir( ith,kara2, 0 )
	sleep(15)	
	say(kara2,"[SC_423222_12]")				--и砛﹑甃焊﹚璶矪瞶
	sleep(30)	
	AdjustFaceDir( lance,ith, 0 )
	sleep(5)	
	AdjustFaceDir( ith ,lance, 0 )	
	say(lance,"[SC_423222_13]")					--ê或盿ê顶肕玡┕︺瞷禬戳砛[ZONE_SHADOR]腊眔Γ
	sleep(40)	
	say(ith,"[SC_423222_14]")					--琌
	sleep(20)
	AdjustFaceDir( ith ,kara2, 0 )	
	sleep(10)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --羭も搂
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	   --羭も搂
	
	sleep(20)	
	DW_MoveToFlag(ith,780604 , 3,0 ,1)	
	delobj(lance)
	delobj(ith)
	delobj(kara2)
	if	CheckAcceptQuest ( TargetID()   , 423222 )	 == true	then	
		GiveBodyItem(TargetID(),543928,1)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	CancelBuff( TargetID()  , 506612  ) 			--临產パ
	CancelBuff( TargetID()  , 503977  ) 			--临產パ
end
