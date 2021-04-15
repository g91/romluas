function LuaS_115143()

end

function LuaS_114367()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0)    	             ---�j�N�x��l=0
end

function LuaS_423222_0()                                     				             -----���O
	if  ReadRoleValue( OwnerID(), EM_RoleValue_Register +1) == 0  then                   --+1�Ω�423222
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423222_plot",1)
	else
		SetSpeakDetail(OwnerID(),"[SC_423222_1]")
	end	


end

function LuaS_423222_plot()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
 	SetPosByFlag( TargetID()  , 780604 , 4 )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506612 , 1 , 300 ) 				
--	local lance = Lua_DW_CreateObj("obj",115141,OwnerID()) 			  --lance���H
	local lance = LuaFunc_CreateObjByOBj( 115141, OwnerID() )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,114369  , 1000 , 0)
	--local kara2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115143  , 1000 , 0)
	local kara2 = Lua_DW_CreateObj("obj",115143,kara) 			 --kara���H

	DisableQuest( lance , true )
	DisableQuest( kara2 , true )
--	Lua_ObjDontTouch( kara2 ) 						 --����Ikara���H
--	AdjustFaceDir( TargetID(),ith, 0 )	
	Hide(kara2)
	PlayMotionEX( kara2, ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
--	sleep(10)
	Show(kara2,Zone)

	--Lua_ObjDontTouch( lance ) 				--����Ilance���H
	say(lance,"[SC_423222_2]")					--�o�ӤF
	sleep(20)
	local ith = Lua_DW_CreateObj("flag" ,115142,780604,1)	--��Z�g���H
	DisableQuest( ith , true )
	--Lua_ObjDontTouch( ith ) 				--����Iith���H
	sleep(20)




	Lua_Drama_Radar( lance , 423222 )                           	 --���窱�a�O�_�٦b�u�W 

	DW_MoveToFlag(ith,780604 , 2,0 ,2)
	if Lua_Check_Drama_Statu(lance) == false then             	---���b�u�W
		CancelBuff( TargetID()  , 503977  ) 		--�٪��a�ۥ�
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
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--�|��§
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	--�|��§
	sleep(20)
	AdjustFaceDir( ith ,lance, 0 )	
	say(ith,"[SC_423222_3]")					--ť�������n���Ʊ��ݭn�ӰQ�C
	sleep(20)

	say(lance,"[SC_423222_4]")					--��A�p���Ӫ��D�A[ZONE_SHADOR]�S���X�u��D��|ĳ�C
	sleep(30)
 	say(ith,"[SC_423222_5]")					--�K�O���A�ݤU�]�����խ�]�K
	sleep(40)	
	say(lance,"[SC_423222_6]")					--�������~�A�d�����̪��Dŧ���A�������ܨƥ��W�ǡA���O[ZONE_SHADOR]�ڵ��F�d�������D���C
	sleep(40)				
 	say(ith,"[SC_423222_7]")					--�ڵ��䴩�H�z�����O�u[ZONE_SHADOR]�v�H���|�K�H[ZONE_SHADOR]��ͩR�������A�����ӷ|�������ޡK
	sleep(40)	
	say(lance,"[SC_423222_8]")					--�o�O�d�������D���H�C
	sleep(10)	
	if Lua_Check_Drama_Statu(lance) == false then
		CancelBuff( TargetID()  , 503977  ) 		--�٪��a�ۥ�
		CancelBuff( TargetID()  , 506612  ) 		--
		SetFlag(TargetID(),543949,0)
		SetFlag(TargetID(),543951,0)	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(lance)
		delobj(ith)
		delobj(kara2)	
		return		
	end
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423222_9]", "0xff8080ff" )--([114367]��H�浹[114368])
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423222_9]",  "0xff8080ff" )--([114367]��H�浹[114368])
	sleep(30)		
	say(ith,"[SC_423222_10]")					--�����ݤU�h[ZONE_SHADOR]�F�ѱ��p�I��������M�h�ΰƹΪ��P[ZONE_SHADOR]�ĤG���k�A�ݤU���d���h��M�o�@�������s�h�ߡC
	sleep(40)	
	AdjustFaceDir( lance,kara2, 0 )
	say(lance,"[SC_423222_11]")					--�H�����N��O�H
	sleep(5)	
	AdjustFaceDir( ith,kara2, 0 )
	sleep(15)	
	say(kara2,"[SC_423222_12]")				--�i�H�A�ڭ�\�p�h�L�h���A�@�w�n�B�z�n�I
	sleep(30)	
	AdjustFaceDir( lance,ith, 0 )
	sleep(5)	
	AdjustFaceDir( ith ,lance, 0 )	
	say(lance,"[SC_423222_13]")					--����A�]�a���W�춥�M�h�@�P�e���a�A�L�b��Ϊ���{�W�G���ݡA�]�\�b[ZONE_SHADOR]�����o�W���C
	sleep(40)	
	say(ith,"[SC_423222_14]")					--�O�I
	sleep(20)
	AdjustFaceDir( ith ,kara2, 0 )	
	sleep(10)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�|��§
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�|��§
	
	sleep(20)	
	DW_MoveToFlag(ith,780604 , 3,0 ,1)	
	delobj(lance)
	delobj(ith)
	delobj(kara2)
	if	CheckAcceptQuest ( TargetID()   , 423222 )	 == true	then	
		GiveBodyItem(TargetID(),543928,1)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	CancelBuff( TargetID()  , 506612  ) 			--�٪��a�ۥ�
	CancelBuff( TargetID()  , 503977  ) 			--�٪��a�ۥ�
end
