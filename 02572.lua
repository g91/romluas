--��l�ƥ@���ܼ�
function Lua_Zone2_WorldPE_Init( Times )		--��l��
	Times = Times or GetWorldVar( "Zone2_WorldPE_Times")+1
	SetWorldVar( "Zone2_WorldPE_Times", Times )	--PE����
	SetWorldVar( "Zone2_WorldPE_Phase"  , 1 )	--�]�w���q
	SetWorldVar( "Zone2_WorldPE_Crystal"  , 0 )	--�]�w����
	SetWorldVar( "Zone2_WorldPE_Money_0", 0 )	--�]�w����(�T�w����)
	SetWorldVar( "Zone2_WorldPE_EndTime", 0 )	--�]�w�𮧮ɶ�
	SetWorldVar("Zone2_WorldPE_SelectBuffID",0)	--�]�w�̲׳Q��ܪ�BuffID
	SetWorldVar("Zone2_WorldPE_CtrlBuffTime",0)	--�]�w�̲׳Q�ݨ���buff�ɶ�
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , 259200 )	--�]�w�ĤT���q���ɶ��A3�Ѥ��[
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 0 )	--�]�w�ĤT���q���}�����q
	for i=1, #Zone2_WorldPE_Buff do
		SetWorldVar( "Zone2_WorldPE_Money_"..i  , 0 )--�]�w����1,2,3
	end
end
--AC�@�ɨƥ󪺥D���
function Lua_Zone2_WorldPE_ctrl()

	Zone2_WorldPE_Require_1 = 200000000 	--�i�J�ĤG���q���e
	Zone2_WorldPE_Require_2 = 26000		--�i�J�ĤT���q���e
	Zone2_WorldPE_Buff = {	621995,	--�����W�q1
					621996,	--�����W�q2
					621997	--509435--�����W�q3
				}
	Var_AC1_MainCtrl = OwnerID()
	Var_AC1_NpcGlobal_PH1 = Var_AC1_NpcGlobal_PH1 or {}	--�Ĥ@���qnpc
	Var_AC1_NpcGlobal_PH2 = Var_AC1_NpcGlobal_PH2 or {}	--�ĤG���qnpc
	Var_AC1_NpcGlobal_PH3 = Var_AC1_NpcGlobal_PH3 or {}	--�ĤT���qnpc
--	Var_AC1_NpcGlobal_PH4 = Var_AC1_NpcGlobal_PH4 or {}	--�ĥ|���qnpc
--	Var_AC1_NpcGlobal_PH5 = Var_AC1_NpcGlobal_PH5 or {}	--�Ĥ����qnpc

	if GetWorldVar( "Zone2_WorldPE_Times") == 0 then
		Lua_Zone2_WorldPE_Init()--��l��
	end
	
	local time = 0
	local Phase
	local Phase_Card = 0
	local CurrentPH = 0
	while true do
		Sleep(10)
		Phase = GetWorldVar( "Zone2_WorldPE_Phase");
		time = time+1;
		--�������q
		if Phase == 1 then
			--���ͺt��
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--�t�ΨC20��i��@���۰ʲ֥[����
			if time%20 == 0 then
				local total = 0
				--�֭p���B�A(�u�����y1)
				if lua_ACuseRealZoneID( OwnerID() ) then
					local Rnum=Rand(3)+1
					local Cmoney=GetWorldVar( "Zone2_WorldPE_Money_"..Rnum)+3000
					SetWorldVar( "Zone2_WorldPE_Money_"..Rnum  , Cmoney)
				end
				--�p���`���B
				for i=1, #Zone2_WorldPE_Buff do
					total = total + GetWorldVar( "Zone2_WorldPE_Money_"..i )
				end		
				--���`���B�F��67000000�A134000000�ɡA�i��\�@���O�q���� 
				if total >=67000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==0 then
					if lua_ACuseRealZoneID( OwnerID() ) then
						--�N��e���A�]�w���@���ܼ�
						Lua_Zone2_WorldPE_SetBuff()
						SetWorldVar( "Zone2_WorldPE_Money_0", 1 )
					end
				elseif total >=134000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==1 then
					if lua_ACuseRealZoneID( OwnerID() ) then
						--�N��e���A�]�w���@���ܼ�
						Lua_Zone2_WorldPE_SetBuff()
						SetWorldVar( "Zone2_WorldPE_Money_0", 2 )
					end
				elseif total >= Zone2_WorldPE_Require_1 then
					--�����F�A�i���q
					lua_AC1_ChangePH( 5 )
					time = 0;
				end
				if time%180 == 0 then
					DebugMsg(0,0,"AC1,SysAddmoney,Now the Money is ="..total)
					time = 0;
				end
			end
		--���������q
		elseif Phase == 2 then
			--���ͺt��
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--�C20��P�_�����ƶq
			if time%20 == 0 then
				if lua_ACuseRealZoneID( OwnerID() ) then
					if GetWorldVar( "Zone2_WorldPE_Crystal") >= Zone2_WorldPE_Require_2 then
						SetWorldVar( "Zone2_WorldPE_Phase"  , 3 )--�i�J���q3
						time = 0;
					end
				end
			end
		--�}����t���q
		elseif Phase == 3 then
			--���ͺt��
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--���ͲĤT���q�Ϊ�npc
			if Phase_Card == 0 then
				cl_Ac1_Blackwater_P3Start()
				Phase_Card = 1
				--�}�l�ƥ��ǰe
				time = 0;
			end
		--���m�𮧶��q
		elseif Phase == 4 then
			--�C��
			if GetWorldVar( "Zone2_WorldPE_EndTime") == 0 then
				Phase_Card = 0	--=>�٭�ĤT���q��
				Lua_Zone2_WorldPE_Init()--��l��
				time = 0;
			else
				--�䥦���y�����o��ơC
				if lua_ACuseRealZoneID( OwnerID() ) then
					SetWorldVar( "Zone2_WorldPE_EndTime", GetWorldVar( "Zone2_WorldPE_EndTime")-1 )
				end
			end
		--1�i2��t�ζ��q
		elseif Phase == 5 then
			--���ͺt��
			if CurrentPH ~= Phase then
				lua_Zone2AC1_ShowNPC(Phase)
				CurrentPH = Phase
			end
			--��PID�ӷ��t���}��
			if ReadRoleValue( OwnerID(),EM_RoleValue_PID ) == 0 then
				CallPlot(OwnerID(),"lua_AC1L1conectL2",OwnerID())
				WriteRoleValue( OwnerID(),EM_RoleValue_PID,1 )
				time = 0;
			elseif time%300 == 0 then
				--���p�S��t( �Ҧp��n���}�� )�A�N������ƥ�e�J�ĤG���q
				if lua_ACuseRealZoneID( OwnerID() ) then
						SetWorldVar( "Zone2_WorldPE_Phase"  , 2 )
				end
				WriteRoleValue( OwnerID(),EM_RoleValue_PID,0 ) 
				time=0;
			end
		--����O�Q�U0�ɡA���歫�m
		elseif Phase == 0 then
			Phase_Card = 0	--=>�٭�ĤT���q��
			if lua_ACuseRealZoneID( OwnerID() ) then
				Lua_Zone2_WorldPE_Init()
			end
		--�m����䥦���q
		else
			--�p�G���b���󶥬q�A�C120s�Ǥ@�q�T���i�ӡC
			if time%120 == 0 then
				DebugMsg(0,0,"AC1,BREAKING,NOW_THE_PHASE IS�G"..Phase)
				time = 0 ;
			end
		end
	end
end
--������k�A��ܿﶵ���̲׶Ƕi��ܻP�����A�å[622224�o��buff�����a
function Lua_Zone2_WorldPE_PayMoney( select ,money )
	SetFlag( OwnerID(), 546067, 1 )
		if CheckBuff(OwnerID(),622224)==false then
			AddBuff(OwnerID(),622224,0,-1)
		end
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem29, GetWorldVar( "Zone2_WorldPE_Times") )
	SetWorldVar( "Zone2_WorldPE_Money_"..select  ,  GetWorldVar( "Zone2_WorldPE_Money_"..select )+money )
	DebugMsg(0,0,"AC1,PlayerAddmoney,Money is =")
end
--���G�S�b��
function Lua_Zone2_WorldPE_PayItem()--ú�檫��
	local Player = OwnerID()
	local NPC = TargetID()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase")
	SetSpeakDetail( Player,  "Phae = "..Phase..";  EndTime = "..GetWorldVar( "Zone2_WorldPE_EndTime").."; Crystal = "..GetWorldVar( "Zone2_WorldPE_Crystal") )

	if GetWorldVar( "Zone2_WorldPE_EndTime") == 0 then
		AddSpeakOption( Player, Player, "PayMoney_1", "Lua_Zone2_WorldPE_PayMoney_1", 0)
		AddSpeakOption( Player, Player, "PayMoney_2", "Lua_Zone2_WorldPE_PayMoney_2", 0)
		AddSpeakOption( Player, Player, "PayMoney_3", "Lua_Zone2_WorldPE_PayMoney_3", 0)
	end
	
	if Phase == 2 and GetWorldVar( "Zone2_WorldPE_Crystal") < Zone2_WorldPE_Require_2 then
		AddSpeakOption( Player, Player, "Crystal", "Lua_Zone2_WorldPE_PayCrystal", 0)
	end
end

function Lua_Zone2_WorldPE_PayMoney_1()--����
	Lua_Zone2_WorldPE_PayMoney( 1 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayMoney_2()--����
	Lua_Zone2_WorldPE_PayMoney( 2 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayMoney_3()--����
	Lua_Zone2_WorldPE_PayMoney( 3 )
	CloseSpeak(OwnerID())
end

function Lua_Zone2_WorldPE_PayCrystal( count )--������
	count = count or 200
	SetWorldVar( "Zone2_WorldPE_Crystal"  ,  GetWorldVar( "Zone2_WorldPE_Crystal")+count )
	CloseSpeak(OwnerID())
end
--����B��F�ɡA��buff���A�i��]�w�A1�O����buff,2�Obuff����ɶ��C
function Lua_Zone2_WorldPE_SetBuff()
	local buff;
	local money=0;
	local utime=GetSystime(0)
	for i=1, #Zone2_WorldPE_Buff do
		if buff == nil or GetWorldVar( "Zone2_WorldPE_Money_"..i )>money then
			buff = i
			money = GetWorldVar( "Zone2_WorldPE_Money_"..i )
		end
	end
	SetWorldVar("Zone2_WorldPE_SelectBuffID",Zone2_WorldPE_Buff[buff])
	SetWorldVar("Zone2_WorldPE_CtrlBuffTime",utime+43200)
	--60*60*12=43200 ����12�p��
end
--�R�����L�������X�СA�ثe�S�b��
function Lua_Zone2_WorldPE_Clear()--�M���X��
	for i = 1 , SetSearchAllPlayer(0) do
		SetFlag( GetSearchResult(), 546067, 0 )
	end
end
--�i�������q��t��
function Lua_Zone2_WorldPE_SetEnd( time )--�]�w�@�ɵ����˼�
	time = time or 5
	SetWorldVar( "Zone2_WorldPE_EndTime", time )
	SetWorldVar( "Zone2_WorldPE_Phase"  , 4 )--�i�J���q4
end

--�ΨӦ^�Ǧۤv�O�_�b���y�����A���O���ܦ^��true�A�O���ܦ^��false
function lua_ACuseRealZoneID( own )
	own = own or OwnerID()
	local RealZoneID = ReadRoleValue( own,EM_RoleValue_RealZoneID )
	if RealZoneID <1000 then
		--DebugMsg(0,0,"AC1,return,readRealZoneID = "..RealZoneID)
		return true
	end
	return false
end
--AC1�ΨӶi���q�Ϋ��O,���a�Ѽƥi�q�{���q�C
function lua_AC1_ChangePH( k )
	WriteRoleValue( Var_AC1_MainCtrl,EM_RoleValue_PID,0 )
	if k == nil then
		local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
		DebugMsg(0,0,"AC1,now the Phase is "..Phase)
		return
	elseif lua_ACuseRealZoneID( OwnerID() ) then		
		SetWorldVar( "Zone2_WorldPE_Phase"  , k )--�i�J���q
		DebugMsg(0,0,"AC1,Success connect to Phase:"..k)
		return
	end
	DebugMsg(0,0,"AC1,YouAreNotInTheMainZone.")
end
--���եΰT���A��ܩҦ����m���B
function Lua_Zone2_WorldPE_PrintMoney()--��ܮ��m���B
	for i=0, #Zone2_WorldPE_Buff do
		DebugMsg(0,0,"Money_"..i.." = "..GetWorldVar( "Zone2_WorldPE_Money_"..i ) )
	end
end
--���եΡAŪ�X�Ĥ@���qnpc��table���j�p
function lua_AC1npcNumTest()
	local num=table.getn(Var_AC1_NpcGlobal_PH1)
	DebugMsg(0,0,"AC1,TEST,PHASE1,NPCNUM�G"..num)
end
--���եΡAŪ�X�{�b�ҳ]�w�����q
function AC1testPhase()
	local 	Phase = GetWorldVar( "Zone2_WorldPE_Phase");
			DebugMsg(0,0,"now the Phase is "..Phase)
end