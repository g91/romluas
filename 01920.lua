------------423327------------------
function LuaS_115764()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if CheckAcceptQuest( OwnerID() , 423327 ) == true  and	CheckFlag( OwnerID(),544229 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423327_1]","LuaS_423327_1",0)	--�ڭ̭n��ԮL�R������O�H
	end	--<=423327��
end
	
function LuaS_423327_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423327_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423327_2]")			---�ԮL�R��~���n���L�R�@�R...	
	end
end

function LuaS_423327_false()
	SetSpeakDetail(OwnerID(),"[SC_423327_2]")			---�ԮL�R��~���n���L�R�@�R...
end		
	
function LuaS_423327_2()
	AddBuff( TargetID()  , 506998 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423327 , 506998,TargetID(),OwnerID(),150)		
	
	local tony = Lua_DW_CreateObj("obj",115770,OwnerID())   --tony���H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115765  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115771,NPC)   --ith���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115772,NPC1)   --lasha���H
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )	
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	AdjustFaceDir( lasha ,tony, 0 )
	Yell(tony,"[SC_423327_3]",3)						---�ԮL�R...�O�󪺨Ƨګܩ�p...�����H��,�o�L�k����o�بƱ�...
	sleep(35)	
	Yell(tony,"[SC_423327_4]",3)						---�ڥH�H���������O��,���藍�|���o�بƱ��A���o�͡I
	sleep(15)	
	if	CheckBuff( TargetID() , 506998 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423327_5]", "0xff8080ff" )--(�ԮL�R�������a�ۼ���)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423327_5]",  "0xff8080ff" )--
	end
	sleep(20)
	Yell(lasha,"[SC_423327_6]",3)						---�O�ҡH�A�Τ���O��?�ΧA���z���T��������,�٬O�s��F���|���_�Ӫ����u?���D�A�i�H����N�H���Z�Ҽڴ�.�d�ĩi���˥ΥͩR�O�ҶܡI
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(15)	
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)		
	Yell(ith,"[SC_423327_7]",3)							---�ԮL�R,�����H���L§!!
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(25)
		
	if	CheckBuff(TargetID() , 506998 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423327_8]",3)						---....�O���A�ڥΥͩR���A�O�ҡC
	sleep(15)
	AdjustFaceDir( ith ,tony, 0 )
	sleep(5)
	Yell(ith,"[SC_423225_3]",3)							---���U�I
	sleep(20)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell(lasha,"[SC_423327_9]",3)						---�A�ƤF�ܡI�~�M�p�������ۤv���ͩR�A���A�٬O�H����N�C�ӥO�ڥ���F�I
	sleep(35)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(lasha,"[SC_423327_10]",3)						---�u�X�h!�w�溸�����w��ƺ��������H���p���I
	sleep(10)
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(5)
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_POINT)				
	Yell(ith,"[SC_423322_7]",3)							---�ԮL�R�I
	DW_MoveToFlag(ith,780679 , 11 ,0 ,1)		
	sleep(15)
		
	if	CheckBuff(TargetID() , 506998 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(tony,"[SC_423327_11]",3)						---�����S��...�ڷ|�ݦb�p�w�d��a���ݧA�������C
	AdjustFaceDir( ith ,tony, 0 )
	sleep(15)
	AdjustFaceDir( ith ,lasha, 0 )		
	DW_MoveToFlag(tony,780679 , 3 ,0 ,1)	
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
	CallPlot(tony,"MK_MoveToFlag_End",tony,780679 , 1,0 ,1)
	sleep(15)
	DW_MoveToFlag(ith,780679 , 3 ,0 ,1)	
	MK_MoveToFlag_End(ith,780679 , 1 ,0 ,1)
	sleep(20)	
	AdjustFaceDir( lasha ,TargetID(), 0 )	
	sleep(5)
	Yell(lasha,"[SC_423327_12]",3)						---�F�ԥ������M�h�A�ڦ��Ǹܭn��A���C
	delobj(lasha)
	if	CheckBuff( TargetID() , 506998 ) == true	then
		CancelBuff( TargetID()  , 506998  ) 	--
		SetFlag(TargetID(),544229,1)
	end	
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )		
end
-------------------------423329-----------------------------
function LuaS_115773()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if CheckAcceptQuest( OwnerID() , 423329 ) == true  and	CheckFlag( OwnerID(),544230 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423329_1]","LuaS_423329_1",0)	--��Z�g�^���A�ڭ̾D����ܤF�A���U������ܡH
	end	--<=423329��
	if	CheckAcceptQuest( OwnerID() , 423330 ) == true	and	CheckFlag( OwnerID(),544231 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423330_1]","LuaS_423330_3",0)		---���U�Q���ƻ�O�H
	end	--<=423321��	
end

function LuaS_423329_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423329_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423329_2]")			---�|�O�֩O�H�ڬ۫H�ԮL�R����F�ڤ��|�V�ڥX��....
	end
end

function LuaS_423329_false()
	SetSpeakDetail(OwnerID(),"[SC_423329_2]")			---�|�O�֩O�H�ڬ۫H�ԮL�R����F�ڤ��|�V�ڥX��....
end	

function LuaS_423329_2()
	AddBuff( TargetID()  , 507072 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423327 , 506998,TargetID(),OwnerID(),150)		
	local tony = Lua_DW_CreateObj("obj",115775,OwnerID())   --tony���H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115774  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115776,NPC)   --ith���H	
	local derak = Lua_DW_CreateObj("flag" ,115777,780681,1)		---derak���H
	MoveToFlagEnabled(derak,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( derak , true )		
	sleep(20)
	WriteRoleValue(derak , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	Yell(derak,"[SC_423329_3]",3)						---�O���Y���ժ��A�گu�n�U����o�̤]�S�H�d����ڡC
	sleep(5)
	AdjustFaceDir( tony ,derak, 0 )
	Yell( ith ,"[SC_423329_13]",3)
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)	
	sleep(5)
	PlayMotion( tony ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( tony ,"[SC_423329_14]",3)	
	CallPlot(ith,"LuaS_face_someone", derak,6)			---���򭱹�Y�H
	DW_MoveToFlag(derak,780681 , 2 ,0 ,1)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(derak,"[SC_423329_4]",3)						---�w�溸�H������A�A�ƤF�C
	sleep(15)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(15)
	Yell(derak,"[SC_423329_5]",3)						---���L��A���B�A�p�G�O�ڴN���F�A�C
	sleep(35)
	
	if	CheckBuff(TargetID() , 507072 ) == false	then
		delobj(tony)
		delobj(derak)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
	
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423329_6]",3)						---��...�S���A�γ\�ڬO�ƤF,���u���ƨg�~�����ڶW�V�Z�Ҽڴ�.�d�ĩi...
	sleep(40)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(derak,"[SC_423329_7]",3)						---�������������I�n�Өg�k���p���I
	sleep(35)
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
	Yell(ith,"[SC_423329_8]",3)							---�L§�̡I��f�I
	sleep(10)
	AdjustFaceDir( derak ,ith, 0 )
	sleep(10)
		
	if	CheckBuff(TargetID() , 507072 ) == false	then
		delobj(tony)
		delobj(derak)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		
		
	PlayMotionEX( derak , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Yell(derak,"[SC_423329_9]",3)						---�s�ڦ�f�H�S�����Ӻ��F�b�A���H�ɳ��i�H���F�A�̡I
	sleep(30)
	AdjustFaceDir( derak ,tony, 0 )
	sleep(5)
	Yell(derak,"[SC_423329_10]",3)						---���L�ڤ��Ѥ߱������A�٭n���ۦ^�h�~��Q�����å�C
	sleep(30)
	AdjustFaceDir( derak ,tony, 180 )
	sleep(5)
	Yell(derak,"[SC_423329_11]",3)						---�d�U�O�ӧ�ڳ�A�ڥi���Q�n�A���b���ڤH���a�L�A�H���p���C
	sleep(35)
	PlayMotion(derak,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(derak,"[SC_423329_12]",3)						---���������������I
	CallPlot(ith,"LuaS_face_someone", derak,6)
	MK_MoveToFlag_End(derak,780681 , 1 ,0 ,1)
	delobj(tony)
	delobj(ith)
	if	CheckBuff( TargetID() , 507072 ) == true	then
		SetFlag(TargetID(),544230,1)
	end	
	CancelBuff( TargetID()  , 507072  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )		
end
---------------------------423330----------------------------
function LuaS_423330_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423330_2]")			---�^�Q�_�Ӥ@�}�l�ڭ̬O�l�ۼw��J���}�B�Ө�o�̡A���X����ҤU�`ı�o�o���ӬO�L���p�e�C
		if	CheckAcceptQuest ( OwnerID()   , 423330 )	 == true	then
			SetFlag(OwnerID(),544231,1)
		end	
	end
end

---------------------------423302---------------------------

function LuaS_423302()		----player => owner   ;  ���βy => target	
	SetPlot(OwnerID() , "range","LuaS_423302_0",150)
end

function LuaS_423302_0()		----player => owner   ;  ���βy => target
	--say(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_Register +1))	
	if 	CheckAcceptQuest( OwnerID() , 423302 ) == true	and	----����423302
		CheckFlag( OwnerID() , 544190) == false	and	----�S������flag
		CheckBuff(OwnerID() , 507083) == false	and
		CheckBuff(OwnerID() , 507082) == false	then	----�S���t��buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) > 1	then			----buzy then ������buff
				BeginPlot(TargetID(),"LuaS_423302_1",1)
		elseif		ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then 
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
				BeginPlot(TargetID(),"LuaS_423302_2",1)
		else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
		end
	end 
end

function LuaS_423302_1()		----player => target   ;  ���βy => Owner	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423302_8]" ,  "0xFFFFFF00" ) 		-----�ᮦ�������b�o�̵��L�A�����b�o�̦h���@�|�C
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423302_8]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),507083,1,60)				---��������BUFF
end

function LuaS_423302_2()	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 1 )
	Local buzy = 1
	local time = 0
	local Target = 0
-----------------------
	while buzy == 1 do	
-----------------------�]�w�԰��e-----------------------------------
		Local okd =    Lua_DW_CreateObj("flag" ,104076,780682,1)			----�إX�N��,�ҫk,����J�ó]�w��visitor
		Local elf =    Lua_DW_CreateObj("flag" ,104077,780682,2)
		WriteRoleValue( okd , EM_RoleValue_Register + 1 , OwnerID() )
		WriteRoleValue( okd , EM_RoleValue_Register + 2 , elf )
		WriteRoleValue( elf , EM_RoleValue_Register + 1 , OwnerID() )
		SetRoleCamp( okd , "Visitor" )
		SetRoleCamp( elf , "Visitor" )	
		SetIdleMotion( okd,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		SetIdleMotion( elf,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
		MoveToFlagEnabled(okd,false)
		MoveToFlagEnabled(elf,false)
		CallPlot(okd,"LuaS_423302_okd_check",elf,OwnerID())	-------------�ˬd���a�O�_���L
		SetPlot(okd , "Dead","LuaS_423302_okddead",100)		-------------�]�w���`�@��
		SetPlot(elf , "Dead","LuaS_423302_elfdead",100)
		sleep(20)
		WriteRoleValue(elf , EM_RoleValue_IsWalk, 0 )		-------------�Ψ�����w�I
		WriteRoleValue(okd , EM_RoleValue_IsWalk, 0 )				
		CallPlot(okd,"DW_MoveToFlag",okd,780682 , 6 ,0 ,1	)	
		DW_MoveToFlag(elf,780682 , 7 ,0 ,1	)
		SetRoleCamp( okd , "Wagon" )
		SetRoleCamp( elf , "Monster" )		
------------------------�}�l�԰�------------------------------
		while	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 1  do
			SetAttack(okd,elf)	
			SetAttack(elf,okd)	
			sleep(5)

		end
-----------------------����԰�����-----2:���F���`----3:�~�H���`
		if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then	
			Yell(okd,"[SC_423302_9]",3)
			CallPlot(okd,"MK_MoveToFlag_End",okd,780682 , 1 ,0 ,1)	
			sleep(5)
			Yell(elf,"[SC_423317_8]",3)							----....	
			CallPlot(elf,"MK_MoveToFlag_End",elf,780682 , 2 ,0 ,1)		
			sleep(30)
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
		end
----------------------�԰��������~�H�������ߪ��A,���H��L�N����----------------------------
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
			CallPlot(elf,"MK_MoveToFlag_End",elf,780682 , 2 ,0 ,1)
			Yell(okd,"[SC_423302_0]",3)	
			Target = 0
			local Player = SearchRangePlayer ( elf , 200 )			----�j�M�ϰ줺���a
			for i = 0 , table.getn(Player) do
				if	CheckFlag( Player[i] , 544190) == false	and	CheckAcceptQuest( Player[i] , 423302 ) == true	and	CheckBuff(player[i] , 507082) == true	then
					Target = 1
					ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_1]" ,  "0xFFFFFF00" ) 		-----(���e��[115599]��A�h���j�P���ķN)
					ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_1]" ,  "0xFFFFFF00" ) 	
				end			
			end	
			--say(okd,Target)
			if	Target ~= 0	then
				for i = 0 , table.getn(Player) do
					if	CheckBuff(player[i] , 507082) == true	then
						AdjustFaceDir( okd,player[i], 0 )
						sleep(8)
						time = time + 8		
						if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then
							MK_MoveToFlag_End(okd,780682 , 1 ,0 ,1)	
							for i = 0 , table.getn(Player) do
								if	CheckBuff(player[i] , 507082) == true	then
									ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 		-----(�w�溸�ڤH�Q�����ӺM�h�F�A�L�k�i�@�B��Ĳ�A�Э��s���աC)
									ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 	
									CancelBuff( player[i]  , 507082  ) 	--	
									CancelBuff( player[i]  , 507083  ) 	--
								end			
							end		
							WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
							break
						end
						if	time > 45	then
							break
						end
					end
				end	

				while	time < 45	do
					sleep(8)
					time = time + 8	
					if	 ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) == 3	then
						SetRoleCamp( okd , "Visitor" )
						MK_MoveToFlag_End(okd,780682 , 1 ,0 ,1)	
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 		-----(�w�溸�ڤH�Q�����ӺM�h�F�A�L�k�i�@�B��Ĳ�A�Э��s���աC)
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_11]" ,  "0xFFFFFF00" ) 	
							end			
						end		
						WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
						break
					end
				end
			end
			if	Target == 0	then
				--say(okd,"is 0")
				WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
			end
			--say(okd,ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) )
			local okd3 = Lua_DW_CreateObj("obj",115782,okd)   --���H
			WriteRoleValue(okd3 , EM_RoleValue_IsWalk, 0 )	
			DisableQuest( okd3 , true )			
			delobj(okd)
			CallPlot(okd3,"MK_MoveToFlag_End",okd3,780682 , 1 ,0 ,1)	
	-------------------------
			if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
				local okd2 = Lua_DW_CreateObj("obj",115780,okd3)   --���H					
				CallPlot(okd2,"LuaS_423302_cancel",250)
				local continue = 0
				for i = 0 , table.getn(Player) do
					if	CheckBuff(player[i] , 507082) == true	then
						continue = 1
						break
					end			
				end		
				if	continue == 0	then
					delobj(okd2)
					WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
				end
		
				if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
					for i = 0 , table.getn(Player) do
						if	CheckBuff(player[i] , 507082) == true	then
							ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_0]" ,  "0xFFFFFF00" ) 		-----�@�}�̰ʶǨӡA���G������F��a��F
							ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_0]" ,  "0xFFFFFF00" ) 	
						end			
					end	
					Local shop =    Lua_DW_CreateObj("flag" ,115781,780682,1)	
					AdjustFaceDir( okd2,shop, 0 )
					CastSpell(shop,shop,494027)
					CastSpell(shop,shop,495606)	
					MoveToFlagEnabled(okd2,false)
					MoveToFlagEnabled(shop,false)
					DisableQuest( okd2 , true )	
					DisableQuest( shop , true )	
					sleep(20)
					WriteRoleValue(shop , EM_RoleValue_IsWalk, 1 )		
					WriteRoleValue(okd2 , EM_RoleValue_IsWalk, 0 )		
					sleep(10)
					local close = 10000
					Target = 0
					--say(Target,"Target = " .. Target)
					for i = 0 , table.getn(Player) do
						if	CheckBuff(player[i] , 507082) == true	and	GetDistance( shop , Player[i] ) < close then
							close = GetDistance( shop , Player[i] )
							Target = Player[i]
						end			
					end
					CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 3, 0 , 1 ,Target  )		
					if	Target ~= 0	then
						AddBuff( Target  , 503977 , 1 , 300 ) 				--����a
						DW_GetClose(shop,Target,40)
						CancelBuff( Target  , 503977  ) 			--�٪��a�ۥ�
					else
						delobj(okd2)
						delobj(shop)
						WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )				
					end
					if	ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) ~= 0	then
						Sleep(30)
						Yell(okd2,"[SC_423302_2_4]",3)		--�o���O......�~�F�u�@�̪��Ϫ̶ܡH������|�X�{�b�o�̡H
						Sleep(30)
						if	CheckBuff(Target , 507082) == true	then
							ScriptMessage(  Target,  Target , 0 , "[SC_423302_2]" ,  "0xFFFFFF00" ) 		-----�~�F�u�@�̤��Ϧb�A���W��F��A���G�ܳ��w�˪�A
							ScriptMessage(  Target ,  Target , 1 , "[SC_423302_2]" ,  "0xFFFFFF00" ) 	
						end
						sleep(50)
						AdjustFaceDir( shop ,okd2, 0 )
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_1]" ,  "0xFFFFFF00" ) 		-----�@�}�̰ʶǨӡA���G������F��a��F
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_1]" ,  "0xFFFFFF00" ) 	
							end			
						end	
						sleep(30)
						Yell(okd2,"[SC_423302_3]",3)			--�~�F�u�@�̤��ϡA�ڬO�z�̰@�۪��H�{�ڡI���䪺�~�O�ĤH�I
						sleep(30)		
						WriteRoleValue(shop , EM_RoleValue_IsWalk, 0 )		
						PlayMotion(okd2,ruFUSION_ACTORSTATE_EMOTE_POINT)		
						CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 4, 0 , 1 ,Target )		
						MK_MoveToFlag_Face( shop , 780682 , 3, 0 , 1 ,okd2 )
						sleep(20)
						PlayMotion(okd2,ruFUSION_ACTORSTATE_EMOTE_POINT)
						sleep(10)
						Yell(okd2,"[SC_423302_4]",3)			--�ĤH�O�L�̤~��ڡI
						sleep(20)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_2]" ,  "0xFFFFFF00" ) 		-----
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_2]" ,  "0xFFFFFF00" ) 	
							end			
						end	
						CallPlot(okd2,"MK_MoveToFlag_Face", okd2 , 780682 , 5, 0 , 1 ,shop )	
						MK_MoveToFlag_Face( shop , 780682 , 9, 0 , 1 ,okd2 )	
						Yell(okd2,"[SC_423302_5]",3)			--���D......���D���L�N�O�Q[115630]�襤���H�I�H
						sleep(30)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_5]" ,  "0xFFFFFF00" ) 		-----
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_5]" ,  "0xFFFFFF00" ) 	
							end			
						end	

						sleep(30)
						WriteRoleValue(okd2 , EM_RoleValue_IsWalk, 1 )	
						WriteRoleValue(shop , EM_RoleValue_IsWalk, 1 )		
						Yell(okd2,"[SC_423302_6]",3)			--�ڪ��D�F�A�J�M�p���A�ڷ|�N�o��L�Q���ȤH�a�^[ZONE_ANGAREN]�h���C
						sleep(30)
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								ScriptMessage(  Player[i],  Player[i] , 0 , "[SC_423302_2_6]" ,  "0xFFFFFF00" ) 		-----�~�F�u�@�̤��Ϻ��N�����h
								ScriptMessage(  Player[i] ,  Player[i] , 1 , "[SC_423302_2_6]" ,  "0xFFFFFF00" ) 	
							end			
						end		
						sleep(10)
						--CallPlot(okd2,"LuaS_face_someone", shop,5)			---���򭱹�Y�H	
						MK_MoveToFlag_End(shop,780682 , 10 ,0 ,1)		
						Yell(okd2,"[SC_423302_7]",3)			--�J�M�A�O�Q�襤���H�A���N���O[ZONE_ANGAREN]���ĤH�F�A�ڱo���^���h�q���j�a�o�Ӯ����C
						time = 0
						for i = 0 , table.getn(Player) do
							if	CheckBuff(player[i] , 507082) == true	then
								AdjustFaceDir( okd,player[i], 0 )
								sleep(8)
								time = time + 8		
								if	time > 45	then
									break
								end
							end
						end		
						sleep(8)
						MK_MoveToFlag_End(okd2,780682 , 10 ,0 ,1)
						for i = 0 , table.getn(Player) do								---����BUFF�����a�i�H�o��X��
							if	CheckBuff(player[i] , 507082) == true	and	CheckAcceptQuest( player[i] , 423302 ) == true		then
								SetFlag(player[i],544190,1)	--give mission flag
								CancelBuff( player[i]  , 507082  ) 	--
							end
						end
					end
				end	
			end
			for i = 0 , table.getn(Player) do
				CancelBuff( Player[i]  , 507082  ) 	--	
				CancelBuff( Player[i]  , 507083  ) 	--		
			end	
		end
		buzy = 0
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )
		local Player3 = SearchRangePlayer ( OwnerID() , 200 )			----Ĳ�o�I���񦳪��a������BUFF,BUZY=1,���ƺt��
		for i = 0 , table.getn(Player3) do	--CheckBuff(player3[i] , 507083) == true		and	
			if	CheckAcceptQuest( player3[i] , 423302 ) == true	and				
				CheckFlag( player3[i] , 544190) == false	then
				CancelBuff( player3[i]  , 507083  ) 	--
				buzy = 1
				WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 1 )	
				ScriptMessage( player3[i] , player3[i] , 0 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( player3[i] , player3[i] , 1 , "[SC_423302_12]" ,  "0xFFFFFF00" ) 		
			end
		end
		--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )
	end	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	
	--say(TargetID(),ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) )
end

function LuaS_423302_okddead()
	Lua_CancelAllBuff( OwnerID() )

--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 2	then
--		say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
		local Player = SearchRangePlayer ( OwnerID() , 300 )			----�j�M�ϰ줺���a
		for i = 0 , table.getn(Player) do
			if	CheckAcceptQuest( Player[i] , 423302 ) == true	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( Player[i]  , 507082  ) 	--
			end			
		end	
	end
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 1	then
		WriteRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1 ,  3 )	
	end	

	SetRoleCamp( OwnerID() , "Visitor" )
	SetRoleCamp( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2  ), "Visitor" )
	return false
end

function LuaS_423302_elfdead()
	Lua_CancelAllBuff( OwnerID() )

--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
	if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) ~= 3	then
--	say(OwnerID(),ReadRoleValue( ball , EM_RoleValue_Register + 1  ))
		local Player 
		for i=0, HateListCount( OwnerID() )-1 do
			Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	CheckAcceptQuest ( Player   , 423302 )	 == true	and
				GetDistance(OwnerID(),player) < 250	then
				AddBuff(player,507082,1,-1)
				--say(player,"i get buff")
			end	
		end
		SetRoleCamp( OwnerID() , "Visitor" )
		if	ReadRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1  ) == 1	then
			WriteRoleValue( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1  ) , EM_RoleValue_Register + 1 ,  2 )
		end	
	end

	return false
end

function LuaS_423302_okd_check(elf,boss)
	while	ReadRoleValue(boss , EM_RoleValue_Register + 1  ) == 1	do
		sleep(10)
		for i=0, HateListCount( OwnerID() )-1 do
			if	HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) ~= elf	and	CheckBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098) == false	then
				ScriptMessage( HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , 0 , "[SC_423302_10]" ,  "0xFFFFFF00" ) 	---(�A�����F�w�溸�ڤH�A�L���������F�A�@�����~��M�߹�I[104077])
				ScriptMessage( HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ), HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) , 1 , "[SC_423302_10]" ,  "0xFFFFFF00" )
				AddBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098,1,120)
				SetAttack(OwnerID(),elf)	
			end	
		end
	end
	ClearHateList( OwnerID() , -1 )
	SetStopAttack( OwnerID() )	
	while	ReadRoleValue(boss , EM_RoleValue_Register + 1  ) == 2	do
		sleep(10)
		for i=0, HateListCount( OwnerID() )-1 do
			Target = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) ~= elf	and	CheckBuff(HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ),507098) == false	then
				ClearHateList( OwnerID() , -1 )
				SetStopAttack( OwnerID() )
				SetRoleCamp( OwnerID() , "Visitor" )								
				WriteRoleValue( boss , EM_RoleValue_Register + 1 ,  3 )					
			end	
		end
	end
end

function LuaS_meek_debuff()
				CancelBuff( OwnerID() , 507082  ) 	--
end

function LuaS_meek_checkbuff()
	if	CheckBuff(OwnerID() , 507082) == true	then
		say(OwnerID(),"i have buff")
	else
		say(OwnerID(),"i have no buff")
	end
end

function LuaS_423302_cancel(range)
	local Player = SearchRangePlayer ( OwnerID() , 1000 )			---������BUFF�S���t��BUFF�����a,�����t��BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(Player) do
			if	GetDistance( player[i] , OwnerID() ) > range	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( player[i]  , 507082  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 		-----�Z�����H���ؼФӻ��A�Ц^��_�I���աC
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423302 ) == false	and	CheckBuff(player[i] , 507082) == true	then
				CancelBuff( player[i]  , 507082  ) 	--				
			end
		end
	end
end

function LuaS_423302_complete()
	AddBuff( TargetID(),  507082 , 1 , -1)                                         ---��L���Ȫ����a�~�ݨ�
	local okd = Lua_DW_CreateObj("obj",115780,OwnerID())   --okd���H
	MoveToFlagEnabled(okd,false)
	DisableQuest( okd , true )	
	DW_MoveToFlag(okd,780682 , 8,0 ,1)	
	delobj(okd)
	CancelBuff( TargetID()  , 507082  ) 	--	
end

function LuaS_anger_checker()
	local XD
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115971  , 200 , 0)		---
	while	true	do
		XD = 0
		sleep(20)
		local HowManyPlayer = SetSearchAllPlayer(0)
		local player
		for i = 1,HowManyPlayer,1 do
			Player = GetSearchResult()
			if CheckMapID( ReadRoleValue(Player,EM_RoleValue_X) ,ReadRoleValue(Player,EM_RoleValue_Y) ,ReadRoleValue(Player,EM_RoleValue_Z) , 932) == true	and	CheckCompleteQuest( player , 423302 ) == false	then
				--FindMapID( ReadRoleValue(OwnerID(),EM_RoleValue_X) , ReadRoleValue(OwnerID(),EM_RoleValue_Y) , ReadRoleValue(OwnerID(),EM_RoleValue_Z) ) )
				SetPosByFlag( player , 780675 , 1 )
				XD = 1
			end
		end
		if	XD == 1	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			CallPlot(OwnerID(),"LuaS_anger_checker_say",NPC)
		end
	end
end

function LuaS_anger_checker_say(player)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AdjustFaceDir( OwnerID() ,player, 0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(OwnerID(),"[SC_423302_13]",3)
	sleep(40)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end