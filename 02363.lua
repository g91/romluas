--LuaS_424086_  �����Ӱ�;�M�Լ@��

function LuaS_424086_TalkPlot()		--�~��������ܼ@��
	local Obj = OwnerID()
	if	(CheckCompleteQuest(Obj,424085)==true and CheckCompleteQuest(Obj,424086)==false)	then		
		if	CheckAcceptQuest(Obj,424086)==true	then
			if	CheckFlag(Obj,544901)==true	then
				LoadQuestOption(Obj)
			end
			if	ZONE14_PE04_Count>19	then
				SetSpeakDetail( Obj,"[SC_424086_2]")	--�A�٦b������H�{�b�N�O�ϥγ̦n���ɾ��A�֨ϥ�[209414]�I
			else
				SetSpeakDetail( Obj,"[SC_424086_1]")	--����E�F�k�}���o��A[209414]�O�L�k�o���@�Ϊ��A�֥h��[117735]�A�L�N�|���ާA�i��d�z����ʡA�ߨ�ʨ��a�I
			end
		else
			LoadQuestOption(Obj)
		end
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424086_ItemCheckBefoUse()	--���~�ϥΫe�ˬd
	local Obj = OwnerID()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( Obj , EM_RoleValue_ZoneID ) )
	if	Area ~=14	then										--���b14
		ScriptMessage( Obj, Obj, 1, "[SC_424086_7]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	if	DW_CheckDis(Obj,780755,1,70)==false	then				--���o�ӻ�
		ScriptMessage( Obj, Obj, 1, "[SC_424086_8]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	
	if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)~=0	then	--���b�I�k
		ScriptMessage( Obj, Obj, 1, "[SC_424086_9]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	if	CheckAcceptQuest(Obj,424086)==false	then				--�S������
		ScriptMessage( Obj, Obj, 1, "[SC_424086_10]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	
	if	CheckFlag(Obj,544979)==true	then						--�w�g�ιL
		ScriptMessage( Obj, Obj, 1, "[SC_424086_11]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	if	ZONE14_PE04_Count >7	then							--���\
		return true
	else														--����PE�����٨S�F��20��
		ScriptMessage( Obj, Obj, 1, "[SC_424086_1]", 0 )		--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
end


function LuaS_424086_ItesExecute()	--���~�ϥΫ�

	local Obj = OwnerID()
	AddBuff(Obj,508160,1,30)
	BeginPlot(Obj,"LuaS_424086_ShowPlot",0)
end

function LuaS_424086_ShowPlot()		--��t�@��

	local Obj = OwnerID()
	CastSpell(Obj,Obj,497569)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_12]", 0 )
	sleep(30)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_13]", 0 )
	sleep(25)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_14]", 0 )
	sleep(5)
	local BigSnake = DW_CreateObjEX("obj",117993,obj)
	local FireTarget = DW_CreateObjEX("flag",113568,780755,1)
	AdjustFaceDir(BigSnake,FireTarget,0)
	AddBuff(FireTarget,505455,1,-1)
	WriteRoleValue(BigSnake,EM_RoleValue_Register1,Obj)
	local HandleArray = {BigSnake,FireTarget}
	for a,b in pairs(HandleArray) do
		Lua_ObjDontTouch( b )
		CallPlot(b,"LuaS_424086_ProtectBreak",Obj)
	end
	sleep(20)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_15]", 0 )
	CastSpell(BigSnake,FireTarget,497563)
	sleep(15)
	CallPlot(BigSnake,"LuaS_424086_AutoFire",BigSnake,FireTarget)
end

function LuaS_424086_AutoFire(BigSnake,FireTarget)	--����I��S��
	while true do
		for i=0,2,1 do
			SysCastSpellLv(BigSnake,FireTarget,497564+i,1)
		end
		sleep(10)
	end
end

function LuaS_424086_SpellCheck()	--���w�ԽĥX�h���e
	local Obj = OwnerID()
	local Player = ReadRoleValue(Obj,EM_RoleValue_Register1)
	ScriptMessage( Player, Player, 2, "[SC_424086_16]", 0 )
	return true
end

function LuaS_424086_SpellExecute()	--���z�@��
	local Obj = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Target,Target,497568,0)
	WriteRoleValue(Target,EM_RoleValue_LiveTime,3)
	local Player = ReadRoleValue(Obj,EM_RoleValue_Register1)
	--544979  �j��}�ҳq�D
	--544901  ���ȧ�������
	SetFlag(Player,544979,1)
	SetFlag(Player,544901,1)
	BeginPlot(Player,"LuaS_424086_EndMessage",0)
	DelObj(Obj)
end


function LuaS_424086_ProtectBreak(Obj) --����a�_�u���M���@��
	while true	do
		if	Obj == nil	then
			DelObj(OwnerID())
		end
		if	CheckID(Obj)==false	then
			DelObj(OwnerID())
		end
		sleep(10)
	end
end

function LuaS_424086_EndMessage()	--�q�᪺�����T��
	local Obj = OwnerID()
	sleep(30)
	ScriptMessage( Obj, Obj, 2, "[SC_424086_6]", 0 )
	CancelBuff(Obj,508160)
end

--14PE02��ܼ@��

function LuaS_424207_TalkPlot_1()	--����
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424208)==true	then
		SetSpeakDetail( Obj,"[SC_424207_00]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424207_TalkPlot_2()	--���o
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424208)==true	then
		SetSpeakDetail( Obj,"[SC_424207_01]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424208_TalkPlot_1()	--�ǧJ��
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424207)==true	then
		SetSpeakDetail( Obj,"[SC_424207_02]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424208_TalkPlot_2()	--����
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424207)==true	then
		SetSpeakDetail( Obj,"[SC_424207_03]")
	else
		LoadQuestOption(Obj)
	end
end

--14PE02��l�@��
function LuaPE1402_DWInitial()
	local Obj = OwnerID()
	local OrgID_Obj = ReadRoleValue(Obj,EM_RoleValue_OrgID)

	local InitFuncTable = {
				--����������
				[117528] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
					end,
				--���h�h�ɪ��_�I��
				[117530] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
						WriteRoleValue(Obj,EM_RoleValue_HP,1)
						AddBuff(Obj,507532,1,-1)
						AddBuff(Obj,507514,1,-1)
						SetDefIdleMotion(Obj,ruFUSION_MIME_DEATH_LOOP)
						AddBuff(Obj,506823,0,-1)			--�Ĥ�
					end,
				--�򸨪�³��
				[117529] = 	function ()
						local Obj = OwnerID()
						SetModeEx(Obj,EM_SetModeType_HideName,true) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
					end,
				--�����˪��_�I��
				[117534] = 	function ()
						local Obj = OwnerID()
						local HP = ReadRoleValue(Obj,EM_RoleValue_MaxHP)
						SetModeEx(Obj,EM_SetModeType_HideName,false) 
						SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
						WriteRoleValue(Obj,EM_RoleValue_HP,0.4*HP)
						AddBuff(Obj,507532,1,-1)
						AddBuff(Obj,507514,1,-1)
						if	GetModeEx( obj , EM_SetModeType_NotShowHPMP ) == false	then
							SetDefIdleMotion(Obj,ruFUSION_MIME_SIT_LOOP)
						end
						while true do
							sleep(70)
							SysCastSpellLv(Obj,Obj,492667,0)	--�y��
						end
					end
					}
	InitFuncTable[OrgID_Obj]()
end