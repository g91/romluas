--�e�U
---------------------------------------------------------------------------
--424280 ���쪺�_�w
---------------------------------------------------------------------------
function LuaPG_424280_exchange()						----�P���L�洫��]�����
	if	CheckAcceptQuest(OwnerID(), 424280)==true	and	
		CountBodyItem(OwnerID(), 209638)>=10	then			----�p�G�������δ�
		SetSpeakDetail(OwnerID(),"[SC_424280_EXCHANGE]")
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424280_EXCHANGE_02]","LuaPG_424280_exchange_02",0)
	else
		LoadQuestOption(OwnerID())
	end
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_B1]"," William_424272_B2",0)
	end
end

function LuaPG_424280_exchange_02()
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(), 209638, 10)
	GiveBodyItem(OwnerID(), 209641, 1)
end



---------------------------------------------------------------------------
--�D�u
---------------------------------------------------------------------------
--424251 ���צ�ɳ��n�O������
---------------------------------------------------------------------------
function LuaPG_424251_refuse()
	if	CheckAcceptQuest(OwnerID(), 424251)==true		and
		CheckCompleteQuest(OwnerID(), 424251)==false	and
		CheckFlag(OwnerID(),545072)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424251_REFUSE_01]")		----�A���O����������......
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424251_REFUSE_02]","LuaPG_424251_refuse_02",0)
										----�ܩ�p�A�ڤ��൪��
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424251_refuse_02()	
	LoadQuestOption(OwnerID())							----�������
	SetFlag(OwnerID(), 545072, 1)						----��flag
end


--�������ȫᱵ�@��
---------------------------------------------------------------------------
function LuaPG_424251_argue()
	local Player = TargetID()
	local Topp = OwnerID()

	local New_Topp = DW_CreateObjEX("obj",118461,Topp)		----�ͦ��t������
	AddBuff( Player,620700,1,12)
	
	local Num = ReadRoleValue(Topp,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(Topp , "LuaPG_424251_argue_02" , Topp ,Player,New_Topp)	
										----���t��function
	else
		LoadQuestOption(Player)
		SetFlag(Player, 545076, 1)
	end
end

function LuaPG_424251_argue_02(Topp ,Player,New_Topp)
--	say(OwnerID(),"11")
	
	WriteRoleValue(Topp,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO	
				
	ks_ActSetMode( New_Topp )

	AdjustFaceDir(New_Topp, Player, 0 )					----�������缾�a
	PlayMotion(New_Topp,ruFUSION_ACTORSTATE_emote_point)		----�����ʧ@�G���۪��a
	Say(New_Topp,"[SC_424251_ARGUE_01]")				----�����G��å�I�A�O�����䪺�I
	Sleep(15)
	Say(New_Topp,"[SC_424251_ARGUE_02]")				----�ڰڡA�ڪ��D�F�I�A�O���Y�����ҹ�a�I
	Sleep(15)
	PlayMotion(New_Topp,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	----�����ͮ�ʧ@
	Say(New_Topp,"[SC_424251_ARGUE_03]")				----��Ӧp���A���O�M�P��b�t���ܡI
	Sleep(10)

	local Galloper = Lua_DW_CreateObj("flag",118463,780952,1)		----�ǥO�x�X�{
	ks_ActSetMode( Galloper )
	Say(Galloper,"[SC_424251_ARGUE_04]")				----�J���K�D�A�o�i�O�F�ԥ������S�Ϥj�H���I
	Sleep(15)
	WriteRoleValue(Galloper  ,EM_RoleValue_IsWalk , 1 ) 			----�ǥO�x�q780952��no1����no2
	DW_MoveToFlag( Galloper , 780952,2,0 ,1) 				----�o�O�j��  ��F�~�]�U�@��
	DelObj(New_Topp)								
	DelObj(Galloper)

	CancelBuff(Player,620700)
	SetFlag(Player, 545076, 1)						----����cli
	WriteRoleValue(Topp,EM_RoleValue_Register1,0)			----�g�^�Ȧs��
end


---------------------------------------------------------------------------
--424252 �ʨ����u��D
---------------------------------------------------------------------------
--function LuaPG_424252()
--	LoadQuestOption(OwnerID())
--	if	CheckAcceptQuest(OwnerID(),424252)==true	then
--		SetFlag(OwnerID(),545073,1)
--	end
--end

---------------------------------------------------------------------------
--424253 ��a���n��
---------------------------------------------------------------------------
function LuaPG_424253_Talk_With_01()
	if	CheckAcceptQuest(OwnerID(),424253)==true		and
		CheckCompleteQuest(OwnerID(), 424253)==false	and	
		CheckFlag(OwnerID(),545074)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_01]")		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_01]","LuaPG_424253_Talk_With_02",0)
										----����N�x
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_02]","LuaPG_424253_Talk_With_03",0)
										----����D�Ԭ�
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----�ګ��A�ѧA�̪����ΤF
	elseif	CheckAcceptQuest(OwnerID(),424252)==true		and	
		CheckFlag(OwnerID(),545073)==false			then
		SetFlag(OwnerID(),545073,1)			
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424253_Talk_With_02()						----����N�x
	SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_02]")		
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_02]","LuaPG_424253_Talk_With_03",0)
										----����D�Ԭ�
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----�ګ��A�ѧA�̪����ΤF										
end

function LuaPG_424253_Talk_With_03()						----����D�Ԭ�
	SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_03]")			----�A���O����������......
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_01]","LuaPG_424253_Talk_With_02",0)
										----����N�x
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----�ګܲM���A�̪����ΤF
end

function LuaPG_424253_Talk_With_04()						----���A�ѤF
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545074, 1)
end

--�@�������᪺��t
---------------------------------------------------------------------------
function LuaPG_424253_General_Come_In()
	local Player = TargetID()
	local King = OwnerID()

	local Num = ReadRoleValue(King,EM_RoleValue_Register1)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(King , "LuaPG_424253_General_Come_In_02" , King, Player)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424253_General_Come_In_02(King ,Player)
	WriteRoleValue(King,EM_RoleValue_Register1,999) 			----�}�l�t�X���аO
	local New_King = DW_CreateObjEX("obj",118335,King)			----�ͦ����η��
	SetModeEx(New_King ,EM_SetModeType_ShowRoleHead,false)       		 ----����ܦ��
	SetModeEx( New_King , EM_SetModeType_HideName, true)		----���æW��
	Say(New_King,"[SC_424253_KING_YELL]")	
	Sleep(15)
	local General = Lua_DW_CreateObj("flag",118323,780952,3)		----�ͦ��N�x�b780952��NO3
	ks_ActSetMode( General )
	DW_MoveToFlag( General , 780952,4,0 ,1)				----�j��A��F�~�|���U�@�B

	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		----�N�x�\�X�ͮ�ʧ@
	Yell(General,"[SC_424253_GENERAL_YELL]",2)				----�N�x�G�M���I
	PlayMotion(General,ruFUSION_ACTORSTATE_emote_point)		----�N�x���ۻ�D
	Sleep(25)
	Yell(General,"[SC_424253_GENERAL_YELL_02]",2)			----�N�x�G�A���x�p�@�k�A���������]���X�ۡI
	Sleep(20)
	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		----�N�x�\�X�ͮ�ʧ@
	Yell(General,"[SC_424253_GENERAL_YELL_03]",2)			----�N�x�G�ڬO���|���Ԫ��I
	Sleep(25)
	DW_MoveToFlag( General , 780952,3,0 ,1)				----�N�x���}
	DelObj(General)
	DelObj(New_King)
	WriteRoleValue(King,EM_RoleValue_Register1,0) 			
end


---------------------------------------------------------------------------
--424254 �զۦ��
---------------------------------------------------------------------------
function LuaPG_424254_King_Leave()						----�����ȫ᪺��t
	local Player=TargetID()					
	local King=LuaFunc_SearchNPCbyOrgID( Player, 118322, 200, 0 )
--	Say(OwnerID(),"00")							----���B�����
	local Soldier=LuaFunc_SearchNPCbyOrgID( King, 118340, 200, 0 )
	local Num = ReadRoleValue(King,EM_RoleValue_Register2)
	
	if	Num == 0	then						----�p�G�Ȧs�Ȭ�0
		CallPlot(King , "LuaPG_424254_King_Leave_02" , King, Player,Soldier)	
										----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424254_King_Leave_02(King, Player,Soldier)
	WriteRoleValue(King,EM_RoleValue_Register2,999) 			----�}�l�t�X���аO
	local New_King = DW_CreateObjEX("obj",118462,King)			----�ͦ��t�����
	ks_ActSetMode( New_King )

	local New_Soldier=DW_CreateObjEX("obj",118572,Soldier)
	ks_ActSetMode( New_Soldier )

	local Tenn = LuaFunc_SearchNPCbyOrgID( King, 118327, 200)
	
	DW_MoveToFlag( New_King , 780952,5,0 ,1)				----�t����򺸨��V780952��NO5
	WriteRoleValue(New_Soldier  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( New_Soldier , 780952,9,0 ,1)				
	DelObj(New_King)
	DelObj(New_Soldier)
	Tell(Player ,Tenn ,"[SC_424254_TENN_TELL]")				----�����缾�a��������
--	Say(Player,"11")
	WriteRoleValue(King,EM_RoleValue_Register2,0) 			----�}�l�t�X���аO
end


function LuaPG_424254_01()							----�M���������
	if	CheckAcceptQuest(OwnerID(),424254)==true		and
		CheckCompleteQuest(OwnerID(), 424254)==false	and
		CheckFlag(OwnerID(),545075)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424254_TENN_01]")		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424254_TENN_02]","LuaPG_424254_02",0)
										----����N�x						
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424254_02()
	LoadQuestOption(OwnerID())
	SetFlag(OwnerID(), 545075, 1)
end


---------------------------------------------------------------------------
--424257 �զۦ��
---------------------------------------------------------------------------
--function LuaPG_424257_Howl_01()	
--	if	CheckAcceptQuest(OwnerID(),424257)==true		and
--		CountBodyItem(OwnerID(),240226)>0			and
--		CheckFlag(OwnerID(),545098)==false			then
--		SetSpeakDetail(OwnerID(),"[SC_424257_01]")		
--		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Howl_02",0)						
--	else
--		LoadQuestOption(OwnerID())
--	end
--end

function LuaPG_424257_Howl_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_02]")
	BeginPlot(OwnerID(),"LuaPG_424257_Howl_03",0)		
end

function LuaPG_424257_Howl_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545098,1)
	DW_QietKillOne(0,105759) 				----�R�R�������ǡA�e�̱�����̡A0�N�����a	
end

function LuaPG_424257_Stark_01()
	LoadQuestOption(OwnerID())	
	if	CheckAcceptQuest(OwnerID(),424257)==true		and
		CountBodyItem(OwnerID(),240226)>0			and
		CheckFlag(OwnerID(),545099)==false			then	
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Stark_02",0)						
	end
end

function LuaPG_424257_Stark_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_04]")
	BeginPlot(OwnerID(),"LuaPG_424257_Stark_03",0)		
end

function LuaPG_424257_Stark_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545099,1)
	DW_QietKillOne(0,105759) 				----�R�R�������ǡA�e�̱�����̡A0�N�����a	
end

function LuaPG_424257_Fortkin_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424257)==true		and
		CountBodyItem(OwnerID(),240226)>0			and
		CheckFlag(OwnerID(),545100)==false			then		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Fortkin_02",0)						
	end
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_A1]"," William_424272_A2",0)
	end
end

function LuaPG_424257_Fortkin_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_06]")
	BeginPlot(OwnerID(),"LuaPG_424257_Fortkin_03",0)		
end

function LuaPG_424257_Fortkin_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545100,1)
	DW_QietKillOne(0,105759) 				----�R�R�������ǡA�e�̱�����̡A0�N�����a	
end


---------------------------------------------------------------------------
--424258 �������˳N
---------------------------------------------------------------------------
--���˳N
---------------------------------------------------------------------------
function LuaPG_424258_Check()----���˦��G�H�A�ϥΪ��~�e���ˬd
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_1]" , 0 ) 		----�԰����L�k���ˡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( OwnerID() , 506712 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424258_CHECK]" , 0 ) 		----�A�w�g���W[240225]�F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424258_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_3]" , 0 ) 	----�A�L�k�b�M���ɴ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_424258_Use()									----���˦��G�H�A�ϥΪ��~��
	AddBuff(OwnerID() ,509890,0,-1)
end

function LuaPG_424258_Complete()								----�������ȡA�����G�H����
	CancelBuff(TargetID() ,509890)
end


--�M�G�H�L����
---------------------------------------------------------------------------
function LuaPG_424258_Talk_To_ASoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----���
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545116)==false		then				----�ˬd����
		if	CheckBuff(Player,509890)==true	then				----�ˬd���S��buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_ASoldier_02",0)
												----�N�x���S���U����s�����O�ڡH
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_ASoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_04]")						----�����A�A�ݱN�x���S������s���O�H
	SetFlag(OwnerID(), 545116, 1)
	DW_QietKillOne(0,105760) 								----�R�R�������ǡA�e�̱�����̡A0�N�����a
end

function LuaPG_424258_Talk_To_BSoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----���
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545117)==false		then				----�ˬd����
		if	CheckBuff(Player,509890)==true	then				----�ˬd���S��buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_BSoldier_02",0)
												----�N�x���S���U����s�����O�ڡH
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_BSoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_05]")						----�N�x�O��......��......�����A�S���L�A
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424258_06]","LuaPG_424258_Talk_To_BSoldier_03",0)
end

function LuaPG_424258_Talk_To_BSoldier_03()
	SetSpeakDetail(OwnerID(),"[SC_424258_07]")						----......�d�������A�b������A��F
	SetFlag(OwnerID(), 545117, 1)
	DW_QietKillOne(0,105760) 								----�R�R�������ǡA�e�̱�����̡A0�N�����a
end

function LuaPG_424258_Talk_To_CSoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----���
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545118)==false		then				----�ˬd����
		if	CheckBuff(Player,509890)==true	then				----�ˬd���S��buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_CSoldier_02",0)
												----�N�x���S���U����s�����O�ڡH
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_CSoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_08]")						
	SetFlag(OwnerID(), 545118, 1)
	DW_QietKillOne(0,105760) 								----�R�R�������ǡA�e�̱�����̡A0�N�����a
end


--�����ȫ�Ĳ�o���d��@��
---------------------------------------------------------------------------
function LuaPG_424258_Range()
--	Say(OwnerID(),"00")
	SetPlot( OwnerID(),"range","LuaPG_424258_Range_02",120 )  				----�d��@���}�l�A���b�N�x���W
end

function LuaPG_424258_Range_02()
--	Say(OwnerID(),"77")
	local Player=OwnerID()
	local General=TargetID()			
	local Num = ReadRoleValue(General,EM_RoleValue_Register1)
	
--	Say(General,"11")

	if	CheckAcceptQuest( Player , 424258 ) == true	and
		CheckFlag(Player,545116)==false			and
		CheckFlag(Player,545117)==false			and
		CheckFlag(Player,545118)==false			and
		CheckFlag(Player,545121)==false			then
		if	Num == 0	then							----�p�G�Ȧs�Ȭ�0
			CallPlot(General , "LuaPG_424258_Range_03" , General,Player)		----���t��function
--			Say(General,"22")	
							
		elseif	Num > 0	then							----�p�G�Ȧs�Ȥj��0
--			Say(General,"33")
			SetFlag(Player,545120, 1)						----��flag�]545120�^�i�H�ݺt��
			Sleep(70)								----�p��t���ɶ�
			SetFlag(Player,545120, 0)						----�R��flag
			SetFlag(Player,545121, 1)						----��flag(545121)
		end
--		Say(General,"44")
	end
end

function LuaPG_424258_Range_03(General,Player)
--	Say(General,"55")
	SetFlag(Player,545120, 1)								----��flag�]545120�^�i�H�ݺt��
	WriteRoleValue(General,EM_RoleValue_Register1,999) 					----�}�l�t�X���аO
	local New_General=DW_CreateObjEX("obj",118468,General)				----�˳խ۲���	
	ks_ActSetMode( New_General )

	DW_MoveToFlag( New_General , 780952,6,0 ,1)					----�t���˳խۨ��V���V780952��NO6�A���{�����j��
	FA_FaceFlagEX(New_General, 780952 , 7)						----�t���˳խۭ���x��
	PlayMotion(New_General,ruFUSION_ACTORSTATE_emote_point)
	Yell(New_General,"[SC_424258_03]",2)
	Sleep(20)
	DW_MoveToFlag( New_General , 780952,8,0 ,1)					----�t���˳խ۰h��
	DelObj(New_General)
	SetFlag(Player,545120, 0)
	SetFlag(Player,545121, 1)								----��flag(545121)
	WriteRoleValue(General,EM_RoleValue_Register1,0) 					----�k0	
end


---------------------------------------------------------------------------
--424259  ����I���ܭn���I
---------------------------------------------------------------------------
----�N�x���W���d��@��
function LuaPG_424259_General_Forest() 
	SetPlot( OwnerID(),"range","LuaPG_424259_General_Forest_02",60 )  		----�d��@���}�l
end


function LuaPG_424259_General_Forest_02()
	if	CheckAcceptQuest(OwnerID(),424259)==true	and    CheckCompleteQuest(OwnerID(),424259)==false   then
		SetFlag(OwnerID(),545122,1)
	end
end



