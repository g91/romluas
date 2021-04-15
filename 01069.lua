function Lua_Hao_ClickFunGo_Test_DelOBJ()

	local NPC = { 101553 , 101554 , 112068 , 112067 }	-- �R�B����ê�̡B�̹B�l��̡B�_�c��
	local Target = {}
	local Count = 0

	for i = 1 , table.getn(NPC) , 1 do
		Lua_Hao_NPCofAll_Clear(NPC[i])
	end
end
------------------------------------------------------------------------------2011.06.13 �ץ��C���i�椤�������n�Υd�I�^���ɡA�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
function Lua_Hao_ClickFunGo_DelObj( Player , Range )

	local NPC = { 101553 , 101554 , 112068 }	-- �R�B����ê�̡B�̹B�l��̡B�_�c��
	local Target = {}

	while true do
		if CheckID(Player) == false then	-- �p�G���a���b���ϰ�
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then	-- �p�G���a���b���ճ��d��
			BeginPlot( Player , "Lua_Clockending" , 0 )
			BeginPlot( Player , "LuaYU_ClickFunGo_06" , 0 )


			local Boxdel = LuaFunc_SearchNPCbyOrgID( OwnerID(), 112068, 300 , 1)       --�R���Ҧ��c�l

			if CheckID(Boxdel[0]) == true then
				for i = 0 , table.getn(Boxdel) do

					Delobj(Boxdel[i])
				end
			end

			sleep(10)

			local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 300 , 1)       --�R���Ҧ��_�c��

			if CheckID(BoxMonster[0]) == true then
				for i = 0 , table.getn(BoxMonster) do

					Delobj(BoxMonster[i])
				end
			end

			local BoxMboss = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101554, 300 , 1)       --�R���Ҧ��̹BBOSS

			if CheckID(BoxMboss[0]) == true then
				for i = 0 , table.getn(BoxMboss) do

					Delobj(BoxMboss[i])
				end
			end

			sleep(5)
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
end
------------------------------------------------------------------------------
function LuaYU_ClickFunGo_Start()

	SetPlot( OwnerID() , "range" , "LuaYU_ClickFunGo_Start_1" , 300 )
	
end

function LuaYU_ClickFunGo_Start_1()
------------------------------------------------------------------------------2011.06.13 �ץ��C���i�椤�������n�Υd�I�^���ɡA�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
	CallPlot( TargetID() , "Lua_Hao_ClickFunGo_DelObj" , OwnerID() , 500 )
------------------------------------------------------------------------------
	Sleep(20)
	--Say(TargetID(), "[SC_CLICKFUNGO01]")
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_CLICKFUNGO01]".. "|r" , 0 )
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_CLICKFUNGO01]".. "|r" , 0 )  
	PlayMotion( TargetID(), 116) 
	Sleep(10)
	PlayMotion( TargetID(), 112) 
	Sleep(10)
	PlayMotion( TargetID(), 123) 
end

function LuaYU_ClickFunGo_00()

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	--Say(TargetID(), "Welcome! Welcome!")
	local ChangeGift = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 
	
		if ChangeGift == 0 then

			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO01]"  ) --�A�n�A�ڬO�ճ��V�m�ҵ{�G�y�R�B�n�n���z���޲z��XXX�A�аݦ�����Ʊ��ܡH
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO02]"  , "LuaYU_ClickFunGo_01", 0 )--�ҵ{�W�h����
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO03]"  , "LuaYU_ClickFunGo_02", 0 )--�i��y�R�B�n�n���z
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaYU_ClickFunGo_leave_0", 0 )--���}�ճ�

		elseif ChangeGift == 168 then

			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO07]"  ) --�q�ҵ{����o��<CB>[205017]</CB>�P<CB>[205018]</CB>�i�I�����y§�~�A�䤤<CB>[205017]</CB>�Y���}�ճ��e�S���I�������N<CS>��������</CS>�A�ЯS�O�`�N�I
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO24]"  , "LuaYU_ClickFunGo_Gift_1", 0 )--�I�����y
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaYU_ClickFunGo_leave_0", 0 )--���}�ճ�

		end


end

--�H�U�}�l�C��------------************************************--------------------------
function LuaYU_ClickFunGo_01()

		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID(), 112) 
		SetSpeakDetail(  OwnerID(), " [SC_CLICKFUNGO08] "  ) 

--�y�R�B�n�n���z�ҵ{�`�N�ƶ��A
	--1.�C���ɶ�5�����C
	--2.10�^�X���C�^�X�X�{�ƶq���P���_�c�A�}�����T��[112068]�N��o<CB>���y����</CB>�C
	--3.���y��������<CB>[205017]</CB>�P<CB>[205018]</CB>�b�C��������N�i�I�����y§�~�C

--�t�~�A�b�C���L�{���ڤ]�|�����۹諸���ܨ�U�A�ЯS�O�`�N�A���z�n�B�I

		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_00", 0 )--�^�W�@��

end

function LuaYU_ClickFunGo_02()--�}�l�C�� ���a��������NPC

	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	BeginPlot( OwnerID() , "LuaYU_ClickFunGo_03" , 0 )

	SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--�аO

	Hide(TargetID())
	Show(TargetID() , RoomID )
	WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  TargetID() ) 

end

function LuaYU_ClickFunGo_03() 

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 

	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+7 ,  0 ) --�R�B����
	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+8 ,  0 ) --���B����

	SetModeEx( Manager  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Manager  , EM_SetModeType_Fight , true )--�i�������

	Hide(Manager)
	Show(Manager, RoomID)

				

	local MissionNow= {		1,		--�ثe�i��^�X��
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9,
				10
					}

	local BoxCount= {		2,		--�������_�c��
				2,
				3,
				3,
				4,
				4,
				5,
				6,
				7,
				8
					}



	sleep(10)
	LuaDan_HitShrew_CheckOK(5,5,0)--�˼Ƥ���i��
	sleep(30)
	AdjustFaceDir( Manager, OwnerID() , 0 ) --���V
	sleep(10)
	PlayMotion( Manager, 111) 
	sleep(10)
	ClockOpen( OwnerID() ,EM_ClockCheckValue_4,300,300,0,"Lua_Clockending","LuaYU_ClickFunGo_06") --�˼ƭp�ɾ� (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_CLICKFUNGO09]".. "|r" , 0 ) 
	Say(Manager,"[SC_CLICKFUNGO09]")
	PlayMotion( Manager, 115) 


	while true do

		sleep(10)

		local BoxNo = ReadRoleValue( Manager , EM_RoleValue_PID  ) --�P�_�ثe�ĴX�^�X 
		local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�����^�X��

	--	local Token = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+7  ) --�R�B����
	--	local LuckyToken = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+8  ) --���B����

		if MissionOK ==  10 then
			Callplot(OwnerID(), "LuaYU_ClickFunGo_03_1", 0 )
			break

		elseif MissionOK ==  BoxNo then --������d�����A�i��U�@��


			local Boxdel = LuaFunc_SearchNPCbyOrgID( Manager, 112068, 300 , 1)       --�R���Ҧ��c�l

			if CheckID(Boxdel[0]) == true then
				for i = 0 , table.getn(Boxdel) do

					SetPlot( Boxdel[i] ,"touch",  "" , 0 )   
					Delobj(Boxdel[i])
				end
			end

			local BoxMonster = LuaFunc_SearchNPCbyOrgID( Manager, 101553, 300 , 1)       --�R���Ҧ��c�l

			if CheckID(BoxMonster[0]) == true then
				for i = 0 , table.getn(BoxMonster) do

					Delobj(BoxMonster[i])
				end
			end

			BoxNo = BoxNo+1
			WriteRoleValue(  Manager  , EM_RoleValue_PID ,  BoxNo ) --�U�@��

			local CCCBOX = {}
			if BoxNo == 10 then 
				PlayMotion( Manager, 109) 
				Say(Manager,"[SC_CLICKFUNGO10]".."[SC_CLICKFUNGO40]")--�U�@�^�X�}�l�a�I

			else
				PlayMotion( Manager, 109) 
				Say(Manager,"[SC_CLICKFUNGO10]"..BoxNo)--�U�@�^�X�}�l�a�I
			end

			sleep(10)

			for q = 1 ,8 do  --�����_�c
				CCCBOX[q] = CreateObjByFlag( 112068, 780308 , q , 1 );
				WriteRoleValue(  CCCBOX[q]  , EM_RoleValue_PID ,  Manager ) 
			end
				
			local Boxtotal = 0 --���X�_�c�`�ƶq


			for i = 1 , table.getn(MissionNow) do

				if BoxNo == MissionNow[i] then   --���@�^�X
					Boxtotal = BoxCount[i]   --�X�h�ֶq���c�l
				end
			end

		--�H�U�H���P�_�����_�c��m
			local floorX={}
			for i= 1,table.getn(CCCBOX) do
				floorX[i]=CCCBOX[i]
			end


			sleep(10)


			local Y={}

			for i=1 , Boxtotal do
				local W = rand(table.getn(floorX)) +1   -- �x�}�H�����ˡA+1�t���q1�}�l�C
				Y[i] = floorX[W]
				table.remove(floorX,W)
			end
			sleep(10)
	
			for i=1, 1 do
				local RoomID = ReadRoleValue( Manager ,EM_RoleValue_RoomID) 

				SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_01" , 10 )   
		--		Show( Y[i] , RoomID )
				AddToPartition( Y[i] , RoomID )  
				Hide( Y[i]  )
				Show( Y[i]  , RoomID)
				--Say( Y[i] , "HERE")
			end

			for i=2, Boxtotal do

					local P = 100
					local XX = DW_Rand( P )     
								
					if XX > 95 and XX <= 100 then   --5%    �̹BBOSS   Game Over

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_02" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)

					elseif XX > 75 and XX <= 95 then   --20%    �R�B������    �[�t

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_03" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 55 and XX <= 75 then   --20%    �R�B������    ��t

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_04" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 40 and XX <= 55 then   --15%    �R�B������    ����

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_05" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					elseif XX > 20 and XX <= 40 then   --20%    �R�B��ê��    �~�@��

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_06" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)


					else --20%    �R�B��ê��    �z�Z

						SetPlot( Y[i] ,"touch",  "LuaYU_ClickFunGoBox_07" , 10 )   
						AddToPartition( Y[i] , RoomID )  
						Hide( Y[i]  )
						Show( Y[i]  , RoomID)
					end
			end
		end
	end
end

function LuaYU_ClickFunGo_03_1()
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	local Token = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+7  ) --�R�B����
	local LuckyToken = ReadRoleValue( OwnerID()  , EM_RoleValue_Register+8  ) --���B����

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CLICKFUNGO11]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken , 1 ) --�C�������A�����@��o<CB>[205017]</CB>�G
	Say(Manager,"[SC_CLICKFUNGO11]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken )		

	PlayMotion( Manager, 111) 

	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  	--�����p�ɾ�

	local Boxdel = LuaFunc_SearchNPCbyOrgID( Manager, 112068, 300 , 1)       --�R���Ҧ��c�l

	if CheckID(Boxdel[0]) == true then
		for i = 0 , table.getn(Boxdel) do
			Delobj(Boxdel[i])
		end
	end

	local BoxMonster = LuaFunc_SearchNPCbyOrgID( Manager, 101553, 300 , 1)       --�R���Ҧ��_�c��

	if CheckID(BoxMonster[0]) == true then
		for i = 0 , table.getn(BoxMonster) do
			Delobj(BoxMonster[i])
		end
	end

	local BoxMboss = LuaFunc_SearchNPCbyOrgID( Manager, 101554, 300 , 1)       --�R���Ҧ��̹BBOSS

	if CheckID(BoxMboss[0]) == true then
		for i = 0 , table.getn(BoxMboss) do
			Delobj(BoxMboss[i])
		end
	end

	SetModeEx( Manager   , EM_SetModeType_Mark, true )--�аO
	Hide( Manager )
	Show( Manager , RoomID )

	WriteRoleValue(  Manager  , EM_RoleValue_PID ,  168 ) 

	if Token > 0 or LuckyToken > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CLICKFUNGO23]" , 1 ) --�Ӵ���
		Say(Manager,"[SC_CLICKFUNGO23]")		
		PlayMotion( Manager, 116) 
	end

	FN_GuildGame_Honor( OwnerID(), 100 )
end


function LuaYU_ClickFunGo_04()--�����~

	SetSpeakDetail(  OwnerID(), " Exchange gifts "  ) 
	AddSpeakOption( OwnerID(), TargetID( ), "The rule of ClickFunGo."  , "LuaYU_ClickFunGo_01", 0 )

end

function LuaYU_ClickFunGo_05()--�_�c�Ǳ���

--	WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 1 )

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	while true do
		sleep(10)

		local Attacking = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 50 , 1)       --�_�c��

		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  ) --�����^�X��

		if Attacking == 0 then
			if CheckID(BoxMonster[0])== true then

				Say( OwnerID(), "[SC_CLICKFUNGO22]" ) --����

				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, true )--����
				Hide(OwnerID())
				Show(OwnerID(), RoomID)

				SetModeEx( BoxMonster[0] , EM_SetModeType_Fight , true )--�i�������
				SetModeEx( BoxMonster[0] , EM_SetModeType_Revive , false )--�i����
				Hide(BoxMonster[0])
				Show(BoxMonster[0], RoomID)

				local BoxMonster = LuaFunc_SearchNPCbyOrgID( OwnerID(), 101553, 50 , 1)       --�_�c��

				SetAttack( OwnerID() , BoxMonster[0] )
				WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  1 ) --�԰���
				WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+1,  BoxMonster[0] ) --�԰���	

			end

		elseif Attacking == 1 then
			if CheckID(AttackTarget)== false then	

				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--����
				Hide(OwnerID())
				Show(OwnerID(), RoomID)

				WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  0 ) --�԰���

			end
		end
	end

end

function LuaYU_ClickFunGo_06()--�_�c�Ǳ���

	local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --�Щx

	WriteRoleValue(  Manager  , EM_RoleValue_Register+1 ,  10 ) 
end





function LuaYU_ClickFunGo_leave_0()--���}�ճ�

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����
			
		if Token > 0 then
			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO05]"  ) --�z�|�����I����<CB>[205017]</CB>�A�Y���}�ճ��N<CS>��������</CS>�A�z�T�w�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]"  , "LuaYU_ClickFunGo_leave_1", 0 )--�T�w
		else
			SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO06]"  ) --�z�T�w�n���}�ճ��V�m�ҵ{�G�y�R�B�n�n���z�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_202800_2]"   , "LuaYU_ClickFunGo_leave_1", 0 )--�T�w
		end

end

function LuaYU_ClickFunGo_leave_1()--���}�V�m��

	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	DelObj( TargetID() )	 	--	2010/12/08 �ץ��C��������A�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D�C

end


--�H�U�}�l    ���y�I��------------************************************--------------------------

function LuaYU_ClickFunGo_Gift_1()--�I�����y

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����
	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --���B����


	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO25]".."     ".."[SC_CLICKFUNGO36]"..Token.." ".."[SC_CLICKFUNGO12]"..LuckyToken  ) --�I������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO26]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�R�B���I�����y
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO27]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--���B���I�����y

end

function LuaYU_ClickFunGo_Gift_2()--�R�B���I�����y

	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO23]"  )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO28]"  , "LuaYU_Click_GiftExchange_01", 0 )--�R�B������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO29]"  , "LuaYU_Click_GiftExchange_02", 0 )--���B�ľ�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO30]"  , "LuaYU_Click_GiftExchange_03", 0 )--�j�ѨϹĮ�	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO31]"  , "LuaYU_Click_GiftExchange_04", 0 )--�A���@��	

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO32]"  , "LuaYU_Click_GiftExchange_05", 0 )--�����ů��_��60%	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO33]"  , "LuaYU_Click_GiftExchange_06", 0 )--�������]�O�Ĥ�50%	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO34]"  , "LuaYU_Click_GiftExchange_07", 0 )--�����ťͩR�Ĥ�50%	

end

function LuaYU_ClickFunGo_Gift_3()--���B���I�����y

	SetSpeakDetail(  OwnerID(), "[SC_CLICKFUNGO23]"  )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO35]"  , "LuaYU_Click_GiftExchange_08", 0 )--�R�B������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO41]"  , "LuaYU_Click_GiftExchange_09", 0 )--�R�B������
end


function LuaYU_Click_GiftExchange_01()--�R�B�������I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 30 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 205019 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 30 )	
			PlayMotion( TargetID(), 111) 
		end

	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end	

end

function LuaYU_Click_GiftExchange_02()--���B�ľ��I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 25 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 202322 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 25 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	

	end	

end

function LuaYU_Click_GiftExchange_03()--�j�ѨϹĮ��I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 20 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 201139 , 1 );  
			DelBodyItem( OwnerID() , 205017 , 20 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end	

end

function LuaYU_Click_GiftExchange_04()--�A���@���I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 15 then

		DelBodyItem( OwnerID() , 205017 , 15 )	
		PlayMotion( TargetID(), 111) 

		CloseSpeak( OwnerID() ) 
		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

		WriteRoleValue(  TargetID()  , EM_RoleValue_PID ,  0 ) 
		WriteRoleValue(  TargetID()  , EM_RoleValue_Register+1  ,  0 ) 

		BeginPlot( OwnerID() , "LuaYU_ClickFunGo_03" , 0 )

		SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--�аO

		Hide(TargetID())
		Show(TargetID() , RoomID )
	
		WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  TargetID() ) 


	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end		

end

function LuaYU_Click_GiftExchange_05()--�����ů��_��60%�I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 10 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203493 , 3 );  
			DelBodyItem( OwnerID() , 205017 , 10 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end	

end

function LuaYU_Click_GiftExchange_06()--�������]�O�Ĥ�50%�I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 4 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203497 , 2 );  
			DelBodyItem( OwnerID() , 205017 , 4 )	
			PlayMotion( TargetID(), 111) 
		end	
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end	

end

function LuaYU_Click_GiftExchange_07()--�����ťͩR�Ĥ�50%�I��

	local Token =  CountBodyItem( OwnerID() , 205017 )  --�R�B����

	if Token >= 4 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 203502 , 2 );  
			DelBodyItem( OwnerID() , 205017 , 4 )	
			PlayMotion( TargetID(), 111) 
		end
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_2", 0 )--�W�@��

	
	end		

end

function LuaYU_Click_GiftExchange_08()--�I���R�B����

	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --���B����

	if LuckyToken >= 50 then
---------------------------------------2011.07.06 �ק�R�B���������ƶq-----------------------------------------
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
		--	GiveBodyItem( OwnerID() , 205019 , 1 );  
			GiveBodyItem( OwnerID() , 205019 , 1 )
			DelBodyItem( OwnerID() , 205018 , 50 )	
			PlayMotion( TargetID(), 111) 
		end
-----------------------------------------------------------------------------------------------------------------------
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--�W�@��

	
	end	

end

function LuaYU_Click_GiftExchange_09()--�I���]�����

	local LuckyToken =  CountBodyItem( OwnerID() , 205018 )  --���B����

	if LuckyToken >= 20 then

		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			CloseSpeak( OwnerID() ) 
			GiveBodyItem( OwnerID() , 202916 , 1 );  
			DelBodyItem( OwnerID() , 205018 , 20 )	
			PlayMotion( TargetID(), 111) 
		end
	else
		SetSpeakDetail(  OwnerID(), "[SC_111490_DIALOG9]"  ) --����
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "LuaYU_ClickFunGo_Gift_3", 0 )--�W�@��

	
	end	

end