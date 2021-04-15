function lua_skillcraft_kors_00()--���ʥD��NPC��ܼ@��
	DW_CancelTypeBuff( 68,  OwnerID() )-- �����M�����A
	local key1 = CheckFlag(OwnerID(),545251)--���ȥ��ӱ�
	local key2 = CheckFlag(OwnerID(),545252)--���ȧ���
	local questBuff ={620377,620378,620379,620380,620381,620382,620383} --�����ȥؼ�BUFF
	local Status = 0	-- �D��

	for i = 1 , #questBuff , 1 do
		if CheckBuff( OwnerID() , questBuff[i] ) == true then
			Status = 1
			break
		end
	end

	if Status == 1 then	-- ���a�s�b���@�D�خ�
		if key1 == TRUE and key2 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_06]")
			if CheckFlag(OwnerID(),545253) == TRUE then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_07]","lua_skillcraft_kors_aw",0)
			end
		end
	else  -- �S����buff 
		if key2 == FALSE then  -- ��ѥ�����
			SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_01]","lua_skillcraft_kors_01",0)
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_02]","lua_skillcraft_kors_bg",0)
		elseif key2 == TRUE then  -- ��Ѥw����
			SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_08]")
		--	AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_02]","lua_skillcraft_kors_bg",0)
		end
	end

end	

function lua_skillcraft_kors_bg()--�����`�I��������
	SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_skillcraft_kors_00",0)--�^�D��
end

function lua_skillcraft_kors_01()--��������
	SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_03]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_04]","lua_skillcraft_kors_Q",0) --���ʶ}�l���P��ITEM
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_skillcraft_kors_00",0)--�^�D��
end

function lua_skillcraft_kors_Q()--itemgive&quest
local questBuff ={620377,620378,620379,620380,620381,620382,620383} --�����ȥؼ�BUFF
local Qit = Rand(6)+1
local quest = {240396,240397,240398,240399,240400,240401,240402}--���ȥؼ�
local item = {240403,240404,240405,240406,240407,240408,240409,240428,240429,240430} --��ITEM
local Git = Rand(9)+1
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_09][$SETVAR1=["..quest[Qit].."]]")
		GiveBodyItem(OwnerID(),item[Git],1)
		AddBuff(OwnerID(),questBuff[Qit],1,-1)
--		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SKILLCRAFT_KORS_09][$SETVAR1=["..quest[Qit].."]]",C_SYSTEM)
		SetFlag(OwnerID(),545251,1)
	else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_skillcraft_kors_01",0)
	end
end

function lua_skillcraft_kors_aw()--���y�I������
local questBuff ={620377,620378,620379,620380,620381,620382,620383}
local quest = {240396,240397,240398,240399,240400,240401,240402}
if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
	for i =1,7 do
		if CheckBuff(OwnerID(),questBuff[i]) == TRUE then
			if CountBodyItem(OwnerID(),quest[i]) ~= 0 then			
				SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_10]")
				AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_19]","lua_skillcraft_kors_give",0)
			elseif CountBodyItem(OwnerID(),quest[i]) == 0 then
				SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_06]")
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_skillcraft_kors_00",0)
			end
		end
	end
else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_skillcraft_kors_00",0)
end
end


function lua_skillcraft_kors_give()--���y����
local quest  = {620377,620378,620379,620380,620381,620382,620383}
local item = {240396,240397,240398,240399,240400,240401,240402}
	SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_08]")
	GiveBodyItem(OwnerID(),240060,2)
		for i = 1 , 7  do
			if CheckBuff(OwnerID(),quest[i]) == TRUE then
				DelBodyItem(OwnerID(),item[i],1)
				CancelBuff_NoEvent( OwnerID(), quest[i] ) 
			end
		end
	SetFlag(OwnerID(),545252,1)
end

function lua_skillcraft_kors_giveUP()--�������
local quest  = {620377,620378,620379,620380,620381,620382,620383}
local item = {240403,240404,240405,240406,240407,240408,240409,240428,240429,240430}
	for i = 1,10 do
		for s = 1,7 do
			if CheckBuff(OwnerID(),quest[s]) == TRUE then
			CancelBuff(OwnerID(),quest[s])
			end
		end
		DelBodyItem(OwnerID(),item[i],1)
	end
	GiveBodyItem(OwnerID(),240060,1)
	SetFlag(OwnerID(),545252,1)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_SKILLCRAFT_KORS_14]",C_SYSTEM)
end

function lua_skillcraft_kors_N()--����NPC��ܼ@��
if CheckFlag(OwnerID(),545251) == TRUE and CheckFlag(OwnerID(),545252) == FALSE then
	local ch = ReadRoleValue(TargetID(),EM_RoleValue_PID)
		if ch == 0  then
		local item = {240403,240404,240405,240406,240407,240408,240409,240428,240429,240430}
		local quest = {240396,240397,240398,240399,240400,240401,240402}
		local  KI=ReadRoleValue(TargetID(),EM_RoleValue_Register1)
		local  BI=ReadRoleValue(TargetID(),EM_RoleValue_Register2)
			SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_11][$SETVAR1=["..quest[KI].."]][$SETVAR2=["..item[BI].."]]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_SKILLCRAFT_KORS_13]","lua_skillcraft_kors_NPCch",0)
		elseif ch ~=0 then
			SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_12]")
		end
else
	SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_15]")
end
end

function lua_skillcraft_kors_Ncrt()--�o��
	local KEY = Rand(6)+1
	local BASE = Rand(9)+1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,KEY)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,BASE)
	BeginPlot(OwnerID(),"lua_skillcraft_kors_Nfor",0)
end

function lua_skillcraft_kors_Nfor()
	while TRUE do
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
		BeginPlot(OwnerID(),"lua_skillcraft_kors_Nchange",0)
		local  T =Rand(30)+30
		local time = t * 100
		Sleep(time)
	end
end

function lua_skillcraft_kors_Ncnt()--�ˬd�I������(�o��)
	local  KI=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local  BI=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local time =ReadRoleValue(OwnerID(),EM_RoleValue_Register3)	
	local t = time+1
		WriteRoleValue(TargetID(),EM_RoleValue_Register3,t)
		if time > 10 then
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
		BeginPlot(OwnerID(),"lua_skillcraft_kors_Nchange",0)
		Sleep(1200)
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
		end
end

function lua_skillcraft_kors_Nchange()--�ק�I���Ψ禡
	local KEY = Rand(6)+1
	local BASE = Rand(9)+1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,KEY)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,BASE)	
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

function lua_skillcraft_kors_NPCch() --����NPC�I����
local times = ReadRoleValue(TargetID(),EM_RoleValue_Register3)
local item = {240403,240404,240405,240406,240407,240408,240409,240428,240429,240430}
local quest = {240396,240397,240398,240399,240400,240401,240402}
local  KI=ReadRoleValue(TargetID(),EM_RoleValue_Register1)
local  BI=ReadRoleValue(TargetID(),EM_RoleValue_Register2)
	if  CountBodyItem(OwnerID(),item[BI])~= 0  then --�I�����\
		SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_16][$SETVAR1=["..quest[KI].."]]")
		GiveBodyItem(OwnerID(),quest[KI],1)
		DelBodyItem(OwnerID(),item[BI],1)
		SetFlag(OwnerID(),545253,1)
	elseif   CountBodyItem(OwnerID(),item[BI]) == 0 then --�I�������\
		SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_17][$SETVAR1=["..item[BI].."]]")
	elseif  ReadRoleValue(TargetID(),EM_RoleValue_PID) ~= 0 then -- �ѪF�贫
		SetSpeakDetail(OwnerID(),"[SC_SKILLCRAFT_KORS_18]")
	end
end


function lua_skillcraft_kors_RE()--���ե�RE���O
local quest  = {620377,620378,620379,620380,620381,620382,620383}
local item = {240403,240404,240405,240406,240407,240408,240409,240428,240429,240430}
	for i = 1,10 do
		for s = 1,7 do
			if CheckBuff(OwnerID(),quest[s]) == TRUE then
			CancelBuff_NoEvent(OwnerID(),quest[s])
			end
		end
		DelBodyItem(OwnerID(),item[i],1)
	end
SetFlag(OwnerID(),545251,0)
SetFlag(OwnerID(),545252,0)
SetFlag(OwnerID(),545253,0)
end