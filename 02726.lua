function LuaQ_240798_GetItem() --���@�Ť��
	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_GETQUESTITEM][$SETVAR1=".."[".."240798".."]".."]",0)
end

function LuaQ_240798_UseCheck()
	local Target = TargetID()
	local Player = OwnerID()
	local TOrgid = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local Fighter={106776,106777,106778,106779,106780,106781};
	if CheckDistance(Target,Player, 50)==false then
		ScriptMessage( Player, Player, 1, "[SC_425109_A]", 0 );--ĵ�i�T���G�A�ݭn�A�a��@�I�I
		return false
	end
	if (CheckAcceptQuest(Player,424028)==true and TOrgid==106677  and CheckFlag(Player,546878)==false)  or
	   (CheckAcceptQuest(Player,424028)==true and TOrgid==106679  and CheckFlag(Player,546879)==false)  then
		return true
	elseif DW_CheckQuestAccept("or",Player,425312,425340,425326)==true  then
		for SN,OrgID in pairs(Fighter) do
			if OrgID==TOrgid then
				if CheckBuff(Target,622152)==false then--�Sbuff
					return true;
				else--�w��buff
					ScriptMessage( Player, Player, 1, "[SC_204592_1]", 0 );--ĵ�i�T���G�ؼФ����T
					return false;
				end
			end
		end--�ëD�p���Ԥh������@�H
		ScriptMessage( Player, Player, 1, "[SC_204592_1]", 0 );--ĵ�i�T���G�ؼФ����T
		return false;
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SYS_GAMEMSGEVENT_422]",0)
		return false
	end
end

function LuaQ_240798_Used()
	local Player = OwnerID()
	local Target = TargetID()
	local TOrgid = ReadRoleValue(Target,EM_RoleValue_OrgID)
	if TOrgid ==106677 then
		if CheckFlag(Player,546879)==true then
			local Assassin=Lua_CreateObjByDir( Target , 106722 , 100 , 0);
			AddToPartition(Assassin,0)
			CallPlot(Assassin,"LuaFunc_Obj_Suicide",200);
			SetAttack(Assassin,Target);
			ScriptMessage(Player,Player,1,"[SC_240798_A]",C_YELLOW);
			SetFlag(Player,546880,1)
		end
		SetFlag(Player,546878,1)
	elseif TOrgid ==106679 then
		if CheckFlag(Player,546878)==true then
			local Assassin=Lua_CreateObjByDir( Target , 106722 , 100 , 0);
			AddToPartition(Assassin,0)
			CallPlot(Assassin,"LuaFunc_Obj_Suicide",200);
			SetAttack(Assassin,Target);
			ScriptMessage(Player,Player,1,"[SC_240798_A]",C_YELLOW);
			SetFlag(Player,546880,1)
		end
		SetFlag(Player,546879,1)
	else
		AddBuff(Target,622152,0,-1);
		DW_QietKillOne(Player,101240);
		ScriptMessage( Player, Player, 1, "[SC_425312_A]", C_YELLOW );--���\�T��
		ScriptMessage( Player, Player, 0, "[SC_425312_A]", C_YELLOW );--���\�T��
	end
end

function Lua_Set_Z23_BOX_Mode(obj)
	obj = obj or OwnerID()
	SetModeEx( obj   ,EM_SetModeType_Show, false )--�Q�j�M
	SetModeEx( obj   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( obj   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( obj   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( obj   , EM_SetModeType_HideName, true )--�W��
end