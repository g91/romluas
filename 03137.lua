--�w�꤭�P�~�A�_�c�m½��

--����npc 123583 �i�i��g
function Lua_na_5years_NPC(Zone)
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	local Count = CountBodyItem( Owner , 243208)
	if Zone == 2 then --�b�Z��R����
		AdjustFaceDir( Target , Owner , 0 ) --���V
		if CheckFlag( Owner , 545464) == true then --�p�G���a���w�g�����L����
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK01]" )  --�ڥi�H�z�Ѷ}�_�c���ֽ�A���L�@���٬O�u�઱�@����I
		else
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK02]" ) --����²��
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT1]" , "Lua_na_5years_Trans" , 0 )	
		end
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT5]" , "Lua_5years_CollectWord" , 0 ) --���r�I��
	elseif Zone == 357 then--�b���Ҫ�� z357
		AdjustFaceDir( Target , Owner , 0 ) --���V
		if CheckBuff( Owner , 625474) == true then
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK05]" )	--����٦b�i�O�O�I�ʧ@�����I���ܡA�_�c�N�n�����F�I
		elseif CheckFlag( Owner , 545464) == true then
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK10]" )  --�}�줰��n�F��F�ܡH
		else
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK03]" )	--����
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT2]" , "Lua_na_5years_rule" , 0 ) -- �����_�c�����F��...
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT4]" , "Lua_na_5years_ready" , 0 ) --�ڷǳƦn�F
		end
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT3]" , "Lua_na_5years_TransBack" , 0 ) --	�ڭn���}
	end
	if Count ~= 0 then
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT8]" , "Lua_na_5years_wool" , 0 ) --	��X���Ϥ�	
	end
end


--�_�c����
function Lua_na_5years_rule()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK04]" )
	AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT4]" , "Lua_na_5years_ready" , 0 ) --	�ǳƦn�F
	AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_5years_NPC(357)", 0 ) --�^��W�@��
end


--�ǰe�ܬ��ʰϰ�
function Lua_na_5years_Trans()
	local Owner = OwnerID()
	ChangeZone( Owner, 357, -1 , -125 , 5 , -388 , 254)
end


--�ǰe��Z2
function Lua_na_5years_TransBack() 
	local Owner = OwnerID()
	ChangeZone( Owner, 2, 0 , 3431 , 44 , 210 , 103)
end


 --���Ϥ�I���C�����
function Lua_na_5years_wool() 
	local Owner = OwnerID()
	local Count = CountBodyItem( Owner , 243208)
	SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK07]")
	DelBodyItem( Owner , 243208 , Count)
	GiveBodyItem( Owner , 209561 , Count)
end


--���r�I��
function Lua_5years_CollectWord()
	local Owner = OwnerID()
	local Word = {	243209, 243210, 243211, 
			243212, 243213, 243214	}
	local MissWord = {	}
	
	for i = 1 , #Word do
		if CountBodyItem( Owner , Word[i] ) < 1 then
			table.insert( MissWord , Word[i] )
		end
	end

	if #MissWord == 0 then
		SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK08]" )
		for i = 1 , #Word do
			DelBodyItem( Owner, Word[i] , 1 )
		end
		GiveBodyItem( Owner , 203178 , 1 )

	elseif #MissWord == 6 then
		SetSpeakDetail( Owner ,  "[SC_5YEARS_SPEAK06]" )
	else
		DeBugMsg( 0, 0 , "MissWord = "..#MissWord)	--�T�{�������ƶq
		WordMsg = "[SC_5YEARS_SPEAK09]"
		for j = 1 , #MissWord do
			if j == #MissWord then
				WordMsg = WordMsg.."["..MissWord[j].."]</CS>".."[SC_STARPET_NO13_MISS01][$SETVAR1="..#MissWord.."]" --�A�@[$VAR1]�ӡA�Х[��l�A�V�O�����a�I
			else
				WordMsg = WordMsg.."["..MissWord[j].."]</CS>".."[SC_SEPARATEMARK]<CS>"
			end
		end
		SetSpeakDetail( Owner , WordMsg )
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_5years_NPC", 0 ) --�^��W�@��
	end
end


--���ʶ}�l
function Lua_na_5years_ready() 
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	local Obj = SearchRangeNPC( Target , 100)
	CloseSpeak( Owner)
	DesignLog( Owner , 123562 , "5thYear event start!" )	-- ���ʶ}�l
	for i = 0 , #Obj do 
		if ReadRoleValue( Obj[i] , EM_RoleValue_OrgID ) == 123565 then
			WriteRoleValue( Obj[i] , EM_RoleValue_PID , 1 ) --�N���ê���PID�g��1�A���ʶ}�l
			break
		end
	end
	Sleep(10)
	AddBuff( Owner , 625474 , 0 , -1)
	ClockOpen( Owner , EM_ClockCheckValue_32  , 61 , 61 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
end


--�������ê���
function Lua_na_5years_HideObj() --���ʪ��󪺪�l�@���A��ϰ�Φ��Უ�͡A���]�j���ˬd���ʬO�_�}�ҡA���ʱҰʫ��ˬd60���R�����W�Ҧ���������
	local Owner = OwnerID() --���ê���
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x, y, z, dir=DW_Location( Owner)
	local T = 0
	WriteRoleValue( Owner, EM_RoleValue_PID , 0 )
	while true do --���ê��󲣥͡A�ˬd���ʬO�_�}�l�A0�|���}�l�A1���}�l
		local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
		if PID  == 1 then
			Lua_na_chest_create() --�����_�c
			break
		end
		sleep(10)
	end

	while T <= 60 do 	--���ʶ}�l�˼ƭp��60��
		if T == 60 then
			 Lua_na_5years_DELObj()
			BeginPlot( Owner , "Lua_na_5years_HideObj2" , 50 )
			Break
		else
			T = T +1
		end
		sleep(10)
	end		
end


--���ê��󭫸m
function Lua_na_5years_HideObj2()
	local Owner = OwnerID()
	Sleep(50)
	BeginPlot( Owner , "Lua_na_5years_HideObj" , 0 )
end


--����110���_�c
function Lua_na_chest_create() 
	local Owner = OwnerID()
	local array = 10  --10�A�x�}��11*10
	local Matrix = LuaFunc_Matrix_Maker( 50 , array)
	local flag = { }
	local i = 1
	local SPChest = {}
	for j = 1 , array , 1 do  --�_�c���� �� �q1�}�l
		for k = -5, 5 , 1 do --�C ������0�A�����t�A�k����
			flag[i] = LuaFunc_CreateNPCByMatrix(123536,Matrix, j , k )
			WriteRoleValue( flag[i] , EM_RoleValue_PID , 0) 
			i = i + 1
		end
	end
	--���ܯS�w�_�c���ܼơA�����a�I���ɡA�|�����P�����G (������ / ���F)
	for m = 1 , 8 do
		local R = DW_Rand(#flag)
		table.insert( SPChest , flag[R] )
		table.remove( flag , R )
	end
	
	for n = 1 , #SPChest do
		if n <= 3 then
			WriteRoleValue( SPChest[n] , EM_RoleValue_PID , 1 ) -- ������x3	
		else 
			WriteRoleValue( SPChest[n] , EM_RoleValue_PID , 2 ) --���Fx5			
		end
	end
end 


--�_�c�@��
function Lua_na_5years_Chest()
	SetPlot( OwnerID() , "touch" , "Lua_na_5years_ChestOpen", 30 )
end

--�}���_�c
function Lua_na_5years_ChestOpen()
	local Owner = OwnerID()
	local Target = TargetID()
	BeginCastBarEvent( Owner, Target ,"[SC_5YEARS_OPT7]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_5years_ChestOpen_2" )
end


function Lua_na_5years_ChestOpen_2( Owner, CheckStatus )
	local Owner = OwnerID()  -- ���a
	local Target= TargetID() --�_�c
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x, y, z, dir=DW_Location( Target)
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			PlayMotionEX( Target, 145 , 146)
			if PID == 1 then --������
				Sheep = CreateObj( 108874 , x, y, z, dir , 1 )
				ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108874] ]" , 0 )
				AddToPartition( Sheep, Room)	
			elseif PID == 2 then -- ���F
				local R = DW_Rand(10)
				if R > 5 then
					Fairy = CreateObj( 108887 , x, y, z, dir , 1 )	 --LUCKY
					ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108887] ]" , 0 )
				else
					Fairy = CreateObj( 108888, x, y, z, dir , 1 )	--LIGHT
					ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108888] ]" , 0 )
				end	
				SetModeEx(Fairy , EM_SetModeType_Searchenemy, false )--����
				SetModeEx(Fairy , EM_SetModeType_Strikback, false )--����
				SetModeEx(Fairy , EM_SetModeType_Fight , false )--�i�������
				SetModeEx(Fairy , EM_SetModeType_Move , false) --����
				AddToPartition( Fairy, Room)
			else
				if CheckBuff( Owner, 625476) == true then --���B���a�� �A�@�w�|�}���_��
					GiveBodyItem( Owner , 727021 , 1 )
				end
				GiveBodyItem( Owner , 727021 , 1 )
			end
		--	ScriptMessage(Owner, Owner , 0 ,"You Got it" , 0 )
			EndCastBar( Owner , CheckStatus ) --�M���I�k��
			Sleep(20)
			DelObj( Target)
		else --����
		--	ScriptMessage (Owner, Owner, 0 ,"Mission error" , 0 )		
			EndCastBar( Owner , CheckStatus ) --�M���I�k��
		end
	end
end
	

--�S���_�c�@��
--�����ϥX�{�@�� 108874
function Lua_na_5years_sheep() 
	local Owner = OwnerID()
	local Time = 0
	SetModeEx(Owner  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx(Owner , EM_SetModeType_Strikback, false )--����
	addbuff( Owner , 625473 , 0 , -1)
	addbuff( Owner , 625472 , 0 , -1)
	WriteRoleValue( Owner , EM_RoleValue_IsWalk , 0 )
	while true do
		DW_MoveRand(Owner, 50 ) 
		sleep(10)
		Time = Time + 1
		if Time == 60  then
			break
		end
	end
	DelObj( Owner)
end


--����@��
function Lua_na_5years_Fairy()
	local Owner = OwnerID()
	local OrgID = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	if OrgID == 108887 then
		SysCastSpellLv( Owner , Owner , 851672 , 0 )
	elseif OrgID == 108888 then
		SysCastSpellLv( Owner , Owner , 851671 , 0 )
	end
	Sleep(20)
	DelObj( Owner)	
end

--�R�����W�Ҧ���������
--function Lua_na_5years_DELObj() 
--	local Owner = OwnerID() --���ê���
--	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
--	local ObjID = {	123536 , 108887 , 108888	}  --�ݭn�Q�R���_�c������NPC ID �����_�c/���B���F/���l���F
--	local NPC = SearchRangeNPC(Owner , 1500)
----	Say( Owner ,"NPC =".. #NPC)
--	for i = 0 , #NPC do 		--�R���Ҧ����ʬ���NPC
--		for j = 1 , #ObjID do
--			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ObjID[j] then
--				DelObj( NPC[i] )
--			end
--		end
--	end
--end




function Lua_na_5years_DELObj()  --�R���_�c
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 123536 

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
	--			for j = 1 , table.getn( NPC ) , 1 do
				--	if Name == NPC[j] then  --�Y���}�C������
					if Name == NPC then  --�Y���}�C������
						DelObj( ID)
					end
	--			end
			end
		end
		DeBugMsg( 0, RoomID ,"DEL")
	end
end

--����BUFF�����A�]�w���ʺX��
function Lua_na_5years_625474_Cls()
	SetFlag( OwnerID() , 545464 , 1 ) 
	return true
end


-- �ӫ��I�A�y��y��§�] 206848
function LuaI_206848( Option )
	local Owner = OwnerID()
	local PackageID = 206848		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( Owner , EM_RoleValue_SEX  )  
		If BorG == 0 then
			GiveBodyItem( Owner , 725106 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( Owner, 724948 , 1 )	 --�]�k�ͪ�
		end
	end
end


-- �ӫ��I�A�j�Ѫ��B�A�_�c 206824
function LuaI_206824( Option )
	local Owner = OwnerID()
	local PackageID = 206824		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then 
			return false
		elseif CountBodyItem( Owner , 243215) == 0 then --���a�ݭn�֦��B�A�_�c���_�ͤ~��}���_�c
			ScriptMessage( Owner , Owner , 1 , "[SC_5YEARS_MES03]" , 0 )
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then		
		DelBodyItem( Owner , 243215 , 1 )
		GiveBodyItem( Owner , 727022 , 1 )
	end
end


-- �ӫ��I�A�{�{���~���j�N�_�c 243216
function LuaI_243216( Option )
	local Owner = OwnerID()
	local PackageID = 243216		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then 
			return false
		elseif CountBodyItem( Owner , 203178) == 0 then  --���a���W�ݭn�� �j�Ѫ��_�� �~��}���_�c
			ScriptMessage( Owner , Owner , 1 , "[SC_DAN_111700_30]" , 0 )
			return false
		else	
			return true
		end

	elseif ( Option == "USE" ) then		
		DelBodyItem( Owner , 203178 , 1 )
		GiveBodyItem( Owner , 727023 , 1 )
	end
end


--�p�ͻX�A�C��i����@��243215 ���_�͡A��ܼ@��
function Lua_na_5years_123584()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir( Target , Owner , 0 ) --���V
	if CheckFlag( Owner , 547538 ) == true then  --�w�g����L�_�ͤF
		SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK12]" )
	else
		SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK11]" )	
		AddSpeakOption( Owner , Owner ,"[SC_5YEARS_OPT9]" , "Lua_na_5years_Key", 0 )	
	end
end


function Lua_na_5years_Key()
	local Owner = OwnerID()
	SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK12]" )
	GiveBodyItem( Owner , 243215 , 1 )
	GiveBodyItem( Owner , 203178 , 1 )
	SetFlag( Owner , 547538 , 1)
end

--���P�~�n�J§�]
Function LuaI_242211() --���g�~�y§�]
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242211]][$SETVAR3=[202936]]" 

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
function LuaI_242211_Cast()
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242211]][$SETVAR3=[202936]]" 
	RunningMsgEx( OwnerID() , 2 , 2 , Prize1Str )
end