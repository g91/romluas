--�e�U=======================================
--424487  ���w������
---------------------------------------------------------------------------
function LuaPG_424487_02(Player, CheckStatus )
	local Player = OwnerID()
	local NPC = TargetID()
	EndCastBar( Player, CheckStatus )
	WriteRoleValue(NPC , EM_RoleValue_Register1 , 0)
	Sleep(10)

	local Num02=ReadRoleValue(NPC,EM_RoleValue_Register2)
		if( CheckStatus ~= 0 ) then
			if Num02 <= 40 then
				ScriptMessage( Player, Player, 1,"[SC_424487_01]", 0 )

			elseif Num02 <=60 then
				ScriptMessage( Player, Player, 1,"[SC_424487_02]", 0 )
				GiveBodyItem(Player,240542,1)
			else
				ScriptMessage( Player, Player, 1,"[SC_424487_03]", 0 )
			end
		else
			-- ����
			EndCastBar( Player, CheckStatus )
		end
	WriteRoleValue(NPC , EM_RoleValue_Register2,0)
end

function LuaPG_424487_03(NPC , Player)
	for i=1,80,1 do
		local Num01=ReadRoleValue(NPC,EM_RoleValue_Register1)
		if Num01==0 then
			return
		end
		Sleep(1)

		local y=i%10							----�C10�]1��^�@���P�_�A�@8��						
			if y==0 then
				WriteRoleValue(NPC,EM_RoleValue_Register2,i)
			end
		--Say(NPC,y..","..i)
	end
	return			
end






--��u=======================================
--424499  ���k�٪��O���_��
---------------------------------------------------------------------------
----�ɯS�D�״������W���d��@��
function LuaPG_424499_Yusty() 
	SetPlot( OwnerID(),"range","LuaPG_424499_Yusty_02",60 )  		----�d��@���}�l
end


function LuaPG_424499_Yusty_02()
	if	CheckAcceptQuest(OwnerID(),424499)==true		and    
		CheckCompleteQuest(OwnerID(),424499)==false   	then
			SetFlag(OwnerID(),545513,1)
	end
end





---------------------------------------------------------------------------
--424500  �ƻs�_��
---------------------------------------------------------------------------
--���ȵ����t��
--�t���G�ɯS119162
--�X�l�G781001	no3
--BUFF�G620729
function LuaPG_424500_Complete()
	local Player = TargetID()
	local Set = OwnerID()

	local NewSet = DW_CreateObjEX("obj",119162,Set)
	ks_ActSetMode( NewSet )
	
	AddBuff( Player,620729,1,-1)
	local Num = ReadRoleValue(Set,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Set , "LuaPG_424500_Complete_01" , Player , Set , NewSet)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end


function LuaPG_424500_Complete_01(Player , Set , NewSet)
	WriteRoleValue(Set,EM_RoleValue_Register1,999)

	FA_FaceFlagEX(NewSet, 781001 , 3)					----�ɯS�ਭ
	PlayMotion(NewSet,ruFUSION_ACTORSTATE_EMOTE_KISS)		----�ɯS�᭸�k�ʧ@
	NPCSAY(NewSet,"[SC_424500_01]")					----�ɯS�G�ڵ��������p�ɨǦ�m�o��
	Sleep(30)
	PlayMotion(NewSet,ruFUSION_ACTORSTATE_CRAFTING_BEGIN) 		----�ɯS�u�@�ʧ@
	Sleep(30)
	CancelBuff(Player , 620729)
	DelObj(NewSet)							----�R���t��
	
	WriteRoleValue(Set,EM_RoleValue_Register1,0)
end





---------------------------------------------------------------------------
--424501  �k��
---------------------------------------------------------------------------
function LuaPG_424501()
	local Player = OwnerID()
	local NPC = TargetID()	

	LoadQuestOption(Player)

	if	CheckAcceptQuest(Player , 424501 )==true		and
		CheckCompleteQuest( Player , 424501) == false	and
		CountBodyItem(Player,240593)==1			then
			DelBodyItem(Player,240593,1)
			SetFlag(Player,545516,1)
	end
end

function LuaPG_424501_01()
	local Player = OwnerID()
	local NPC = TargetID()	


	if	CheckAcceptQuest(Player , 424501 )==true		and
		CheckCompleteQuest( Player , 424501) == false	and
		CountBodyItem(Player,240593)==0			then
			SetSpeakDetail(Player,"[SC_424501_01]")
			AddSpeakOption(Player, NPC , "[SC_424501_02]","LuaPG_424501_02",0)
	else
		secret_rebel_start()
	end
end

function LuaPG_424501_02()
	local Player = OwnerID()
	local NPC = TargetID()	

	CloseSpeak(Player)
	GiveBodyItem(Player,240593,1)
end


--PE������=======================================
--424604  �ԳN�G�V�c�T��
---------------------------------------------------------------------------
function LuaPG_424604_Check()
	local Player = OwnerID()
								
	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_423191_D_1]" , 0 ) 			----�԰����L�k���ˡC
		ScriptMessage( Player , Player , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( Player , 620881 ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_424604_CHECK]" , 0 ) 		----�A�w�g���W[240537]�F
		ScriptMessage( Player , Player , 0 , "[SC_424604_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_423191_D_3]" , 0 ) 		----�A�L�k�b�M���ɴ���
			ScriptMessage( Player , Player , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_424604_Use()								----���ˤ���u�ƧL
	AddBuff(OwnerID() ,620881,0,-1)
end

---------------------------------------------------------------------------
--�p�G����Wbuff
function LuaPG_424604_Yes()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)

	if	CheckAcceptQuest(Player , 424604 )==true		and
		CheckFlag(Player,545578)==false			then
		if	CheckBuff(Player,620881)==true				then	
				AddSpeakOption(Player, NPC , "[SC_424604_YES]","LuaPG_424604_Yes_01",0)
		else
				AddSpeakOption(Player, NPC , "[SC_424604_YES]","LuaPG_424604_No",0)
		end		
	end
end

function LuaPG_424604_Yes_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424604_YES_01]")
	DelBodyItem(Player,240641,1)
			ScriptMessage( Player , Player , 1 , "[SC_424604_YES_02]" , 0 ) 
			ScriptMessage( Player , Player , 0 , "[SC_424604_YES_02]" , 0 )
	SetFlag(Player,545578,1)
end

---------------------------------------------------------------------------
--�p�G�S����Wbuff
function LuaPG_424604_No()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424604_NO]")
	DelBodyItem(Player,240641,1)
			ScriptMessage( Player , Player , 1 , "[SC_424604_NO_03]" , 0 ) 
			ScriptMessage( Player , Player , 0 , "[SC_424604_NO_03]" , 0 )
	AddSpeakOption(Player, NPC , "[SC_424604_NO_01]","LuaPG_424604_No_01",0)
end

function LuaPG_424604_No_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424604_NO_02]")
end


---------------------------------------------------------------------------
--���s�n�@�ʫH
function LuaPG_424604_Re()
	local Player = OwnerID()
	local NPC = TargetID()	

	if	CheckAcceptQuest(Player , 424604 )==true		and
		CheckFlag(Player,545578)==false			and
		(CountBodyItem(Player,240641)==0 or CountBodyItem(Player,240633)==0)	then
			SetSpeakDetail(Player,"[SC_424604_RE]")
			AddSpeakOption(Player,NPC,"[SC_424604_RE_01]","LuaPG_424604_Re_01",0)
	else
		secret_rebel_start()
	end
end

function LuaPG_424604_Re_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424604_RE_02]")
	if CountBodyItem(Player,240641)==0 then
		GiveBodyItem(Player,240641,1)
	end

	if CountBodyItem(Player,240633)==0 then
		GiveBodyItem(Player,240633,1)
	end
end

function LuaPG_424604_Complete()
	Lua_ZonePE_3th_GetScore(70)
	CancelBuff(TargetID() ,620881)
end