
--============================================================================
--���L����422836�A����422837�A�B���o�쭫�n�X��<��J�d��543465>�����a�A�d�������X�l780495
--�b�g�L�d�����50���A�}�Ҫ�t�@��
--�����d��@��
--�d���������a
--�d���]��
--��ȥX�{�A�t���A���}
--============================================================================

function LuaS_422836_1()	--���b�d��113944�����󲣥ͼ@��
	Setplot(OwnerID(),"range","LuaS_422836_2",100)	
end

function LuaS_422836_2()
	Beginplot(TargetID(),"LuaS_422836_3",0)
end

function LuaS_422836_3()
	Setplot(OwnerID(),"range","",0)		--�����d�����d��@��
--	Say(OwnerID(),"0..03")
--	Say(TargetID(),"T_T3")

	if 	(CheckAcceptQuest(TargetID(),422836)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),422836)==  false)  	and
		(CheckAcceptQuest(TargetID(),422837)== false)		and 
		(CheckFlag(TargetID(), 543465 )==false) 		then		--���a�ۤv���L����422836�A����422837�A�B���o�쭫�n�X��<��J�d��543465>
			
		CastSpell(OwnerID(),TargetID(),494805)	--���d���缾�a����Y
		Sleep(20)
--		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KICK)
		Sleep(10)
		Yell(OwnerID() , "[SC_422837_0]" , 3 )

		local A= SearchRangePlayer (OwnerID(), 150 )		--�ŧi�}�C�ϬO�j�M�d���d��150�X���Ҧ����a
		local B={}						--�ŧi�}�C�Ъ��s�b
									


		for i=0,table.getn(A),1 do				--�j�骺�򥻮榡 for i=�_�l��,�̤j�ȡ]�j��B�⦸�ƧP�_�^,�ֿn�� do
									--�ҡGfor i=0,3,1 do�@�Y�q���}�l�]�Ģ����A���[�W�ֿn�Ȣ�=1�բ��A�]�ĤG��....����_�l�ȥ[�ֿn�Ȥj��̤j�Ȣ��A�Y������
									--table.getn(A)�|�۰ʺ�X�]�^���}�C�]�t�����`��

			if 	(CheckAcceptQuest(A[i],422836)== true ) 	and 
				(CheckAcceptQuest(A[i],422837)== false ) 	and 
				(CheckFlag(A[i], 543465 )==false)		then 

				B[table.getn(B)+1]=A[i]			--B[��m]�n�]�����W+1�A�G��table.getn(B)��X�`�ơA�@�}�l�O�Ū��A�G��0�A+1�ᬰB[1]�A�̧Ǭ�B[2],B[3]....��A[i]���h��	
			end	
		end
	
		Beginplot(OwnerID(),"LuaS_422836_10",1)
					
		Sleep(20)
		Hide( OwnerID() )

		for i=1,table.getn(B),1 do				--���ݧ������a�X��
			setflag(B[i],543465,1)
		end

		local KillerA = Lua_DW_CreateObj("flag" ,113953,780491,1 )		--�إX����
		local KillerB = Lua_DW_CreateObj("flag" ,113954,780492,1 )		--�إX���A

		Beginplot(KillerA,"LuaS_422836_5",1)
		Beginplot(KillerB,"LuaS_422836_6",1)					--���ҤA���ʨ�X�l2
	
--		While 	(ReadRoleValue (KillerA , EM_RoleValue_PID)~=1) or  
--			(ReadRoleValue (KillerB , EM_RoleValue_PID)~=1) do		--��A��PID�Ȥ�����1�A��B��PID�Ȥ�����1 �A����	
--											--A�BB�����@��PID������1�A���|���榹�j��A�ҥHA�PB��PID���O1��A�~�|���}���j��	
--			sleep(10)
--		end

		Sleep(30)
		Yell(KillerA,"[SC_422837_1]",1)			--�һ���
		PlayMotion(KillerA ,ruFUSION_ACTORSTATE_EMOTE_POINT)
		Sleep(20)											
		Beginplot(KillerA,"LuaS_422836_8",0)
		Beginplot(KillerB,"LuaS_422836_9",0)			--���ҤA���ʨ�X�l3
	end

	
		Sleep(100)
		Show(OwnerID(),0)					--��ܥd��
		SetPosByFlag(OwnerID(),780495,2)			--�ǰe�d���^����#####����b���îɨϥΦ����O�I�I�I				
		Setplot(OwnerID(),"range","LuaS_422836_2",100)		--�}�ҥd�����d��@��
	
end
		


function LuaS_422836_5()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
--	PlayMotion( OwnerID() ,ruFUSION_MIME_SNEAK_FORWARD)
--	Sleep(20)
	DW_MoveToFlag(OwnerID(),780491,2,0,1)
	WriteRoleValue (OwnerID(), EM_RoleValue_PID, 1 )	
end

function LuaS_422836_6()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1 )
--	PlayMotion( OwnerID() ,ruFUSION_MIME_SNEAK_FORWARD)
--	Sleep(20)
	DW_MoveToFlag(OwnerID(),780492,2,0,1)	
	WriteRoleValue (OwnerID() , EM_RoleValue_PID, 1 )	
end


function LuaS_422836_8()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780491,3,0,1)
	Delobj(OwnerID())
end

function LuaS_422836_9()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780492,3,0,1)
	Delobj(OwnerID())
end

function LuaS_422836_10()
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 0 )
	DW_MoveToFlag(OwnerID(),780495,1,0,1)		--���d�����ʨ�X�l(flag)
						--���åd��
end




--=========================================================================
--���U422837���ȡA��������422837���ȡA�B���o�X��(�w�P������)�����a�A�����102897(�X�l780493)�B����A102898(�X�l780494)
--������X�A�������a�M�d��
--�u�n���A�L�׳ӭt�A�������n�X��(�w�P������543528)
--�Գӱ���A�����P�d�����
--�Ԥ��ӡA��d����q�C��1/5�ɡA�d���ǰe����
--10���A�������
--�o��P������X��543528�A�٥���422837
--���ͥd���A�P�d����ܡA�o��543429�d�������໡�A�٥���
--=========================================================================

function LuaS_422837_2()	--���b����422837����
	local KillerA = Lua_DW_CreateObj("flag" ,102897,780493,1 )		--�إX����
	local KillerB = Lua_DW_CreateObj("flag" ,102898,780494,1 )		--�إX���A
	local Check = "NotOK"
	Sleep(20)

	SetFollow(KillerA , TargetID())			--�]�V���a
	SetFollow(KillerB , TargetID())	
	SetAttack(KillerA , TargetID())			--������ҧ����ؼЪ��a
	SetAttack(KillerB , TargetID())			--������A�������a
	
	ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_422837_16]" , 0 ) 		--�����M���X�I
	
	local Calen = Lua_DW_CreateObj("flag" , 102896 ,780494,2 )			--�إX�d���G��
	Hide(OwnerID())
	SetPlot( Calen , "dead" , "LuaS_422837_2_Dead" , 0 )
	SetAttack(Calen,KillerA)
	SetAttack(KillerA , Calen )
	SetFollow(KillerA , Calen )

	for i= 1,600,1 do
		if 	( CheckID(KillerA) == false or ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 1 ) and 
			( CheckID(KillerB) == false or ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 1 ) then
			Check = "OK"
			break
		end
		if ReadRoleValue(Calen,EM_RoleValue_HP)/ReadRoleValue(Calen,EM_RoleValue_MaxHP) < 0.25 then
			break
		end
		if CheckID(TargetID()) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead)  == 1 then
			break
		end
		if CheckID(Calen ) == false or ReadRoleValue( Calen , EM_RoleValue_IsDead)  == 1 then
			break
		end
		sleep( 10 )
	end

	if Check == "NotOK" then
			if CheckID(Calen ) == true and ReadRoleValue( Calen , EM_RoleValue_IsDead)  == 0 then
				if CheckID( TargetID() ) and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
					Tell(TargetID() ,Calen,"[SC_422837_8]")			--�d��2�缾�a������:���p�����A�ڥ���H�ި��A�A�^�ӧ�A	
				end
				SetRoleCamp( Calen , "Visitor" )
				SetStopAttack(Calen)
				Sleep(20)
				Yell(Calen, "[SC_422837_9]", 3 )			--�j���j�A�Q��ڡA�A�o���l�W�ڡI�I
				Sleep(50)
				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
					Lua_CancelAllBuff( KillerA )
					SetStopAttack( KillerA )
					SetRoleCamp( KillerA , "Visitor" )
					SetFollow(KillerA ,Calen)			--������ҧ����d��2
				end
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					Lua_CancelAllBuff( KillerB )
					SetStopAttack( KillerB )
					SetRoleCamp( KillerB , "Visitor" )
					SetFollow(KillerB ,Calen)			--������ҧ����d��2
				end

				Beginplot(Calen,"LuaS_422837_3",0)		--���d��2�]�컷�B�A����
	
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then			
						SetFollow(KillerB , KillerA )			--����A���H�����
					else
						DW_MoveToFlag(KillerB,780493,2,0,1)		--������Ҳ���
						Delobj(KillerB)
					end
				end

				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
			 		SetStopAttack(KillerA)				--������Ұ����
					Yell(KillerA , "[SC_422837_10]" , 3 )
					DW_MoveToFlag(KillerA,780493,2,0,1)		--������Ҳ���
					if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
						Delobj(KillerB)
					end
					Delobj(KillerA)
				end
				Sleep(20)
				Show( Calen , 0 )
				DW_MoveToFlag(Calen,780494,2,0,1)
				Delobj(Calen)
			else
				if CheckID(KillerA) == true and ReadRoleValue(KillerA , EM_RoleValue_IsDead)  == 0 then
					Delobj(KillerA)
				end
				if CheckID(KillerB) == true and ReadRoleValue(KillerB , EM_RoleValue_IsDead)  == 0 then
					Delobj(KillerB)
				end
			end

			if CheckID( TargetID() ) == true then
				ScriptMessage(TargetID(), TargetID() , 1 , "[SC_422813_22]" , 0 )	--���ȥ���
			end
	else
			Sleep(20)					
			if 	CheckID( TargetID() ) == true and (CheckFlag( TargetID() , 543528 )==false) then			
				Setflag( TargetID() ,543528,1)	--���ؼЪ��a�X��(�w�P������)
			end
			if CheckID( Calen) == true then
				DW_MoveToFlag(Calen,780494,2,0,1)
				Delobj(Calen)
			end
	end
	Show( OwnerID() , 0 )
end


function LuaS_422837_3()	--�d��2�]��				
	DW_MoveToFlag(OwnerID(),780494,3,0,1)			--���d��2���ʨ�X�l(flag)
	Hide(OwnerID())
end

function LuaS_422837_2_Dead()
	return false
end
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------


function LuaS_422837_0()		--���b�d����l��ܼ@���AOwnerID�O���a
	LoadQuestOption(OwnerID())

	if 	(CheckAcceptQuest(OwnerID(),422837)==true ) 		and 		--���U422837���ȡA��������422837���ȡA�B���o�X��(�w�P������)�����a
		(CheckCompleteQuest( OwnerID() , 422837) == false ) 	and
		(CheckFlag( OwnerID(), 543528 )==false)			then
		SetSpeakDetail(OwnerID(),"[SC_422837_14]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_15]","LuaS_422837_9",0)
		
	end

	if	(CheckFlag( OwnerID(), 543528 )==true) and CheckAcceptQuest( OwnerID() , 422837) == true	then			--if�ۤv���F422837���ȡA������422837���Ȫ̡A�o�X��(�w�P������)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_13]","LuaS_422837_8",0) 	--�b�ؼШ��W����LuaS_422837_8 �u�p�j�A���@�ӤH�b�o�̡A���^�񤧶�O�H�v
	end

end


function LuaS_422837_8()	
	SetSpeakDetail(OwnerID(),"[SC_422837_3]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_4]","LuaS_422837_6",0)			--�u�]�\�ڥi�H���A......�v
end

function LuaS_422837_6()	
	SetSpeakDetail(OwnerID(),"[SC_422837_5]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422837_6]","LuaS_422837_7",0)			--�u�p�G�S���H�e��ŧ?�A�O�H�o�ˤӦM�I�F�C�v
end

function LuaS_422837_7()	
	SetSpeakDetail(OwnerID(),"[SC_422837_7]")
	Setflag(OwnerID(),543429,1)
end

function LuaS_422837_9()
	CloseSpeak(OwnerID())	
	Beginplot(TargetID(),"LuaS_422837_2",0)
end


