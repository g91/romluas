--�d��@�� �������Ȫ��H�o��X��

function LuaS_423263_0()---���b���Ϊ���115327��l�@��
	
	local prisoner1 = CreateObjByFlag( 115328, 780617 , 1 , 1 )	 	
	AddToPartition(  prisoner1 , 0 )
	DisableQuest( prisoner1 , true )					--�������
	MoveToFlagEnabled(prisoner1 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,prisoner1 )		--�Nprisoner1�g�i���Ϊ����

	local prisoner2 = CreateObjByFlag( 115329,780617,2,1 )
	AddToPartition(  prisoner2 , 0 )
	DisableQuest( prisoner2 , true )					--�������
	MoveToFlagEnabled(prisoner2 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,prisoner2)		--�Nprisoner2�g�i���Ϊ����

	local prisoner3 = CreateObjByFlag( 115330,780617,3 ,1)
	AddToPartition(  prisoner3 , 0 )
	DisableQuest( prisoner3 , true )					--�������
	MoveToFlagEnabled(prisoner3 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,prisoner3 )		--�Nprisoner3�g�i���Ϊ����

	local prisoner4 =CreateObjByFlag( 115331,780617,4,1)	
	AddToPartition(  prisoner4 , 0 )
	DisableQuest( prisoner4, true )						--�������
	MoveToFlagEnabled(prisoner4 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4,prisoner4)		--�Nprisoner4�g�i���Ϊ����	

	SetPlot( OwnerID(), "range","LuaS_423263_1", 250 )
end


function LuaS_423263_1()
	if	CheckAcceptQuest( OwnerID() , 423263 ) == true		then
		if	CheckFlag( OwnerID() , 543991 ) == false	then
			SetFlag(OwnerID(), 543991, 1)
		end
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register+9 ) < 1	then
			BeginPlot( TargetID() , "LuaS_423263_2" , 0 )
			WriteRoleValue ( TargetID() , EM_RoleValue_Register+9 , 1 )
		end
	end
end


function LuaS_423263_2()	
	local prisoner4=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) 
	Yell( prisoner4 , "[SC_423263_1]" , 3 )			--115331�ѰڡK�A��ť�K�Q���s������
	sleep(20)
	local prisoner1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	Yell( prisoner1 , "[SC_423263_2]" , 3 )			--115328�O���աH���ӳo��h���Ȧ�
	sleep(20)
	local prisoner2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	Yell( prisoner2 , "[SC_423263_3]" , 3 )			--115329�����K���|�r�K�U��[�J�u��
	sleep(20)
	local prisoner3=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	Yell( prisoner3 , "[SC_423263_4]" , 3 )			--115330�p�G�L�̯��}���ǥ����˪�
	sleep(20)
	Yell( prisoner1 , "[SC_423263_5]" , 3 )			--115328�O���{�ҵL�\���ä�K�S����
	sleep(20)
	Yell( prisoner4 , "[SC_423263_6]" , 3 )			--115331���K���n���o�ظܡK�i�H���w				
	sleep(20)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		
end

function LuaS_115333_0() 
	DisableQuest(OwnerID(), true )						--�������
end



function LuaS_115381_0() --����423264�d������115381��l�@���A�إX115378�B115379�B115380(client)
	local P1= CreateObjByFlag(115378, 780619, 1 , 1 )	 	
	AddToPartition(  P1, 0 )
	DisableQuest(P1, true )						--�������
	MoveToFlagEnabled(P1, false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1, P1)	--�NP1�g�i�d��������



local P2 = CreateObjByFlag(115379, 780619, 2 , 1 )	 	
	AddToPartition(  P2, 0 )
	DisableQuest(P2, true )						--�������
	MoveToFlagEnabled(P2, false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2, P2)	--�NP2�g�i�d��������

local P3 = CreateObjByFlag(115380, 780619, 3 , 1 )	 	
	AddToPartition(  P3, 0 )
	DisableQuest(P3, true )						--�������
	MoveToFlagEnabled(P3, false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, P3)	--�NP3�g�i�d��������
end

--423264�k�檺�Ʊ�--�������ȫ�
function LuaS_423264_0()
	local prisoner1=ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) 
		Yell( prisoner1 , "[SC_423264_1]" , 3 )			--�Ӧ����A�A������n�����R���ȡI 
		sleep(20)

	local prisoner3=ReadRoleValue( OwnerID(),  EM_RoleValue_Register+3 ) 
		Yell( prisoner3 , "[SC_423264_2]" , 3 )			--���I�O�A���F�A�o�@�w�|ť��A�O��
		sleep(20)

	local prisoner2=ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) 
		Yell( prisoner2 , "[SC_423264_3]" , 3 )			--�����㦳�t�O�ܡH�K�b�o�y�Һ��̳�
		sleep(20)
		Yell( prisoner2 , "[SC_423264_4]" , 3 )			--�����㤣�ެO���s�d���M�����p����		
	return true
	--	end
	--end
end

function LuaS_115377_0()	--����115377�إX�����B��Z�g�B�p�w�d�~�H(client)
	local Ta = CreateObjByFlag(115334, 780620 , 1 , 1 )	 	
	AddToPartition(  Ta, 0 )
	DisableQuest(Ta, true )							--�������
	MoveToFlagEnabled(Ta, false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2, Ta)	--�NTa�g�i������

	local Itr = CreateObjByFlag(115335, 780620, 2 , 1 )	 	
	AddToPartition(  Itr, 0 )
	DisableQuest(Itr, true )							--�������
	MoveToFlagEnabled(Itr, false )						--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, Itr)	--�NItr�g�i������
	
	local P1= CreateObjByFlag(115336, 780620, 3 , 1 )	 	
	AddToPartition(  P1, 0 )
	DisableQuest(P1, true )							--�������
	MoveToFlagEnabled(P1, false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1, P1)	--�NP1�g�i������
end




--423265 ��R���Ȥ��W	--�X�l780618
function LuaS_423265()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423265 ) == true	and	(CheckFlag( OwnerID(), 543993)==false)	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423265_0]" , "LuaS_423265_1", 0 )	--��R
	end
end

function LuaS_423265_1()
	SetSpeakDetail(OwnerID(),"[SC_423265_1]")					
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423265_2]","LuaS_423265_99",0) --�A����R��
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423265_2]","LuaS_423265_2",0)	 --�A����R��
	end	
end

function LuaS_423265_2()--���i�t

	SetSpeakDetail(OwnerID(),"[SC_423265_3]")		--(�Q�}�T���d�����~���a�ժ��y�e�R�����ߡA�`
end

function LuaS_423265_99()--�i�t
						--OwnerID--���a--TargetID--����
	WriteRoleValue( TargetID() , EM_RoleValue_Register+9 , 2 )
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423265_3" , 0 )
end

function LuaS_423265_3()
	--OwnerID����--TargetID���a
	local WAA = Lua_DW_CreateObj("flag",115382, 780618,1 )
	DisableQuest(WAA , true )						--�������
	MoveToFlagEnabled(WAA , false )
	WriteRoleValue(WAA , EM_RoleValue_IsWalk, 1 )   

	local WA1 = Lua_DW_CreateObj("flag",115383, 780618,2 )
	DisableQuest(WA1 , true )						--�������
	MoveToFlagEnabled(WA1 , false )
	WriteRoleValue(WA1 , EM_RoleValue_IsWalk, 1 ) 
  
	local WA2 = Lua_DW_CreateObj("flag",115383, 780618,3 )
	DisableQuest(WA2 , true )						--�������
	MoveToFlagEnabled(WA2 , false )
	WriteRoleValue(WA2 , EM_RoleValue_IsWalk, 1 )   

	local prisoner1=ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) 
	Yell( prisoner1, "[SC_423265_4]" , 3 )					--<���W>���H�ӤF�㤣���I�O��U�@
	sleep(20)
	Tell(TargetID(),OwnerID(),"[SC_423265_5]")				--<������>�A�̥����n�A�֡I�L��
	Setposbyflag(TargetID() , 780618, 7 ) 					 --�ǰe���a

	AddBuff( TargetID()  , 506744, 1 , 120 )				--�����aBUFF(���b�cŢ��) 
	AddBuff( TargetID()  , 503977 , 1 , 60 )					--�����aBUFF (�ĨĬ���)
									--���a�ݨ�cŢ�᪺�����B��Z�g
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	

	BeginPlot(WA1   , "LuaS_423265_4" , 0 )					--����X�l6
	BeginPlot(WA2   , "LuaS_423265_5" , 0 )					--����X�l5
	LuaFunc_MoveToFlag( WAA, 780618,4,0)					--���V
	sleep(10)

	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	
	
	BeginPlot(WA1   , "LuaS_423265_6" , 0 )					--����X�l10
	BeginPlot(WA2   , "LuaS_423265_7" , 0 )					--����X�l9
	LuaFunc_MoveToFlag( WAA, 780618,8,0)					--��������cŢ�e
	sleep(10)

	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	

	AdjustFaceDir(WA1   ,OwnerID(),0 )
	AdjustFaceDir(WA2   ,OwnerID(),0 )
	sleep(30)
	Yell(WAA, "[SC_423265_6]" , 3 )						--����<���W>���ڬݬݡA�o���������
	sleep(20)
	AdjustFaceDir(WAA ,OwnerID(),0 )
	PlayMotion(WAA , ruFUSION_ACTORSTATE_EMOTE_POINT)			--<���۳Q�}�T���d�����~��>
	Yell(WAA, "[SC_423265_7]" , 3 )						--����<���W>���e�G�s�����ӬO�A
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end

	sleep(10)
	local Ta =ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) 
	Yell(Ta, "[SC_423265_8]" , 3 )						--<���W>���I
	sleep(10)
	Yell(WAA, "[SC_423265_9]" , 3 )						--����<���W>��H
	sleep(20)
	Tell(TargetID(),OwnerID(),"[SC_423265_10]")					--<������>�O�X�n�A�S�W�L�|�ިӰ��F�x�`
	
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	sleep(30)
	Yell(WAA, "[SC_423265_11]" , 3 )						--����<���W>�n�F�A�֪��X�ӡA��A�B��
	sleep(20)
	Yell( prisoner1 , "[SC_423265_12]" , 3 )					--<���W>�O�ڡ���͡A�M�����A�Q���Ӥk
	sleep(30)

	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	ScriptMessage(  TargetID(), TargetID(), 2 , "[SC_423265_13]" , 0 ) 			--(�@�ö�����i�ݤF���k�ⰼ�A���b�ˬd
	ScriptMessage(  TargetID(), TargetID(), 0 , "[SC_423265_13]" , 0 ) 	
	Sleep(20)
	Yell(WAA, "[SC_423265_14]" , 3 )						--����<���W>�����R���Ȥj�H���N���H
	Sleep(20)
	Yell(WAA, "[SC_423265_15]" , 3 )						--��I���L�O�Ӥp�G�l�A�@�_�e�h�v�޳��I
	Sleep(20)

	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	BeginPlot(WA1   , "LuaS_423265_8" , 0 )					--����X�l12
	BeginPlot(WA2   , "LuaS_423265_9" , 0 )					--����X�l11
	Sleep(20)
	local prisonerQ1 = Lua_DW_CreateObj("flag",115385, 780618,11 )
	MoveToFlagEnabled(prisonerQ1, false )
	WriteRoleValue(prisonerQ1, EM_RoleValue_IsWalk, 1 )
	Local prisonerQ2= Lua_DW_CreateObj("flag",115386, 780618,12 )
	MoveToFlagEnabled(prisonerQ2, false )
	WriteRoleValue(prisonerQ2, EM_RoleValue_IsWalk, 1 )
	Sleep(30)

	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	SetFlag( TargetID() , 543992, 1 )						--���X�СAclient �ݤ����cŢ�����}��1�B4
	DelObj(prisonerQ1 )
	DelObj(prisonerQ2)
	Sleep(20)		
	Yell(WAA, "[SC_423265_16]" , 3 )						--���Ѫ��@�X�N�s���G�M���p���Ʀk�Q�D�Ԥj���h�A��������
	Sleep(20)		
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() �O���a
		DelObj(WAA )	--�R���t������
		DelObj(WA1 )	--�R���t���@��1
		DelObj(WA2)	--�R���t���@��2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --�e�^���a
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end						
	LuaFunc_MoveToFlag( WAA,780618,13,0)					--<�����B�@�ña�ۥ}��1�B4���h>
	BeginPlot(WA1   , "LuaS_423265_10" , 0 )					--����X�l14
	BeginPlot(WA2   , "LuaS_423265_11" , 0 )					--����X�l15
		if	(CheckFlag( TargetID(), 543993)==false)		then
			SetFlag( TargetID() , 543993, 1 )
		end	
	DelObj(WAA )
	Setposbyflag(TargetID() , 780621, 11 ) 					 --�ǰe���a
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		if	CheckBuff( TargetID() , 506744) == true 	then
			CancelBuff( TargetID() , 506744)
		end
		if	CheckBuff( TargetID() , 503977) == true 	then
			CancelBuff( TargetID() , 503977)
		end
End

function LuaS_423265_4()
		LuaFunc_MoveToFlag( OwnerID(),780618,6,0)
end

function LuaS_423265_5()
		LuaFunc_MoveToFlag( OwnerID(),780618,5,0)
end

function LuaS_423265_6()
		LuaFunc_MoveToFlag( OwnerID(),780618,10,0)
end

function LuaS_423265_7()
		LuaFunc_MoveToFlag( OwnerID(),780618,9,0)
end

function LuaS_423265_8()
		LuaFunc_MoveToFlag( OwnerID(),780618,12,0)
end

function LuaS_423265_9()
		LuaFunc_MoveToFlag( OwnerID(),780618,11,0)
end

function LuaS_423265_10()
		sleep(10)
		LuaFunc_MoveToFlag( OwnerID(),780618,14,0)
		DelObj( OwnerID())
end

function LuaS_423265_11()
		sleep(10)
		LuaFunc_MoveToFlag( OwnerID(),780618,15,0)
		DelObj( OwnerID())
end

--423266���i�Ǯ��I
function LuaS_423266_99()	--�����ȫ�t���A����115411��Register+6�B+7		
	AddBuff( TargetID()  , 506745, 1 , 50 )					--OwnerID����
	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) > 0 then	--�]�w�����W��NPC�N����
			return
		end	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, 1)	
	local TA = Lua_DW_CreateObj("flag",115156, 780621,11 )			--115156�Ȧꪺ
	DisableQuest(TA , true )						--�������
	MoveToFlagEnabled(TA, false )
	WriteRoleValue(TA, EM_RoleValue_IsWalk, 0 )
	Hide( TA )
	Show( TA ,0 )
	local Itry = Lua_DW_CreateObj("flag",115520, 780621,12 )	
	DisableQuest(Itry , true )						--�������
	WriteRoleValue(Itry, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled(Itry, false )
	Hide( Itry  )
	Show( Itry ,0 )
	Yell(Itry, "[SC_423266_0]" , 3 )						--���U�I
	LuaFunc_MoveToFlag(TA , 780621,1,0)
	BeginPlot( TA , "LuaS_423266_100" , 0 )
	Yell(Itry, "[SC_423266_1]" , 3 )						--�l�W�h�I�֡I
	LuaFunc_MoveToFlag(Itry, 780621,1,0)
	Sleep(10)
	DelObj(Itry )
	SetFlag(TargetID(), 544007, 1)
	If	CheckBuff(TargetID() , 506745) == true then
		CancelBuff_NoEvent(TargetID() , 506745)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, 0)	
end


function LuaS_423266_100()
	LuaFunc_MoveToFlag(OwnerID(), 780621,2,0)
	DelObj(OwnerID())
end

--function LuaS_423266_99()
--	LuaFunc_MoveToFlag(OwnerID(), 780621,1,0)
--end
------���a�|�b���y�Ϫ��f�ݨ������B��Z�g
--function LuaS_423266_0()	--�I�������A����115411��Register+8
--	LoadQuestOption( OwnerID() )
--	if	CheckAcceptQuest(OwnerID(), 423266) == true and CheckFlag(OwnerID(),544008) ==false	then  
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_2]","LuaS_423266_1",0)	--���U�H	
--	end
--end

function LuaS_423266_1()
	SetSpeakDetail(OwnerID(),"[SC_423266_3]")				--�Ӥ��ΡI����ӤH�w�g�Q�����h�e�i�h�F�K
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_4]","LuaS_423266_3",0)	 --�n�I
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_4]","LuaS_423266_2",0)	--�n�I	
	end
end

function LuaS_423266_2()
	SetSpeakDetail(OwnerID(),"[SC_423266_18]")				--�ڪY��A�����ܫW���A
end

function LuaS_423266_3()
	WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , 2 )		--TargetID�O����
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423266_7" , 0 )

end

function LuaS_423266_7()
	local Player = SearchRangePlayer(TargetID(), 225)			--��BUFF
		for i=0,table.getn(Player)-1 do
--			say(Player[i],"88888")		
			if	CheckAcceptQuest( Player[i], 423266) == true 	then  
				AddBuff( Player[i], 506742, 1 , 90 )						--�����aBUFF �]�i���t�����B�ݤ����쥻���^
			end
		end
									--TargetID�O���a�BOwnerID����
	local TA = Lua_DW_CreateObj("flag",115417, 780621,13 )			
	DisableQuest(TA , true )						--�������
	MoveToFlagEnabled(TA, false )
	WriteRoleValue(TA, EM_RoleValue_IsWalk, 1 )
	
	local Itry = Lua_DW_CreateObj("flag",115418, 780621,14 )	
	DisableQuest(Itry , true )						--�������		
	MoveToFlagEnabled(Itry, false )
	WriteRoleValue(Itry, EM_RoleValue_IsWalk, 1 )

	local WAA = Lua_DW_CreateObj("flag",115419, 780621,15 )	
	DisableQuest(WAA , true )						--�������
	MoveToFlagEnabled(WAA, false )
	WriteRoleValue(WAA, EM_RoleValue_IsWalk, 0 )
	Yell(TA, "[SC_423266_19]" , 3 )						--�ܦn�A���ަp��
	BeginPlot(TA , "LuaS_423266_4", 0 )
	Sleep(20)
	Yell(Itry, "[SC_423266_5]" , 3 )						--���U�A�ݤU���Oı�o�����C
	BeginPlot(Itry , "LuaS_423266_8", 0 )
	Sleep(10)
	Yell(TA, "[SC_423266_6]" , 3 )						--���|�����D�A�ڭ̥i�H�q�L�f���ݥX��h
	Sleep(80)
	AdjustFaceDir(TA, WAA ,0 )
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)			--<�������۶���>
	Sleep(10)
	Yell(TA, "[SC_423266_7]" , 3 )						--����N��A���U�ʩR���g�{�I
	Sleep(15)
	AdjustFaceDir(WAA , TA,0 )
	Yell(WAA, "[SC_423266_8]" , 3 )						--�����̡H����ۤ��q�O�I
	sleep(10)
	LuaFunc_MoveToFlag(WAA, 780621,17,0)

	local Drek = Lua_DW_CreateObj("flag",115414, 780621,3 )				--<�ܼ}�N�x�X�{>
	DisableQuest(Drek , true )	
	MoveToFlagEnabled(Drek, false )
	WriteRoleValue(Drek, EM_RoleValue_IsWalk, 1 )

	PlayMotion(WAA, ruFUSION_ACTORSTATE_ATTACK_1H)			--<�����@�է�������>
	BeginPlot(Drek , "LuaS_423266_9", 0 )
	Sleep(30)

	AdjustFaceDir(Drek , TA,0 )
	Yell(Drek, "[SC_423266_9]" , 3 )						--�ڴL�q�����U�A�z�S��ۤv�m���I�a�A 
	Sleep(10)
	AdjustFaceDir(WAA, Drek ,0 )
	Sleep(10)
	AdjustFaceDir(TA, Drek ,0 )
	Sleep(10)
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)			--<�������ۼw�U�J>
	Yell(TA, "[SC_423266_10]" , 3 )						--�S�O�A�I
	Sleep(20)
	Yell(Drek, "[SC_423266_11]" , 3 )						--�z�o���R�i�O�ڪ��A�n�n�n�ñ��ҳѤ��h��
	Sleep(20)
	BeginPlot(WAA , "LuaS_423266_5", 0 )					--�����ǳưk�]
	Yell(TA, "[SC_423266_12]" , 3 )						--�J���I�o���A�k�����F�I
	Sleep(20)
	AdjustFaceDir(TA, WAA ,0 )
	Yell(TA, "[SC_423266_20]" , 3 )						--�g�{�I�O�Q�����Ӱh�I
										--�����ʧ@
	Sleep(20)
	Yell(Drek, "[SC_423266_13]" , 3 )						--�N�̱z�o�I�L�z�O�q�H�Y�S�����H�O
	Sleep(20)
	local NIGHT = Lua_DW_CreateObj("flag",115415, 780621,6 )			--<�]���X�{>
	DisableQuest(NIGHT , true )		
	MoveToFlagEnabled(NIGHT, false )	
	WriteRoleValue(NIGHT, EM_RoleValue_IsWalk, 1 )

	local STAR = Lua_DW_CreateObj("flag",115416, 780621,7 )			--<��P�X�{>
	DisableQuest(STAR , true )	
	MoveToFlagEnabled(STAR, false )
	WriteRoleValue(STAR, EM_RoleValue_IsWalk, 1)
			
	sleep(10)
	DelObj(NIGHT )										

	local ANT = Lua_DW_CreateObj("flag",115234, 780621,8 )				--<�w�S�Jù�X�{>
	DisableQuest(ANT , true )
	MoveToFlagEnabled(ANT , false )
	WriteRoleValue(ANT , EM_RoleValue_IsWalk, 1)
	
	BeginPlot(Drek , "LuaS_423266_10", 0 )

	local NIGHT2 = Lua_DW_CreateObj("flag",115415, 780621,9 )			--<�]���X�{>	
	DisableQuest(NIGHT2 , true )		
	MoveToFlagEnabled(NIGHT2 , false )	
	WriteRoleValue(NIGHT2 , EM_RoleValue_IsWalk, 1 )
	AdjustFaceDir(NIGHT2 , Drek ,0 )

--	LuaFunc_MoveToFlag(NIGHT , 780621,9,0)					--<�]���״����B�ܼ}�����A�w�S�����@�n������>

	Yell(STAR, "[SC_423266_14]" , 3 )						--����L�o���S�����A�A���T�S���
	Sleep(20)
	Yell(Drek, "[SC_423266_15]" , 3 )						--�S�O�A�̡H�ɹɡA�H���p�����B�}�G��
	Sleep(20)
	Yell(Drek, "[SC_423266_16]" , 3 )						--���Q�����U�A�z�o���p�R�ڴN���H
	WriteRoleValue(Drek, EM_RoleValue_IsWalk, 0)
	Sleep(20)
	BeginPlot(Drek , "LuaS_423266_11", 0 )
	
	AdjustFaceDir(TA, Drek ,0 )
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(TA, "[SC_423266_17]" , 3 )						--����I����]�I
	Sleep(10)
	Yell(ANT , "[SC_423266_21]" , 3 )						--�A�̯d�U�A�ڥh�l�ܡC
	BeginPlot(ANT , "LuaS_423266_6", 0 )
	DelObj(NIGHT2 )
	DelObj(STAR)
	DelObj(TA)
	DelObj(Itry)
	DelObj(Drek)
	local Player = SearchRangePlayer(TargetID(), 225)			--���X��
	for i=0,table.getn(Player)-1 do
--		say(Player[i],"77777")
		if	CheckAcceptQuest( Player[i], 423266) == true and CheckFlag( Player[i], 544008 ) ==false	and	CheckBuff( Player[i], 506742) == true	then  
			SetFlag(Player[i], 544008 , 1)
		end
	sleep(10)
		If	CheckBuff( Player[i], 506742) == true	then
			CancelBuff_NoEvent( Player[i], 506742)
		end
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
End

function LuaS_423266_4()
	LuaFunc_MoveToFlag(OwnerID(), 780621,4,0)					--<�������@�ö�����V��>
end

function LuaS_423266_5()
	LuaFunc_MoveToFlag(OwnerID(), 780621,5,0)					--<�����X���k�]��a�U��>
	DelObj(OwnerID())
end
	
function LuaS_423266_6()
	LuaFunc_MoveToFlag(OwnerID(), 780621,10,0)					--<�w�S���}>
	sleep(70)
	DelObj(OwnerID())
end

function LuaS_423266_8()
	LuaFunc_MoveToFlag(OwnerID(), 780621,16,0)
end

function LuaS_423266_9()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_2H)
end

function LuaS_423266_10()
	sleep(10)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H)			--<�ܼ}�@�է�������>
end

function LuaS_423266_11()
	LuaFunc_MoveToFlag(OwnerID(), 780621,10,0)
end




