--====================================================================================================
--���b����NPC�̮R��������ܼ@��
--====================================================================================================

--function LuaS_421962_4() --���b����NPC�̮R��������ܼ@��
--	LoadQuestOption(OwnerID())
--�p�G�������ȫo�٨S����
--
--	if	(CheckAcceptQuest(OwnerID(),422841)==true ) and					--�v�֥|����
--		(CheckCompleteQuest( OwnerID() , 422841) == false ) and
--		(CheckFlag(OwnerID(),543467)==false)  then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_0]","LuaS_422841_2",0) 		--�u�ର[113282]�k�h�z�ĳҡA�O�ڪ��a���C�v
--	end
--
--	if	(CheckAcceptQuest(OwnerID(),422844)==true ) and
--		(CheckCompleteQuest( OwnerID() , 422844) == false ) and
--		(CheckFlag(OwnerID(),543541)==false)  then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_0]","LuaS_422844_1",0)		--�u�O�o�A���O[113274]���ѻ��A�����t�C���O�^���u�洵�ڡC�v
--	end
--end


---------------------

function LuaS_422841_2()		
	SetSpeakDetail(OwnerID(),"[SC_422841_1]")		
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_2]","LuaS_422841_3",0) 		--�u�k�h�A�o��ƴN���ڨӡA�z�d�U�Ӧw���ĺ��̧a�C�v
end

function LuaS_422841_3()		
	SetSpeakDetail(OwnerID(),"[SC_422841_3]")
--	Say( OwnerID() , "Test" ) 
	Setflag( OwnerID() , 543467 , 1 ) --�����n���~�G�бШȺ����C�w�A�H��������422841
end

--------------------

function LuaS_422844_1()		
	SetSpeakDetail(OwnerID(),"[SC_422844_1]")					--�u�洵�A�]��ܿW�����H�A�b�묹������o�^�����W...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_2]","LuaS_422844_2",0)		--�u�o�O�ƤQ�~�e���ơA���өM�{�b�����D�L���C�v
end

function LuaS_422844_2()		
	SetSpeakDetail(OwnerID(),"[SC_422844_3]")					--�����p���A���o�I�ڭ̤��M����N���ư�...
	setflag(OwnerID(),543541 , 1 )							--�����n���~�G�^�����u�W�A�H��������422844
end







--===========================================================================================================
--�Ⱥ����C�w����ܼ@��
--===========================================================================================================

--function LuaS_422572_0() --���b����NPC�Ⱥ����C�w����ܼ@��
--	LoadQuestOption(OwnerID())
--
--	if	(CheckAcceptQuest(OwnerID(),422842)==true ) 		and
--		(CheckCompleteQuest( OwnerID() , 422842) == false ) 	and
--		(CheckFlag(OwnerID(),543468)==false)			then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_0]","LuaS_422842_1",0) 		--�u�i�h���������V�áA�|�O�T����}�Ҫ����Y�ܡH�v
--	end
--
--	if	(CheckAcceptQuest(OwnerID(),422855)==true ) 		and
--		(CheckCompleteQuest( OwnerID() , 422855) == false )	and
--		(CheckFlag(OwnerID(),543427)==false)		then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_0]","LuaS_422855_1",0) 		--�u�٨S���A�ڷǳƵ��@�U�h���X�o�C�v
--	end
--		
--end



------422482-------

function LuaS_422842_1()		
	SetSpeakDetail(OwnerID(),"[SC_422842_1]")					--�Ⱥ��G�ګܧƱ��^���A�o�Ӱ��D�A���ڹ�T������F�ѹ�b���h...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_2]","LuaS_422842_2",0) 		--�u�S���Y�A���ެO�h�p���u���A���бz�i�D�ڡC�v
end

function LuaS_422842_2()		
	SetSpeakDetail(OwnerID(),"[SC_422842_3]")					--��L�����K�K��...�ƤQ�~�e�A.....
	setflag(OwnerID(),543468,1)							--�����n���~�G�Ⱥ����C�w������
end

------422855-------------------

function LuaS_422855_1()		
	SetSpeakDetail(OwnerID(),"[SC_422855_1]")					--�Ⱥ��G�o��......[$playername]�A�ڤ@�|��...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_2]","LuaS_422855_2",0) 		--�u�n���A�Ⱥ����C�w���ѡC�v
end

function LuaS_422855_2()	--OwnerID�O���a	
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		Tell(OwnerID(),TargetID() , "[SC_422855_3]")					--�X�o�e�A�O�o�����n���檺�ɵ��C.....
		WriteRoleValue( TargetID() , EM_RoleValue_Register  , 1 )
		Beginplot(TargetID(),"LuaS_422855_3",0)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaS_422855_3()
	--sleep( 30 )
	--Say(OwnerID(),"0..0")
	--Say(TargetID(),"T_T")
	if CheckID( TargetID() ) == true then	
		AddBuff( TargetID()  , 503977 , 1 , 300 ) 			--�����a����
	end
	local Rufri= Lua_DW_CreateObj("flag" ,113945,780496,4)
	DW_MoveToFlag(Rufri,780496,5,0,1)
	AdjustFaceDir(Rufri,OwnerID(),0)		
	Sleep(20)
	Yell(Rufri,"[SC_422855_4]",3)			--�|�����J�G���ˡA�Ф��\�ڻP�o��_�I�̦P�h���ϩԳǤ��s�C
	Sleep(30)
	AdjustFaceDir(OwnerID(),Rufri,0)	
	Yell(OwnerID(),"[SC_422855_5]",3)		--�Ⱥ����C�w�G�V�L�T����A�G���D�H�M�������M�I�C�|�����J�A�A�Q�M���F�H
	Sleep(30)
	Yell(Rufri,"[SC_422855_6]",3)			--�|�����J�G�M�^�۵M���ۤ@�Ƨڱڤ���ʮu�A���ˡA�u�@�T����A�����O�ڱڤd�~�Ӫ��ϩR�ܡH
	Sleep(30)
	Yell(OwnerID(),"[SC_422855_7]",3)		--�Ⱥ����C�w�G�n�A�ڵ����A�A���F�aģ�ڱڡA���F�ڤ����ϩR�A�o�N�O�ڨ�I
	Sleep(30)
	Yell(Rufri,"[SC_422855_8]",3)			--�|�����J�G���¤��ˡA�ڤ��|���A���檺�C
	Sleep(30)
	AdjustFaceDir(Rufri,TargetID(),0)
	Sleep(10)
	Yell(Rufri,"[SC_422855_9]",3)			--�|�����J�G�_�I�̡A�ڭ̪����b�T������t�@��A���ϩԳǤ��s���g�a�W�|�X�C
	Sleep(20)
	DW_MoveToFlag(Rufri,780496,6,0,1)
	Delobj(Rufri)
	if CheckID( TargetID() ) == true then
		AdjustFaceDir(OwnerID(),TargetID(),0)
	end
	Yell(OwnerID(),"[SC_422855_10]",3)		--�Ⱥ����C�w�G [$playername]�A�|�����J�N�P�A�P��A�L�����U�A�A�@���F�t�����A�̦��業�w�C

	if (CheckFlag(OwnerID(),543427)==false) then
		Setflag(TargetID(),543427,1)
	end

	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID()  , 503977)
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register  , 0 )
			
end





--===================================================================================================================================================
--422846����F�g
--===================================================================================================================================================
---�����ȡG�c�Ժ�	�٥��ȡG�c�Ժ�
---[206368][114008]���̪d
---[206369][114009]��U�g
---[206370][114010]�s����
---[206371][114011]�����F
---[206372]�@�ɹ�
---[206373][114020]�����p�M


function LuaS_422846_0()	--���b����npc�c�Ժ�����ܼ@��
	LoadQuestOption( OwnerID() )
	
	if	(CheckAcceptQuest( OwnerID(), 422846) == true) 	and
		(CheckCompleteQuest(OwnerID(),422846)==false  ) then	
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_0]"," LuaS_422846_1",0)	--�u���̪d�n�h���̧�H�v
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_2]"," LuaS_422846_2",0)	--�u��U�g�n�h���̧�H�v
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_4]"," LuaS_422846_3",0)	--�u�s���ۭn�h���̧�H�v
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_6]"," LuaS_422846_4",0)	--�u�����F�n�h���̧�H�v
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_8]"," LuaS_422846_5",0)	--�u�@�ɹЭn�h���̧�H�v
	end

	if	(CheckAcceptQuest( OwnerID(), 422848) == true) 	and		--���L422848���ȫo��������
		(CheckCompleteQuest(OwnerID(),422848)==false  ) and
		CountBodyItem( OwnerID(), 206374)<1		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422848_0]"," LuaS_422848_1",0)		--�u����A�a�������ܧڱ��U�Ӹӥh���̶ܡH�v
		end

	if	CheckAcceptQuest(OwnerID(),422847)== true	and		--���L422847���ȫo��������
		(CheckCompleteQuest(OwnerID(),422847)==false)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422847_11]","LuaS_422847_2", 0 )
	end


end

function LuaS_422846_1()
	SetSpeakDetail(OwnerID(),"[SC_422846_1]")				--�o��²�檺�ƧA�]�ӰݧڡH���B�̡B�d�I�N�O���̪��d�ڰ�......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--�u(�ݧc�Ժ���L�F�g�b���̡C)�v
end

function LuaS_422846_2()
	SetSpeakDetail(OwnerID(),"[SC_422846_3]")					--�i�����Ĥl�A�A�X�ͪ��ɭԤ@�w�⸣�l�d�b�������{�l�̡A�A�h�����H�K��@�ʾ�A�b��ڮ�����@�I�g�[�A���N�O�F�C
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--�u�ݧc�Ժ���L�F�g�b���̡C�v
end

function LuaS_422846_3()
	SetSpeakDetail(OwnerID(),"[SC_422846_5]")					--���j���a���i�D�L�ڭ̡A�P�n���g�[�g�L�U�~������N�|�ܦ���w�����ۡA�h�s����ߨǥ��Y�^�ӧa�C
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--�u�ݧc�Ժ���L�F�g�b���̡C�v
end

function LuaS_422846_4()
	SetSpeakDetail(OwnerID(),"[SC_422846_7]")				--�����̻E�����a��N�|�������F�����͡A�A�h���ˬW����ݬݧa�C�{�b�����æ��o�ˡA�����D�ٯण���줸���F......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--�u�ݧc�Ժ���L�F�g�b���̡C�v
end

function LuaS_422846_5()
	if 	(CountBodyItem( OwnerID(),206373) ==0)  then
		if 	CountBodyItem( OwnerID(),206372) >0  then
			if 	(CountBodyItem(OwnerID(),206372) >7)	then
				SetSpeakDetail(OwnerID(),"[SC_422846_11]")					--�K��A�d�U�h�A�A�N�֨r�Y�F�C�C	
				AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--�u�ݧc�Ժ���L�F�g�b���̡C�v
			else
				SetSpeakDetail(OwnerID(),"[SC_422846_12]")			--�Y�v�O�A���A�A�n�d�h�֬O�H�A�K��.....
				GiveBodyItem(OwnerID(), 206373, 1 )				--���p�M
			end
		else
			SetSpeakDetail(OwnerID(),"[SC_422846_9]")				--�A�L�ӡA�Τp�M�d�@�I�A���Y�v�C�ڭ̪i�h���N�q���j���a���ҥܤ����D....
			GiveBodyItem(OwnerID(), 206373, 1 )					--���p�M
		end
	else
		SetSpeakDetail(OwnerID(),"[SC_422846_14]")		--�A�w�g���p�M�F�C
	end
end


--===================================================================================================================================================
--422848
--===================================================================================================================================================

function LuaS_422848_1()		--�P�պ����
	SetSpeakDetail(OwnerID(),"[SC_422848_1]")					--�O�S���A���L......�y�y...�o��......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422848_2]"," LuaS_422848_2",0)  	--�u�A�̬O�@�_���j�����~�n��......�u���H�Q���C�v
end

function LuaS_422848_2()
	if 	CountBodyItem( OwnerID(),206376) <1  then
		SetSpeakDetail(OwnerID(),"[SC_422848_3]")		--�A���۫H�H�����]�O�աA�ַ|�۫H......
		GiveBodyItem(OwnerID(),206376, 1 )
	else
		SetSpeakDetail(OwnerID(),"[SC_422848_5]")		--�ڤw�g���A�a�ϰաI	
	end
end





--===========================================================================================================
------���h����ܥ���
--===========================================================================================================

function LuaS_422854_0() --���b����NPC���h����ܼ@��
	LoadQuestOption(OwnerID())
	if	(CheckAcceptQuest(OwnerID(),422854)==true )		and
		(CheckCompleteQuest( OwnerID() , 422854) == false ) 	then
		if	CountBodyItem( OwnerID(), 206382)<1			then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_0]","LuaS_422854_1",0)		--�u�ګַܼN�����A����ĳ�A�Чi�D�ڸӫ�򰵡C�v
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_9]","LuaS_422854_5",0)		--�u�n���A�ڥߨ�ʨ��e��[ZONE_THE GREEN TOWER] �C�v
		end
	end

	
end


function LuaS_422854_1() 
	SetSpeakDetail(OwnerID(),"[SC_422854_1]")					--�A�ڧL������A�A���۳o�ӡA�e�����ϩԳǤ��s.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_2]","LuaS_422854_2",0)		--�u�x�H�o�@���p���Y�O����A������n�M�䥦���t�@�b�H�v
end

function LuaS_422854_2()
	SetSpeakDetail(OwnerID(),"[SC_422854_3]")					--�o�O�۵M���ۡA�w�S�Jù�]�m�T���.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_4]","LuaS_422854_3",0)		--�u��ť�����A���n����N���D�������ѨM�A�ڭ̧֥X�o�a�I�v
end

function LuaS_422854_3()
	SetSpeakDetail(OwnerID(),"[SC_422854_5]")					--[$playname]�A����A�񤧶����Ӧ��H���ݵۧA���լd���G�C.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_6]","LuaS_422854_4",0)		--�u�O�ڡA�ڸӦV�̮R�����k�h���o�Ӧn�������A�گ��......�v
end

function LuaS_422854_4()
	if 	CountBodyItem( OwnerID(), 206382)<1	then
		SetSpeakDetail(OwnerID(),"[SC_422854_7]")				--�n�A�A�h�a�A�o�̦��ʫH��A�ЧA���D�a���Ⱥ����C�w�C.....
		GiveBodyItem( OwnerID(), 206382, 1 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_9]","LuaS_422854_5",0)		--�u�n���A�ڥߨ�ʨ��e��[ZONE_THE GREEN TOWER] �C�v
	else
		CloseSpeak( OwnerID() )
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_422854_8]" , 0 )		--���Ȫ��~�w�s�b�C
	end
end

function LuaS_422854_5()
	CloseSpeak( OwnerID() )
	Yell(TargetID(),"[SC_422854_10]",3)		--���ڰe�A�@�{�a�C
	BeginPlot(OwnerID()  , "LuaS_422854_6" , 0 )
end

function LuaS_422854_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 8 , 0 , 4043, 261 , 21530 , 166 )
end

