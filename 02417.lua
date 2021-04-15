function Lua_na_norika_check()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) 
--	say( OwnerID(), "O" )
--	Say( TargetID(), "T" )
	local X= CheckFlag(OwnerID(), 545147) --�ˬd�����X��
	local Y= CheckFlag(OwnerID(), 544870) --�ˬd�C��X��
	if X == true then --����w�g��������
		SetSpeakDetail( OwnerID(), "[SC_117252_NA01]") --�u��s�v�u���ܦ���O�I�N�ӧڤ@�w�n�����@�W�ܼF�`���ľ��v�A���U��h���H�I
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "Lua_na_skillcraft_story" , 0)  --�����`���Ѩ�
	elseif Y == true then
		LoadQuestOption( OwnerID() )	
	else --����|����������
		SetSpeakDetail( OwnerID(), "[SC_117252_NA02]") 
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_117252_NA03]" , "Lua_na_norika_givekey" , 0)  --�@�N��U�ռ��d
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "Lua_na_skillcraft_story" , 0)  --�����`���Ѩ�
	end
end


function Lua_na_skillcraft_story() --�����`���ѨӤ���
	SetSpeakDetail ( OwnerID(), "[SC_SKILLCRAFT_02]" )
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_110068_2]" , "Lua_na_norika_check" , 0)  --�^��W�@��
end


function Lua_na_norika_givekey()
--	LoadQuestOption (OwnerID() )
	SetFlag( OwnerID(), 544870 , 1) --�����i�����Ȫ��X��
	CloseSpeak( OwnerID())
end


function Lua_na_norika_dailyflag() --�������ȵ����C��X��
	SetFlag( TargetID(), 544870, 0 ) --�R���i�����ȺX��
	SetFlag(TargetID(), 545147,1 ) --�����������Ȫ��X��
end


function Lua_na_209461_check()  --�ռ��d���է@�~ �P�_BUFF (���~)
	local A = CheckBuff( OwnerID(), 509971)
	local B = CheckBuff( OwnerID(), 509972)
	local C = CheckBuff( OwnerID(), 509974)
	local D = CheckBuff( OwnerID(), 509975)
	local E = CheckBuff( OwnerID(), 509976)

	if A == true or B == true or C== true or D == true or E == true then  --�p�G���W�w�g������@�ت��A
		return false
	else  --�i�H�ϥ�
		return TRUE
	end
end




function Lua_na_artistry_event_magic() -- ���~�ϥΫ�A�H����o�k�N�ĪG(���~�ĪG)
	local X = rand(5)
	if X == 0 then
		AddBuff ( OwnerID(), 509971, 0, -1 )  --�p���I
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA01]", 0 ) --�Aı�o��M�ܻ��դF...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA01]", 0 ) --�Aı�o��M�ܻ��դF...
	elseif X == 1 then --�j�H��
		AddBuff ( OwnerID(), 509972, 0, -1 )	
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA02]", 0 ) --�A��Mı�o�⤤��X�����������O�q...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA02]", 0 ) --�A��Mı�o�⤤��X�����������O�q...
	elseif X == 2 then --�I�w������
		AddBuff ( OwnerID(), 509974, 0, -1 )	
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA03]", 0 ) --��O�A�@�I�@�w����_...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA03]", 0 ) --��O�A�@�I�@�w����_...
	elseif X == 3 then --�p�i�R
		AddBuff ( OwnerID(), 509975, 0, -1 )
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA04]", 0 ) --�i�R���~��A��򦳤H�˱o�ˮ`�A...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA04]", 0 ) --�i�R���~���A��򦳤H�˱o�ˮ`�A...
	else  --�����h
		AddBuff ( OwnerID(), 509976, 0, -1 )
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA05]", 0 ) --��M...�{�l�@�}���h...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA05]", 0 ) --��M...�{�l�@�}���h...
	end
end		
