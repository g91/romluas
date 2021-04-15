function LuaS_114353_0()
	local Zone = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
--DEBUGMSG(0,0,zONE.."!!"..aREA)
	local Flag = {}
	for i = 15 , 21 , 1 do
		Flag[i] = {}
	end
	Flag = {
			[15] = {[777] = 543704 } ,
			[16] = {[820] = 543705} ,
			[17] = {[923] = 544327} , 
			[18] = {[643] = 544624} ,
			[19] = {[522] = 544680} ,
			[20] = {[222] = 545465},
			[21] = {[333] = 545618}
			}
	if Zone > 99 or Zone < 15 then
		LoadQuestOption( OwnerID() )		
	else
		SetSpeakDetail( OwnerID() , "[SC_114353_0]" )
		--���I�h�L����h�a��A�ש�S�^��o���j���F�C
		--
		--�ޡI���䪺�å�A�Ѥl���Ѥ߱��n�A�A�n������N���a�I
		if CheckFlag( OwnerID() , Flag[Zone][Area] ) == false then
			SetFlag( OwnerID() , Flag[Zone][Area] , 1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111256_OT]", C_SYSTEM );
		end
		if CheckFlag( OwnerID()  , 540001 ) == false then
			SetFlag( OwnerID()  , 540001 , 1 )
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_Q]" , "LuaS_114353_Q", 0 ); --�ǰe�O����H
		if Zone == 15 and Area == 777 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_114353_BACK]" , "LuaS_114353_TIPS", 0 ); --�A��N�ڰe�^[ZONE_YGGNO LAND]�ܡH
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_S]" , "LuaS_114353_S", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
		if CheckBuff( OwnerID() , 501638 ) == false then
			LuaS_Area_List_After9(Zone , Area,Flag)
		end
	end
end

function LuaS_114353_Q()

	SetSpeakDetail( OwnerID(), "[SC_114353_QD]");
	--�I��A�b[ZONE_YGGNO LAND]���a�賣�S�Ǩ�F��ڡH
	--�Ѥl�N�j�o�O�d���A�ЧA�@���a�I
	--
	--�O�n�o�I����ǰe�N�n�Q���O�J��s�ΡC
	--
	--�A�u�ݭn�O�o�o�I�N�n�F�A�I��

	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACKTALK]" , "LuaS_114353_0", 0 ); 	--�ڷQ�^���誺���

end

function LuaS_114353_S()

	local Zone = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Point = {}
	local Str = ""
	for i = 15 , 19 , 1 do
		Point[i] = {}
	end
	Point = {
			[15] = {[777]="[ZONE_DAELANIS]"} , 
			[16] = {[820] = "[ZONE_SOUTH_JENOTAR_FOREST]"} ,
			[17] = {[923]="[ZONE_NORTHERN_JANOST_FOREST]"} ,
			[18] = {[643]="[ZONE_LYMUN_KINGDOM]"} ,
			[19] = {[522]="[ZONE_CAMPBELL_TOWNSHIP]"} ,
			[20] = {[222] ="[ZONE_FIREBOOT_DWARF_FORTRESS]"},
			[21] = {[333] ="[ZONE_TORAGG_CARAVAN]"}
			}

	if Zone > 99 or Zone < 15 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if Point[Zone][Area] == nil then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	else
		Str = "[SC_TRANSFER_SAVEHOME_MEG][$SETVAR1="..Point[Zone][Area].."]"
	end
	
	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, Str  , C_SYSTEM )	--�e�������T���G�z�N�^�{�a�I�n�O�b�}���E���I
		ScriptMessage( OwnerID(), OwnerID(), 0, Str , 0 )	--�z�N�^�{�a�I�n�O�b�}���E���I
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[ST_TRANSFER_FAIL]"  , C_SYSTEM )	--�e�������T���G�^�{�a�I�n�O���ѡI
		ScriptMessage( OwnerID(), OwnerID(), 0, "[ST_TRANSFER_FAIL]" , 0 )	--�^�{�a�I�n�O���ѡI
	end

	CloseSpeak( OwnerID() );	--������ܵ���

end

function LuaS_114353_TIPS()

	SetSpeakDetail( OwnerID(), "[SC_114353_TIPS]");
	--�A��ǰe����²�檺�Ʊ��A��H
	--�i�D�A�A�O��q�o���j����t�@���j����������²��C
	--�p�G�A�u���Q�^�h���ܡA�ګ᭱�����̭������`�M�h�Ϊ��H�A�̪�L�̱`�`���ӳo����j���C
	--�h�ݰݬݨ��ǳå�a�I�L�����Ӧ���k�e�A�^�h�C

	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACKTALK]" , "LuaS_114353_0", 0 ); 	--�ڷQ�^���誺���
	
end