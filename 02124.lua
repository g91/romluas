--=====�լd�|�P=====
function LuaS_423698_1()
	setplot(OwnerID(),"range","LuaS_423698_2",200)
end

function LuaS_423698_2()
	if checkAcceptQuest(OwnerID(),423698) == true	and  CheckFlag(OwnerID(),544623) == FALSE  then
		givebodyitem(OwnerID(),544623,1)
		Scriptmessage(OwnerID(),OwnerID(),0,"[SC_423698_1]",0)
		Scriptmessage(OwnerID(),OwnerID(),1,"[SC_423698_1]",0)	-----�̭����G������F��b�B�઺�n��...
	end

end

--=====���d�}��=====
--===��O�˸m===
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
--===�����˸m===
function LuaS_423700()
	local Scourge = LuaFunc_SearchNPCbyOrgID(OwnerID(),104294,800,0)
		if	Scourge == -1	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_2]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_2]",0)	----�A�å��o�{�����ƪ��A�Э@�ߵ��ݡC
			return
		end	
	 	if	GetDistance(OwnerID(),Scourge)>300		then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_3]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_3]",0)	----�A�����ӻ��A������������T���C
			return
		end
		if	CheckAcceptQuest(OwnerID(),423700) == false	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_4]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_4]",0)	----�A�èS���ӱ����ȡA�Ц^�h��[116152]���s�����ȡC
			return
		end	
		if	ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y) > 50 	then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_3]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_3]",0)	----�A�����ӻ��A������������T���C
			return
		end
		debugmsg(0,0,ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y).."  "..ReadRoleValue(Scourge,EM_RoleValue_isDead).."  "..countbodyitem(OwnerID(),208450)) ----�ˬd�� 
		if	ReadRoleValue (OwnerID(), EM_RoleValue_Y) - ReadRoleValue (Scourge,EM_RoleValue_Y) < 50 	and 
			ReadRoleValue(Scourge,EM_RoleValue_isDead) == 0 	and
			checkAcceptQuest(OwnerID(),423700) == TRUE	then
			Givebodyitem(OwnerID(),208451,1)
			UseItemDestroy(OwnerID()) 
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423700_1]",0)
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423700_1]",0)	----�������w�O����T���A�кɧֱN���~�a�^�h?[116152]�C
		end
	
end
