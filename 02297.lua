un_changeskillcon1 = {}
un_foodlistcount1 = {}
un_zone19skilltime1 = {}
function un_zone19_boss5_01()--FOR ��***********************************	
	SetPlot( OwnerID(),"touch","un_zone19_boss5_1",30 )--Ĳ�I�@��
	AddBuff( OwnerID(), 508370, 0, -1 ) --���~�o��
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_3_01()--FOR �s******************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_4",30 )--Ĳ�I�@��
	AddBuff( OwnerID(), 508370, 0, -1 ) --���~�o��
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_5_01()--FOR����***************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_6",30 )--Ĳ�I�@��
	AddBuff( OwnerID(), 508370, 0, -1 ) --���~�o��
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end


function un_zone19_boss5_8_01() --FOR��************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_9",30 )--Ĳ�I�@��
	AddBuff( OwnerID(), 508370, 0, -1 ) --���~�o��
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_15_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while 1 do
	sleep(10)
		if un_foodlistcount1[RoomID][1]==1 then
		Delobj(OwnerID())
		end
	end	
end
function un_zone19_boss5_13_01()----*****���b����W������������
	local FlagObjID = 780793  --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local Obj = {117195,117196,117197,117198}--�شӪ���s��
	local ObjNum = math.floor( FlagNum  )   --�شӪ���ƶq
	local resetTime = 50 --���s�ɶ�(��) 
	local Range = 5	--���󲣥ͦb�X�m���d��
	local Gravity = true --���L���O
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end
--���Ctrl��reg1 = �P�_���q
--���Ctrl��reg2 = Ĳ�o�԰����p�y
--Ĳ�o�԰����p�ylittlemonster �� reg1 = ���
--�p�Ǫ�reg1 = ���
--�p�Ǫ�reg2 = Ĳ�o�԰����p�y

function un_zone19_boss5_allconreal_1_01() 						   ----�`����(����BOSS+�t��+�ඥ�q)                                  
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --Ū���X�{�b��RoomID�A�ëŧi��RoomID
	local Ctrl = OwnerID()       							   --�ŧiCtrl = OwnerID() �A �קK���ƩI�s
	un_zone19skilltime1[RoomID] = {}
	un_zone19skilltime1[RoomID][1] = 25
	un_foodlistcount1[RoomID] = {}
	un_foodlistcount1[RoomID][1] = 0
	un_changeskillcon1[RoomID] = {}
	un_changeskillcon1[RoomID][1] = 0
	--un_zone19skilltime1[RoomID] = 25  --�p�Ƕ��q�ɶ�
	--un_foodlistcount1[RoomID] = 0
	--un_changeskillcon1[RoomID] = 0  
	--�P�_���q 0 = �ݾ�  �A 1 = �p�Ƕ��q �A 2 = BOSS���q(�L����) �A 3 = BOSS���q(����) �A4 = ���m���q
	local skilltalk = {"[SC_105099_01]","[SC_105099_02]","[SC_105099_04]"}    --BOSS���
	WriteRoleValue(Ctrl,EM_RoleValue_register3,0)
	local littlemonster          							   --Ĳ�o�԰����p�y
	littlemonster = CreateObjByFlag( 105104, 780838 , 0 , 1 )  --�̾ںX�ХͥXĲ�o�԰����p�y
	SetModeEx(littlemonster,EM_SetModeType_Fight, false)       --�ŧilittlemonster1����Q����/true = ��Q����
	SetModeEx(littlemonster,EM_SetModeType_Mark,false)                  ----�аO
	SetModeEx(littlemonster,EM_SetModeType_Strikback,false)             ---����
	SetModeEx(littlemonster,EM_SetModeType_Move,false)                  ---����	
	SetModeEx(littlemonster,EM_SetModeType_SearchenemyIgnore,false)     ---���󤣷|�Q�j�M
	SetModeEx(littlemonster,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
	SetModeEx(littlemonster,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
	SetModeEx(littlemonster,EM_SetModeType_Searchenemy,false)           ---���
	SetModeEx(littlemonster,EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	SetModeEx(littlemonster,EM_SetModeType_show,false)                  --�q�X
	Beginplot(littlemonster,"un_zone19_boss5_fight_01",0)         --��littlemonster1����d��@����Script
	WriteRoleValue(littlemonster,EM_RoleValue_register1,Ctrl)  --�NCtrl�g�Jlittlemonster1��EM_RoleValue_register1
	WriteRoleValue(Ctrl,EM_RoleValue_register2,littlemonster)  --�Nlittlemonster1�g�JCtrl��EM_RoleValue_register2
	AddToPartition(littlemonster,RoomID)                       --��{�Xlittlemonster1
	local x1 = ReadRoleValue (littlemonster, EM_RoleValue_X)   --�O��littlemonster��X
	local y1 = ReadRoleValue (littlemonster, EM_RoleValue_Y)   --�O��littlemonster��y
	local z1 = ReadRoleValue (littlemonster, EM_RoleValue_Z)   --�O��littlemonster��z
	local monster = {105101,105102,105103}					   --�n�X���p�Ǫ�table
	local monster1                                             --�ŧi���n�Ъ��p��
	local monster2                                             --�ŧi���n�Ъ��p��
	local food                                            --�O�����S���n�X�������ܼ�      
	local foodCtrl	                                           --�ŧi���n���X����������
	
	local Boss                                                 --Boss
	Boss = CreateObjByFlag( 105351, 780838 , 1 , 1 )           --�̾ںX�ХͥXBoss
	WriteRoleValue(Boss,EM_RoleValue_register1,Ctrl)           --�NCtrl�g�JBoss��EM_RoleValue_register1
	SetModeEx(Boss,EM_SetModeType_Strikback,false) 		   ---����
	SetModeEx(Boss,EM_SetModeType_Fight,false)    		   ---�i���
	SetModeEx(Boss,EM_SetModeType_Searchenemy,false)	   ---���
	AddToPartition(Boss,RoomID)                     		   --��{Boss
	Setplot(Boss,"dead","un_zone190_boss5Die_01",0) 
	local box
	box = CreateObjByFlag( 102679, 780838 , 1 , 1 )           --�̾ںX�ХͥXbox
	SetModeEx(box,EM_SetModeType_Fight, false)       --�ŧilittlemonster1����Q����/true = ��Q����
	SetModeEx(box,EM_SetModeType_Mark,false)                  ----�аO
	SetModeEx(box,EM_SetModeType_Strikback,false)             ---����
	SetModeEx(box,EM_SetModeType_Move,false)                  ---����	
	SetModeEx(box,EM_SetModeType_SearchenemyIgnore,false)     ---���󤣷|�Q�j�M
	SetModeEx(box,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
	SetModeEx(box,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
	SetModeEx(box,EM_SetModeType_Searchenemy,false)           ---���
	SetModeEx(box,EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	SetModeEx(box,EM_SetModeType_Obstruct,true)               ---����
	SetModeEx(box,EM_SetModeType_show,false)                  --�q�X
	AddToPartition(box,RoomID) 
	local door = 0

	
	while true do                                              --�������while�j��
	--say(Ctrl,"skillcount = "..un_changeskillcon1[RoomID][1])
		sleep(10)                                              --��while�j��C���@���~�}�l����
		if un_changeskillcon1[RoomID][1] == 1 then                            --�p�Ƕ��q*********************************
			un_zone19skilltime1[RoomID][1]=un_zone19skilltime1[RoomID][1]+1                              --�p�ƥ�
			food = ReadRoleValue(Ctrl,EM_RoleValue_register3)
			if food == 0 then
			un_foodlistcount1[RoomID][1]  = 0
				ScriptMessage( Boss, -1 , 2 , skilltalk[1] , 2 )    --Boss�}�Թ��
				foodCtrl = CreateObjByFlag( 105104, 780838 , 2 , 1 )--���X�������
				SetModeEx(foodCtrl,EM_SetModeType_Mark,false)       ----�аO
				SetModeEx(foodCtrl,EM_SetModeType_Strikback,false)  ---����
				SetModeEx(foodCtrl,EM_SetModeType_Move,false)       ---����	
				SetModeEx(foodCtrl,EM_SetModeType_Fight,false)      ---�i���
				SetModeEx(foodCtrl,EM_SetModeType_SearchenemyIgnore,false) ---���󤣷|�Q�j�M
				SetModeEx(foodCtrl,EM_SetModeType_HideName,false)   ---�����Y�W�O�_��ܦW��
				SetModeEx(foodCtrl,EM_SetModeType_HideMinimap,false)---����O�_�b�p�a�ϤW���
				SetModeEx(foodCtrl,EM_SetModeType_Searchenemy,false)---���
				SetModeEx(foodCtrl,EM_SetModeType_Show,false)       ---���  
				AddToPartition(foodCtrl,RoomID )
				Beginplot(foodCtrl,"un_zone19_boss5_13_01",0)
				door = CreateObjByFlag( 104538, 780838 , 6 , 1 )           --�̾ںX�ХͥXdoor
				SetModeEx(door,EM_SetModeType_Fight, false)       --�ŧilittlemonster1����Q����/true = ��Q����
				SetModeEx(door,EM_SetModeType_Mark,false)                  ----�аO
				SetModeEx(door,EM_SetModeType_Strikback,false)             ---����
				SetModeEx(door,EM_SetModeType_Move,false)                  ---����	
				SetModeEx(door,EM_SetModeType_SearchenemyIgnore,false)     ---���󤣷|�Q�j�M
				SetModeEx(door,EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
				SetModeEx(door,EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
				SetModeEx(door,EM_SetModeType_Searchenemy,false)           ---���
				SetModeEx(door,EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
				SetModeEx(door,EM_SetModeType_Obstruct,true)               ---����
				SetModeEx(door,EM_SetModeType_show,true)
				Beginplot(door,"un_zone190_doordel_1",0)
				AddToPartition(door,RoomID) 
				WriteRoleValue(Ctrl,EM_RoleValue_register3,1)              --�ŧi��1�N��X�L�������q�F
			end
			if un_zone19skilltime1[RoomID][1]%30==0 and un_zone19skilltime1[RoomID][1]<270 then          --�C30�����@��
				for i = 1 , table.getn(monster) do             --�X�Ǫ��ƶq = for�j����榸�ơA table.getn()���o�}�C�ƶq
					local rand = Az_RND_Ary(-100,100,2)        --�� -100 ~ 100 �H���� 2 �Ӽ�
					monster1 = CreateObj ( monster[i] , x1+rand[1] , y1 , z1+rand[2] , 0 , 1)
					monster2 = CreateObj ( monster[i] , x1+rand[2] , y1 , z1+rand[1] , 0 , 1)
					--�H�W�OCreateObj����A���� x , y , z �W�A+ rand[1][2] �O�ܦ��H���I

					WriteRoleValue(monster1,EM_RoleValue_register1,Ctrl)  --���ХX���Ǫ�Reg1�g�J���
					WriteRoleValue(monster2,EM_RoleValue_register1,Ctrl)  --���ХX���Ǫ�Reg1�g�J���
					WriteRoleValue(monster1,EM_RoleValue_register2,littlemonster)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					WriteRoleValue(monster2,EM_RoleValue_register2,littlemonster)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					WriteRoleValue(monster1,EM_RoleValue_register3,door)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					WriteRoleValue(monster2,EM_RoleValue_register3,door)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					WriteRoleValue(monster1,EM_RoleValue_register4,foodCtrl)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					WriteRoleValue(monster2,EM_RoleValue_register4,foodCtrl)  --���ХX���Ǫ�Reg2�g�JĲ�o�԰��y
					AddToPartition(monster1,RoomID)          			  --��{�X�гy��
					AddToPartition(monster2,RoomID)          			  --��{�X�гy��
					Beginplot(monster1,"un_zone19_monster_01",0)
					Beginplot(monster2,"un_zone19_monster_01",0)
					
				end
			end
			if un_zone19skilltime1[RoomID][1] == 250 then  
				ScriptMessage( Boss, -1 , 2 , "[SC_105099_09]" , 2 )
			end
			if un_zone19skilltime1[RoomID][1] >= 270 then                           --400��H�ᵲ���X�Ƕ��q(�P�_���a���L���Ȼݭn�i�J�����q)
				un_zone19skilltime1[RoomID][1] = 25                                  --�����q�k0�A�קK�A�X��
				Delobj(foodCtrl)                               --�R�������������קK�A�X����
				un_foodlistcount1[RoomID][1]  = 1
				WriteRoleValue(Ctrl,EM_RoleValue_register3,0)  --���X�����ܳN�A�ŧi�^0�A�����m�ɯ�A�X����
				un_changeskillcon1[RoomID][1] = 2                             --���ۧ令���`BOSS�Զ��q
				local player = SetSearchAllPlayer(RoomID)      --Ū�����hzone�Ҧ����a�ƶq
				local playername                               --���ŧi�n���X��zone�᪺���a
				for i = 1 , player do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
					playername = GetSearchResult()             --���X��zone����o�����aGID
					if CheckAcceptQuest( playername, 423755 ) == true and   --�P�_���a�O�_��������
					CheckCompleteQuest( playername, 423755 ) ~= true and    --���d���a�O�_��������
					CheckFlag( playername, 544639 ) ~= true then            --�P�_���a�O�_�����������Ȫ��X��
						un_changeskillcon1[RoomID][1] = 3                                   --�u�n�����a�����ȴN������ȶ��q
					end
				end
			end
		elseif un_changeskillcon1[RoomID][1] == 2 then                        --Boss���q*********************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[2] , 2 )   --Boss�}�Թ��
			sleep(10)
			
			Beginplot(Boss,"un_zone19_Boss5AI_01_01",0)           --������Script��Boss����
			un_changeskillcon1[RoomID][1] = 6                                 --�A��Ҧ�������ݾ��A�קK���ư���Script
			--Setplot(Boss,"dead","un_zone190_boss5Die_012_01",0)    --�ᦺ�`�@����BOSS
			
		elseif un_changeskillcon1[RoomID][1] == 3 then                        --Boss���q(�t��)***************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[2] , 2 )
			Addbuff(Boss,502707,0,-1)                          --��Boss����^�媺BUFF
			Beginplot(Boss,"un_zone19_Boss5AI_02_01",0)           --������Script��Boss����
			un_changeskillcon1[RoomID][1] = 6                                 --�A��Ҧ�������ݾ��A�קK���ư���Script
			--Setplot(Boss,"dead","un_zone190_boss5Die_01",0)       --�ᦺ�`�@����BOSS
			
		elseif un_changeskillcon1[RoomID][1] == 4 then                        --���m���q*********************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[3] , 2 )
			Delobj(Boss)                                        --�R��BOSS
			delobj(door)
			un_changeskillcon1[RoomID][1] = 0                                 --�A�N���q�g�^0�A�קK����
			Boss = CreateObjByFlag( 105351, 780838 , 1 , 1 )   --�̾ںX�ХͥXBoss
			WriteRoleValue(Boss,EM_RoleValue_register1,Ctrl)   --�NCtrl�g�JBoss��EM_RoleValue_register1
			SetModeEx(Boss,EM_SetModeType_Strikback,false)     ---����
			SetModeEx(Boss,EM_SetModeType_Fight,false)    	   ---�i���
			SetModeEx(Boss,EM_SetModeType_Searchenemy,false)   ---��� 
			AddToPartition(Boss,RoomID)                        --��{Boss
			Beginplot(littlemonster,"un_zone19_boss5_fight_01",0) --���d��Ĳ�o�԰��@�����sBeginplot
			Setplot(Boss,"dead","un_zone190_boss5Die_01",0) 
			local searnpc = {}
			searnpc = SearchRangeNPC ( OwnerID() , 500 )
			for i=0 , table.getn(searnpc) do
				if ReadRoleValue(searnpc[i],EM_RoleValue_OrgID) ==105106 then
					delobj(searnpc[i])
				end
			end
			local searplayer = {}
			searplayer = SearchRangeplayer ( OwnerID() , 500 )
			--say(OWnerID(),table.getn(searplayer))
			for i= 0, table.getn(searplayer) do
				if CheckBuff( searplayer[i] , 508391) == true then
					CancelBuff(searplayer[i], 508391 ) 
				end
			end
		elseif un_changeskillcon1[RoomID][1] == 5 then
			local searnpc = {}
			searnpc = SearchRangeNPC ( OwnerID() , 500 )
			for i=0 , table.getn(searnpc) do
				if ReadRoleValue(searnpc[i],EM_RoleValue_OrgID) ==105106 then
					delobj(searnpc[i])
				end
			end
			local searplayer = {}
			searplayer = SearchRangeplayer ( OwnerID() , 500 )
			for i= 0, table.getn(searplayer) do
				if CheckBuff( searplayer[i] , 508391) == true then
					CancelBuff(searplayer[i], 508391 ) 
				end
			end			
		delobj(box)
		delobj(door)
		delobj(littlemonster)
		delobj(OwnerID())
		end
	end
end

function un_zone19_boss5_fight_01()                     		   --�p�Ǥ�����script(�d��Ĳ�o)
	local fight = OwnerID()                                    --�ŧifight = OwnerID()�קK���ƫŧi
	WriteRoleValue(fight,EM_RoleValue_register1,0) 
	local skill = ReadRoleValue(fight,EM_RoleValue_register1)  --�P�_�קK����Ĳ�o0 = Ĳ�o �A 1 = ��Ĳ�o

	--if ReadRoleValue(TargetID(),EM_RoleValue_VOC)==0 then
	--else
		if skill == 0 then
			SetPlot( fight,"range","un_zone19_boss5_fight_01_2_01",100 ) --�d��100��Ĳ�oscript
		end
	--end	
end


function un_zone19_boss5_fight_01_2_01()                     	  	        --�p�Ǥ�����script
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local tar  =  TargetID()                                      --�ŧitar = ���(���ɱ���OTargetID,Ĳ�o���H�OOwnerID())
	SetPlot( tar,"range","",100 )                                     --���s�ŧi�ӪŪ��d��@���קK����Ĳ�o
	--say(OwnerID(),"1")
	--say(TargetID(),"2")
	if ReadRoleValue(OwnerID(),EM_RoleValue_VOC)==0 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==1 then
		--SetPlot( tar,"range","un_zone19_boss5_fight_01_2_01",100 )
		Beginplot(tar,"un_zone19_boss5_fight_01",0)
	else	
		un_changeskillcon1[RoomID][1] = 1   	--�N�����Reg1�g��1�N��Ҧ�1�p�ǼҦ�
	end
end

function un_zone19_Boss5AI_01_01()                                --BossAI_Script���`���q******
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --Ū���X�{�b��RoomID�A�ëŧi��RoomID 
	local Boss = OwnerID()                                     --�ŧiBoss=OwnerID()�קK���ƫŧi�y���į����
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_register1)    --Ū��Boss��reg1�������GID�A�ëŧi��Ctrl
	local skilltime = 0                                        --�ŧi�D�n�ɶ� skilltime = 0 
	local player = {}                                          --�ŧi�@��player������C���
	local rand                                                 --�ŧi�@��rend�Ӱ�����C���H��
	local Targ                                                 --�ŧi�@��targ��@BOSS��e�ؼ�
	local Play_Chose = {}                                      --�ŧi�@�Ӱ}�C�ө񥴶ê��}�C
	local skill = 0                                            --�ŧiskill���P�_�O�_�b�԰�����
	local ball                                                 --�ŧi�@��ball�s��7��᪱�aBUFF���P�_�y
	local retime = 0
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---����
	SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---�i���
	SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	   ---���
	while 1 do
		sleep(10)
		skilltime = skilltime + 1 
		if hatelistcount(Boss) ==0 and skill==0 then
			retime = retime+1 
			if retime == 5 then
				un_changeskillcon1[RoomID][1] = 4  
			end
		end
		if hatelistcount(Boss)~=0 then                             --Boss����C���H=�i�J�԰�
			if skill == 0 then                                     --�p�GBoss�i�J�԰��N�Nskill=1�N��i�J�԰�
				skill = 1
			end
			if skilltime%7 == 0 then
				--say(Boss,"time = "..7)
				Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS������ؼ�
                 --���H���@�Hbuff
				CastSpelllv( OwnerID(), Targ,497495 ,0 )           --���e�ؼЩ�r��
				sleep(20)                                          --���d2���קK�ʧ@�S�񧹥d��
			end
			if skilltime%10 == 0 then
			sleep(10)
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
				end			
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				if table.getn(player)>0 then
					rand = DW_rand(table.getn(player))                 --rand�@�ӼƦr�A��player�}�C�O�h�ּƶq
					while ReadRoleValue( player[rand] , EM_RoleValue_IsPlayer) == 0 do
						rand = DW_rand(table.getn(player))
					end
					local x= ReadRoleValue ( player[rand], EM_RoleValue_X)--�ŧi�@��X�x�s�Q��BUFF���a��X 
					local y= ReadRoleValue ( player[rand], EM_RoleValue_y)--�ŧi�@��y�x�s�Q��BUFF���a��y
					local z= ReadRoleValue ( player[rand], EM_RoleValue_z)--�ŧi�@��z�x�s�Q��BUFF���a��z 
					ball=CreateObj ( 105105 , x , y , z , 0 , 1)          --�ѷ�zyz�ͥX�@�Ӭ����ɶ������
					SetModeEx(ball,EM_SetModeType_Mark, false)
					SetModeEx(ball,EM_SetModeType_HideName, false)
					SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(ball,EM_SetModeType_Strikback, false)
					SetModeEx(ball,EM_SetModeType_Move, false)
					SetModeEx(ball,EM_SetModeType_Fight, false)
					SetModeEx(ball,EM_SetModeType_Searchenemy, false)
					AddToPartition(ball,roomID )
					WriteRoleValue(ball,EM_RoleValue_register1,player[rand])--�N�Q��BUFF���H�����Aball��reg1
					Beginplot(ball,"un_zone19_bossball",0)                  --ball����5��p�ɧP�_���abuff�O�_���Ѱ�

					Addbuff(player[rand],508386,0,6)  
					local PlayerName=GetName(player[rand])
					local MsgStr="[SC_105099_08][$SETVAR1="..PlayerName.."]"
					ScriptMessage( Boss, -1 , 2 ,MsgStr, 2 )
				end	
			end
			if skilltime%15 == 0 then
			sleep(10)
				--say(Boss,"time = "..15)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_07]", 2 )
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				Play_Chose =KS_RegroupArray( player, num )         --���ð}�C�C��
				CastSpelllv( OwnerID(), OwnerID(),496761 ,0 )      --���@�Ӫ�t�k�N
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
				end
				if table.getn(Play_Chose)<4 then                   --�P�_�p�GBOSS����C��<6�H
					for i=1 , table.getn(Play_Chose) do            --�盧��C���Ҧ��H���
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--�t�Ω�ˮ`��
					end
				end
				if table.getn(Play_Chose)>=4 then                   --�P�_�p�GBOSS����C��>4�H
					for i=1 , 4 do                                  --�盧��C��4�H���
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--�t�Ω�ˮ`��
					end
				end
				sleep(30)
			end
			
			if skilltime%40 == 0 then
				--say(Boss,"time = "..40)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_05]", 2 )
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				if table.getn(player)>0 then
					Play_Chose =KS_RegroupArray( player, num )         --���ð}�C�C��
					local tabskill = {}
					for i=1 , table.getn(Play_Chose) do
						if ReadRoleValue(  Play_Chose[i] , EM_RoleValue_IsPlayer) == 1 then
							table.insert(tabskill,Play_Chose[i])
						end
					end
					if table.getn(tabskill)<2 then                   --�P�_�p�GBOSS����C��<3�H
						for i=1 , table.getn(tabskill) do            --�盧��C���Ҧ��H���
							Addbuff(tabskill[i],508389,0,-1)                 --��BUFF
						end
					end	
					if table.getn(tabskill)>=2 then                   --�P�_�p�GBOSS����C��>3�H
						for i=1 , 2 do                                  --�盧��C��3�H���
							Addbuff(tabskill[i],508389,0,-1)                 --��BUFF
						end
					end
					sleep(10)
				end	
			end
			if skilltime>=200 then
				addbuff(OwnerID(),507744,0,-1)
			end
		elseif 	hatelistcount(Boss)==0 and skill ==1 then           --Boss�����S�H+���g�԰��L =���m���q
			un_changeskillcon1[RoomID][1] = 4                                      --�N������q�g�쭫�m4
		end
	end
end


function un_zone19_Boss5AI_02_01()                                   --BossAI_Script�t�����q******
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --Ū���X�{�b��RoomID�A�ëŧi��RoomID 
	local Boss = OwnerID()                                     --�ŧiBoss=OwnerID()�קK���ƫŧi�y���į����
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_register1)    --Ū��Boss��reg1�������GID�A�ëŧi��Ctrl
	local skilltime = 0                                        --�ŧi�D�n�ɶ� skilltime = 0 
	local player = {}                                          --�ŧi�@��player������C���
	local rand                                                 --�ŧi�@��rend�Ӱ�����C���H��
	local Targ                                                 --�ŧi�@��targ��@BOSS��e�ؼ�
	local Play_Chose = {}                                      --�ŧi�@�Ӱ}�C�ө񥴶ê��}�C
	local skill = 0                                            --�ŧiskill���P�_�O�_�b�԰�����
	local ball                                                 --�ŧi�@��ball�s��7��᪱�aBUFF���P�_�y
	local mpcskill = 0                                         --�t�����q
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)       --�O��Boss�̤jHP��q
	local NowHp                                                --�ثeBoss��q
	local Hp                                                   --�ثeBossHP%��

	sleep(10)
	ScriptMessage( Boss, -1 , 2 ,"[SC_105099_03]" , 2 )        --boss���"�ݨӧڭ̰��F�s�B�ͥH�~�A�٦������ժ��C"
	sleep(10)
	local ika = CreateObjByFlag( 105070, 780838 , 3 , 1 )      --�̾ںX�ХͥX��i
	local show = CreateObjByFlag( 105069, 780838 , 4 , 1 )     --�̾ںX�ХͥX�]��
	local body = CreateObjByFlag( 117158, 780838 , 5 , 1 )     --�̾ںX�ХͥX����
	Addbuff(Boss,502707,0,-1)
	Addbuff(ika,502707,0,-1)
	Addbuff(body,502707,0,-1)
	PlayMotionEX(body, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)--�˦���
	WriteRoleValue(ika,EM_RoleValue_register1,body)            --��Ѫ��g���o�k��
	WriteRoleValue(boss,EM_RoleValue_register3,ika)            --��k��g��BOSS
	WriteRoleValue(boss,EM_RoleValue_register4,show)           --��³��g��BOSS
	WriteRoleValue(ika,EM_RoleValue_register5,show)            --��³��g���k��
	WriteRoleValue(ika,EM_RoleValue_register9,boss)            --��boss�g���k��
	SetModeEx(ika,EM_SetModeType_Fight,false)      ---�i���
	SetModeEx(show,EM_SetModeType_Fight,false)      ---�i���
	SetModeEx(ika,EM_SetModeType_Move,false)       ---����
	SetModeEx(show,EM_SetModeType_Move,false)       ---����
	WriteRoleValue(ika,EM_RoleValue_register6,0)            
	--Npcsay(Boss,"[SC_423755_1]")         --boss���"�p�³�...�רs�٬O�^��ڪ�����H�ֹL�өM�A�����˹λE�ڡI"
	Yell( Boss ,"[SC_423755_1]" , 2 )
	Addbuff(body,508299,0,-1)                                  --������BUFF
	AddToPartition(ika,roomID )
	AddToPartition(show,roomID )
	AddToPartition(body,roomID )
	SetModeEx(body,EM_SetModeType_Mark,false)       ----�аO
	SetModeEx(body,EM_SetModeType_Strikback,false)  ---����
	SetModeEx(body,EM_SetModeType_Move,false)       ---����	
	SetModeEx(body,EM_SetModeType_Fight,false)      ---�i���
	SetModeEx(body,EM_SetModeType_SearchenemyIgnore,false) ---���󤣷|�Q�j�M
	SetModeEx(body,EM_SetModeType_HideName,false)   ---�����Y�W�O�_��ܦW��
	SetModeEx(body,EM_SetModeType_HideMinimap,false)---����O�_�b�p�a�ϤW���
	SetModeEx(body,EM_SetModeType_Searchenemy,false)---���
	SetModeEx(body,EM_SetModeType_Show,true)       ---���  
	sleep(50)
	--Npcsay(ika,"[SC_423755_2]")                            --��iyell�G��f�I�ڤ����\�A�A���G�ڪ����ˡI
	Yell( ika ,"[SC_423755_2]" , 2 )
	sleep(30)
	--Npcsay(show,"[SC_423755_3]")                           --�]��yell�G[116585]�A�O�ͮ�I���ڭ̤@�_�_���a�I
	Yell( show ,"[SC_423755_3]" , 2 )
	sleep(30)
	--Npcsay(boss,"[SC_423755_4]")                           --�Ԫk����yell�G����p�G��o�쪺�ܴN�ոլݧa�I
	Yell( boss ,"[SC_423755_4]" , 2 )
	sleep(30)
	
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---����
	SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---�i���
	SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	       ---���
	local retime = 0
	while 1 do
		sleep(10)
		skilltime = skilltime + 1 
		if hatelistcount(Boss) ==0 and skill==0 then
			retime = retime+1 
			if retime == 5 then
			delobj(body)
			Delobj(ika)
			Delobj(show)
			sleep(20)
			un_changeskillcon1[RoomID][1]= 4  
			end
		end
		if hatelistcount(Boss)~=0 then                             --Boss����C���H=�i�J�԰�
			if skill == 0 then                                     --�p�GBoss�i�J�԰��N�Nskill=1�N��i�J�԰�
				skill = 1
				SetModeEx(ika,EM_SetModeType_Move,true)       ---����
				SetModeEx(show,EM_SetModeType_Move,true)       ---����
			end	
			NowHp = ReadRoleValue(OwnerID(),EM_RoleValue_HP)       --Ū����e��q
			Hp = (NowHp / maxhp) *100                              --��X��e��q��
			if Hp<=70 and mpcskill==0 then                         --��q�C��70%�A�B���q�A0���ɭ�
				sleep(20)
				--Npcsay(boss,"[SC_423755_5]")                           --�Ԫk�J��yell�G���I�p�³��A�Q�_���N�u���o�I�O�q�ܡH
				Yell( boss ,"[SC_423755_5]" , 2 )
				sleep(30)
				--Npcsay(boss,"[SC_423755_6]")                           --�Ԫk�J��yell�G�ݨӧA���䪺�����A�]���L�N�p�����I
				Yell( boss ,"[SC_423755_6]" , 2 )
				sleep(30)
				--Npcsay(ika,"[SC_423755_7]")                            --��iyell�G�ڥ��w�|���^���˪�����A���A���A�V�d�I
				Yell( ika ,"[SC_423755_7]" , 2 )
				sleep(30)
				--Npcsay(boss,"[SC_423755_8]")                           --�Ԫk�J��yell�G�O�ܡH���h���_�A�p�ɭԪ��ҼˤF�I�`�O���۲����������ݵۧڡI
				Yell( boss ,"[SC_423755_8]" , 2 )
				sleep(30)
				--Npcsay(show,"[SC_423755_9]")                           --�]��yell�G�A�o�N���|�Ӥ[���A�ڭ̷|�X�O���ѧA�I�����A���D�l�I���ڭ̹L�h�_���I
				Yell( show ,"[SC_423755_9]" , 2 )
				sleep(30)
	
				mpcskill = 1                                       --���ܶ��q�קK����Ĳ�o
			end
			if Hp<=40 and mpcskill==1 then                         --��q�C��70%�A�B���q�A0���ɭ�

				sleep(20)
				--Npcsay(show,"[SC_423755_10]")                        --�]��yell�G�`���o�ӮɭԤF�I[116585]�A�ֱN�A���˪�����I�a���I�����A���D�l�I���ڭ̹L�h�_���I
				Yell( show ,"[SC_423755_10]" , 2 )
				sleep(30)
				SetModeEx(Boss,EM_SetModeType_Strikback,false) 		   ---����
				SetModeEx(Boss,EM_SetModeType_Fight,false)    		   ---�i���
				SetModeEx(Boss,EM_SetModeType_Searchenemy,false)	   ---��� 
				sleep(20)
				SetStopAttack(ika)
				Beginplot(ika,"un_zone19_ika_01",0)
				SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---����
				SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---�i���
				SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	       ---���
				                 --��ika���樫�����ߦѯR���骺Script
				sleep(30)
				
				mpcskill = 2									   --���ܶ��q�קK����Ĳ�o
			end
			if skilltime%7 == 0 then
				--say(Boss,"time = "..7)
				Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS������ؼ�
				CastSpelllv( OwnerID(), Targ,497495 ,0 )           --���e�ؼЩ�r��
				sleep(20)                                          --���d2���קK�ʧ@�S�񧹥d��
			end
			if skilltime%10 == 0 then
			sleep(10)
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
				end			
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				rand = DW_rand(table.getn(player))                 --rand�@�ӼƦr�A��player�}�C�O�h�ּƶq
				while ReadRoleValue( player[rand] , EM_RoleValue_IsPlayer) == 0 do
					rand = DW_rand(table.getn(player))
				end
				local x= ReadRoleValue ( player[rand], EM_RoleValue_X)--�ŧi�@��X�x�s�Q��BUFF���a��X 
				local y= ReadRoleValue ( player[rand], EM_RoleValue_y)--�ŧi�@��y�x�s�Q��BUFF���a��y
				local z= ReadRoleValue ( player[rand], EM_RoleValue_z)--�ŧi�@��z�x�s�Q��BUFF���a��z 
				ball=CreateObj ( 105105 , x , y , z , 0 , 1)          --�ѷ�zyz�ͥX�@�Ӭ����ɶ������
				SetModeEx(ball,EM_SetModeType_Mark, false)
				SetModeEx(ball,EM_SetModeType_HideName, false)
				SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(ball,EM_SetModeType_Strikback, false)
				SetModeEx(ball,EM_SetModeType_Move, false)
				SetModeEx(ball,EM_SetModeType_Fight, false)
				SetModeEx(ball,EM_SetModeType_Searchenemy, false)
				AddToPartition(ball,roomID )
				WriteRoleValue(ball,EM_RoleValue_register1,player[rand])--�N�Q��BUFF���H�����Aball��reg1
				Beginplot(ball,"un_zone19_bossball",0)                  --ball����5��p�ɧP�_���abuff�O�_���Ѱ�

				Addbuff(player[rand],508386,0,6)  
				local PlayerName=GetName(player[rand])
				local MsgStr="[SC_105099_08][$SETVAR1="..PlayerName.."]"
				ScriptMessage( Boss, -1 , 2 ,MsgStr, 2 )
			end
			if skilltime%15 == 0 then
			sleep(10)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_07]", 2 )
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				Play_Chose =KS_RegroupArray( player, num )         --���ð}�C�C��
				CastSpelllv( OwnerID(), OwnerID(),496761 ,0 )      --���@�Ӫ�t�k�N
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
				end
				if table.getn(Play_Chose)<4 then                   --�P�_�p�GBOSS����C��<6�H
					for i=1 , table.getn(Play_Chose) do            --�盧��C���Ҧ��H���
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--�t�Ω�ˮ`��
					end
				end
				if table.getn(Play_Chose)>=4 then                   --�P�_�p�GBOSS����C��>6�H
					for i=1 , 4 do                                  --�盧��C��6�H���
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--�t�Ω�ˮ`��
					end
				end
				sleep(30)
			end
			
			if skilltime%40 == 0 then
			sleep(10)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_05]", 2 )
				player = DW_HateRemain(0)                          --player = ���o����C��A���@�Ӱ}�C
				Play_Chose =KS_RegroupArray( player, num )         --���ð}�C�C��
				local tabskill = {}
				for i=1 , table.getn(Play_Chose) do
					if ReadRoleValue(  Play_Chose[i] , EM_RoleValue_IsPlayer) == 1 then
						table.insert(tabskill,Play_Chose[i])
					end
				end
				if table.getn(tabskill)<2 then                   --�P�_�p�GBOSS����C��<3�H
					for i=1 , table.getn(tabskill) do            --�盧��C���Ҧ��H���
						Addbuff(tabskill[i],508389,0,-1)                 --��BUFF
					end
				end	
				if table.getn(tabskill)>=2 then                   --�P�_�p�GBOSS����C��>3�H
					for i=1 , 2 do                                  --�盧��C��3�H���
						Addbuff(tabskill[i],508389,0,-1)                 --��BUFF
					end
				end
				sleep(10)
			end	
			if skilltime>=200 then
				addbuff(OwnerID(),507744,0,-1)
			end
		elseif 	hatelistcount(Boss)==0 and skill ==1 then           --Boss�����S�H+���g�԰��L =���m���q
			delobj(body)
			Delobj(ika)
			Delobj(show)
			sleep(20)
			un_changeskillcon1[RoomID][1]= 4                                      --�N������q�g�쭫�m4
		end
	end                             
end

function un_zone19_monster_01()                                      --�p�����}�԰��P�_���m���q******
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local skilltime =0                                            --�ŧi�p�ǥ��i�J�԰������
	local skilltime2 = 0
	local own = OwnerID()                                         --�ŧiown= OwnerID()�A�קK���ƫŧi
	local Ctrl = ReadRoleValue(own,EM_RoleValue_register1)        --�q�p�Ǫ�reg1Ū���X�������A�ëŧi��Ctrl
	local Ctrlball = ReadRoleValue(own,EM_RoleValue_register2)    --�q�p�Ǫ�reg1Ū���XĲ�o�԰��p�y�A�ëŧi��Ctrlball
	local player = {}
	local door = ReadRoleValue(own,EM_RoleValue_register3)
	local food = ReadRoleValue(own,EM_RoleValue_register4)
	local rand 
	local rand2
	while 1 do                                                    --�C�����while�j��
		sleep(10)
		if hatelistcount(own)==0 then                             --�P�_�p�ǥ������L�i�J�԰��A==0�h�����L�H
			skilltime = skilltime+1    
			if skilltime %3==0 then                                 --�S�i�J�԰��H��3���i�H�������a��
				local plplayer = {} 
				local plplayer2 = {}
				plplayer = SearchRangeplayer ( own, 500 )
				for i= 0 , table.getn(plplayer) do
					if ReadRoleValue(TargetID(),EM_RoleValue_VOC)~=0 and 
					ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=1 and 
					ReadRoleValue(TargetID(),EM_SetModeType_Fight) ~=true and
					ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer) ==1 then
					
					table.insert(plplayer2,plplayer[i])
					end
				end
				rand = DW_rand(table.getn(plplayer2))
				if table.getn(plplayer2)~= 0 then
					SetAttack( own, plplayer2[rand] )
				end
			end
			if skilltime ==15 then                                 --���i�J�԰�����10��
				if checkID(door) == true then
					Delobj(door)
				end
				if checkID(food) == true then
					un_foodlistcount1[RoomID][1]  = 1
					Delobj(food)
				end
				
				un_changeskillcon1[RoomID][1] = 0                                --�N���q�g�^0�A���q0 = �ݾ�
				WriteRoleValue(Ctrl,EM_RoleValue_register3,0)
				SetPlot( Ctrlball,"range","un_zone19_boss5_fight_01_2_01",100 )--�NĲ�o�԰����y���s�g�^��Ĳ�o
				un_zone19skilltime1[RoomID][1] = 25
				Delobj(own)                                       --�R���p�ǥ���
			end
		elseif hatelistcount(own)~=0 then
			skilltime = 0
			skilltime2 = skilltime2 + 1
			if skilltime2%10 ==0 then
				player = SearchRangeplayer ( own, 500 )    --�q����C���H����@�H
				rand2 = DW_rand(table.getn(player))
				SysCastSpellLv(player[rand2], OwnerID(),497013,0)		  --���Q�ﭫ���H�J�ؤp��10��	
			end
		end
	end
end

function un_zone19_ika_01()                        --�t���ߪF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---����	
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
	--MoveToFlagEnabled(OwnerID(), false)
	local mob9898 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	local father = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local final
	local bird = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	while true do
		final = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
		--say(OwnerID(),"final = "..final)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			--MoveToFlagEnabled(OwnerID(), false)
			if final == 0 then
				if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
					if mob9898==0 then
					--MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780838 ,5,20)
					WriteRoleValue(OwnerID(),EM_RoleValue_Register4,mob9898+1)
					PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
					sleep(10)
					delobj(father)
					--Npcsay(OwnerID(),"[SC_423755_11]") 
					Yell( OwnerID() ,"[SC_423755_11]" , 2 )
					sleep(20)
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
					sleep(10)
						SetModeEx(OwnerID(),EM_SetModeType_Strikback,true) ---����	
						SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,true)
						SetAttack(OWnerID(),boss)
					end
				end
			end
			if final==1 then
				--Npcsay(OwnerID(),"[SC_423755_12]") 
				Yell( OwnerID() ,"[SC_423755_12]" , 2 )
				sleep(30)
				--Npcsay(bird,"[SC_423755_13]") 
				Yell( bird ,"[SC_423755_13]" , 2 )
				sleep(30)
				--Npcsay(OwnerID(),"[SC_423755_14]")
				Yell( OwnerID() ,"[SC_423755_14]" , 2 )				
				sleep(30)
				--Npcsay(OwnerID(),"[SC_423755_15]") 
				Yell( OwnerID() ,"[SC_423755_15]" , 2 )
				sleep(30)
				--Npcsay(bird,"[SC_423755_16]") 
				Yell( bird ,"[SC_423755_16]" , 2 )
				sleep(30)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register6,2)
			end
			if final==2 then
				MoveToFlagEnabled(OwnerID(), false)
				MoveToFlagEnabled(bird, false)
				WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
				WriteRoleValue(bird,EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Hide(bird)
				Show(OwnerID(),RoomID)
				Show(bird,RoomID)
				DW_MoveToFlag(bird , 780838 ,3,0)
				DW_MoveToFlag( OwnerID() , 780838 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register6,3)
				delobj(bird)
				delobj(OwnerID())
			end
		sleep(10)
	end
end

function un_zone190_boss5Die_01()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ika = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	local bird = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	WriteRoleValue(ika,EM_RoleValue_Register6,1)
	--WriteRoleValue(bird,EM_RoleValue_Register3,1)
	local player = SetSearchAllPlayer(RoomID)      --Ū�����hzone�Ҧ����a�ƶq
	local playername                               --���ŧi�n���X��zone�᪺���a
	for i = 1 , player do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
		playername = GetSearchResult()             --���X��zone����o�����aGID
		if CheckAcceptQuest( playername, 423755 ) == true and   --�P�_���a�O�_��������
		CheckCompleteQuest( playername, 423755 ) ~= true and    --���d���a�O�_��������
		CheckFlag( playername, 544639 ) ~= true then            --�P�_���a�O�_�����������Ȫ��X��
			SetFlag(playername,544639,1)                        --�����a��������
		end
	end
	un_changeskillcon1[RoomID][1] = 5
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_105099_06]" , 2 )
end
function un_zone190_boss5Die_012_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_changeskillcon1[RoomID][1] = 5
	ScriptMessage( OwnerID(), -1 , 2 , "[SC_105099_06]"  , 2 )
end

function un_zone19_boss5use_3_01()  --�����X����BOSS
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_changeskillcon1[RoomID][1] = 3
end

function un_zone19_boss5use_1_01()  --�����X�p�Ƕ��q
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_zone19skilltime1[RoomID][1]= 268
end
function un_zone19_hit1_01()                        --Boss��r�����P�_1
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x1=ReadRoleValue ( TargetID(), EM_RoleValue_X)
	local y1=ReadRoleValue ( TargetID(), EM_RoleValue_y)
	local z1=ReadRoleValue ( TargetID(), EM_RoleValue_z)
	local ball =CreateObj ( 105106 , x1 , y1 ,z1 , 0 , 1)
	SetModeEx(ball,EM_SetModeType_Mark,false) ----�аO
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---����
	SetModeEx(ball,EM_SetModeType_Move,false) ---����	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---�i���
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---���󤣷|�Q�j�M
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---�����Y�W�O�_��ܦW��
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---����O�_�b�p�a�ϤW���
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---���
	WriteRoleValue(ball,EM_RoleValue_Livetime,16)
	AddToPartition(ball,RoomID )
	beginplot(ball,"un_zone19_hit2_01",0)
end

function un_zone19_hit2_01()                        --Boss��r�����P�_2
	AddBuff( OwnerID() ,506823 ,0 ,-1 )
	while true do
	sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),497496,0)
	end	
end
function un_zone190_doordel_1()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	while 1 do
		sleep(50)
		if un_changeskillcon1[RoomID][1] == 0 or un_changeskillcon1[RoomID][1] == 4 or un_changeskillcon1[RoomID][1] == 5 then
			delobj(OwnerID())	
		end
	end
end