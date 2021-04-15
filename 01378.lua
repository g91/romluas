function Lua_VocJobDellist_0( Option )

	local PlayerID = OwnerID()
	local PackageID = 203283	
	local Subjobget =  CheckFlag( OwnerID()  , 540820 ) --取得新職業

	-- 2012.07.23 新增，修正物品 - 遺忘之果(203283)，當玩家使用遺忘之果時，若副職為符文工匠或靈能者，確認視窗出現的職業提示會為 0 的問題
	-- 以及學習第三職業後，若刪除任一副職會發生無法刪除其它副職的問題。
	local Owner = OwnerID() 
	local SubLv = ReadRoleValue( Owner , EM_RoleValue_LV_SUB )	-- 副職等級
	--
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and Subjobget == true then
			-- 2012.07.23 新增
			if SubLv == 0 then
				ScriptMessage( Owner , Owner , 0 , "[SC_VOCJOBDELLIST05]" , 0 ) -- 未裝備副職
				ScriptMessage( Owner , Owner , 1 , "[SC_VOCJOBDELLIST05]" , 0 )
				return false
			end	
			--
			return true
		elseif Subjobget == false then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_VOCJOBDELLIST02]", 0 )--未取得新職業
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VOCJOBDELLIST02]", 0 )
			return false
		end
	elseif ( Option == "USE" ) then
		Beginplot( OwnerID() ,"Lua_VocJobDellist_1", 0 )
	end
end
--以下是 KEY選單
function Lua_VocJobDellist_1()
	DebugMsg( 0 , 0 , "Enter" )
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- 副職
	local VOC_STRING = 0 --字串

--	Say( OwnerID()  ,  SubJobID)

	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}


	local VocJob = 0

	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end

	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--未取得新職業
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )	
	else
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_VOCJOBDELLIST01]".."|cffff00ff" ..VocJob.. "|r".."  ".."[SO_110266_5]") --將遺忘副職確認嗎?
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
			DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--資料送出有問題
				return
			end
			
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( OwnerID() );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
					if ( SelectID == 0 ) then--確認
						Beginplot( OwnerID() ,"Lua_VocJobDellist_2", 0 )
						CancelBuff( OwnerID(), 501570 );--最後清除BUFF
						DialogClose( OwnerID() )
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( OwnerID(), 501570 );--最後清除BUFF
						DialogClose( OwnerID() )		
						break
					end
				elseif i == 1000 then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				elseif ( SelectID == -1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )	
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end

end

function Lua_VocJobDellist_2()	--確認顯示框
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- 副職
	local VOC_STRING = 0 --字串
--	Say( OwnerID()  ,  SubJobID)
	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}


	local VocJob = 0
	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end
	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--未取得新職業
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )	
	else
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_VOCJOBDELLIST03]" ) --將遺忘 副職 真的確認嗎?
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
			DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--資料送出有問題
				return
			end
			
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( OwnerID() );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
					if ( SelectID == 0 ) then--確認
						Beginplot( OwnerID() ,"Lua_VocJobDellist_3", 0 )
						CancelBuff( OwnerID(), 501570 );--最後清除BUFF
						DialogClose( OwnerID() )
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( OwnerID(), 501570 );--最後清除BUFF
						DialogClose( OwnerID() )		
						break
					end
				elseif i == 1000 then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				elseif ( SelectID == -1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )	
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end

end

function Lua_VocJobDellist_3()
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- 副職
	local VOC_STRING = 0 --字串
--	Say( OwnerID()  ,  SubJobID)
	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}

	local VocJob = 0
	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end
	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--未取得新職業
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )
	else
		DelJob( OwnerID() , SubJobID )
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST04]", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST04]", 0 )	
		DelBodyItem( OwnerID() , 203283 , 1 )
	-- 2012.07.23 新增，修正物品 - 遺忘之果(203283)，當玩家使用遺忘之果時，若副職為符文工匠或靈能者，確認視窗出現的職業提示會為 0 的問題
	-- 以及學習第三職業後，若刪除任一副職會發生無法刪除其它副職的問題。
		local Job , Total = { } , 0
		local Owner = OwnerID() 
		Job[1] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Warrior )		-- 戰士
		Job[2] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Ranger )		-- 遊俠
		Job[3] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Rogue )		-- 影行者
		Job[4] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Wizard )		-- 法師
		Job[5] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Priest )		-- 祭司
		Job[6] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Knight )		-- 騎士
		Job[7] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_RuneDancer )	-- 森林牧者
		Job[8] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Druid )		-- 自然神官
		Job[9] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_HARPSYN )	-- 靈能者
		job[10] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_PSYRON )	-- 符文工匠
	
		for i = 1 , #job , 1 do
			if Job[i] > 0 then
				Total = Total + 1
				DebugMsg( Owner , 0 , "Job"..i.." = "..Job[i].." Total = "..Total )
			end
		end
		if Total == 1 then
			SetFlag( OwnerID()  , 540820 , 0 ) -- 刪除新職業旗標
		end
	end
	--
end