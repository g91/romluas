--123563 �ֳǺ� ����l�@�����|���� ��Q�S
--123564 ��Q�S
--123618 ��Q�S(�C��)

--�ֳǺ���l�@��
function Lua_na_6thYears_123563()
	local Owner= OwnerID()
	LuaN_miyon_action02()
	WriteRoleValue( Owner , EM_RoleValue_PID , 0) --�i������
--	Say( Owner , ReadRoleValue( Owner , EM_RoleValue_PID) )
	SetModeEx(Owner , EM_SetModeType_Mark, true  )
	local Ru = CreateObjByFlag( 123564 , 781357 , 0 , 1 )
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)  --���ͦ�Q�S
	WriteRoleValue( Owner, EM_RoleValue_Register9 , Ru ) --���ֳǺ��O���Q�S
	WriteRoleValue( Ru, EM_RoleValue_Register9 , Owner ) --����Q�S�O��ֺ���
	SetModeEx(Ru, EM_SetModeType_Mark, true )--�аO
	SetModeEx(Ru, EM_SetModeType_Move, true )--����
	AddToPartition( Ru, Room )
end

--�ֺ��ǹ�ܼ@���A������y�B�i��C��
function Lua_na_6thYears_Jie() --�ֳǺ� 
	local Owner = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	AdjustFaceDir( Target , Owner , 0)

	if CheckFlag( Owner , 549358) == true then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK4]" ) -- �w��A���ѦA�����������Q�S����t�ޥ��C
	elseif CheckFlag( Owner , 549357 ) == true then --����y
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK3] " ) -- �ڪG�M�S�ݿ��H�I
		GiveBodyItem( Owner , 209561 , 1)  --�@�ӫC�����	
		GiveBodyItem( Owner ,241128 , 1 ) --�����Ŷꨩ§�](�p)
		SetFlag( Owner , 549358 , 1 ) --��������w������y���X��
	elseif CheckFlag( Owner , 549355 ) == true then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK2] " ) -- �ڬ۫H�A�����O���Ӥ��t...
		GiveBodyItem( Owner , 724509 , 1 ) --�����������Ĥ�
		SetFlag( Owner , 549358, 1 )
	elseif PID == 0 then
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK1]" ) --�ڭ̬O���F�y��ROM�P�~�y�ӨӨ�o�̪��I...
		AddSpeakOption( Owner , Owner, "[SC_6YEARS_OPT1]" , "Lua_na_6thYears_Jie2(1)",0 ) --�ڷQ���m�ߤ@�U
		AddSpeakOption( Owner , Owner, "[SC_6YEARS_OPT2]" , "Lua_na_6thYears_Jie2(2)",0 ) --���������}�l
	else	
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK5]" ) --�]�ثe[123563]���M�`���[���Q�S����{�C)
	end
end

--���a�I�Y�i�檺���ʼҦ� �m��or����
function Lua_na_6thYears_Jie2(mode)
	local Owner = OwnerID() --���a
	local Target = TargetID() --�ֳǺ�
	local Ru = ReadRoleValue( Target , EM_RoleValue_Register9) --��Q�S
	local PID = ReadRoleValue ( Target , EM_RoleValue_PID)
	if PID == 0 then
		CloseSpeak(Owner)
		WriteRoleValue( Target, EM_RoleValue_PID , 1 ) --�N�ֳǺ����i����������
		if mode == 1 then --�m�߼Ҧ�
			BeginPlot( Ru ,"Lua_na_6thYears_Ru2", 10)
		else --�����i��
			SetFlag( Owner , 549356 , 1 ) --�����i�檺KEY
			BeginPlot( Ru ,"Lua_na_6thYears_Ru2", 10)
		end
	else
		SetSpeakDetail( Owner, "[SC_6YEARS_SPEAK5]" )  --�]�ثe[123563]���M�`���[���Q�S����{�C)
	end
end 


function Lua_na_6thYears_Ru2() 
	local Owner = OwnerID()  --��Q�S
	local Target = TargetID() --���a
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local x, y, z, dir = DW_Location( 781357 , 1)
	Callplot( Owner, "Lua_na_6thYears_step" , Target ) 
	WriteRoleValue( Owner, EM_RoleValue_Register1 , Target ) --����Q�S�O���a
	MoveDirect(Owner ,x,y,z)
end


function Lua_na_6thYears_step(Player)  -- ����NPC�A�}�l�C��
	local Owner = OwnerID() --��Q�S
	local Jie = ReadRoleValue( Owner , EM_RoleValue_Register9)
	Callplot ( Jie , "Lua_na_6thYears_checkplayer" , Player)
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local F = { } --��������m
	local R = DW_Rand(12)
	for i = 1 , 12 , 1 do
		F[i]= i  --1~12
 	end
------------------����12��NPC-----------------------
	sleep(10)
	local Ru2 = { } --���ͪ�����s�աA����12��NPC
	local R = DW_Rand(#F)
	hide( Owner)
	ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK8]" , 0 )  --�ڭn�}�l�o�I�ǳƦn�F�ܡH
	sleep(10)
	for i = 1 , #F do
		Ru2[i] = CreateObjByFlag( 123618, 781357 , i , 1 )  --�C�������ͪ���Q�S����
		SetModeEx( Ru2[i], EM_SetModeType_Mark, false )
		WriteRoleValue( Ru2[i], EM_RoleValue_IsWalk , 0 )
		MoveToFlagEnabled( Ru2[i], false )
		WriteRoleValue( Ru2[i], EM_RoleValue_PID , i )
		WriteRoleValue( Ru2[i], EM_RoleValue_Register9 , Jie)
		AddToPartition( Ru2[i], Room) 
		if i == R then
			WriteRoleValue( Ru2[i], EM_RoleValue_Register9 , Jie)
			WriteRoleValue( Ru2[i] , EM_RoleValue_Register6 , 6 )
			Say(Ru2[i], "[SC_6YEARS_SPEAK7]") --�K�I�ڦb�o�̳�I
		end	
		WriteRoleValue( Ru2[i], EM_RoleValue_Register1 , Player ) --����Q�S�O���a
		sleep(1)
	end
	for i = 1 , #Ru2 do
		AdjustFaceDir( Ru2[i], Jie , 0 )
	end
----------------------------------------------------------
	sleep(10)
	StartClientCountDown ( Player, 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--���aClient��ܭ˼�5��
	sleep(50)
	if CheckFlag( Player , 549356) == true then
		AddBuff( Player , 626284 , 2 , -1)  --�[BUFF
		for i = 1 , #Ru2 do
			AddBuff( Ru2[i] , 626285 , 0 , -1)
		end
		Lua_na_6thYears_change(Ru2)
		sleep(20)
		Lua_na_6thYears_Move2(Ru2)
		sleep(20)
		Lua_na_6thYears_Move1(Ru2)

	else 		--�m�߼Ҧ�
		Lua_na_6thYears_Move2(Ru2)
		sleep(30)
		Lua_na_6thYears_Move1(Ru2)
	end

	sleep(30)
	for j = 1 , #Ru2 do
		local NEW_PID =  ReadRoleValue(Ru2[j] , EM_RoleValue_PID)
		LuaFunc_MoveToFlag( Ru2[j] , 781357 , NEW_PID , 0 )	
	end
	sleep(10)
	for i = 1 , #Ru2 do
		AdjustFaceDir( Ru2[i], Jie , 0 )
		SetModeEx(Ru2[i], EM_SetModeType_Mark, true )--�аO
		SetPlot( Ru2[i] , "touch" , "Lua_na_6thYears_Answer" , 10)
	end
	ScriptMessage( Player , Player , 3, "[SC_6YEARS_SPEAK6]" , 0 ) --�Цb20����������Q�S
	StartClientCountDown( Player, 30, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]") --���������}�l
--	ScriptMessage( Player , Player , 2 , "[SC_6YEARS_SPEAK9]" , 0 )  --�M��X�u������Q�S
	Callplot ( Jie , "Lua_na_6thYears_Count30" , Player)
	sleep(50)
	DelObj( Owner)
end
	

function Lua_na_6thYears_Answer()	
	local Owner = OwnerID() --���a
	local Target = TargetID() --��Q�S
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Answer = ReadRoleValue( Target ,  EM_RoleValue_Register6 )
	local Jie = ReadRoleValue(Target , EM_RoleValue_Register9)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register1 )
	local R = DW_Rand(100)
	if Owner == Player then
		if Answer == 6 then
			if CheckFlag( Owner , 549355) == true or CheckFlag( Owner , 549357) == true then
				return
			else
				CancelBuff_NoEvent( Owner , 626284)
				local x, y, z ,dir = DW_Location( Target)
				local Ru = CreateObj( 123564 , x , y , z , dir , 1 )
				local x1, y1, z1, dir1 = DW_Location( 781357 , 0)
				if CheckFlag( Owner , 549356 ) == true then
					SetFlag( Owner , 549357, 1) 
					ScriptMessage( Owner , Owner, 3 , "[SC_6YEARS_SPEAK19]" , 0 )
				end
				SetModeEx( Ru, EM_SetModeType_Mark, false ) --��t�������i�I��
				StartClientCountDown( Owner, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--�˼ƭp���k�s
				StartClientCountDown (Owner, 0, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--���aClient��ܭ˼�5��
				BeginPlot( Jie , "Lua_na_6thYears_DelNPC",10)
				if R  < 35 then
					Say( Target , "[SC_6YEARS_SPEAK10]" ) --�u�r�I�Q�A�ݥX�ӤF�I
				elseif R < 75  then
					Say( Target , "[SC_6YEARS_SPEAK11]" ) --�A�����O�٤������I
				else
					Say( Target , "[SC_6YEARS_SPEAK12]" ) --�Q�A�ݬ�F�I�U�@�����藍�|���A���I
				end
				DelObj( Target)
				AddToPartition( Ru , Room)
				MoveDirect( Ru ,x1,y1,z1)
				sleep(50)
				delobj(Ru)
				WriteRoleValue( Jie , EM_RoleValue_PID , 0 )
			end
		else
			if CheckFlag( Owner , 549355) == true or CheckFlag( Owner , 549357) == true then
				return
			else
				if R  < 35 then
					Say ( Target ," [SC_6YEARS_SPEAK13]" ) --�����I�A�q���F��I
				elseif R < 75  then
					Say ( Target ," [SC_6YEARS_SPEAK14]" ) --�����աI�o�u�O�ڪ��ۼv�I
				else
					Say ( Target ," [SC_6YEARS_SPEAK15]" ) --�ڤ~���|�o��e�����A�ѯ}�O�I
				end
				if CheckBuff( Owner , 626284) == true then
					local BuffLV = FN_CountBuffLevel(Owner,626284)
					if BuffLV == 0 then 
						if CheckFlag( Owner , 549356 ) == true then
							SetFlag( Owner , 549355, 1) 
							ScriptMessage( Owner , Owner, 3 , "[SC_6YEARS_SPEAK19]" , 0 )
						end
						CancelBuff_NoEvent( Owner , 626284)
						ScriptMessage( Owner , Owner, 1 , "[SC_6YEARS_SPEAK16]" , 0 ) --���릸�Ƥw�κɡA�P�_�����C
						StartClientCountDown( Owner, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--�˼ƭp���k�s
						WriteRoleValue( Jie , EM_RoleValue_PID , 0 )
					else
						CancelBuff_NoEvent( Owner , 626284)
						AddBuff( Owner , 626284 , BuffLV-1 , -1)
						DelObj( Target)
					end	
				else
					DelObj( Target)
				end
			end		
		end
	else
		ScriptMessage( Target , Target , 2, "[SC_6YEARS_SPEAK18]", 0 )  --�][123564]�ثe�L�v�^���A�^
	end
end


function Lua_na_6thYears_checkplayer(Player) --���ʶ}�l��A�ֳǺ��ˬd���a�Z��
	local Owner = OwnerID()
	local Ru = ReadRoleValue( Owner, EM_RoleValue_Register9 ) --��Q�S
	while true do
		local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
		if PID == 1 then
			if CheckID( Player) == true then  --�p�G���a�b��
				local Dis = GetDistance( Owner , Player)
				if Dis > 120 then
					DelObj( Ru)
					ScriptMessage(Owner , Player, 1, " [SC_6YEARS_SPEAK9]", 0 ) 	--���}���ʽd��A���ʵ����C
					StartClientCountDown( Player, 0, 0, 0, 0, 1, "[SC_6YEARS_CHOICE]" )	--�˼ƭp���k�s
					if CheckFlag( Player , 549356 ) == true then
						SetFlag( Player , 549355 , 1 ) --�������ʰ򥻼��y�X��
						ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK19]" , 0 )
					end
					CancelBuff_NoEvent( Player , 626284)
					WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
					BeginPlot( Owner , "Lua_na_6thYears_DelNPC" , 10)
					break
				elseif  Dis > 60 then
					ScriptMessage( Owner , Player , 1, "[SC_6YEARS_SPEAK17]", 0 ) --�`�N�I�A�Y�N���}���ʽd��I
				end	
			else
				WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
				DelObj( Ru)
			end
		else 
			BeginPlot( Owner , "Lua_na_6thYears_DelNPC" , 10)
			DelObj( Ru)
			break
		end
		sleep(10)
	end
	Lua_na_6thYears_123563()
end


function Lua_na_6thYears_Count30(Player)
	local Owner = OwnerID()
	local N = 0
	for i = 1 , 30 do
		if ReadRoleValue( Owner , EM_RoleValue_PID) == 1 then
			N = N+1
			if N == 30 then
				WriteRoleValue( Owner , EM_RoleValue_PID, 0 )	
				if CancelBuff( Player , 626284 ) == true then
					CancelBuff( Player , 626284 )
					SetFlag( Player , 549355 , 1 )
					ScriptMessage( Player , Player , 3 , "[SC_6YEARS_SPEAK19]" , 0 )
				end
				break
			end
			sleep(10)
		else
			break
		end
	end	
end

function Lua_na_6thYears_DelNPC()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 120)
	for i = 0, #NPC do
		if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID ) == 123618 then
			DelObj(NPC[i])
		end
	end
end

function Lua_na_6thYears_Buffdel()
	local Owner = OwnerID()
	SetFlag( Owner , 549355 , 1 )
	return
end

----------------------------------------------------------------------------

--------------------------�ض�κX�ХΪ�----------------------------------
function Lua_Na_6thYearS_SetNPC()	-- ���ͺ�NPC����Φ�m
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner  , EM_RoleValue_RoomID )
	local Obj = Role:new( Owner  )
	local x,y,z,dir = DW_Location(Owner)
	local RusterGroup = {}
	local RusterID = 113105 -- ���ê���
	local S = { 12 }-- �X�䫬
	local D = { 40 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(S) do
		for j = 1 , S[i] , 1 do
			RusterGroup[Count] = CreateObj( RusterID , x-D[i]*math.cos(math.pi*2*(j/S[i])),y,z+D[i]*math.sin(math.pi*2*(j/S[i])),Dir, 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(RusterGroup) do
		AddToPartition( RusterGroup[i] , RoomID )
	end
end


function Lua_na_6thYears_Clearflag()
	local Owner = OwnerID()
	local Flag = {	549355, 549356, 549357, 549358	}
	for i = 1 , #Flag do
		SetFlag( Owner , Flag[i] , 0 )
	end
end



-- Na_Del_NPC(113105)


--���P�~�n�J§�]
Function LuaI_205036() --���g�~�y§�]
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[205036]][$SETVAR3=[202936]]" 

	local itemset  = {	1 , Prize1Str 	, { 202936 , 1 }	
				, 1 ,""	, { 202936 , 1 }			--�ä[����Ĩۣ�H���M*1 	202936		
				, 201 ,""	, { 202934 , 1 }			--30�Ѷ���Ĩۣ�H���M*1 202934	
				, 500 ,""	, { 202434 , 1 } 	   		--�C����ȭ��m��*3 202434
				, 1050 ,""	, { 202434 , 3 } 	   	--�C����ȭ��m��*1 202434
				, 1600 ,""	, { 201141 , 1 }		--�ᥧ�J������ū*1 201141
				, 2600 ,""	, { 242723 , 3 }		--�i���P�h�Z����*3 242723
				, 3600 ,""	, { 242724 , 3 }		--�i���P�h�˳ƥ�*3 242724
				, 4600 ,""	, { 242725 , 3 }		--�i���P�h������*3 242725
				, 6400 ,""	, { 202435 , 5 }		--�a������*5 202435
				, 8200 ,""	, { 202902 , 5 }		--�Ŷ���������*5 202902
				, 10000 ,""	, { 202903 , 5 }	}	--�ǰe�̲Ť�*5 202903

	return BaseTressureProc4(   itemset , 1  )

end

--���ռs���T����
function LuaI_205036_Cast()
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[205036]][$SETVAR3=[202936]]" 
	RunningMsgEx( OwnerID() , 2 , 2 , Prize1Str )
end