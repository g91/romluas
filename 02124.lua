--=====調查四周=====
function LuaS_423698_1()
	setplot(OwnerID(),"range","LuaS_423698_2",200)
end

function LuaS_423698_2()
	if checkAcceptQuest(OwnerID(),423698) == true	and  CheckFlag(OwnerID(),544623) == FALSE  then
		givebodyitem(OwnerID(),544623,1)
		Scriptmessage(OwnerID(),OwnerID(),0,"[SC_423698_1]",0)
		Scriptmessage(OwnerID(),OwnerID(),1,"[SC_423698_1]",0)	-----裡面似乎有什麼東西在運轉的聲音...
	end

end

--=====探查洞穴=====
--===辨別裝置===
function LuaS_423700_2()
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	while	1 	do
	Sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID) == 0 	and
		HateListCount(OwnerID()) == 0	then
		CastSpell(OwnerID(),OwnerID(),496442)
		end
	end
end

function LuaS_423700_4()
	if	CountBodyItem(TargetID(),208449) == 0 	then
		SetAttack(OwnerID(),TargetID())
	end
end
--===接收裝置===
function LuaS_423700()
	local Scourge = LuaFunc_SearchNPCbyOrgID(OwnerID(),104294,800,0)
		if	Scourge == -1	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_2]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_2]",0)	----你並未發現到任何事物，請耐心等待。
			return
		end	
	 	if	GetDistance(OwnerID(),Scourge)>300		then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_3]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_3]",0)	----你離的太遠，接收不到到任何訊息。
			return
		end
		if	CheckAcceptQuest(OwnerID(),423700) == false	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_4]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_4]",0)	----你並沒有承接任務，請回去找[116152]重新接任務。
			return
		end	
		if	ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y) > 50 	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_3]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_3]",0)	----你離的太遠，接收不到到任何訊息。
			return
		end
		debugmsg(0,0,ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y).."  "..ReadRoleValue(Scourge,EM_RoleValue_isDead).."  "..countbodyitem(OwnerID(),208450)) ----檢查用 
		if	ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y) < 50 	and 
			ReadRoleValue(Scourge,EM_RoleValue_isDead) == 0 	and
			checkAcceptQuest(OwnerID(),423700) == TRUE	then
			Givebodyitem(OwnerID(),208451,1)
			UseItemDestroy(OwnerID()) 
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_1]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_1]",0)	----接收器已記錄到訊息，請盡快將物品帶回去?[116152]。
		end
	
end
