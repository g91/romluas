--======================================================================================================
--423241	�ݧ��������
--======================================================================================================
function LuaS_423241_0() 	--���b����A
	LoadQuestOption(OwnerID())	--�A�O�����򪺡H
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543936)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_0]","LuaS_423241_1",0)		
		--�u�ڬO�q�L�h�������U�A�̪��C�v
	end
end

function LuaS_423241_1()	--���b����B
	SetSpeakDetail(OwnerID(),"[SC_423241_1]")	
	--�L�h���H�ڭ̦V�L�h���D���h��A�{�b�~�]�ӴX��......
	--�A���A�̬O�֡H�s�ӥ��������]�S�����_�I�̡A�������U�ڭ̡H
	--�K�F�I�ڬݰڡA�A�̤K���u���L�O�L�h���s���H�K�A�Ѥ@�U�d�������p�A�]�ӹL�����p�L�}�F�C
	SetFlag(OwnerID(),543936,1)	--�����κX��
end

function LuaS_423241_2()
	LoadQuestOption(OwnerID())	--�A�Q�F����H
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543937)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_2]","LuaS_423241_3",0)	
		--�u�ڨS���c�N�A�u�O�Q���U�A�̸ѨM���D�C�v
	end
end

function LuaS_423241_3()
	SetSpeakDetail(OwnerID(),"[SC_423241_3]")	
	--�O���i�i�F�A�A�o�f�����٬O�d�ۥh�F���̪��t�@�s�H�a�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_4]","LuaS_423241_4",0)	
	--�u�t�@�s�H�H�v
end

function LuaS_423241_4()
	SetSpeakDetail(OwnerID(),"[SC_423241_5]")	
	--��A�n���O���ǡ� ���������X�{�A���Ѫ��d�����]���|���o�o�ؤU���A���ѳ��M���b�L�̨���A�u�O�ѽk��I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_6]","LuaS_423241_5",0)	
	--......�]�o�Ӧ��G���l���F���ܨƥ�~�A�٦����������^
end

function LuaS_423241_5()
	SetSpeakDetail(OwnerID(),"[SC_423241_7]")	
	--�{�}�@�I�I
	SetFlag(OwnerID(),543937,1)	--�����κX��
end
	
function LuaS_423241_6()
	LoadQuestOption(OwnerID())	--���ƶܡH
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543938)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_8]","LuaS_423241_7",0)
		--�uť��������������������......�v
	end
end
	
function LuaS_423241_7()
	SetSpeakDetail(OwnerID(),"[SC_423241_9]")	
	--�O��ڻ��ܡA�A�h����D���y�a�C�L�O���l�̪����ѡA�o�̶̴��}�j���w��~�Ӫ̡A
	--�������ޥL�̬O�q���ӳ��t��©�������p�X�Ӫ��A�|���|�M�`�ڭ̪��w�M�A��I�]�o����X�С^
	SetFlag(OwnerID(),543938,1)	--�����κX��
end
	
	
function LuaS_423241_8()
	LoadQuestOption(OwnerID())	--
		if 	CheckAcceptQuest(OwnerID(),423254)== true 		and
			CheckCompleteQuest(OwnerID(),423254)== false 		and
			CheckAcceptQuest(OwnerID(),423255)==false		and
			Checkflag(OwnerID(),543933)==false		and
			CountBodyItem(OwnerID(),207311)<1				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423254_2]","LuaS_423254_Quest1",0)
			--���ѡA�Q�V�z�бФ@��ơA�аݱz�O�_ť���L[ZONE_WARNORKEN_FORT]��[115302]�H
		end
		
		if 	CheckCompleteQuest(OwnerID(),423255)==true 		and
			CheckCompleteQuest(OwnerID(),423254)==false		and
			CountBodyItem( OwnerID(), 207311)<1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423254_0]","LuaS_423254_SPEAK_1",0)
			--�u���ѡA��O�������F�C�v
		
		end
		if 	CheckAcceptQuest(OwnerID(),423241)==true 	and
			Checkflag(OwnerID(),543941)==false	and
			Checkflag(OwnerID(),543938)==true	and
			Checkflag(OwnerID(),543937)==true	and
			Checkflag(OwnerID(),543936)==true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_10]","LuaS_423241_9",0)
			--�u�ķN......�O�]�����ܨƥ�y�������ߤ������w�a�H�v
		end
end

function LuaS_423241_9()
	SetSpeakDetail(OwnerID(),"[SC_423241_11]")
	--��ꤣ��¬O�o�ӭ�]�A�ڷQ�A�A���e�J�������O�Ǳƥ~�������a�A�ڭ̳o�ӧ��l�̡A
	--���@�b���H�O�Q�h�~�e�q�˨��h�ָM���k�X�Ӫ������A��ɧ����N�����F�⬣�A�@���D�i���������A
	--�@���h�D�i�ڵ��L�̡A��ӱ��Ǫ��n�����F�W���A�o��h�~�U�ӡA���F�b�Y�Ǹ��D�W�����p�����A
	--�����̬۳B���ٺ�Ĭ��A�u�O�b���ܮץ�o�ͫ�A�o���W���M���٬O�]���q�Ү��ߦӳQ�X�y�S���ھڪ��h�å��}�F�C
	SetFlag(OwnerID(),543941,1)	--�o���ȧ����X��
end



function LuaS_423254_SPEAK_1()	
	SetSpeakDetail(OwnerID(),"[SC_423254_1]")	--�u��O�������աH��ߡA��観�H�ߨ쵹�ڰe�ӡA���h�a�A�p�ߧO�A�˥�աI�v
	GiveBodyItem(OwnerID(),207311,1)
end

function LuaS_423254_Quest1()
	SetSpeakDetail(OwnerID(),"[SC_423254_3]")
	--�o�ӦW�r......�b�o�̤w�g�ܤ[�S���H���_�F�A�~�����_�I�̡A�A���|�ݰ_�L�O�H
	--�����A�ڤ��l�ݧA������Q��ť[115302]�A�]�\�A��ť�L���̬Y�ǤH�C�y�L�o�ӦW�r�A�Ӥİ_�A���n�_�ߡA
	--�N�⤣�O�]���o�ˡA�ӬO���O����]�A�A�]���Χi�D�ڡA����M�~���H���A�i�O�ڳo�ѤH�a�̶}�ߪ��ƩO......
	SetFlag(OwnerID(),543933,1)	--�o����Ĳ�o�X��

end


--======================================================================================================
--423242	�M�������
--======================================================================================================
function LuaS_423242_0()
	LoadQuestOption(OwnerID())	--���ͤH�A���Ƨֻ��A�S�ƪ��ߨ����}�C
	if CheckAcceptQuest(OwnerID(),423242)==true 	and
		Checkflag(OwnerID(),543939)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423242_0]","LuaS_423242_1",0)
		--�u�A�O�����ܡH�ڬO�q�L�h���e�Ӥ䴩�d�������_�I�̡C�v
	end
end

function LuaS_423242_1()
	SetSpeakDetail(OwnerID(),"[SC_423242_1]")
	--��I�Ʊ���o�ͪ��ɭԡA�ڭ̫K���H�h�V�L�h���D���A���O��𵥤���^���A
	-- �{�b�A���ۤv�O�q�L�h���Ӥ䴩�ڭ̪��_�I�̡H�o�䤤�����I�Ӧh�F�C
	--���M�ګܤ��Q�N�C�ӤH��������ݡA���O�b���ܨƥ��W�Ǫ��{�b�A�ڵL�k�������H���@�ӭ��ͤH�C
	--�A���A�d�����ثe���ݭn�~�Ӫ̪��z�w�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423242_2]","LuaS_423242_2",0) 
	--�uť���A����@�@�T�ݧ����ӽլd���ܪ��w�w�v
end

function LuaS_423242_2()
	SetSpeakDetail(OwnerID(),"[SC_423242_3]")
	--�O�ֳy���H�@�w�O���Ƕ����l�٤����ê��˨��h�֤H�A�ݨӧڸӻ{�u�Ҽ{����L�̵��ڪ��� ��ĳ���C
	SetFlag(OwnerID(),543939,1)	--���U�������X��
end

--======================================================================================================
--423242	���ȧ�����@��		 ownerID=115108	����(������)		�����A���������D��
--======================================================================================================
function LuaS_423242_ACT0()
						--���npc
	DisableQuest( OwnerID() , true )	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 	--�w���a

	local Arnimo = Lua_DW_CreateObj("flag" ,115092,780626,1)	--�������ȫ���������b������a�ئ��X�l
	local Older = Lua_DW_CreateObj("flag" ,115089,780626,3)
	DisableQuest( Arnimo , true )					--�������
	DisableQuest( Older , true )					--�������

	DW_MoveToFlag(Older,780626,5,0,1)
	
	AdjustFaceDir( Older , Arnimo,3 )
	Say(Older,"[SC_423242_ACT0]")						--�������A���������F�A�ֲ�´�H���L��^�ӧa�I
	Sleep(30)
	AdjustFaceDir( Arnimo , Older ,3 )
	Say(Arnimo,"[SC_423242_ACT6]")						--�ڰ��W�h�I
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	DW_MoveToFlag(Arnimo,780626,6,0,1)
	Sleep(40)
	Hide(Arnimo)
	
	SetFlag(TargetID(), 543930 , 1)	--���X�СA���o���Ȫ����Ѳ{��
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�	
	Delobj(Older)
	Delobj(Arnimo)
	DisableQuest( OwnerID() , false)
end

function Lua_20130627_FlagAdd()
	local Player = OwnerID()
	LoadQuestOption(Player)
	if CheckCompleteQuest( Player , 423242) == true	and
	CheckFlag(Player, 543930)==false			then	
		SetFlag(Player, 543930, 1)
	end
end	


--======================================================================================================
--423243	�d��@��*3	�@�ӫ�����B�@�ӫ�����
--======================================================================================================
function LuaS_423243_0()	--Right way
	Setplot(OwnerID(),"range","LuaS_423243_1",50)	--�]�wĲ�o�d��G�b�i�J��npc50���A����LuaS_423243_1
end

function LuaS_423243_1()
	Local R=RandRange(1,3)		--�]�ü�
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
		--DisableQuest( TargetID() , true )					--�������
		Say(TargetID(),"[SC_423243_A"..R.."]")			--�̶üƨ�Ū��string
			--A1:�A�̬O�n��������ӫĤl���ܡH���o��S��.......�����o�I����"����"�N�|���Ĥl�a�v�T�A���O�L�̧�����a���F�C
			--A2:�����w�����N�O�Q"����"�F�F�A�~�̶̪����Ƿϴ˪L�h�F�A���̫ܦM�I�A�n�h�H���b���ॢ�ܪ��C
			--A3:�������������ܡA�֩w�O�o��"�����U����.....�_�I�̡A���o�ਫ�S���A�����O���I�Ʊ�A�̦��I������a�^�ӰڡI
	end
	Sleep(50)
end	

function LuaS_423243_2()	--Right way
	Setplot(OwnerID(),"range","LuaS_423243_3",50)	--�]�wĲ�o�d��G�b�i�J��npc50���A����LuaS_423243_1
end

function LuaS_423243_3()
	Local R=RandRange(1,3)		--�]�ü�
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
				--DisableQuest( TargetID() , true )					--�������
		Say(TargetID(),"[SC_423243_B"..R.."]")			--�̶üƨ�Ū��string
			--B1:�Oť�o�ǥ��Y���U�i�L�û��A�_�I�̡A���U�A�������^�ӡA�h�Ƿϴ˪L�ݬݧa�I
			--B2:���Y���U�A���L�I�_�I�̡A�������Ѧ��W�q�o�̸g�L�A�����D�L.....�u�I�ڴN�|����L�F......
			--B3:������ɭԤF�A�o�ǤH�N�u�|�n.....�_�I�̡Ať�H�����ݨ�������o��V���A�ЧA��쨺�Ĥl�ڡI
	end
	Sleep(50)
end	


function LuaS_423243_4()	--WRONG way
	Setplot(OwnerID(),"range","LuaS_423243_5",50)	--�]�wĲ�o�d��G�b�i�J��npc50���A����LuaS_423243_1
end	

function LuaS_423243_5()
	Local R=RandRange(1,4)		--�]�ü�
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
				--DisableQuest( TargetID() , true )					--�������
		Say(TargetID(),"[SC_423243_C"..R.."]")			--�̶üƨ�Ū��string
			--C1:�A�]�O�ӧ�������ܡH�o�Ӥ�V�����ǥ��Y���U��L�A�A�h�O���a��a...
			--C2:���§A����������A�L�̩ȥ��~�F�A��˳����|�h�o���稦�a�A�i�H�ЧA�h�O���a����ܡH
			--C3:�������Ĥl�̩ȫo���稦�a�����~�ǻ��A���|������h�A�A��Ƿϴ˪L�ݬݡA���§A�F�I
			--C4:�ڤ@���b�o�̡A��{�b���S�ݨ������A���D�L���Ƿϴ˪L�h�աH
	end
	Sleep(50)
end		

function LuaS_423243_6()	--WRONG way
	Setplot(OwnerID(),"range","LuaS_423243_7",50)	--�]�wĲ�o�d��G�b�i�J��npc50���A����LuaS_423243_1
end	

function LuaS_423243_7()
	Local R=RandRange(1,3)		--�]�ü�
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(),207305)<1			then
				--DisableQuest( TargetID() , true )					--�������
		Say(TargetID(),"[SC_423243_D"..R.."]")			--�̶üƨ�Ū��string
			--D1:�A�]�O�_�I�̧a�H�ڭ�q�o���稦�a����V�^�ӡA�S��쨺�Ӥ������Ĥl�C
			--D2�G�o�Ӧa��ڧ�F�A�S�ݨ�Ĥl���v�l�A���L�ڡA�o���l���H�]�u�_�ǡA�b�o�خɭ��٤��ѩ����n�W....
			--D3:���Ǩ������̥��ܪ��H�O"����"�����A���Ĥl�Ӥ��|�]�O�Q�L��......
	end
	Sleep(50)
end	





--======================================================================================================
--423244	���ȧ�����@��	�ä��n���Aownerid�O����
--======================================================================================================
function LuaS_423244_ACT0()
	DisableQuest( OwnerID() , true )	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )	--�t�X�U�誺check �禡
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 
	AddBuff( TargetID()  , 506812, 1 , 300 ) 
	Beginplot(OwnerID(),"LuaS_423244_AK_CHECK",0)
		
	local Jx = Lua_DW_CreateObj("flag" ,115082,780627,1)	
		DisableQuest( Jx , true )					--�������
	Sleep(30)
	WriteRoleValue(Jx, EM_RoleValue_IsWalk, 1)
	Hide(Jx)
	Show(Jx,0)		--hide�Ashow�i��WriteRoleValue���\
	
	Say(Jx,"[SC_423244_ACT0]")				--�����b�ܡH	
	local Arnimo = Lua_DW_CreateObj("flag" ,115266,780627,2)
		DisableQuest( Arnimo , true )					--�������

	Sleep(20)
	WriteRoleValue(Arnimo, EM_RoleValue_IsWalk, 1)
	
	Hide(Arnimo)
	Show(Arnimo,0)		--hide�Ashow�i��WriteRoleValue���\	
	DW_MoveToFlag(Jx,780627,3,0,1)
	Adjustfacedir(Jx,Arnimo,0)
	Adjustfacedir(Arnimo,Jx,0)
	Beginplot(Arnimo,"LuaS_423244_ACT1",0)
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT1]")						--���H�F�ܡH...�A�O�֡H��F�A�ڲ{�b�S�Ųz�A�C
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--�n��
	Sleep(30)
	Say(Jx,"[SC_423244_ACT2]")							--�@�ӫĤl�����F�C
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT3]")						--�O���A�����L......���D�B���D�A���D�����L�b���̡H
	Sleep(30)
	Say(Jx,"[SC_423244_ACT4]")							--�L�O�A�̬õ����_���ܡH
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT5]")						--���ͤH�A�p�G�A�O�ӧ�·Ъ��A�Ч��I���}�C
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_PARRY_1H)	--����
	Sleep(30)
	Say(Jx,"[SC_423244_ACT6]")							--�ڬO�_���y�H�A����·СA�u���H�M��öQ���ƪ��C
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT7]")						--�O�A�L�O�ڳ̭��n���~�c�A�����ڧ�L��^�ӧa�I
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--����pose
	Say(Jx,"[SC_423244_ACT8]")							--�̶��C
	local Mio = Lua_DW_CreateObj("flag" ,115093,780627,5)
		DisableQuest( Mio , true )					--�������
	local Dan = Lua_DW_CreateObj("flag" ,115094,780627,6)
		DisableQuest( Dan , true )					--�������
	Sleep(20)
	WriteRoleValue(Mio, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Dan, EM_RoleValue_IsWalk, 0)
	
	Hide(Mio)
	Show(Mio,0)		--hide�Ashow�i��WriteRoleValue���\
	Hide(Dan)
	Show(Dan,0)		--hide�Ashow�i��WriteRoleValue���\
	
	DW_MoveToFlag(Dan,780627,7,0,1)
	Beginplot(Mio,"LuaS_423244_ACT2",0)
--	Sleep(30)
	
	Say(Dan,"[SC_423244_ACT9]")						--�����I
	Sleep(30)
	AdjustFaceDir( Mio, Arnimo,3 )
	Say(Arnimo,"[SC_423244_ACT10]")						--�����I.....�o��k�h�A���§A�C
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	--�ۤU
	Sleep(30)
	Say(Jx,"[SC_423244_ACT11]")							--�����¡A�A�o�����I�X�����A�̶��C
	Sleep(30)
	Say(Mio,"[SC_423244_ACT12]")						--�O�C
	Beginplot(Jx,"LuaS_423244_ACT3",0)
	--DW_MoveToFlag(Mio,�X,�X��,0,1)
	Sleep(30)
	AdjustFaceDir( Arnimo,Mio, 3 )
	AdjustFaceDir( Mio, Arnimo,3 )
	Say(Mio,"[SC_423244_ACT13]")						--�����A�ЩM�ڽͽʹM���_�������X�C
	PlayMotion(Mio,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--���Ъ�pose
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT14]")						--�����A�ָ�ڨӡC
	
	Beginplot(Arnimo,"LuaS_423244_ACT4",0)
	Sleep(10)
	Beginplot(Mio,"LuaS_423244_ACT1",0)
	Beginplot(Dan,"LuaS_423244_ACT4",0)
	Sleep(40)
	Delobj(Arnimo)
	Delobj(Mio)
	Delobj(Dan)
	Delobj(Jx)
	
	local P = {}
	P = SearchRangePlayer(OwnerID() , 350)	--�j�M���񪱮a
	For i=0,table.getn(P)-1 do
		if	CheckAcceptQuest( P[i], 423244 )==true	then
			SetFlag(P[i] , 543942 , 1)	--���U�@�ӥ��Ȫ��e�m�X��
		end
	end
	CancelBuff( TargetID()  , 503977   )
	CancelBuff( TargetID()  , 506812   )
	DisableQuest( OwnerID() , false )
	
end


function LuaS_423244_ACT1()
	DW_MoveToFlag(OwnerID(),780627,4,0,1)
end	

function LuaS_423244_ACT2()
	DW_MoveToFlag(OwnerID(),780627,8,0,1)
end	

function LuaS_423244_ACT3()
	DW_MoveToFlag(OwnerID(),780627,9,0,1)
	Sleep(30)
	Hide(OwnerID())
end	

function LuaS_423244_ACT4()
	DW_MoveToFlag(OwnerID(),780627,10,0,1)
	Sleep(30)
	Hide(OwnerID())
end	

function LuaS_423244_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423244)==false		and	
			CheckBuff( Player , 506812) == true		then
			break
		end
		if	CheckBuff( Player , 506812) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  ,506812  )
	CancelBuff( Player  ,503977   )	
end
