-------------------423320���ѥv��------------------------------
function LuaS_423320()		----player => owner   ;  ���βy => target	
	SetPlot(OwnerID() , "range","LuaS_423320_1_1",200)
end

function LuaS_423320_not()		----player => owner   ;  ���βy => target	
	SetPlot(OwnerID() , "range","LuaS_423320_0",200)
end

function LuaS_423320_0()		----player => owner   ;  ���βy => target	
	if 	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	----����423320
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID() , 544215) == false	and	----�S������flag
		CheckBuff(OwnerID() , 506972) == false	then	----�S���t��buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	 then --�t��,���t��buff
				BeginPlot(TargetID(),"LuaS_423320_2",1)
		else									----buzy then ������buff
				BeginPlot(TargetID(),"LuaS_423320_1",1)
		end


	end 
end

function LuaS_423320_1()		----player => target   ;  ���βy => Owner	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 		-----�ᮦ�������b�o�̵��L�A�����b�o�̦h���@�|�C
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),506977,1,60)				---��������BUFF
end

function LuaS_423320_2()
	--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff(TargetID(),506972,1,-1)	
	
	Local buzy = 1
	while buzy == 1 do	

		local Player = SearchRangePlayer ( OwnerID() , 200 )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506977) == true	then
				CancelBuff( player[i]  , 506977  ) 	--
				AddBuff(player[i],506972,1,-1)
			
			end
			if	CheckBuff(player[i] , 506972) == true	then
				ScriptMessage( player[i] , player[i] , 0 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 		-----�Ať���᭱�ǨӤ��椣�}���}�B�n�C
				ScriptMessage( player[i] , player[i] , 1 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 				
			end
		end
		Local fen =    Lua_DW_CreateObj("flag" ,115659,780678,1)
		CallPlot(fen,"LuaS_423320_cancel",OwnerID(),200)	---���ȥ��ѱ����ˬd
		DisableQuest( fen , true )
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			---�Ψ���
		sleep(10)
		DW_MoveToFlag(fen,780678 , 2,0 ,1)		
		yell(fen,"[SC_423320_24]",3)	---�H�����Ϫ�[$playername]�A�ڱN�a�A�i�J���F����ҡA�~���Ƕ��˪L�A���O�ڭ̪����w�C
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 0 )		---�ζ]��
		sleep(10)
		DW_MoveToFlag(fen,780678 , 3,0 ,1)
		DW_MoveToFlag(fen,780678 , 14,0 ,1)
		DW_MoveToFlag(fen,780678 , 4,0 ,1)
		DW_MoveToFlag(fen,780678 , 5,0 ,1)
		DW_MoveToFlag(fen,780678 , 6,0 ,1)
		DW_MoveToFlag(fen,780678 , 7,0 ,1)
		local fen2 = LuaFunc_SearchNPCbyOrgID( fen,115658 , 500 , 0)		---���ʨ�L��Ӫ���m
		local x = ReadRoleValue ( fen2, EM_RoleValue_X)
		local y = ReadRoleValue ( fen2, EM_RoleValue_Y)
		local z = ReadRoleValue ( fen2, EM_RoleValue_Z)
		DW_WaitMoveTo( fen , x , y, z)	
		sleep(10)

		for i = 0 , table.getn(Player) do								---����BUFF�����a�i�H�o��X��
			if	CheckBuff(player[i] , 506972) == true	and	CheckAcceptQuest( player[i] , 423320 ) == true		then
				SetFlag(player[i],544215,1)	--give mission flag
				CancelBuff( player[i]  , 506972  ) 	--
			end
		end
		delobj(fen)
--------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() ,200 )			----Ĳ�o�I���񦳪��a������BUFF,BUZY=1,���ƺt��
		for i = 0 , table.getn(Player3) do
			if	CheckFlag( player3[i] , 544215) == false	and	
				CheckAcceptQuest( player3[i] , 423320 ) == true	and	
				CheckBuff(player3[i] , 506977) == false	and	
				CheckCompleteQuest( player3[i] , 423354 ) == true	then
				AddBuff(player3[i],506977,1,-1)
			end			
			if	CheckBuff(player3[i] , 506977) == true	and	CheckAcceptQuest( player3[i] , 423320 ) == true		then
				buzy = 1
			end
		end
		--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end

function LuaS_423320_cancel(boss,range)
	local Player = SearchRangePlayer ( boss , range )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(Player) do
			if	GetDistance( player[i] , OwnerID() ) > range	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 		-----�Z�����H���ؼФӻ��A�Ц^��_�I���աC
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 				
			end
			if	ReadRoleValue( player[i] , EM_RoleValue_AttackTargetID ) ~= 0	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 		-----�H�Ϭ��w���ȥ��ѡA�Ц^��_�I���աC
				ScriptMessage( player[i] , player[i]  , 1 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423320 ) == false	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--				
			end
			if	CheckBuff(player[i] , 506972) == true	then
				AddBuff(player[i],506976,1,2)	
			end
		end
	end
end

function LuaS_115635()
--	if 	CheckCompleteQuest(OwnerID(),423357)==true  then
--			SetSpeakDetail( OwnerID(), "[SC_423353_99]"  ) 
--	else
		LoadQuestOption( OwnerID() )		--423320
		if 	CheckCompleteQuest(OwnerID(),423353)==true  then
			SetSpeakDetail( OwnerID(), "[SC_423353_99]"  ) 
		end
		if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	 CountBodyItem( OwnerID(), 207740)>=1 		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423353_1]","LuaS_423353_1",0)	--[115635]...
		end
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_5]","LuaS_423320_0_1",0)	--���j���t��A�����~��l���۵M���O�H
		end	
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == true	and
			CheckFlag( OwnerID(),544232 ) == false	and	CountBodyItem ( OwnerID(), 207457 ) > 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--�����ڦ^�w�溸�j�L�C
		end
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == true	and
			CheckFlag( OwnerID(),544232 ) == false	and	CountBodyItem ( OwnerID(), 207457 ) == 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_21]","LuaS_423320_0_reget",0)	--�A���ڪ����l�򥢤F...
		end	
		if	(CheckAcceptQuest(OwnerID(),423355)==true )	and	( CheckCompleteQuest( OwnerID(),423355)==false)   and CheckFlag( OwnerID() , 544261 ) ==false	then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423355_0]","LuaS_423355_1",0)		--���F�����ڨ�...
		end	
--	end
end

function LuaS_423320_0_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_6]")			---���F�����M���A����Ť�r�`...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_7]","LuaS_423320_0_2",0)	--���w�溸�j�L�{�b�]����z���v�T�A�C�C�\��F�C
	end
end

function LuaS_423320_0_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_8]")			---���D�^���@�A�Ʊ���½̸�...
		if	CheckAcceptQuest ( OwnerID()   , 423320 )	 == true	then
			SetFlag(OwnerID(),544216,1)
			GiveBodyItem ( OwnerID(), 207457, 1 )	
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--�����ڦ^�w�溸�j�L�C
	end
end

function LuaS_423320_0_reget()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_22]")			---�򥢤F�ܡH�]�u�O�k��^��...
		if	CheckAcceptQuest ( OwnerID()   , 423320 )	 == true	then
			GiveBodyItem ( OwnerID(), 207457, 1 )	
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--�����ڦ^�w�溸�j�L�C
	end
end
function LuaS_423320_0_3()
	CloseSpeak(OwnerID())					---�^��w�溸
	AddBuff(OwnerID(),506976,1,3)
 	SetPosByFlag( OwnerID()  , 780675 , 1 )
end

function LuaS_115645()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	CountBodyItem ( OwnerID(), 207457 ) > 0	then	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_19]","LuaS_423320_0_getflag",0)	--(�^���~���Ƕ��˪L�ҵo�ͪ��Ʊ�)
	end
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---�H������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_0_4",0)	--�а��U�h���A�ԮL�R�a�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	�а��U�h���A�ԮL�R�a�C		
		end
	end	

	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +2) == 0	then		---�H������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_1_3",0)	--�а��U�h���A�ԮL�R�a�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	�а��U�h���A�ԮL�R�a�C		
		end
	end	
end

function LuaS_423320_0_getflag()
	SetSpeakDetail(OwnerID(),"[SC_423320_20]")	---�F���n�A�M�h�A�o��@�Ӧw�溸�j�L�N���|�A������F���M�`...
	SetFlag(OwnerID(),544232,1)
	DelBodyItem(OwnerID(),207457,1)
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---�H������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_0_4",0)	--�а��U�h���A�ԮL�R�a�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	�а��U�h���A�ԮL�R�a�C		
		end
	end	
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +2) == 0	then		---�H������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_1_3",0)	--�а��U�h���A�ԮL�R�a�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	�а��U�h���A�ԮL�R�a�C		
		end
	end		
end
function LuaS_423320_0_4()
	CloseSpeak(OwnerID())	
	BeginPlot(TargetID(),"LuaS_423320_0_5",1)	
end

function LuaS_423320_false()
	SetSpeakDetail(OwnerID(),"[SC_423320_11]")	---�S�Q��Ʊ��o�򶶧Q�A���u�̳o�ǥi���٬O���H���H�o...
end

function LuaS_423320_0_5()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )	---
	AddBuff( TargetID()  , 506973 , 1 , -1 ) 		
	local checker = Lua_DW_CreateObj("obj",115672,OwnerID())   --fen���H
	local tony = Lua_DW_CreateObj("obj",115660,OwnerID())   --fen���H		
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID(),115647 , 300 , 0)
	local lasha = Lua_DW_CreateObj("obj",115668,NPC)   --lasha���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115646 , 300 , 0)
	local ith = Lua_DW_CreateObj("obj",115698,NPC1)   --ith���H	
	DisableQuest( tony , true )
	DisableQuest( lasha , true )	
	DisableQuest( ith , true )
	WriteRoleValue ( checker , EM_RoleValue_Register +1,1 )	---
	CallPlot(checker,"LuaS_Check_noquest_single", 1 , 1 , 423320 , 506973,TargetID(),OwnerID(),150)		---�����ȩζZ���ӻ��ߨ����BUFF
	MoveToFlagEnabled(tony,false)
	AdjustFaceDir( tony ,lasha, 0 )	
	sleep(5)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(tony,"[SC_423320_12]",3)	---�ԮL�R�A�o�O�t��g�J�������l...
	sleep(40)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	AdjustFaceDir( lasha ,tony, 0 )	
	sleep(5)
	yell(lasha,"[SC_423320_13]",3)		---�ګ�򪾹D���O�u�O���A�֨Ӱ��ҡI
	
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
	
	local fen = Lua_DW_CreateObj("flag" ,115661,780679,1)		---fen���H
	DisableQuest( fen , true )
	sleep(10)
	yell(fen,"[SC_423320_14]",3)		---�ڨӧ@�ҡC
	sleep(10)
	WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			
	sleep(10)
	yell(lasha,"[SC_423320_26]",3)		---�Ӧ������F�H
	DW_MoveToFlag(fen,780679 , 2,0 ,1)	
	sleep(10)
	AdjustFaceDir( fen ,tony, 0 )		
	sleep(5)
	AdjustFaceDir( tony ,fen, 0 )	
	sleep(5)
	PlayMotion( fen,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	yell(fen,"[SC_423320_15]",3)		---�d�Ժ�?�d�ĩi���U�A���l�Х浹�ڡC
	sleep(40)
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	DW_MoveToFlag(fen,780679 , 3,0 ,1)	
	AdjustFaceDir( tony ,fen, 0 )	
	sleep(5)
	AdjustFaceDir( fen ,lasha, 0 )	
	sleep(5)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�U��	
	local shine = Lua_DW_CreateObj("flag" ,115671,780679,4)		---shine���H
	local shine2 = Lua_DW_CreateObj("flag" ,115671,780679,4)		---shine���H
	Lua_ObjDontTouch( shine) 	---����Ishine���H	
	Lua_ObjDontTouch( shine2) 	---����Ishine2���H		
	CallPlot(shine,"LuaS_423320_windmove")
	CallPlot(shine2,"LuaS_423320_windmove")
	CastSpell(shine2,shine,495606)	
	sleep(20)	
	CastSpell(shine,shine,495606)	
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�U��
	sleep(20)	
	AdjustFaceDir( fen ,lasha, -20 )	
	AdjustFaceDir( tony ,fen,-20 )	
	AdjustFaceDir( ith ,fen,-20 )	
	AdjustFaceDir( lasha ,fen,20 )
	if	CheckBuff(TargetID() , 506973 ) == true	and	CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_16]" ,  "0xFFFFFF00" ) 	---�w�溸�j�L�j�_�@�ѲM���A���H���M��n�C
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_16]" ,  "0xFFFFFF00" )		
	end
	sleep(20)
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( fen ,lasha, 20 )				---�Pı�۵M����
	AdjustFaceDir( tony ,fen,20 )	
	AdjustFaceDir( ith ,fen,20 )	
	AdjustFaceDir( lasha ,fen,-20 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, 90 )	
	AdjustFaceDir( tony ,fen,90 )	
	AdjustFaceDir( ith ,fen,90 )	
	AdjustFaceDir( lasha ,fen,-50 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, -10 )	
	AdjustFaceDir( tony ,fen,-10 )	
	AdjustFaceDir( ith ,fen,-10 )	
	AdjustFaceDir( lasha ,fen,20 )
	sleep(20)		
	AdjustFaceDir( fen ,lasha,0 )	
	AdjustFaceDir( tony ,fen,0 )	
	AdjustFaceDir( ith ,fen,0 )	
	AdjustFaceDir( lasha ,fen,0 )
	yell(fen,"[SC_423320_23]",3)		---�p���@�Ӧw�溸�j�L�N���A���h�۵M���O�C
	sleep(40)	
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	yell(fen,"[SC_423320_17]",3)		---�ӧڱN�d�b�w�溸���v����L���줣����q�v�T�����F...
	sleep(50)
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	yell(lasha,"[SC_423320_18]",3)		---��...�n�I�p�G���F�A���z�A�w�溸�j�L���ͺA�A�A�N���ۧa�C
	sleep(30)
	yell(fen,"[SC_423320_25]",3)		---�P�­����A���@�t�_���F�ҳy�����L���A������i��F�C
	sleep(20)
	DW_MoveToFlag(fen,780679 , 1,0 ,1)	
	AdjustFaceDir( tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha,0 )		
	if	CheckBuff(TargetID() , 506973 ) == true	and		CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		SetFlag(TargetID(),544217,1)
	end
	delobj(tony)
	delobj(lasha)
	delobj(fen)
	delobj(ith)
	delobj(checker)
	CancelBuff( TargetID()  , 506973  ) 	--
	WriteRoleValue ( checker , EM_RoleValue_Register +1,0 )	---
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
end

function LuaS_423320_windmove()
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	DW_MoveToFlag(OwnerID(),780679 , 5,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 6,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 7,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 8,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 5,0 ,1)
	DW_MoveToFlag(OwnerID(),780679 , 6,0 ,1)
	DW_MoveToFlag(OwnerID(),780679 , 1,0 ,1)
	delobj(OwnerID())
end


---------------423320�S�ѥv��---------------------

function LuaS_423320_1_1()
	if 	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	----����423320
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID() , 544215) == false	and	----�S������flag
		CheckBuff(OwnerID() , 506974) == false	then	----�S���t��buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +3) == 0	then	----not buzy then �t��,���t��buff
				BeginPlot(TargetID(),"LuaS_423320_1_2",1)
		else									----buzy then ������buff
				BeginPlot(TargetID(),"LuaS_423320_1_wait",1)
		end

	end 
end

function LuaS_423320_1_2()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +3,1 )
	AddBuff(TargetID(),506974,1,-1)	

	Local buzy = 1
	while buzy == 1 do	
		Local fen =    Lua_DW_CreateObj("flag" ,115662,780678,1)
		CallPlot(fen,"LuaS_423320_1_cancel",OwnerID(),200)
		local Player = SearchRangePlayer ( OwnerID() , 200 )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506978) == true	then
				CancelBuff( player[i]  , 506978  ) 	--
				AddBuff(player[i],506974,1,-1)
			
			end
			if	CheckBuff(player[i] , 506974) == true	then
				ScriptMessage( player[i] , player[i] , 0 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 		-----�Ať���᭱�ǨӤ��椣�}���}�B�n�C
				ScriptMessage( player[i] , player[i] , 1 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 				
			end
		end

		DisableQuest( fen , true )
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			
		sleep(10)
		DW_MoveToFlag(fen,780678 , 2,0 ,1)		
		yell(fen,"[SC_423320_24]",3)		---�H�����Ϫ�[$playername]�A�ڱN�a�A�i�J���F����ҡA�~���Ƕ��˪L�A���O�ڭ̪����w�C
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 0 )		
		sleep(10)
		Local ant =    Lua_DW_CreateObj("flag" ,115664,780678,3)
		DisableQuest( ant , true )
		yell(ant,"[SC_423320_27]",3)		---�O�A�e�i�F�A�Ӧ۹F�ԥ������M�h�C
		DW_MoveToFlag(fen,780678 , 10,0 ,1)
		yell(fen,"[SC_423320_28]",3)		---���I�o...���i��I
		sleep(10)	
		WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )	
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )		
		sleep(10)		
		yell(ant,"[SC_423320_29]",3)		---�T��A���Ӹܪ��A����Ȥ���O�ѨM���D�A�~�������F�C
		sleep(5)
		DW_MoveToFlag(ant,780678 , 11,0 ,1)	
		AdjustFaceDir( fen ,ant, 0 )
		PlayMotion( ant,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
		yell(ant,"[SC_423320_30]",3)		---[$playername]�A�o�O�t��g�J��������...
		local time=0
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506974) == true	then
				AdjustFaceDir( ant ,player[i], 0 )
				sleep(8)
				time = time + 8		
			end
		end		
		if	time < 45	then
			sleep(40-time)
		end		
		yell(ant,"[SC_423320_31]",3)			---�ѤU���O���F�ڪ����D�A�������F�����A���M�t�_�ڤH�ҥǤU�����~�C
		sleep(40)
		yell(ant,"[SC_423320_32]",3)			---�]���Ц^�a�A�Ӧ۹F�ԥ������M�h�C
		for i = 0 , table.getn(Player) do				---��BUFF�B�����Ȫ����a�o��X��
			if	CheckBuff(player[i] , 506974) == true	and	CheckAcceptQuest( player[i] , 423320 ) == true		then
				SetFlag(player[i],544215,1)	--give mission flag
				SetFlag(player[i],544216,1)	--give mission flag
				GiveBodyItem ( player[i], 207457, 1 )	
			end
		end
		sleep(35)
		AdjustFaceDir( ant ,fen, 0 )			---
		sleep(5)
		yell(ant,"[SC_423320_33]",3)			---�~�������F�A�^���N�^���t��g�J�����l��C
		sleep(30)
		CallPlot(ant,"LuaS_423320_ant_move")
		sleep(20)
		DW_MoveToFlag(fen,780678 , 12,0 ,1)		

--------------------
		for i = 0 , table.getn(Player) do				---��BUFF�B�����Ȫ����a�o��X��
			if	CheckBuff(Player[i] , 506974) == true	and	CheckAcceptQuest( Player[i] , 423320 ) == true		then
				CancelBuff( Player[i]  , 506974  ) 	--
			end
		end
		delobj(fen)
		delobj(ant)
--------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() , 200 )			----Ĳ�o�I���񦳪��a������BUFF,BUZY=1,���ƺt��
		for i = 0 , table.getn(player3) do
			if	CheckFlag(player3[i] , 544215) == false	and	CheckAcceptQuest( player3[i] , 423320 ) == true	and	CheckBuff(player3[i] , 506978) == true	then
				AddBuff(player3[i],506974,1,-1)
			end			
			if	CheckBuff(player3[i] , 506978) == true	and	CheckAcceptQuest( player3[i] , 423320 ) == true		then
				buzy = 1
			end
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +3,0)
end

function LuaS_423320_1_wait()
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 		-----�ᮦ�������b�o�̵��L�A�����b�o�̦h���@�|�C
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),506978,1,60)				---��������BUFF
end

function LuaS_423320_1_cancel(boss,range)
	local player = SearchRangePlayer ( boss , range )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(player) do
			if	GetDistance( player[i] , boss ) > range	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
			end
			if	ReadRoleValue( player[i] , EM_RoleValue_AttackTargetID ) ~= 0	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 		-----�H�Ϭ��w���ȥ��ѡA�Ц^��_�I���աC
				ScriptMessage( player[i] , player[i]  , 1 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423320 ) == false	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--				
			end
		end
	end
end

function LuaS_423320_ant_move()
	DW_MoveToFlag(OwnerID(),780678 , 3,0 ,1)		
end
function LuaS_423320_1_3()
	CloseSpeak(OwnerID())	
	BeginPlot(TargetID(),"LuaS_423320_1_4",1)	
end
function LuaS_423320_1_4()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,1 )	---
	AddBuff( TargetID()  , 506975 , 1 , -1 ) 		
	local tony = Lua_DW_CreateObj("obj",115665,OwnerID())   --fen���H		
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID(),115647 , 300 , 0)
	local lasha = Lua_DW_CreateObj("obj",115669,NPC)   --fen���H
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115646 , 300 , 0)
	local ith = Lua_DW_CreateObj("obj",115699,NPC1)   --ith���H	
	DisableQuest( tony , true )
	DisableQuest( lasha , true )	
	DisableQuest( ith , true )
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 2 , 1 , 423320 , 506975,TargetID(),OwnerID(),150)
	MoveToFlagEnabled(tony,false)
	AdjustFaceDir( tony ,lasha, 0 )	
	sleep(5)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(tony,"[SC_423320_12]",3)			---�ԮL�R�A�o�O�t��g�J�������l...
	sleep(40)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(lasha,"[SC_423320_13]",3)			---�ګ�򪾹D���O�u�O���A�֨Ӱ��ҡI
	
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
			
	local fen = Lua_DW_CreateObj("flag" ,115666,780679,1)		---fen���H
	local ant = Lua_DW_CreateObj("flag" ,115667,780679,9)		---fen���H
	DisableQuest( fen , true )
	DisableQuest( ant , true )
	sleep(10)
	yell(ant,"[SC_423320_14]",3)			---�ڨӧ@�ҡC
	sleep(10)
	WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )	
	WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )			
	sleep(10)
	yell(lasha,"[SC_423320_34]",3)			---�ͽáI
	sleep(20)
	yell(ant,"[SC_423320_35]",3)			---�ЧO�İʡA�~���������A�ڬO���F���A�w�S�Jù�C�{�b�ȥN��~���Ǻ��F�V�w�溸����F�p�N�C
	CallPlot(fen,"DW_MoveToFlag",fen,780679,10,0,1)
	DW_MoveToFlag(ant,780679 , 2,0 ,1)	
	sleep(10)
	AdjustFaceDir( ant ,tony, 0 )		
	sleep(5)
	AdjustFaceDir( tony ,ant, 0 )	
	sleep(5)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	PlayMotion( ant,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	yell(ant,"[SC_423320_36]",3)			---�~�����H���A���l�Х浹�ڡC
	sleep(40)
	DW_MoveToFlag(ant,780679 , 3,0 ,1)	
	AdjustFaceDir( tony ,ant, 0 )	
	sleep(5)
	AdjustFaceDir( ant ,lasha, 0 )	
	sleep(5)
	PlayMotion( ant ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�U��	
	local shine = Lua_DW_CreateObj("flag" ,115672,780679,4)		---shine���H
	local shine2 = Lua_DW_CreateObj("flag" ,115672,780679,4)		---shine���H
	Lua_ObjDontTouch( shine) 	---����Ishine���H	
	Lua_ObjDontTouch( shine2) 	---����Ishine2���H		
	CallPlot(shine,"LuaS_423320_windmove")
	CallPlot(shine2,"LuaS_423320_windmove")
	CastSpell(shine2,shine,495606)	
	sleep(20)	
	CastSpell(shine,shine,495606)	
	PlayMotion( ant ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�U��
	sleep(20)	
	AdjustFaceDir( fen ,lasha, -20 )	
	AdjustFaceDir( tony ,fen,-20 )
	AdjustFaceDir( ith ,fen,-20 )		
	AdjustFaceDir( lasha ,fen,20 )
	if	CheckBuff(TargetID() , 506975 ) == true	and	CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_16]" ,  "0xFFFFFF00" ) 	---�w�溸�j�L�j�_�@�ѲM���A���H���M��n�C
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_16]" ,  "0xFFFFFF00" )		
	end
	sleep(20)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	AdjustFaceDir( fen ,lasha, 20 )			---�Pı�۵M����
	AdjustFaceDir( tony ,fen,20 )	
	AdjustFaceDir( ith ,fen,20 )	
	AdjustFaceDir( lasha ,fen,-20 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, 90 )	
	AdjustFaceDir( tony ,fen,90 )	
	AdjustFaceDir( ith ,fen,90 )	
	AdjustFaceDir( lasha ,fen,-50 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, -10 )	
	AdjustFaceDir( tony ,fen,-10 )	
	AdjustFaceDir( ith ,fen,-10 )	
	AdjustFaceDir( lasha ,fen,20 )
	sleep(20)		
	AdjustFaceDir( fen ,lasha,0 )	
	AdjustFaceDir( tony ,fen,0 )
	AdjustFaceDir( ith ,fen,0 )		
	AdjustFaceDir( lasha ,fen,0 )
	yell(ant,"[SC_423320_23]",3)				---�p���@�Ӧw�溸�j�L�N���A���h�۵M���O�C
	sleep(40)	
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	yell(ant,"[SC_423320_37]",3)				---�w�溸�����A�p���~���Ǻ��F�����D�|���ѨM�Ʊ��N���_�o���@�ѡA�Юe�ڥ��i�h�ɦ��B�z�C
	sleep(50)
	yell(fen,"[SC_423320_17]",3)				---�ӧڱN�d�b�w�溸���v����L���줣����q�v�T�����F�A�p�G�t��g�J�������l���ġA�@���B�m�C
	sleep(50)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	yell(lasha,"[SC_423320_18]",3)				---��...�n�I�p�G���F�A���z�A�w�溸�j�L���ͺA�A�A�N���ۧa�C
	sleep(30)
	yell(fen,"[SC_423320_25]",3)				---�P�­����A���@�t�_���F�ҳy�����L���A������i��F�C
	sleep(20)
	CallPlot(ant,"DW_MoveToFlag",ant,780679,9,0,1)
	DW_MoveToFlag(fen,780679 , 1,0 ,1)	
	AdjustFaceDir( ith ,lasha,0 )	
	AdjustFaceDir( tony ,lasha, 0 )		
	if	CheckBuff(TargetID() , 506975 ) == true	and		CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		SetFlag(TargetID(),544217,1)
	end
	delobj(tony)
	delobj(lasha)
	delobj(fen)
	delobj(ant)
	delobj(ith)
	CancelBuff( TargetID()  , 506975  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
end
