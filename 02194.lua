------------------------------------�H�U�������Y���󪺦�����
function PJ_Close_the_HP()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP , true )
end
------------------------------------�H�U������[�P��ͻ���]
function Will_talktodoctor01()
	DW_QietKillOne(0,105541)
end

------------------------------------�H�U�����o[�P��ͻ���]
function Will_talktodoctor02()
		LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424136)==TRUE	then
		SetFlag(OwnerID(),544915,1)
	End
end
------------------------------------�H�U�����o[�M��ͺA��s�����U���νu��]
function Will_search()
	if	CountBodyItem(OwnerID(),209379)==0 then
		GiveBodyItem(OwnerID(),209379,1)
		SetFlag(OwnerID(),544916,1)
	else	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424137_1]",0)
	End
	return 1
End
------------------------------------�H�U�����}�Z���D�}�J���[��O
function Will_readletter()
		ClearBorder(OwnerID())		
		AddBorderPage(OwnerID(),"[SC_424138_2]")
		ShowBorder(OwnerID(),0,"[SC_424138_1]","ScriptBorder_Texture_Paper")
end
------------------------------------�H�U�����o[�M��u�Z���D�}�J�v���U���ûP�L���]
function Will_talktoBani()
		LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424138)==TRUE	then
		SetFlag(OwnerID(),544935,1)
	End
end
------------------------------------�H�U�����X��
function Will_giveflag()
	setflag(TargetID(),544958,1)
end
------------------------------------�H�U���R���X��
function Will_delflag()
	setflag(TargetID(),544958,0)
end
------------------------------------�H�U�����������@�Y���]�O��
function Will_give209410()
	GiveBodyItem(TargetID(),209410,1)
end
------------------------------------�H�U�������Z�n���S��
function Will_FX()
	Addbuff (  OwnerID() , 509417 , 0 , -1 )
	Addbuff (  OwnerID() , 509422 , 0 , -1 )
end
------------------------------------�H�U�������L�Ĭޫ�A�_��L�Ĭ�
function Will_CancelBuff()
	CancelBuff_NoEvent( TargetID(), 509422 ) 
	local ObjID = Lua_DW_CreateObj( "obj" , 105574 , TargetID() )
	PJ_NOUseAdjModEx(ObjID)
	Callplot(ObjID,"Will_Countdown",ObjID,TargetID(),OwnerID())
	return true
end

------------------------------------�H�U���_��L�Ĭު��p�ɾ�
function Will_Countdown(ObjID,Target,Owner)
		for i=1,45 do
			Sleep(20)
			local state =ReadRoleValue(Target,EM_RoleValue_IsDead)
			if state==1 then
				Sleep(20)
				setflag(Owner,544971,1)
				DelObj(ObjID)
				return
			else
				--nothing
			end
		end
	AddBuff(Target,509422,0,-1)
	DelObj(ObjID)
	return
end
------------------------------------�H�U���ˬd�ϥΪ��~���v��
function Will_Useitem()
	local x=ReadRoleValue(TargetID(),EM_RoleValue_OrgID)

	if x==117684	then
		return true
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424142_1]",0)
		return false
	end
end 
------------------------------------�H�U�������T�{����424142�X��
function Will_Finish424142()
	setflag(TargetID(),544969,1)
end
------------------------------------�H�U���A�������X��544971
function Will_GiveFlag544971()
	setflag(TargetID(),544971,1)
end
------------------------------------�H�U��424144���o���~
function Will_search_2()	
	if	CountBodyItem(OwnerID(),209539)==0 then
		GiveBodyItem(OwnerID(),209539,1)
		return 1
	End

	if	CountBodyItem(OwnerID(),209540)==0 then
		GiveBodyItem(OwnerID(),209540,1)
		return 1
	End

	if	CountBodyItem(OwnerID(),209541)==0 then
		GiveBodyItem(OwnerID(),209541,1)
		return 1
	End

	if	CountBodyItem(OwnerID(),209542)==0 then
		GiveBodyItem(OwnerID(),209542,1)
		return 1
	else	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424144_1]",0)
	End
	return 1
End
------------------------------------�H�U�����X��545005
function Will_giveflag545005()
	setflag(TargetID(),545005,1)
end
------------------------------------�H�U�����X��545006
function Will_giveflag545006()
	Setflag(TargetID(),545006,1)
end
------------------------------------�H�U�����X��545007
function Will_giveflag545007()
	setflag(TargetID(),545007,1)
end
------------------------------------�H�U�������M����̪��J�d
function Will_CleanMud01()
	DW_QietKillOne(0,105630)
	Return 1
end
------------------------------------�H�U�����P���󨭤W���S��˶�
function Will_giveflag545012()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),545012,1)
End
------------------------------------�H�U���W�[��ܿﶵ�ð��浹�P���󨭤W���S��˶�
function Will_AddSpeakOption_424249_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424149)==TRUE	then
		AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424149_01"), "Will_giveflag545012", 0 );
		End
End
------------------------------------�H�U�����P�ثe�@�ԫe�誺���p
function Will_giveflag545018()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),545018,1)
End
------------------------------------�H�U���W�[��ܿﶵ�ð��浹�P�ثe�@�ԫe�誺���p
function Will_AddSpeakOption_424249_02()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424149)==TRUE	then
		AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424149_01"), "Will_giveflag545018", 0 );
		End
End
------------------------------------�H�U�����P�P�w���Ȧ���������
function Will_giveflag545019()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),545019,1)
End
------------------------------------�H�U���W�[��ܿﶵ�ð��浹�P�P�w���Ȧ���������
function Will_AddSpeakOption_424249_03()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424149)==TRUE	then
		AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424149_01"), "Will_giveflag545019", 0 );
		End
End
------------------------------------�H�U�����X��545020
function Will_GiveFlag545020()
	local Player=SearchRangePlayer( OwnerID() , 80) 
	local num=table.getn(Player)
	for i=0,num,1 do
		if CheckAcceptQuest(Player[i],424147)==true then
			if Checkflag(Player[i],545020)==false then
				ScriptMessage(Player[i],Player[i],1,"[SC_424147_1]",c_yellow)	
				Setflag(Player[i],545020,1)
			else
				return
			end
		else
			return 
		end
	End
End
------------------------------------�H�U��Ĳ�oWill_GiveFlag545020()���d��@��
function Will_Range545020()
	SetPlot( OwnerID(),"range","Will_GiveFlag545020",80 ) 
End
------------------------------------�H�U�����209410���117680�A������
Function LuaS_117680_GiveItem()
	--Say( OwnerID(),"000" )
	--Say( TargetID(),"111" )
		if CountBodyItem(TargetID(),209410)==0 then
				GiveBodyItem( TargetID(),209410, 1 )
		End
End
-----�R���i�ê��I�]�ɨçR���M�䦳���ͺA��s���u�Z���v���u��
Function Del544916()
	DelBodyItem( OwnerID(), 544916, 1 )
End
------------------------------------------------------------------------
function William_424144_1()
	--Say( OwnerID(),"000" )
	--Say( TargetID(),"111" )
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424141)==TRUE	then
		if	CountBodyItem(OwnerID(),209409)==0 then
			SetQuestState( OwnerID(), 424144, 1 ) 
		end											
	end
end