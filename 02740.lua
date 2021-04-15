function jiyi_Beer_NPC()--���b����NPC�����󲣥ͼ@��
	local Owner = OwnerID() 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = 100938	--�Z��R���u��

	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
	LuaN_miyon_action02() --��NPC�`�y�лx
	jiyi_Hideitem() --���ê����l�@���G���Ͱs���@��
end

function jiyi_Hideitem() --���ê����l�@���G���Ͱs���@��
	local Owner = OwnerID() ----���ê���
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID ) --Ū�����yID
	local poki = {} --���w�f���s��3��
	local Barrico = {} --����25�Ӱs��

	for i = 1 , 25, 1 do --����25�Ӱs��
		Barrico[i] = CreateObjByFlag( 121335 , 781184 , i , 1 )-- �̷ӺX�нs�����Ͱs��A���ͫ��JBarrico table��
		WriteRoleValue( Barrico[i] , EM_RoleValue_Register2 , 0 ) --�����s���ȳ��g��0
		SetModeEx( Barrico[i] , EM_SetModeType_Show , true ) --���
		SetModeEx( Barrico[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( Barrico[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( Barrico[i] , EM_SetModeType_Obstruct , false )--����
		SetModeEx( Barrico[i] , EM_SetModeType_Mark , true )--�аO
		SetModeEx( Barrico[i] , EM_SetModeType_Move , false )--����
		SetModeEx( Barrico[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Barrico[i] , EM_SetModeType_HideName , false )--�W��
		SetModeEx( Barrico[i] , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( Barrico[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Barrico[i] , EM_SetModeType_Gravity , true )--���O
		SetModeEx( Barrico[i] , EM_SetModeType_Obstruct , true )--����
		SetModeEx( Barrico[i] , EM_SetModeType_NotShowHPMP , true )--�Y����
		AddToPartition( Barrico[i] , RoomID )  --�bŪ�������y(RoomID)����{
	end	

	for j = 1 , 3 do --��X3�Ӧ��w�f���s��
		local R = Rand( table.getn(Barrico) )+1 --�q#Barrico���H����3�Ӧ��w�f���s��
		poki[j] = Barrico[R] --#poki��J#Barrico���H����X���w�f���s��
		table.remove( Barrico , R ) --�q#Barrico���������w�f���s��
		WriteRoleValue( poki[j] , EM_RoleValue_Register2 , 1 ) --�N���w�f���s��O���bREG2��
	end
end

function jiyi_Hideitem2() --�p�ɡB�����Z��������
	local Owner = OwnerID() --���ê���
	--local Target = TargetID()
	local Time = 0 
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register10 ) --�N���a�O���bREG10��
	local Dis = GetDistance( Player , Owner ) --���a�M���ê��󤧶����Z��

	while true do  --�C����
		if CheckBuff( Player , 623346 ) == false then --�ˬd���a�O�_��"���P�_�ޯ�"(623346)��BUFF>>���a�b���ʤ��@�w�|����BUFF
			break
		end	

		if CheckID( Player ) == false then --�ˬd���a�O�_���u
			break
		else --���a�b�u�W
			Dis = GetDistance( Player , Owner ) --�ˬd��U���a�M���ê��󤧶����Z��
	   		if Dis < 100 then
	   			--�i�椤
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_04]" , C_SYSTEM ) --�t�����ĵ�i�T���G�Ц^���s�ϧ�������
	   		elseif Dis >=150 then
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_05]" , C_SYSTEM )--�t�����ĵ�i�T���G�Z����s�Ϥӻ��A���ȵ��� 	
	   			Sleep(30) --��3����
	   			CancelBuff( Player , 623346 ) --����"���P�_�ޯ�"(623346)��BUFF�A�R�����ʥΧޯ�
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM ) --�t����ܰT���G�ЦVNPC�^�Х���	
	   			break --���X�j��
	   		end
           	
	   		if CheckFlag( Player , 546925 ) == true then --�ˬd���a�p�G�w�g�o��"����w��L���y"���X��
				break --����L���y�h���X�j��
			end

			if CountBodyItem( Player , 241785 ) == 3 then --�ˬd���a���W�p�G�w�g��3���w�B
	   			 CancelBuff(  Player , 623346 ) --���ʵ����A����"���P�_�ޯ�"(623346)��BUFF�A�R�����ʥΧޯ�
	   			 ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM ) --�t����ܰT���G�ЦVNPC�^�Х���
	   			 Sleep(10) --���@����
	   			 break --���X�j��
	   		end

	   		Time = Time + 1 --�ɶ��i�椤�A�C��+1	   			
 	   		if  Time == 60 then --�ɶ���60���
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_06]" , C_SYSTEM )--��ܨt�ΰT���G�ѤU�@����
	   		elseif Time == 90 then	
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_07]" , C_SYSTEM )--��ܨt�ΰT���G�ѤU30��
	   		elseif Time == 120 then
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_08]" , C_SYSTEM )--��ܨt�ΰT���G�ɶ���A���ʵ���
	   			Sleep(30) --��3����
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM )----�t����ܰT���G�ЦVNPC�^�Х���
	   			CancelBuff( Player , 623346 ) --���ʵ����A����"���P�_�ޯ�"(623346)��BUFF�A�R�����ʥΧޯ�
	   			break	--�ɶ���A���X�j��
	   		end
		end
	Sleep(10) --����while�j�饲����1��b�~��
	end
	sleep(10)
	jiyi_Reset() --�u�n���X�j��A�N���m����
	local npc = ReadRoleValue( Owner , EM_RoleValue_Register5 ) --�O���b���ê���W������NPC
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --�NREG1�g�J0�Ȧb����NPC�W
	DelObj( Owner ) --�R�����ê���
end

function jiyi_Reset() --���m����
	local own =OwnerID()--���ê���
	Lua_Barrico_Del_na() --�R�������s��@��
	sleep(10) --���@��� 
	jiyi_Hideitem() --���s���Ͱs��
	WriteRoleValue( own , EM_RoleValue_Register3 , 0 ) --�N�O�b���a���W�ΨӬ������a���}�X�Ӱs��REG�ȲM���g�^0
end
--=====================================
--			NPC��ܼ@��
--=====================================
function jiyi_2012beer_1() --���bù�B�D�ͮ����W����ܼ@��
	local own = OwnerID()  --(���a)
	local Tar = TargetID()  --�ͮ�(NPC)
	local star = ReadRoleValue( Tar , EM_RoleValue_Register1 )  --�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ� 	
	if CheckFlag( own , 546925 ) == true then --�ˬd���a�p�G�w�g����L���y�X��
		SetSpeakDetail( own , "[SC_2012BEER_121334_01]" )  --���§A���ڧ䰽�ܰs���w�f
	elseif CheckFlag( own , 547001 ) == true then --�ˬd���a�w�g���������ʺX��
		SetSpeakDetail( own , "[SC_2012BEER_121334_10]" )  --���w�f�F�ܡH
		AddSpeakOption( own , tar , "[SC_2012BEER_121334_06]" , "jiyi_2012beer_6" , 0 )  --�ڨ��s�ϧ�L�F
	else 
		if star == 1 then --REG1��==1��ܦ����a���b�D�Ԥ�
			SetSpeakDetail( own , "[SC_2012BEER_121334_03]" ) --�N�A���@���A���H���b���ڧ�w�f�C
		else --REG1��==0��ܥi�H�����NPC������
			SetSpeakDetail( own , "[SC_2012BEER_121334_02]" )  --�A�i���i�H�ɧ����ڧ��w�f�H
			AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_01]" , "jiyi_2012beer_3" , 0 )  --�ڸӫ�����A�O�H
			AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_02]" , "jiyi_2012beer_2" , 0 )  --��p�A���٦���L�ƭn���C
		end
	end
end

function jiyi_2012beer_2()
	local own = ownerID()
		SetSpeakDetail( own , "[SC_2012BEER_121334_04]" ) --�u���ڥu�n���L�H�����F�v
end

function jiyi_2012beer_12()
	local own = ownerID()
		SetSpeakDetail( own , "[SC_2012BEER_121334_12]" ) --�u�ǳƦn�A�ӧ�ڡv
end

function jiyi_2012beer_3()
	local own = OwnerID() --���a
	local tar = TargetID() --npc
	local star = ReadRoleValue( tar , EM_RoleValue_Register1 )
	if star == 0 then
		SetSpeakDetail( own , "[SC_2012BEER_121334_05]" )  --�����W�h	
		AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_03]" , "jiyi_2012beer_5" , 0 )  --�ڷǳƦn���A��w�f�F�C
		AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_04]" , "jiyi_2012beer_2" , 0 )  --���A���٨S�ǳƦn���A��w�f�C
	end
end

--=====================================
--		�N���a�ǰe�쬡�ʰϤ��i��C��
--=====================================
function jiyi_2012beer_5()  --�i�J�C��
	local own = OwnerID() --���a
	local tar = TargetID() --npc
--��2014/09/17 �s�W�U�C�ˬd���W�s��O�_���u�ʰ��D�A�p�G���ʶ}�l�e�s���ʤ֡A�|�����m�s��
	local Barrel = 0
	local CheckNPC = SearchRangeNPC( tar , 300)
	for i = 0 , #CheckNPC do
		if ReadRoleValue(CheckNPC[i] , EM_RoleValue_OrgID) == 121335 then
			Barrel = Barrel+1
		end
	end
	if Barrel < 25 then
		jiyi_Reset()
	end
--��
	local star = ReadRoleValue( tar , EM_RoleValue_Register1 ) --�O�bNPC���W��REG1�ȡA�ΨӧP�_NPC�O�_�i�H����L���a������
	local hideitem = jiyi_Hideitem_born(own) --�������ê���P�ɱN���a�O�bREG10��	
--	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 )
	local Lv = ReadRoleValue( own , EM_RoleValue_Lv ) --Ū�����a����
	local SubLv = ReadRoleValue( own , EM_RoleValue_LV_SUB )
	WriteRoleValue( hideitem , EM_RoleValue_Register5 , tar ) --�����ê���bREG5���O�����NPC 
	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 ) --2014/09/17 �q168�沾��172��
	if star==0 then --NPC�}�ҥi�i�J�C��
		DesignLog( own , 121334 , "Lv = "..Lv.." SubLv = "..SubLv )  --�^�Ǭ��ʰѻP��
		WriteRoleValue( tar , EM_RoleValue_Register1 , 1 ) --�NNPC���W��REG1�ȼg��1�A������L���a������
		SetFlag( own , 547001 , 1 ) --�}�Ҫ��a"����w�ѥ[�L����"���X��
		BeginPlot( hideitem , "jiyi_Hideitem2" , 0 ) --�����ê���}�Ҥ�����
		WriteRoleValue( tar , EM_RoleValue_Register4 , own ) --��NPC�O���b���C�������a
		SetPos( own , 3105.4 , 44.9 , 15.8 , 0 ) --�N���a�ǰe�쬡�ʳ��a
		AddBuff ( own , 623346 , 0 , 180 ) --�����a���ʧޯ�
	end
	WriteRoleValue( tar , EM_RoleValue_Register1 , 1 ) --�NNPC���W��REG1�ȼg��1�A�קK��L���a�]�i�H������	
	SetSpeakDetail( own , "[SC_2012BEER_121334_03]" )--�N�A���@���A���H���b���ڧ�w�f�C
end

function jiyi_Hideitem_born( Player ) --�������ê���A�P�������ê���O���a
	local own = OwnerID() --���a
	local hideitem = CreateObjByFlag( 121336 , 781184 , 0 , 1 ) --���ӺX�в������ê���
	WriteRoleValue( hideitem , EM_RoleValue_Register10 , own ) --�N���a�O�b���ê���
	return hideitem --�^�����ê����
end
--=====================================
--			���ʧޯ�
--=====================================
function jiyi_2012beer_10()--�����s��ޯ�
	local own = OwnerID() --���a
	local beer = TargetID() --�s��121335
	local wine = ReadRoleValue( beer , EM_RoleValue_Register2 )--�O���s��O�_���w�f0=no,1=yes
	local broke = ReadRoleValue( own , EM_RoleValue_Register3 ) --�O�b���a���W�ˬd���a���}�X�Ӱs��
	WriteRoleValue( own , EM_RoleValue_Register3 , broke + 1 ) --�N���a���}�s��ƶq�g�JREG3�Ȥ��Abroke�q0��_�A�ҥH�n�A+1
	if wine == 1 then --�p�G�s��̦��w�f
		Lua_na_poki_( beer ) --�b�s���m���ͮw�f
 		GiveBodyItem( own , 241785 , 1 ) --�����a�@���w�f���~
	end
	DelObj( beer ) --�R���s��
end

function jiyi_2012beer_4()--�V�V�ݧޯ�
	local own = OwnerID() --���a
	local tar = TargetID() --�s��121335
	local ser = SearchRangeNPC ( tar , 45 ) --�j�M�ؼаs���P��O�_����L�s��
	local poki = {}	
	if ReadRoleValue( tar , EM_RoleValue_Register2 ) == 1 then --�p�G�ؼаs���w�f
		ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_01]" , C_SYSTEM )--�t�Χi��"�s��̦n�����F��"
	else	
		for i = 0 , table.getn(ser) do
			if ReadRoleValue( ser[i] , EM_RoleValue_Register2 ) == 1 then --�p�G�P�򪺰s���w�f
				table.insert( poki , ser[i] ) --�N�P�򦳮w�B���s���J#poki��
			end
		Sleep(20) 
		PlayMotion( ser[i] , 18 ) --���P��s���t18���ʧ@�G���
		end

		if table.getn( poki ) >=1 then --�p�G#poki�����w�f���s��>=1��
			ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_02]" , C_SYSTEM )--�t�Χi��"�o����n�����w�f"
		else
			ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_03]" , C_SYSTEM )--�t�Χi��"�w�f���G���b�o����"
		end
	end	
end

function jiyi_2012beer_11()--���b�k�N���X���ϥ��ˬdLUA�A�ΥH�ˬd�ޯ�ؼЬO�_���s��
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local beer = 121335 --�s��ID
	if TOrgID == beer then --��ؼЪ��~ID=�s��ID��	 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )--�t�Χi��"�D���ĥؼ�"
		return false
	end
end
--=====================================
--			���ʵ���-���y�@��
--=====================================
function jiyi_2012beer_6()  --�C������-����
	local own = OwnerID() --���a
	local broke = ReadRoleValue( own , EM_RoleValue_Register3 ) --�O�b���a���W�ˬd���a���}�X�Ӱs��
	CancelBuff( own , 623346 ) --�R�����a���ʧޯ�
	if CountBodyItem( own , 241785 ) >= 3 then --�ˬd���a���W�O�_��>=3���w�B���~
		if broke <= 5 then --�A�P�_���a���}���s��ƶq�O�_<=5	
			SetSpeakDetail( own , "[SC_2012BEER_121334_08]" ) --���§A���ڧ��w�f�A�o3�i��s�`���ʰѥ[���Ұe�A��@��§�C
			DelBodyItem( own , 241785 , 3 ) --�N���a���W��3�Ӯw�f���~�R��
			GiveBodyItem( own , 205941 , 3 ) --�����a3�i��s�`���ʰѥ[����
		elseif broke <= 10 then --�A�P�_���a���}���s��ƶq�O�_<= 10
			SetSpeakDetail( own , "[SC_2012BEER_121334_09]" ) --���§A���ڧ��w�f�A�o2�i��s�`���ʰѥ[���Ұe�A��@��§�C
			DelBodyItem( own , 241785 , 3 ) --�N���a���W��3�Ӯw�f���~�R��
 			GiveBodyItem( own , 205941 , 2 ) --�����a2�i��s�`���ʰѥ[����
		elseif broke > 10 then --�A�P�_���a���}���s��ƶq�O�_> 10
			SetSpeakDetail( own , "[SC_2012BEER_121334_07]" ) --�٬O���§A���ڧ�w�f�A�o1�i��s�`���ʰѥ[���Ұe�A��@��§�C
			DelBodyItem( own , 241785 , 3 ) --�N���a���W��3�Ӯw�f���~�R��				
			GiveBodyItem( own , 205941 , 1 ) --�����a1�i��s�`���ʰѥ[����
		end  
	elseif  CountBodyItem( own , 241785 ) > 0 and CountBodyItem( own , 241785 ) < 3 then --�ˬd���a���W�w�B���~�֩�3��
		SetSpeakDetail( own , "[SC_2012BEER_121334_07]" )  --�٬O���§A���ڧ�w�f�A�o1�i��s�`���ʰѥ[���Ұe�A��@��§�C
		DelBodyItem( own , 241785 , 2 ) --�N���a���W��2�Ӯw�f���~�R��
		DelBodyItem( own , 241785 , 1 ) --�N���a���W��1�Ӯw�f���~�R��
		GiveBodyItem( own , 205941 , 1 ) --�����a�@�i��s�`���ʰѥ[����
	elseif  CountBodyItem( own , 241785 ) ==0 then --�ˬd���a���W�S���w�B���~
		SetSpeakDetail( own , "[SC_2012BEER_121334_11]" )  --�٬O���§A���ڧ�w�f�A�o�Ӱe�A��@��§�C
		GiveBodyItem( own , 724509 , 1 ) --�����a�@���H���Ĥ�
	end
	SetFlag( own , 546925 , 1 ) -- �}�Ҫ��a�w�g����L���y�X��
	Lua_Festival_09_All(own)--�����Լ�
	WriteRoleValue( own , EM_RoleValue_Register3 , 0 ) --�N�O�b���a���W�ΨӬ������a���}�X�Ӱs��REG3�ȲM���g�^0
end

function Lua_Barrico_Del_na()  --�R���s��@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 121335 }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID )
					end
				end
			end
		end
	end
end

function Lua_na_poki_(beer) --��s��y�в��ͮw�f
	local RoomID = ReadRoleValue( beer , EM_RoleValue_RoomID )
	local Obj = Role:new( beer )  -- ���o�s��y�� X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local Poki = CreateObj( 107243 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�b�s���m���ͮw�f
	SetModeEx( Poki , EM_SetModeType_Strikback , false )--����
	SetModeEx( Poki , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( Poki , EM_SetModeType_Obstruct , false )--����
	SetModeEx( Poki , EM_SetModeType_Mark , false )--�аO
	SetModeEx( Poki , EM_SetModeType_Move , false )--����
	SetModeEx( Poki , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Poki , EM_SetModeType_HideName , false )--�W��
	SetModeEx( Poki , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( Poki , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Poki , EM_SetModeType_Drag , false )--���O
	SetModeEx( Poki , EM_SetModeType_Show , true )--���
	AddtoPartition( Poki , RoomID ) --�b��U�����y����{�w�f
end

function Lua_na_poki_born()
	local Owner = OwnerID()
	Sleep(30)	
	PlayMotionex ( OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_END )
	Delobj( Owner )
end