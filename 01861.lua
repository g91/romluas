------------------------------------------�̽u����NO.10
function LuaS_423185_A()
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423185 ) == true  and CountBodyItem(OwnerID(),207297)>=1 
	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423185_1]" , "LuaS_423185_A_Ans", 0 )		--�аݳo���񦳥X�{�L�o���L�άO�֦��o���L���ͪ��H
	end
end

function LuaS_423185_B()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423185 ) == true and CountBodyItem(OwnerID(),207297)>=1 	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423185_1]" , "LuaS_423185_B_Ans", 0 )		--�аݳo���񦳥X�{�L�o���L�άO�֦��o���L���ͪ��H
	end
end

function LuaS_423185_C()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423185 ) == true and CountBodyItem(OwnerID(),207297)>=1 	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423185_1]" , "LuaS_423185_C_Ans", 0 )		--�аݳo���񦳥X�{�L�o���L�άO�֦��o���L���ͪ��H
	end
end

function LuaS_423185_D()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423185 ) == true and CountBodyItem(OwnerID(),207297)>=1 	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423185_1]" , "LuaS_423185_D_Ans", 0 )		--�аݳo���񦳥X�{�L�o���L�άO�֦��o���L���ͪ��H
	end
end

function LuaS_423185_E()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423185 ) == true and CountBodyItem(OwnerID(),207297)>=1 	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423185_1]" , "LuaS_423185_E_Ans", 0 )		--�аݳo���񦳥X�{�L�o���L�άO�֦��o���L���ͪ��H
	end
end

function LuaS_423185_A_Ans()
	SetSpeakDetail(OwnerID(),"[SC_423185_2]")		--������L�H�A�Ӥ��|���s�������ӷQ�޻��ڱ��J�A�ҳ]�������H
                         if (CheckFlag(OwnerID(),544017)==true ) and   (CheckFlag(OwnerID(),544020)==true  )  and  (CheckFlag(OwnerID(),544018)==true  ) then
                                    SetFlag(OwnerID() ,  544032 , 1 )
                         end
	SetFlag(OwnerID() , 543925 , 1 )
                        
end

function LuaS_423185_B_Ans()
	SetSpeakDetail(OwnerID(),"[SC_423185_3]")		--���L�H���O����A�A�o���L�ݰ_�ӹ��O�������ʪ��A...
                         if (CheckFlag(OwnerID(),543925)==true ) and   (CheckFlag(OwnerID(),544020)==true  )  and  (CheckFlag(OwnerID(),544018)==true  ) then
                                    SetFlag(OwnerID() ,  544032 , 1 )
                         end
	SetFlag(OwnerID() , 544017 , 1 )
end

function LuaS_423185_C_Ans()
	SetSpeakDetail(OwnerID(),"[SC_423185_4]")		--�o�Ӥ��L�ڴ��g�ݹL�A�b�ƤQ�~�e�A�ڴ��ݨ�L�@�ӯS�O���ͪ�...                       
                         if (CheckFlag(OwnerID(),544017)==true ) and   (CheckFlag(OwnerID(),554392)==true  ) and  (CheckFlag(OwnerID(),544020)==true  ) then
                                    SetFlag(OwnerID() ,  544032 , 1 )
                         end
	SetFlag(OwnerID() , 544018 , 1 )
end

function LuaS_423185_D_Ans()
	SetSpeakDetail(OwnerID(),"[SC_423185_5]")		--�o�O����H�ڱq�����ݹL�o�˪����L�A�ܻ��^��...
                         if (CheckFlag(OwnerID(),544017)==true ) and   (CheckFlag(OwnerID(),544020)==true  )  and  (CheckFlag(OwnerID(),544018)==true  ) then
                                    SetFlag(OwnerID() ,  544032 , 1 )
                         end
	SetFlag(OwnerID() ,  543925 , 1 )
end

function LuaS_423185_E_Ans()
	SetSpeakDetail(OwnerID(),"[SC_423185_6]")		--�ڦ��ݹL�M�o�ӫܹ������L��I�b�Y�ө]�ߪ��ɭ�...
                         SetFlag(OwnerID() , 544020 , 1 )
                         if (CheckFlag(OwnerID(),544017)==true ) and   (CheckFlag(OwnerID(),543925)==true  )  and  (CheckFlag(OwnerID(),544018)==true  ) then
                                    SetFlag(OwnerID() ,  544032 , 1 )
                         end
	SetFlag(OwnerID() , 544020 , 1 )
end


function LuaS_423185_CHECK() --���b�ˬd�I�W
	local Player
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AreaID = 821
	while 1 do
		Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if	Lua_ObjAreaCheck( ID , AreaID ) == true	then
				if	CheckAcceptQuest( ID , 423185 ) == true	and
					CheckFlag( ID , 543924 ) == false		and
					CheckBuff( ID , 506622) == false 		then
					AddBuff(ID , 506622 , 100 , -1 )  
					BeginPlot( ID , "LuaS_423185_CHECKRUN" , 0 )
				end
			end
		end		
		sleep( 20 )
	end
end

function LuaS_423185_CHECKRUN()
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423185_7]" , 0 )		--�P��X�{�ӸH���n���C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423185_7]" , 0 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423185_8]" , 0 )		--�u�V�|......�S���H���ܤF�C�o�O�򯫥d�����S���ڭ̪��g�@�ܡH
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423185_8]" , 0 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423185_9]" , 0 )		--�@�w�O���ѩM���ǸӦ������������I���q�L�̤@��o�̡A�����N�����u�����M���L�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423185_9]" , 0 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423185_10]" , 0 )		--�@�w�O�L�̫P�ϴ򯫥d�����S�ͮ�...
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423185_10]" , 0 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423185_11]" , 0 )		--��A�A��ı�o�۱q���ѵ����Q�����~�Ӫ̨Ө�o�̫�...
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423185_11]" , 0 )
	SetFlag(OwnerID() , 543924 , 1 )
	CancelBuff( OwnerID() , 506622 )	
end

------------------------------------------�̽u����NO.11
function LuaS_423186()				
	if	CheckAcceptQuest( OwnerID() ,423186 ) == true	and
		CheckFlag( OwnerID() , 544021 ) == false		then
			SetSpeakDetail(OwnerID(),"[SC_423186_0]")		--�]�o���۸O�W�����C�a�����۾�ӸO��...
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423186_1]" , "LuaS_423186_1", 0 )		--�]�γ\�A�ӽլd�@�U�o���۸O�C�^
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_423186_1()
	DisableQuest( TargetID() ,true )
	CloseSpeak( OwnerID() )
	SetFlag(OwnerID() , 544021 , 1 )
	BeginPlot( TargetID() , "LuaS_423186_2" , 0 )
end

function LuaS_423186_2()
	local PP = Lua_DW_CreateObj("flag" , 115447 ,780623 , 1 )		--�����X�{	
	local Ali = Lua_DW_CreateObj("flag" , 115448 ,780623 , 2 )			--�Ⱦ����X�{
	DisableQuest( PP ,true )
	DisableQuest( Ali ,true )
	MoveToFlagEnabled( PP , false )
	MoveToFlagEnabled( Ali , false )
	sleep(10)
	AdjustFaceDir( PP , Ali, 0 )
	AdjustFaceDir( Ali , PP, 0 )
	Yell( PP , "[SC_423186_2]" , 3 )				--�F�賣�˱o�t���h�F�H	
	PlayMotion( 	PP ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )	
	sleep(30)
	Yell( Ali , "[SC_423186_3]" , 3 )				--���t���h�F�A�s��o���Z���]���t���h...	
	PlayMotion( Ali,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )	
	sleep(30)
	Yell( Ali , "[SC_423186_4]" , 3 )				--�����o�O�ϥΧA�̴�D���O�q�A���X�Ӫ��F��C...	
	PlayMotion( Ali ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )	
	sleep(30)
	Yell( PP , "[SC_423186_5]" , 3 )				--��A�ڪ��D�F�I����ڷ|�^�h�^�������ѡC
	PlayMotion( 	PP ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )	
	sleep(30)
	Yell( Ali , "[SC_423186_6]" , 3 )				--��A�ڤ]�t���h�n���}�F�C
	PlayMotion(Ali ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	BeginPlot( Ali , "LuaS_423186_3" , 0 )
	LuaFunc_MoveToFlag( PP , 780623 , 3 ,  0 )	
	Delobj( PP)
	for i = 0 , 100 , 1 do
		if	CheckID(PP) == false	and
			CheckID(Ali) == false	then
			break
		end
		sleep( 20 )
	end
	DisableQuest( OwnerID() ,false )
end

function LuaS_423186_3()
	LuaFunc_MoveToFlag( OwnerID() , 780623 , 4 ,  0 )	
	Delobj( OwnerID())
end

------------------------------------------�̽u����NO.13
function LuaS_423188_USECHECK()
	if	CountBodyItem( OwnerID(), 207295 )>4	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423188_1]", 0 )		--�A�w�g�֦�5����ä�I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423188_1]", 0 )
		return	false
	elseif	CountBodyItem( OwnerID(), 207294 )<1	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423188_2]", 0 )		--�S���b����G��@�A�ؤl�L�k�ͪ��C
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423188_2]", 0 )
		return	false
	else
		return	true
	end
end

function LuaS_423188_USEOK()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register6 , OwnerID() )
	DelBodyItem( OwnerID() , 207294 , 1 )
	BeginPlot(TargetID(), "LuaS_423188_OKRUN" , 0 )
	return	true							
end

function LuaS_423188_OKRUN()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	local Mon = LuaFunc_CreateObjByOBj( 103908, OwnerID() )
	SetAttack( Mon , Player )
	CallPlot( Mon, "LuaFunc_Obj_Suicide" , 300 )
	AddToPartition( Mon , 0 )
	BeginPlot(Mon, "LuaS_423003_5" , 0 )							--���}�԰���R���ۤv
end

------------------------------------------------�̽u����NO.15
function LuaS_423190()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423190 ) == true		and	
		CheckFlag( OwnerID() ,544022 ) == false		and 
		CountBodyItem( OwnerID() , 207298 )	> 0		and
		CountBodyItem( OwnerID() , 207300 )	> 0		then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423190_0]" , "LuaS_423190_CHECK", 0 )		
	end
end

function LuaS_423190_CHECK()	
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	and
		CountBodyItem( OwnerID() , 207298 )	> 0		and
		CountBodyItem( OwnerID() , 207300 )	> 0		then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		writerolevalue( TargetID() , EM_RoleValue_Register6  , OwnerID() )
		DelBodyItem( OwnerID(), 207298, 1 )
		DelBodyItem( OwnerID(), 207300, 1 )
		BeginPlot( TargetID() , "LuaS_423190_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423190_1]")				
	end
end

function LuaS_423190_1()

	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	BeginPlot( OwnerID() , "LuaS_423190_CUT" , 0 )	

	ScriptMessage( Player , Player , 1 , "[SC_423190_2]" , 0 )		--�c���Ǩӧn�����n���C
	ScriptMessage( Player , Player , 0 , "[SC_423190_2]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_3]" , 0 )		--�O���ѭn�A�Ӫ��ܡH�L�ש�۫H�ڤF�C
	ScriptMessage( Player , Player , 0 , "[SC_423190_3]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_4]" , 0 )		--�ڸ�M�L���L���k�H���h�n�ߡA�b��p�L�̡I�L�N�O���֬۫H�C
	ScriptMessage( Player , Player , 0 , "[SC_423190_4]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_5]" , 0 )		--�{�b�L�ש�֥������D�F�C
	ScriptMessage( Player , Player , 0 , "[SC_423190_5]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_6]" , 0 )		--���b�����e�A�ڱo���ոէA�O���O�ȱo�H�઺�H�C
	ScriptMessage( Player , Player , 0 , "[SC_423190_6]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_7]" , 0 )		--�o�u�O�p�p������C
	ScriptMessage( Player ,Player  , 0 , "[SC_423190_7]" , 0 )
	sleep(30)
	ScriptMessage( Player , Player , 1 , "[SC_423190_8]" , 0 )		--�c���ǨӸ޲����ﭵ�C
	ScriptMessage( Player , Player , 0 , "[SC_423190_8]" , 0 )
	sleep(30)

	local Mon = Lua_DW_CreateObj("flag" , 103909 ,780623 , 10 )
	writerolevalue( Mon , EM_RoleValue_Register6  , Player )
	SetPlot(Mon,"dead","LuaS_423190_Dead",0 )
	SetAttack( Mon , Player )
	CallPlot( Mon, "LuaFunc_Obj_Suicide" , 300 )
	AddToPartition( Mon , 0 )
	BeginPlot(Mon, "LuaS_423003_5" , 0 )							--���}�԰���R���ۤv

	for i = 0 , 100 , 1 do
		if	CheckID(Mon) == false	then
			break
		end
		sleep( 20 )
	end
	if	CheckFlag( Player ,544022 ) == false		then
		ScriptMessage( Player , Player , 1 , "[SC_423190_9]" , 0 )			--�A���G���O�کҴ��ݪ��H��A�ڷ|�A�P���Ѷi��Q�סC
		ScriptMessage( Player , Player , 0 , "[SC_423190_9]" , 0 )				
	end
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_423190_Dead()	
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	if	CheckAcceptQuest( Player ,423190 ) ==  true		then
		SetFlag(Player , 544022 , 1 )
	end
end

function LuaS_423190_CUT()	
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player ,423190 ) == false		then
			break
		end
		sleep( 10 )
	end
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	LuaFunc_ResetObj( OwnerID() )
	
end

------------------------------------------------�̽u����NO.17


function LuaS_423192()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423192 ) == true		and
		CountBodyItem( OwnerID() , 207301) > 0 		and	
		CheckFlag( OwnerID() ,544027 ) == false		then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423192_1]" , "LuaS_423192_CHECK", 0 )	--(�N�F�������XXXX����W�C) 	
	end
end

function LuaS_423192_CHECK()	
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	and
		CountBodyItem( OwnerID() , 207301) > 0 		then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		writerolevalue( TargetID() , EM_RoleValue_Register6  , OwnerID() )
		BeginPlot( TargetID() , "LuaS_423192_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423192_2]")				
	end
end

function LuaS_423192_1()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	DelBodyItem( Player, 207301 , 1 ) 
	AddBuff( Player , 506762 , 1 , -1 )

	local HurtMon = Lua_DW_CreateObj("flag" , 115465 ,780624 , 1 )
	local Bag = Lua_DW_CreateObj("flag" , 115466 ,780624 , 2 )
	local Old = LuaFunc_CreateObjByOBj( 115464, OwnerID() )
	DisableQuest( HurtMon ,true )
	DisableQuest( Old ,true )
	MoveToFlagEnabled( HurtMon , false )
	MoveToFlagEnabled( Old , false )
	AdjustFaceDir( Old , HurtMon, 0 )
	AdjustFaceDir( HurtMon , Old, 0 )
	Yell( Old , "[SC_423192_3]" , 3 )			--�o�O�Ǫ��H�٬O�H���H
	PlayMotion(Old , ruFUSION_ACTORSTATE_PARRY_BOW  )
	sleep(30)
	Yell( HurtMon , "[SC_423192_4]" , 3 )			--���K�K�O�ڡK�K�O�ڰڡK�K
	sleep(30)
	Yell( Old , "[SC_423192_5]" , 3 )			--���|�O�A�H�����S�H
	PlayMotion(Old ,  ruFUSION_ACTORSTATE_EMOTE_IDLE1  )
	local PP = Lua_DW_CreateObj("flag" , 115467 ,780624 , 3 )
	DisableQuest( PP ,true )
	MoveToFlagEnabled( PP , false )
	LuaFunc_MoveToFlag( PP , 780624 , 4 ,  0 )	
	AdjustFaceDir( PP , Old, 0 )
	AdjustFaceDir( Old , PP, 0 )
	Yell( PP , "[SC_423192_6]" , 3 )			--���ѡA�ڭ��h�䨩��E�R�L�y...
	sleep(30)
	Yell( Old , "[SC_423192_7]" , 3 )			--�n�A�ڪ��D�F�C
	PlayMotion(Old ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
	LuaFunc_MoveToFlag( PP , 780624 , 3 ,  0 )	
	Delobj( PP)

	Yell( HurtMon , "[SC_423192_8]" , 3 )			--�ڭ̡K�K�ڭ̳��Q���k�H�K�K���F�F...
	AdjustFaceDir( Old , HurtMon, 0 )	
	sleep(30)
	Yell( HurtMon , "[SC_423192_9]" , 3 )
	sleep(30)
	Yell( HurtMon , "[SC_423192_10]" , 3 )
	sleep(30)
	Yell( Old , "[SC_423192_11]" , 3 )
	PlayMotion(Old ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep(20)
	Yell( HurtMon , "[SC_423192_12]" , 3 )
	CastSpell( HurtMon , HurtMon , 492224 )
	sleep(30)	
	SetDefIdleMotion(HurtMon,ruFUSION_MIME_DEATH_LOOP)
	sleep(30)
	Delobj( HurtMon)

	if	GetDistance(Player , OwnerID() ) < 150		and
		CheckAcceptQuest( Player ,423192 ) == true	and
		CheckBuff( Player , 506762) == true		then
		SetFlag(Player , 544027 , 1 )
	end 
	CancelBuff( Player , 506762 )	
	Delobj( Bag)
	Delobj( Old)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end


------------------------------------------------�̽u����NO.18(����)

function LuaS_423193_USECHECK()
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0		and
		CountBodyItem( OwnerID() , 207293) > 0 			then
		return	true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--�ؼЦ��L��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		return	false
	end
end

function LuaS_423193_USEOK()
	DelBodyItem( OwnerID() , 207293 , 1 )
	writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
	WriteRoleValue ( TargetID() , EM_RoleValue_Register4 , OwnerID() )
	BeginPlot(TargetID(), "LuaS_423193_Main" , 0 )	
	return	true							
end

function LuaS_423193_Main()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	local PP = Lua_DW_CreateObj("flag" , 115530 ,780624 , 5 )
	DisableQuest( PP ,true )
	MoveToFlagEnabled( PP , false )
	LuaFunc_MoveToFlag( PP , 780624 , 6 ,  0 )	
	Yell( PP , "[SC_423193_1]" , 3 )
	PlayMotionEX( PP , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
	Yell( PP , "[SC_423193_2]" , 3 )
	sleep(30)
	Yell( PP , "[SC_423193_3]" , 3 )
	sleep(30)
	Yell( PP , "[SC_423193_4]" , 3 )
	sleep(30)
	Yell( PP , "[SC_423193_5]" , 3 )
	sleep(30)
	Yell( PP , "[SC_423193_6]" , 3 )
	PlayMotion( PP, ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(30)
	LuaFunc_MoveToFlag( PP , 780624 , 5 ,  0 )
	Delobj( PP)
	if	GetDistance(Player , OwnerID() ) < 150		and
		CheckAcceptQuest( Player ,423193 ) == true	then
		SetFlag(Player , 544028 , 1 )
		SetFlag(Player , 544029 , 1 )
	end
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end












