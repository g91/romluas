--    Zone 134 �ݪ���_�j�ĩ�
--      /gm ? zone 134 0 1662.1 891.5 -1710.4

-----�ѥ۳N �Ѱ��ƥ۳N��
function lua_Dy_Z18Boss_1_Del()
	CancelBuff( TargetID(), 507619 )
end

function AP_Zone134_104458_hole()   ---���Y���Y�H
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ---Ū�X���
	local Boss = ReadRoleValue( AI , EM_RoleValue_Register1 ) ---Ū�XBoss
	local Counter = 0
	local Firt_attack = 0 ---�Ĥ@��������
	local Check_No_Atk = 0 ----�ؼШ��W�����i������Buff �P�_
	local Attackplayer ----�p���Y�H���������a
	local Check_allattack = 0 ---�P�_�������a���O�ۤƪ��A�U
	while 1 do
		sleep(10)
		Counter = Counter + 1
		for i = 1 , 500 , 1 do
			Attackplayer = Lua_AP_HateTargetID( Boss )
			if i == 500 and CheckBuff(Attackplayer , 507619) == true then
				Check_allattack = 1
				SetAttack( OwnerID() ,Attackplayer  )
				break
			elseif CheckBuff(Attackplayer , 507619) == false then
				SetAttack( OwnerID() ,Attackplayer  )
				break
			end
		end
		
		--say(OwnerID(),"Counter ="..Counter)
		if Firt_attack == 0 then
			SetAttack( OwnerID() ,Attackplayer  )
			Firt_attack = 1
		end
		
		if CheckBuff(Attackplayer , 507619) == true and Check_allattack == 0 then --�p�G���b�l�����ؼШ��W����Buff�h�P�_�ȧ��ܡC
			Check_No_Atk = 1
		end
		
		if Counter >= 10 or Check_No_Atk == 1 then 
			SetAttack( OwnerID() ,Attackplayer  )
			Check_allattack = 0
			Counter = 0
			Check_No_Atk = 0
		end
	end
end

-------------�H�U�}�l��Boss���f����ܼ@��-------------------
function AP_Zone134_bone()
	SetPlot( OwnerID(),"touch","AP_Zone134_bone_1",20 )
end

function AP_Zone134_bone_1()
	SetPlot(TargetID(), "touch" ,"" , 0) 
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dog_NPC = star_CreateObj( TargetID() , 116435 , 0 , 0 , 0 , Room , 0) --�ͥX����Buff��NPC
	playMotion(Dog_NPC,ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Say(Dog_NPC,"[SC_116435_8]")
end

function AP_Zone134_bone_2()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_0_0]" , "AP_Zone134_bone_2_0", 0 ) --�}����
	
end

function AP_Zone134_bone_2_0()
	if CheckBuff( OwnerID() , 507704) == true then --�Q�~�{����U���}����
		SetSpeakDetail( OwnerID(), "[SC_116435_5]"   ) --�Q�~�{����U���}����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_5_1]" , "AP_Zone134_bone_2_3", 0 ) --�M�D���U
	elseif CheckBuff( OwnerID() , 507723 ) == true and CheckBuff ( OwnerID() , 507618 ) == false then --���ΥB�w���\���LBuff
		SetSpeakDetail( OwnerID(), "[SC_116435_6]"   ) --�ٻݭn���U��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_3]" , "AP_Zone134_bone_2_2", 0 ) --�����A�^�F��Ӫ��a�I�k�C
	elseif CheckBuff( OwnerID() , 507618 ) == true then --�w����\�����f
		SetSpeakDetail( OwnerID(), "[SC_116435_7]"   ) 
	elseif CheckBuff( OwnerID() , 507704) == false then
		SetSpeakDetail( OwnerID(), "[SC_116435_0_1]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_0]" , "AP_Zone134_bone_2_1", 0 ) --�}����
	end
end

function AP_Zone134_bone_2_1() --�ݭ^�F���|�b�o��
	SetSpeakDetail( OwnerID(), "[SC_116435_1]"   )--�^�F�����ۤv�b�o�̪���]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_1_1]" , "AP_Zone134_bone_2_1_1", 0 ) --�~��ť�U�h�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_1_2]" , "AP_Zone134_bone_2_1_N", 0 ) --���~��ť�U�h
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "AP_Zone134_bone_2_0", 0 ) --�^��W�@��
end

function AP_Zone134_bone_2_1_N() --���~��ť�U�h�����
	SetSpeakDetail( OwnerID(), "[SC_116435_1_2_N]"   )--���~��ť�U�h�����
end

function AP_Zone134_bone_2_1_1() --�~��ť�U�h�����
	SetSpeakDetail( OwnerID(), "[SC_116435_2]"   )--�^�F�����ۤv�i�H���U�_�I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_3]" , "AP_Zone134_bone_2_2", 0 ) --�����A�^�F��Ӫ��a�I�k�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_4]" , "AP_Zone134_bone_2_1_1_N", 0 ) --�ڵ�
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "AP_Zone134_bone_2_1", 0 ) --�^��W�@��
end

function AP_Zone134_bone_2_1_1_N() --�~�{�^�F�O�j�ĩԤ�U�����
	SetSpeakDetail( OwnerID(), "[SC_116435_4_N]"   )--�ڵ����U 
	Addbuff( OwnerID() ,507704,0, -1 ) ---�W�@���ˬd�Ϊ���Buff
end

function AP_Zone134_bone_2_3() --��ܺp�N�ôM�D���U
	SetSpeakDetail( OwnerID(), "[SC_116435_5_2]"   )--�����D�p�����U���a
	AddSpeakOption( OwnerID(), TargetID(), "[SC_116435_5_3]" , "AP_Zone134_bone_2_2", 0 ) --�L�`���������U
end

function AP_Zone134_bone_2_2()
	CastSpellLV( TargetID() , OwnerID()  , 496155 , 1 )
	Addbuff( OwnerID() ,507723,0, -1 ) ---���ݭn�A�c�ƹ�ܪ��ˬd ��ZONE����
	CloseSpeak( OwnerID() )
	if CheckBuff( OwnerID() , 507704) == true then
		CancelBuff( OwnerID(), 507704 )
	end
end