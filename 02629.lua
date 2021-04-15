--Z23_05�C��D�u �P����J�|�X-
function Dy_Z23_S01fight()
	Z23_DeMagicCavy_00()
	local black = 106676 --���`�ۺ�U
	local nakui = 106617 --���ť��^
	local s1 = {"[SC_Q425210_S01_01]","[SC_Q425210_S01_02]","[SC_Q425210_S01_03]"}
	local s2 = {"[SC_Q425210_S01_11]","[SC_Q425210_S01_12]","[SC_Q425210_S01_13]"}
	local RoomID = ReadRoleValue(TargetID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(TargetID() , EM_RoleValue_X)
	local Y = ReadRoleValue(TargetID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(TargetID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(TargetID() , EM_RoleValue_Dir)	
	local Pos = Lua_BuffPosSearch( TargetID() , 622104 )                      ---------------------��X���W���k�N�N��
	local PLV = BuffInfo( TargetID() , Pos , EM_BuffInfoType_Power )			 -------------------------���k�N������
	SetPlot( OwnerID(),"dead","Dy_Z23_Ndead",10 )---- ���`�@��
	LoadQuestOption(TargetID()) 
	if CheckAcceptQuest(TargetID(), 425214  )  == true then
		if PLV <  2 then
			--say(TargetID() , "PLV = "..PLV)
			local bk1 = CreateObj ( black , X+30 , Y , Z+30  , Dir , 1) 
			SetModeEx( bk1  ,EM_SetModeType_Show, true )--���*
			SetModeEx( bk1  ,EM_SetModeType_Searchenemy , true ) --����*
			SetModeEx( bk1  ,EM_SetModeType_Save , true ) --�x�s*
			SetModeEx( bk1  ,EM_SetModeType_Revive , false ) --����*
			SetModeEx( bk1  ,EM_SetModeType_Obstruct , false )--����*
			SetModeEx( bk1  ,EM_SetModeType_Strikback , true ) --����*
			SetModeEx( bk1  ,EM_SetModeType_Fight , true ) --���*
			SetModeEx( bk1  ,EM_SetModeType_Gravity , true ) --���O*	
			SetModeEx( bk1  ,EM_SetModeType_Move , true ) --����*
			SetModeEx( bk1  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
			SetModeEx( bk1  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
			SetModeEx( bk1  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
			AddToPartition( bk1, RoomID)	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , bk1) --�s��Ǫ��e��1�̭�
			WriteRoleValue( bk1 , EM_RoleValue_Register1 , OwnerID())
			local bk2 = CreateObj ( black , X-30 , Y , Z-30  , Dir , 1)
			SetModeEx( bk2  ,EM_SetModeType_Show, true )--���*
			SetModeEx( bk2  ,EM_SetModeType_Searchenemy , true ) --����*
			SetModeEx( bk2  ,EM_SetModeType_Save , false ) --�x�s*
			SetModeEx( bk2  ,EM_SetModeType_Revive , false ) --����*
			SetModeEx( bk2  ,EM_SetModeType_Obstruct , false )--����*
			SetModeEx( bk2  ,EM_SetModeType_Strikback , true ) --����*
			SetModeEx( bk2  ,EM_SetModeType_Fight , true ) --���*
			SetModeEx( bk2  ,EM_SetModeType_Gravity , true ) --���O*	
			SetModeEx( bk2  ,EM_SetModeType_Move , true ) --����*
			SetModeEx( bk2  ,EM_SetModeType_ShowRoleHead , false ) --�Y����*
			SetModeEx( bk2  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
			SetModeEx( bk2  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
			AddToPartition( bk2, RoomID)
			WriteRoleValue( OwnerID() , EM_RoleValue_Register2 , bk2) -- �s��Ǫ��e��2�̭�
			WriteRoleValue( bk2 , EM_RoleValue_Register2 , OwnerID())
			
			--�X�{��^!
			if CheckBuff (TargetID() , 622104) == false and PLV == 0 then --����1�����۸� 
				say ( bk1 , s1[1])
				say ( bk2 , s2[1])
				AddBuff( TargetID() , 622104 , 0 ,-1) --���ѭp��BUFF	
			elseif CheckBuff (TargetID() , 622104) == true and PLV == 0  then --����2�����۸�
				say ( bk1 , s1[2])
				say ( bk2 , s2[2])	
				AddBuff( TargetID() , 622104 , 0 ,-1) --���ѭp��BUFF
			elseif CheckBuff (TargetID() , 622104) == true and PLV == 1 then --3���ͺ�^
				say ( bk1 , s1[3])
				say ( bk2 , s2[3])
				local M3 = CreateObj ( nakui , X , Y , Z  , Dir , 1)
				SetModeEx( M3  ,EM_SetModeType_Show, true )--���*
				SetModeEx( M3  ,EM_SetModeType_Searchenemy , true ) --����*
				SetModeEx( M3  ,EM_SetModeType_Save , false ) --�x�s*
				SetModeEx( M3  ,EM_SetModeType_Revive , false ) --����*
				SetModeEx( M3  ,EM_SetModeType_Obstruct , false )--����*
				SetModeEx( M3  ,EM_SetModeType_Strikback , true ) --����*
				SetModeEx( M3  ,EM_SetModeType_Fight , true ) --���*
				SetModeEx( M3  ,EM_SetModeType_Gravity , true ) --���O*	
				SetModeEx( M3  ,EM_SetModeType_Move , true ) --����*
				SetModeEx( M3  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
				SetModeEx( M3  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
				SetModeEx( M3  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
				AddToPartition( M3, RoomID)
				BeginPlot( M3, "Dy_Z23_M3die", 10) 
				CancelBuff	(TargetID() , 622104)
				--AddBuff( M3 , 622207 , 0 ,-1) --�ܤj��w
				SetAttack(bk1 , M3 )
				SetAttack(bk2 , M3 )
			end
			
			sysCastSpellLv	( bk1,  OwnerID() , 850031 , 0 ) ---�ۤv�l�޶��`�ۺ�U���`�N
			sysCastSpellLv	( bk2,  OwnerID() , 850031 , 0 )

			
			sleep(10)
			SetAttack( bk1 , OwnerID() ) --�s���`�ۺ�U���ۤv
			SetAttack( bk2 , OwnerID() ) 
		end
	end
end
--���`�۶ħL�P��y������
function Dy_Z23_Ndead ()
	local bk1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) 
	local bk2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 ) 
	if CheckID( bk1 ) == true then
		DelObj(bk1)
	end
	if CheckID( bk2 ) == true then
		DelObj(bk2)
	end	
end
--�s����^����
function Dy_Z23_M3die () --5���������
	local count = 0
	while 1 do
		sleep(10)
		count = count +1
		--say (OwnerID() , "d = "..count)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
		if count > 300 and AttackTarget == 0  and ( CheckID( OwnerID() ) ) == true then
			DelObj(OwnerID())
		end
	end
end
--����J����
function Dy_Z23_Mgivecheck()
	setplot(OwnerID(),"range","Dy_Z23_Mgive",100 ) 
end
function Dy_z23_Mchat()
	local num=0
	local npc= SearchRangeNPC( OwnerID(), 100 )
	for i=0,table.getn(npc) do
		if ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106611 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106612 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106613 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106614 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106617 or
		ReadRoleValue( npc[i] , EM_RoleValue_OrgID) == 106620 then
			num=num+1
		end
	end
	if num==0 then
		LoadQuestOption(OwnerID())
		SetSpeakDetail( TargetID(), "[SC_Q425210_M01]" )
	else	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_NPC120275_00]", C_SYSTEM )--���񦳥i�ê��ĤH�A����J�ȮɵL�k���A��i�@�B�������I
		SetSpeakDetail( TargetID(), "[SC_Q425210_M02]" )
		BeginPlot( TargetID() , "Dy_Z23_chat02" , 20 )
	end
end
function Dy_Z23_chat02()
	CloseSpeak( TargetID() )
end
function Dy_Z23_Mgive()
	--say (OwnerID() , "2") --Player
	--say (TargetID() , "Target") --NPC
	if CheckFlag( OwnerID() , 546197 ) == true then
		GiveBodyItem( OwnerID(), 546198, 1 ) --������켯��J�����ȱ���
		--say (TargetID() , "here")
	end
end
function Dy_Z23_fin()--���������ܦ^�S�����˪����A
	Lua_ZonePE_3th_GetScore(50)
	GiveBodyItem( TargetID(), 546240, 1 ) --�|�X�ᵹ�����n���~1
	GiveBodyItem( TargetID(), 547007, 1 ) --�|�X�ᵹ�����n���~2
end

---Z23_06 �}�a�˸m�@������
function Dy_Z23_06_CHECK() --�ϥβŤ��241226���ˬd
	local set = 106810 --�˸m��ID
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),425215) == true then --�ˬd���S��������
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == set then --�p�G�ؼЬO�˸m
			if CheckBuff( TargetID() , 622577 ) == false then --�ˬd���W���S���U�N��BUFF	�S������
				return true
			elseif CheckBuff( TargetID() , 622577 ) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z23_Q425215_10]" , 0 )  --�˸m�w�Q���M
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z23_Q425215_10]" , 0 )				
				return false
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --�ؼп��~
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )	
			return false
		end
	end
end function Dy_Z23_06_USE() --�ϥβŤ��241226���@��
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)	
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
		DW_QietKillOne(OwnerID(), 106809  )  -- ������NPC - �w�}�a�˸m
		AddBuff( TargetID() , 622577 , 0 , -1) --���M����
		AddBuff( OwnerID() , 622579 , 0 ,-1) --�w��Buff
		DelBodyItem( OwnerID(), 241226, 1 )--�R���A��Ť��
		DelBodyItem( OwnerID() , 546240 , 1 ) --�R���i�H����S���˪�����J�����n���~1
		GiveBodyItem( OwnerID(), 546520, 1 ) --��������J�^��a�����n���~
		local show06 = CreateObj ( 106848 , X , Y , Z  , Dir , 1)  --�إߤ�����06
		SetModeEx( show06  ,EM_SetModeType_Show, true )--���*
		SetModeEx( show06  ,EM_SetModeType_Searchenemy , false ) --����*
		SetModeEx( show06  ,EM_SetModeType_Save , true ) --�x�s*
		SetModeEx( show06  ,EM_SetModeType_Revive , false ) --����*
		SetModeEx( show06  ,EM_SetModeType_Obstruct , false )--����*
		SetModeEx( show06  ,EM_SetModeType_Strikback , false ) --����*
		SetModeEx( show06  ,EM_SetModeType_Fight , false ) --���*
		SetModeEx( show06  ,EM_SetModeType_Gravity , true ) --���O*	
		SetModeEx( show06  ,EM_SetModeType_Move , false ) --����*
		SetModeEx( show06  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
		SetModeEx( show06  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
		SetModeEx( show06  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
		AddToPartition( show06, RoomID)
		BeginPlot( show06, "Dy_Z23_06_show", 10) 	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register5 , show06) --�N�������s��ۤv���e��5�̭�
		WriteRoleValue( show06 , EM_RoleValue_Register5 , OwnerID()) --�N�ۤv�s�줤�������e��5�̭�	
		WriteRoleValue( TargetID() , EM_RoleValue_Register6 , show06) --�N�������s��ؼЪ��e��6�̭�
		WriteRoleValue( show06 , EM_RoleValue_Register6 , TargetID()) --�N�ؼЦs�줤�������e��6�̭�			

end

function Dy_Z23_06_show() --��t
	--say (OwnerID() , "111")
	local gill = 120915
	local nakui = 120913 
	local black = 120916
	local namob = 120914
	local namobc = {}
	local blackc = {}
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )  --Ū�X���a��ID
	local set = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 ) --Ū�X�˸m��ID
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local XG = {-8044.5 , -8023.6 , -7548.1,703.9}
	local XN = {-7904, -7938.9,-7474.8,842.2}
	local YG = {924.9, 984.1 , 1065.7,-257.2 }
	local YN = {927.4, 983.5, 1066.9 , -240}
	local ZG = {-19736.5, -20316.5, -20335.5,-1056.3}
	local ZN = {-19804.8, -20195.6, -20178.2,-1080}
	local DG = {30, 302.1, 295.4,12.1}
	local DN = {178.6, 136.4, 118.2,178.3}
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
	local Y1 = math.abs(Y - 940)
	local Y2 = math.abs(Y - 990)
	local Y3 = math.abs(Y - 1070)
	local YTEST = math.abs(Y + 256)
	local nakui_c
	local gillc
	--say(set , "PPP")
	if Y1 <= 20 then --�b�Ĥ@�ϨϥΪ��ɭ�
		nakui_c = CreateObj ( nakui , XN[1] , YN[1]+1 , ZN[1]  , DN[1] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --�s��Ǫ��e��1�̭�
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[1]+(5*i) , YN[1]+40 , ZN[1]-(3*i)  , DN[1] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[1] , YG[1] , ZG[1]  , DG[1] , 1) 
		Dy_Z23_06SET(gillc)	
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --���O*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --�s��Ǫ��e��1�̭�
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[1]-(5*i) , YG[1] , ZG[1]+(5*i)  , DG[1] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --���O*	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")
	elseif Y2 <= 20 then --�ĤG��
		nakui_c = CreateObj ( nakui , XN[2] , YN[2]+1 , ZN[2]  , DN[2] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --�s��Ǫ��e��1�̭�
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[2]+(5*i) , YN[2]+40 , ZN[2]-(5*i)  , DN[2] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[2] , YG[2] , ZG[2]  , DG[2] , 1) 
		Dy_Z23_06SET(gillc)
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --���O*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --�s��Ǫ��e��1�̭�
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[2]-(5*i) , YG[2] , ZG[2]+(5*i)  , DG[2] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --���O*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")
	elseif Y3 <= 30 then --�ĤT��
		nakui_c = CreateObj ( nakui , XN[3] , YN[3]+1 , ZN[3]  , DN[3] , 1) 
		Dy_Z23_06SET(nakui_c)	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --�s��Ǫ��e��1�̭�
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[3]+(5*i) , YN[3]+40 , ZN[3]-(5*i)  , DN[3] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[3] , YG[3] , ZG[3]  , DG[3] , 1) 
		Dy_Z23_06SET(gillc)	
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --���O*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --�s��Ǫ��e��1�̭�
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[3]-(5*i) , YG[3] , ZG[3]+(5*i)  , DG[3] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --���O*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		say (gillc , "[SC_Z23_Q425215_06]")	
		
	elseif YTEST <= 30 then --���հϴ���
		say (OwnerID() , "111")
		nakui_c = CreateObj ( nakui , XN[4] , YN[4]+40 , ZN[4]  , DN[4] , 1) 
		Dy_Z23_06SET(nakui_c)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , nakui_c) --�s��Ǫ��e��1�̭�
		WriteRoleValue( nakui_c , EM_RoleValue_Register1 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			namobc[i] =  CreateObj ( namob , XN[4]+(5*i) , YN[4]+40 , ZN[4]-(5*i)  , DN[4] , 1) 
			Dy_Z23_06SET(namobc[i])	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1+i , namobc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( namobc[i] , EM_RoleValue_Register1+i , OwnerID())
		end
		
		say ( nakui_c , "[SC_Z23_Q425215_04]")
		sleep (20)
		say ( nakui_c , "[SC_Z23_Q425215_05]")	
		sleep (30)

		gillc = CreateObj ( gill , XG[4] , YG[4] , ZG[4]  , DG[4] , 1) 
		Dy_Z23_06SET(gillc)
		SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --���O*
		WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , gillc) --�s��Ǫ��e��1�̭�
		WriteRoleValue( gillc , EM_RoleValue_Register10 , OwnerID())	
		
		for i = 1 , 3 ,1 do
			blackc[i] =  CreateObj ( black , XG[4]-(5*i) , YG[4] , ZG[4]+(5*i)  , DG[4] , 1) 
			Dy_Z23_06SET(blackc[i])
			SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --���O*
			WriteRoleValue( OwnerID() , EM_RoleValue_Register10-i , blackc[i]) --�s��Ǫ��e��1�̭�
			WriteRoleValue( blackc[i] , EM_RoleValue_Register10-i , OwnerID())
		end	
		
		say (gillc , "[SC_Z23_Q425215_06]")		
	end
	
	--�}�l����
	SetAttack( gillc , nakui_c )
--	debugmsg(0,0,"nakui_c is"..nakui_c)
	SetAttack( nakui_c , gillc )
	SetAttack( blackc[1] , namobc[1] )
	SetAttack( namobc[1] , blackc[1] )
	SetAttack( blackc[2] , namobc[2] )
	SetAttack( namobc[2] , blackc[2] )	
	SetAttack( blackc[3] , namobc[3] )
	SetAttack( namobc[3] , blackc[3] )
	--�NNPC���ĤW���O
	SetModeEx( gillc  ,EM_SetModeType_Gravity , true ) --���O*
	SetModeEx( nakui_c  ,EM_SetModeType_Gravity , true ) --���O*
	for i = 1 , 3 , 1 do
		SetModeEx( namobc[i]  ,EM_SetModeType_Gravity , true ) --���O*
		SetModeEx( blackc[i]  ,EM_SetModeType_Gravity , true ) --���O*
	end
	sleep(20)
	say (gillc , "[SC_Z23_Q425215_00]")
	sleep(20)
	say (nakui_c , "[SC_Z23_Q425215_01]")
	sleep(20)
	DelObj ( namobc[1] )
--	sleep (10)
--	Move( blackc[1], X+1 , Y , Z+1 ) 
	sleep(20)
	say (gillc , "[SC_Z23_Q425215_02]")
 
	say (blackc[1] , "[SC_Z23_Q425215_03]" )
	
	--�ǰe���a�^��a
	sleep (30)
	if CheckID( player ) == true then
		ScriptMessage( player , player , 1 , "[SC_Z23_Q425215_07]" , 2 )  --
		CancelBuff( player , 622579 )
		--SetPos( player, -9409.3 , 932.6, -18310.9 , 121.5 )
		--SetPos( player, 953 , -257.2, -967.7 , 137 )
		SetPosByFlag( player, 781168 , 1 ) 
	else
		
	end

	sleep(20)
	DelObj ( gillc )
	DelObj ( nakui_c )
	DelObj ( blackc[1])
	for i = 2 , 3 , 1 do
		DelObj ( namobc[i] ) 
		DelObj ( blackc[i] )
	end		
	CancelBuff_NoEvent( set, 622577 )  --�R���˸m���U�NBuff
	DelObj ( OwnerID() )
end
function Dy_Z23_06SET(NPC06) --�]�wNPC
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	SetModeEx( NPC06  ,EM_SetModeType_Show, true )--���*
	SetModeEx( NPC06  ,EM_SetModeType_Searchenemy , false ) --����*
	SetModeEx( NPC06  ,EM_SetModeType_Save , false ) --�x�s*
	SetModeEx( NPC06  ,EM_SetModeType_Revive , false ) --����*
	SetModeEx( NPC06  ,EM_SetModeType_Obstruct , false )--����*
	SetModeEx( NPC06  ,EM_SetModeType_Strikback , true ) --����*
	SetModeEx( NPC06  ,EM_SetModeType_Fight , true ) --���*
	SetModeEx( NPC06  ,EM_SetModeType_Gravity , false ) --���O*	
	SetModeEx( NPC06  ,EM_SetModeType_Move , true ) --����*
	SetModeEx( NPC06  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
	SetModeEx( NPC06  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
	SetModeEx( NPC06  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
	AddToPartition( NPC06, RoomID)	
end
function Dy_Z23_06END() --�N��^��a��t
	Lua_ZonePE_3th_GetScore(150)
	DelBodyItem( OwnerID() , 547007, 1 ) --�R���i�H����S���˪�����J�����n���~2
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID ) 
	local gill06 = CreateObjByFlag( 120857, 781142 , 4 , 1 )--��t�Ϊ��N���J��
	AddBuff( TargetID() , 622578 , 0 , 15) --�i�H�ݨ��N�୸�^��a
	GiveBodyItem( TargetID(), 546687, 1 ) --�����ݱo��N�઺���n���~
	GiveBodyItem( TargetID(), 546520, 1 )
	sleep(10)
	SetModeEx( gill06  ,EM_SetModeType_Show, true )--���*
	SetModeEx( gill06  ,EM_SetModeType_Searchenemy , false ) --����*
	SetModeEx( gill06  ,EM_SetModeType_Save , false ) --�x�s*
	SetModeEx( gill06 ,EM_SetModeType_Revive , false ) --����*
	SetModeEx( gill06  ,EM_SetModeType_Obstruct , false )--����*
	SetModeEx( gill06  ,EM_SetModeType_Strikback , false ) --����*
	SetModeEx( gill06  ,EM_SetModeType_Fight , false ) --���*
	SetModeEx( gill06  ,EM_SetModeType_Gravity , true ) --���O*	
	SetModeEx( gill06  ,EM_SetModeType_Move , true ) --����*
	SetModeEx( gill06  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
	SetModeEx( gill06  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
	SetModeEx( gill06  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��*
	MoveToFlagEnabled( gill06, true ) --�������޼@��
	WriteRoleValue(gill06,EM_RoleValue_IsWalk,0) --�]�w�]�B�ʧ@ --0���]�B 1������
	AddToPartition( gill06, RoomID)	
	LuaFunc_MoveToFlag( gill06, 781142 , 5 ,0 )
	say (gill06 , "[SC_Q425216_00]")
	sleep(20)
	DelObj ( gill06 )
end

--Z23_08 �N��Q���ҫk ��ܼ@��
function Dy_Z23_Gtalk00 () --���ȹ�ܼ@��
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),425217) == true and
	CheckScriptFlag( OwnerID(), 546274 )==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_Q0]","Dy_Z23_Gtalk_00", 0 )
	else
	
	end
end
function Dy_Z23_Gtalk_00 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_00]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_01]","Dy_Z23_Gtalk_01", 0 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_02]","Dy_Z23_Gtalk_N", 0 )
end
function Dy_Z23_Gtalk_01 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_10]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_11]","Dy_Z23_Gtalk_02", 0 )
end
function Dy_Z23_Gtalk_N ()
	CloseSpeak( OwnerID() )
end
function Dy_Z23_Gtalk_02 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_20]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_Q425217_21]","Dy_Z23_Gtalk_03", 0 )
end
function Dy_Z23_Gtalk_03 ()
	SetSpeakDetail( OwnerID(), "[SC_Q425217_30]")
	GiveBodyItem( OwnerID(), 546274, 1 ) --�P�N�������ܷ|�������n���~
end
function Dy_Z23_08show()
	Lua_ZonePE_3th_GetScore(50)
	AddBuff( TargetID() , 622858 , 0 , 18 ) --�i�H�ݨ��h�L�q���ҫk����
	local num=0
	local npc=SearchRangeNPC( OwnerID(), 50 )
	for i=0, table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID) == 106848 then
			num=num+1
		end
	end
	if num==0 then
		local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
		local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
		local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
		local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)
		local show08 = CreateObj ( 106848 , X , Y , Z  , Dir , 1)
		CallPlot( show08, "TempControlNpcSetting_00", show08 )
		AddToPartition( show08, 0 )
		CallPlot( show08, "Dy_Z23_Gshow08", OwnerID(), TargetID() )
	end
end
function Dy_Z23_Gshow08 ( Gill, PlayerID )
	local Controller=OwnerID()----�Ъ��X������
	local Pasofu=0--�Ъ��X����������
	local npc=SearchRangeNPC( Controller, 100 )
	for i=0, table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID) == 120273 then
			Pasofu=npc[i]	
		end
	end
	local x,y,z,dir=DW_Location(Pasofu)
	local NewPasofu=CreateObj( 120998, x, y, z, dir, 1 )
	local NewGill=LuaFunc_CreateObjByObj( 120999, Gill )--���ͺt���ΦN��øm�J����
	local Solider=CreateObjByFlag( 120997, 781147 , 0 , 1 )--���ͺt���Τh�L
	local SetList={NewGill, Solider, NewPasofu}
	for i=1, table.getn(SetList) do--�]�w�t�����Ӹ`�Ѽ�
		MoveToFlagEnabled( SetList[i], true )--�������޼@��
		WriteRoleValue( SetList[i], EM_RoleValue_IsWalk, 1 )--�]�w�]�B�ʧ@(0���]�B/1������)
		SetModeEx( SetList[i], EM_SetModeType_Show, true )--���
		SetModeEx( SetList[i], EM_SetModeType_Gravity , true )--�����O
		SetModeEx( SetList[i], EM_SetModeType_Move, true )--�i����
		SetModeEx( SetList[i], EM_SetModeType_Searchenemy, false )--������
		SetModeEx( SetList[i], EM_SetModeType_Save, false )--���x�s
		SetModeEx( SetList[i], EM_SetModeType_Revive, false )--������
		SetModeEx( SetList[i], EM_SetModeType_Obstruct, false )--������
		SetModeEx( SetList[i], EM_SetModeType_Strikback, false ) --������
		SetModeEx( SetList[i], EM_SetModeType_Fight, false )--���i���
		SetModeEx( SetList[i], EM_SetModeType_ShowRoleHead, false )--�L�Y����
		SetModeEx( SetList[i], EM_SetModeType_HideName, true)--�L�W�����
		SetModeEx( SetList[i], EM_SetModeType_SearchenemyIgnore, true )--���|�Q�j�M
		SetModeEx( SetList[i], EM_SetModeType_Mark, false )--���аO
		SetModeEx( SetList[i], EM_SetModeType_NotShowHPMP, true )--����ܦ��
	end
	AddToPartition( NewPasofu, 0 )--���ܥΩ��������� 
	AddToPartition( Solider, 0 )--�N�t���Τh�L�m�J����
	sleep(5) AdjustFaceDir( Solider, Pasofu, 0)
	sleep(5) DelBodyItem( PlayerID, 546687, 1 )
	sleep(5) LuaFunc_MoveToFlag( Solider, 781147 , 1 , 0 )
	sleep(5) AdjustFaceDir( NewGill, Solider, 0)
	npcsay( Solider, "[SC_Q425217_SHOW1]" )--���i�A�ҫk���p�����A�бz���ܦp������I
	sleep(20) npcsay( NewPasofu, "[SC_Q425217_SHOW2]" )--����I�H���p�p��H�A�ߨ�a�X�����@�L�L�h�I
	sleep(20) npcsay( Solider, "[SC_Q425217_SHOW3]" )--�O�I
	CallPlot( NewGill, "Dy_Z23_Gshow08_2", NewGill, Solider )
	sleep(10) LuaFunc_MoveToFlag( Solider, 781147 , 0 ,0 )
	DelObj( NewPasofu )
	SetDefIdleMotion( Solider, ruFUSION_MIME_RUN_FORWARD )
	sleep(5) DelObj( Solider )
	sleep(5) DelObj( Controller )
end
function Dy_Z23_Gshow08_2( NewGill, Solider )
	sleep(10) SetDefIdleMotion( NewGill, ruFUSION_MIME_JUMP_LOOP )
	npcsay( NewGill, "[SC_Q425217_SHOW4]" )--�����I�ҫk�I�I�ҫk���F�I�I�I�H
	sleep(20) LuaFunc_MoveToFlag( NewGill, 781147 , 0 ,0 )
	DelObj( NewGill )
end
Function Z23_QUEST425215_00()
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1 )
		CallPlot( OwnerID(),"Z23_QUEST425215_01",OwnerID() )
	else return
	end
end
Function Z23_QUEST425215_01()
	local x,y,z,dir=DW_Location(OwnerID())
	local Mrk=CreateObj( 121354, x, y, z, dir, 1 )
	SetModeEx( Mrk, EM_SetModeType_Save, false )--���x�s
	SetModeEx( Mrk, EM_SetModeType_Mark, false )--����ܼаO
	SetModeEx( Mrk, EM_SetModeType_HideName , true )--����ܦW��
	SetModeEx( Mrk, EM_SetModeType_NotShowHPMP, true )--����ܦ�q
	SetModeEx( Mrk, EM_SetModeType_ShowRoleHead, false )--������Y����
	SetModeEx( Mrk, EM_SetModeType_Fight , false )--���i�������
	SetModeEx( Mrk, EM_SetModeType_Searchenemy , false )--������
	SetModeEx( Mrk, EM_SetModeType_Strikback , false )--������
	SetModeEx( Mrk, EM_SetModeType_Gravity, true )--�����O
	MoveToFlagEnabled( Mrk, false )
	AddBuff ( Mrk, 623374, 0, -1 )
	AddToPartition( Mrk, 0 )
	sleep(10) LuaFunc_MoveToFlag( Mrk, 781142, 7, 1 )
	SetDefIdleMotion( Mrk, ruFUSION_MIME_SNEAK_FORWARD )
	NpcSay( Mrk, "[SC_421273_4]" )--�֨��a�A���䦳�H�L�Ө��ޤF�C
	sleep(10) LuaFunc_MoveToFlag( Mrk, 781142, 8, 1 )
	NpcSay( Mrk, "[SC_423462_12]" )--���n���ġI�p�ߤ@�I�I
	sleep(20) DelObj( Mrk )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end

function Z23_425217_flagive()	--���F�@�Ϭݤ����N�઺�H��
	if CheckCompleteQuest(OwnerID(),425215)==true and 
  	 CheckCompleteQuest(OwnerID(),425217)==false and 
   	CheckFlag(OwnerID(),546687)==false then
		SetFlag(OwnerID(),546687,1)
		SetFlag(OwnerID(),546520,1)
	end
	if CheckCompleteQuest( OwnerID(), 425210 )==true then--�ԨƧi��
		SetFlag( OwnerID(), 546507, 0 )
	end
end
