function LuaQ_425068_Say()
	local OID = OwnerID()
	local TID = TargetID()
	LoadQuestOption(OID)
	if CheckAcceptQuest(OID,425068)== true and
	CheckFlag(OID,546146)==false then
		AddSpeakOption(OID,TID,"[SC_425068_0]","LuaQ_425068_Said_1",0)
	end
end

--SC_425068_0:�[�J�ȳ��_�I�̨�|�H
--SC_425068_1:���O�ȳ��_�I�̤��|�A�ӬO<CS>���p���y</CS>�A�u�n�A�੾�۪��^�m�A���O�q�A�A�Q�n���@����´���|���A�I

--SC_425068_2:���p���y......�H
--SC_425068_3:���p���y�H�^���O�L�P�ۤ񪺤O�q�A�̾ڥ������ܤ~�����@�ɨ��V���y�A�p�P�A�̤@�ˡA�A�̤]�O���H�O�q�����O�ܡH

--SC_425068_4:�کڵ��A�]�����ҰҴˤj�Ҫ��l���C
--SC_425068_5:�O�ܡH���]�S���Y�A�������ڥh���䪺�c�l���I�F��n�ܡH

function LuaQ_425068_Said_1()
	local OID = OwnerID()
	local TID = TargetID()
	SetSpeakDetail(OID,"[SC_425068_1]")
	AddSpeakOption(OID,TID,"[SC_425068_2]","LuaQ_425068_Said_3",0)
end

function LuaQ_425068_Said_2()
	local OID = OwnerID()
	local TID = TargetID()
	SetSpeakDetail(OID,"[SC_425068_5]")
	SetFlag(OID,546162,1)
end

function LuaQ_425068_Said_3()
	local OID = OwnerID()
	local TID = TargetID()
	SetSpeakDetail(OID,"[SC_425068_3]")
	AddSpeakOption(OID,TID,"[SC_425068_4]","LuaQ_425068_Said_2",0)
end

function LuaQ_425068_FINISH()
	local TID = TargetID()
	SetFlag(TID ,546163,1)
end

function LuaQ_425071_SAY()
	local OID = OwnerID()
	local TID = TargetID()
	local job = ReadRoleValue(OID , EM_RoleValue_VOC )	
	local DrawfRace =ReadRoleValue(OID,EM_RoleValue_RACE)
	local QNpc = {}
	QNpc[120240]=546148
	QNpc[120244]=546149
	QNpc[120245]=546150
	if CheckAcceptQuest(OID,425071)==true and CountBodyItem(OID,241045)>=1 then
		for num,key in pairs(QNpc) do
			if ReadRoleValue(TID,EM_RoleValue_OrgID)==num and
			   CheckFlag(OID,key)==false then
			   AddSpeakOption(OID,TID,"[SC_425071_GIVE]","LuaQ_425071_GAVE",0)
			end
		end

--	elseif ReadRoleValue(TID,EM_RoleValue_OrgID)==120245 and  CountBodyItem ( OID  , 241079 ) >= 1 and CountBodyItem ( OID  , 530876 ) ~= 1 then  --���a���W�����ª��������@
	elseif ReadRoleValue(TID,EM_RoleValue_OrgID)==120245 and  CheckCompleteQuest( OID  , 425022 ) == true and CountBodyItem ( OID  , 530876 ) ~= 1 then  --10/26�קאּ���a�u�n��������"�t����U"425022
	--	SetSpeakDetail( OID  , "[SC_120245_Q_1]" ) --���U�O�H���f�@��Ʊ��A�]�\�u�ݭn�u�f�p�~�N�i�H�A���L�A�Y�O���O�H�dı��ﵷ���񤧫�...
 		AddSpeakOption ( OID , OID  ,"[SC_120245_Q_2]" , "Lua_na_120245_YES" , 0) --�i�D[120245]������������Ʊ�
		AddSpeakOption( OID , OID  , "[SC_120245_Q_3]" , "Lua_na_120245_NO" , 0 ) --�A�J�ӷQ�Q�K
	end

	if ReadRoleValue(TID,EM_RoleValue_OrgID)==120245 then -- and DrawfRace ==2 and job==10 and CheckFlag(OID,546211)==false and CheckCompleteQuest(OID,425071)==true then
		AddSpeakOption(OID,OID,"[SC_546211_CHECK]","LuaS_546211_SETKEY",0)
	end
	LoadQuestOption(OID)
end

function  LuaS_546211_SETKEY()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_546211_CONTENT]")
	SetFlag(player,546211,1)
end

function LuaQ_425071_GAVE()
	local OID = OwnerID()
	local TID = TargetID()
	local QNpc = {}
	QNpc[120240]=546148
	QNpc[120244]=546149
	QNpc[120245]=546150
	for num,key in pairs(QNpc) do
		if ReadRoleValue(TID,EM_RoleValue_OrgID)==num then
		GiveBodyItem(OID,KEY,1)
		DelBodyItem(OID,241045,1)
		CloseSpeak(OID)
		end
	end
end

function LuaS_120690_Speak()
	local X = {}
	X[1]="[SC_423465_17]"
	X[2]="[SAY_110064_3]"
	Npcsay(OwnerID(),X[DW_RAND(2)])
end

function LuaS_120689_Speak()
	local X = {}
	X[1]="[SC_422077_0]"
	X[2]="[SC_101352_2]"
	Npcsay(OwnerID(),X[DW_RAND(2)])
end

function LuaS_120691_Speak()
	Npcsay(OwnerID(),"[SC_424468_FLYAWAY_02]")
end

function LuaS_120515_Speak()
	Npcsay(OwnerID(),"[SC_421335_3]")
end



function LuaS_120358_Speak()
	local player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425078)==true and CheckBuff(player,622274)==false then
		AddSpeakOption(player,Npc,"[SC_424604_RE_01]","LuaQ_425078_CARBUFF",0)
	end	
end




function Lua_DwarfOccupationInstructer()--�G�H�ޯ�ɮv��ܼ@��
	local Player,Instructer = OwnerID(),TargetID();
	local PlayerRace = ReadRoleValue(Player,EM_RoleValue_Race);
	if PlayerRace~=2 then
		SetSpeakDetail( Player,"[SC_DWARFINSTRUCTER_A]");--����
		return;
	end
	LoadQuestOption(Player);
	local OccupationList = {1,[3]=3,[4]=4,[5]=5,[9]=9,[10]=10};
	SetFlag(Player,540804,1);
	local InstructerPID = ReadRoleValue(Instructer,EM_RoleValue_PID);
	--¾�~��ƦC��--
	local VocArray = {
							[1]={[1]=EM_RoleValue_VOCLV_Warrior	,[2]="SO_GETWARRIOR_1"},
							[2]={[1]=EM_RoleValue_VOCLV_Ranger	,[2]="SO_GETRANGER_1"},
							[3]={[1]=EM_RoleValue_VOCLV_Rogue		,[2]="SO_GETROGUE_1"},
							[4]={[1]=EM_RoleValue_VOCLV_Wizard	,[2]="SO_GETMAGE_1"},
							[5]={[1]=EM_RoleValue_VOCLV_Priest		,[2]="SO_GETPRIEST_1"},
							[6]={[1]=EM_RoleValue_VOCLV_Knight		,[2]="SO_GETKNIGHT_1"},
							[7]={[1]=EM_RoleValue_VOCLV_RuneDancer	,[2]="SO_GETWARDEN_1"},
							[8]={[1]=EM_RoleValue_VOCLV_Druid		,[2]="SO_GETDRUID_1"},
							[9]={[1]=EM_RoleValue_VOCLV_HARPSYN		,[2]="SO_GETHARPSYN_1"},
							[10]={[1]=EM_RoleValue_VOCLV_PSYRON		,[2]="SO_GETPSYRON_1"},

																			}
	local VocNum = 0
	for i=1,#VocArray,1 do
		if	ReadRoleValue(Player,VocArray[i][1])~=0	then
			VocNum = VocNum +1
		end
	end
	
	--¾�~�W���P�_--
	local CheckVocNumPass = true				--¾�~�W���P�_
	if	ReadRoleValue( Player , EM_RoleValue_VocCount )<=VocNum	then
		CheckVocNumPass = false
	end
	if	CheckVocNumPass == false	then		--�p�G¾�~��W���h����
		return
	end
	
	--�w��¾�~�P�_--
	if	ReadRoleValue(Player,VocArray[InstructerPID][1])~=0	then	--�p�G�w�g����¾�~�h����
		return
	end


	if	ReadRoleValue(Player,EM_RoleValue_Lv)<10	then
		AddSpeakOption(Player,Instructer,"[SO_GETVOC_LVLIMIT]","LuaS_GetJob_EXIT", 0 )
		return
	end

	AddSpeakOption(Player,Instructer,"["..VocArray[InstructerPID][2].."]","Lua_DwarfOccupationLearned", 0 )
end

function Lua_DwarfOccupationLearned()
	local Player = OwnerID()
	local Instructer = TargetID()
	CloseSpeak(Player);
	local VocType = ReadRoleValue(Instructer,EM_RoleValue_PID)
	WriteRoleValue(Player,EM_RoleValue_VOC_SUB,VocType)		--����¾�~
	SetFlag(Player,540820,1)	--��¾�~���
	if CheckFlag( Player , 540190 ) == false then		--�ǰe�N
		SetFlag(Player,540190,1)
		ScriptMessage( Player , Player , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
	end
	if CheckFlag( Player , 540191 ) == false then		--�ǰe�N
		SetFlag(Player,540191,1)
		ScriptMessage( Player , Player , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
	end
end