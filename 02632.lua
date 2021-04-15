
-----------------------------�@���۵�----------------------------

Function lua_nehelia_Crouch()
	local NPC=OwnerID()
	local Speak={ "[SC_424960_01]" , "[SC_424960_02]" , "[SC_424960_03]" }
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	while TRUE do
	local i = RandRange(1,3)
	NPCSay ( NPC, Speak[i] )
	Sleep(200)
	end
	sleep(30)
end


-----------------------------------------------------------------
----------------------------NPC���----------------------------
-----------------------------------------------------------------

Function lua_nehelia_Z23_01()
	local NPC=TargetID()
	local Player=OwnerID()
--	local CheckA=CheckFlag(Player,546205)			--�ɤ�
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--�O�_������
	local Report=CountBodyItem( Player, 241122 )		--�ˬd241122���~�ƶq

	SetSpeakDetail ( Player,"[SC_424960_01]".."[SC_424960_02]")	--�o�ܤ@�j��

	if CheckQ==false				and
	CheckCompleteQuest(Player, 425015)==true	then
		AddSpeakOption( Player , NPC , "[SC_424960_ADD]" , "lua_nehelia_Z23_02", 0 )
	elseif CheckQ==true and Report==0 then
		SetSpeakDetail ( Player,"[SC_424960_05]")	--[$playername]�A�y�y�K���n���ԩԪ�
	end

end


Function lua_nehelia_Z23_02()
	local NPC=TargetID()
	local Player=OwnerID()
	LoadQuestOption ( Player )
end


Function lua_nehelia_Z23_03()--�Ʊ_�̪��H
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--�ˬd�_����424960����
	local CheckTalk=CheckFlag( Player , 546277 )		--�V���i�D�����˹��
	local Report=CountBodyItem( Player, 241122 )		--�ˬd241122���~�ƶq

--	SetSpeakDetail ( Player,"[SC_424960_06]")		--����...�o�����u�O�ӴΤF�I�G�M�O�o�Ӽˤl���ܡH
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player, 424960 ) == true	then
		if CheckQ==true and CheckTalk==false then
			AddSpeakOption( Player , NPC , "[SC_424960_ADD1]" , "lua_nehelia_Z23_04", 0 )
		elseif CheckQ==true and CheckTalk==true and Report==0 and CheckFlag( Player , 546278 )==false	then
			SetSpeakDetail ( Player,"[SC_424960_09]")	--���U�ЧA���n�H�N�N�o�򭫭n���F����n�ܡA��s���i�i�O�ڭ̬�s���ߦ嵲���C
			GiveBodyItem( Player , 241122, 1 )	--�����\���Ʃw����s���i
			SetFlag ( Player, 546280 , 1 )
		end	
	end

end


Function lua_nehelia_Z23_04()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_07]")	--�@�H�A�O�֡A�s�Ӫ����e���ܡH
	AddSpeakOption( Player , NPC , "[SC_424960_ADD2]" , "lua_nehelia_Z23_05", 0 )
end


Function lua_nehelia_Z23_05()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_08]")	--�\���Ưu�O�@�د��_���ͪ��A[$playername]�]�o��ı�o�a�H��i���[��L�̪��ͺA�u�O�ӴΤF�I
	SetFlag ( Player , 546277 , 1 )		--�}�һP���i�͸ܹL����
	GiveBodyItem( Player , 241122, 1 )	--�����\���Ʃw����s���i
	SetFlag ( Player, 546280 , 1 )
end


Function lua_nehelia_Z23_06()
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--�ˬd�_����424960����
	local CheckTalk1=CheckFlag( Player , 546277 )		--�V���i�D�����˹��
	local CheckTalk2=CheckFlag( Player , 546278 )		--�N��s�ѥ浹�״��D���f
	local Report1=CountBodyItem( Player, 241122 )		--�ˬd241122���~�ƶq
	local Report2=CountBodyItem( Player, 241251 )		--�ˬd241251���~�ƶq

--	SetSpeakDetail ( Player,"[SC_424960_10]")	--���L�F�s�A�S�b�o�̬ݨ�\���ƱڡA���ڲ`�`ı�o�ۤv���s�b�D�`�����p�B���q�C
	if CheckAcceptQuest( Player, 424960 ) == true	then
		if CheckTalk1==true and Report1==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")				--�@�I[$playername]�A�A�^�ӤF�C
			AddSpeakOption( Player , NPC , "[SC_424960_ADD3]" , "lua_nehelia_Z23_07", 0 )	--��X���i��
		elseif CheckTalk2==true and Report2==0 and CheckFlag( Player , 546279 )==false	then
			SetSpeakDetail ( Player,"[SC_424960_13]")	--�u�O���ڥ���F�A�A���|�p���ʤ߱N���i�ѧ˥�O�H
			GiveBodyItem( Player, 241251, 1 )	--�����״������i��
			SetFlag( Player, 546281, 1 )
		elseif CheckTalk1==true and Report1==0 and Report2==0 then
			SetSpeakDetail ( Player,"[SC_424960_11]".."[SC_424960_14]")	--�A�]�۰g��\���ƪ��S��ͺA�F�ܡH�e�̪��T�O�ܯS�O�S���K
		elseif CheckTalk1==true and Report1==0 and Report2==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")
		elseif CheckTalk1==true and Report1==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")
		end
	else
		LoadQuestOption(Player)
	end

	AddSpeakOption(Player, NPC,"[SC_424960_HELP_02]","LuaPG_AskForMedicine",0)
end


Function lua_nehelia_Z23_07()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_12]")	--(�L���L���i�Ѩäj���a�ٵ��F�@�U)
	DelBodyItem( Player, 241122 , 1 )		--�R���\���Ʃw����s���i��
	GiveBodyItem( Player, 241251, 1 )	--�����״������i��
	SetFlag(Player , 546280 , 1 )
	SetFlag(Player , 546278 , 1 )		--�}�Ҭ�s�ѥ�X�h�X��
	SetFlag(Player , 546281 , 1 )
end


Function lua_nehelia_Z23_08()
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--�ˬd�_����424960����
	local CheckTalk=CheckFlag( Player , 546278 )		--�ˬd�O�_���P�״���ܺX��
	local Report=CountBodyItem( Player, 241251 )		--�ˬd241251���~�ƶq

--	SetSpeakDetail ( Player,"[SC_424960_15]")	--�ޡA�h�L�I�o�̪����r���~�۷�h�A�`�N�@�I�I
--	LoadQuestOption(Player)
	if CheckQ==true and CheckTalk==true and Report==1 and CheckFlag( Player , 546279 )==false	then
		SetSpeakDetail ( Player,"[SC_424960_16]")		--���e�����F�@�W�h�L�h������i�����e���ȡA���G��{�b�H���٨S�^��
		AddSpeakOption( Player , NPC , "[SC_424960_ADD4]" , "lua_nehelia_Z23_09", 0 )	--��X���i��
	else 
		LoadQuestOption(Player)
	end

end


Function lua_nehelia_Z23_09()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546279 , 1 )
	DelBodyItem(Player, 241251, 1)
	CloseSpeak(Player)
end

Function lua_nehelia_Z23_10()
	local NPC=TargetID()
	local Player=OwnerID()

	SetFlag ( Player , 546205 , 0 )
	SetFlag ( Player , 546277 , 0 )
	SetFlag ( Player , 546278 , 0 )
	SetFlag ( Player , 546279 , 0 )
	SetFlag ( Player , 546280 , 0 )
	SetFlag ( Player , 546281 , 0 )

	DelBodyItem( Player , 241122 , 1 )
	DelBodyItem( Player , 241251 , 1 )

end


Function lua_nehelia_Z23_11()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546280 , 0 )
end

Function lua_nehelia_Z23_12()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546281 , 0 )
end