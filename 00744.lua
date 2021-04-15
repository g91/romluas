function LVUPPotion_CHECK9_ForG()

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- Ū����e¾�~����
	local UPLV = 9

	local ObjID = 202900			-- ��ǽs��

	if ( CountBodyItem( PlayerID , ObjID ) >= 1 ) then
		if ( NowLV < UPLV ) then
			return true
		else
		--	ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- ���~�L�k�ϥΡA�z����e¾�~���ŶW�L���~�i���@��¾�~���šI
			return false
		end
	else
		return false
	end

end

function LVUPPotion_USE9_ForG()	-- �w��i����
	local PlayerID = OwnerID()
	local UPLV = 9

	CastSpell( PlayerID , PlayerID , 491265 )	-- ���S��

	local Obj = Role:new( PlayerID )
	Obj:SetLevel( UPLV )			-- �]����
	SetStandardClearMagicPointAndSetTP( PlayerID )	-- �]�I��
end

function LVUPPotion_CHECK( UPLV )

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- Ū����e¾�~����

	local ObjID = 202670			-- ��ǽs��
	ObjID = ObjID + ( ( UPLV -20 ) / 5 ) + 1		-- ���T����Ʈw�s��

	if ( CountBodyItem( PlayerID , ObjID ) >= 1 ) then
		--if ( NowLV < UPLV ) then
			return true
		--else
		--	ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- ���~�L�k�ϥΡA�z����e¾�~���ŶW�L���~�i���@��¾�~���šI
		--	return false
		--end
	else
		return false
	end

end

function LVUPPotion_USE( UPLV )

	local PlayerID = OwnerID()
	BeginPlot( PlayerID , "LVUPPotion_"..UPLV , 1 )

end

function LVUPPotion_20()
	local UPLV = 20
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_25()
	local UPLV = 25
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_30()
	local UPLV = 30
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_35()
	local UPLV = 35
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_40()
	local UPLV = 40
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_45()
	local UPLV = 45
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_50()
	local UPLV = 50
	LVUPPotion_Dialog( UPLV )
end

function LVUPPotion_Dialog( UPLV )

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

			local ObjID = 202670			-- ��ǽs��
			ObjID = ObjID + ( ( UPLV -20 ) / 5 ) + 1		-- ���T����Ʈw�s��

			if DelBodyItem( PlayerID , ObjID , 1 ) then

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