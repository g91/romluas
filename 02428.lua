function Lua_Zone21_105677_SkillLv( Switch )	--�G���]���̧ޯ�j�� /GM ? Zone 141 0 1730.1 939.9 12.4
	local SkillLv={};
	if Switch==1 then	--Boss
		--�����qA
		SkillLv[1]=44;	--���t����--27600
		SkillLv[2]=11;	--�c�F����--18000
		SkillLv[3]=11;	--�����s�q--14700
		--50%+
		SkillLv[4]=13;	--���L--11400
		SkillLv[5]=20;	--�G�k��--210%
		SkillLv[6]=5;	--�U����A�w�t�Ӹ`���ܼҪO�վ�--60%
		--50%-
		SkillLv[7]=12;	--�t�v�gŧ--13650
		SkillLv[8]=19;	--�ͩR�l���A�����վ�缾�a���ˮ`--20%
		SkillLv[9]=12;	--�ͩR�I�z����--10800
		SkillLv[10]=10;	--���ܭ���--13000
		SkillLv[11]=600;	--�����z���A�г]�w��ʦ�
		--�����qB
		SkillLv[12]=11;	--�z�����(�Ԥh)--19600
		SkillLv[13]=6;	--�·t�s��(�C�L)--6500
		SkillLv[14]={11,17};	--{ ���ɳ����ˮ`(�v��) , �r�v�����ˮ`(�v��) } --14400,9000
		SkillLv[15]=0;	--�T�D����(�k�v)
		SkillLv[16]=0;	--�{�B�}(���q)
		SkillLv[17]=19;	--�K�大��(�M�h)--20%
		SkillLv[18]=14;	--�Q�b(����)--14100
		SkillLv[19]=0;	--�t�F�_�d(���x)�P�Ϥ���
		SkillLv[20]=0;	--�t�F�_�d(���x)�P�Ϫ�§�g
	elseif Switch == 2 then	--BossBuff�A�����վ�C�������|����
		SkillLv[1]=4;	--���ġA�W�[���z�ˮ`(�Ԥh)--5%
		SkillLv[2]=1;	--�g���A�W�[CRI(�C�L)--2000
		SkillLv[3]=4;	--�v�̤��t(�v��)--5%
		SkillLv[4]=4;	--�������~(�k�v)--5%
		SkillLv[5]=4;	--�t�F�u��+�·t�̻�(���q)�A�޻P�]���@��--5%
		SkillLv[6]=4;	--�j����@(�M�h)--5%
		SkillLv[8]=2;	--�]¡�N(���x)--60000
	elseif Switch == 3 then	--�p�ǧޯ�
		SkillLv[1]=0;	--�D�����x(�Ԥh)�A�����վ㮣�߫���ɶ�--4sec.
		SkillLv[2]=5;	--�Ĩ�(�Ԥh)�A�����վ㪫�z�ˮ`�A���t��ƽЦܼҪO�վ�--7200
		SkillLv[3]=11;	--�]���b(�C�L)�A�����վ㪫�z�ˮ`--11400/3250
		SkillLv[4]=9;	--���v����(�C�L)--8250
		SkillLv[5]=7;	--���Ψ��(�v��)--10000
		SkillLv[6]=7;	--�p���N(�k�v)--10000
		SkillLv[7]=11;	--�U�V(�k�v)--9800
		SkillLv[8]=0;	--�]���b�n(���q)�A�����վ��F��s�b���--5sec.
		SkillLv[9]=2;	--�H���B(���q)--3%
		SkillLv[10]=0;	--�b�v����(�M�h)�A�b���վ㪺�����F�𪺦s�b���--5sec.
		SkillLv[11]=8;	--�±ۭ�(�M�h)--9000
		SkillLv[12]=8;	--���F(����)--10080
		SkillLv[13]=3;	--�ۼv���(����)�A�ϼu�ˮ`�b���վ�A�����ƻݨ�ҪO�վ�--4%
		SkillLv[14]=0;	--�]����¡(���x)--8500
		SkillLv[15]=11;	 --«�a�b(���x)--10350
	end
	return SkillLv
end

function Lua_Zone21_105677_Skillid( Switch )	--�G���]���̧ޯ�j��
	local Skillid={};
	if Switch==1 then	--Boss
		--�����qA
		Skillid[1]=497896;	--�����
		Skillid[2]=497897;	--����AE
		Skillid[3]=497898;	--���Z��AE
		--50%+
		Skillid[4]=497902;	--���L(�¤� AE)
		Skillid[5]=497899;	--�G�k��(���� AE)
		Skillid[6]=497901;	--�U���(���� AE)
		--50%-
		Skillid[7]=497905;	--�C�ˮ` AE
		Skillid[8]=497906;	--�l���ͩR
		Skillid[9]=497908;	--�ͩR�I�z����
		Skillid[10]=497909;	--�ܧΥ��� AE
		--Skillid[11]=498055;	--���z�Ǧ��z
		--�����qB
		Skillid[12]=497870;	--�z�����(�Ԥh)
		Skillid[13]=497871;	--�·t�s��(�C�L)
		Skillid[14]={498052,498053};	--{ �z������(�v��) , �@�r����(�v��) }
		Skillid[15]=497874;	--�ޯ�T�D(�k�v)
		Skillid[16]=497875;	--�B��(���q)
		Skillid[17]=497876;	--���@����(�M�h)
		Skillid[18]=497877;	--�Q�r��(����)
		Skillid[19]=497878;	--�Ϥ���(���x)
		Skillid[20]=497894;	--�Ϫ�§�g(���x)
	elseif Switch == 2 then	--BossBuff
		Skillid[1]=620043;	--�W�[���z�ˮ`(�Ԥh)
		Skillid[2]=620044;	--�W�[CRI(�C�L)
		Skillid[3]=620045;	--�W�[��t(�v��)
		Skillid[4]=620046;	--�W�[�k��(�k�v)
		Skillid[5]=620047;	--�W�[�޻P�]��(���q)
		Skillid[6]=620049;	--�W�[����(�M�h)
		Skillid[8]=620051;	--�l�[Hot(���x)
	elseif Switch == 3 then	--�p�ǧޯ�
		Skillid[1]=497879;	--���x(�Ԥh)
		Skillid[2]=497880;	--����(�Ԥh)
		Skillid[3]=497881;	--����b(�C�L)
		Skillid[4]=497882;	--���V����(�C�L)
		Skillid[5]=497883;	--��������(�v��)
		Skillid[6]=497884;	--�q���N(�k�v)
		Skillid[7]=497885;	--�Һ�����(�k�v)
		Skillid[8]=620078;	--�t���@�n(���q)
		Skillid[9]=497887;	--�방�H��(���q)
		Skillid[10]=620079;	--�t����(�M�h)
		Skillid[11]=497889;	--�ۭ�����(�M�h)
		Skillid[12]=497890;	--���F���O(����)
		Skillid[13]=497891;	--��Ƭ�(����)
		Skillid[14]=497895;	--��¡�b��(���x)
		Skillid[15]=497893;	--�a���b(���x)
	end
	return Skillid;
end

function Lua_Zone21_105677_DelAllObj( rebornBoss )--Boss���`�Τ����`�����ɰ���
	local Oid = OwnerID();
	local RoomID = ReadRoleValue(Oid ,EM_RoleValue_RoomID);
	
	if rebornBoss ==2 then--boss���`
		if Lua_Zone21_7Heros_FinalBoss[RoomID].Boss~=nil then
			ScriptMessage( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss , -1 , 2 , "[SC_105677_BOSSDEAD]" , C_SYSTEM )--Boss���`
			DelObj( ReadRoleValue( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss , EM_RoleValue_Register2 ) );--�R���]�k�}
		end
	else--Boss���m
		if Lua_Zone21_7Heros_FinalBoss[RoomID].Boss~=nil then
			ScriptMessage( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss , -1 , 2 , "[SC_105677_LEAVEBATTLE]" , C_SYSTEM )--Boss���}�԰�
			DelObj( ReadRoleValue( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss , EM_RoleValue_Register2 ) );--�R���]�k�}
			DelObj( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss );
		end
	end
	DebugMsg( 0,0,"Kill all Player!!!!" );
	local PlayerCount =  SetSearchAllPlayer(RoomID);
	local Player = 0;
	for i=1,PlayerCount do
		Player = GetSearchResult();
		CancelBuff_NoEvent( Player , 620085 ); CancelBuff_NoEvent( Player , 620080 ); CancelBuff_NoEvent( Player , 620075 );
		if CheckBuff( Player , 620087 )==true  then--���a�b�G��
			if rebornBoss==2 then--Boss���`
				SetPos( Player , kg_GetPosRX({780986,3} , nil , 20 ,0 , math.random(360) ) );--�Ǩ�~��
				CancelBuff( Player , 620087 );
			else
				CancelBuff( Player , 620087 ); --Say(Player , "I am Dead!!!"); --KillID( Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss , Player );
				SysCastSpellLv( Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss , Player , 498051 , 120 );--Boss�S���h�N���a��������
			end
		end
	end
	
	local  TempMonster = SearchRangeNPC(Oid , 1000);
	for i =0 , #TempMonster do
		if ReadRoleValue( TempMonster[i] , EM_RoleValue_OrgID )==105835 then
			DelObj( TempMonster[i] );
		end
	end
	
	if Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject~=nil then
		for i,v in pairs(Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject) do
			DelObj(v);
		end
	end
	if Lua_Zone21_7Heros_FinalBoss[RoomID].BombMonster~=nil then
		for i,v in pairs(Lua_Zone21_7Heros_FinalBoss[RoomID].BombMonster) do
			DelObj(v);
		end
	end
	Lua_Zone21_7Heros_FinalBoss[RoomID].BombMonster=nil;
	Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject=nil;
	Lua_Zone21_7Heros_FinalBoss[RoomID].Boss=nil;
	Sleep(10);
	if Zone21_Boss5_Global~=nil then
		if Zone21_Boss5_Global[RoomID]~=nil then
			if Zone21_Boss5_Global[RoomID]["Door"]~=nil then
				CallPlot( Zone21_Boss5_Global[RoomID]["Door"][1] , "Lua_Zone21_CloseDoor" , false );--�}��
			end
		end
	else
		CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , false );--�}��
	end

	
	if rebornBoss==1 then
		Sleep(50);
		BeginPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl , "Lua_Zone21_105677_CreateBoss" ,0 );
	elseif rebornBoss==2 then
		Lua_Zone21_7Heros_FinalBoss[RoomID]=nil;
	end
end

function Lua_Zone21_105677_BossInit(  )
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
	if type(Lua_Zone21_7Heros_FinalBoss)~="table" then
		Lua_Zone21_7Heros_FinalBoss = {};
	end
	if type(Lua_Zone21_7Heros_FinalBoss[RoomID])~="table" then
		Lua_Zone21_7Heros_FinalBoss[RoomID] = {};
	end
	
	if Lua_Zone21_7Heros_FinalBoss.AddVocBuff==nil then
		Lua_Zone21_7Heros_FinalBoss.AddVocBuff = function( Boss , Player )
			local BuffLv = Lua_Zone21_105677_SkillLv(2);
			local BuffID = Lua_Zone21_105677_Skillid(2);
			local Voc = ReadRoleValue( Player , EM_RoleValue_Voc ); DebugMsg(0,0,"DeadPlayerVoc="..Voc );
			if Voc~=0 then
				if Voc<=4 or Voc==6 or Voc ==8 then
					AddBuff( Boss , BuffID[Voc] , BuffLv[Voc] ,-1 );
				elseif Voc==5 then--���q
					AddBuff( Boss , BuffID[Voc] , BuffLv[Voc] ,-1 );
					AddBuff( Boss , 620048 , BuffLv[Voc] ,-1 );--��
				elseif Voc==7 then--�˪L���̡A�۳�p��
					local BossShadow = kg_GetPosRX( Boss , 105835 , 30 , 0 , math.random(360) );
					SetModeEx( BossShadow , EM_SetModeType_Revive, false );
					AddToPartition( BossShadow , ReadRoleValue( Boss ,EM_RoleValue_RoomID) );
				end
			else
				DebugMsg(0,0,"DeadPlayerJob is GM!");
			end
		end;
	end
	if Lua_z21_7Heros_FinalBoss_Digestion==nil then
		function Lua_z21_7Heros_FinalBoss_Digestion()
			local Oid = OwnerID();
			local RoomID = ReadRoleValue( Oid , EM_RoleValue_RoomID );
			while 1 do
				SysCastSpellLv( Oid , Oid ,  498234 , 0 );--��Ҧ����a�I�����
				Sleep(20);
			end
		end
	end
	
	Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl=Ctrl;
	if Zone21_Boss5_Global==nil  then
		if Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor==nil then
			local EnterDoor = CreateObjByFlag( 106012, 780986 , 2 , 1 )--�J�f���ת�
			Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor = EnterDoor;
			kg_DoorInit( EnterDoor );
			AddToPartition( EnterDoor , RoomID );
			CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--�}��
		else
			if CheckID( Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor )==false then
				local EnterDoor = CreateObjByFlag( 106012, 780986 , 2 , 1 )--�J�f���ת�
				Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor = EnterDoor;
				kg_DoorInit( EnterDoor );
				AddToPartition( EnterDoor , RoomID );
				CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--�}��
			end
		end
	end
	
	Sleep(1);
	Lua_Zone21_105677_CreateBoss();
	--EM_RoleValue_Register1 �ҥ�ǹ��
	--EM_RoleValue_Register2 �]�k�}
end

function LuaI_240091_ItemCheck()--Zone21_Boss5_Global[RoomID]["Ctrl"]
	local Player = OwnerID();--�ϥΪ��~�����a
	local RoomID = ReadRoleValue( Player,EM_RoleValue_RoomID );
	if  Zone21_Boss5_Global~=nil  then
		if Zone21_Boss5_Global[RoomID]~=nil then
			if Zone21_Boss5_Global[RoomID]["Actor"]~=nil then
				return true
			end
		end
	end
	
	if ReadRoleValue(Player , EM_RoleValue_ZoneID)==141 then
		return true
	end
	ScriptMessage( Player, Player, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function LuaI_240091_CallFinalBoss()
	local Player = OwnerID();--�ϥΪ��~�����a
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID);
	if Zone21_Boss5_Global~=nil then
		if Zone21_Boss5_Global[RoomID]~=nil then
			if Zone21_Boss5_Global[RoomID]["Actor"]~=nil then
				local actor = Zone21_Boss5_Global[RoomID]["Actor"];
				DelObj( actor );
				Zone21_Boss5_Global[RoomID]["Actor"]= nil;
			end
		end
	end
--	if Lua_Zone21_7Heros_FinalBoss~=nil then
--		if  Lua_Zone21_7Heros_FinalBoss[RoomID]~=nil then
--			if  Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl~=nil then
--				if CheckID( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss )==true and ReadRoleValue( Lua_Zone21_7Heros_FinalBoss[RoomID].Boss,EM_RoleValue_IsDead )==0 then
--					DebugMsg(0,0,"FinalBoss Exist");
--					return
--				else
--					BeginPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl , "Lua_Zone21_105677_CreateBoss" , 0 );
--					return
--				end
--			end
--		end
--	end
	local FinalBossCtrl = kg_GetPosRX(  {780986,0} , 105677 , 20 , 0 , 90 );
	kg_InvisibleObjInit( FinalBossCtrl );
	AddToPartition( FinalBossCtrl , RoomID );
	BeginPlot( FinalBossCtrl , "Lua_Zone21_105677_BossInit" , 0 );
end

function Lua_Zone21_105677_CreateBoss()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
	if Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss ==nil then
		local DigestionBoss = kg_GetPosRX( {780986,4},105677 );
		Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss = DigestionBoss;
		kg_InvisibleObjInit(  DigestionBoss );
		AddToPartition(DigestionBoss , RoomID  );
		BeginPlot( DigestionBoss , "Lua_z21_7Heros_FinalBoss_Digestion" , 0 );
	else
		if CheckID(Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss)==false or ReadRoleValue( Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss, EM_RoleValue_OrgID )~=105677 then
			local DigestionBoss = kg_GetPosRX( {780986,4},105677 );
			Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss = DigestionBoss;
			kg_InvisibleObjInit(  DigestionBoss );
			AddToPartition(DigestionBoss , RoomID  );
			BeginPlot( DigestionBoss , "Lua_z21_7Heros_FinalBoss_Digestion" , 0 );
		end
	end
	
	local Boss = kg_GetPosRX( {780986,0},105677 );
	Lua_Zone21_7Heros_FinalBoss[RoomID].Boss=Boss;
	MoveToFlagEnabled( Boss , false );
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--�i����
	SetModeEx( Boss , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Boss , EM_SetModeType_Fight, false) ---�i���(�_)
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false)---����(�_)
	SetPlot( Boss, "dead" , "Lua_Zone21_105677_DeadEvent" ,30 );
	AddToPartition( Boss , RoomID );
	
	Sleep(100);
	SetModeEx( Boss , EM_SetModeType_Strikback, true) ---����(�_)
	SetModeEx( Boss , EM_SetModeType_Fight, true) ---�i���(�_)
	SetModeEx( Boss , EM_SetModeType_Searchenemy, true)---����(�_)
end

function Lua_Zone21_105677_BossCrazy()--8������g�ɡA���K�ˬd�Z��
	local Boss= OwnerID();
	local timer = 0;
	while 1 do
		if kg_GetDis( Boss , 780986 , 3 )>650 then
			DebugMsg(0,0,"7Heros_FinalBoss out of range");
			CallPlot( Lua_Zone21_7Heros_FinalBoss[ReadRoleValue(Boss,EM_RoleValue_RoomID)].Ctrl ,"Lua_Zone21_105677_DelAllObj",1 );
			return
		end
		if timer==600  then
			ScriptMessage( Boss , -1 , 2 , "[SC_105677_BOSSCRAZY]" , C_SYSTEM )--Boss�g��
			AddBuff(Boss,620276 ,0,-1);
		end
		sleep(20)
		timer=timer+2;
	end
end

function Lua_Zone21_105677_EatPlayer()	--
	Sleep(100);
	local Boss=OwnerID();
	local RoomID = ReadRoleValue(Boss , EM_RoleValue_RoomID);
	Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject={};
	local Lua_z21_105677_CheckBlackHand = function( PlayerList )
		for i in pairs(PlayerList) do
			if CheckBuff( PlayerList[i] , 620075 )==true then
				DebugMsg(0,0,"CheckBlackHand Success!!");
				return true
			end
		end
		DebugMsg(0,0,"CheckBlackHand Fail!!");
		return false
	end
	local Lua_z21_105677_BlackHandFilter = function( PlayerList )
		local NewPlayerList = {};
		for i in pairs(PlayerList) do
			if CheckBuff( PlayerList[i] , 620075 )~=true then
				table.insert( NewPlayerList , PlayerList[i] );
			end
		end
		return NewPlayerList
	end
	
	local Lua_z21_105677_RandPick = function( PlayerList , num )--�H�����H�A��¾�D�@
		local HealerList = {}; local luckyHealer = 0; local NewPlayerList={};
		for i in pairs( PlayerList ) do
			if ReadRoleValue( PlayerList[i] , EM_RoleValue_VOC )==5 or ReadRoleValue( PlayerList[i] , EM_RoleValue_VOC )==8 then
				table.insert( HealerList ,PlayerList[i]  );--Say( PlayerList[i] , "i am healer" );
			else
				table.insert( NewPlayerList ,PlayerList[i]  );
			end
		end
		DebugMsg( 0,0,"NewPlayerListCount = "..#NewPlayerList.." , OldPlayerCount="..#PlayerList.." ,HealerListCount="..#HealerList );
		if #HealerList>0 then	--����¾
			num = num-1;
			luckyHealer = HealerList[ math.random( #HealerList ) ]; --Say( luckyHealer , "i am lucky healer" );
			DebugMsg(0,0," z21_FInalBoss luckyHealer="..luckyHealer );
		end
		if #NewPlayerList>num then
			NewPlayerList = KS_RegroupArray( NewPlayerList , num );--�H���D�H
		end
		if luckyHealer>0 then
			table.insert( NewPlayerList ,luckyHealer );
		end
		DebugMsg( 0,0,"FinalPlayerListCount = "..#NewPlayerList);
		return NewPlayerList
	end
	
	local PlayersInHate= {};
	local MonsterID ,PlayerVoc =0,0;
	local MonsterObjA, MonsterObjB = 0,0;
	while 1 do
		if KS_InCombat(Boss)==true then
			DebugMsg(0,0,"Lua_Zone21_105677_EatPlayer start");
			PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );
			if  table.getn(PlayersInHate)==0 then--��H���b�G�̤F�N�������m
				CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl , "Lua_Zone21_105677_DelAllObj" ,1 );
				return
			end
			if table.getn(PlayersInHate)<=3 then--���a�����Y
				if Lua_z21_105677_CheckBlackHand(PlayersInHate)==false then--�����@�H���¤�buff�N���i�H�������m
					ScriptMessage( Boss , -1 , 2 , "[SC_105677_EAT]" , C_SYSTEM );
					DebugMsg(0,0,"PlayerAllDead..");
					for i in pairs(PlayersInHate) do
						SetPos( PlayersInHate[i] , kg_GetPosRX({780986,4} , nil , 20 ,0 , math.random(360) ) );--�Ǩ�G��
						AddBuff( PlayersInHate[i] , 620087,0,-1 );--�b�G��buff
					end
					Sleep(10);
					CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl , "Lua_Zone21_105677_DelAllObj" ,1 );
					return
				end
			end
			PlayersInHate = Lua_z21_105677_BlackHandFilter( PlayersInHate );--�ư��Q�¤�쪺���a
			if #PlayersInHate>0 then
				if #PlayersInHate>1 then	--�ƩZ
					for i =1,#PlayersInHate do
						if PlayersInHate[i+1]~=nil then
							PlayersInHate[i]=PlayersInHate[i+1];
						else
							PlayersInHate[i]=nil;
						end
					end
				end
				PlayersInHate = Lua_z21_105677_RandPick( PlayersInHate , 3);
				if #PlayersInHate>0 then
					ScriptMessage( Boss , -1 , 2 , "[SC_105677_EAT]" , C_SYSTEM );
					for i in pairs(PlayersInHate) do
						SetPos( PlayersInHate[i] , kg_GetPosRX({780986,4} , nil , 20 ,0 , math.random(360) ) );--�Ǩ�G��
						AddBuff( PlayersInHate[i] , 620087,0,-1 );--�b�G��buff
						PlayerVoc = ReadRoleValue( PlayersInHate[i] , EM_RoleValue_Voc );
						Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[PlayerVoc]=Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[PlayerVoc]+1;
						MonsterID =(PlayerVoc -1) + 105827; DebugMsg(0,0,"voc="..PlayerVoc.." , mosterId="..MonsterID);
						MonsterObjA = kg_GetPosRX( {780986,3}, MonsterID , math.random(50,100) , 10 ,math.random(360) );
						table.insert( Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject , MonsterObjA );
						MonsterObjB = kg_GetPosRX( {780986,4}, MonsterID , math.random(50,100) , 10 ,math.random(360) );
						table.insert( Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject , MonsterObjB );
						WriteRoleValue( MonsterObjA , EM_RoleValue_Register1 , MonsterObjB );
						WriteRoleValue( MonsterObjB , EM_RoleValue_Register1 , MonsterObjA );
						WriteRoleValue( MonsterObjA , EM_RoleValue_Register2 , PlayersInHate[i] );
						WriteRoleValue( MonsterObjB , EM_RoleValue_Register2 , PlayersInHate[i] );
						SetModeEx( MonsterObjA , EM_SetModeType_Revive, false )	--�i����
						SetPlot( MonsterObjA, "dead" , "Lua_Zone21_105677_DeadEvent" ,30 );
						AddToPartition( MonsterObjA,RoomID );
						SetModeEx( MonsterObjB , EM_SetModeType_Revive, false )	--�i����
						SetPlot( MonsterObjB, "dead" , "Lua_Zone21_105677_DeadEvent" ,30 );
						AddToPartition( MonsterObjB,RoomID );
						WriteRoleValue(Boss,EM_RoleValue_Register1, ReadRoleValue(Boss,EM_RoleValue_Register1)+1 );
						DebugMsg(0,0,"CurrentMonseterObj_Count = "..ReadRoleValue(Boss,EM_RoleValue_Register1) );
					end;
					--���ͱ�l�ʱ�3�W���a�A38������
					local Bucket = kg_GetPosRX( {780986,4} , 117201);
					kg_InvisibleObjInit( Bucket );
					AddToPartition( Bucket , RoomID );
					CallPlot( Bucket ,"Lua_Zone21_105677_CheckPlayerInSide" , Boss , PlayersInHate[1], PlayersInHate[2] , PlayersInHate[3] );
					DebugMsg(0,0,"Lua_Zone21_105677_EatPlayer end");
				else
					DebugMsg(0,0,"z21_105677_EatPlayer!!!  No Player!! Amode");
				end
			else
				DebugMsg(0,0,"z21_105677_EatPlayer!!!  No PlayerB!! Bmode");
			end
		else
			return
		end;
		Sleep(400);
	end;
end

function Lua_Zone21_105677_CheckPlayerInSide( Boss , PlayerA,PlayerB,PlayerC )
	local PlayerInSide = {};
	local RoomID = ReadRoleValue( Boss ,EM_RoleValue_RoomID );
	if PlayerA ~= nil then PlayerInSide[1]=PlayerA; end;
	if PlayerB ~= nil then PlayerInSide[2]=PlayerB; end;
	if PlayerC ~= nil then PlayerInSide[3]=PlayerC; end;
	local DeadCount  , timer= 0,0;
	while 1 do
		--DebugMsg(0,0,"InsideTimer="..timer);
		DeadCount = 0;
		if CheckID(Boss)~=true then--Boss���m
			break
		end
		for i in pairs(PlayerInSide) do
			if PlayerInSide[i]>0 and CheckBuff( PlayerInSide[i] , 620087 )~=true then
				PlayerInSide[i]=0;
			elseif PlayerInSide[i]>0 and ReadRoleValue(PlayerInSide[i],EM_RoleValue_IsDead)==1 and kg_GetDis( PlayerInSide[i] ,780986,4)<=200 then
				ScriptMessage( Boss , -1 , 2 , "[SC_105677_PLAYERDEAD]" , C_SYSTEM );
				Lua_Zone21_7Heros_FinalBoss.AddVocBuff( Boss , PlayerInSide[i] );--�P�w���a¾�~��boss buff
				PlayerInSide[i]=0;
				DeadCount = DeadCount+1;
			end;
		end;
		if DeadCount>= table.getn( PlayerInSide ) then break; end; --�ʱ����Ҧ����a�����`
		if timer>=38 then	--38��ɶ���
			for i in pairs(PlayerInSide) do
				if PlayerInSide[i]>0 and CheckID(PlayerInSide[i])==true and CheckBuff( PlayerInSide[i],620087 )==true then
					CancelBuff( PlayerInSide[i] , 620087 );
					Lua_Zone21_7Heros_FinalBoss.AddVocBuff( Boss , PlayerInSide[i] );
					--KillID(  Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss , PlayerInSide[i] );
					SysCastSpellLv( Lua_Zone21_7Heros_FinalBoss[RoomID].DigestionBoss ,PlayerInSide[i],498051,120 );--���a�Q����
				end
			end
			break
		end
		Sleep(20);
		timer = timer+2; 
	end;
	DelObj( OwnerID() );--�R���������
end

function Lua_Zone21_105677_BossAI()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	Lua_Zone21_7Heros_FinalBoss[RoomID].VocList={0,0,0,0,0,0,0,0};--�U¾�~�֭p
	Lua_Zone21_7Heros_FinalBoss[RoomID].BombMonster = {};
	if Zone21_Boss5_Global~=nil and Zone21_Boss5_Global[RoomID]~=nil and Zone21_Boss5_Global[RoomID]["Door"]~=nil then
		CallPlot( Zone21_Boss5_Global[RoomID]["Door"][1] , "Lua_Zone21_CloseDoor" , true , Boss );--����
	elseif Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor~=nil then
		CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , true , Boss );--����
	end
	BeginPlot( Boss , "Lua_Zone21_105677_BossCrazy" , 0 );
	BeginPlot( Boss , "Lua_Zone21_105677_EatPlayer" , 0 );
	local BossSkillid = Lua_Zone21_105677_Skillid( 1 );
	local BossSkilllv = Lua_Zone21_105677_Skilllv( 1 );
	local CurrentSkill ,atkTarget , PlayersInHate = 0,0,{} ;
	local CurrentMagicID , MagicModeB= 0,{};
	local TempRandNum=0;
	local BombMonster=0;
	local x,y,z = 0,0,0;
	ScriptMessage( Boss , -1 , 2 , "[SC_105677_ENTERBATTLE]" , C_SYSTEM )--�i�J�԰��x��
	local timer =1;
	local MagicCircle = kg_GetPosRX( Boss , 105879 );
	WriteRoleValue( Boss , EM_RoleValue_Register2 , MagicCircle );
	kg_InvisibleObjInit(  MagicCircle );
	AddToPartition( MagicCircle , RoomID );
	math.randomseed(math.random(1, 99999));
	Sleep(10);
	while 1 do
		if KS_InCombat(Boss)==true then
			if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0 then
				if timer%7==0 then
					if ReadRoleValue(Boss , EM_RoleValue_Register1)==0 then --�ҥ�ǭp����0
						CurrentSkill = math.random( 1,2 );	--DebugMsg(0,0,"RandomSkill!!! , CurrentSkill="..CurrentSkill);
						atkTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
						CastSpellLv( Boss , atkTarget , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
					else	--mode B
						MagicModeB={};
						for i=1 ,#Lua_Zone21_7Heros_FinalBoss[RoomID].VocList do	--�Q�Y��G�̪�¾�~�C��P�ƶq
							if Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[i]>0 then
								table.insert( MagicModeB , i );
							end;
						end;
						if table.getn(MagicModeB)>0 then
							CurrentSkill = MagicModeB[ math.random( table.getn(MagicModeB) ) ]; --�H���D¾�~
							CurrentSkill = CurrentSkill +11; DebugMsg(0,0,"7Heros_FinalBoss ModeB SkillID="..CurrentSkill);
							if  CurrentSkill>16 then
								CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
							elseif CurrentSkill==12 then--�s��٤T�U
								CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );--�٤@���˦a>�b��2��
							elseif CurrentSkill==13 then--�s��{�q
								PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );
								if table.getn(PlayersInHate)>0 then
									PlayersInHate = KS_RegroupArray( PlayersInHate , 5 );
									for i=1,#PlayersInHate do
										if i==1 then
											CastSpellLv( Boss , PlayersInHate[i] , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
										else
											SysCastSpellLv( Boss , PlayersInHate[i] , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
										end
									end
								end
							elseif CurrentSkill == 14 then--������
								for i =1,3 do
									x,y,z,_ = kg_GetPosRX( { 780986,3 },nil,math.random(100),0,math.random(360) );
									TempRandNum = math.random(2);
									if i==1 then
										CastSpellPos( Boss , x,y,z ,BossSkillid[CurrentSkill][TempRandNum] , BossSkilllv[CurrentSkill][TempRandNum]  );
									else
										SysCastSpellLv_Pos( Boss , x,y,z ,BossSkillid[CurrentSkill][TempRandNum] , BossSkilllv[CurrentSkill][TempRandNum]  );
									end
								end
							elseif CurrentSkill==15 or CurrentSkill==16  then
								PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );
								if table.getn(PlayersInHate)>0 then
									PlayersInHate = KS_RegroupArray( PlayersInHate , 3 );
									for i=1,#PlayersInHate do
										if i==1 then
											CastSpellLv( Boss , PlayersInHate[i] , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
										else
											SysCastSpellLv( Boss , PlayersInHate[i] , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
										end
									end
								end
							end
						end
					end
				elseif timer%13==0 then
					CurrentSkill = 3;
					PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );
					if table.getn(PlayersInHate)>0 then
						atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ];
						x,y,z,_=kg_GetPos( atkTarget );
						SetPos( MagicCircle , x,y,z,0 );
						SetModeEx( MagicCircle , EM_SetModeType_Show, true );--����]�k�}
						ScriptMessage( Boss , -1 , 2 , "[SC_105677_POSAE]" , C_SYSTEM );
						CastSpellPos( Boss , x,y,z ,BossSkillid[CurrentSkill] , 0  );
						kg_WaitSpell( Boss );
						SetModeEx( MagicCircle , EM_SetModeType_Show, false );--�����]�k�}
					end
				else
					if ReadRoleValue(Boss,EM_RoleValue_HP)>ReadRoleValue(Boss,EM_RoleValue_MaxHP)*(50/100) then--50%HP�H�W
						--DebugMsg(0,0,"50%+ , timer="..timer  );
						if timer%19==0 then
							CurrentSkill = 4;--�¤�AE
							ScriptMessage( Boss , -1 , 2 , "[SC_105677_BLACKHAND]" , C_SYSTEM );
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
							kg_WaitSpell( Boss );
							Sleep(10);
							CurrentSkill = 5;--����AE
							ScriptMessage( Boss , -1 , 2 , "[SC_105677_BLACKFOG]" , C_SYSTEM );
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );--120%HP�ˮ`AE
						elseif timer%51==0 then
							CurrentSkill = 6;--����AE
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
							timer=1;
						end
					else	--50%HP�H�U
						if timer%17==0 then
							CurrentSkill = 7;--�C�ˮ`AE
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
						elseif timer%11==0 then
							CurrentSkill =8;--�l���ͩR
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
							kg_WaitSpell( Boss );
							--�X�Ⱖ���z��
							PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 , 620080 , 1 );--���ͩR�I���~�|�i�����
							if table.getn(PlayersInHate)==0 then--�����S�����ͩR�I�z�����a
								PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );
							end
							if table.getn(PlayersInHate)>0 then--���p�٦����a��b�~���B�S���ͩR�I�z
								PlayersInHate = KS_RegroupArray( PlayersInHate , 2 );
								for i = 1,2 do
									if i==1 then
										BombMonster = kg_GetPosRX( Boss, 105892 , 50 , 0 , 90,0 );
									else
										BombMonster = kg_GetPosRX( Boss, 105892 , 50 , 0 , -90,0 );
									end
									table.insert( Lua_Zone21_7Heros_FinalBoss[RoomID].BombMonster , BombMonster );
									MoveToFlagEnabled( BombMonster, false )
									SetModeEx( BombMonster , EM_SetModeType_Fight, false) ---�i���(�_)
									SetModeEx( BombMonster , EM_SetModeType_Revive, false )	--�i����
									SetModeEx( BombMonster , EM_SetModeType_Mark, false)	----�i�I��(�_)
									SetModeEx( BombMonster , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
									AddToPartition( BombMonster , RoomID  );
									if PlayersInHate[i]~=nil then
										SysCastSpellLv( PlayersInHate[i] , BombMonster, 496946, 0 );
									else
										SysCastSpellLv( PlayersInHate[1] , BombMonster, 496946, 0 );
									end
								end
							end
						elseif timer%41==0 then
							CurrentSkill = 10;--�ܧΥ���AE
							CastSpellLv( Boss , Boss , BossSkillid[CurrentSkill] , BossSkilllv[CurrentSkill]  );
							timer=1;
						end
					end
				end
				timer = timer+1; --DebugMsg(0,0,"timer="..timer);
			end
		else
			CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl ,"Lua_Zone21_105677_DelAllObj",1 )
			return
		end
		Sleep(10);
	end
end

function Lua_Zone21_105677_DeadEvent()-- 1 : Boss  2: �p��  3:�¤�
	local Oid =OwnerID();
	local RoomID = ReadRoleValue( Oid,EM_RoleValue_RoomID );
	local OrgID = ReadRoleValue( Oid , EM_RoleValue_OrgID );
	if  OrgID==105677  then--Boss
		CallPlot( Lua_Zone21_7Heros_FinalBoss[RoomID].Ctrl ,"Lua_Zone21_105677_DelAllObj",2 );
		return true;
	elseif OrgID==105878 then--�¤�
		local Player = ReadRoleValue(Oid,EM_RoleValue_Register1);
		local Boss = Lua_Zone21_7Heros_FinalBoss[RoomID].Boss;
		if ReadRoleValue(Player,EM_RoleValue_IsDead)==0 then
			CancelBuff( Player  , 620075 );--�N�¤�j�w���H����Buff
		end
		if CheckID( Boss )==true then
			SysCastSpellLv( Oid , Boss , 497903 , 0 );--��Boss 1% hp
		end
		return true
	else
		--�����ݴ_��
		DebugMsg(0,0,"Zone21_105677 Monster "..ReadRoleValue(Oid , EM_RoleValue_OrgID).." Dead");
		if ReadRoleValue(Oid,EM_RoleValue_Register4)==0 then
			WriteRoleValue( Oid, EM_RoleValue_Register4 , 1 );--�w����
			local MonsterBrother = ReadRoleValue(Oid,EM_RoleValue_Register1);--�t�~�@�Ӥ���
			if CheckID(MonsterBrother)==true and ReadRoleValue(MonsterBrother,EM_RoleValue_Register4)==0 then
				CallPlot( Oid , "Lua_Zone21_105677_RebornCheck" , Oid,MonsterBrother );	--�}�ҭ˼ƭp��
			end
			PlayMotion(Oid,ruFUSION_ACTORSTATE_DYING)--���񦺤`�ʧ@
			SetDefIdleMotion(Oid,ruFUSION_MIME_IDLE_DEAD)--�]�w�]�ʧ@�����`
			AddBuff(Oid,509248,0,-1);--����buff
			kg_DeadBody( Oid );
			return false
		elseif ReadRoleValue(Oid,EM_RoleValue_Register4)==2 then
			return true
		elseif ReadRoleValue(Oid,EM_RoleValue_Register4)==1 then
			--Say(Oid , "already dead");
			return false
		end
	end
end

function Lua_Zone21_105677_RebornCheck( MonA,MonB )
	local RoomID = ReadRoleValue(MonB,EM_RoleValue_RoomID);
	DebugMsg( 0,0, "Lua_Zone21_105677_RebornCheck start");
	for i=1,5 do
		Sleep(10);
		if ReadRoleValue( MonB ,EM_RoleValue_Register4 )>0 then
			WriteRoleValue( MonB ,EM_RoleValue_Register4,2 );
			DebugMsg(0,0," MonA and MonB all Dead... ");
			KillID(MonB,MonB);
			--�N���a�Ǩ�~���A�̳y¾�~���p��
			local Player = ReadRoleValue( MonA , EM_RoleValue_Register2 );
			--Say(Player,"go home");
			SetPos( Player , kg_GetPosRX({780986,3} , nil , 20 ,0 , math.random(360) ) );--�Ǩ�~��
			Sleep(1); CancelBuff( Player , 620087 );
			local PlayerVoc = ReadRoleValue( Player , EM_RoleValue_Voc );  if PlayerVoc==nil then DebugMsg(0,0,"Error PlayerVoc=nil!!"); end
			DebugMsg(0,0," MonsterDead!! ,Voc="..PlayerVoc.." ,Player="..Player );
			Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[PlayerVoc]=Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[PlayerVoc]-1;
			DebugMsg(0,0,"MonsterDead!! ,Voc="..PlayerVoc.." , CurrentVocCount="..Lua_Zone21_7Heros_FinalBoss[RoomID].VocList[PlayerVoc]);
			--�ҥ�ǭp�q�p��
			local Boss = Lua_Zone21_7Heros_FinalBoss[RoomID].Boss;
			WriteRoleValue(  Boss,EM_RoleValue_Register1, ReadRoleValue(Boss , EM_RoleValue_Register1)-1 );
			DebugMsg(0,0,"DeadCount="..ReadRoleValue(Boss , EM_RoleValue_Register1));
			Sleep(10);--���F�קK���W����
			DelObj(MonA);
			return
		elseif i ==5  and ReadRoleValue( MonB ,EM_RoleValue_Register4 )==0 then
			DebugMsg(0,0,MonA.." reborn");
			local RebornMonster = kg_GetPosRX( MonA , ReadRoleValue(MonA,EM_RoleValue_OrgID) );
			table.insert( Lua_Zone21_7Heros_FinalBoss[RoomID].MonsterObject , RebornMonster );
			WriteRoleValue( MonB , EM_RoleValue_Register1 , RebornMonster );
			WriteRoleValue( RebornMonster , EM_RoleValue_Register1 , MonB );
			WriteRoleValue( RebornMonster , EM_RoleValue_Register2 , ReadRoleValue( MonA , EM_RoleValue_Register2 ) );--�~�Ӫ��a����
			SetModeEx( RebornMonster , EM_SetModeType_Revive, false )	--�i����
			SetPlot( RebornMonster, "dead" , "Lua_Zone21_105677_DeadEvent" ,30 );
			AddToPartition( RebornMonster , RoomID );
			DelObj(MonA);
		else
			--Say(MonB , "DeadChecking..");
		end;
	end
end

---------------------------�ޯ�--------------------------

function Lua_Zone21_105677_DrainLife()--�l���ͩR
	local Boss = OwnerID();
	local SkillLv = Lua_Zone21_105677_SkillLv(1);
	local PlayerList = Lua_Zone21_7Heros_FinalBoss[ReadRoleValue(Boss,EM_RoleValue_RoomID)].DrainLifeTarget
	for i in pairs(PlayerList) do
		if CheckBuff( PlayerList[i] , 620087 )~=true then--���i���٨S�ͮġA���a�N�]��G��
			SysCastSpellLv( Boss , PlayerList[i] , 497907 , SkillLv[8] );
		end
	end
end

function Lua_Zone21_105677_PosAE()
	local SkillLv = Lua_Zone21_105677_SkillLv(1);
	local Boss = OwnerID();
	for i =1,3 do
		SysCastSpellLv( Boss,TargetID() ,497904  , SkillLv[8] );--���w��mAE ��ڶˮ`
	end
end

function Lua_Zone21_105677_CheckXOR()	--�ͩR�I�z�����ˬd
	local Tid = TargetID(); --����
	local SkillLv = Lua_Zone21_105677_SkillLv(1);
	if CheckBuff( Tid , 620080 )==true and Tid~=OwnerID() and ReadRoleValue( Tid,EM_RoleValue_Voc )~=0 and ReadRoleValue(Tid, EM_RoleValue_OrgID)~=105879 then
		 SysCastSpellLv( Tid ,Tid , 497908 , SkillLv[9] );--�����᪺AE�ˮ`
	end
end

function Lua_Zone21_105677_BlackHandAE()--�¤�!!  �ثe���D:�¤⦳�i��S�����T�a�b���a���W�A�]���A��������D
	local Boss = OwnerID();
	local Skilllv = Lua_Zone21_105677_SkillLv(1);
	local PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1, 620075 );--�S�����L�~�|�i�����
	PlayersInHate = KS_RegroupArray( PlayersInHate,4 );
	local BlackHand = 0;
	for i in pairs(PlayersInHate) do
		SysCastSpellLv( Boss , PlayersInHate[i] ,  497900 , Skilllv[4] );
		AddBuff( PlayersInHate[i] ,620075 ,0,-1 );--�Q�¤�����ʡA���w��H�K�¤⤣���
		BlackHand = kg_GetPosRX( PlayersInHate[i] , 105878 );--���Ͷ¤�
		SetModeEx( BlackHand , EM_SetModeType_Mark, true)	----�i�I��(�_)
		SetModeEx( BlackHand , EM_SetModeType_ShowRoleHead, true) 	---�Y����(�_)
		SetModeEx( BlackHand , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( BlackHand , EM_SetModeType_Fight, true) ---�i���(�_)
		SetModeEx( BlackHand , EM_SetModeType_Searchenemy, false)	---����(�_)
		SetModeEx( BlackHand , EM_SetModeType_Revive, false );	--�i����
		WriteRoleValue( BlackHand , EM_RoleValue_Register1 , PlayersInHate[i]  );--�⪱�a�O�b�¤⪺reg1
		SetPlot( BlackHand, "dead" , "Lua_Zone21_105677_DeadEvent" ,30 );
		AddToPartition( BlackHand , ReadRoleValue(Boss,EM_RoleValue_RoomID) );
		CallPlot( BlackHand , "Lua_Zone21_105677_BHCheckPlayer" , PlayersInHate[i] );
	end
end

function Lua_Zone21_105677_BHCheckPlayer( Player )--�¤��ˬd���a�PBoss
	local BlackHand = OwnerID();
	local Boss= Lua_Zone21_7Heros_FinalBoss[ReadRoleValue(BlackHand,EM_RoleValue_RoomID)].Boss;
	if Boss==nil then
		DelObj(BlackHand);
		return
	end
	while 1 do
		if ReadRoleValue(Player,EM_RoleValue_IsDead)==1 or CheckID(Boss)~=true  then
			CancelBuff( Player , 620075 );
			DelObj(BlackHand);
			return
		end
		Sleep(10);
	end
end

function Lua_Zone21_105677_BombExplode()--�p�Ǧ��z
	local Bomb = OwnerID();
	local SkillLv = Lua_Zone21_105677_SkillLv( 1 );
	local PlayerList = SearchRangePlayer( Bomb , 50 );
	local PlayerCount = table.getn(PlayerList);
	WriteRoleValue( Bomb , EM_RoleValue_LiveTime , 1 );
	if PlayerCount>0 then
		local Damage = math.ceil( (SkillLv[11]+1)/PlayerCount)-1; --Say( Bomb , "Damage ="..Damage );
		for i =0 , #PlayerList-1 do
			SysCastSpellLv( Bomb , PlayerList[i] , 498055 , Damage );
		end
	end
end

--------------------�ޯ��ˬd----------------------------
function Lua_Zone21_105677_GetHateList( Obj , mode , Buff , HasBuff  )--�ư��b�G�̪����a�A�ðl�[�P�wbuff
	local PlayersInHate =  KS_GetHateList( Obj , mode );
	local newPlayerInHate = {};
	for i=1,#PlayersInHate do
		if kg_CheckAtk( PlayersInHate[i] ) == true and CheckBuff( PlayersInHate[i] , 620087 )~=true  then
			if Buff~=nil then
				if HasBuff==nil or HasBuff==0 then
					if CheckBuff( PlayersInHate[i] , Buff )~=true then--�S��buff�h�[�J
						table.insert( newPlayerInHate , PlayersInHate[i] );
					end
				else
					if CheckBuff( PlayersInHate[i] , Buff )==true then --��buff�h��i�h
						table.insert( newPlayerInHate , PlayersInHate[i] );
					end
				end
			else
				table.insert( newPlayerInHate , PlayersInHate[i] );
			end
		end
	end
	return newPlayerInHate
end

function Lua_497906_FindTarget()--�l���ͩR�e�H���䪱�a
	local Boss = OwnerID();
	local PlayersInHate = Lua_Zone21_105677_GetHateList( Boss , 1 );--�ư�GM
	PlayersInHate = KS_RegroupArray( PlayersInHate , 2 );--�H����2�W
	if table.getn(PlayersInHate)==0 then
		return false
	end
	ScriptMessage( Boss , -1 , 2 , "[SC_105677_DRAINLIFE]" , C_SYSTEM );
	Lua_Zone21_7Heros_FinalBoss[ReadRoleValue(Boss,EM_RoleValue_RoomID)].DrainLifeTarget = PlayersInHate;
	return true
end

------------------------�p��---------------------------
function Lua_Zone21_105677_MonsterStart( job )
	if job == "boss" or job==0 then
		BeginPlot( OwnerID(), "Lua_Zone21_105677_BossAI" , 0 );
	else
		CallPlot( OwnerID(), "Lua_Zone21_105677_MonsterAI" , job );
	end
end

function Lua_Zone21_105677_MonsterAI( job )
	local Monster = OwnerID();
	local Skillid = Lua_Zone21_105677_Skillid(3);
	local SkillLv = Lua_Zone21_105677_SkillLv(3);
	local FirstSkill,SecondSkill = 0,0;
	local timer , atkTarget , randNum , PlayersInHate=0,0,0,{};
	math.randomseed(math.random(1, 99999));
	if job =="warrior" or job==1 then
		FirstSkill = 1 ; SecondSkill=2;
		local luckyPlayer = {};
		while 1 do
			if KS_InCombat( Monster )~= true then return end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				PlayersInHate = KS_GetHateList( Monster , 1 );
				if #PlayersInHate>0 then
					if randNum == FirstSkill then
						luckyPlayer = KS_RegroupArray( PlayersInHate , 2 );
						CastSpellLv( Monster , luckyPlayer[1] , Skillid[randNum] , SkillLv[randNum] );
						if luckyPlayer[2]~=nil then SysCastSpellLv( Monster , luckyPlayer[2] , Skillid[randNum] , SkillLv[randNum] ); end;
						Sleep(10);
					else
						atkTarget = PlayersInHate[ math.random(  table.getn(PlayersInHate) ) ];  --DebugMsg(0,0,"atkTarget="..atkTarget);
						CastSpellLv( Monster , atkTarget , Skillid[SecondSkill] , SkillLv[SecondSkill] );
					end
				end
			end
			Sleep(10)
			timer = timer+1;
		end
	elseif job=="scout" or job==2 then
		FirstSkill = 3 ; SecondSkill=4;
		while 1 do
			if KS_InCombat( Monster )~= true then return end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				PlayersInHate = KS_GetHateList( Monster , 1 );
				if #PlayersInHate>0 then
					atkTarget = PlayersInHate[ math.random(table.getn(PlayersInHate) ) ];--�H�����@�W
					CastSpellLv( Monster , atkTarget , Skillid[randNum] , SkillLv[randNum] );
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="rogue" or job==3 then
		FirstSkill = 5 ; 
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 6 then
				timer=0;
				PlayersInHate = KS_GetHateList( Monster , 1 );
				if #PlayersInHate>0 then
					atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ];--�H�����@�W
					CastSpellLv( Monster , atkTarget , Skillid[FirstSkill] , SkillLv[FirstSkill] );
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="mage" or job==4 then
		FirstSkill = 6 ; SecondSkill=7;
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 7 then
				timer=0;
				CastSpellLv( Monster , Monster , Skillid[FirstSkill] , SkillLv[FirstSkill] );
				Sleep(20);
				CastSpellLv( Monster , Monster , Skillid[SecondSkill] , SkillLv[SecondSkill] );
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="priest" or job==5 then
		FirstSkill = 8 ; SecondSkill=9;
		local luckyPlayer = {};
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				if randNum == FirstSkill then
					AddBuff( Monster , Skillid[FirstSkill] , 0 , SkillLv[FirstSkill] );
				else
					PlayersInHate = KS_GetHateList( Monster , 1 );
					if #PlayersInHate>0 then
						luckyPlayer = KS_RegroupArray( PlayersInHate , 2 );
						CastSpellLv( Monster , luckyPlayer[1] , Skillid[SecondSkill] , SkillLv[SecondSkill] );
						if luckyPlayer[2]~=nil then  SysCastSpellLv( Monster , luckyPlayer[2] , Skillid[SecondSkill] , SkillLv[SecondSkill] ); end;
					end
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="knight" or job==6 then
		FirstSkill = 10 ; SecondSkill=11;
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				if randNum == FirstSkill then
					AddBuff( Monster , Skillid[FirstSkill] , 0 , SkillLv[FirstSkill] );
				else
					CastSpellLv( Monster , Monster , Skillid[SecondSkill] , SkillLv[SecondSkill] );
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="warden" or job==7 then
		FirstSkill = 12 ; SecondSkill=13;
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				if randNum==FirstSkill then
					atkTarget = ReadRoleValue( Monster , EM_RoleValue_AttackTargetID );
					CastSpellLv( Monster , atkTarget , Skillid[randNum] , SkillLv[randNum] );
				else
					CastSpellLv( Monster , Monster , Skillid[randNum] , SkillLv[randNum] );
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	elseif job=="druid" or job==8 then
		FirstSkill = 14 ; SecondSkill=15;
		local luckyPlayer = {};
		while 1 do
			if KS_InCombat( Monster )~= true then break; end;
			if timer == 7 then
				timer=0;
				randNum = math.random( FirstSkill , SecondSkill ); --DebugMsg(0,0,"SkillNum="..randNum);
				if randNum==FirstSkill then
					CastSpellLv( Monster , Monster , Skillid[randNum] , SkillLv[randNum] );
				else
					PlayersInHate = KS_GetHateList( Monster , 1 );
					if #PlayersInHate>0 then
						luckyPlayer = KS_RegroupArray( PlayersInHate , 2 );
						CastSpellLv( Monster , luckyPlayer[1] , Skillid[randNum] , SkillLv[randNum] );
						if luckyPlayer[2]~=nil then  SysCastSpellLv( Monster , luckyPlayer[2] , Skillid[randNum] , SkillLv[randNum] ); end;
					end
				end
			end
			Sleep(10)
			timer = timer+1;
		end;
	end;
end