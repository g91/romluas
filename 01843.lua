

---------------------423194--------------------------------
function LuaS_423194_0()		----player => owner   ;  ���βy => target	
	SetPlot(OwnerID() , "range","LuaS_423194_1",100)
end

function LuaS_423194_1()		----player => owner   ;  ���βy => target	
	if 	CheckAcceptQuest( OwnerID() , 423194 ) == true	and	----����423194
		CheckFlag( OwnerID() , 543996) == false	and	----�S������flag
		CheckBuff(OwnerID() , 506728) == false	and	----�S������buff
		CheckBuff(OwnerID() , 506727) == false	then	----�S���t��buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then	----not buzy then �t��,���t��buff
				WriteRoleValue ( TargetID() , EM_RoleValue_Register +2,0 )
				AddBuff(OwnerID(),506728,1,600)				
				BeginPlot(TargetID(),"LuaS_423194_3",1)
		else									----buzy then ������buff
				BeginPlot(TargetID(),"LuaS_423194_2",1)
		end
	end 
end

function LuaS_423194_2()		----player => target   ;  ���βy => Owner	
	tell(TargetID()  ,OwnerID()  , "[SC_423194_0]")	
	tell(OwnerID()  ,TargetID()  , "[SC_423194_0]")	
	--WriteRoleValue(OwnerID()  , EM_RoleValue_Register +1,0)	
	AddBuff(TargetID(),506728,1,60)				---��������BUFF

end

function LuaS_423194_3()		----player => target   ;  ���βy => Owner
	

	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)			---buzy		
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Local buzy = 1
	while buzy == 1 do							---�u�nBUZY��1�Y���ƺt��
	
		if	 ReadRoleValue( OwnerID(), EM_RoleValue_Register +2) == 0	then
			BeginPlot(OwnerID(),"LuaS_423194_noquest",0)
		end  
		local Player = SearchRangePlayer ( OwnerID() , 100 )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506728) == true	then
				CancelBuff( player[i]  , 506728  ) 	--
				AddBuff(player[i],506727,1,400)
			end
		end		
---------------------
		Local be =    Lua_DW_CreateObj("flag" ,115350,780609,0)		---�إX�s
		Local gu =    Lua_DW_CreateObj("flag" ,115351,780609,1)
		local mo2 = LuaFunc_SearchNPCbyOrgID( be,115356 , 10000 , 0)	---��mo��m�гy�t����mo���H
		local mo = Lua_DW_CreateObj("obj",115352,mo2)   --mo���H
		DisableQuest( be , true )
		DisableQuest( gu , true )
		DisableQuest( mo , true )
		PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --���U				
		sleep(20)
		WriteRoleValue(be , EM_RoleValue_IsWalk, 1 )	
		WriteRoleValue(gu , EM_RoleValue_IsWalk, 1 )	

	
		Yell(be,"[SC_423194_1]",3)								-----�o�U�o�ҽT�w�F�a�H�W�������L���O�A�d�U���ٷ|���֡H�s�M�H�ͪ��Ĥl�A�쩳�N�O�C�H�F�@�I�A���X�o�بƱ��A�A�H����L�s�ٮe�o�U�A�ܡH

		sleep(50)



		Yell(gu,"[SC_423194_2]",3)								-----���|�O����J�D��L�S�����A�ګH���L�C����J�D��L�S���i��O�A������a�I�藍�_�A�쥻�ڥu�O���I�Q���A�B�Q�����A�A�S���Q��|�Q���Ǽw�Q�����D�K�K
		sleep(50)
		Yell(be,"[SC_423194_3]",3)								-----���ά�����J�D��L�S���G�F�C���Ǥ����sŧ���������K���]�O�L�F�X�ӡA�G�M�O�~�ӧC�H����ΩҥͤU���Ĥl�C
		sleep(50)



		PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�|��§
		Yell(mo,"[SC_423194_4]",3)								-----�ڷ|�ҩ��ۤv���M�աA���Ǽw�Q�C�ڪ��P��O�̦n���ҤH�A�ܩ�o�������u�ۡA�ڷ|�ԥ[�լd�ÿ˦ۦV�k�������������СC

		sleep(50)	
		Yell(be,"[SC_423194_5]",3)								-----��A�q�{�b�_�A�̦n�ֽs´�n�A���Ǥf�A�_�h�ڵ����|��æV�k������������ĳ��A�����������@�˭�ܨ��ϥΤ������v�Q�A��ܧA�����s�ڪ����C
	
		sleep(20)
		DW_MoveToFlag(be,780609 , 3,0 ,1)	



		delobj(be)
		Yell(gu,"[SC_423194_6]",3)								-----����J�D��L�S�A�b���Ǽw�Q�|����W���ڡA�ڴ��h��M�A�ۦ������v���V�F���Q���ӥޡC�ڷ|�^�h�V���˽T�{�o�Ǧ~�O�_�٦����A�@�˪��b�s�H�A�٧A�M�աC

		sleep(30)				
		DW_MoveToFlag(gu,780609 , 3,0 ,1)	
		delobj(gu)

		local Player5 = SearchRangePlayer ( OwnerID() , 300 )					----���b�����~�ݪ���
		for i = 0 , table.getn(Player5) do
			if	CheckBuff(player5[i] , 506727) == true	then
				ScriptMessage( player5[i] , player5[i] , 0 , "[SC_423194_7]" ,  "0xFFFFFF00" ) 		-----����J�D��L�S�y�⪺�����a�ۤ@�Ǹ��C
				ScriptMessage( player5[i] , player5[i] , 1 , "[SC_423194_7]" ,  "0xFFFFFF00" ) 
			end
		end

		sleep(30)
		AdjustFaceDir( mo ,TargetID(), 0 )							----����J��V���a
		sleep(10)
		Yell(mo,"[SC_423194_8]",3)								-----��A�A�ӤF�H
		sleep(30)								
		delobj(mo)
------------------------
		local Player2 = SearchRangePlayer ( OwnerID() , 150 )			----�bĲ�o�I����B���t��BUFF�����a�����X��
		for i = 0 , table.getn(Player2) do
			if	CheckBuff(player2[i] , 506727) == true	and	CheckAcceptQuest( player2[i] , 423194 ) == true		then
				SetFlag(player2[i],543996,1)	--give mission flag
				CancelBuff( player2[i]  , 506727  ) 	--
			end
		end

		local Player22 = SearchRangePlayer ( mo2 , 150 )			----�b����J����B���t��BUFF�����a�����X��
		for i = 0 , table.getn(Player22) do
			if	CheckBuff(player22[i] , 506727) == true	and	CheckAcceptQuest( player22[i] , 423194 ) == true		then
				SetFlag(player22[i],543996,1)	--give mission flag
				CancelBuff( player22[i]  , 506727  ) 	--
			end
		end	

		local Player4 = SetSearchAllPlayer ( 0 )			----�R���Ҧ����a���t��BUFF
		for i = 1 , Player4 , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckBuff(	ID , 506727) == true	then
				CancelBuff( ID  , 506727  ) 	--
			end
		end
------------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() , 100 )			----Ĳ�o�I���񦳪��a������BUFF,BUZY=1,���ƺt��
		for i = 0 , table.getn(Player3) do			
			if	CheckBuff(player3[i] , 506728) == true	and	CheckAcceptQuest( player3[i] , 423194 ) == true		then
				buzy = 1
			end
		end
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )

	end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end

function LuaS_423194_noquest()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,1 )
	local Players
	local ID	
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register +2) == 1	do
		Players = SetSearchAllPlayer ( 0 )
		for i = 1 , Players , 1 do 
			ID = GetSearchResult()
			if CheckID(ID) == true and 	CheckAcceptQuest( ID , 423194 ) == false	and	CheckBuff(ID , 506727) == true	then
				CancelBuff( ID  , 506727  ) 	--
			end
		end	
		sleep(20)
	end
end




------------------------------423195------------------------------------

function LuaS_423195_0()
	SetPlot(OwnerID() , "range","LuaS_423195_check",250)
end

function LuaS_423195_check()
	local O_ID = OwnerID()
	local T_ID = TargetID()
	if	CheckAcceptQuest( O_ID ,423195 ) == true	and 	CheckFlag( O_ID , 543997 ) == false	and	CheckBuff( O_ID ,  506729) == false	then		--�����ȵL�X��
		if	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 0	then						--�٨S�}�l
			WriteRoleValue( T_ID,EM_RoleValue_Register+1, 1 )	--��NPC��
			AddBuff( O_ID, 506729 , 0 , 40 )
			BeginPlot( T_ID, "LuaS_423195_1", 0 )
		elseif	ReadRoleValue( T_ID, EM_RoleValue_Register+1 ) == 1	then						--���A�԰�
			ScriptMessage( O_ID , O_ID , 1 , "[SC_423195_0]" , "0xFFFFFF00"  ) 
			ScriptMessage(O_ID , O_ID , 0 , "[SC_423195_0]" , "0xFFFFFF00"  )
			AddBuff( O_ID, 506729 , 0 , 40 )
		else												--�԰��������b�t��
			ScriptMessage( O_ID , O_ID , 1 , "[SC_423195_6]" , "0xFFFFFF00"  ) 
			ScriptMessage(O_ID , O_ID , 0 , "[SC_423195_6]" , "0xFFFFFF00"  )			
		end
	end
end

function LuaS_423195_1()		----player => target   ;  ���βy => Owner

		local Player5 = SearchRangePlayer ( OwnerID() , 300 )					----�������Ȥ~�ݪ���
		for i = 0 , table.getn(Player5) do
			if	CheckAcceptQuest ( Player5[i]   , 423195 ) == true	then
				ScriptMessage( player5[i] , player5[i] , 0 , "[SC_423195_0]" ,  "0xFFFFFF00" ) 		-----�����̰ʡC
				ScriptMessage( player5[i] , player5[i] , 1 , "[SC_423195_0]" ,  "0xFFFFFF00" ) 
			end
		end

	Local jill =    Lua_DW_CreateObj("flag" ,115358,780610,0)	---�إXJILL
	DisableQuest( jill , true )
	Yell(jill,"[SC_423195_1]",3)
	DW_MoveToFlag(jill,780610 , 1,0 ,1)
	Local jillmonster =    Lua_DW_CreateObj("obj" ,103895,jill)	---�R��JILL�úإX�Ǫ�JILL
	delobj(jill)
	SetPlot(jillmonster , "Dead","LuaS_423195_dead",100)						---jill�Ǫ����ᵹ���ѥ[��buff,create drama jill
	WriteRoleValue( jillmonster,EM_RoleValue_Register+1, OwnerID() )
	SetAttack( jillmonster , TargetID())								--�������a
	CallPlot(jillmonster, "LuaS_423195_3" , OwnerID() )							--���}�԰���R���ۤv
end

function LuaS_423195_dead()									---jill�Ǫ����ᵹ���ѥ[�̺t��buff,�إXJILL��HJILL��owner�t��
	Hide(OwnerID())
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423195 )	 == true	and
			GetDistance(OwnerID(),player) < 400	then
			AddBuff(player,506729,1,-1)
		end	
	end
	local jill = Lua_DW_CreateObj("obj",115362,OwnerID())   --fight�ᵹjill���H
	WriteRoleValue( jill,EM_RoleValue_Register+1, ReadRoleValue(OwnerID(),EM_RoleValue_Register+1) )	
	DisableQuest( jill , true )
	CallPlot(jill, "LuaS_423195_2",player)	
	WriteRoleValue( ReadRoleValue( OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 2 )
	delobj(OwnerID())
	return true
end
function LuaS_423195_2(player)									----
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --JILL���U

	local mo 
	local jill = OwnerID()						
	local Target = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115361 , 10000 , 0)	---search ball��m
	local NPC = SetSearchAllNPC(0)
	local mo2
	for i = 1 , NPC, 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == true and Obj:OrgID() == 115360 and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
			mo2 = ID
			break
		end
	end
	--local mo2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115360 , 10000 , 0)	---search mo��m	
									

	---SetDefIdleMotion(jill ,ruFUSION_MIME_IDLE_SIT)	--��������b�a
	
	if GetDistance(Target,OwnerID()) < 150 then				----�PĲ�o�I�W�L150�h����J�q�U�@�ӥ����I����,�_�h�q���w�X�Ш���

		mo = LuaS_MK_MoveToObj("flag",115357,OwnerID(),780610,2,15,70,1)				
	else
		mo = LuaS_MK_MoveToObj("obj",115357,OwnerID(),mo2,15,70,1)	
	end	
	sleep(20)
	WriteRoleValue(mo , EM_RoleValue_IsWalk, 0 )				---����J���U�@�����ʥζ]��
	sleep(20)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)	   --JILL�_��	
	AdjustFaceDir( OwnerID() ,mo, 0 )				---JILL���Ｏ��J

	Yell(mo,"[SC_423195_2]",3)			----�٦n�ܡH
	sleep(30)
	Yell(mo,"[SC_423195_3]",3)			----�p������H�M���Ǹ޲��h�L�����p�ܡH
	sleep(40)
	Yell(jill,"[SC_423195_4]",3)			----��A�u���@�I�A�O�H���ڤ����D�A�̦b�����D�N�A�O�H���{�b�ڥe�F�U���A�A�̴N��٤ߦp�N�����ڡC
	sleep(10)
	CastSpell(jill,jill,495668)			----JILL��k�N�k��
	SetIdleMotion( mo,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(15)
	Hide(jill)
	sleep(5)
	local x = ReadRoleValue ( jill, EM_RoleValue_X)
	local y = ReadRoleValue ( jill, EM_RoleValue_Y)
	local z = ReadRoleValue ( jill, EM_RoleValue_Z)

	Move(mo,x,y,z)					----����J�]��JILL��Ӫ���m
	
	sleep(40)		
	AdjustFaceDir( mo ,jill, 90 )			----����k��
	sleep(10)
	AdjustFaceDir( mo ,mo2, 0 )			----����U�@�ӥ����I����m
	sleep(10)	
	SetIdleMotion( mo,ruFUSION_ACTORSTATE_NORMAL)

	AdjustFaceDir( mo ,player, 0 )			----����䤤�@�Ӫ��a
	sleep(10)
	Yell(mo,"[SC_423195_5]",3)			----�ڥ��l�L�h�A�A�ݷ|���W�C
	sleep(40)



	x = ReadRoleValue ( mo2, EM_RoleValue_X)
	y = ReadRoleValue ( mo2, EM_RoleValue_Y)
	z = ReadRoleValue ( mo2, EM_RoleValue_Z)
	Move(mo,x,y,z)	
	sleep(20)

	local Player2 = SearchRangePlayer ( mo , 200 )			----���񦳺t��BUFF�����a�����X��
	for i = 0 , table.getn(Player2) do
		if	CheckBuff(player2[i] , 506729) == true	and	CheckAcceptQuest ( Player2[i]   , 423195 )	 == true	then
			SetFlag(player2[i],543997,1)	--give mission flag
		end
	end
	delobj(mo)
	sleep(10)

		local Player4 = SetSearchAllPlayer ( 0 )			----�R���Ҧ����a���t��BUFF
		for i = 1 , Player4 , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckBuff(	ID , 506729) == true	then
				CancelBuff( ID  , 506729  ) 	--
			end
		end


	WriteRoleValue( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 0 )	--��NPC��
	local ctrl = ks_resetObj( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1), nil )
	delobj(jill)
end

function LuaS_423195_3(Target)

	while true do
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == true then
			delobj(OwnerID())
		end
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	and 
			CheckID( OwnerID() ) == true				then  --�ˬd�O�_���}�԰�
			Sleep( 20 )
		else
			if CheckID( OwnerID() ) == true	then
				sleep(5)	
				DelObj( OwnerID() )

			end 
			
			break
		end

	end
	WriteRoleValue( ReadRoleValue(OwnerID(),EM_RoleValue_Register+1),EM_RoleValue_Register+1, 0 )	--��NPC��
end

--------------423196----------------------


function LuaS_115359()
	SetPlot(OwnerID() , "range","LuaS_423196_flag",100)	
end

function LuaS_423196_flag()

	if 	CheckAcceptQuest( OwnerID() , 423196 ) == true	and	----����423196
		CheckFlag( OwnerID() , 543998) == false	then	----�S��flag
			ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_423196_0]" ,  "0xFFFFFF00" ) 		-----�o����X�{�F����������C
			ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_423196_0]" ,  "0xFFFFFF00" ) 		
			SetFlag(OwnerID(),543998,1)	--���������X��
	end 
	return true
end

		
function LuaS_423196_complete()					-----���ȧ����Ἧ��J���_��
	AddBuff(TargetID(),506731,1,100)	
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local mo = Lua_DW_CreateObj("obj",115365,OwnerID())   --mo���H
	DisableQuest( mo , true )	
	Hide(mo)
	sleep(20)
	Show(mo,Zone)
	AddBuff(TargetID(),506730,1,100)
	--say(mo,"I'm here")
	PlayMotion( mo ,ruFUSION_ACTORSTATE_CROUCH_END)	   
	sleep(20)
	delobj(mo)
	CancelBuff( TargetID()  , 506730  ) 	
	CancelBuff( TargetID()  , 506731  )
			
end


-----------423197-----------------
function LuaS_423197()				----�ݸ�
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423197 ) == true  and CheckFlag( OwnerID() , 543999) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423197_0]","LuaS_423197_0",0)	--�o�O����N��H
	end
end

function LuaS_423197_0()
	SetSpeakDetail(OwnerID(),"[SC_423197_1]")			---
	SetFlag(OwnerID(),543999,1)
end

----------423198------------------


function LuaS_115433()
	SetPlot(OwnerID() , "range","LuaS_115433_flag",50)	
end

function LuaS_115433_flag()

	if 	CheckAcceptQuest( OwnerID() , 423198 ) == true	and	----����423198
		CheckFlag( OwnerID() , 544000) == false	then	----�S��flag
			ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_423198_5]" ,  "0xFFFFFF00" ) 		-----�e��X�{�F�޲�������A�����F�h�W���s���n�C
			ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_423198_5]" ,  "0xFFFFFF00" ) 		
	end 
	return true
end


function LuaS_115428()
	CallPlot(OwnerID(),"LuaS_Discowood_NowToHide")		----�O�����
	CallPlot(OwnerID(),"LuaP_Sitting")			----�@������
	SetPlot(OwnerID(),"range","LuaS_115428_0",100)
end

function LuaS_115428_0()					----�������Ȫ��Q�K�y
	if  CheckAcceptQuest( OwnerID() , 423198 ) == true  then
		tell(OwnerID()  ,TargetID()  , "[SC_423198_0]")	
	end
end
function LuaS_423198()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423198 ) == true	and	CheckFlag(OwnerID(),544001) == false 	then
		if CheckFlag(OwnerID(),544000) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_1]","LuaS_423198_0",0)	--		���F�H
		end
		if CheckFlag(OwnerID(),544000) == true	and	CountBodyItem ( OwnerID(), 207291 ) == 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_7]","LuaS_423198_2",0)	--		�S�ݨ�H
		end		
		if CountBodyItem ( OwnerID(), 207291 ) > 0 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423198_3]","LuaS_423198_1",0)	--�N�]�q��쥬�C���D�w�԰Ҫ���W�C
		end
	end
end

function LuaS_423198_0()

		SetSpeakDetail(OwnerID(),"[SC_423198_2]")	---�n�k�K�K�u���n�k�C�I�K�K�u���n�k�ڡC�����ڡA��e�褣���B���^�@�Ӭ��⪺�]�q�A�I�K�K�ڪ������b�ӵh�F�K�K�S��k�ʡC
		SetFlag(OwnerID(),544000,1)


end


function LuaS_423198_1()
	if CountBodyItem ( OwnerID(), 207291 ) > 0 then
		SetSpeakDetail(OwnerID(),"[SC_423198_4]")	---��K�K���¡A���§A�A�i�H���ڱq���Y���X�I�ĶܡH
		DelBodyItem(OwnerID(),207291,1)
		SetFlag(OwnerID(),544001,1)	
	else
		SetSpeakDetail(OwnerID(),"[SC_423198_6]")
	end
end

function LuaS_423198_2()

		SetSpeakDetail(OwnerID(),"[SC_423198_8]")	---�e�������B�C


end


function LuaS_115367()
	SetPlot(OwnerID(),"touch","LuaS_115367_1",30)
end

function LuaS_115367_1()
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID() , 207291 ) < 1 then
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --
		GiveBodyItem ( OwnerID(), 207291, 1 )
	sleep(10)

	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --
	
	end
	SetPlot(TargetID(),"touch","LuaS_115367_1",30)
end

--------------------423199------------------------------

function LuaS_423199_accept()
	SetFlag(TargetID(),544002,1)				----�����i�ݨ������X��
	local mo = Lua_DW_CreateObj("obj",115369,OwnerID())   --MO���H	
	tell(TargetID()  ,mo  , "[SC_423199_0]")		
	sleep(10)
	tell(TargetID()  ,mo  , "[SC_423199_1]")
	delobj(mo)
end

function LuaS_115371()
	SetPlot(OwnerID(),"touch","LuaS_115371_1",30)
end

function LuaS_115371_1()					---��������
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID() , 207288 ) < 1 then
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --
		GiveBodyItem ( OwnerID(), 207288, 1 )
	sleep(10)

	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --
	

	end
	SetPlot(TargetID(),"touch","LuaS_115371_1",30)
end


function LuaS_423199_complete()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	


	local bu = Lua_DW_CreateObj("obj",115368,OwnerID())   --bu���H
	DisableQuest( bu , true )	
	Hide(bu)	
	sleep(25)
	Show(bu,Zone)

	Playmotion(bu,ruFUSION_ACTORSTATE_SIT_END)	---bu���_��
	AddBuff( TargetID() ,506732,1,600)		---�����t��BUFF,�o���᪱�a�~�ݪ���
	sleep(20)

	PlayMotion( bu  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�ۤU
	
	sleep(10)
	Local cry =    Lua_DW_CreateObj("flag" ,115429,780646,0)			---�إX����
	DisableQuest( cry , true )
	sleep(20)
	
	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_2]" ,  "0xFFFFFF00" ) 		-----����E�R�L�y�һ������ڨ����_���쥻�Ҽ˪��F��N�b�o�A�ڭn��쥦�~��C
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_2]" ,  "0xFFFFFF00" ) 	
	
	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_3]" ,  "0xFFFFFF00" ) 		-----�i�O�j�j�K�K���Ǫ����ڭ̪��޲��h�L�A�N���O�L��ɪ��X�{�b�ڭ̭��e�A�کȡK�K
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_3]" ,  "0xFFFFFF00" ) 

	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_4]" ,  "0xFFFFFF00" ) 		-----�Ȥ���H�ڳ��w�g�O�{�b���o�ư��ҼˤF�A���ٮ`�Ȥ���H�ګ뤣�o�����L�̡C
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_4]" ,  "0xFFFFFF00" ) 

	sleep(30)

	ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_423199_5]" ,  "0xFFFFFF00" ) 		-----�S���n���F�I
	ScriptMessage( TargetID() , TargetID()  , 1 , "[SC_423199_5]" ,  "0xFFFFFF00" ) 

	sleep(30)

	Yell(bu,"[SC_423199_6]",3)				----�_�ǡA�����쩳�O���F����H�ڤ��e�������O�H���|���������F�a�H
	delobj(cry)
	sleep(10)

	PlayMotion( bu  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --bu���_��
 	sleep(20)
	CallPlot(bu,"LuaP_Sitting")					----bu���^�h
	sleep(20)	


	CancelBuff( TargetID()  , 506732  ) 	

	delobj(bu)
end