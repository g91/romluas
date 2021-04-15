---------------------------------------------------------------
------------------------NPCtalking---------------------------
function lua_nehelia_Music_NPC()	--NPC
	local Player=OwnerID()
	local NPC=TargetID()

	local A=CheckFlag ( Player , 546497 )		--���W
	local B=CheckFlag ( Player , 546498 )		--�ǰe
	local C=CheckFlag ( Player , 546499 )		--����
	local ItemA=CountBodyItem( Player , 241362 )	--�豵���Ȫ��~
	local ItemB=CountBodyItem( Player , 241363 )	--���ȥ��Ѫ��~
	local ItemC=CountBodyItem( Player , 241365 )	--���Ȧ��\���~

	if A==false and C==false then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_01]")						--�K�A[$playername]�A�Aı�o�ڭ�~�t�������֦p��ڡH
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_02]" , "lua_nehelia_Music_NPC1", 0 )	--���Ų��¬O����?
	elseif A==true and ItemA==0 and ItemB==0 and ItemC==0 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_27]")
		AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_Music_NPC4", 0 )	--�S���D�A�浹�ڧa�I
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_28]" , "lua_nehelia_Music_obj1", 0 )		--�ڤ��Q���F
	elseif ItemA>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_06]".."[SC_MUSIC_2012NE_07]")
			if B ==false then
			AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_08]" , "lua_nehelia_Music_NPC3", 0 )		--�аe�ڹL�h
			end
	elseif ItemB>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_24]")
		SetFlag( Player , 546499 , 1 )		--����
		SetFlag( Player , 546497 , 0 )		--���W����
		GiveBodyItem ( Player , 202903 , 1 )	--�������y**�O�o��
		DelBodyItem( Player , 241363 , 1 )	--�R�����ȵ^
	elseif ItemC>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_11]")
		SetFlag( Player , 546499 , 1 )		--����
		SetFlag( Player , 546497 , 0 )		--���W����
		GiveBodyItem ( Player , 202903 , 1 )	--�������y**�O�o��
		DelBodyItem( Player , 241365 , 1 )	--�R�����ȵ^
		SetFlag( Player , 546501 , 0 )		--���ȧ������¹������
	else
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_18]")
	end

end


function lua_nehelia_Music_NPC1()
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_03]".."[SC_MUSIC_2012NE_04]")		--�C�~�o�ӮɭԡA�b�Z��R��������|�X�{���Ų��¡C	
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_Music_NPC2", 0 )--�S���D�A�浹�ڧa�I
end


function lua_nehelia_Music_NPC2()
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_05]".."[SC_MUSIC_2012NE_06]".."[SC_MUSIC_2012NE_07]")--�z��u�O�Ӧn�F�A�o�O�ڪ��^�A���N���U�A�o��I
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_08]" , "lua_nehelia_Music_NPC3", 0 )		--�аe�ڹL�h
	SetFlag( Player , 546497 , 1 )		--���}���WFlag
	GiveBodyItem( Player , 241362 , 1 )	--��������ԩԪ��^
end


function lua_nehelia_Music_NPC3()	--FLY
	local Player=OwnerID()
	local NPC=TargetID()
	SetFlag( Player , 546498 , 1 )		--���}�ǰeFlag
	ChangeZone( Player , 2 , -1 , 2374.0 , 30.4 , 259.2 , 20.7)
end

function lua_nehelia_Music_NPC4()	--GIVE
	local Player=OwnerID()
	local NPC=TargetID()
	GiveBodyItem( Player , 241362 , 1 )	--��������ԩԪ��^
end

---------------------------------------------------------------
--------------------------���Ų���----------------------------
function lua_nehelia_Music_altar()	--���Ų���
	local Player=OwnerID()
	local NPC=TargetID()
	local Check=CheckBuff ( Player , 622517 )
	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local PlayerVoc = ReadRoleValue( Player , EM_RoleValue_VOC  )	--Ū���a¾�~(1.��2.�C3.�v4.�k5.��6.�M7.��8.��)


	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_22]")
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_23]" , "lua_nehelia_Music_altar1", 0 )	--�жǰe�ڦ^�h

		if Point==4 and Check==false then	--5��
			if PlayerVoc==4 or PlayerVoc==5 or PlayerVoc==7 or PlayerVoc==8 then	--�k�t
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622519 , 0 , -1 )
				AddBuff ( Player , 622596 , 0 , -1 )	--��t��Buff			
				CancelBuff ( Player , 622516 )
				DelBodyItem( Player , 241362 , 1 )	--�R�����ȵ^
				GiveBodyItem( Player , 241365 , 1 )	--�������ֵ^
				SetFlag( Player , 546501 , 1 )		--���}�������Ȳ��¹��
			else
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622518 , 0 , -1 )
				AddBuff ( Player , 622596 , 0 , -1 )	--��t��Buff			
				CancelBuff ( Player , 622516 )			
				DelBodyItem( Player , 241362 , 1 )	--�R�����ȵ^
				GiveBodyItem( Player , 241365 , 1 )	--�������ֵ^
				SetFlag( Player , 546501 , 1 )		--���}�������Ȳ��¹��
			end
		elseif Point==4 and Check==true then	--5��+Bunus����
			if PlayerVoc==4 or PlayerVoc==5 or PlayerVoc==7 or PlayerVoc==8 then	--�k�t
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622593 , 0 , -1 )
				AddBuff ( Player , 622597 , 0 , -1 )	--��t��Buff			
				CancelBuff ( Player , 622516 )
				CancelBuff ( Player , 622517 )
				DelBodyItem( Player , 241362 , 1 )	--�R�����ȵ^
				GiveBodyItem( Player , 241365 , 1 )	--�������ֵ^
				SetFlag( Player , 546501 , 1 )		--���}�������Ȳ��¹��
			else
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622592 , 0 , -1 )
				AddBuff ( Player , 622597 , 0 , -1 )	--��t��Buff			
				CancelBuff ( Player , 622516 )
				CancelBuff ( Player , 622517 )
				DelBodyItem( Player , 241362 , 1 )	--�R�����ȵ^
				GiveBodyItem( Player , 241365 , 1 )	--�������ֵ^
				SetFlag( Player , 546501 , 1 )		--���}�������Ȳ��¹��
			end
		else
			SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_20]")
		end

end


function lua_nehelia_Music_altar1()	--�������A���^�h
	local Player=OwnerID()
	local NPC=TargetID()
--	Tell( Player , NPC , "Good Luck" )
	ChangeZone( Player , 2 , -1 , 3009.7 , 44.9 , 98.4 , 179.5)
end

---------------------------------------------------------------
----------------------------�p���F----------------------------

function lua_nehelia_Music_elf()		--�p���F
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_12]")
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_25]" , "lua_nehelia_Music_elf1", 0 )
end


function lua_nehelia_Music_elf1()	--�p���F1
	local Player=OwnerID()
	local NPC=TargetID()
	local CheckFly=CheckFlag ( Player , 546500 )
	local Buff=CheckBuff ( Player , 622516 )
	local Bonus=CheckBuff ( Player , 622517 )

	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_13]")
	if CheckFly==false then
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_15]" , "lua_nehelia_Music_elf2", 0 )	--�����ҩ�
	end
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_16]" , "lua_nehelia_Music_elf3", 0 )		--�ǰe�̲Ť�
	if Buff==true or Bonus==true then
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_29]" , "lua_nehelia_Music_elf4", 0 )	--�ڸ����n���W�A����L��k��
	end
end


function lua_nehelia_Music_elf2()	--�p���F��2
	local Player=OwnerID()
	local NPC=TargetID()
	local Check=CheckBuff ( Player , 622516 )
	local Point=FN_CountBuffLevel( Player , 622516 ) 

	if Check==false then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	end
--	if Point==0 then	--1��
--		SetFlag( Player , 546500 , 1 )
--		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
--		ChangeZone( Player , 2 , -1 , 2569.9 , 26.0 , 194.5 , 9.5)		--DO
--	elseif Point==1 then	--2��
--		SetFlag( Player , 546500 , 1 )
--		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
--		ChangeZone( Player , 2 , -1 , 2705.1 , 69.8 , 1.4 , 83.9)		--RE
	if Point==2 then	--3��
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2626.8 , 81.8 , -91.2 , 62.1)		--MI
	elseif Point==3 then	--4��
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2667 , 86.7 , -159.0 , 90.9)		--FA
	elseif Point==4 then	--5��
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2504.4 , 118.0 , -354.1 , 132.5)		--SO
	else
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	end
end


function lua_nehelia_Music_elf3()	--�p���F��3
	local Player=OwnerID()
	local NPC=TargetID()
	local CheckItem=CountBodyItem( Player , 202903 )

	if CheckItem==0 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	elseif CheckItem>=5 then
		ChangeZone( Player , 2 , -1 , -1301.8 , 55.0 , -5581.1 , 130.7)
	end
end


function lua_nehelia_Music_elf4()	--�p���F4
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_17]")						--�u�O���d�A�~�o�@�I�W�N����F�ڡH
	AddSpeakOption( Player , NPC , "[SC_FAIRYTALE_2011_11]" , "lua_nehelia_Music_elf5", 0 )	--�n��
end

function lua_nehelia_Music_elf5()	--�p���F5
	local Player=OwnerID()
	local NPC=TargetID()
	DelBodyItem( Player , 241362 , 1 )	--�R�����ȵ^
	GiveBodyItem( Player , 241363 , 1 )	--�������ѵ^
	CancelBuff ( Player , 622516 )
	CancelBuff ( Player , 622517 )
	CloseSpeak ( Player )
end

---------------------------------------------------------------
-----------------------------�R���^---------------------------
function lua_nehelia_Music_obj1()
	local Player=OwnerID()
	local Talk=CheckFlag ( Player , 546501 )

	if Talk==false then
		ScriptMessage(Player,Player,1,"[SC_421696]",C_SYSTEM)	--���ȥ���
		SetFlag( Player , 546497 , 0 )		--���W����
		SetFlag( Player , 546499 , 1 )		--�����}��
		CancelBuff ( Player , 622516 )
		CancelBuff ( Player , 622517 )
		Closespeak( Player )
	else
		SetFlag( Player , 546497 , 0 )		--���W����
		SetFlag( Player , 546499 , 1 )		--�����}��
		Closespeak( Player )			
	end

end

---------------------------------------------------------------
------------------------------�q��----------------------------
---------------------------------------------------------------

function lua_nehelia_MusicR1()	--TEST�]�Ӷ]�h
	local Stone= OwnerID()	--��ê
	local flag = 781134	--�߿ߺX��
	local flagcount = 1	--�Ĥ@���߿ߺX��
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--����BALL��X�l���üƤ@�ӡA�åB�b�üƽd�򤺡C
		flagcount = flagcount +1
			if flagcount > 2 then			--2�ӺX�ШӦ^�N���A0����	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR2()	--TEST�]�Ӷ]�h
	local Stone= OwnerID()	--��ê
	local flag = 781135	--�߿ߺX��
	local flagcount = 1	--�Ĥ@���߿ߺX��
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--����BALL��X�l���üƤ@�ӡA�åB�b�üƽd�򤺡C
		flagcount = flagcount +1
			if flagcount > 2 then			--3�ӺX�ШӦ^�N���A0����	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR3()	--TEST�]�Ӷ]�h
	local Stone= OwnerID()	--��ê
	local flag = 781136	--�߿ߺX��
	local flagcount = 1	--�Ĥ@���߿ߺX��
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--����BALL��X�l���üƤ@�ӡA�åB�b�üƽd�򤺡C
		flagcount = flagcount +1
			if flagcount > 5 then			--5�ӺX�ШӦ^�N���A0����	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR4()	--�j���׶]�Ӷ]�h
	local Stone= OwnerID()	--��ê
	local flag = 781138	--�߿ߺX��
	local flagcount = 1	--�Ĥ@���߿ߺX��
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--����BALL��X�l���üƤ@�ӡA�åB�b�üƽd�򤺡C
		flagcount = flagcount +1
			if flagcount > 10 then			--11�ӺX�ШӦ^�N���A0����	
				flagcount = 1
			end
			Sleep(10)
		end
end


---------------------------------------------------------------
--------------���諦�������S�X�{----------------------------
---------------------------------------------------------------

function lua_nehelia_Music01()	--TEST�X�{�S����3��
	local Stairs= OwnerID()	--��ê
	local Time=0
	local HID = 0		--�}��

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--���O
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--�аO
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--����


	While TRUE do
		if time%3 == 0 then		--�P�w�l��=0�A��10��`�����}��
			if HID == 0 then	--��e����s�b�A����
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--����
				CastsPell( Stairs , Stairs , 499361 )						--����I�k�_�h���a
				HID = 1
			elseif HID ~= 0 then	--��e��������A�X�{
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--����
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end

function lua_nehelia_Music02()	--TEST�X�{�S����10��
	local Stairs= OwnerID()	--��ê
	local Time=0
	local HID = 0		--�}��

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--���O
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--�аO
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--����

	While TRUE do
		if time%10 == 0 then		--�P�w�l��=0�A��10��`�����}��
			if HID == 0 then	--��e����s�b�A����
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--����
				CastsPell( Stairs , Stairs , 499361 )						--����I�k�_�h���a
				HID = 1
			elseif HID ~= 0 then	--��e��������A�X�{
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--����
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end

function lua_nehelia_Music03()	--TEST�X�{�S����6��
	local Stairs= OwnerID()	--��ê
	local Time=0
	local HID = 0		--�}��

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--���O
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--�аO
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--����

	While TRUE do
		if time%6 == 0 then		--�P�w�l��=0�A��10��`�����}��
			if HID == 0 then	--��e����s�b�A����
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--����
				CastsPell( Stairs , Stairs , 499361 )						--����I�k�_�h���a
				HID = 1
			elseif HID ~= 0 then	--��e��������A�X�{
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--����
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end


function lua_nehelia_Music04()	--TEST�X�{�S����4��
	local Stairs= OwnerID()	--��ê
	local Time=0
	local HID = 0		--�}��

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--���O
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--�аO
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--����

	While TRUE do
		if time%4 == 0 then		--�P�w�l��=0�A��10��`�����}��
			if HID == 0 then	--��e����s�b�A����
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--����
				CastsPell( Stairs , Stairs , 499361 )						--����I�k�_�h���a
				HID = 1
			elseif HID ~= 0 then	--��e��������A�X�{
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--���
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--����
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end




--------------------------------------------
-----------------���y�@��-----------------
--------------------------------------------

--Do���y
----------
function lua_nehelia_Music_BallA()	--Do���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallA1",15 )  
end

function lua_nehelia_Music_BallA1()
	local Player=OwnerID()
	local Flag=CheckFlag( Player , 546497 )
	if Flag==true then
		if CheckBuff( Player , 622516 )  == false then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) 	-- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
		end
	end
end

--Re���y
----------
function lua_nehelia_Music_BallB()	--Re���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallB1",15 )  
end

function lua_nehelia_Music_BallB1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==0 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end

--Mi���y
----------
function lua_nehelia_Music_BallC()	--Mi���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallC1",15 )  
end

function lua_nehelia_Music_BallC1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==1 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end


--Fa���y
----------
function lua_nehelia_Music_BallD()	--Fa���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallD1",15 )  
end

function lua_nehelia_Music_BallD1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==2 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end


--So���y
----------
function lua_nehelia_Music_BallE()	--So���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallE1",15 )  
end

function lua_nehelia_Music_BallE1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==3 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end

--La���y
----------
function lua_nehelia_Music_BallF()	--La���y
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_BallF1",15 )  
end

function lua_nehelia_Music_BallF1()
	local Player=OwnerID()
	local Check=CheckBuff( Player , 622517 )
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Check==false then
		AddBuff ( Player , 622517 , 0 , -1 )	
		end
	end
end


----------------------------------------------------------------------------------
------------------�H�U�����ե�--------------------------------------------------
----------------------------------------------------------------------------------

function lua_nehelia_Music_Ball01()	--���yĲ�I��Buff�@��
	local Ball= OwnerID()		--��ê
	SetPlot( Ball ,"range","lua_nehelia_Music_Ball02",15 )  
end


function lua_nehelia_Music_Ball02()
	local Player=OwnerID()
	AddBuff ( Player , 622442 , 0 , -1 )
end

function lua_nehelia_MusicBall03()	--TEST�]�Ӷ]�h
	local Stone= OwnerID()	--��ê
	local flag = 781113	--�߿ߺX��
	local flagcount = 1	--�Ĥ@���߿ߺX��
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--����BALL��X�l���üƤ@�ӡA�åB�b�üƽd�򤺡C
		flagcount = flagcount +1
			if flagcount > 5 then			--5�ӺX�ШӦ^�N��	
				flagcount = 1
			end
			Sleep(10)
		end
end


function lua_nehelia_MusicBall04()
	local Player=OwnerID()
	local Stone=120721
	CastsPell( Stone , Stone , 499361 )						--����I�k�_�h���a
end

