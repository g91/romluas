--=======================================
--424468  ���~���U���լd
---------------------------------------------------------------------------
--FLAG:545476
function LuaPG_424468()							----�i�D�N��n���U�ҫk
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player,424468)==true	and
		CheckFlag(Player,545476)==false		then
		SetFlag(Player,545476,1)
	end
end

--�������ȫᱵ�@��
---------------------------------------------------------------------------
--�t���G����J119050�B�N��119051�B�ܨ��Ἧ��J119046�B���βy�ҫk119047
--����X�l�G780990	no.1��3
--����J�ܨ��k�N�G620635
function LuaPG_424468_Complete()	
	local Player = TargetID()
	local Gill = OwnerID()

	local New_Gill = DW_CreateObjEX("obj",119051,Gill)			----�ͦ��t���N��
	local Robert = LuaFunc_SearchNPCbyOrgID( Gill, 118913, 200, 0 )	----�j�M��ҫk

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,620924,1,-1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Gill , "LuaPG_424468_Complete_01" , New_Gill , Gill, Player, Robert)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424468_Complete_01(New_Gill , Gill, Player, Robert)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local New_Robert = DW_CreateObjEX("obj",119047, Robert)		----�ͦ��t���ҫk				
	local NeedChange = {New_Robert,New_Gill}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )
	end
	SetModeEx( New_Robert , EM_SetModeType_HideName, true)		----�����W��
				
	NPCSAY(New_Gill,"[SC_424468_FLYAWAY_01]")				----�N��G�ĨĦb�o�̵��n�n�A�n�n���W�N�^��
	Sleep(25)
	NPCSAY(New_Robert,"[SC_424468_FLYAWAY_02]")				----�ҫk�G��......�ڪ��D�F......
	Sleep(20)


	local Merick = Lua_DW_CreateObj("flag",119050,780990,1)		----�ͦ��t������J�b780990��1
	ks_ActSetMode( Merick )
	NPCSAY(Merick,"[SC_424468_FLYAWAY_03]")				----����J�G�ǳƦn�F�N���a�C
	DW_MoveToFlag( Merick , 780990,2, 0 ,1)				----����J��780990��1����2
	DW_MoveToFlag( New_Gill , 780990,3, 0 ,1)				----�N��Ѩ���780990��3


	AddBuff(Merick,620635,1,-1)						----����J�ܨ�
	Sleep(10)
	FA_FaceFlagEX(Merick, 780990 , 1)					----����J�ਭ
	DW_MoveToFlag( Merick , 780990,1,0 ,1)				----����J������780990��2����1�A�����j��
	DelObj(Merick)								----����J����

	DW_MoveToFlag( New_Gill , 780990,1,0 ,1)				----�N���780990��3����1�A�����j��
	for index,value in pairs(NeedChange) do				----�R���N��B�ҫk���βy
		DelObj( value )	
	end								
							
	CancelBuff(Player,620924)
	WriteRoleValue(Gill,EM_RoleValue_Register1,0)				----�g�^�N��Ȧs��
end



---------------------------------------------------------------------------
--424471  �e���B�y��
---------------------------------------------------------------------------
----�B�y��������J���W���d��@��
function LuaPG_424471() 
	SetPlot( OwnerID(),"range","LuaPG_424471_01",60 )
end


function LuaPG_424471_01()
	if	CheckAcceptQuest(OwnerID(),424471)==true	and    CheckCompleteQuest(OwnerID(),424471)==false   then
		SetFlag(OwnerID(),545484,1)
	end
end


--���ȱ��U�ᱵ�@��
---------------------------------------------------------------------------
--�t���G����J119102�B�N��119103�B�ҫk119104
--����X�l�G780990	no.1��4
function LuaPG_424471_Accept()
	local Player = TargetID()
	local Merick = OwnerID()

	local New_Merick = DW_CreateObjEX("obj",119102,Merick)
	local Robert = LuaFunc_SearchNPCbyOrgID( Merick, 118913, 200, 0 )	----�j�M��ҫk	
	local Gill = LuaFunc_SearchNPCbyOrgID( Merick, 119101, 200, 0 )	----�j�M��N��	
	local New_Gill = DW_CreateObjEX("obj",119103,Gill)			----�ͦ��t���N��
	local New_Robert =DW_CreateObjEX("obj",119104,Robert)		----�ͦ��t���ҫk						

	local NeedChange = {New_Robert,New_Gill,New_Merick}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	AddBuff(Player,620943,1,-1)

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Merick , "LuaPG_424471_Accept_01" , New_Gill , Player, Merick , New_Robert,New_Merick)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424471_Accept_01(New_Gill , Player, Merick , New_Robert,New_Merick)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	


	DW_MoveToFlag( New_Merick , 780990,1, 0 ,1)				----����J��780990��2����1
	DelObj(New_Merick)	
	DW_MoveDirectToFlag( New_Gill , 780990,1,0 ,1) 				----�N���780990��3����1
	DW_MoveToFlag( New_Robert , 780990,4, 0 ,1)				----�ҫk�ѭ�쨫��780990��4�A�����j��

	local NeedDelete = {New_Robert,New_Gill}
	for index,value in pairs(NeedDelete) do					----�R���N��B�ҫk
		DelObj( value )	
	end								
							
	CancelBuff(Player,620943)
	WriteRoleValue(Merick,EM_RoleValue_Register1,0)			----�g�^����J�Ȧs��
end





---------------------------------------------------------------------------
--424472  �դ����Ӷ��q���f
---------------------------------------------------------------------------
--FLAG�G545485
--���~�G240539
function LuaPG_424472()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	LoadQuestOption(Player)

	if	CheckCompleteQuest(Player,424515) == true 		then
		AddSpeakOption(Player,NPC,"[SC_SECRET_SIGN_01]","secret_people_say",0)
	end

	if	CheckAcceptQuest(Player , 424472 )==true		and
		CheckCompleteQuest( Player , 424472) == false	and
		CountBodyItem(Player,240539)==1			then			
	
			AddSpeakOption(Player, NPC , "[SC_424472_01]","LuaPG_424472_01",0)		
	elseif	CheckAcceptQuest(Player , 424473 )==true		and
		CheckCompleteQuest( Player , 424473 ) == false	and
		CheckFlag(Player,545486)==false			then	
	
			SetSpeakDetail(Player,"[SC_424473_00]")
			AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
			AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
	end
end

function LuaPG_424472_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	CloseSpeak(Player)
	DelBodyItem(Player , 240539 , 1)
	SetFlag(Player,545485,1)
end



function LuaPG_424472_re()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424472 )==true		and
		CheckCompleteQuest( Player , 424472) == false		and
		CountBodyItem(Player,240539)==0			and
		CheckFlag(Player,545485)==false			then
		SetSpeakDetail(Player,"[SC_424472_02]")
		AddSpeakOption(Player,NPC,"[SC_424472_03]","LuaPG_424472_re_01",0)
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424472_re_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	CloseSpeak(Player)
	GiveBodyItem(Player , 240539 , 1)
end

---------------------------------------------------------------------------
--424473  �i�ê�����
---------------------------------------------------------------------------
--flag�G�߰ݫº�������545486
--function LuaPG_424473()
--	local Player = OwnerID()
--	local NPC = TargetID()								
--	
--	if	CheckAcceptQuest(Player , 424473 )==true		and
--		CheckCompleteQuest( Player , 424473 ) == false	and
--		CheckFlag(Player,545486)==false			then	
--	
--			SetSpeakDetail(Player,"[SC_424473_00]")
--			AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
--			AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
--	else
--			LoadQuestOption(Player)
--	end
--end

function LuaPG_424473_01()							----�ݰӶ��n���h�[
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_03]")
	AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
	AddSpeakOption(Player, NPC , "[SC_424473_04]","LuaPG_424473_03",0)
end

function LuaPG_424473_02()							----���ỡ���s���~
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_05]")
	AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
	AddSpeakOption(Player, NPC , "[SC_424473_04]","LuaPG_424473_03",0)
end

function LuaPG_424473_03()							----�ݫº�
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_06]")
	SetFlag(Player, 545486 , 1)
end


--���ȵ����A���@��
---------------------------------------------------------------------------
--�t���G��̧B��119117
--����X�l�G780990	no.5
function LuaPG_424473_Complete()
	Lua_ZonePE_3th_GetScore(100)
	
	local Player = TargetID()
	local Vet = OwnerID()

	local New_Vet = DW_CreateObjEX("obj",119117,Vet)			----�ͦ��t����̧B��
	ks_ActSetMode( New_Vet )	

	local Num = ReadRoleValue(Vet,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Vet , "LuaPG_424473_Complete_01" , New_Vet , Player, Vet)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424473_Complete_01( New_Vet , Player, Vet)
	WriteRoleValue(Vet,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	PlayMotion(New_Vet,ruFUSION_ACTORSTATE_emote_head_shake)		----��̧B��n�Y�ʧ@
	Sleep(10)	
	NPCSAY(New_Vet,"[SC_424473_COMPLETE_01]") 				----��̧B��G�A���ΰݤF......�ڡB�ڤ��򳣤��໡�C
	Sleep(25)
	NPCSAY(New_Vet,"[SC_424473_COMPLETE_02]")				----��̧B��G�ڸӨ��F......�դ������H���ӳ��b���ڡC
	Sleep(20)
	DW_MoveToFlag( New_Vet , 780990,5, 0 ,1)				----��̧B��ѭ�a����780990��no5
	DelObj( New_Vet )														

	WriteRoleValue(Vet,EM_RoleValue_Register1,0)				----�g�^��̧B��Ȧs��
end





---------------------------------------------------------------------------
--424475  �洫����
---------------------------------------------------------------------------
--���~�G240541
function LuaPG_424475()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	LoadQuestOption(Player)
	AddSpeakOption( Player, NPC, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--�ڷQ�ݬݧA�檺�t��C

	if	CheckAcceptQuest(Player , 424475 )==true		and
		CheckCompleteQuest( Player , 424475) == false		and
		CountBodyItem(Player , 240540) >= 5			and
		CountBodyItem(Player , 240541) == 0			then

			AddSpeakOption(Player, NPC , "[SC_424475_01]","LuaPG_424475_01",0)		
	end
end

function LuaPG_424475_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	DelBodyItem(Player , 240540 , 5)
	SetSpeakDetail(Player,"[SC_424475_02]")
	GiveBodyItem(Player , 240541 , 1)
--	AddSpeakOption(Player, NPC , "[SC_424475_03]","LuaPG_424475_02",0)
end

--function LuaPG_424475_02()
--	local Player = OwnerID()
--	local NPC = TargetID()								

--	CloseSpeak(Player)	
--	GiveBodyItem(Player , 240541 , 1)
--end




---------------------------------------------------------------------------
--424476  �����J��
---------------------------------------------------------------------------
--flag�G�T�{�º�������545488
function LuaPG_424476()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	secret_people_start_beach()
	

	if	CheckAcceptQuest(Player , 424476 )==true		and
		CheckCompleteQuest( Player , 424476) == false		and	
		CheckFlag(Player,545488)==false			then
			AddSpeakOption(Player, NPC , "[SC_424476_00]","LuaPG_424476_01",0)
	end
end



function LuaPG_424476_01()
	local Player = OwnerID()
	local NPC = TargetID()
							
	SetSpeakDetail(Player,"[SC_424476_01]")
	AddSpeakOption(Player, NPC , "[SC_424476_02]","LuaPG_424476_02",0)
end

function LuaPG_424476_02()
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424476_03]")
	SetFlag(Player , 545488 , 1)
end


--424476���ȵ����A���@��
---------------------------------------------------------------------------
--�t���G����xa119124�Bb119151�B���R119152�B��ż��Q119123
--����X�l�G780990	no.6��no.12
--�t��buff�G620689
function LuaPG_424476_Complete()
	local Player = TargetID()
	local Larry = OwnerID()

	local New_Larry = DW_CreateObjEX("obj",119123,Larry)
	ks_ActSetMode( New_Larry )
	
	AddBuff( Player,620689,1,-1)
	local Num = ReadRoleValue(Larry,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Larry , "LuaPG_424476_Complete_01" , Larry , Player,New_Larry)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
	Lua_ZonePE_3th_GetScore(100)
end

function LuaPG_424476_Complete_01( Larry , Player,New_Larry)
	WriteRoleValue(Larry,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	

	local SoldierA = Lua_DW_CreateObj("flag",119124,780990,6)
	local SoldierB = Lua_DW_CreateObj("flag",119151,780990,8)

	local NeedChange = {SoldierA,SoldierB}
		for index,value in pairs(NeedChange) do
			ks_ActSetMode( value )	
		end


	DW_MoveDirectToFlag( SoldierA , 780990,7,0 ,1)				----����xa��780990��6����7
	WriteRoleValue(SoldierB  ,EM_RoleValue_IsWalk , 0 )
	DW_MoveToFlag( SoldierB , 780990, 9 ,0 ,1)				----����xb��780990��8����9

		for index,value in pairs(NeedChange) do
			AdjustFaceDir( value, Player, 0 )	
		end

	Sleep(10)	

	NPCSAY(SoldierA,"[SC_PLAY_424476_01]")					----����xa�G�A�n���b�����ǩ_�Ǫ���
	Sleep(25)
	PlayMotion(SoldierB,ruFUSION_ACTORSTATE_emote_point)		----����xb������a�ʧ@
	NPCSAY(SoldierB,"[SC_PLAY_424476_02]")					----����xb�G���w�����D�A�и�ڭ̨Ӥ@��
	Sleep(25)
									
	DW_MoveDirectToFlag( New_Larry , 780990,10,0 ,1) 			----��ż��Q���ȱ��A����780990��10

	local Gry = Lua_DW_CreateObj("flag",119152,780990,11)
	
	DW_MoveToFlag( Gry , 780990,12,0 ,1)					----���R�q780990��11����12
	ks_ActSetMode( Gry )

	DelObj(New_Larry)

	NPCSAY(Gry,"[SC_PLAY_424476_03]") 						----���R�G���n�F�j�s�S�X�{�F
	Sleep(10)
	FA_FaceFlagEX(Gry, 780990 ,11)
	PlayMotion(Gry,ruFUSION_ACTORSTATE_emote_point)
	Sleep(10)

	FA_FaceFlagEX(SoldierA, 780990 , 9)					----����x��H����
	FA_FaceFlagEX(SoldierB, 780990 , 7)

	Sleep(10)	

	AdjustFaceDir( SoldierA, Gry, 0 )
	AdjustFaceDir( SoldierB, Gry, 0 )

	NPCSAY(SoldierA,"[SC_PLAY_424476_04]")					----����xa�G�ڭ̰��W�h�B�z
	DW_MoveDirectToFlag( SoldierA , 780990,15,0 ,1) 			----����xa��780990��7����6
	DW_MoveToFlag( SoldierB , 780990,16,0 ,1)				----����xb��780990��9����8
	Sleep(20)

	local NeedDelNPC={SoldierA,SoldierB,Gry}
	for index,value in pairs(NeedDelNPC) do					----�R���t��
		DelObj(value)
	end									

	CancelBuff(Player,620689)
	WriteRoleValue(Larry,EM_RoleValue_Register1,0)			----�g�^Larry�Ȧs��
end
