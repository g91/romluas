function LuaI_207086() --神諭覺醒禮包
	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 206277 ,1, 202669 ,1, 222925 ,1 , 222926 , 1 , 203050 , 10 , 202903 , 25 , 202902 , 10 } }
	return BaseTressureProc6( itemset , 7 )
end

function LuaI_209176()
 	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209176]][$SETVAR3=[229714]x1]"  --229714 女性浴衣頭飾
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209176]][$SETVAR3=[202929]x1]"  --202929 魔幻寶盒能量50點

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
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[229715]x1]"  --229715 女性浴衣
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[229709]x1]"  --229709男性浴衣
	local Prize3Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207786]x1]"  --207786 完美信仰武器石
	local Prize4Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207788]x1]"  --207788 完美信仰首飾石
	local Prize5Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209177]][$SETVAR3=[207787]x1]"  --207787 完美信仰裝備石

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


----- 2013 台版中秋節活動獎勵物品
function luaI_241743_check() 
	local Player = OwnerID()
	if CheckBuff(Player, 504485 ) == True or CheckBuff(Player, 504486 ) == True then
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM2]" , 0 )  -- 你暫時吃不下任何月餅了。
		ScriptMessage( Player,  Player, 0, "[SC_123028_ITEM2]" , 0 )  -- 你暫時吃不下任何月餅了。
		return false
	else
		return true
	end
end


function luaI_241743()   -- 艾克的月餅
	local Player = OwnerID()
	local R = Rand(100)+1
	local bufftime = 3600	

	if R >= 35 then  -- 65%機率
		local buffid1 = 504485
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM1][$SETVAR1=".."["..buffid1.."]".."]" , C_SYSTEM )  -- 你獲得了[$VAR1]的效果。
		AddBuff(Player, buffid1, 0, bufftime )  -- 柔順香甜滋味 增加HP / MP上限
	else  -- 35%機率
		local buffid2 = 504486
		ScriptMessage( Player,  Player, 1, "[SC_123028_ITEM1][$SETVAR1=".."["..buffid2.."]".."]" , C_SYSTEM )  -- 你獲得了[$VAR1]的效果。
		AddBuff(Player, buffid2, 0, bufftime )  -- 濃郁漫延滋味 增加物理與法術爆擊
	end
end


--2013萬聖節南瓜
function LuaI_209178()
	local itemset  = {  35 ,"" 	, { 202434 , 3 },	
			  55 ,""	, { 205815 , 1 },
			  70 ,""	, { 205816 , 1 },
			  80 ,""	, { 205814 , 1 },
			  100 ,"" , { 206426 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end


--2014 璀璨魔石轉蛋
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
--仙豆60~80

function LVUPPotion2_CHECK( UPLV )

	local PlayerID = OwnerID()
	local NowLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )	-- 讀取當前職業等級

	local ObjID = {	[60] = 209180	,
			[70] = 209181	,
			[80] = 209182	}

	if ( CountBodyItem( PlayerID , ObjID[UPLV] ) >= 1 ) then
		if ( NowLV < UPLV ) then
			return true
		else
			ScriptMessage( PlayerID , PlayerID , 1 , GetString("SC_202671_1") , 0 )	-- 物品無法使用，您的當前職業等級超過物品可提昇的職業等級！
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

			local ObjID = {	[60] = 209180	,
					[70] = 209181	,
					[80] = 209182	}			-- 基準編號

			if DelBodyItem( PlayerID , ObjID[UPLV] , 1 ) then

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
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------