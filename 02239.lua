
--======================================================================================================
--423785臨時領隊
--======================================================================================================


function LuaZ13WS_423785_accept()
	local A=Rand(100000)
	CancelBuff(TargetID(),508192)
	AddBuff(TargetID(),508191,1,600)
	WriteRoleValue( TargetID() , EM_RoleValue_PID ,A )
	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 ,0  )

	local Cu1= Lua_DW_CreateObj("flag" ,117331,780566,1)
	local Cu2= Lua_DW_CreateObj("flag" ,117332,780566,2)
	local Cu3= Lua_DW_CreateObj("flag" ,117331,780566,3)
	local Cu4= Lua_DW_CreateObj("flag" ,117332,780566,4)
	
	DisableQuest(Cu1, true )
	DisableQuest(Cu2, true )
	DisableQuest(Cu3, true )
	DisableQuest(Cu4, true )
	
	WriteRoleValue( Cu1 , EM_RoleValue_PID , A )
	WriteRoleValue( Cu2 , EM_RoleValue_PID , A )
	WriteRoleValue( Cu3 , EM_RoleValue_PID , A )
	WriteRoleValue( Cu4 , EM_RoleValue_PID , A )
	
	Beginplot(Cu1,"LuaZ13WS_423785_accept_1",0)
	Beginplot(Cu2,"LuaZ13WS_423785_accept_1",0)
	Beginplot(Cu3,"LuaZ13WS_423785_accept_1",0)
	Beginplot(Cu4,"LuaZ13WS_423785_accept_1",0)


end

function LuaZ13WS_423785_accept_1()
--say(OwnerID(),"001")
--say(TargetID(),"TT1")
WriteRoleValue( TargetID() , EM_RoleValue_PID ,0 )
				
	local player =SearchRangePlayer ( OwnerID() , 400 )				
			--搜尋npc身邊 400範圍內的玩家，放入陣列內
	local One	
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue(player[i], EM_RoleValue_PID ) == ReadRoleValue(OwnerID(),EM_RoleValue_PID) then
					One= player[i]	--玩家
				end
			end
	CancelBuff(One,508192)
	local NPC =SearchRangeNPC ( OwnerID() , 400 )				
	--搜尋npc身邊 400範圍內的NPC，放入陣列內
	local Two={}
	--設Two為陣列
	
			for i=0,table.getn(NPC),1 do
				if 	ReadRoleValue(NPC[i], EM_RoleValue_PID ) == ReadRoleValue(OwnerID(),EM_RoleValue_PID) then
					Two= NPC[i]	--玩家
				end
			end	
		
	SetFollow( OwnerID(), One ) 
	--設定冒險者跟隨玩家
	--say(Two,"me")

	local quest="in"
	local Distance="close"
	local goal="Notarrive"
	 
				while 1 do
					if 	GetDistance( OwnerID(),One) >400 			or
						GetDistance(Two,One) >400 					then
						Distance="far"
						break
					end
				
					if 	(CheckAcceptQuest(One,423785)== false )		or
						(CheckCompleteQuest(One,423785)==true)		or
						Checkflag(One,544734) ==true				or
						CheckID(One)== false						then
						quest="out"
						break
					end	
					
					if 	GetDistance( OwnerID(),One) >200	then
						ScriptMessage( One, One, 0,"[SC_423785_3]", 0 )
						ScriptMessage( One, One, 2,"[SC_423785_3]", 0 )
						--你的隊員快跟丟了，請放慢腳步。
						
					end
					
					if 	CheckBuff( One , 508192)==true	then
						goal="arrive"
						break
					end				
				sleep(10)
				end
	
	if 	Distance=="far" then
		ScriptMessage( One, One, 0,"[SC_423785_2]", 0 )
		ScriptMessage( One, One, 2,"[SC_423785_2]", 0 )
		--你的隊員跟丟了，任務失敗，請放棄此任務再重新接取！
		WriteRoleValue( One , EM_RoleValue_PID ,0 )
		CancelBuff(One,508191)
		Delobj(Two)
		Delobj(OwnerID())
		
	end
	
	if 	quest=="out"	then
		WriteRoleValue( One , EM_RoleValue_PID ,0 )
		CancelBuff(One,508191)
		Delobj(Two)
		Delobj(OwnerID())
	end
	
	
	if 	goal=="arrive"		and
		(CheckAcceptQuest(One,423785)== true )		and
		(CheckCompleteQuest(One,423785)==false)		then
				local 	Num=ReadRoleValue(One , EM_RoleValue_Register+1)
				WriteRoleValue( One , EM_RoleValue_Register+1 ,Num+1 )
			local mission="fail"
			While 1 do
						if 		(CheckAcceptQuest(One,423785)== true )		and
								(CheckCompleteQuest(One,423785)==false)		and
								Checkflag(One,544734) ==true				then
								mission="success"

						break
						end
						
						if 	(CheckAcceptQuest(One,423785)== false )		or
							(CheckCompleteQuest(One,423785)==true)		then
							mission="out"
						break
						end
				Sleep(10)
			end
			
			if 	mission=="out"		then
				WriteRoleValue( One , EM_RoleValue_PID ,0 )
				WriteRoleValue( One , EM_RoleValue_Register+1 ,0 )
				CancelBuff(One,508191)
				CancelBuff(One,508192)
				Delobj(Two)		
				Delobj(OwnerID())
			end
			if 	mission=="success"	then	
	
				WriteRoleValue( One , EM_RoleValue_PID ,0 )
				WriteRoleValue( One , EM_RoleValue_Register+1 ,0 )
				CancelBuff(One,508191)
				CancelBuff(One,508192)
				Delobj(Two)		
				Delobj(OwnerID())
			else
				ScriptMessage( One, One, 0,"[SC_423785_2]", 0 )
				ScriptMessage( One, One, 2,"[SC_423785_2]", 0 )
				--你的隊員跟丟了，任務失敗，請放棄此任務再重新接取！
			end
			
	
	end
end

function LuaZ13WS_423785_CheckBuff_0()
--給有任務，但沒有完成旗標的玩家一個buff(508192)
	SetPlot( OwnerID(),"Range","LuaZ13WS_423785_CheckBuff_1",30 )
end

function LuaZ13WS_423785_CheckBuff_1()
--	say(OwnerID(),"0_0")
--	say(TargetID(),"TMT")
	while 1 do
		
		if	(CheckAcceptQuest(OwnerID(),423785)== true )		and
			(CheckCompleteQuest(OwnerID(),423785)==false)		and
			Checkflag(OwnerID(),544734) ==false					then 
				AddBuff(OwnerID(),508192,1,30)	
		else
			CancelBuff(OwnerID(),508192)
		end
		
		if 	(CheckAcceptQuest(OwnerID(),423785)== true )		and
			(CheckCompleteQuest(OwnerID(),423785)==false)		and
			CheckBuff( OwnerID() ,508192) ==true					and
			ReadRoleValue(OwnerID() , EM_RoleValue_Register+1)==4	then
				SetFlag(OwnerID(),544734,1)
				break
		end
		
		if 	GetDistance(OwnerID(),TargetID()) >30	then
		--因為迴圈一打開就不會停止(觸發範圍僅for一開始觸發的值，並不是離開此範圍，該迴圈就會停止，所以要自設停止機制)
			CancelBuff(OwnerID(),508192)
			break
		end
	sleep(30)
	CancelBuff(OwnerID(),508192)
	end
end

--======================================================================================================
---423783  領取武器
--======================================================================================================

--(1)布製裝備布袋
function LuaZ13WS_423783_A0()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423783_A1",0)
end

function LuaZ13WS_423783_A1()
	if	CountBodyItem(TargetID(),209015)>0 	then
		GiveBodyItem( TargetID() , 228117 , 1 )
		GiveBodyItem( TargetID() , 228118 , 1 )
		GiveBodyItem( TargetID() , 228119 , 1 )
		GiveBodyItem( TargetID() , 228120 , 1 )
		GiveBodyItem( TargetID() , 228121 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423783_0]" , 0 )	
		--穿上你選擇的裝備。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209015,1)
	end
end


--(2)皮製裝備布袋
function LuaZ13WS_423783_B0()		
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423783_B1",0)
end

function LuaZ13WS_423783_B1()
	if	CountBodyItem(TargetID(),209024)>0 	then
		GiveBodyItem( TargetID() , 228122 , 1 )
		GiveBodyItem( TargetID() , 228123 , 1 )
		GiveBodyItem( TargetID() , 228124 , 1 )
		GiveBodyItem( TargetID() , 228125 , 1 )
		GiveBodyItem( TargetID() , 228126 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423783_0]" , 0 )	
		--穿上你選擇的裝備。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209024,1)
	end
end


--(3)鎖甲製裝備木箱
function LuaZ13WS_423783_C0()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423783_C1",0)
end

function LuaZ13WS_423783_C1()
	if	(CountBodyItem(TargetID(),209025))>0 then
		GiveBodyItem( TargetID() , 228127 , 1 )
		GiveBodyItem( TargetID() , 228128 , 1 )
		GiveBodyItem( TargetID() , 228129 , 1 )
		GiveBodyItem( TargetID() , 228130 , 1 )
		GiveBodyItem( TargetID() , 228131 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423783_0]" , 0 )	
		--穿上你選擇的裝備。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209025,1)
	end
end


--(4)鎧甲製裝備木箱
function LuaZ13WS_423783_D0()	
--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423783_D1",0)
end

function LuaZ13WS_423783_D1()
	if	(CountBodyItem(TargetID(),209026))>0 then
		GiveBodyItem( TargetID() , 228133 , 1 )
		GiveBodyItem( TargetID() , 228134 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423783_0]" , 0 )	
		--穿上你選擇的裝備。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209026,1)
	end
end


--(5)武器木箱
function LuaZ13WS_423783_E0()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423783_E1",0)
end

function LuaZ13WS_423783_E1()
	if	(CountBodyItem(TargetID(),209027))>0 then
		GiveBodyItem( TargetID() , 213118 , 1 )
		GiveBodyItem( TargetID() , 213119 , 1 )
		GiveBodyItem( TargetID() , 213120 , 1 )
		GiveBodyItem( TargetID() , 213121 , 1 )
		GiveBodyItem( TargetID() , 213122 , 1 )
		GiveBodyItem( TargetID() , 228522 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423783_1]" , 0 )	
		--穿上你選擇的裝備。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209027,1)
	end
end


--======================================================================================================
--423788葯水
--======================================================================================================


function LuaZ13WS_423788_0()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423788_1",0)
end

function LuaZ13WS_423788_1()
		GiveBodyItem( TargetID() , 200151 , 5 )
		GiveBodyItem( TargetID() , 200152 , 5 )
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209016,1)
end



--======================================================================================================
--各式石碑介面
--======================================================================================================

--+++++各組織簡介+++++--
function LuaZ13WS_423790_209020_0()
	Beginplot(TargetID(),"LuaZ13WS_423790_209020_1",0)
end

function LuaZ13WS_423790_209020_1()
	ClearBorder( TargetID() )		
	AddBorderPage( TargetID(), "[SC_423790_0]" )
	--
	ShowBorder( TargetID(), 0, "[209020]", "ScriptBorder_Texture_Paper" )
end

--海盜傳單
function LuaZ13WS_209028()
	Beginplot(TargetID(),"LuaZ13WS_209028_1",0)
end

function LuaZ13WS_209028_1()
	ClearBorder( TargetID() )
	local N=RandRange( 1 , 3)
	AddBorderPage( TargetID(), "[SC_209028_"..N.."]" )
	--
	ShowBorder( TargetID(), 0, "[209028]", "ScriptBorder_Texture_Paper" )
	DelBodyItem(TargetID(),209028,1)
end


--======================================================================================================
--木頭人初始buff
--======================================================================================================

function LuaZ13WS_105243_Dead()
	Addbuff(OwnerID(),507646,1,30)
	CallPlot( OwnerID(), "DW_StopRecovery", OwnerID() )
--	while 1 do
		addbuff(OwnerID(),507646,1,20000)
--		sleep(20)
--	end
end















