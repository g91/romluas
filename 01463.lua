function Lua_black_big_ControlBox_102295()---   ���æ�npc 
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--Ū���ж��W�r
	local start= OwnerID()
	local x= 0
	local s1 =CreateObjByFlag(102343,780399,3,1)
		SetModeEx( s1 , EM_SetModeType_Show, false) 
		SetModeEx( s1 , EM_SetModeType_Mark, false)
		SetModeEx( s1 , EM_SetModeType_Strikback, false) 
		SetModeEx( s1 , EM_SetModeType_Move, false) 
		SetModeEx( s1 , EM_SetModeType_Fight, false) 
		SetModeEx( s1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( s1 , EM_SetModeType_HideName, false) 
		SetModeEx( s1 , EM_SetModeType_HideMinimap, false) 
		AddToPartition(s1 , RoomID )
		SetPlot( s1 , "range" , "Lua_black_big_range1_102295" , 100 )----�g�J�d��@��
		WriteRoleValue(s1,EM_RoleValue_PID,start)
	local door1 = CreateObjByFlag(102449,780399,4,1)--------�ͥX�Ĥ@�Ӫ�
		SetModeEx( door1 , EM_SetModeType_Mark, false)
		SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 	
		SetModeEx( door1 , EM_SetModeType_Obstruct, true) 
		SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
	---local door2 = CreateObjByFlag(102449,780399,5,1)--------�ͥX�ĤG�Ӫ�
	---	SetModeEx( door2 , EM_SetModeType_Mark, false)
	---	SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	
	---	SetModeEx( door2 , EM_SetModeType_Obstruct, true) 
	AddToPartition(door1 , RoomID )
	--AddtoPartition(door2 , RoomID )
	WriteRoleValue(start,EM_RoleValue_Register6,door1)
	--WriteRoleValue(start,EM_RoleValue_Register7,door2)
	while true do
	sleep(10)
		local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--Ū���ж��W�r
		local y =ReadRoleValue(start ,EM_RoleValue_Register3)
		if x==0 then 
		local King = CreateObjByFlag(102311,780399,1,1)--�إߤ�����  
		local bigking = CreateObjByFlag( 102295,780399,2,1)---�إ��Τ� �A�X��2�W��
			WriteRoleValue(King,EM_RoleValue_Register3,start)
			WriteRoleValue(King,EM_RoleValue_PID,bigking)
			AddToPartition(King , RoomID )
			AddToPartition(bigking , RoomID )
			SetPlot( King , "touch" , "Lua_black_big_touch_102295" , 50 )----�g�J������Ĳ�o�@��
			x=1
		end
		if y==1 then 
		local King = CreateObjByFlag(102311,780399,1,1)--�إߤ�����  
		local bigking = CreateObjByFlag( 102295,780399,2,1)---�إ��Τ� �A�X��2�W��
		local s1 =CreateObjByFlag(102343,780399,3,1)
			SetModeEx( s1 , EM_SetModeType_Show, false) 
			SetModeEx( s1 , EM_SetModeType_Mark, false)
			SetModeEx( s1 , EM_SetModeType_Strikback, false) 
			SetModeEx( s1 , EM_SetModeType_Move, false) 
			SetModeEx( s1 , EM_SetModeType_Fight, false) 
			SetModeEx( s1 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( s1 , EM_SetModeType_HideName, false) 
			SetModeEx( s1 , EM_SetModeType_HideMinimap, false) 
			AddToPartition(s1 , RoomID )
			SetPlot( s1 , "range" , "Lua_black_big_range1_102295" , 100 )----�g�J�d��@��
			WriteRoleValue(King,EM_RoleValue_Register3,start)
			WriteRoleValue(King,EM_RoleValue_PID,bigking)
			AddToPartition(King , RoomID )
			AddToPartition(bigking , RoomID )
			SetPlot( King , "touch" , "Lua_black_big_touch_102295" , 50 )----�g�J������Ĳ�o�@��
			WriteRoleValue(start,EM_RoleValue_Register3,0)
		end
	end
end
function Lua_black_big_touch_102295()---��b�������������W,��a�񤸯�����50�X,���|�}�l����p�Ǽ@��
	SetPlot( TargetID()  ,"touch", "" ,0 )
	ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_01]" , 2 ) 
	sleep(10)
	ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_04]" , 2 ) 
	BeginPlot( TargetID() , "Lua_black_big_start0_102295",0 )---�}�lĲ�o���@��
	--Say(TargetID() ,"22222")

end
function Lua_black_big_start0_102295()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local King= OwnerID()
	local bigking1 = CreateObj( 102295 ,3157.1, 257.2 , 1776.2, 75.5 , 1)
	---local bigking1 = CreateObj( 102295 ,-237.0, 30 , 806.1, 190.4 , 1)
	SetFightMode( bigking1 , 0 , 0 , 0 , 0 )
 	SetModeEx( bigking1 , EM_SetModeType_Gravity, false) 
	SetModeEx( bigking1 , EM_SetModeType_AlignToSurface, false) 
	AddToPartition(bigking1 , RoomID )
	SetIdleMotion ( bigking1, ruFUSION_ACTORSTATE_BUFF_BEGIN )---���񭸦�ʧ@
	local bigking = ReadRoleValue(OwnerID() ,EM_RoleValue_PID)
	ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_06]" , 1 )    
	Delobj(bigking)---�R���a�W�Τ�
	local ma = {}
	local wa = {}
	local wm = {}
	for j= 1 , 12 , 1 do -- �ͥX12���Τl
		ma[j]= CreateObjByFlag( 102340,780398,j,1)
		AddToPartition(ma[j] , RoomID )
		SetPlot( ma[j] , "dead" , "Lua_black_dead0_102295" , 50 )---���O�b12���Τl�̭����J���`�@��
		WriteRoleValue(ma[j] , EM_RoleValue_PID,King)   --�p�Ǩ��W��J����pid 
	end
	for i = 1 , 12 ,1 do ----�ͥX12�ؤ����� 
		wa[i]= CreateObjByFlag( 102319,780397,i,1)   --�̷ӺX�Ш̧ǴӤJ�p��
		AddToPartition(wa[i] , RoomID )
		SetPlot( wa[i] , "dead" , "Lua_black_dead1_102295" , 50 )-----���O�b12�䤸���̭����J���`�@��
		AddBuff( wa[i] , 504187 , 0 , 300 )
		WriteRoleValue(wa[i] , EM_RoleValue_PID,King)	--�p�Ǩ��W��J����pid 
	end	
	sleep(10)
	while 1 do ----�C1��h�P�_�p�Ǫ��ƶq
		sleep(10)
		local st0 = ReadRoleValue (King,EM_RoleValue_Register2)------Ū���Τl�ƶq
		local st1 = ReadRoleValue (King,EM_RoleValue_Register1)------Ū�������ƶq	
		if st0 == 12 then  ---�}�l�p��ƶq���Τl�ƶq�ܦ�0���ɭ�,���|�h�P�_�����ƶq
			if st1 <=18 then --�������`�ƶq�֩󵥩󤻪��ɭ�,���|�}�l�h�ϥ��ܨ����@��
			BeginPlot( OwnerID() , "Lua_black_change_102295",50 )
			break
			end
			if st1 >=18 then 
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_03]" , 1 ) 
			sleep(10)
			break
			end
		end
		if  st1==24 then 
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_03]" , 1 ) 
		sleep(10)
		break
		end
	end
	sleep(10)  
	WriteRoleValue(King , EM_RoleValue_Register1,0)
	WriteRoleValue(King , EM_RoleValue_Register2,0)
	for i = 1 , table.getn(wa), 1 do				
		if wa[i] ~= nil and CheckID(wa[i] ) == true  then
			DelObj( wa[i] )	
		end		
	end
	for i = 1 , table.getn(ma), 1 do				
		if ma[i] ~= nil and CheckID(ma[i] ) == true  then
			DelObj( ma[i] )	
		end		
	end
	Delobj(bigking1)
	local start =ReadRoleValue (King,EM_RoleValue_Register3)
	sleep(30)
	bigking = CreateObjByFlag(102295,780399,2,1)
	AddToPartition(bigking , RoomID )
	WriteRoleValue(bigking,EM_RoleValue_Register3,start)
	AddToPartition(bigking , RoomID )
	SetPlot( bigking , "dead" , "Lua_black_bigdead_102295" , 50 )
	BeginPlot( bigking ,"Lua_black_bigking_102295",0)----��@����쨭�W�h
	WriteRoleValue(King,EM_RoleValue_Register4,bigking)
	WriteRoleValue(bigking,EM_RoleValue_Register5,King)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_black_dead1_102295()---�������`�@��
	local King= ReadRoleValue(OwnerID() ,EM_RoleValue_PID)
	local KingCount1 =ReadRoleValue (King,EM_RoleValue_Register1)
	KingCount1 = KingCount1 +1 
	WriteRoleValue(King , EM_RoleValue_Register1,KingCount1)
	--Say(OwnerID(),KingCount1)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_black_dead0_102295()---�Τl���`�@��
	local King= ReadRoleValue(OwnerID() ,EM_RoleValue_PID)
	local KingCount =ReadRoleValue (King,EM_RoleValue_Register2)
	KingCount = KingCount +1 
	WriteRoleValue(King , EM_RoleValue_Register2,KingCount)
	--Say(OwnerID(),KingCount)	
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_black_change_102295()-------�ܨ��@���Ҧ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local King=OwnerID()
	local bigking=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	local PPL = SetSearchAllPlayer(RoomID)
	ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_02]" , 1 )  	
	local buff=0
	local id ={}
	for i=1 ,PPL,1 	do
		id[i]=GetSearchResult()
	end
	for i = 1 ,PPL ,1 do 
		local idd=DW_Rand( table.getn (id))
		if 	ReadRoleValue( id[idd] , EM_RoleValue_IsDead) == 0 and 
			ReadRoleValue( id[idd] , EM_RoleValue_IsPlayer) == 1 and 
			ReadRoleValue( id[idd] , EM_RoleValue_VOC ) ~= 0 then
			CancelBuff( id[idd] , 503872 )
			CancelBuff( id[idd] , 503877 )
			CancelBuff( id[idd] , 503878 )
			CancelBuff( id[idd] , 503879 )
			buff=buff+1
			if buff == 1 then 
				CancelBuff( id[idd] , 500141 )
				
				AddBuff( id[idd] , 503872 , 1 , 74 )
				sleep(10)
				SetAttack( bigking , id[idd]) -- �����e�i����
				SysCastSpellLv(id[idd],bigking,493768,1)
			elseif buff == 2 then 
				AddBuff( id[idd] , 503877 , 1 , 74 )
			elseif buff == 3 then 
				AddBuff( id[idd] , 503878 , 1 , 74 )
			elseif buff == 4 then 
				AddBuff( id[idd] , 503879 , 1 , 74)
			elseif buff == 5 then 
				AddBuff( id[idd] , 503879 , 1 , 74 )
			elseif buff == 6 then 
				AddBuff( id[idd] , 503877 , 1 , 74)
			end
		end
		table.remove (id, idd)
		table.getn (id)
	end
	
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
function Lua_black_bigking_102295()--�g�J�Τ��̭����@��,�����h�ˬd���S���i�J�԰�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local King = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	local PPL = SetSearchAllPlayer(RoomID)
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	local ThesePlayer = {}
	local bigking  =  OwnerID()	
	local begin = 0
	local alltime =0
	local many=0
	local go =0
	local start =ReadRoleValue (bigking,EM_RoleValue_Register3)
	for i=1, TempPlayer do   
			ThesePlayer[i]= GetSearchResult() -- ���Ȧs��
			SetAttack( bigking , ThesePlayer[i]) -- �����e�i����
		end
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	while true do 
	sleep(10)
		if HateListCount( bigking )  ~= 0 then 	
			if go == 0 then 
				alltime = alltime +1 
				if alltime ==14 then 
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_102295_09]" , 2 ) 
				end
				if alltime == 15 then 
					many =many +1 
					BeginPlot( King, "Lua_black_change_102295",0 )
					SysCastSpellLv(bigking,bigking,493624,0)
					alltime =0
				end
			end
			if many==6 then 
				go=1
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_102295_10]" , 2 ) 
				many = 0
			end
		end
		sleep(30)
		if HateListCount( bigking )  == 0 then 	
		local PPL = SetSearchAllPlayer(RoomID)
			for i = 1,PPL ,1 do
			local ID = GetSearchResult()
				CancelBuff( ID , 503872 )
				CancelBuff( ID , 503877 )
				CancelBuff( ID , 503878 )
				CancelBuff( ID , 503879 )
			end
				WriteRoleValue(start , EM_RoleValue_Register3,1)
				DelObj(OwnerID())
				DelObj(king)
			break	
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_black_bigdead_102295()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bigking = OwnerID()
	local start =ReadRoleValue (bigking,EM_RoleValue_Register3)
	local King = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	DelObj(king)
	local bk = CreateObjByFlag( 102341,780399,2,1)
	AddToPartition(bk , RoomID )
	local bigking1 = CreateObj( 102295 ,432.5, 30 , 524.9, 190.4 , 1)
	SetFightMode( bigking1 , 0 , 0 , 0 , 0 )
 	SetModeEx( bigking1 , EM_SetModeType_Gravity, false) 
	SetModeEx( bigking1 , EM_SetModeType_AlignToSurface, false) 
	AddToPartition(bigking1 , RoomID )
	WriteRoleValue(bigking1,EM_RoleValue_PID,start)
	SetIdleMotion ( bigking1, ruFUSION_ACTORSTATE_BUFF_BEGIN )---���񭸦�ʧ@
	BeginPlot( bigking1 ,"Lua_black_bigking1_102295",0)----��@����쨭�W�h
	sysCastSpellLV( bigking1 , bigking1  , 493900 , 1 )---
	Hide(bigking)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_black_big_range1_102295()
	SetPlot( TargetID()  ,"range", "" ,0 )
	ScriptMessage( OwnerID(), -1 , 1 , "[SC_102295_07]" , 2 )  
	sleep(20)
	ScriptMessage( OwnerID(), -1 , 1 , "[SC_102295_08]" , 2 )
	sleep(100)
end
function Lua_black_bigking1_102295()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bigking=OwnerID()
	local start = ReadRoleValue(OwnerID() ,EM_RoleValue_PID)
	local door1 = ReadRoleValue(start ,EM_RoleValue_Register6)
--	local door2 = ReadRoleValue(start ,EM_RoleValue_Register7)
	
	ScriptMessage( OwnerID(), -1 , 1 , "[SC_102295_05]" , 2 ) 
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1,PPL ,1 do
		sleep(10)
		local ID = GetSearchResult()
		CancelBuff( ID , 503872 )
		CancelBuff( ID , 503877 )
		CancelBuff( ID , 503878 )
		CancelBuff( ID , 503879 )
	end
	sleep(20)
	DelObj(door1)
	--DelObj(door2)
	DelObj(OwnerID())
end











