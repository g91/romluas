---------------------------------------------------------------------------------------------------------------------------------------------------------
--121988 �����N��l/��ܼ@��
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_na_2013music_121988() --�����N��l�@���A���æu��
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 200)
	local OrgID = 100938	
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
		LuaN_miyon_action02()
end


--�����N����ܼ@��
function Lua_na_2013music_121988_0() 
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag( Owner , 547704) == true then --����w�����L����
		SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_5]") --
		AddSpeakOption(Owner , Target , "[SC_2013MUSIC_121988_01]","Lua_na_2013music_121988_1",0 ) 
		AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --��20��[241640]�I��1��[204428]�C����	
	else
 		SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_0]")
		AddSpeakOption( Owner , Owner , "[SC_2013MUSIC_121988_00]" , "Lua_na_2013music_121988_2" , 0 ) --�X�ʯd�n���A���k
--		AddSpeakOption( Owner , Owner  , "[SC_2013MUSIC_121988_02]", "Lua_na_2013music_item1" , 0 ) --��20��[241640]�I��[241640]�C�ֳ�
	end	
end

--�������дݭ����\��
function Lua_na_2013music_121988_1() 
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_1]") --����������дݭ����T��
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --��20��[241640]�I��1��[204428]�C����	
end

--�d�n�����W�h
function Lua_na_2013music_121988_2() 
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2013MUSIC_121988_2]" )
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_02]" , "Lua_na_2013music_item1",0 )  --��10��[241640]�I��[241640]�C�ֳ�
	AddSpeakOption(Owner , Owner , "[SC_2013MUSIC_121988_03]" ,"Lua_na_2013music_item2",0 ) --��20��[241640]�I��1��[204428]�C����	
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�I�����~
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--�I���״_���ֳ��A�@�魭��@���A�ߤ@���~
function Lua_na_2013music_item1() 
	local Owner = OwnerID()
	CloseSpeak(Owner)
	if  CountBodyItem( Owner , 241641 ) == 1 then --���W�w�g���ֳ�
		ScriptMessage( Owner , Owner , 1 , "[SC_Z23Q425436_2]" , 0 ) --�A�w�g�֦��ۦP���F��F�C
	else --���W�S���ֳ�
		if CountBodyItem( Owner , 241640 ) >= 10 then --���W�֦�10�i�H�W���}�l������
			DelBodyItem( Owner , 241640 , 10 )
			GiveBodyItem( Owner , 241641 , 1 ) --�����״_���ֳ�
		--	SetFlag( Owner ,547703 , 1 ) --��������w������X��
		else
			ScriptMessage( Owner , Owner , 1 ,  "[SC_112311_6]" , 0 ) --�z�ҫ������ƶq�����A�٤���I����C
		end
		
	end
end

--�I������
function Lua_na_2013music_item2() 
	local Owner = OwnerID()
	CloseSpeak(Owner)
	if CountBodyItem( Owner , 241640 ) >= 20 then --���W�֦�20�i�H�W���}�l������
		DelBodyItem( Owner , 241640 , 20 )
		GiveBodyItem( Owner , 204428 , 1 ) --��������
	else
		ScriptMessage( Owner , Owner , 1 ,  "[SC_112311_6]" , 0 ) --�z�ҫ������ƶq�����A�٤���I����C
	end
end




function Lua_na_test_motion()
	local Owner = OwnerID()
	for i=1, 5 do
		sleep(20)
		Say( Owner , 1)
		PlayMotion( Owner , 145)
		sleep(20)
		Say( Owner , 2)
		PlayMotion( Owner , 146)
		Sleep(50)
		Say( Owner ,3)
		PlayMotion( Owner , 146)
	end
end
	


--------------------------------------------------------------------
--���ի��O
--------------------------------------------------------------------
function Lua_na_2013music_clear()
	local Owner = OwnerID()
	SetFlag( Owner , 547703 , 0 ) --����
	SetFlag( Owner , 547704 , 0 ) --����
end


function Lua_na_2013Music_test1(Round) --�s�����
	local Owner = OwnerID()
	local BuffLv =  FN_CountBuffLevel(Owner , 624054 ) --�ˬd���a���WBUFF
	AddBuff(Owner, 624054 , Round , 150 )
end

function Lua_na_2013Music_test2(Score) --�ӤH����
	local Owner = OwnerID()
	local BuffLv =  FN_CountBuffLevel(Owner , 624135 ) --�ˬd���a���WBUFF
	AddBuff(Owner, 624135 , Score , 150 )
end