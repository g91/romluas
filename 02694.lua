--NPC ��̿��� 121044

function Lua_na_2012loom_jammie()
	local Owner = OwnerID()

	if CheckFlag ( Owner , 546728 ) == true then --�p�G����w�g�����L����

		local Language = GetServerDataLanguage() 		           --����ثeserver���y�t
		if Language == "tw" then  -- �x���M�ݨS�����m�ﶵ
			SetSpeakDetail( Owner , "[SC_2012LOOM_NEXTDAY2]" )  -- �s�W�r��
		else  
			SetSpeakDetail( Owner , "[SC_2012LOOM_NEXTDAY]" )
			AddSpeakOption( Owner , Owner , "[SC_FLOWERFES_KORS_RS05]" , "Lua_na_2012loom_again" , 0 )	
		end
	elseif CheckFlag ( Owner , 546685 ) == true then --������ ==0
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK5]" ) --�ڷQ���ӨS���o��x���~��K�K�O�ڪ����������ԲӶܡK�K�H
		GiveBodyItem( Owner , 241645 , 1 ) --����1�ӹ�ί�´���ƥ]
		SetFlag( Owner , 546685 , 0) 
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 		
	elseif CheckFlag ( Owner , 546867 ) == true then -- ������<=3
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK5]" ) --�ڷQ���ӨS���o��x���~��K�K�O�ڪ����������ԲӶܡK�K�H
		GiveBodyItem( Owner , 241645 , 1 ) --����1�ӹ�ί�´���ƥ]
		GiveBodyItem( Owner , 725649 , 1 ) --7�Ѹ`�y��O�Ĥ�(5��)
		SetFlag( Owner , 546867 , 0)
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 
	elseif CheckFlag ( Owner , 546868 ) == true then  --������ <=10
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK6]" ) --�O�ڰ����A�F�ܡH�ڭ쥻����A�i�H���o��n�K�K
		GiveBodyItem( Owner , 241645 , 2 ) --����2�ӹ�ί�´���ƥ]
		GiveBodyItem( Owner , 725649 , 1 ) --7�Ѹ`�y��O�Ĥ�(5��)
		SetFlag( Owner , 546868 , 0)
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 
	elseif CheckFlag ( Owner , 546869 ) == true then --������ <=15
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK7]" ) --�ڷQ�A�|�V�ӶV�o�����⪺�I�ڷ|�~����ݧA����{�I
		GiveBodyItem( Owner , 241645 , 3 ) --����3�ӹ�ί�´���ƥ]
		GiveBodyItem( Owner , 725649 , 1 ) --7�Ѹ`�y��O�Ĥ�(5��)
		SetFlag( Owner , 546869 , 0)
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 
	elseif CheckFlag ( Owner , 546870 ) == true then  --������ <=19
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK8]" ) --�n�i���A�N�t�@�I�F�I�A�G�M�O�ȱo�̿઺��H�A�ڬ۫H�A�U�@������{�@�w�i�H�F�짹���ҬɡC
		GiveBodyItem( Owner , 241645 , 5) --����5�ӹ�ί�´���ƥ]
		GiveBodyItem( Owner , 725649 , 1 ) --7�Ѹ`�y��O�Ĥ�(5��)
		SetFlag( Owner , 546870 , 0)
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 
	elseif CheckFlag ( Owner , 546729 ) == true then  --�����F��
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK9]" ) --�A����{�u���Ӻ��F�I�G�M���t�ڪ�����I
		GiveBodyItem( Owner , 241646 , 1) --����1�Ӥk����´���ƥ]
		GiveBodyItem( Owner , 725649 , 1 ) --7�Ѹ`�y��O�Ĥ�(5��)
		SetFlag( Owner , 546729 , 0)
		SetFlag( Owner , 546728 , 1) --�������駹���X��
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 ����Լ��禡 
	elseif CheckFlag ( Owner , 546686 ) == true then --����w����L�_�͡A���_�ͤ��b���W
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]" ) --�ګܴ��ݧA����{�I
	elseif CountBodyItem( Owner , 241638 ) < 1 then --���W�S���_��
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK]" )
		AddSpeakOption( Owner , Owner , "[SC_423911_02]" , "Lua_na_2012loom_yes" , 0 )
		AddSpeakOption( Owner , Owner ,"[SC_2012LOOM_NO]" , "Lua_na_2012loom_no" , 0 )
	else --���_�ͩ|����������
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]" ) --�ګܴ��ݧA����{�I
	end
	AddSpeakOption( Owner, Owner, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --��´�`���Ѩ�
end

function Lua_na_2012loom_yes()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK1]") --���ʻ���
	AddSpeakOption( Owner , Owner , "[SC_2012LOOM_SPEAK2]" , "Lua_na_2012loom_give", 0)	--���U´�����Ұʾ�
	DesignLog( Owner, 121044 , "2012 weave event- loom helper start" )
end

function Lua_na_2012loom_give() --�����Ұʾ�
	local Owner = OwnerID()
	SetFlag( Owner ,546686 , 1 ) --����w�g����L�_��
	GiveBodyItem( Owner , 241638 , 1 )
	SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]") --�ګܴ��ݧA����{�I
end	

function Lua_na_2012loom_no()
	SetSpeakDetail( OwnerID() , "[SC_2012LOOM_SPEAK4]") --�J�M�A���@�N�A�ڤ]����j�j�A�I�ڷQ�A���ӥu�O�٨S�ǳƦn�a�K�K
end

--function Lua_2012loom_allnewevent()
--	local OID = OwnerID()
--	local allcount = 3  -- �Ҧ��s���ʼƶq
--	local count = 0
--	local keylist =  {
--		546728, -- �]��´����
--		546864, -- �]�k���_�v
--		546876  -- �O�����|
--		}
--
--	for i =  1 , table.getn(keylist) do
--		if Checkflag(OID , keylist[i] )  == true then
--			count = count +1
--		end
--		if i == table.getn(keylist) then
--			if count == allcount then -- �p�G��������
--			lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 5��R�ָ`���� ������0
--			end
--		end
--	end
--end



function Lua_na_2012loom_again()
	local Owner = OwnerID()
	if CountBodyItem ( Owner , 202903 ) >= 1 then
		DelBodyItem( Owner , 202903 , 1 )
		SetFlag( Owner ,546728 , 0 ) --����w����
		SetFlag( Owner ,546686 , 0 ) --����w����_��
		ScriptMessage( Owner , Owner , 0 ,"[SC_2012LOOM_GIVE]" , 0 ) --��o�A���D�Ԫ����|�C		
		ScriptMessage( Owner , Owner , 2 ,"[SC_2012LOOM_GIVE]" , 0 ) --��o�A���D�Ԫ����|�C
		CloseSpeak( Owner)		
	else
		ScriptMessage( Owner , Owner , 1 ,"[SC_202903_NOTENOUGH]" , 0 )
		CloseSpeak( Owner)
	end
end	


--´�������@��
function Lua_na_Weave_loom() -- 121040 ´������l�@��
	local Owner = OwnerID()
	WriteRoleValue ( Owner , EM_RoleValue_Register1 , 0 ) --�N�ۤv��Reg 1 �ȼg��0�A��ܥi�H�i��C��
	WriteRoleValue (Owner , EM_RoleValue_Register2 , 0 ) -- �����k�s 
	WriteRoleValue ( Owner , EM_RoleValue_Register8 , 0 ) --�M�Ū��a	
--	local Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register1)
--	Say (Owner , Reg2 )
	SetPlot( Owner, "touch" , "Lua_na_loom_touch" , 50) --�]�wĲ�I�@��
end


function Lua_na_loom_touch()
	local Owner = OwnerID() --���a
	local Target = TargetID() --´����
	if ReadRoleValue( Target , EM_RoleValue_Register1) == 0 then --�ˬd´�����O�_�i��
		if CountBodyItem( Owner , 241638 )  >= 1 then --�ˬd���a���W�O�_���_�ʾ� 241638
			WriteRoleValue( Target , EM_RoleValue_Register1 , 1) --�N´�����g��1�A��ܥثe�ϥΤ�
			WriteRoleValue( Target , EM_RoleValue_Register8 , Owner)  --��´�����O���a 
			DelBodyItem( Owner , 241638, 1 ) -- �R���Ұ��_�� 
			BeginPlot( Target , "Lua_na_loom_start" , 0 ) --´�����Ұʼ@��  
			AddBuff( Owner , 622971 , 0 , 30 ) --´�����X�ʪ�
			AddBuff( Owner , 623052 , 0 , -1 ) --�p��
		else
			ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_MES02]" , 0) --���W�S��´�����Ұʾ�
			return
		end
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_MES01]" , 0 ) --´�����ثe���b�B�@���I
	end	
end


function Lua_na_loom_start()
	local loom = OwnerID() --´����
	local Target = TargetID()
	local Reg1 = ReadRoleValue ( loom , EM_RoleValue_Register1 )
	PlayMotion( loom , 146 )
	AddBuff( loom , 622965, 0 , 60 )
	sleep(10)
	Beginplot( loom , "Lua_na_2012_loom_start" , 0 )
	Lua_na_loom_marks_born2(loom)
end


--�X�{�L�O
function Lua_na_loom_marks_born2(loom)
	local X = {1,2,3}  --�T�ӺX�Ц�m
	local Y = 0
	local Y1 = {}
	local Mark123 = {121041 , 121042 , 121043}  --���l�B�m�u�B�ŤM�A�T�ӦL�O�C
	for i = 1 , 3 do   -- ����3��
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local Mark = {}
		Mark[i]  = CreateObjByFlag( Mark123[i] , 781172, Y1[i] ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		SetModeEx( Mark[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( Mark[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Mark[i] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Mark[i] , EM_SetModeType_Move, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Mark[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Mark[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Mark[i], EM_SetModeType_Drag , false )--���O
		SetModeEx( Mark[i], EM_SetModeType_Show, true )--���
		AddToPartition( Mark[i]  , 0 )	--���ͺX��
		WriteRoleValue( Mark[i] , EM_RoleValue_Register9 , loom) --����´����
		local Reg9 = ReadRoleValue( Mark[i] , EM_RoleValue_Register9)
	end		
end


function Lua_na_weave_item() 
	local Owner = OwnerID()
	local OrgID = ReadRoleValue(  Owner , EM_RoleValue_OrgID)
	local loom = ReadRoleValue( Owner , EM_RoleValue_Register9)
	local loomstarter =  ReadRoleValue( loom , EM_RoleValue_Register8)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Obj = Role:new( Owner )  -- ���o�L�OX.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 121051, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b�L�O�y�� X.Y.Z.Dir �Хߪ���
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	if OrgID == 121041 then
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 1 )  --�I�����c�l�A��ܱ��l
	elseif OrgID == 121042 then
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 2 ) --�I�����c�l�A��ܱm�u
	else
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 3 ) --�I�����c�l�A��ܰŤM
	end
	WriteRoleValue( NPC , EM_RoleValue_Register9 , loom ) --�N´�����g�J�_�c
	WriteRoleValue( NPC , EM_RoleValue_Register8 , loomstarter) --�N���a�g�J�_�c
	AddToPartition( NPC , RoomID) -- �إߪ���
	SetPlot( NPC , "touch" , "Lua_na_weave_item1" , 10 )
end

function Lua_na_weave_item1() --�_�c��Ĳ�I�@��
	local Owner = OwnerID() --���a
	local Target = TargetID() -- �_�c
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID) 
	local loom = ReadRoleValue( Target , EM_RoleValue_Register9) --´����
	local loomstarter =  ReadRoleValue( loom , EM_RoleValue_Register8)	--���a
	local Type= ReadRoleValue( Target , EM_RoleValue_Register1)
	if Owner == loomstarter then
		if Type == 1 then
			SysCastSpellLv( loomstarter , loom , 499515 ,1)  
		elseif Type == 2 then
			SysCastSpellLv( loomstarter , loom , 499516 ,1)
		elseif Type == 3 then
			SysCastSpellLv( loomstarter , loom , 499517 ,1)  
		end
	Sleep(10)
	end
end



---´�������ʥX�D�@��
function Lua_na_2012_loom_start()
	local Owner = OwnerID() --´����
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register8 )
	local Mes = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --�r��
	local ColorBuff = { 622962 , 622963, 622964 } -- �]�k�}����
	sleep(20)
	ScriptMessage( Owner , Player , 0 , "[SC_2012LOOM_START01]" , C_SYSTEM) --[121040](´����)�}�l�ҰʡA´�X�Ĥ@�ƥ��ơC
	ScriptMessage( Owner , Player , 1 , "[SC_2012LOOM_START01]" , C_SYSTEM)
	sleep(30)
	for i = 1 , 3 do --�e�T�^�X�����`
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
		--	local R = rand(3)+1	 --�H���X�D
			local TR = (rand(3)+3)*10   --�C���X�D�����j�ɶ�
			ScriptMessage(Player , Player, 2 , Mes[i] , 0) --ĵ�i�I´������ �T�� �i���X�{���~�I
			AddBuff( Owner , ColorBuff[i] , 0 , 8 )
			WriteRoleValue (Owner , EM_RoleValue_Register2 , i)  --�ˬd´�������W������		 
			Sleep(50) --8�����n�^�����D
			if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
				AddBuff( Owner , 623054 , 0 , 3)
			end
			sleep(30)
			
			if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 0 then
				break
			elseif ReadRoleValue( Owner , EM_RoleValue_Register2 ) == i then
			--	CancelBuff( Owner , 622965 ) 
			--	ScriptMessage( Player , Player , 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
				ScriptMessage( Player , Player , 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
				WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
				CancelBuff( Owner , 622965)  --�R��´�������B�@BUFF
				CancelBuff ( Player , 622971)
				CancelBuff( Owner , 622966)
				break
			end
		end
		sleep(TR)
	end

	for i = 1, 7 do	--����7�D�N�H���X�D
		local Mes1 = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --�r��
		local ColorBuff1 = { 622962 , 622963, 622964 } -- �]�k�}����
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			local QR = rand(100)+1 -- �������`�B�T�����~�B��m���~
			local TR = (rand(3)+3)*10  --�C���X�D�����j�ɶ�
			local R = rand(3)+1	 --�H���X�D
			if QR <=20 then--���`�D
			--	ScriptMessage(Player , Player, 0 , Mes1[R] , 0) 
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --�ˬd´�������W������		 
				Sleep(50) --8�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~=0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				sleep(30)	

				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player , 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
	      		  	end
					sleep(TR)
		
			elseif QR <= 60 then --�T�����`
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES04]" , 0) --ĵ�i�I´������ �T�� �i���X�{���~�I
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES04]" , 0) --ĵ�i�I´������ �T�� �i���X�{���~�I
				table.remove(Mes1 , R)
				local QMes = Rand(2)+1
				AddBuff( Owner , 622966 , 0 , 9)
				Sleep(10)
				ScriptMessage(Player , Player, 2 , Mes1[QMes] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --�ˬd´�������W������		 
				Sleep(50) --8�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
	      		  	end
					sleep(TR)

	
			else --��m���ܲ��`
				ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES05]" , 0) --ĵ�i�I´������ ��m �i���X�{���~�I
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES05]" ,  0) --ĵ�i�I´������ ��m �i���X�{���~�I
				table.remove(ColorBuff1 , R)
				local QBuff = Rand(2)+1
				AddBuff( Owner , 622966 , 0 , 9)
				Sleep(10)
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[QBuff] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --�ˬd´�������W������		 
				Sleep(50) --8�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
					CancelBuff( Owner , 622965 )  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
	      		  	end
					sleep(TR)
			end
		else
			CancelBuff( Owner , 622966)
			break
		end
	end
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES07]" , 0) --�`�N�I´�����ثe�B��L�������A�I
			ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_MES07]" , 0) --�`�N�I´�����ثe�B��L�������A�I	
			AddBuff( Owner , 622966 , 0 , -1)
			Sleep(30)
		end

	for i = 1, 10 do	--����10�D�N�H���X�D
		local Mes1 = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --�r��
		local ColorBuff1 = { 622962 , 622963, 622964 } -- �]�k�}����
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			local QR = rand(100)+1 -- �������`�B�T�����~�B��m���~
			local TR = (rand(3)+3)*10  --�C���X�D�����j�ɶ�
			local R = rand(3)+1	 --�H���X�D
			if QR <=40 then--�T���P�C��ҿ�
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES06]" ,  0) --ĵ�i�I´���� �T�� �P ��m �i�����X�{���~�I
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES06]" , 0) --ĵ�i�I´���� �T�� �P ��m �i�����X�{���~�I
				local A = {}
				local ERROR = {}
				local R2 = Rand(2)+1
				local Quest = { 1, 2, 3}
				table.insert (ERROR , Mes1[R])
				table.remove(Quest , R )
				table.remove(Mes1 , R)
				table.remove(ColorBuff1, R)

				table.insert( ERROR, ColorBuff1[R2] )
				table.remove(Quest , R2 )
				table.remove(Mes1, R2)
				table.remove(ColorBuff1, R2)

				ScriptMessage(Player , Player, 2 , ERROR[1] , 0) 
				AddBuff( Owner , ERROR[2] , 0 , 6 )
				WriteRoleValue ( Owner , EM_RoleValue_Register2 , Quest[1])  --�ˬd´�������W������		 
				Sleep(30) --�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == Quest[1] then
					CancelBuff( Owner , 622965 )  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
				end
				sleep(TR)
 		
			elseif QR <= 70 then --�T�����`
				ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES04]" ,  0) --ĵ�i�I´������ �T�� �i���X�{���~�I
				ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_MES04]" ,  0) --ĵ�i�I´������ �T�� �i���X�{���~�I
				table.remove(Mes1 , R)
				local QMes = Rand(2)+1
				ScriptMessage(Player , Player, 2 , Mes1[QMes] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 6 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --�ˬd´�������W������		 
				Sleep(30) --6�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
				end
				sleep(TR)

			else --��m���ܲ��`
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES05]" ,  0) --ĵ�i�I´������ ��m �i���X�{���~�I
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES05]" , 0) --ĵ�i�I´������ ��m �i���X�{���~�I
				table.remove(ColorBuff1 , R)
				local QBuff = Rand(2)+1
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[QBuff] , 0 , 6 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --�ˬd´�������W������		 
				Sleep(30) --6�����n�^�����D
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
					CancelBuff( Owner , 622965 )  --�R��´�������B�@BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --�L�k�ήɵ������U���~�A����´�a�F�C
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
				end
				sleep(TR)
			end
		else
			CancelBuff(Owner , 622966)
			break
		end
	end	
	CancelBuff( Owner , 622965) --´��������
	CancelBuff( Owner , 622966) --´�����_�ϯS��
	CancelBuff( Player , 622971) --���a�������
end