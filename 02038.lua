function Lua_Pumpkin_na_NPCspeak()	--NPC ���ԡD�����L��l��SCRIPT
	LoadQuestOption( OwnerID())
	SetSpeakDetail( OwnerID(), GetString("[SC_PUMPKIN_NA_11]") )	--�S��F�n���צ����u�`�F�I���I���ƫo�R��������`��A�A���~�]�������ִc�@�@�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1"), "LuaS_111490_1", 0 )	--����n�ʸ`���Ѩ�
end

function Lua_Pumpkin_na_createNPC()  -- ���ʮɶ��P�_
	if Pumpkin_All == nil then			-- 2010.08.27 �s�W  �����ܼ�
		Pumpkin_All = {}			--
	end						--
	while true do
		local min = GetSystime(2)
	--	say(OwnerID(), hour )
		--say(OwnerID(), min )
		local ZoneID = ReadRoleValue(OwnerID() , EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

		if Zone == 15 then
			if  min == 15 or min == 45 then  --�C30
				-- 1. �s��
  				RunningMsg( OwnerID() , 1 , "[SC_PUMPKIN_NA_10]" ) 	--  (0 �ۤv 1 �ϰ� 2 �������a )�C�p�n�ʺ�S�X�{�b�F�ԥ��������o�J�F�I
				--2. ���n��
				BeginPlot(OwnerID(), "Lua_Pumpkin_na_createNPC1" , 0 )  --���ͫn��	
			elseif min == 20 or min == 50 then  
				RunningMsg( OwnerID() , 1 , "[SC_PUMPKIN_NA_12]" ) 	--�F�ԥ��������o�i�ê��n�ʳ������F�C
				BeginPlot( OwnerID(),"Lua_Pumpkin_na_DelPumpkin", 0 ) -- �R���Ҧ��n��
			end
		end
		Sleep(600)   --�@�����]�@��
	end
end
--

function Lua_Pumpkin_na_createNPC1()	--�n��NPC���ͨ禡
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local x = {}	--�ŧiX���@��table

	for i=0,49,1 do	--for�j��A�_�l�Ȭ�1�A�@�]50���A�H���X�{50�ӥi�ê��n��
		local RandomNumber = Rand(99)+1	--�H�����@�ӼƦr�A+1���F��random�Ʀr���|��0
	--	say(OwnerID(), RandomNumber)
		if RandomNumber >= 30 then	--�X�{ �i�ê��n�ʡA�|�I��d�����~BUFF
			x[i] = CreateObjByFlag( 116032 , 780322 , i ,1 )	--����b�X�Ъ���m����
			AddToPartition(x[i],RoomID )	--�b�C�������
			BeginPlot(x[i], "Lua_Pumpkin_na_panicbuff" , 0 )  --���P�򪱮a�A�ϥ�BUFF
		elseif  RandomNumber < 30 then	--�X�{�i�ê��n�� �A�I�������
			x[i] = CreateObjByFlag(115349, 780322 , i ,1 )
			AddToPartition(x[i],RoomID )
		end
	end
	Pumpkin_All = x	-- 2010.08.27 �s�W  �����ܼ�
end	
------------------------------------------------------------------------------
function Lua_Pumpkin_na_scarymessage()	--����n�ʺ����~���T��
	ScriptMessage( TargetID() , TargetID() , 1 , GetString("SC_PUMPKIN_NA_01") , C_SYSTEM )	--����p�n�ʺ몺���~�I
	ScriptMessage( TargetID() , TargetID() , 0 , GetString("SC_PUMPKIN_NA_01") , C_SYSTEM )	--����p�n�ʺ몺���~�I
end

------------------------------------------------------------------------------
function Lua_Pumpkin_na_panicbuff()	--���ߪ�BUFF
	while true do
		sleep(100) 
		CastSpell(OwnerID(),OwnerID(),496070 )
	end
end

------------------------------------------------------------------------------
--�n�ʪ�Ĳ�I�@��
function Lua_Pumpkin_na_touch1()
	SetPlot( OwnerID() , "touch" , "Lua_Pumpkin_na_touchA" , 50 )
end


function Lua_Pumpkin_na_touch2()
	SetPlot(  OwnerID() , "touch" , "Lua_Pumpkin_na_touchB" , 50 ); --�]�w����Ĳ�I�@���A50���d��
end


function Lua_Pumpkin_na_touchA()	--�a�n��
	--OwnerID�����a
	--TargetID���n��
	if ReadRoleValue ( TargetID() , EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1 )
		local cage = CountBodyItem( OwnerID(), 207267)
		if cage >=1 then
			for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 �s�W  �����ܼ�
				if Pumpkin_All[i] == TargetID() then	--
					Pumpkin_All[i] = 0	--
				end
			end
			BeginPlot( TargetID(), "Lua_Pumpkin_na_createNPC2", 0)
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_02") , C_SYSTEM )	--�o�{�p�n�ʺ�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_02") , C_SYSTEM )	--�o�{�p�n�ʺ�I
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--�ݰ_�Ӧ��I�i�ê��n�ʡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--�ݰ_�Ӧ��I�i�ê��n�ʡC	
		end
	end
end

function Lua_Pumpkin_na_touchB()	--���q�n��
	--OwnerID�����a
	--TargetID���n��
	local cage = CountBodyItem( OwnerID(), 207267)
	if cage >=1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_03") , C_SYSTEM )	--�o�u�O���q���n�ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_03") , C_SYSTEM )	--�o�u�O���q���n�ʡC
		for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 �s�W  �����ܼ�
			if Pumpkin_All[i] == TargetID() then	--
				Pumpkin_All[i] = 0	--
			end				--
		end					--
		DelObj( TargetID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--�ݰ_�Ӧ��I�i�ê��n�ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_04") , C_SYSTEM )	--�ݰ_�Ӧ��I�i�ê��n�ʡC	
	end
end

--------------------------------------------------------------------------------
function Lua_Pumpkin_na_createNPC2()	--���ͤp�n�ʺ� �@��	
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o�n�ʪ� X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  116033  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b�n�ʮy�� X.Y.Z.Dir ���W�ǳƳХ� �p�n�ʺ�
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, true )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	Hide( OwnerID() )
	AddToPartition( NPC , RoomID) -- �إߪ���
--	PlayMotion(NPC, 37)  
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	--SetRandMove( NPC, 20, 5, 10)	-- �]�w�p�n�ʺ��H�����ʡA�d��B���j�ɶ�(100���@��)�B�̤j���ʶZ��
	Say( NPC, "[SC_PUMPKIN_NA_05]" )--���r�I�Q�o�{�աI
	BeginPlot( NPC, "Lua_Pumpkin_na_createNPC3", 80 )
	DelObj(OwnerID())
end

function Lua_Pumpkin_na_createNPC3()	--�p�n�ʺ�X�{8������
	Say( OwnerID(), "[SC_PUMPKIN_NA_06]" ) -- �����I�A�줣��ڡC
	Delobj( OwnerID() )	--�p�n�ʺ�8���R��
end	

------------------------------------------------------------------------------
function LuaI_207267_Check()  --�ˬd�����~�O�_�b�S�wNPC���W�A���~ �n�ʺ뮷�~Ţ ���@��
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 116033 --�p�n�ʺ�

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_07") , C_SYSTEM )	--���~Ţ�ȥu��Ω󮷮��p�n�ʺ�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_07") , C_SYSTEM )	--���~Ţ�ȥu��Ω󮷮��p�n�ʺ�C
		return false	
	end
end

------------------------------------------------------------------------------
function LuaI_207267_Effect()   --���v�P�w 
--OwnerID�����a
--TargetID���n�ʺ�
	local random = rand(100)
	if random >40 then  -- ���p�n�ʺ� ���v��60%
		BeginPlot( OwnerID() , "LuaI_207267_Delitem" , 0 )  
	else --�줣��p�n�ʺ�  40%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_08") , C_SYSTEM )	--�p�n�ʺ�k���F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_08") , C_SYSTEM )	--�p�n�ʺ�k���F�C
	end
	Delobj(TargetID() )

end
------------------------------------------------------------------------------
function LuaI_207267_Delitem()   --���\��^        
--Owner �P Target�Ҭ����a
	sleep(20)	
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PUMPKIN_NA_09") , C_SYSTEM )	--�A���F�p�n�ʺ�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_PUMPKIN_NA_09") , C_SYSTEM )	--�A���F�p�n�ʺ�I
	GiveBodyItem( OwnerID() , 207268 , 1)	--���� �˵۫n�ʺ몺Ţ�l
	DelBodyItem( OwnerID() , 207267 , 1) 	--�R�� �n�ʺ뮷�~Ţ
end


function Lua_Pumpkin_na_DelPumpkin()	--�ɶ���R���Ҧ��n��
	--local NPC = { 115349,116032 }
	--Lua_DavisDelObj(NPC)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	
	for i=0,table.getn(Pumpkin_All) do	-- 2010.08.27 �s�W  �����ܼ�
		if Pumpkin_All[i] > 0  then	--
			DelObj(Pumpkin_All[i])	--
			Count = Count + 1	--
--	DebugMsg( 0 , RoomID ," Pumpkin_All NM =  "..Pumpkin_All[i] )
		end				--
	end					--
--	DebugMsg( 0 , RoomID ," Remove Count =  "..Count )
	Pumpkin_All = {}			--
end


--------------------------------------------------------------------------------
--�n�ʸ`���y

function LuaI_207964( Option ) --�n����_�]
	local PlayerID = OwnerID()
	local PackageID = 207964	
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725450 , 1 )	
	end
end