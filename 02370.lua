--���B���P�ȡA���
function LuaS_424325_PEN()
	AdjustFaceDir(TargetID(),OwnerID(),0);
	LoadQuestOption(OwnerID());
	if 	CheckAcceptQuest(OwnerID(),424325)==true then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_424325_1]" , "LuaS_424325_1",0 );
	end
	if 	CountBodyItem(OwnerID(),240255)>=1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_424325_3]" , "LuaS_424325_2",0 );
	end
end
function LuaS_424325_1()
	SetSpeakDetail(OwnerID(),"[SC_424325_2]");
		if CountBodyItem(OwnerID(),240253)==0 then
			GiveBodyItem(OwnerID(),240253,1);
			SetFlag(OwnerID(),545442,1);
		end
end
function LuaS_424325_2()
	CloseSpeak(OwnerID());
	DelBodyItem(OwnerID(),240255,1);
	GiveBodyItem(OwnerID(),240256,1);
	--NpcSay(�ѤU���u�@�N�浹�A�a�I�M�h)
end

--�f�O
function LuaS_424326_MSG_MS()
	local	num;
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
		if	CheckAcceptQuest(OwnerID(),424326)==true		and
			CheckFlag(OwnerID(),545162)==false			then
			num=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
				if	num==1	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_3",0);		--SC_424326_4
				elseif	num==2	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_4",0);
				elseif	num==3	then
					AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_4]","LuaS_424326_MSG_5",0);
				else
					return
				end
		end
		if	CheckAcceptQuest(OwnerID(),424331)==true and CheckFlag(OwnerID(),545165)==false and CountBodyItem(OwnerID(),240269)>=1   then
			AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_1]","Lua_424331_1",0);
		end
end
function LuaS_424326_MSG_3()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_6]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_0]","LuaS_424326_MSG_C",0);
end
function LuaS_424326_MSG_4()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_7]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_1]","LuaS_424326_MSG_C",0);
end
function LuaS_424326_MSG_5()
	SetSpeakDetail(OwnerID(),"[SC_424326_5]");	--CS_424326_5
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_8]","LuaS_424326_MSG_F",0);
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424326_2]","LuaS_424326_MSG_C",0);	
end
function LuaS_424326_MSG_C()
	CloseSpeak(OwnerID());
	SetFlag(OwnerID(),545162,1)
	Tell(OwnerID(),TargetID(),"[SC_424326_9]")
end
function LuaS_424326_MSG_F()
	CloseSpeak(OwnerID());
	NpcSay(TargetID(),"[SC_424326_10]")
end

--�ʧ@
function AGAC_CRY_C()
	while 1 do
		Sleep(20)
		PlayMotion(OwnerID(),105)
	end
end
--�j�����~
--2011/11/09�s�W�P�w-���}�ݦ����Z���~�l
function LuaI_AG424329_Pin1()
	local Player=OwnerID();
	local num=DW_rand(3);
	local num2=ReadRoleValue(Player,EM_RoleValue_Register1)
		if CheckAcceptQuest(Player,424329)==true then		--����424329���H
			if num2==2 then
				GiveBodyItem(Player,240264,1)		
			elseif num2==3 then
				GiveBodyItem(Player,240265,1)
			end
			GiveBodyItem(Player,240260+num,1)
			WriteRoleValue(Player,EM_RoleValue_Register1,num2+1)
		elseif CheckCompleteQuest(Player,424329)==true then	--����424329���H
			if CheckCompleteQuest(Player,424340)==true  then	--���O�٨S����424340���H�A���q�O���F���|���e���L�����a
				GiveBodyItem(Player,240260+num,1);
			elseif CountBodyItem(Player,240264)>=1 then
				GiveBodyItem(Player,240260+num,1);			
			else 
				GiveBodyItem(Player,240264,1);
			end
		else								--�٨S����424329���᪺�H
			GiveBodyItem(Player,240260+num,1);
		end
end
function LuaQ_AG424329_Init()
	WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
end
--�~���H
function LuaS_AG424340_0() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 424340, 1  ) );
	ShowBorder( OwnerID(), 424340, "[424340]", "ScriptBorder_Texture_Paper" );	

end
--�s��
function LuaS_AG118829_1()--Ĳ�I�@��
	SetPlot( OwnerID(),"touch","LuaS_AG118829_2",30 )
end

function LuaS_AG118829_2()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_118829_1]", 50, 131, 133, 0, "LuaS_AG118829_3" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end

function LuaS_AG118829_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240269,1)
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
		end
	end
end
--���D
function LuaI_AG424335_0()	
	local Obj = OwnerID()--���a
	local Target = TargetID()--�ϥι�H
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local x=ReadRoleValue(Target,EM_RoleValue_Register1)
	if	(TargetOrgID~=105672)	then		--�ؼФ��O
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--�ؼп��~
	elseif	CheckBuff(Target,509033)==true	then		
		ScriptMessage( Obj, Obj, 1, "[SC_424335_1]", 0 )	--�ؼФw�Q�ϥιL
	elseif	CheckDistance(Obj,Target, 50)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
	else
		return true
	end
	return false--�����z�|
end

function LuaI_AG424335_1()
	AddBuff(TargetID(),509033,1,20)
	--WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
		GiveBodyItem(OwnerID(),240031,1)
end
--���n���Y
function LuaS_118300_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545137 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118300_2",0)
	end
end
function LuaS_118300_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_3]")
	SetFlag(OwnerID(),545137,1)
	GiveBodyItem(OwnerID(),240269,1)
end
function LuaS_118301_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545138 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118301_2",0)
	end
end
function LuaS_118301_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_2]")
	SetFlag(OwnerID(),545138,1)
	GiveBodyItem(OwnerID(),240269,1)
end
function LuaS_118755_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424333)==true and CheckFlag( OwnerID(),545161 )==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_424333_1]","LuaS_118755_2",0)
	end
end
function LuaS_118755_2()
	SetSpeakDetail(OwnerID(),"[SC_424333_4]")
	SetFlag(OwnerID(),545161,1)
	GiveBodyItem(OwnerID(),240269,1)
end
--����
function Lua_424331_1()
	SetSpeakDetail(OwnerID(),"[SC_424331_2]")
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_3]","Lua_424331_2",0);
end
function Lua_424331_2()
	SetSpeakDetail(OwnerID(),"[SC_424331_4]")
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424331_5]","Lua_424331_3",0);
end
function Lua_424331_3()
	SetSpeakDetail(OwnerID(),"[SC_424331_6]")
	SetFlag(OwnerID(),545165,1)
end
--�X�o
function Lua_AG424332_1()
	SetSpeakDetail(OwnerID(),"[SC_424332_2]")
	SetFlag(OwnerID(),545164,1)
end

--�ۺq
function LuaS_424341_sing()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(OwnerID(),265)
	AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_13]","LuaS_424341_sing2",0);
end
function LuaS_424341_sing2()
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	if x==0 then
		SetSpeakDetail(OwnerID(),"[SC_424341_14]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	elseif x==1 then
		SetSpeakDetail(OwnerID(),"[SC_424341_15]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,2)
	else
		SetSpeakDetail(OwnerID(),"[SC_424341_16]")
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	end
end
--
function LuaS_424341_sing3()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424341)==true then
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_17]","LuaS_424341_sing4",0);
	end
end
function LuaS_424341_sing4()
		SetSpeakDetail(OwnerID(),"[SC_424341_18]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_1]","LuaS_424341_sing5",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_5]","LuaS_424341_sing7",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_9]","LuaS_424341_sing9",0);
end
function LuaS_424341_sing5()
		SetSpeakDetail(OwnerID(),"[SC_424341_2]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_3]","LuaS_424341_sing6",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_7]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing6()
		SetSpeakDetail(OwnerID(),"[SC_424341_4]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing7()
		SetSpeakDetail(OwnerID(),"[SC_424341_6]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_7]","LuaS_424341_sing8",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_11]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing8()
		SetSpeakDetail(OwnerID(),"[SC_424341_8]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing9()
		SetSpeakDetail(OwnerID(),"[SC_424341_10]")
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_11]","LuaS_424341_sing10",0);
		AddSpeakOption( OwnerID(), TargetID(),"[SC_424341_3]","LuaS_424341_sing_END",0);
end
function LuaS_424341_sing10()
		SetSpeakDetail(OwnerID(),"[SC_424341_12]")
		SetFlag(OwnerID(),545228,1)
end
function LuaS_424341_sing_END()
	CloseSpeak(OwnerID());
	NpcSay(TargetID(),"[SC_424341_19]");
end

function agusetest1()
	local x=SearchRangeNPC(OwnerID(),11800)
	local y=table.getn(x)
		for i=0,y do	
			if readrolevalue(x[i],EM_RoleValue_OrgID)==118337 then
				Say(OwnerID(),x[i])
				delobj(x[i])
			end
				Say(OwnerID(),"no")
		end

end

--2011/11/09����424329�s�W�G�I����return 1
function Lua_AG424329_Comp()
		return 1
end

--2011/11/09�]�ݨD�s�W��~�l�����I���ϥ�
function LuaI_AG424329_PinItem2()--Ĳ�I�@��
	SetPlot( OwnerID(),"touch","LuaI_AG424329_PinItem3",30 )
end

function LuaI_AG424329_PinItem3()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)	--�U��
	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_RUNRUNPUMPKIN_05]", 50, 131, 133, 0, "LuaI_AG424329_Touch2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end

function LuaI_AG424329_Touch2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem(O_ID,240260,1)		--�����ݦ����Z���~�l
			CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end

