function LuaS_423228()
	LoadQuestOption( OwnerID() )

	if CheckFlag(OwnerID() , 543914) == true then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_1]","LuaS_423228_1",0)    --�A�ٰO�o��誺�ƶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_2]","LuaS_423228_2",0)    --������|��M�������Ĥ@���k�H	
		return
	end					
	if CheckFlag(OwnerID() , 543949) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_7]","LuaS_423228_1",0)    --�A�ٰO�o��誺�ƶܡH
		return
	end		
	if CheckFlag(OwnerID() , 543951) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_8]","LuaS_423228_1",0)    --������|��M�������Ĥ@���k�H	
		return
	else
		if CountBodyItem( OwnerID() , 207270 ) > 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423228]","LuaS_423228_0",0)	--�A�٦n�ܡH�ٵ��A�A�o�O���Q�豼������C 
		end
	end

end

function LuaS_423228_0()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]�J�Ӽf���K�窺���e)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_0]")
		DelBodyItem(OwnerID(),207270,1)
		SetFlag(OwnerID(),543914,1)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_1]","LuaS_423228_1",0)    --�A�ٰO�o��誺�ƶܡH

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_2]","LuaS_423228_2",0)    --������|��M�������Ĥ@���k�H
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
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_3]","LuaS_423228_3",0)    --���A�ڷQ���O�C

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_4]","LuaS_423228_3",0)    --�O�A�]�\�p�u���ƤF�C
	end

end

function LuaS_423228_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]�J�Ӽf���K�窺���e)
		ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423228_2_1]")
		SetFlag(OwnerID(),543951,1)
		SetFlag(OwnerID(),543914,0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_3]","LuaS_423228_3",0)    --���A�ڷQ���O�C

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423228_4]","LuaS_423228_3",0)    --�O�A�]�\�p�u���ƤF�C
	end

end

function LuaS_423228_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---([114368]�J�Ӽf���K�窺���e)
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
	local ith = Lua_DW_CreateObj("obj",115201,OwnerID())   --ith���H	
	local baden = Lua_DW_CreateObj("flag" ,115165,780606 ,6)	     ---baden���H
	DisableQuest( ith , true )
	DisableQuest( baden , true )
	DW_MoveToFlag(baden,780606 , 7,0 ,1)	
	AdjustFaceDir( baden ,ith, 0 )	
	AdjustFaceDir( ith ,baden, 0 )	
	sleep(10)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(20)
	say(ith,"[SC_423228_6]")       		---�A�^�ӱo���n�A�N�o���K��e�^�F�ԥ������u�j�N�x�v�����A����Ʊ��ݭn�լd�C
	sleep(30)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---�O!
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

	local hadi2 = Lua_DW_CreateObj("obj",115203,OwnerID())   --hadi���H	
	DisableQuest( hadi2 , true )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---��kara��m�гy�t����kara���H
	local kara2 = Lua_DW_CreateObj("obj",115204,kara)   --kara���H	
	DisableQuest( kara2 , true )
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---��hadi��m�гy�t����ith���H
	local ith = Lua_DW_CreateObj("obj",115202,ith2)   --ith���H
	DisableQuest( ith , true )
	Check_Drama_DA( ith , 423279 , 100 , 506695 ) 				---check distance
	sleep(10)
	
	say(kara2,"[SC_423279_0]")			---�J�M�p���A[ZONE_SHADOR]���h�B�z�p�̪��d�о���D�a�I
	sleep(30)
	say(kara2,"[SC_423279_1]")			---�گd�U�ӡA[ZONE_KAIYA_VILLAGE]�����ܨƥ�浹�ڨӸѨM�C
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end
	AdjustFaceDir( ith ,kara2, 0 )	
	say(ith,"[SC_423279_2]")			---�ݤU�������z�m���b�M�I�����C
	sleep(30)
	say(hadi2,"[SC_423279_3]")			---�o�@��s���O�֡H
	sleep(30)
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(kara2,"[SC_423279_4]")			---�ڴN�O�u�H���v[114369]�I
	sleep(20)	
	say(hadi2,"[SC_423279_5]")			---�H���I


	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423279_6]" ,  "0xFFFFFF00" ) 	---(��M�@�}���X�ȭ��y�M�Ӧܡ�)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423279_6]" ,  "0xFFFFFF00" ) 
	local shine = Lua_DW_CreateObj("flag" ,115219,780607,1)	     ---�دS�����βy
	DisableQuest( shine , true )
	CastSpell(shine,shine,495606)					----
	DW_MoveToFlag(shine,780607 , 2,0 ,1)			----���βy�ƹL


	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(shine)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end


	
	--local ant = Lua_DW_CreateObj("flag" ,115205,780607,0)	     ---ant���H

	local ant2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115196 , 10000 , 0)	---�Φ�m�гy�t���ΰ��H
	local ant = Lua_DW_CreateObj("obj",115205,ant2)   --���H
	DisableQuest( ant , true )
	MoveToFlagEnabled(ant,false)	
	AdjustFaceDir( ant ,kara2, 0 )	
	sleep(20)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
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

	DW_MoveToFlag(shine,780607 , 3,0 ,1)			----���βy�ƹL
	delobj(shine)
	PlayMotion(ant,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	say(ant,"[SC_423279_7]")			---���H���˦�����[ZONE_KAIYA_VILLAGE]�~�����T�����C
	sleep(30)

	AdjustFaceDir( kara2 ,ant, 0 )
	AdjustFaceDir( ith ,ant, 0 )	
	sleep(10)
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point ant
	say(kara2,"[SC_423279_8]")			---�A�O�֡H
	sleep(20)		
	AdjustFaceDir( ant ,kara2, 0 )	
	sleep(10)
	say(ant,"[SC_423279_9]")			---�ڬO���F�A[115205]�C
	sleep(30)
	say(ant,"[SC_423279_10]")			---�P�A�������A�Z�Ҽڴ��D�d�ĩi�{�ѡC
	sleep(30)

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(hadi2,"[SC_423279_11]")			-----[115205]�K�o�ӦW�r�K�d�о�O�����ʦL���ԡK�A�O�u���F���v[115205]�I
	sleep(5)
	AdjustFaceDir( ith ,hadi2, 0 )	
	sleep(35)
	say(kara2,"[SC_423279_12]")			----�P��N�H���{�Ѫ����F���A������{�b�١K���ۡH
	sleep(5)
	AdjustFaceDir( ith ,ant, 0 )	
	sleep(30)

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(ant,"[SC_423279_13]")			---�]���@�ǭ�]�K���Ǥw�g�O�L�h�F�C
	sleep(30)
	say(ant,"[SC_423279_14]")			----�G�H����N�A�֦���͹�޽��k�������ͩR�O�Aģ�����~�K���{�{�C�b�A�����A���B�O�_�������ߡH
	sleep(45)
	say(kara2,"[SC_423279_15]")		---��M�I�L�צp��A�ڳ��|�˦۸ѨM[ZONE_KAIYA_VILLAGE]�����D�I
	sleep(30)	
	say(ith,"[SC_423279_16]")			---�o�˰��U�|�m���M�I���A[114367]���|�{�P���I


	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
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
	say(ant,"[SC_423279_17]")			---���ξ�ߡA�L���D���ơA�]�P�N�o�򰵡C
	sleep(35)
	say(kara2,"[SC_423279_18]")		---���ӹx�T���������M�|�I�Y�P�N�K�K
	sleep(40)	
	say(ant,"[SC_423279_19]")			---���{�L�k�׹L���M���ɡA�ڷ|�b���̡A�o�@��ȵ{�̽ЧA���n�H�u�H���v���W�ܤH�C
	sleep(40)
	say(kara2,"[SC_423279_20]")			---������H
	sleep(20)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		DisableQuest(OwnerID(),false)
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506695  ) 	
		return	
	end

	say(ant,"[SC_423279_21]")			---�Z�Ҽڴ��D�d�ĩi�b�����Q�q�����u�H���v���e�A�u�O�@�W���Z�H�C
	sleep(35)
	say(kara2,"[SC_423279_22]")			---��I�A���۬ݦn�F�A�ڤ��|�骺�I
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
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
	say(ant,"[SC_423279_23]")			---���~�A�d�о�T�겣�ͤ@�ǰ��D�A�ڱN��U�ѨM�C
	sleep(30)
	say(hadi2,"[SC_423279_24]")			---��o���쪺���U�O[ZONE_SHADOR]���a���A�ڥ��N��[ZONE_SHADOR]�V�A�̭P�W�·N�C
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

function LuaS_wind()	--�S��
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
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---��hadi��m�гy�t����ith���H
	local ith = Lua_DW_CreateObj("obj",115222,ith2)   --ith���H
	DisableQuest( ith , true )
	local baden = Lua_DW_CreateObj("flag" ,115221,780606,6)	     ---tony���H
	DisableQuest( baden , true )
	DW_MoveToFlag(baden,780606 , 7,0 ,1)	
	AdjustFaceDir( baden ,ith, 0 )	
	AdjustFaceDir( ith ,baden, 0 )	
	sleep(10)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(20)
	say(baden,"[SC_423280_4]")		---�ƹΪ��A�o�O[114367]�^�Ъ��K��C
	sleep(30)	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423280_5]" ,  "0xFFFFFF00" ) 	---([114368]�J�Ӽf���K�窺���e)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423280_5]" ,  "0xFFFFFF00" ) 
	sleep(30)		
	say(ith,"[SC_423280_6]")       		---�G�M�I���W�Ϫ̱��U�X��[ZONE_SHADOR]�����ȫ�N�w�g���`�A�ӥB��N��b�j�N�x�P�ڤ��b�ɦ^[ZONE_DAELANIS]���i�C
	sleep(40)
	say(ith,"[SC_423280_7]")       		---�o�@��b[ZONE_SOUTHERN_JANOST_FOREST ]����ʡA�ȥ��n��X�b�t���ޱ����骺�H�I
	sleep(40)
	say(ith,"[SC_423280_8]")       		---[115146]�A�A�^�h��U[114367]�A����������A�Ĥ@�ɶ��^���C
	sleep(40)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---�O!
	sleep(30)	
	DW_MoveToFlag(baden,780606 , 6,0 ,1)
	delobj(baden)
	delobj(ith)	
	CancelBuff( TargetID()  , 506701  ) 	--
end

function LuaS_423281_accept()

 	SetPosByFlag( TargetID()  , 780606 , 2 )
	CancelBuff( TargetID()  , 506703  ) 	--
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
	AddBuff( TargetID()  , 506702 , 1 , 300 ) 
	DisableQuest(OwnerID(),true)
	local hadi2 = Lua_DW_CreateObj("obj",115232,OwnerID())   --hadi���H	
	DisableQuest( hadi2 , true )	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---��kara��m�гy�t����kara���H
	local kara2 = Lua_DW_CreateObj("obj",115233,kara)   --kara���H	
	DisableQuest( kara2 , true )
	local ith2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153 , 10000 , 0)	---��hadi��m�гy�t����ith���H
	local ith = Lua_DW_CreateObj("obj",115231,ith2)   --ith���H
	DisableQuest( ith , true )
	local ant2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115196 , 10000 , 0)	---��kara��m�гy�t����kara���H
	local ant = Lua_DW_CreateObj("obj",115234,ant2)   --kara���H
	DisableQuest( ant , true )

	sleep(25)
	MoveToFlagEnabled(ith,false)
	MoveToFlagEnabled(kara2,false)
	MoveToFlagEnabled(ant,false)
	WriteRoleValue(kara2 , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )
	local pag = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115229 , 10000 , 0)	---��pag xyz
	local X = ReadRoleValue ( pag, EM_RoleValue_X)
	local Y = ReadRoleValue ( pag, EM_RoleValue_Y)
	local Z = ReadRoleValue ( pag, EM_RoleValue_Z)

	Check_Drama_DA( hadi2 , 423281 , 150 , 506702) 				---check distance

	say(kara2,"[SC_423281_0]")		---���γo��·СI���I�H�ڥh�ѨM�d���������D�C
	sleep(10)		
	--LuaFunc_MoveToFlag( kara2, 780606 , 1 , 0 )
	Move(kara2,X,Y,Z)
	sleep(10)	
	say(ith,"[SC_423281_1]")		---���U�I
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

	if Lua_Check_Drama_Statu(hadi2) == false then			---���ӻ�
		DisableQuest(OwnerID(),false)
		delobj(hadi2)
		delobj(ant)
		CancelBuff( TargetID()  , 506702  ) 
		CancelBuff( TargetID()  , 503977  ) 	--�����a�ۥ�	
		return	
	end

	--DW_MoveToFlag(ant,780606 , 1,0 ,1)	
	sleep(60)
	delobj(ant)

	if Lua_Check_Drama_Statu(hadi2) == false then			---���ӻ�
		DisableQuest(OwnerID(),false)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506702  ) 
		CancelBuff( TargetID()  , 503977  ) 	--�����a�ۥ�	
		return	
	end	

	AddBuff( TargetID()  , 506703 , 1 ,-1 ) 	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423281_2]" ,  "0xFFFFFF00" ) 	---(�a�W�{�L�@���G�A�K)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423281_2]" ,  "0xFFFFFF00" ) 
	CastSpell(pag,pag,494493)

	say(hadi2,"[SC_423281_3]")		---�u�I�H���p������A�L�̤������H���H�����~�򸨤F�C
	sleep(30)		
	say(hadi2,"[SC_423281_4]")		---�A�⪫�~�B�_�A����l�W�L�̧a�A�ڪ����ФH���@�㮳����f�A�A�ݷ|�O�o��̭C��E���������C
	sleep(30)	
	DisableQuest(OwnerID(),false)
	delobj(hadi2)
	CancelBuff( TargetID()  , 506702  ) 	--
	CancelBuff( TargetID()  , 503977  ) 	--�����a�ۥ�
	
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
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423281_10]" ,  "0xFFFFFF00" ) 	---�Ĥ@���k�������D�N���S�ЧA�ȥ��n�q�̭C��E������̮��ֻs�@��浹�H���C

			ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_423281_10]" ,  "0xFFFFFF00" ) 			
		end
		if CheckFlag( OwnerID() , 543980 ) == false then
			say(TargetID(),"[SC_423281_9]")				---�ڱ��F�@�ӬP�~�}���A�A�h���ڧ�^�ӡI
		
		end
	end


end



