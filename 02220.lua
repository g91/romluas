function  Lua_kors_gre2fes_00()--npc�@���_�Y
	DW_CancelTypeBuff( 68,  OwnerID() )
	if Lua_Mounts_Copilot( OwnerID() ) == TRUE then
		if CheckFlag(OwnerID(),545036) == FALSE and CountBodyItem(OwnerID(),209554) >= 0 then
			SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_00]")
				if CheckFlag(OwnerID(),545024) == FALSE and CheckFlag(OwnerID(),545025) == FALSE then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_01]","Lua_kors_gre2fes_01",0) --�s�@�Ĥ�����
				elseif CheckFlag(OwnerID(),545024) == TRUE and CheckFlag(OwnerID(),545025) == FALSE then		
					AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_06]","Lua_kors_gre2fes_03",0)	--�ڱa�F�s�]����Ħ^�ӤF
				end
				if CheckFlag(OwnerID(),545025) == TRUE then --��������
					AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_02]","Lua_kors_gre2fes_change",0) --���򪫸H��
				end
		elseif CheckFlag(OwnerID(),545036) == TRUE and CountBodyItem(OwnerID(),209554) ~= 0 then
				SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_00]")
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_02]","Lua_kors_gre2fes_change",0) 
		elseif  CheckFlag(OwnerID(),545036) == TRUE and CountBodyItem(OwnerID(),209554) == 0 then
					SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_18]")
		end		
	else
	CloseSpeak(OwnerID())
	end
end
function Lua_kors_gre2fes_01()
	SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_03]")	--������
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_04]","Lua_kors_gre2fes_02",0)
end

function Lua_kors_gre2fes_02()
	SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_05]")  --�Ӧn�F�A�����֥h�a�s�]����Ĩӵ��ڧa�A�ڷ|���հt�n�b�����~���A���C
	SetFlag(OwnerID(),545024,1)
end

function Lua_kors_gre2fes_03()
	if  CountBodyItem( OwnerID() , 201799 ) >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID()," [SC_GRE2FES_KORS_07]" ) --�P�°ѻP	
				GiveBodyItem(OwnerID(), 209558, 1) 
				DelBodyItem( OwnerID() , 201799, 1)
				SetFlag(OwnerID(),545025,1)
			else
				SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_00",0)
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_GRE2FES_KORS_08]") 
			AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_00",0)
	end
end
-------------------mistry�洫---------------------------------------------------------
function Lua_kors_gre2fes_change()
local Mistry1=CountBodyItem(OwnerID(),209552)
local Mistry2=CountBodyItem(OwnerID(),209553)
local Mistry3=CountBodyItem(OwnerID(),209554)
local mis = Mistry1+Mistry2+Mistry3
		if  mis >=1 then
			SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_09]")
				if Mistry1>=1 or Mistry2>=1 then
					if CheckFlag(OwnerID(),545036) == FALSE then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_13]","Lua_kors_gre2fes_change_Debris",0)
					end
				end
				if Mistry3 >=1 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_15]","Lua_kors_gre2fes_change_onepeace",0)
				end
		else
		SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_25]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_00",0)
		end
end

function Lua_kors_gre2fes_change_Debris()
local Mistry1=CountBodyItem(OwnerID(),209552)--����
local Mistry2=CountBodyItem(OwnerID(),209553)--�H��
local Mistry3=CountBodyItem(OwnerID(),209554)
local mistry= Mistry1*100+Mistry2*50	
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if mistry ~= 0 and  mistry<1000 then
			SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_11]")
			DelBodyItem(OwnerID(),209552,Mistry1)
			DelBodyItem(OwnerID(),209553,Mistry2)
			GiveBodyItem(OwnerID(),209561,1)
			SetFlag(OwnerID(),545036,1)
		elseif mistry >=1000 then
			SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_12]")
			DelBodyItem(OwnerID(),209552,Mistry1)
			DelBodyItem(OwnerID(),209553,Mistry2)
			GiveBodyItem(OwnerID(),209561,2)
			SetFlag(OwnerID(),545036,1)
		end
	else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_change",0)	
	end
end


function  Lua_kors_gre2fes_change_onepeace()
	SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_17]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GRE2FES_KORS_15]","Lua_kors_gre2fes_change_Crown",0)
end

function Lua_kors_gre2fes_change_Crown()
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		SetSpeakDetail(OwnerID(),"[SC_GRE2FES_KORS_19]")
		DelBodyItem(OwnerID(),209554,1)
		GiveBodyItem(OwnerID(), 209558, 1) 
		SetFlag(OwnerID(),545036,0)
	else
		SetSpeakDetail( OwnerID(),"[SC_111490_DIALOG10]"   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","Lua_kors_gre2fes_change",0)	
	end
end

function Lua_kors_gre2fes_frogsh()--�C��j�M�ޯ�
local npcm=SetSearchRangeInfo( OwnerID() , 90 )
			for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118261 then
					local peace = LuaFunc_CreateObjByObj (  118260, npcde )	
					SetModeEx(peace,EM_SetModeType_Revive,FALSE)
					BeginPlot(peace,"Lua_kors_gre2fes_peacebron",0)
					AddToPartition( peace, 0 )	
					local flg2 = Rand(40)
					SetPosByFlag( npcde, 780935 , flg2 ) 
				end
			end
end

function lua_kors_ger2fes_frogck()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)	
		if ZoneID == 13 or ZoneID == 47 then
			return TRUE 
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FEVER_CHECKPOINT]",C_SYSTEM)
			return FALSE
		end
end

function Lua_kors_gre2fes_frogHit()--�C�쭫��
local h=CheckBuff(TargetID(),509589)
	if h == TRUE then
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		SysCastSpellLv(OwnerID(),TargetID(),497572,1) 
	else
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_GRE2FES_KORS_16]",C_SYSTEM)
	end
end

function Lua_kors_gre2fes_frogArrow()--�C��g��
local h=CheckBuff(TargetID(),509590)
	if h == TRUE then
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		SysCastSpellLv(OwnerID(),TargetID(),497572,1) 
	else
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_GRE2FES_KORS_16]",C_SYSTEM)
	end
end

function Lua_kors_gre2fes_frogMagic()--�C���]�k
local h=CheckBuff(TargetID(),509588)
	if h == TRUE then
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		SysCastSpellLv(OwnerID(),TargetID(),497572,1) 
	else
		CancelBuff(TargetID(),509590)
		CancelBuff(TargetID(),509588)
		CancelBuff(TargetID(),509589)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_GRE2FES_KORS_16]",C_SYSTEM)
	end
end

function Lua_kors_gre2fes_peacebron()--�_�c���X
local bron = Rand(30)
	BeginPlot(OwnerID(),"Lua_kors_gre2fes_peace_DEL",0)
	if bron <20 then--�u�@�̲��X
		local P= LuaFunc_CreateObjByObj (  105639, OwnerID() )	
			SetModeEx(P,EM_SetModeType_Revive,TRUE)
			AddToPartition(P,0)
		SetPlot(OwnerID(),"touch","Lua_kors_gre2fes_peace_0",30)
	else
		SetPlot(OwnerID(),"touch","Lua_kors_gre2fes_peace_1",30)				
	end
end


function Lua_kors_gre2fes_peace_0()--���Ǫ��_�c�@��
local key = CountBodyItem(OwnerID(),209551)
local Owner = CheckBuff(OwnerID(),509595)
			if Owner == TRUE then
				if key ~= 0 then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
					SetPlot( TargetID(),"touch","",0 )
--					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )
					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					GiveBodyItem(OwnerID(),725457,1)	
					DelBodyItem(OwnerID(),209551,1)
					DelObj(TargetID())
					else
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
					SetPlot(TargetID(),"touch","Lua_kors_gre2fes_peace_0",30)
					end
				else
					ScriptMessage(OwnerID(),OwnerID(),0,"[SC_GRE2FES_KORS_14]",C_SYSTEM)
				end
			end

end
					
function Lua_kors_gre2fes_peace_1(o_id , Result)--�S�Ǫ��_�c�@��
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			SetPlot( TargetID(),"touch","",0 )
			PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
			GiveBodyItem(OwnerID(),725457,1)
			DelObj(TargetID())
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
--		BeginPlot(OwnerID(),"Lua_kors_gre2fes_peace_1",0)
		end
end

function Lua_kors_gre2fes_peace_DEL()
	for i = 1,11 do
		if i == 10 then
		DelObj(OwnerID())
		end
	sleep(600)
	end 
end
function Lua_kors_gre2fes_monskill()--�M�w�Ǫ��ޯ�C
		local skill = Rand(100)
		SetPlot(OwnerID(),"dead","Lua_kors_gre2fes_dead",50)
		NPCSay(OwnerID(),"[SC_GRE2FES_KORS_10]")
			if skill >=0 and skill <=33 then
			AddBuff(OwnerID(),509588,1,5)
			end
			if  skill > 33 and skill <=66 then 
			AddBuff(OwnerID(),509590,1,5)
			end
			if skill >66 and skill <=100 then
			AddBuff(OwnerID(),509589,1,5)
			end
end

function Lua_kors_gre2fes_SKCHECK()
	local TARGET =ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
		if TARGET == 105639 then
			return TRUE	
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424142_1]",C_SYSTEM)
			return FALSE
		end
end


function Lua_kors_gre2fes_dead()--�Ǫ����`��KEY
	GiveBodyItem(TargetID(),209551,1)
--	WriteRoleValue(TargetID(),EM_RoleValue_PID+1,1)
	DelObj(OwnerID())
end

function Lua_kors_gre2fes_re()
	SetFlag(OwnerID(),545025,0)
	SetFlag(OwnerID(),545024,0)
	SetFlag(OwnerID(),545036,0)
end