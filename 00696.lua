function LuaS_111082()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , 421011 ) == true or CheckAcceptQuest( OwnerID() , 421012 ) == true then
		if CountBodyItem ( OwnerID() , 202223 ) <= 10 then	-- 10�ʪh�a��
			AddSpeakOption( OwnerID() , TargetID() , GetString("SO_111082_1") , "LuaS_111082_BUY" , 0 )	-- �W�[�@�ӿﶵ�G���R�h�a��
		end
	end
end

function LuaS_111082_BUY()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( OwnerID(), "LuaS_111082_Dialog", 1 )
end

function LuaS_111082_Dialog()
	local n = 0
	local DialogResult = ""
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SO_111082_2") )	-- �Q�R�h�a���H 10 �ʪ�����O 50 �ȡA�A�n�R�ܡH
		DialogSelectStr( OwnerID() , GetString("SO_111082_3") )	-- �S���D�A�ڶR�F�I
		DialogSelectStr( OwnerID() , GetString("SO_111082_4") )	-- �ӶQ�F���Q�R�I
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end
		
		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( OwnerID() );
			n = n + 1
			if n > 60 then -- ���L�a�j��A60 = �b����
				--ScriptMessage( OwnerID(), OwnerID(), 0, "�L�a�j��", 0 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			else
				--ScriptMessage( OwnerID(), OwnerID(), 0, "�X�k�j��", 0 )
			end

			if ( DialogStatus >-2 ) then 
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
					DialogResult = "No"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				end
			end
		end

		if ( DialogResult == "Yes" ) then
			local Money = Read_Role_Money( OwnerID() )
			--ScriptMessage( OwnerID(), TargetID(), 0, "You Have Money�G"..Money , 0 )

			if ( Money < 5000 ) then
				Say ( OwnerID() , GetString("SO_111082_5") )	-- �A���W�����������A�ڵL�k�浹�A�I
			else
				Role_MoneyChange( OwnerID(), -5000 )
				GiveBodyItem ( OwnerID() , 202223 , 10 )	-- 10�ʪh�a��
			end
		elseif ( DialogResult == "No" ) then

		else
			Say ( OwnerID() , GetString("SO_111082_6") )	-- �٬O�U���A�ӶR�a�I
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function LuaS421012_CHECK()
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if ( ClickObj == 111101 ) then
		if CountBodyItem( OwnerID() , 202198 ) >= 5 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_5") , 0 )	-- �w�g���o������ġA���ݦA�i��N�N�F�I
			return false
		elseif CountBodyItem( OwnerID() , 200295 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_1") , 0 )	-- �ʥF�h��A�L�k�i��N�N�I
			return false
		elseif CountBodyItem( OwnerID() , 202223 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_2") , 0 )	-- �ʥF�h�a���A�L�k�i��N�N�I
			return false
		else
			return true
		end
	elseif ( ClickObj == 111086 ) then
		return true
	end

end

function LuaS421012_CLICK()
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if ( ClickObj == 111101 ) then
		local RND =  Rand( 99 ) + 1	-- ���� 1~100 ���ü�
		--Say( TargetID() , RND )
		if ( RND <= 50 ) then
			if DelBodyItem ( OwnerID() , 200295 , 1 ) and DelBodyItem ( OwnerID() , 202223 , 1 ) then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_3") , 0 )	-- ���Q�����N�N�I
				GiveBodyItem ( OwnerID() , 202198 , 1 )
				return true
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_4") , 0 )	-- �N�N�����Ӷ��Q�A���O�F�h��P�h�a���K
			DelBodyItem ( OwnerID() , 200295 , 1 )
			DelBodyItem ( OwnerID() , 202223 , 1 )
			return false
		end
	elseif ( ClickObj == 111086 ) then
		return true
	end
end