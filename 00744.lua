function LVUPPotion_CHECK9_ForG()

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- 讀取當前職業等級
	local UPLV = 9

	local ObjID = 202900			-- 基準編號

	if ( CountBodyItem( PlayerID , ObjID ) >= 1 ) then
		if ( NowLV < UPLV ) then
			return true
		else
		--	ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- 物品無法使用，您的當前職業等級超過物品可提昇的職業等級！
			return false
		end
	else
		return false
	end

end

function LVUPPotion_USE9_ForG()	-- 德國展覽用
	local PlayerID = OwnerID()
	local UPLV = 9

	CastSpell( PlayerID , PlayerID , 491265 )	-- 播特效

	local Obj = Role:new( PlayerID )
	Obj:SetLevel( UPLV )			-- 設等級
	SetStandardClearMagicPointAndSetTP( PlayerID )	-- 設點數
end

function LVUPPotion_CHECK( UPLV )

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- 讀取當前職業等級

	local ObjID = 202670			-- 基準編號
	ObjID = ObjID + ( ( UPLV -20 ) / 5 ) + 1		-- 正確的資料庫編號

	if ( CountBodyItem( PlayerID , ObjID ) >= 1 ) then
		--if ( NowLV < UPLV ) then
			return true
		--else
		--	ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- 物品無法使用，您的當前職業等級超過物品可提昇的職業等級！
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
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( PlayerID , EM_LuaDialogType_YesNo , MessageString )
		DialogSelectStr( PlayerID , GetString("SC_OKAY") )		-- 確定
		DialogSelectStr( PlayerID , GetString("SC_CANCEL") )		-- 取消
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( PlayerID ) == false ) then 
			ScriptMessage( PlayerID , PlayerID , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		local n = 0
		local DialogResult = ""

		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( PlayerID )
			n = n + 1
			if n > 120 then -- 防無窮迴圈，120 = 一分鐘
				ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_2") , 0 )	-- 您的思考時間過久，請確定您的意願之後，再重新使用這個物品！
				ScriptMessage( PlayerID , PlayerID , 0 , GetString("SC_202671_2") , 0 )	-- 您的思考時間過久，請確定您的意願之後，再重新使用這個物品！
				DialogClose( PlayerID )
				break
			else
				-- nothing
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					DialogClose( PlayerID )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
					DialogResult = "No"
					DialogClose( PlayerID )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end

		if ( DialogResult == "Yes" ) then

			local ObjID = 202670			-- 基準編號
			ObjID = ObjID + ( ( UPLV -20 ) / 5 ) + 1		-- 正確的資料庫編號

			if DelBodyItem( PlayerID , ObjID , 1 ) then

				CastSpell( PlayerID , PlayerID , 491265 )	-- 播特效

				local Obj = Role:new( PlayerID )
				--Obj:SetJob( VocNum )			-- 改職業
				Obj:SetLevel( UPLV )			-- 設等級
				--SetStandardWearEq( PlayerID )		-- 設裝備
				SetStandardClearMagicPointAndSetTP( PlayerID )	-- 設點數
			end

		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end