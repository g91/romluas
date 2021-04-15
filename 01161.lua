function Lua_System_Role_LV_UP()
	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local VocLv = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	local SubLv = voc_lv( SubVoc , OwnerID() )
	local Race = ReadRoleValue(OwnerID(),EM_RoleValue_RACE)
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID ) )

	if	VocLv==15 and SubLv>=15	then
		if	Race==2	then
			SendMailEx(GameObjInfo_Str(120515,"Name"),GetName(OwnerID()),"[SC_120515_C]","[SC_120515_D]",202949,2,0);
		end
	end
	if  	VocLv==60 and SubLv>=60 and --2012.08.29 角色雙職升至60時會收到菁英技能任務信件
		CheckFlag(OwnerID(),547008)==false then 
		SetFlag(OwnerID(),547008,1)
		SendMailEx( "[SO_110484_NEWER]" , GetName(OwnerID()) , "[LV60_ELITESKILLS_5]" , "[LV60_ELITESKILLS_6]" , 0, 1 ,0 ) 
	end

--	if	Area > 12	then
--		return
--	end
---------------------------------------------
--一般升級的提示
---------------------------------------------
	if	VocLv == 5	and SubVoc == -1 and
		ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) ~= 448 then	--祕法棋戰時不秀升級訊息
		if	Race == 0	then
			BeginPlot(OwnerID(),"LuaS_LVUP_5",0)
		end
	end

	if	VocLv == 10 and SubVoc == -1 and
		ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) ~= 448 then	--祕法棋戰時不秀升級訊息
		if	Race == 0		then
			BeginPlot(OwnerID(),"LuaS_LVUP_10",0)
		end
		if	Race == 1		then
			BeginPlot(OwnerID(),"LuaS_LVUP_10_1",0)
		end
		if	Race == 2		then
			BeginPlot(OwnerID(),"LuaS_LVUP_10_2",0)
		end
	end

	if	VocLv == 18	then
		if	SubVoc == -1	or
			SubLv < 18	then
			BeginPlot(OwnerID(),"LuaS_LVUP_18",0)
		end
	end

	if	VocLv == 28	then
		if	SubVoc == -1	or
			SubLv < 28	then
			BeginPlot(OwnerID(),"LuaS_LVUP_28",0)
		end
	end

	if	VocLv == 38	then
		if	SubVoc == -1	or
			SubLv < 38	then
			BeginPlot(OwnerID(),"LuaS_LVUP_38",0)
		end
	end


---------------------------------------------
--菁英技能學習提示
---------------------------------------------
	if VocLv == 15 and SubLv == 15 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_15" , 0 )
	end

	if (VocLv == 20 and SubLv == 20) and ( CheckFlag( OwnerID() , 545166 )==true ) then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_20" , 0 )
	end

	if VocLv == 25 and SubLv == 25 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_25" , 0 )
	end

	if VocLv == 30 and SubLv == 30 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_30" , 0 )
	end

	if VocLv == 35 and SubLv == 35 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_35" , 0 )
	end

	if VocLv == 40 and SubLv == 40 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_40" , 0 )
	end

	if VocLv == 45 and SubLv == 45 then
		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_45" , 0 )
	end

--	if VocLv == 50 and SubLv == 50 then
--		BeginPlot(OwnerID() , "LuaS_System_Role_DoubleLV_50" , 0 )
--	end
end
---------------------------------------------
--一般升級的提示 執行函式區
---------------------------------------------

function LuaS_LVUP_5()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL5]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL5]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL5]", "0xffffff00" );
	end
end

function LuaS_LVUP_10()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL10]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL10]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL10]", "0xffffff00" );
	end		
end

function LuaS_LVUP_10_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL10_1]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL10_1]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL10_1]", "0xffffff00" );
	end
end

-- 2012. 10. 30 (5.0.5)新增矮人升到10級提示訊息框
function LuaS_LVUP_10_2()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL10_2]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL10_2]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL10_2]", "0xffffff00" );
	end
end


function LuaS_LVUP_18()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL18]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL18]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL18]", "0xffffff00" );
	end		
end

function LuaS_LVUP_28()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL28]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL28]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL28]", "0xffffff00" );
	end		
end

function LuaS_LVUP_38()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[TUTORIAL_LEVEL38]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[TUTORIAL_LEVEL38]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[TUTORIAL_LEVEL38]", "0xffffff00" );
	end		
end

---------------------------------------------
--菁英技能學習提示 執行函式區
---------------------------------------------
function LuaS_System_Role_DoubleLV_15()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_15]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_15]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_15]", "0xffffff00" );
	end		
end

function LuaS_System_Role_DoubleLV_20()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_20]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_20]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_20]", "0xffffff00" );
	end		
end

function LuaS_System_Role_DoubleLV_25()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_25]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_25]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_25]", "0xffffff00" );
	end		
end

function LuaS_System_Role_DoubleLV_30()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_30]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_30]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_30]", "0xffffff00" );
	end		
end

function LuaS_System_Role_DoubleLV_35()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_35]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_35]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_35]", "0xffffff00" );
	end		
end

function LuaS_System_Role_DoubleLV_40()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_40]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_40]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_40]", "0xffffff00" );
	end
end

function LuaS_System_Role_DoubleLV_45()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_45]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_45]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_45]", "0xffffff00" );
	end
end

function LuaS_System_Role_DoubleLV_50()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_111454_18_50]" )
		DialogSelectStr( OwnerID() , "[SC_421660_1]" )			-- 確定！
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_111454_18_50]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_111454_18_50]", "0xffffff00" );
	end		
end