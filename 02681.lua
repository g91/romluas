function LuaI_207086() --����ı��§�]
	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 206277 ,1, 202669 ,1, 222925 ,1 , 222926 , 1 , 203050 , 10 , 202903 , 25 , 202902 , 10 } }
	return BaseTressureProc6( itemset , 7 )
end

function LuaI_209176()
 	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209176]][$SETVAR3=[229714]x1]"  --229714 �k�ʯD���Y��
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209176]][$SETVAR3=[202929]x1]"  --202929 �]���_����q50�I

	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	
	local itemset1 = {  5 ,Prize1Str 	, { 229714 , 1 }
			, 10 ,Prize2Str	, { 202929 , 1 }
			, 17 ,""		, { 201139 , 1 }
			, 20 ,""		, { 241464 , 1 } 
			, 40 ,"" 		, { 202902 , 5 }
			, 60 ,"" 		, { 202903 , 5 } 
			, 80 ,""		, { 202904 , 5 } 
			, 100 ,""	, { 202435 , 5 } 	}
							
	BaseTressureProc7( itemset1 , 1 )

	return true

end

function LuaI_209177()
 	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[229715]x1]"  --229715 �k�ʯD��
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[229709]x1]"  --229709�k�ʯD��
	local Prize3Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207786]x1]"  --207786 �����H���Z����
	local Prize4Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207788]x1]"  --207788 �����H��������
	local Prize5Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207787]x1]"  --207787 �����H���˳ƥ�

	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	
	local itemset1 = {  5 ,Prize1Str 	, { 229715, 1 }
			, 10 ,Prize2Str	, { 229709, 1}
			, 16 ,Prize3Str  	, { 207786, 1}
			, 23 ,Prize4Str  	, { 207788, 1} 
			, 32 ,Prize5Str  	, { 207787, 1}
			, 57 ,""	 	, { 203576 , 1} 
			, 82 ,""		, { 202434, 3 } 
			, 100 ,""	, { 206426, 2} 	}

	BaseTressureProc7( itemset1 , 1 )

	return true

end


----- 2013 �x������`���ʼ��y���~
function luaI_241743_check() 
	local Player = OwnerID()
	if CheckBuff(Player, 504485 ) == True or CheckBuff(Player, 504486 ) == True then
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM2]" , 0 )  -- �A�ȮɦY���U������F�C
		ScriptMessage( Player,  Player, 0, "[SC_123028_ITEM2]" , 0 )  -- �A�ȮɦY���U������F�C
		return false
	else
		return true
	end
end


function luaI_241743()   -- ��J�����
	local Player = OwnerID()
	local R = Rand(100)+1
	local bufftime = 3600	

	if R >= 35 then  -- 65%���v
		local buffid1 = 504485
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM1][$SETVAR1=".."["..buffid1.."]".."]" , C_SYSTEM )  -- �A��o�F[$VAR1]���ĪG�C
		AddBuff(Player, buffid1, 0, bufftime )  -- �X���������� �W�[HP / MP�W��
	else  -- 35%���v
		local buffid2 = 504486
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM1][$SETVAR1=".."["..buffid2.."]".."]" , C_SYSTEM )  -- �A��o�F[$VAR1]���ĪG�C
		AddBuff(Player, buffid2, 0, bufftime )  -- �@���������� �W�[���z�P�k�N�z��
	end
end


--2013�U�t�`�n��
function LuaI_209178()
	local itemset  = {  35 ,"" 	, { 202434 , 3 },	
			  55 ,""	, { 205815 , 1 },
			  70 ,""	, { 205816 , 1 },
			  80 ,""	, { 205814 , 1 },
			  100 ,"" , { 206426 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end


--2014 �A���]����J
function LuaI_209179()
	local itemset  = { 	 2000 ,"" 	, { 202930 ,1 },	
			 3995,""	, { 202881 ,1 },
			 5995 ,""	, { 202844 ,1 },
			 8995 ,""	, { 202845 ,1 },
			 9495 ,"" , { 202846 ,1 },
			 9795 ,""	,{ 202847 ,1 },
			 9995  ,"" ,{ 202848 ,1 },
			 10000 ,"",{ 202849 , 1 }	}
	return BaseTressureProc4(   itemset , 1  )
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�P��60~80

function LVUPPotion2_CHECK( UPLV )

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- Ū����e¾�~����

	local ObjID = {	[60] = 209180	,
			[70] = 209181	,
			[80] = 209182	}

	if ( CountBodyItem( PlayerID , ObjID[UPLV] ) >= 1 ) then
		if ( NowLV < UPLV ) then
			return true
		else
			ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- ���~�L�k�ϥΡA�z����e¾�~���ŶW�L���~�i���@��¾�~���šI
			return false
		end
	else
		return false
	end

end

function LVUPPotion2_USE( UPLV )
	local PlayerID = OwnerID()
	BeginPlot( PlayerID , "LVUPPotion_"..UPLV , 1 )
end


function LVUPPotion_60()
	local UPLV = 60
	LVUPPotion2_Dialog( UPLV )
end


function LVUPPotion_70()
	local UPLV = 70
	LVUPPotion2_Dialog( UPLV )
end


function LVUPPotion_80()
	local UPLV = 80
	LVUPPotion2_Dialog( UPLV )
end
--
function LVUPPotion2_Dialog( UPLV )

	local PlayerID = OwnerID()

	local MessageString = "[SC_202671_3][$SETVAR1="..UPLV.."]"
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( PlayerID , EM_LuaDialogType_YesNo , MessageString )
		DialogSelectStr( PlayerID , GetString("SC_OKAY") )		-- �T�w
		DialogSelectStr( PlayerID , GetString("SC_CANCEL") )		-- ����
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( PlayerID ) == false ) then 
			ScriptMessage( PlayerID , PlayerID , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		local n = 0
		local DialogResult = ""

		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( PlayerID )
			n = n + 1
			if n > 120 then -- ���L�a�j��A120 = �@����
				ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_2") , 0 )	-- �z����Үɶ��L�[�A�нT�w�z���N�@����A�A���s�ϥγo�Ӫ��~�I
				ScriptMessage( PlayerID , PlayerID , 0 , GetString("SC_202671_2") , 0 )	-- �z����Үɶ��L�[�A�нT�w�z���N�@����A�A���s�ϥγo�Ӫ��~�I
				DialogClose( PlayerID )
				break
			else
				-- nothing
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					DialogClose( PlayerID )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
					DialogResult = "No"
					DialogClose( PlayerID )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end

		if ( DialogResult == "Yes" ) then

			local ObjID = {	[60] = 209180	,
					[70] = 209181	,
					[80] = 209182	}			-- ��ǽs��

			if DelBodyItem( PlayerID , ObjID[UPLV] , 1 ) then

				CastSpell( PlayerID , PlayerID , 491265 )	-- ���S��

				local Obj = Role:new( PlayerID )
				--Obj:SetJob( VocNum )			-- ��¾�~
				Obj:SetLevel( UPLV )			-- �]����
				--SetStandardWearEq( PlayerID )		-- �]�˳�
				SetStandardClearMagicPointAndSetTP( PlayerID )	-- �]�I��
			end

		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------