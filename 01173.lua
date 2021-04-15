--�}�����ͽd��
function LuaYuyu_flowerV_matrix2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Array = {111815,111815,111815,111815,111815,111815,111815,0,111815}
	local Davis = Lua_MadeByRectangleX(  Array , 9 , 9 , 9 , 1)  --Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z (���w�}�C���e)

	for i=1 , table.getn(Davis) do	
		AddToPartition( Davis[i] , RoomID )  
		SetModeEx( Davis[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( Davis[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Davis[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Davis[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Davis[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( Davis[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Davis[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Davis[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Davis[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Davis[i]   , EM_SetModeType_Gravity, false )--���O
--		SetModeEx( Davis[i]   , EM_SetModeType_Show , false ) --�����
		AddBuff( Davis[i] ,505762 ,100 ,-1 ); --�����H���
		SetCursorType( Davis[i] , eCursor_Herb ); --����ܦ� ����
		SetPlot( Davis[i]  ,"touch",  "LuaYuyu_flowerV_01" , 10 )   --��

	end

end

--�H�U���R���Ҧ����Ӫ�E
function LuaYuyu_flowerV_00()

	local flower = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111815, 300 , 1)       --��


	for i= 0, table.getn(flower)  do
		if CheckID(flower[i]) == true then
			Delobj(flower[i])
		end
	end

end


--�H�U�����Ӫ����@��
function LuaYuyu_flowerV_01()

	local flowerRED =  CountBodyItem( OwnerID() , 203204 )   --�������ؤl
	local flowerBLUE =  CountBodyItem( OwnerID() , 203205 )  --�Ū����ؤl

	local Waterbattle =  CountBodyItem( OwnerID() , 203646 ) --�˺���

	if flowerRED == 0 and flowerBLUE == 0 then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_38]" , 1  ) --�o�O�]�k�������ӰϡA�ݭn<CP>[203204]</CP>�~��i���س�I
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_38]"  , 0 ) --

	elseif flowerRED > 0 and Waterbattle > 0 then

		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )   
		BeginPlot( TargetID() , "LuaYuyu_flowerV_02" , 0 )  --script��^npc�]

	elseif flowerBLUE > 0 and Waterbattle > 0  then

		WriteRoleValue( TargetID() , EM_RoleValue_PID , 2 )   
		BeginPlot( TargetID() , "LuaYuyu_flowerV_02" , 0 )  --script��^npc�]

	elseif flowerRED > 0 and Waterbattle == 0  then



		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_11]" , 1  ) --�Х��N�e���˺��]�k���i�G�A�i���ءC
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_11]" .. "|r" , 0 ) --

	elseif flowerBLUE > 0 and Waterbattle == 0  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_11]" , 1  ) --�Х��N�e���˺��]�k���i�G�A�i���ءC
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_11]" .. "|r" , 0 ) --

	end

end

function LuaYuyu_flowerV_02()  --TargetID ���a

--Say(OwnerID() , "OwnerID() , 1")--��E
--Say(TargetID() , "TargetID() , 1")--���a

	local flowerKIND = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

	if BeginCastBar( TargetID(), "[SC_112150_YU_03]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
		local CastBarStatus = CheckCastBar( TargetID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( TargetID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( TargetID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then

			BeginPlot( TargetID() , "LuaYuyu_flowerV_New01" , 0 )  --script��^npc�]

		end
	end
end

function LuaYuyu_flowerV_New01()  --script��^npc�]

--Say(OwnerID() , "OwnerID() , 2")--���a
--Say(TargetID() , "TargetID() , 2")--��E

	BeginPlot( TargetID() , "LuaYuyu_flowerV_New02" , 0 )  --script��^npc�]

end

function LuaYuyu_flowerV_New02()  --script��^npc�]

	local flowerKIND = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
--Say(OwnerID() , "OwnerID() , 3")--��E
--Say(TargetID() , "TargetID() , 3")--���a


			SetPlot( OwnerID(),"touch","",0 )
			DelBodyItem( TargetID() , 203646 , 1 )
			if flowerKIND == 1 then
				DelBodyItem( TargetID() , 203204 , 1 )
			elseif flowerKIND == 2 then
				DelBodyItem( TargetID() , 203205 , 1 )
			end
			GiveBodyItem( TargetID() , 203647  , 1 ) --�S�������e��
			sleep(10)

	--�}�l���q   ������ؤl

			local flower = LuaFunc_CreateObjByObj ( 112175 , OwnerID() ) --�]�k�ؤl
			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
			local X = ReadRoleValue( OwnerID() ,EM_RoleValue_X) 
			local Y = ReadRoleValue( OwnerID() ,EM_RoleValue_Y) 
			local Z = ReadRoleValue( OwnerID() ,EM_RoleValue_Z) 	


			SetModeEx( flower  , EM_SetModeType_Strikback, false )--����
			SetModeEx( flower  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( flower , EM_SetModeType_Obstruct, false )--����
			SetModeEx( flower  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( flower   , EM_SetModeType_Move, false )--����
			SetModeEx( flower  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( flower   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( flower , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( flower , EM_SetModeType_Fight , true )--�i�������

			SetModeEx( OwnerID()  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��

			WriteRoleValue( OwnerID() , EM_RoleValue_PID , flowerKIND )   

			AddToPartition( flower, RoomID) 
			AddBuff( flower ,505762 ,100 ,-1 ); --�����H���

			WriteRoleValue( flower , EM_RoleValue_PID , OwnerID() )   
			WriteRoleValue( flower , EM_RoleValue_Register , TargetID() )   

			SetPlot( flower  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --�ᦺ����--**
			sleep(10)
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_12]" , C_SYSTEM  ) --�A�N�]�k�����ؤl��ئܮ���ϡA�åJ�Ӫ��Q�x�]�k���i�G�C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_12]" , 0 ) --
			sleep(10)
			CastSpelllv( flower , flower , 492459 , 1)	--���
			sleep(10)
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_13]" , C_SYSTEM  ) --�]�k�����ؤl�w�g�o�ޡC
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_13]" , 0 ) --

			SetPlot( flower  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --��--**�i�ɥR����
			sleep(50)
			BeginPlot( flower , "LuaYuyu_flowerV_05" , 0 )  --�}�l����buff���A--**

			sleep(30)
			
			local flowerHP =  ReadRoleValue( flower , EM_RoleValue_HP  )  

	--�Ĥ@���q   �����ḭ

			local flower2 = LuaFunc_CreateObjByObj ( 112176 , OwnerID() ) --�����ḭ
			local flowerX2 = LuaFunc_CreateObjByObj ( 112176 , OwnerID() ) --�����ḭ
			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 	


			SetModeEx( flower2  , EM_SetModeType_Strikback, false )--����
			SetModeEx( flower2  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( flower2 , EM_SetModeType_Obstruct, false )--����
			SetModeEx( flower2  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( flower2   , EM_SetModeType_Move, false )--����
			SetModeEx( flower2  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( flower2   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( flower2 , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( flower2 , EM_SetModeType_Fight , true )--�i�������

			Hide(flower2)
			Show(  flower2 ,RoomID)

			SetModeEx( flowerX2  , EM_SetModeType_Strikback, false )--����
			SetModeEx( flowerX2  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( flowerX2 , EM_SetModeType_Obstruct, false )--����
			SetModeEx( flowerX2  , EM_SetModeType_Mark, true )--�аO
			SetModeEx( flowerX2   , EM_SetModeType_Move, false )--����
			SetModeEx( flowerX2  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( flowerX2   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( flowerX2 , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( flowerX2 , EM_SetModeType_Fight , false )--�i�������
		--	SetModeEx( flowerX2   , EM_SetModeType_Show , false ) --�����

			Hide(flowerX2)
			Show(  flowerX2 ,RoomID)

			WriteRoleValue( flower2 , EM_RoleValue_HP , flowerHP )   
			AddToPartition( flower2, RoomID) 
			AddBuff( flower2 ,505762 ,100 ,-1 ); --�����H���
			AddToPartition( flowerX2, RoomID) 
			WriteRoleValue( flowerX2 , EM_RoleValue_PID , flower2 )   
			AddBuff( flowerX2 ,505762 ,100 ,-1 ); --�����H���
			SetModeEx( OwnerID()  , EM_SetModeType_Show , false ) --�����

			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_19]" , C_SYSTEM  ) --�]�k�����ؤl�w�}�K�����C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_19]" , 0 ) --
			AddBuff( flower2 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			AddBuff( flower2 ,502706 ,1 ,-1 ); --���i�ɦ�
			sleep(10)


			WriteRoleValue( flower2 , EM_RoleValue_HP , flowerHP )   
			WriteRoleValue( flower2 , EM_RoleValue_PID , OwnerID() )   --��E
			WriteRoleValue( flowerX2 , EM_RoleValue_Register , TargetID() )   --���a
			WriteRoleValue( flower2 , EM_RoleValue_Register+1 , flowerX2 )   --�i�媺��

			if CheckBuff( flower , 502697 ) == true then    
				AddBuff( flowerX2 ,502697 ,1 ,-1 ); --���buff               
				Delobj( flower )          
			else
				Delobj( flower )     
			end  
			sleep(10)   
--			WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 )   --���q�P�_�ͤ�����--*

			SetPlot( flower2  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --�ᦺ����--**
			SetPlot( flowerX2  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --��--**�i�ɥR����
			sleep(10)
			BeginPlot( flowerX2 , "LuaYuyu_flowerV_05" , 0 )  --�}�l����buff���A--**
			sleep(30)
--			BeginPlot( flower2 , "LuaYuyu_Mflower_01" , 0 )  --�}�l���--**

	

			--�Ǫ���
						
						X1 = X - 6
						Z1 = Z + 13

						local Ma = CreateObj( 101557 , X1 , Y , Z1 , 0 , 1 ) 

						AdjustFaceDir(Ma, OwnerID() , 0 ) --���V

						AddToPartition( Ma, 0) 

						sleep(10)
						SetAttack( Ma , flower2  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --�`�N�I�`�Υ��b�٭��]�k�����I
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , Ma )   --��--*


			sleep(300)

			local flowerHP =  ReadRoleValue( flower2 , EM_RoleValue_HP  )  
			sleep(10)
	

	--�ĤG���q   ������c
			if CheckID( flower2 ) == true then
				local flower3 = LuaFunc_CreateObjByObj ( 112178 , OwnerID() ) --������c
				local flowerX3 = LuaFunc_CreateObjByObj ( 112178 , OwnerID() ) --������c
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 	

				SetModeEx( flower3  , EM_SetModeType_Strikback, false )--����
				SetModeEx( flower3  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( flower3 , EM_SetModeType_Obstruct, false )--����
				SetModeEx( flower3  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( flower3   , EM_SetModeType_Move, false )--����
				SetModeEx( flower3  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( flower3   , EM_SetModeType_HideName, false )--�W��
				SetModeEx( flower3 , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( flower3 , EM_SetModeType_Fight , true )--�i�������

				Hide(flower3)
				Show(  flower3 ,RoomID)
				WriteRoleValue( flower3 , EM_RoleValue_HP , flowerHP )   


				SetModeEx( flowerX3  , EM_SetModeType_Strikback, false )--����
				SetModeEx( flowerX3  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( flowerX3 , EM_SetModeType_Obstruct, false )--����
				SetModeEx( flowerX3  , EM_SetModeType_Mark, true )--�аO
				SetModeEx( flowerX3   , EM_SetModeType_Move, false )--����
				SetModeEx( flowerX3  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( flowerX3   , EM_SetModeType_HideName, false )--�W��
				SetModeEx( flowerX3 , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( flowerX3 , EM_SetModeType_Fight , true )--�i�������
		--		SetModeEx( flowerX3   , EM_SetModeType_Show , false ) --�����

				Hide(flowerX3)
				Show(  flowerX3 ,RoomID)



				if CheckBuff( flowerX2 , 502697 ) == true then    
					AddBuff( flowerX3 ,502697 ,1 ,-1 ); --���buff    
					sleep(10)


					if CheckBuff( flower2 , 502705 ) == true then     --�\��
						AddBuff( flower3 ,502705 ,1 ,-1 ); --�\��buff    			          
						Delobj( flower2 )    
						Delobj( flowerX2 )    

					else
						Delobj( flower2 ) 
						Delobj( flowerX2 )    

					end
	  
				else

					Delobj( flower2 )  
					Delobj( flowerX2 )      

				end    
				sleep(10)   
				AddToPartition( flower3, RoomID) 
				AddToPartition( flowerX3, RoomID) 	
				WriteRoleValue( flowerX3 , EM_RoleValue_PID , flower3 )   
				AddBuff( flower3 ,505762 ,100 ,-1 ); --�����H���
				AddBuff( flowerX3 ,505762 ,100 ,-1 ); --�����H���

				if CheckID( Ma ) == true then
					SetAttack( Ma , flower3  )
				end

				sleep(10)
				AddBuff( flower3 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
				AddBuff( flower3 ,502706 ,1 ,-1 ); --���i�ɦ�
				ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_20]" , C_SYSTEM  ) --�]�k�����w�t�c�ݩ�C
				ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_20]" , 0 ) --
				sleep(50)
				WriteRoleValue( flower3 , EM_RoleValue_HP , flowerHP )   
				WriteRoleValue( flower3 , EM_RoleValue_PID , OwnerID() )   --��E
				WriteRoleValue( flowerX3 , EM_RoleValue_Register , TargetID() )   --���a
				WriteRoleValue( flower3 , EM_RoleValue_Register+1 , flowerX3 )   --�i�媺��

				SetPlot( flower3  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --�ᦺ����--**
				SetPlot( flowerX3  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --��--**�i�ɥR����
				sleep(50)
				BeginPlot( flowerX3 , "LuaYuyu_flowerV_05" , 0 )  --�}�l����buff���A--**
				sleep(30)

				--�Ǫ���2

						X1 = X - 6
						X2 = X - 1
						Z1 = Z + 13
						Z2 = Z - 18

						local Mb = CreateObj( 101559 , X1 , Y , Z1 , 0 , 1 ) 
						local Mc = CreateObj( 101559 , X2 , Y , Z2 , 0 , 1 ) 

						AdjustFaceDir(Mb, OwnerID() , 0 ) --���V
						AdjustFaceDir(Mc, OwnerID() , 0 ) --���V

						AddToPartition( Mb, 0) 
						AddToPartition( Mc, 0) 

						sleep(10)



						SetAttack( Mb , flower3  )
						SetAttack( Mc , flower3  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --�`�N�I�`�Υ��b�٭��]�k�����I
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+4 , Mb )   --���q�P�_�ͤ�����--*
						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+5 , Mc )   --���q�P�_�ͤ�����--*



				sleep(300)

				--�Ǫ���3
						X1 = X - 6
						X2 = X - 6
						Z1 = Z + 13
						Z2 = Z - 16

						local Md = CreateObj( 101557 , X1 , Y , Z1 , 0 , 1 ) 
						local Me = CreateObj( 101558 , X2 , Y , Z2 , 0 , 1 ) 

						AdjustFaceDir(Md, OwnerID() , 0 ) --���V
						AdjustFaceDir(Me, OwnerID() , 0 ) --���V

						AddToPartition( Md, 0) 
						AddToPartition( Me, 0) 
						sleep(10)

						if CheckID( Ma ) == true then
							SetAttack( Ma , flower3  )
						end
						if CheckID( Mb ) == true then
							SetAttack( Mb , flower3  )
						end
						if CheckID( Mc ) == true then
							SetAttack( Mc , flower3  )
						end


						SetAttack( Md , flower3  )
						SetAttack( Me , flower3  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --�`�N�I�`�Υ��b�٭��]�k�����I
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , Md )   --���q�P�_�ͤ�����--*
						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+7 , Me )   --���q�P�_�ͤ�����--*



				sleep(300)
				local flowerHP =  ReadRoleValue( flower3 , EM_RoleValue_HP  )  
				sleep(10)


	--�ĤT���q   �}��

				local flowerKIND = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)  --����t�C = 1  �Ū�t�C = 2   
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
				local MaxHP =  ReadRoleValue( flower3 , EM_RoleValue_MaxHP  )  
				local Hprate =  flowerHP/MaxHP
				local flowerwhat = 0


				local Waterbattle =  CountBodyItem( TargetID() , 203646 ) --�˺���
				local battle =  CountBodyItem( TargetID() , 203647 ) --�Ų~

				if  Waterbattle > 0 then  --�S�����������A
					DelBodyItem( TargetID() , 203646 , 1 )
				elseif battle > 0 then
					DelBodyItem( TargetID() , 203647 , 1 )
				end

				if CheckID( flower3 ) == true then

					if Hprate >= 0.9 then
						if flowerKIND == 1 then
							flowerwhat = 112179 --�ᯫ�X�ӤF
						elseif flowerKIND == 2 then
							flowerwhat = 112180 --�ᯫ�X�ӤF
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_21]" , C_SYSTEM  ) --�ѩ�z�Ӥߪ����@�ϱo�]�k�������ꪺ���A��P�l�P����z���Τ߱N�����ؤ����z�I
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_21]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 5 ) 

					elseif Hprate > 0.7 and Hprate < 0.9 then
						if flowerKIND == 1 then
							flowerwhat = 112181 
						elseif flowerKIND == 2 then
							flowerwhat = 112182 
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_22]" , C_SYSTEM  )  --�ѩ�z�Ӥߪ����@�ϱo�]�k�������ꪺ���A�N�]�k�������R���i�ܵ��A�ҷR���H�a�I
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_22]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 3 ) 

					elseif Hprate > 0.4 and Hprate < 0.7 then

						local G = 100
						local YY = Rand( G )   
						if YY >= 67 then
							if flowerKIND == 1 then
								flowerwhat = 112183 
							elseif flowerKIND == 2 then
								flowerwhat = 112172
							end
						elseif YY >= 34 and YY < 67 then
							if flowerKIND == 1 then
								flowerwhat = 112184
							elseif flowerKIND == 2 then
								flowerwhat = 112173
							end
						else
							if flowerKIND == 1 then
								flowerwhat = 112185
							elseif flowerKIND == 2 then
								flowerwhat = 112174
							end
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_22]" , C_SYSTEM  )  --�ѩ�z�Ӥߪ����@�ϱo�]�k�������ꪺ���A�N�]�k�������R���i�ܵ��A�ҷR���H�a�I
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_22]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 2 ) 

					else
						if flowerKIND == 1 then
							flowerwhat = 112186
						elseif flowerKIND == 2 then
							flowerwhat = 112171
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_23]" , C_SYSTEM  )  --�]�k�������M����R�ݡA�̵M���ꪺ���A�N�]�k�������R���i�ܵ��A�ҷR���H�a�I
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_23]" , 0 ) --


						GiveBodyItem( TargetID() , 203648  , 1 ) 
					end




					local flower4 = LuaFunc_CreateObjByObj ( flowerwhat , OwnerID() ) --�����ḭ
					local FG = LuaFunc_CreateObjByObj ( 101275 , OwnerID() ) --�ᯫ	
				
					if flowerwhat == 112179 or flowerwhat == 112180 then

						SetFightMode(  FG , 0, 0, 0, 0 )
						AddToPartition( FG, RoomID) 
					--	CastSpelllv( TargetID() , FG , 492469 , 0) --�ᯫ������
						CastSpelllv( FG , TargetID() , 492469 , 0) --�ᯫ������

					else
						Delobj( FG )     
					end
				
					SetModeEx( flower4  , EM_SetModeType_Strikback, false )--����
					SetModeEx( flower4  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( flower4 , EM_SetModeType_Obstruct, false )--����
					SetModeEx( flower4  , EM_SetModeType_Mark, true )--�аO
					SetModeEx( flower4   , EM_SetModeType_Move, false )--����
					SetModeEx( flower4  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( flower4   , EM_SetModeType_HideName, false )--�W��
					SetModeEx( flower4 , EM_SetModeType_ShowRoleHead, true )--�Y����
					SetModeEx( flower4 , EM_SetModeType_Fight , true )--�i�������
					sleep(10)
					Hide(flower4)
					Show(  flower4 ,RoomID)
					WriteRoleValue( flower4 , EM_RoleValue_HP , flowerHP )   


					Delobj( flower3 )     
					Delobj( flowerX3 )     


					AddToPartition( flower4, RoomID) 
					AddBuff( flower4 ,505762 ,100 ,-1 ); --�����H���
					sleep(10)


					AddBuff( flower4 ,502706 ,1 ,-1 ); --���i�ɦ�
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , flower4 )   --���q�᪺id-* 

			
					if CheckID( Ma ) == true then
						Delobj( Ma)
					end
					if CheckID( Mb ) == true then
						Delobj( Mb)
					end
					if CheckID( Mc ) == true then
						Delobj( Mc)
					end
					if CheckID( Md ) == true then
						Delobj( Md)
					end
					if CheckID( Me ) == true then
						Delobj( Me)
					end


					AddRoleValue( TargetID() , EM_LuaValueFlag_UseItem1 , 1 )   --�O���ϥΦ���
					AddRoleValue( TargetID() , EM_LuaValueFlag_UseItem2 , 1 )   
		
					SetPlot( flower4 ,"touch","",0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 4 )   --���q�P�_�ͤ�����--*
					sleep(10)
					--BeginPlot( flower4 , "LuaYuyu_Mflower_01" , 0 )  --�}�l���--**


					AddBuff( flower4 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
					WriteRoleValue( flower4 , EM_RoleValue_HP , flowerHP )   
					WriteRoleValue( flower4 , EM_RoleValue_PID , OwnerID() )   --��E
					WriteRoleValue( flower4 , EM_RoleValue_Register , TargetID() )   --���a


					sleep(600)

					if CheckID(FG) == true then
						Delobj( FG )     
					end

					sleep(4800)

					BeginPlot( flower4 , "LuaYuyu_flowerV_07" , 0 )  --���s�}�l

				end		
			end
end


function LuaYuyu_flowerV_03()   --���aOwnerID

	local flower = ReadRoleValue( TargetID() , EM_RoleValue_PID )  --���Ȫ�
	local Waterbattle =  CountBodyItem( OwnerID() , 203646 ) --�˺���


	if  Waterbattle > 0 and CheckBuff( TargetID() , 502697 ) == false then  --�S�����������A
		DelBodyItem( OwnerID() , 203646 , 1 )
		GiveBodyItem( OwnerID() , 203647  , 1 ) 

		AddBuff( TargetID() ,502697 ,1 ,-1 ); --���buff    
		AddBuff( flower ,502697 ,1 ,-1 ); --���buff    

	elseif Waterbattle == 0  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_14]" , 1  ) --�Х��N�e���˺��]�k���i�G�A�i����@�C
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_14]" .. "|r" , 0 ) --


	elseif CheckBuff( TargetID() , 502697 ) == true  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_15]" , C_SYSTEM  ) --�ثe���������C
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_15]" , 0 ) --

	end

end




function LuaYuyu_flowerV_05()  --�\��  �i�媺��OwnerID

	local flower = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --���Ȫ�
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )  --���a

	while true do
	sleep(10)

		if CheckBuff( flower , 502705 ) == true and CheckBuff( OwnerID() , 502697 ) == true then     --��s��buff

			CancelBuff( flower , 502705 )

		end

		if CheckBuff( OwnerID() , 502697 ) == false then     --������buff

			ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_16]" , 1  ) --�Ъ`�N�������ɥR�C
			ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_16]" .. "|r" , 0 ) --
			sleep(100)

			if CheckBuff( OwnerID() , 502697 ) == false then     --������buff		
				ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_17]" , 1  ) --�]�k�Ӫ��}�l�\��A�Ъ`�N�ɥR�����C
				ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_17]" .. "|r" , 0 ) --

				AddBuff( flower ,502705 ,1 ,-1 ); --��s��buff        
	  
			end
		

		end



	end
end


function LuaYuyu_flowerV_06() --�ᦺ�\��

		local flower = LuaFunc_CreateObjByObj ( 112177 , OwnerID() ) --�\�䪺��
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local land = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  --��E
		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )  --���a	
		local flowerX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )  --�i�媺��	
		SetFightMode(  flower , 0, 0, 0, 0 )

		SetModeEx( flower  , EM_SetModeType_Strikback, false )--����
		SetModeEx( flower  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( flower , EM_SetModeType_Obstruct, false )--����
		SetModeEx( flower  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( flower   , EM_SetModeType_Move, false )--����
		SetModeEx( flower  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( flower   , EM_SetModeType_HideName, false )--�W��
		SetModeEx( flower , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( flower , EM_SetModeType_Fight , false )--�i�������


		Hide(flower)
		Show(  flower ,RoomID)

		AddToPartition( flower, RoomID) 
		AddBuff( flower ,505762 ,100 ,-1 ); --�����H���
		WriteRoleValue( land , EM_RoleValue_Register+1 , 4 )   --���q�P�_�ͤ�����--*


--���Ǫ�
			local Ma = ReadRoleValue( land , EM_RoleValue_Register+3 )  
			local Mb = ReadRoleValue( land , EM_RoleValue_Register+4 )  
			local Mc = ReadRoleValue( land , EM_RoleValue_Register+5 ) 
			local Md = ReadRoleValue( land , EM_RoleValue_Register+6 ) 
			local Me = ReadRoleValue( land , EM_RoleValue_Register+7 )  

			if CheckID( Ma ) == true then
				Delobj( Ma)
			end
			if CheckID( Mb ) == true then
				Delobj( Mb)
			end
			if CheckID( Mc ) == true then
				Delobj( Mc)
			end
			if CheckID( Md )  == true then
				Delobj( Md)
			end
			if CheckID( Me )  == true then
				Delobj( Me)
			end

		ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_18]" , 1  ) --�]�k�Ӫ��w�g�\��C
		ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_18]" .. "|r" , 0 ) --


		WriteRoleValue( flower , EM_RoleValue_PID , land )   
		WriteRoleValue( flower , EM_RoleValue_Register , PlayerID )   

		BeginPlot( flower , "LuaYuyu_flowerV_07" , 0 )  --script��^npc�]
		Delobj( flowerX )
		Delobj( OwnerID() )

end

function LuaYuyu_flowerV_07() --�ᦺ����
		sleep(30)
		local land = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

		SetModeEx( land  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( land   , EM_SetModeType_HideName, false )--�W��
		SetModeEx( land   , EM_SetModeType_Show , true ) --�����

		WriteRoleValue( land , EM_RoleValue_Register+1 , 4 )   --���q�P�_�ͤ�����--*

		SetCursorType( land , eCursor_Herb ); --����ܦ� ����
		SetPlot( land  ,"touch",  "LuaYuyu_flowerV_01" , 10 )   --��
		Delobj( OwnerID() )

end