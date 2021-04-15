
---------------------���H���
function LuaS_422128()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422128)==true )and( CheckCompleteQuest( OwnerID() , 422128) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422128]","LuaS_422128_1",0) --�A����|�X�{�b�o�̡H
	end

	if (CheckAcceptQuest(OwnerID(),422130)==true )and( CheckCompleteQuest( OwnerID() , 422130) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422130_3]","LuaS_422130_1",0) --�A�Q�줰������p��H�ʮ�ɫ㪺��]�H
	end
end

function LuaS_422128_1()  

	SetSpeakDetail(OwnerID(),"[SC_422128_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422128_2]","LuaS_422128_2",0) --��p���_�A�A���O���٬O�����D�A������|�X�{�b�o�̡H
end

function LuaS_422128_2()  

	SetSpeakDetail(OwnerID(),"[SC_422128_3]")
	SetFlag(OwnerID() , 542440 , 1 )
end


function LuaS_422130_1()  ---------------------�p��H�ɫ㪺��]

	SetSpeakDetail(OwnerID(),"[SC_422130]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422130_1]","LuaS_422130_2",0) --��....�O��...��H���ֺq�T��D�`�����ʤH...
end

function LuaS_422130_2()  

	SetSpeakDetail(OwnerID(),"[SC_422130_2]")
	SetFlag(OwnerID() , 542441 , 1 )
end

-------------------���H���C��

function LuaS_422129()  


	if (CheckAcceptQuest(OwnerID(),422129)==true )then
		if ( CheckFlag( OwnerID() , 542443 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_1]","LuaS_422129_1",0) --��ı�o���׬O�G�y��������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_2]","LuaS_422129_1",0) --��ı�o���׬O�G���`
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_3]","LuaS_422129_2",0) --��ı�o���׬O�G�೽�H
		end

		if ( CheckFlag( OwnerID() , 542443 )==true)and(CheckFlag( OwnerID() , 542444 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129_8]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_9]","LuaS_422129_1",0) --��ı�o���׬O�G�s�]����
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_10]","LuaS_422129_5",0) --��ı�o���׬O�G������
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_11]","LuaS_422129_1",0) --��ı�o���׬O�G��۱�
		end

		if (CheckFlag( OwnerID() , 542444 )==true)and(CheckFlag( OwnerID() , 542470 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129_12]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_13]","LuaS_422129_6",0) --�p��H�A���F�H�ڭ̻��֨Ӫ��C���a�I
		end

		if (CheckFlag( OwnerID() , 542470 )==true)and(CountBodyItem( OwnerID(), 204132 )<3)then
			LoadQuestOption( OwnerID() )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_16]","LuaS_422129_10",0) --�ڧ�p��H�g�ħ˥�F�A�i�H�A���ڤ@�ӶܡH
		end
	else
		LoadQuestOption( OwnerID() )
	end
	
end

function LuaS_422129_1()  
	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422129_3" , 0 )
end

function LuaS_422129_2()  

	CloseSpeak( OwnerID() )
	SetFlag(OwnerID() , 542443 , 1 )
	BeginPlot( TargetID() , "LuaS_422129_4" , 0 )
end

function LuaS_422129_3()  

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422129_4]" )---�A�����o�I
	sleep(20)
	Say( OwnerID() , "[SC_422129_5]" )---�i���A���`���S���Τ߻Ⲥ�۵M�������A�[��|�P���ܤ�.....
	sleep(20)
	Say( OwnerID() , "[SC_422129_6]" )---�A�����A�n�~����A�ڭn�]�h���_�ӤF�I���A�Q�쵪�פ���A�A�ӧ�ڧa��
	sleep(30)
	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(20)
	DisableQuest( OwnerID() , false )
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422129_4()  

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422129_7]" )---���ߧA����F�I�A�u�O�ӥO��H�g�Ī��å��A�ӳ��ڪ��a�A�ڭn�~��]�h���_���o�I
	GiveBodyItem( TargetID(), 204132, 1 )
	sleep(30)
	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(20)
	DisableQuest( OwnerID() , false )
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422129_5()  

	CloseSpeak( OwnerID() )
	SetFlag(OwnerID() , 542444 , 1 )
	BeginPlot( TargetID() , "LuaS_422129_4" , 0 )
end

function LuaS_422129_6()  

	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_422129_7",0)
end

function LuaS_422129_7()  
						
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542469, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101750 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_422129_8",0)
	BeginPlot(NPC,"LuaS_422129_9",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_422129_14]" ) --�A�S�ݨ��ڥ��b�{�u��ҨƱ��ܡH���M���_�ڪ���ҡA�ӥi�c�F�I
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542469 ) == true then 
				Say( OwnerID() , "[SC_422129_15]" ) --�z�I�A���O��u�j�A���o�ڦn�k��㤣�L�ڨ쩳�O���F�H���|��M�o��ͮ�H
				SetFlag(TargetID() , 542470 , 1 )
				GiveBodyItem( TargetID(), 204132, 1 )	
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_422129_8()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542469, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422129_9()
	LuaFunc_Obj_Suicide(50)
end

function LuaS_422129_10()

	SetSpeakDetail(OwnerID(),"[SC_422129_17]")
	GiveBodyItem( OwnerID(), 204132, 1 )	
end














