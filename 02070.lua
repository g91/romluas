--�P���` 2010 ����  - �m�Ь��@

--���ê���npc�@��
------------------------------------------------------------------------------------
function lua_mika_thankday_hidebox() --���ê�����b�k�M�P�_�Z����box
	Say(OwnerID(), "ostrich born !" )
	Beginplot(OwnerID(), "Lua_mika_thankday_ostrichborn", 0 ) --���b�k
	Say(OwnerID(), "box born !" )
	Beginplot(OwnerID(), "Lua_mika_thankday_boxborn", 0 ) --��box
end

--���ê�����b�k 
function Lua_mika_thankday_ostrichborn() --
	local ostrich={}
	for i = 0, 29 do  --30
		ostrich[i] = CreateObjByFlag(116038, 780769, i ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		SetModeEx( ostrich[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( ostrich[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ostrich[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ostrich[i]  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( ostrich[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ostrich[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ostrich[i]  , EM_SetModeType_Move, true )--����
		SetModeEx( ostrich[i]  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( ostrich[i]  , EM_SetModeType_ShowRoleHead, true )--�Y����
		AddToPartition( ostrich[i],0 )	--
		WriteRoleValue( ostrich[i] , EM_RoleValue_PID , i )
		Beginplot(ostrich[i], "lua_mika_thankday_ostrich" , 0 )
		Beginplot(ostrich[i], "lua_mika_thankday_range" , 0 )
	end
end

--���ê���ͧP�_�Z���νc�l
function Lua_mika_thankday_boxborn() --
	local box={}
	for i = 0, 29 do  --30
		box[i] = CreateObjByFlag(115826, 780769, i ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		SetModeEx( box[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( box[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( box[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( box[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( box[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( box[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx( box[i], EM_SetModeType_Move, false )--����
		SetModeEx( box[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( box[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( box[i], EM_SetModeType_Show, false )--���  ���ê���
		AddToPartition( box[i], 0 )
	end
end

function lua_mika_thankday_ostrich()
	local ID = OwnerID()--�b�k
	while true do 
		local Player = SearchRangePlayer( ID , 60) --�P�_����O�_�����a
		if CheckBuff(ID, 507707 ) == false then  --�S���i����BUFF
			if CheckID( Player[0] ) == true then	--�p�G����XX�������a		
				local dis = Rand( 50 )    --�����a�h���ʶZ��20-50
				if dis < 30 then
					dis = 30
				end
	--			Say(ID, "Move="..dis )
				AdjustFaceDir(ID, Player[0] , 180 ) --���V �I��
				WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( ID , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
				sleep(10)
			else
				local TempNPC =  SearchRangeNPC( OwnerID() , 30 ) 	--���P��d�򤺪�npc
				for i=1,table.getn(TempNPC) do		
					if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID ) == 116039 then  --�p�G���񦳰�³
				--		Say(ID, "Find food !")
						Npcsay(ID, "[SC_THANKSGIVING_2010_10]" )  --�b�k�o�{�����ɻ���
						AdjustFaceDir(ID, TempNPC[i], 0 ) --���V
						PlayMotion( ID, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --�ʧ@
						Addbuff(ID, 507707, 0, 15 )  --��BUFF �i���� 15sec
						sleep(50)
						DelObj(TempNPC[i])
						break
					end
				end
			end
		end

		sleep(10)   --��
	end
end

-- �P�_�b�k�PHIDEBOX���Z�� (���b�b�k���W)
function lua_mika_thankday_range()
	local ID = OwnerID()--�b�k
	local PID = ReadRoleValue( ID , EM_RoleValue_PID )  --PID�ȥN��b���@��FLAG����
	local Box = LuaFunc_SearchNPCbyOrgID( ID , 115826, 200 , 0)       --�P�_�Z�������ê���
	while true do 
		local range =  GetDistance( ID , Box  )  --�b�k�M���ê��󤧶����Z��
	--	Say(ID, "range="..range )
	--	Say(ID, "PID="..PID )
		DW_MoveRand(ID, 30 )  --ObjID �Q�i�沾�ʪ�����   RandRange �Q�H�����ʪ��S��(���|)
		if range >= 100 then
	--		Say(ID, "go back" )
			WriteRoleValue( ID, EM_RoleValue_IsWalk, 0) 			--RUN
			LuaFunc_MoveToFlag( ID, 780769, PID, 0)        			--���ʨ���w���Ѥl ��0��
		--	WriteRoleValue( ID, EM_RoleValue_IsWalk, 2 ) 			--WALK
		end
		sleep(80)   --8���@��
	end
end