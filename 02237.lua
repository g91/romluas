function LuaS_117324()

-- Zone13�M�Ψ��o�s��¾�~�X��

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then

		local jobflag = ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) + 544753 	-- �������o���a¾�~flag�s���]544754~544761�^
	
		    if ( jobflag == 544753 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YOUAREGM]", 0 ) -- �A�O�C���޲z�̡A�A�L�k�ѹC����¾�~�ɮvNPC���o��¾�~�C�Шϥ�GM�R�O�C
		elseif  ( jobflag > 544761 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_NEWJOBADDED]", 0 ) -- �`�N�A���o¾�~�ɵo�ͤF�������~�I�i��O���a��ܤF�s�����s�W��¾�~�y���F���~�I
		elseif  ( jobflag < 544753 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_ERROR_GETJOB]", 0 ) -- �`�N�A���o¾�~�ɵo�ͤF�������~�I
		else
			SetFlag( OwnerID() , jobflag , 1 )	-- �����ӷs��¾�~��flag
		end
		SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
	end
end


function LuaS_117407_0() --�H�c
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_117407_1", 0 ) --/*�}�ҫH�c
end

function LuaS_117407_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

function LuaS_117307_1()
	if CheckAcceptQuest( OwnerID(), 423863 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_423863_1]") -- �A�n�A���ѭn�I����O�H���M�ڭ̦b�ɵ������W�J�줣�֧x���A���A���i�H��ڴ��ݬݡC
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423863_1]" ,"LuaS_117307_2", 0) -- ���n�N��A�аݦ��i�H�ΨӪw�������ä�ܡH
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_117307_2()
	SetSpeakDetail(OwnerID(), "[SC_423863_2]") -- �x�H�A�O������ܡH�]�U���^
	SetFlag(OwnerID(), 544749, 1)
end

function LuaS_117305_1()
	if CheckAcceptQuest( OwnerID(), 423860 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_423860_1]") -- �������
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_1]" ,"LuaS_117305_2", 0) -- �z�n�A�K�K�Ѻ~�����ڨӸ�A���Q�ӷ|�ӿ��٧U���Ť�K
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_117305_2()
	if CountBodyItem(OwnerID(), 209034) <= 0 then
		SetSpeakDetail(OwnerID(), "[SC_423860_2]") -- �Ť�H�ڡA���A���G�T��O���o��@�^�ơK�]�U��
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_2]" ,"LuaS_117305_3", 0) -- ���¶Q�|���B�n���U�A�ȳ��_�I�̨�|�|�û��O�o�A�̪��^�m���C
	else
		SetSpeakDetail(OwnerID(), "[SC_423860_3]") -- �o�K�p�G�A���F�ٷQ�A���A�ڷ|�ܧx�Z���C���i���O���q�����Y�A�O�öQ���Ť�o�K
		AddSpeakOption(OwnerID(), TargetID() ,"[SO_423860_3]" ,"LuaS_117305_3", 0) -- ��B�藍�_�A�ڤ@�ɦ��k��F�A���ѰO��A���L�Ť�F�C
	end
end

---- �^�O

function LuaFA_117290_01()
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag(Owner,544779) == TRUE and CheckFlag(Owner,544741) == FALSE
	and CheckAcceptQuest(Owner,423861) == TRUE then
		DebugMsg(0,0,"in")
		SetSpeakDetail(Owner,"[SC_117290_01]")	-- �A�^�O�n�F�ܡH
		AddSpeakOption(Owner,Target,"[SC_117290_O_01]","LuaFA_117290_Check",0)	-- �^�O�n�F�A���禬
		AddSpeakOption(Owner,Target,"[SC_117290_O_02]","LuaFA_117290_Skip",0)	-- �c�A�A���ڪ��F��˥�F�K
	else
		DebugMsg(0,0,"out")
		LoadQuestOption(Owner)
	end
end

function LuaFA_117290_Check(Mode)
	local TempRune
	local Owner
	local Target

	if Mode == 1 then
		Target = OwnerID()
		Owner = TargetID()
	else
		Owner = OwnerID()
		Target = TargetID()
	end

	local Rune1 = EM_ItemValueType_Rune1

	for i = 0 , 30	do
		for j = 0, 3	do
			TempRune = GetItemInfo( Owner , EM_ItemPacketType_EQ , i , Rune1 + j )
			if TempRune == 520121 then
				if Mode == 1 then
					FA_Dialog_Choose( Owner, "[SC_117290_OK]", nil, nil, 1, 1 ) -- ���A�A�bxxx�W���^�Fooo��
					SetFlag(Owner,544741,1)	-- �L��					
				else
					SetSpeakDetail(Owner,"[SC_117290_OK]")	-- ���A�A�bxxx�W���^�Fooo��
					SetFlag(Owner,544741,1)	-- �L��
--					LoadQuestOption(Owner)
				end
				return
			end
		end
	end
	if Mode == 1 then
		FA_Dialog_Choose( Owner, "[SC_117290_NO]", nil, nil, 1, 1 ) -- ���A�A�bxxx�W���^�Fooo��
	else
		SetSpeakDetail(Owner,"[SC_117290_NO]")	-- �ڨS�ݨ�A���W���ڡA�p�G�A���A�N��b���W���ڬݧa�C
	end
end

function LuaFA_117290_Skip(Mode)
	local Owner
	local Target

	if Mode == 1 then
		Target = OwnerID()
		Owner = TargetID()
	else
		Owner = OwnerID()
		Target = TargetID()
	end

	if Mode == 1 then
		FA_Dialog_Choose( Owner, "[SC_117290_SKIP]", nil, nil, 1, 1 ) -- ...�A���A�N�����F�A���a�C
	else
		SetSpeakDetail(Owner,"[SC_117290_SKIP]")	-- ...�A���A�N�����F�A���a�C
	end
	SetFlag(Owner,544741,1)	-- �u�n���A�L��
end

function LuaFA_423861()

	local Target = TargetID()
	local Option = {	{ "[SC_117290_O_01]",	function ()
								LuaFA_117290_Check(1)
							end				},

				{ "[SC_117290_O_02]",	function ()
								LuaFA_117290_Skip(1)
							end				}	}

	if CheckFlag( Target, 544779 ) == FALSE then

		FA_Dialog_Choose( Target, "[SC_423861_GIVE]", nil, nil, 1 ) -- �o�ӲŤ�򥴬}�����A
		SetFlag( Target, 544779, 1)
		GiveBodyItem( Target, 520121, 1)
		GiveBodyItem( Target, 209307, 1)
	elseif CheckFlag( Target, 544741 ) ~= TRUE then
		DebugMsg(0,0,"test")
		FA_Dialog_Choose( Target, "[SC_117290_01]", Option, nil, 1 ) -- �A�^�O�n�F�ܡH
	end
end

function LuaFA_423861_Done()
	local Target = TargetID()
	SetFlag( Target, 544779, 0)
	SetFlag( Target, 544741, 0)
end

-----


function LuaS_117305_3()
	if CountBodyItem(OwnerID(), 209034) <= 0 then
		GiveBodyItem(OwnerID(), 209034, 1)
	end
	CloseSpeak(OwnerID())
end

function LuaS_423863_Teatime()
	addbuff(TargetID(),508708,1,600) -- �O�o��^600
	LuaS_423863_Count()
end

function LuaS_423863_Count()
	local x
	x = FN_CountBuffLevel(TargetID(), 508709)	-- ���o508709�o��buff�����|�q�]�p�ơ^
	if x >= 4 then				-- �Y�W�L3���A�h
		SetFlag(TargetID(), 544751, 1)	-- ���u�R�i���ͱ��v
	else					-- �S�W�L�N�~�򩹤W�|
		if x == -1 then
			x = 0
		end
		x = x + 1
		CancelBuff(TargetID(), 508709)
		AddBuff(TargetID(),508709, x, -1)
		x = FN_CountBuffLevel(TargetID(), 508709)
	end
end

function LuaS_209054_book_0()	--���b209054���U
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_209054_BOOK]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, "[SC_209054_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID �ҭn����������ID(��0�h��������)�A�r�ꬰ���ѭ����D
end

function LuaS_117289_1()
	if CheckAcceptQuest(OwnerID(), 423896) == true and DW_CheckRide(OwnerID()) == true then
		SetFlag (OwnerID(), 544750, 1)
	else
		SetFlag (OwnerID(), 544750, 0)
	end

	LoadQuestOption( OwnerID() )

end

function LuaS_117394_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(), 423824) == true and CheckFlag(OwnerID(), 544753) == false then
		AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_1]", "LuaS_117394_2", 0)	--�A�n�A�аݱz�O��Ʋ��k�h�ܡH�ڦ��]�q�n��e���z�C
	end
end

function LuaS_117394_2()
	PlayMotion( TargetID(),  ruFUSION_ACTORSTATE_EMOTE_ANGRY )  
	SetSpeakDetail(OwnerID(),"[SC_423824_1]")	-- �K����H�k�h�H�I�A�b�V�d�ڶܡH�ڬO�u��ƧQ�v�S���A���A�ݧڭ��̹��O�k�H�F�H�I
	AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_2]", "LuaS_117394_3", 0)	--�x�K�x�H�I�i�O[117294]���z�O�u�k�h�v�K�K
end

function LuaS_117394_3()
	SetSpeakDetail(OwnerID(),"[SC_423824_2]")	-- ��I�ڦ��Ӳq��S�O[117294]�b�ۭt�H�I�ӹL���F�A�ڥu�O�ѥͪ��o����M�q�@�I�A���D�ڿ��F�ܡH�K��F�A�ͧA����]��ƵL�ɡC��F��F�C
	AddSpeakOption(OwnerID(), TargetID(), "[SO_423824_3]", "LuaS_117394_4", 0)	--�u���ܹ藍�_�K
end

function LuaS_117394_4()
	CloseSpeak( OwnerID() ); 
	npcSay( TargetID(), "[SC_423824_3]")	-- ������@�Ѩ�߳��n�Q�H�~�{���k�H�ڡA�ڹ�b�����F�K
	PlayMotion(  TargetID(),  ruFUSION_ACTORSTATE_EMOTE_CRY ) 
	SetFlag(OwnerID(), 544753, 1)
end

function LuaS_117294_1()	--��
	PlayMotion( OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_LAUGH )  
	npcsay(OwnerID(), "[SC_117294_1]")
end

function LuaFA_423868_Comp ()
	local Player = TargetID()
	ScriptMessage(Player,Player,1,"[SC_423868_COMP]",C_Red)		-- ť���q�F�A�ӥh���h���D��F�C�t�Τ������r
	ScriptMessage(Player,Player,0,"[SC_423868_COMP]",C_Red)		-- ť���q�F�A�ӥh���h���D��F�C��ܮج��r
end