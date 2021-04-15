--�㺮�f���O��(424425 ) / �չ稦�M�� (424637) (424563)

function Lua_na_119231()
	LoadQuestOption( OwnerID() ) --���J���ȼҪO
	if CheckQuest( OwnerID() , 424425 , 0 ) == true then
		AddSpeakOption( OwnerID() , TargetID(), "[SC_119231_OPTION]" , "Lua_na_119231_1", 0 ) --�������D���n�M�n�ڨӫO�@���f�B�e
	end
end

function Lua_na_119231_1()
	SetSpeakDetail( OwnerID(), "[SC_119231_SPEAK]" )
end



--424632�x������ / 424633�����˸m
function LuaI_240632_1() --�ˬd�d��NPC
	local X = SearchRangeNPC( OwnerID(), 30)
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 0 then --�D�԰����A
		for i = 0 , table.getn(X) do
			if ReadRoleValue( X[i] ,EM_RoleValue_OrgID) == 119243 then
				AddBuff( OwnerID(), 620879 ,0 ,4);
				return true
			end
			if	i==(table.getn(X))	then
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_240632_0]", 0)  --�|����F���w��m
				return false
			end
		end
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_0]",0 ) --�����~�԰�������ϥΡC
		return false
	end
end


function LuaI_240632_2() --�b��ť�˸m�d��
	local Obj = OwnerID();
	local X = SearchRangeNPC( OwnerID(), 30)
	for i = 0 , table.getn(X) do
		if ReadRoleValue( X[i] ,EM_RoleValue_OrgID) == 119243 then
			CallPlot(X[i],"LuaFunc_ResetObj",X[i]); 
			break
		end
	end
	CancelBuff_NoEvent(Obj,620879);
	DW_QietKillOne(Obj,106121);
end

function LuaI_240632_3(QuestID)
	local Obj = OwnerID();
	local Tar = TargetID();
	SetQuestState(Tar,QuestID,0);
	DisableQuest(Obj,false);
	if	QuestID==424645	then
		Lua_ZonePE_3th_GetScore(200);
	end
	return true;
end


--���� 424634 �t���D�� / 424635 ��h�t���D��
function LuaI_240630() --�s�A��𥧦ת��G�a�@��
	local Obj = OwnerID()
	if 	CheckAcceptQuest(Obj,424634)	or
		CheckAcceptQuest(Obj,424635)	or
		CheckAcceptQuest(Obj,424646)	then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_240630_0]", 0 )
	end
end 