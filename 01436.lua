--�}�����ͽd��
function LuaYu_Ma2floor_matrix()--����  �a�O
--Lua_MadeByRectangle(113109 , 66.5 , 34.5 , 5 , 10)  --Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z (�����w�}�C���e)
	local Malatina = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --���� ����
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --����Ĳ�o�κ���
	local CountPid = ReadRoleValue( BoxMala ,EM_RoleValue_PID) --�ثe�ѲĴX��

	local floora = { }	
	local floorb = { }	
	local floorc = { }
	local floord = { }
	local floore = { }
	local floorf =  { }
	local floorg = { }
	local floorh = { }
	local floori  = { }


	local ClassNow = CountPid+1

	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff".."[SC_113120_MALA2_43]"..ClassNow.. "|r" , 0 ) --�^�X�G
	ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff".."[SC_113120_MALA2_43]"..ClassNow.. "|r" , 0 ) 


	sleep(10)

	if CountPid == 0 then -- Key*1

		 floora = { 113110,113109,113110,113113,113109 }--�� �� �� �� ��	
		 floorb = { 113108,113108,113108,113108,113108 }--�� �� �� �� ��	
		 floorc = { 113110,113111,113108,113111,113110 }--�� �� �� �� ��	
		 floord = { 113108,113110,113111,113108,113109 }--�� �� �� �� ��	
		 floore = { 113109,113113,113108,113111,113110 }--�� �� �� �� ��		
		 floorf =  { 113108,113108,113108,113108,113108 }--�� �� �� �� ��
		 floorg = { 113108,113112,113108,113110,113109 }--�� �_ �� �� ��	
		 floorh = { 113110,113111,113108,113113,113108 }--�� �� �� �� ��	
		 floori  = { 113111,113108,113111,113110,113110 }--�� �� �� �� ��

	elseif CountPid == 1 then --Key*2

		 floora = { 113110,113110,113109,113113,113109 }--�� �� �� �� ��	
		 floorb = { 113108,113108,113108,113108,113108 }--�� �� �� �� ��	
		 floorc = { 113110,113111,113108,113111,113110 }--�� �� �� �� ��	
		 floord = { 113108,113110,113111,113108,113109 }--�� �� �� �� ��	
		 floore = { 113109,113113,113108,113111,113112 }--�� �� �� �� �_		
		 floorf =  { 113108,113108,113108,113108,113108 }--�� �� �� �� ��
		 floorg = { 113108,113110,113108,113110,113109 }--�� �� �� �� ��	
		 floorh = { 113110,113111,113108,113113,113108 }--�� �� �� �� ��	
		 floori  = { 113111,113108,113111,113109,113112 }--�� �� �� �� �_

	elseif CountPid == 2 then -- Key*3

		 floora = { 113113,113110,113109,113110,113109 }--�� �� �� �� ��	
		 floorb = { 113108,113108,113108,113108,113108 }--�� �� �� �� ��	
		 floorc = { 113110,113111,113110,113111,113110 }--�� �� �� �� ��	
		 floord = { 113108,113110,113111,113111,113109 }--�� �� �� �� ��	
		 floore = { 113110,113113,113108,113111,113112 }--�� �� �� �� �_		
		 floorf =  { 113108,113108,113108,113108,113108 }--�� �� �� �� ��
		 floorg = { 113108,113112,113108,113110,113109 }--�� �_ �� �� ��	
		 floorh = { 113110,113111,113108,113113,113110 }--�� �� �� �� ��	
		 floori  = { 113111,113108,113111,113110,113112 }--�� �� �� �� �_

	elseif CountPid == 3 then --Key*4

		 floora = { 113113,113110,113109,113110,113109 }--�� �� �� �� ��	
		 floorb = { 113108,113108,113108,113108,113108 }--�� �� �� �� ��	
		 floorc = { 113112,113111,113111,113111,113110 }--�_ �� �� �� ��	
		 floord = { 113108,113110,113111,113108,113109 }--�� �� �� �� ��	
		 floore = { 113111,113113,113108,113111,113112 }--�� �� �� �� �_		
		 floorf =  { 113108,113108,113108,113108,113108 }--�� �� �� �� ��
		 floorg = { 113108,113112,113108,113110,113109 }--�� �_ �� �� ��	
		 floorh = { 113110,113111,113108,113110,113111 }--�� �� �� �� ��	
		 floori  = { 113111,113108,113111,113110,113112 }--�� �� �� �� �_

	end

	
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local Array={}
	local floor={}

		for i=1 , 9 do

			if i == 1 then			
				 floor = floora
			elseif i ==2 then
				 floor = floorb
			elseif i ==3 then
				 floor = floorc
			elseif i ==4 then
				 floor = floord
			elseif i ==5 then
				 floor = floore
			elseif i ==6 then
				 floor = floorf
			elseif i ==7 then
				 floor = floorg
			elseif i ==8 then
				 floor = floorh
			elseif i ==9 then
				 floor = floori
--			elseif i ==10 then
--				 floor = floorj
			end


			for j=1 , 5 do
				
				local Woo = rand(table.getn(floor))+1 -- �x�}�H�����ˡA+1�t���q1�}�l�C

				local ArrayX = table.getn(Array)

				Array[ArrayX+1] = floor[Woo]

				table.remove( floor,Woo)

			end

		end


	sleep(10)

	

	local Davis = Lua_MadeByRectangleX(  Array , 66.5 , 34.5 , 5 , 9)  --Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z (���w�}�C���e)

	for j=1 , table.getn(Davis) do	

		SetModeEx( Davis[j] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Davis[j] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Davis[j] , EM_SetModeType_Obstruct, true )--����
		SetModeEx( Davis[j] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Davis[j] , EM_SetModeType_Move, false )--����
		SetModeEx( Davis[j] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Davis[j] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Davis[j] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Davis[j] , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( Davis[j] , EM_SetModeType_DisableRotate, true )--��V
--		Hide(Davis[j])
--		Show(  Davis[j],RoomID)

	end


end

function LuaYu_Ma2floor_Del()

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  



	local floor = {}
--		if PlayerLV < 16 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102368, 300 , 1)    --��ťl�굲��
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 300 , 1)    --�p������
--		elseif PlayerLV >= 16 and PlayerLV < 26 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102372, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102373, 300 , 1)  
--		elseif PlayerLV >= 26 and PlayerLV < 36 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102376, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102377, 300 , 1)  
--		elseif PlayerLV >= 36 and PlayerLV < 46 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102380, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102381, 300 , 1)  
--		else
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102384, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102385, 300 , 1)  
--		end


		floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102368, 300 , 1)    --��ťl�굲�� lv 16��
		floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 300 , 1)    --�p������

		floor[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113104, 300 , 1)     --�����ý�
		floor[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112959, 300 , 1)     --�_�������~
		floor[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113115, 300 , 1)     --�����ؼ�
		floor[6] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113106, 300 , 1)     --KEY
		floor[7] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113107, 300 , 1)     --Door
		floor[8] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102382, 300 , 1)     --�K�ڰ�

		floor[9] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113108, 300 , 1)     
		floor[10] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113109, 300 , 1)     
		floor[11] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 300 , 1)     
		floor[12] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113111, 300 , 1)     
		floor[13] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113112, 300 , 1)     
		floor[14] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113113, 300 , 1)     
		floor[15] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113103, 300 , 1)     --������
		floor[16] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113105, 300 , 1)   --����ͥX�Ҧ��a�O
		floor[17] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044, 300 , 1)   --����R���������a�O

	for i=1 , table.getn(floor) do	
		if floor[i] ~= -1 then
			for j = 0 ,table.getn(floor[i])  do

				Delobj(floor[i][j])
			end
		end
	end



end

--*********************************************************************************************************************************


-- 113108 �ʦL(���H�����K�ڰ�) ���󲣥ͼ@��
function LuaYu_floorX_01_01() -- �a�OĲ�I�ഫ���j������   

	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"range",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )  -- �ȥ󦺤`�ɧR���ۤv����

end

-- 113111 �ʦL(��ťl�굲��) ���󲣥ͼ@��
function LuaYu_floorX_01_02() -- �a�OĲ�I�ഫ���j������   --  �T�D��

	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"range",  "LuaYu_floorX_ghoststage" , 40 )   --***�S��
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )   

end

-- 113112 �ʦL(�_�ä��_) ���󲣥ͼ@��
function LuaYu_floorX_01_03() -- �a�OĲ�I�ഫ���j������   --  KEY

	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"touch",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_KEYfloor_dead",0 )  --***�S��

end

-- 113109 �ʦL(����������)  ���󲣥ͼ@��
-- 113113 �ʦL(�������]�ۤ���)
-- 113110 �ʦL(�����ý�)
function LuaYu_floorX_01_04() -- �a�OĲ�I�ഫ���j������   --  ��L

	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"touch",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )  

end

--------------------------------------------------------

function LuaYu_floorX_01_begindead()  --�a�O���`�@��
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )   
end

-- �R������
function LuaYu_floorX_01_dead()

	SetPlot( OwnerID() ,"touch",  "" , 0 )  
	SetPlot( OwnerID() ,"range",  "" , 0 ) 


	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false )--�аO
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false )--�W��
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������


	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
	sleep(20)
	Delobj( OwnerID() )


end

function LuaYu_floorX_01_2() --�I�}�a�O�ܨ�
--Say( OwnerID(),"OwnerID()_1" )--���a
--Say( TargetID(),"TargetID()_1" )--����

--	if TargetID() ~= -1 then
	if CheckID( TargetID() )== true and CheckBuff( OwnerID() , 502864 ) == false and CheckBuff( OwnerID() , 503991 ) == false and CheckBuff( OwnerID() , 503992 ) == false then

		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		SetPlot( TargetID() ,"touch",  "" , 0 ) 
		SetPlot( TargetID() ,"range",  "" , 0 ) 

		local PlayerID = OwnerID()
		local floorID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --�өǦb��Ʈw���Τ@ID
		local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  



		local floorXID= {	113108,--�K�ڰ�
				113109,--���u�x���w
				113110,--���ý�
				113112,--�_��
				113113--�ǰe��
				}

		local XID1= {	102382,--�K�ڰ�
				113103,--���u�x���w
				113104,--���ý�               
				113106,--�_��
				113107--�ǰe��
				}

		local Newfloor = 0

		for i= 1 , table.getn(floorXID) do

			if floorID == floorXID[i] then 
				Newfloor = XID1[i]
			end
		end

		local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

		local NewfloorX = CreateObj( Newfloor , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

		SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--����
		SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--�W��
		SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--����
		SetModeEx( NewfloorX , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, false )--�Y����

		if Newfloor == 113103 then  									--���x
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, false )--����

		elseif floorID == 113108  then  --�K�ڰ�
			local MonsterLV 
				if PlayerLV <= 4 then
					MonsterLV = 5
				else
					MonsterLV = PlayerLV - (PlayerLV%5)
				end

			WriteRoleValue( NewfloorX , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--��V
			SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, true )--�Y����
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--�i�������
			AddBuff( NewfloorX ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

		elseif floorID == 113110  then  --���ý�

			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--��V
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--�i�������

		elseif floorID == 113113  then  --�ǰe

			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--��V
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--�i�������

		end

		SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--�аO
		AddToPartition( NewfloorX , RoomID )  

		if floorID == 113113  then   --�ǰe
			Callplot( NewfloorX , "LuaYu_Mala2_Door_01" , 0 )   -- �ǰe���@��
			SetPlot( NewfloorX ,"range",  "LuaYu_Mala2_Door_03" , 15 ) 
		end

		Delobj( TargetID() )


	end
end

function LuaYu_floorX_ghoststage() --�I�}�a�O�ܨ�  ��ťl�굲��
--	Say( OwnerID(),"O1" )--���a
--	Say( TargetID(),"T1" )--����

	if CheckID( TargetID() )== true and CheckBuff( OwnerID() , 502864 ) == false then

		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		SetPlot( TargetID() ,"range",  "" , 0 ) 

		local PlayerID = OwnerID()
		local floorID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --�өǦb��Ʈw���Τ@ID
		local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  

		local Newfloor = 102368  -- �令��16�Ū�
		local MonsterLV 
			if PlayerLV <= 4 then
				MonsterLV = 5
			else
				MonsterLV = PlayerLV - (PlayerLV%5)
			end


		local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

		local NewfloorX = CreateObj( Newfloor , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
		WriteRoleValue( NewfloorX , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
		SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--����
		SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
		SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--�W��
		SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( NewfloorX , EM_SetModeType_Strikback, true )--����
		SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--�i�������
		AddBuff( NewfloorX ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		AddToPartition( NewfloorX , RoomID )  
		WriteRoleValue( NewfloorX  , EM_RoleValue_Register , OwnerID() ) --�O���a
		SetPlot( NewfloorX , "dead","LuaYu_Mala2_ghost_03",0 )  -- ��Ť��� ���`�@��
		Beginplot( NewfloorX , "LuaYu_Mala2_ghost_01" , 0 )     -- ��Ť��� ���� �p������

		Delobj( TargetID() )
		SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--�аO

	end

end


-----------------------�_�c------------------------------------
function LuaYU_Mala2_Treasure()   
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_Treasure01" , 20 )  
end


function LuaYU_Mala2_Treasure01()  
	local O_ID = OwnerID()   -- ���a
	local T_ID = TargetID()    -- �_�c

--	say(O_ID, "O1")
--	say(T_ID, "T1") 
	local KEY =  CountBodyItem( O_ID , 203027 )    --���qKEY
	
	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if KEY > 0 then
		-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
		if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
			if BeginCastBarEvent( O_ID, T_ID,"[SO_110195_1]", 30, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_Mala2_Treasure02" ) ~= 1 then
				ScriptMessage( O_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			end
		end
	else
		ScriptMessage( O_ID , O_ID , 1 , "  [SC_113120_MALA2_45]  " , 0 ) --�A�ݭn�_��
		ScriptMessage( O_ID , O_ID , 0 , "  [SC_113120_MALA2_45]  " , 0 ) --�A�ݭn�_��
	end
end

-- ���q�_߹2
function LuaYU_Mala2_Treasure02( ObjID, CheckStatus )
	local O_ID = OwnerID()   -- ���a
	local T_ID = TargetID()    -- �_�c

--	say(O_ID, "O2")
--	say(T_ID, "T2")

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				SetPlot( T_ID,"touch","",0 )	
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
				BeginPlot( O_ID, "LuaYU_Mala2_Treasure03" , 0 )  -- �}�_�c
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- ���q�_߹3
function LuaYU_Mala2_Treasure03()   
	local Player = OwnerID() 
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  
 
	DelBodyItem( Player , 203027 , 1 )  -- ���qkey
	GiveBodyItem( Player , 720592 , 1 );  

	if PlayerLV >= 40 then  --�̵��ŧP�_
		local XX = Rand(100)+1     				
		if XX >= 91 then   --10%
			GiveBodyItem( Player , 201967 , 2 ) --�w�߭ײz��*2
		elseif XX >= 71 and XX <= 90 then   --20%
			GiveBodyItem( Player , 201967 , 1 ) --�w�߭ײz��*1
		end
	end			
end

-----------------------�_�c------------------------------------
function LuaYU_Mala2_Treasure2()   
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_Treasure201" , 20 )  
end

-- �S���_߹1
function LuaYU_Mala2_Treasure201()   
	local O_ID = OwnerID()   -- ���a
	local T_ID = TargetID()    -- �_�c

--	say(O_ID, "O1")
--	say(T_ID, "T1")
	local KEY =  CountBodyItem( O_ID , 205791 )    --�S��KEY

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if KEY > 0 then
		-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
		if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
			if BeginCastBarEvent( O_ID, T_ID,"[SO_110195_1]", 30, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_Mala2_Treasure202" ) ~= 1 then
				ScriptMessage( O_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			end
		end
	else
		ScriptMessage( O_ID , O_ID , 1 , "[SC_113120_MALA2_67]" , 0 ) --�A�ݭn�S���_��
		ScriptMessage( O_ID , O_ID , 0,  "[SC_113120_MALA2_67]" , 0 ) --
	end
end

-- �S���_߹2
function LuaYU_Mala2_Treasure202( ObjID, CheckStatus )
	local O_ID = OwnerID()   -- ���a
	local T_ID = TargetID()    -- �_�c

--	say(O_ID, "O2")
--	say(T_ID, "T2")

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( O_ID ) >= 2  and QueuePacketCount( O_ID ) == 0 then	
				SetPlot( T_ID,"touch","",0 )	
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
				BeginPlot( O_ID, "LuaYU_Mala2_Treasure203" , 0 )  -- �}�_�c
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �S���_߹3
function LuaYU_Mala2_Treasure203()   
	local Player = OwnerID() 
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  

	local P = 100
	local XX = Rand( P )     

	DelBodyItem( Player , 205791 , 1 )

	GiveBodyItem( Player , 720591 , 1 );  
	if PlayerLV >= 40 then  --�̵��ŧP�_
		if XX > 30 and XX <= 100 then   --70%
			GiveBodyItem( Player , 203487 , 1 ) --�]���_��1�I*1
		else  --30%
	
			GiveBodyItem( Player , 203487 , 2 ) --�]���_��1�I*2
		end
	end
						
end









