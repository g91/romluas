--��flag��script

--�R�B���l x8
function Lua_mika_losttreasure_desborn() --�R�B���l
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local des={}
	for i = 0,7 do  --8��
		des[i] = CreateObjByFlag(113616,780512, i ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		SetModeEx( des[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( des[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( des[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( des[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( des[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( des[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( des[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( des[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( des[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( des[i],RoomID )	--�����󲣥�
		SetPlot( des[i]  ,"touch",  "Lua_mika_losttreasuredes02" , 20 )   
	end
end
----------------------------------------------------------------------------------
--�۪� x5
function Lua_mika_losttreasure_stoneborn() --�۪�
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local stone={}
	for i = 0,4 do  --5��
		stone[i] = CreateObjByFlag(114080,780513, i ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		SetModeEx( stone[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( stone[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( stone[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( stone[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( stone[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( stone[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( stone[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( stone[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( stone[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( stone[i],RoomID )	--�����󲣥�
		SetPlot( stone[i]  ,"touch",  "Lua_mika_losttreasurebox_08" , 20 )   
	end
end
----------------------------------------------------------------------------------
--�¬}���� x12
function Lua_mika_losttreasure_hallborn() --�¬}����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local black={}
	for i = 0,11 do  --12�Ӭ}
		black[i] = CreateObjByFlag(114081,780311, i ,1) --�ϥκX�l���ͨߤl npc �X�l�s�� �ƶq 
		SetModeEx( black[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( black[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( black[i]    , EM_SetModeType_Obstruct, true )--����
		SetModeEx( black[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( black[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( black[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( black[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( black[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( black[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( black[i],RoomID )	--�����󲣥�
		SetPlot( black[i]  ,"touch",  "lua_mika_losttreasure_dark2" , 50 )   
	end
end

----------------------------------------------------------------------------------
--�b����x���� x8
function Lua_mika_losttreasure_cureborn() --�b����x�ͦ� x8
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local cure={}
	for i = 0,7 do  --8����x
		cure[i] = CreateObjByFlag(114079,780515, i ,1) --�ϥκX�l���ͨߤl npc �X�l�s�� �ƶq 
		SetModeEx( cure[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( cure[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( cure[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( cure[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( cure[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( cure[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( cure[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( cure[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( cure[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( cure[i],RoomID )	--�����󲣥�
		SetPlot( cure[i]  ,"touch",  "lua_mika_losttreasurecure02" , 20 )   
	end
end
----------------------------------------------------------------------------------
--�B�V��x1
function Lua_mika_losttreasure_iceborn1()  --��
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=50  then  
		ice0 = CreateObjByFlag(113614,780489, 0 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice0    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice0    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice0    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice0    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice0    , EM_SetModeType_Move, false )--����
		SetModeEx( ice0    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice0    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice0 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice0 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice0 ,RoomID )	--�����󲣥�
		SetPlot( ice0, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <=100  then  
		ice1 = CreateObjByFlag(113614, 780489, 1 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice1    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice1    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice1    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice1    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice1    , EM_SetModeType_Move, false )--����
		SetModeEx( ice1    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice1    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice1 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice1 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice1 ,RoomID )	--�����󲣥�
		SetPlot( ice1, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------
--�B�V��x2
function Lua_mika_losttreasure_iceborn2()  --�k
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=50  then  
		ice2 = CreateObjByFlag(114117,780489, 2 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice2    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice2    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice2    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice2    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice2    , EM_SetModeType_Move, false )--����
		SetModeEx( ice2    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice2    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice2 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice2 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice2 ,RoomID )	--�����󲣥�
		SetPlot( ice2, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <=100  then  
		ice3 = CreateObjByFlag(114117,780489, 3 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice3    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice3    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice3    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice3    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice3    , EM_SetModeType_Move, false )--����
		SetModeEx( ice3    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice3    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice3 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice3 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice3 ,RoomID )	--�����󲣥�
		SetPlot( ice3, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------
--�B�V��x3
function Lua_mika_losttreasure_iceborn3()  --��
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local P = 100
	local X = Rand( P )    
--	Say(TargetID(), X)
	if X >= 0 and X <=30  then  --30
		ice4 = CreateObjByFlag(114118,780489, 4 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice4    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice4    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice4    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice4    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice4    , EM_SetModeType_Move, false )--����
		SetModeEx( ice4    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice4 , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice4 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice4 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice4 ,RoomID )	--�����󲣥�
		SetPlot( ice4, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 31 and X <= 50  then  --20
		ice5 = CreateObjByFlag(114118,780489, 5 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice5    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice5    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice5    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice5    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice5    , EM_SetModeType_Move, false )--����
		SetModeEx( ice5    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice5    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice5 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice5 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice5 ,RoomID )	--�����󲣥�
		SetPlot( ice5, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 51 and X <= 75  then  --25
		ice6 = CreateObjByFlag(114118,780489, 6 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice6    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice6    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice6    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice6    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice6    , EM_SetModeType_Move, false )--����
		SetModeEx( ice6    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice6    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice6 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice6 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice6 ,RoomID )	--�����󲣥�
		SetPlot( ice6, "touch", "Lua_mika_losttreasure_blue2", 20 );
	elseif  X >= 76 and X <= 100  then  --25
		ice7 = CreateObjByFlag(114118,780489, 7 ,1) --�ϥκX�l����npc �X�l�s�� �ƶq 
		SetModeEx( ice7    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ice7    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ice7    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ice7    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ice7    , EM_SetModeType_Move, false )--����
		SetModeEx( ice7    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ice7    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ice7 , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ice7 , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( ice7 ,RoomID )	--�����󲣥�
		SetPlot( ice7, "touch", "Lua_mika_losttreasure_blue2", 20 );
	end
end
----------------------------------------------------------------------------------

function Lua_MadeRectangleByXYZ_noyell(OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
		local RoomID = ReadRoleValue(TargetID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
		local WnmX = (Wnm-1)/2
		DebugMsg( 0, RoomID ,"WnmX = "..WnmX)
		for i = 1 , Lnm do
			dis = dis + Ldis
			DebugMsg( 0, RoomID ,"dis = "..dis.." i = "..i)
			hindrance[CC] = CreateObj( OrgID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
			local NewX = OldX- dis*math.cos(Cal)
			local NewY = OldY
			local NewZ = OldZ +dis*math.sin(Cal)
			CC = CC + 1
			DebugMsg( 0, RoomID ,"CC = "..CC)
			local WdisX = 0
			for j = 1, WnmX do
				WdisX = WdisX + Wdis
				DebugMsg( 0, RoomID ,"Wdis = "..Wdis.." j = "..j)
				hindrance[CC] = CreateObj( OrgID, NewX+WdisX*math.sin(Cal) ,NewY ,NewZ +WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
				hindrance[CC] = CreateObj( OrgID, NewX-WdisX*math.sin(Cal) ,NewY ,NewZ -WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
			end
		end

		for i=1,table.getn(hindrance) do
			AddToPartition( hindrance[i] ,  RoomID  )
		--	Yell(hindrance[i] ,"hindrance = "..hindrance[i].." i = "..i,5)
		end
		return hindrance
end

function Lua_mika_losttreasure_boxtest1()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local norbox = Lua_MadeRectangleByXYZ_noyell(113617 , 3860 , 49 , 3839 , 181 , 13 , 20 , 5 , 1) -- npcid , x, y ,z , dir , ��m, ��m,  ���, �C�� 
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(norbox) do	
		SetModeEx( norbox[x] , EM_SetModeType_Strikback, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( norbox[x] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( norbox[x] , EM_SetModeType_Move, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( norbox[x] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( norbox[x] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( norbox[x] , EM_SetModeType_DisableRotate, false )--��V
		AddToPartition( norbox[x], RoomID )	--�����󲣥�
	end
end

function Lua_mika_losttreasure_boxtest11()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local norbox = Lua_MadeRectangleByXYZ_noyell(113617 , 3817 , 49 , 3840 , 0 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(norbox) do	
		SetModeEx( norbox[x] , EM_SetModeType_Strikback, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( norbox[x] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( norbox[x] , EM_SetModeType_Move, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( norbox[x] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( norbox[x] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( norbox[x] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( norbox[x] , EM_SetModeType_DisableRotate, false )--��V
		AddToPartition( norbox[x], RoomID )	--�����󲣥�
	end
end

function Lua_mika_losttreasure_boxtest2()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local goodbox = Lua_MadeRectangleByXYZ_noyell(113618 , 3840 , 49 , 3832 , 270 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(goodbox) do	
		SetModeEx( goodbox[x] , EM_SetModeType_Strikback, false )--����
		SetModeEx( goodbox[x] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( goodbox[x] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( goodbox[x] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( goodbox[x] , EM_SetModeType_Move, false )--����
		SetModeEx( goodbox[x] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( goodbox[x] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( goodbox[x] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( goodbox[x] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( goodbox[x] , EM_SetModeType_DisableRotate, false )--��V
		AddToPartition( goodbox[x], RoomID )	--�����󲣥�
	end
end

function Lua_mika_losttreasure_boxtest3()
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID );
	local mallbox = Lua_MadeRectangleByXYZ_noyell(113619 , 3840 , 49 , 3849 , 270 , 13 , 20 , 5 , 1)
--	local norbox = Lua_MadeByRectangle(113617 , 13 , 20 , 5 , 2)
	for x=1 , table.getn(mallbox) do	
		SetModeEx( mallbox[x] , EM_SetModeType_Strikback, false )--����
		SetModeEx( mallbox[x] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( mallbox[x] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( mallbox[x] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( mallbox[x] , EM_SetModeType_Move, false )--����
		SetModeEx( mallbox[x] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( mallbox[x] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( mallbox[x] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( mallbox[x] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( mallbox[x] , EM_SetModeType_DisableRotate, false )--��V
		AddToPartition( mallbox[x], RoomID )	--�����󲣥�
	end
end