                                                                     
                                                                     
                                                                     
                                             
---------------------------------------------------------------------------------------------------
--�ܼƶ��q
---------------------------------------------------------------------------------------------------
Nehelia_FES_Global = Nehelia_FES_Global or {
			["turtle"] = { [1] ={ ID =120553 ,	Buff = 16},	--�m���t
				        [2] ={ID = 120554 ,	Buff = 13},	--�����t
				        [3] ={ID = 120555,Buff = 15 }},		--���b���t
			["happen"] = { 				--���v�վ�
					[1] = { poss1 = 60 ,
					            poss2 = 80  },
					[2] = { poss1 = 30 ,
					            poss2 = 70  }}}

----------------------------------------------------------------------------------------------------

function lua_nehelia_easterCircle()--�\����
	local Circle=OwnerID()
	Lua_Hao_Round_wall( Circle , 120559 , 16 , 100 , 0 ) --����
end


------------------------------------NPC����------------------------------------

function lua_nehelia_easterNPC()--NPC���
	local Player=OwnerID()
	local NPC=TargetID()
	local Day=CheckFlag ( Player , 546228 )--�C��K�O��
	local Ticket=CheckBuff ( Player , 622215 )--�C��Coin
	local Played=CheckFlag ( Player , 546229 )--�C���m��

	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_03]")--�ֱ��Ȥ��e
	AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_01]" , "lua_nehelia_easter01", 0 )--�C������

	if Ticket==false then
		if Played== true then
			AddSpeakOption( Player , NPC , "[SC_0908SEANSON_03]" , "lua_nehelia_easterP", 0 )--������y
		else
			if Day==false then
				AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_02]" , "lua_nehelia_easter02", 0 )--�ڭn��
			end

			if Day== true then
				local Language = GetServerDataLanguage() 
			--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
				if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
					AddSpeakOption( Player , NPC , "[SC_CLICKFUNGO31]" , "lua_nehelia_easter03", 0 )--�A���@��
				end
			end
		end
	end
end


------------------------------------NPC��ܿﶵ------------------------------------


----�C������
function lua_nehelia_easter01()--�C������
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_04]")
	AddSpeakOption( Player , NPC , "[SC_112533_0]" , "lua_nehelia_easterNPC", 0 )--�^�W�@�����
end

----�Ĥ@���K�O��
function lua_nehelia_easter02()--�ڭn��
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_05]" )--�A�n�{�b���C���ѥ[��ոլݶ�?
	AddSpeakOption( Player , NPC , "[SC_422367_1]" , "lua_nehelia_easterCoin", 0 )--�O��!!
end

----�A���@��
function lua_nehelia_easter03()--�A���@��
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_06]")--�����~����!
	AddSpeakOption( Player , NPC , "[SC_FLOWERFES_KORS_RS05]" , "lua_nehelia_easterCoin_again", 0 )--��X�ǰe�̲Ť�
end


function lua_nehelia_easterCoin()--�����C��Coin���� (���`��)
	local NPC = TargetID()	-- NPC
	local Player=OwnerID()	--���a
	local CheckCoin=CheckBuff( Player , 622215 )
	local CheckA=CheckFlag( Player , 546228 )

	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_07]" )
	DesignLog( Player , 120552 , "Accept" )		-- ���W
	SetFlag( Player , 546228 , 1 )		--�}�ҨC��K�O��
	AddBuff ( Player , 622215 , 0 , -1 )	--�����C��Coin

end

function lua_nehelia_easterCoin_again()--�����C��Coin���� (���m��)
	local NPC = TargetID()	-- NPC
	local Player=OwnerID()	--���a
	local CheckB=CountBodyItem( Player , 202903 )

	if CheckB==0 then
		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_08]")--�A�S������
	else
		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_07]" )
		DesignLog( Player , 120552 , "Accept" )		-- ���W
		AddBuff ( Player , 622215 , 0 , -1 )--�����C��Coin
		DelBodyItem( Player , 202903 , 1 )--�R�����a���W���ǰe�̲Ť�*1��
	end
end


------------------------------------�����@��------------------------------------

function lua_nehelia_easterP()--�����@��
	local Player=OwnerID()
	local NPC=TargetID()
	local Played=CheckFlag ( Player , 546229 )			--�C���m��
--	local Point = FN_CountBuffLevel( Player , 622174 )		--�C������ 
	local score = ReadRoleValue(Player,EM_RoleValue_Register1)	--�C������ 

	local OID = Player  
	--< OID���нж�J�Ӭ��ʤ��O���a���ܼ�,  �Ҧp Local OID = player

		local allcount = 4  -- �Ҧ��s���ʼƶq
		local count = 0
		local keylist =  {
				546288,	--�Ԥ�ߨ��þ�
				546257,	--�Ԥ�l�r�O
				546264,	--�ڤ۱m��
				546232		--�m�J��~
				}
		for i =  1 , table.getn(keylist) do
			if Checkflag(OID , keylist[i] )  == true then
				count = count +1
			end
			if i == table.getn(keylist) then
				if count == allcount then -- �p�G��������
					lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4��K�B�`���� ������0
				end
			end
		end



	if Played==true then		--�����ƪ����y
		if score<3 and score>0 then					--1~2��
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_10]")	--��������
			DesignLog( Player , 1205520 , "Complete" )	-- ����
			GiveBodyItem( Player , 204218 , 1 )			--�����a�F����*1
			SetFlag( Player , 546229 , 0 )				--�����C���m��
			CancelBuff( Player , 622174 )
		elseif score>=3 then						--3��
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_11]")	--�����u�n!
			DesignLog( Player , 1205520 , "Complete" )	-- ����
			GiveBodyItem( Player , 204218 , 2 )			--�����a�F����*2
			SetFlag( Player , 546229 , 0 )				--�����C���m��
			CancelBuff( Player , 622174 )
		else
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_09]")	--�u�i���U���A�V�O�a
			DesignLog( Player , 1205520 , "Complete" )	-- ����
			GiveBodyItem( Player , 724266 , 1 )			--�������Ĥ��H����*1
			SetFlag( Player , 546229 , 0 )				--�����C���m��
			CancelBuff( Player , 622174 )
		end

--	elseif Played==false then	--1�����S���i�O�ڦ���
--		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_09]")		--�u�i���U���A�V�O�a
--		GiveBodyItem( Player , 202903 , 1 )				--�������y
--		SetFlag( Player , 546229 , 0 )					--�����C���m��
	end

end
----------------------------------------------------------------------------------
--���������q
----------------------------------------------------------------------------------

function lua_nehelia_easter_GameSet()	--�x�l�۰ʺإX�]���]�w�x�l�Ұ�
	local AC = OwnerID()
	local room = ReadRoleValue(AC,EM_RoleValue_RoomID)
	local CircleBar = 120559--�C���]��
	local BarTable = {}

	SetModeEx( AC, EM_SetModeType_ShowRoleHead, FALSE )	--�Y����
	Nehelia_FES_Global[room] = Nehelia_FES_Global or {}
	Nehelia_FES_Global[room][AC] = {}
		for i = 1 , 10  do
		local pos = 281+(18*(i-1))
			BarTable[i] = KORS_CreateObjPosition(CircleBar,AC,120,pos)
			SetModeEx(BarTable[i],EM_SetModeType_ShowRoleHead, FALSE )	--�Y�ۮ�
			SetModeEx(BarTable[i],EM_SetModeType_SearchenemyIgnore, FALSE )
			SetModeEx(BarTable[i], EM_SetModeType_Obstruct, TRUE )		--����
			SetModeEx(BarTable[i],EM_SetModeType_Mark,FALSE  )		--�аO
			MoveToFlagEnabled(BarTable[i],FALSE) 
			AdjustFaceDir( BarTable[i] , AC , 0 )
			AddToPartition(BarTable[i],room)
		end
		SetPlot(AC,"touch","lua_nehelia_easter_GameStay",5)
end



function lua_nehelia_easter_GameStay()--�i�l�ݾ����A
	local Player = OwnerID()
	local ctrl = TargetID()		--�o���O�ߤl
	local CheckCoin = CheckBuff(Player,622215)					--�ˬd���a���W���S���C����

	SetPlot(ctrl,"touch","",0)

		if CheckCoin == FALSE then						--�S���C��Coin
			ScriptMessage(ctrl,Player,1,"[SC_EASTER_2012NE_12]",C_SYSTEM)	--��p�A�S������
			SetPlot(ctrl,"touch","lua_nehelia_easter_GameStay",5)		--���m���xtouch�@��
		elseif CheckCoin == TRUE and Lua_Mounts_Copilot( Player) == TRUE then	--���C��Coin
--			Say(ctrl,"game Start")
			WriteRoleValue(Player,EM_RoleValue_Register1,3)		--�p�ȦbPlayer���W,�T���u�í�
			DW_CancelTypeBuff( 68, Player )				--�������a���M
			AddBuff( Player , 622216 , 1 , 70 )				--�����m�u�޾ɪk�N,1��,60��
			AddBuff( Player , 622174 , 2 , -1)				--�����C������
--			AddBuff( Player , 622415 , 1 , -1)				--�����C���������z�ZBuff
			KORS_FirstPersonSee(player,"ON")				--��Player�w��+�����
			SetFlag( Player , 546229 , 0 )					--�����C���m��
			CancelBuff(Player, 622215)					--�R���C��Coin
			WriteRoleValue(ctrl,EM_RoleValue_PID,Player)			--�C�����x�O��

			BeginPlot(ctrl,"lua_nehelia_easterGing",0)
		elseif Lua_Mounts_Copilot(Player) == FALSE then
			ScriptMessage(Player,Player,1,"[SC_EASTER_2012NE_24]",C_SYSTEM)		--�������M���A�U�L�k�}�l�C���C
			SetPlot(ctrl,"touch","lua_nehelia_easter_GameStay",5)
		end
end



function lua_nehelia_easterGing()	--�C���Ұ�(������)
	local Arcade = OwnerID()	
	local room = ReadRoleValue(Arcade,EM_RoleValue_RoomID)
	local time = 0
	local Global =  Nehelia_FES_Global[room]
	local turtleBox = {}
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)

	Global[Arcade] = { game = 1,boom = 0,Phase = 1}	--��������x�������ܼ�, game = 1�ɹC���Ұʤ��Bboom = �Q�Q�t�Ĩ즸�ơA�T�����ѡC
		
		for x = 0,9 do	--�˼ƶ}�l
			if CheckID(Player) == false then				--���a�_�u�εn�X���x�ȲM��	
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				BeginPlot(arcade,"lua_nehelia_easterGend",0)
				return
			end 
			if ReadRoleValue(Player,EM_RoleValue_IsDead) ~=0 then	--���a��¼¼���x�ȲM��+���a�����k0
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				WriteRoleValue(Player,EM_RoleValue_Register1,0)
				CancelBuff(Player,622174)
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				return
			end
			if Lua_Mounts_Copilot(Player) == false then		--���a�C�����W���N�����L�����C
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_25]", C_SYSTEM )		--�C�����T���M�����M�A�C�����ѡI
				WriteRoleValue(Player,EM_RoleValue_Register1,0)				--�����k�s
				CancelBuff(Player,622174)
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				return				
			end

			ScriptMessage( Player , Player , 1, (10-x).."[SC_EASTER_2012NE_23]", C_SYSTEM )	--X���C���}�l�A�зǳƨýվ�n����
			Sleep(10)

		end

		ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_13]", C_SYSTEM )	--�Q�t�j�x��ŧ!!

		for i = 1, 6 do
			local pos = 315+(i-1)*20
			turtleBox[i] = KORS_CreateObjPosition(120583,Arcade,100,pos)			--�Хͩǽc
				WriteRoleValue(turtleBox[i],EM_RoleValue_PID,Arcade)			--�g���ͩǽcŪ�����ܼƥ�
				SetModeEx(turtleBox[i],EM_SetModeType_Show, FALSE )			--���
				SetModeEx( turtleBox[i], EM_SetModeType_ShowRoleHead, FALSE )	--�Y����
				SetModeEx( turtleBox[i], EM_SetModeType_SearchenemyIgnore, FALSE )	--�Q�j�M
				SetModeEx( turtleBox[i], EM_SetModeType_Obstruct, TRUE )		--����
				SetModeEx(turtleBox[i], EM_SetModeType_Mark,FALSE  )			--�аO
				AdjustFaceDir( turtleBox[i],Arcade,0 )
				MoveToFlagEnabled(turtleBox[i],false)
				BeginPlot(turtleBox[i],"lua_nehelia_TurtleRun",0)				--�ͥX�Q�t�ֶ]!
				AddToPartition(turtleBox[i],room)
		end

		while TRUE do
			if Lua_Mounts_Copilot(Player) == false then				--���a�C�����W���N�����L�����C
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_25]", C_SYSTEM )	--�C�����T���M�����M�A�C�����ѡI
				WriteRoleValue(Player,EM_RoleValue_Register1,0)			--�����k�s
				CancelBuff(Player,622174)
--				CancelBuff(Player,622415)
					for x = 1,#turtleBox do			--�_
						DelObj(turtleBox[x])		--�_
					end					--�_
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break						--�_
			end

			if CheckID(Player) == FALSE then					--���a�_�u�εn�X���x�ȲM��	
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
					for x = 1,#turtleBox do			--�_
						DelObj(turtleBox[x])		--�_
					end					--�_
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break
			end 
			if ReadRoleValue(Player,EM_RoleValue_IsDead) ~=0 then			--���a��¼¼���x�ȲM��+���a�����k0
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				WriteRoleValue(Player,EM_RoleValue_Register1,0)
				CancelBuff(Player,622174)
--				CancelBuff(Player,622415)
					for x = 1,#turtleBox do			--�_
						DelObj(turtleBox[x])		--�_
					end					--�_
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break
			end


		--�H�U�����`���p�U�Ӷ]��
			if time > 40 and Global[Arcade].Phase ~= 2 then					--�ɶ������2���q����
				Global[Arcade].Phase = 2
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_15]", C_SYSTEM )	--�̫�@�iŧ���A�n�����!
			end

			if time >= 60 then								--����
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }				--�C������
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_16]", C_SYSTEM )	--���\�u��F�Ԥ�ߤαm�J�I�V[120552]��������a
					for x = 1,#turtleBox do
						DelObj(turtleBox[x])
					end			
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				break
			end

			if Global[Arcade].boom >= 3 then						--�Q����T������
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }	
					for x = 1,#turtleBox do
						DelObj(turtleBox[x])
					end	
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				break
			end

		time = time +1	
		Sleep(10)
		end

end


function lua_nehelia_TurtleRun()	--�ͯQ�t�����
	local RunCtrl = OwnerID()
	local room = ReadRoleValue(RunCtrl,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]								--�]�w�����ܼƸs��
	local Arcade = ReadRoleValue(RunCtrl,EM_RoleValue_PID)					--Ū������
	local turtle = Nehelia_FES_Global["turtle"]							--�����ܼƯQ�t
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)						--Ū���a
	local R 
	local hapn = Nehelia_FES_Global["happen"]							--�����ܼƾ��v

		while TRUE do										--�۰���j��A�гy�Q�t�X��			

			if Global[Arcade].Game ~= 1 then						--�ɶ���ۧR
				DelObj(RunCtrl)
				break
			 end				

		local type =Global[Arcade].Phase							--�s�ո�T�A�ثe���q
		local Rnd = Rand(99)
		local RNG1 = hapn[type].poss1 
		local Rng2 = hapn[type].poss2
		local timeRnd = RandRange(7,10) * 10							--�Ĥ@���q�H����ƥͩ�

			if type == 2 then
				timeRnd = RandRange(4,7) * 10						--�ĤG���q�X�ǳt�ױ���
			end

			if Rnd < RNG1 then								--���v�P�_
				R = 1
			elseif Rnd >= RNG1 and Rnd < Rng2 then
				R = 2
			elseif Rnd >= Rng2 then
				R = 3
			end

		local Runner = LuaFunc_CreateObjByObj( turtle[R].ID, RunCtrl )				--���ͯQ�t
--				MoveToFlagEnabled(Runner,false)
	 			WriteRoleValue(Runner,EM_RoleValue_PID,Arcade)			--��
				SetModeEx( Runner, EM_SetModeType_ShowRoleHead, TRUE )
				AddBuff(Runner,622219,turtle[R].Buff,-1)					--�Q�t�t�׽վ�
				BeginPlot(Runner,"lua_nehelia_easterTurtle",0)
				SetPlot(Runner,"range","lua_nehelia_easter_turtleRange",10) 
				AddToPartition(Runner,room)
		Sleep(timeRnd)
		end
end
	

function lua_nehelia_easterGend()	--�C��������缾�a�Ӱ����Ʊ�
	local Arcade = OwnerID()
	local room = ReadRoleValue(Arcade,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
		CancelBuff( Player, 622216 )							--�����g���ޯ� 
--		CancelBuff( Player, 622415 )							--�����C���������v�TBuff
		SetFlag( Player, 546229, 1 )							--���}�C���m��Flag
		SetFlag( Player, 546288, 1 )							--���}�@�q���y��Flag
		KORS_FirstPersonSee(player,"Off")						--�Ѱ�����
--		Global[Arcade] = {game= 0,boom = 0,Phase = 0 }					--�C������
		Sleep(30)
		WriteRoleValue(Arcade,EM_RoleValue_PID,0)					--�M�ž��x�O�����a��
		SetPlot(Arcade,"touch","lua_nehelia_easter_GameStay",5)				--���s�}�x
end


function lua_nehelia_easterTurtle()	--�Q�t���W�۶]�߬d�j��
	local turtle = OwnerID()
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
	local room = ReadRoleValue(turtle,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
	local Dis
		 KORS_MoveByObj(turtle,Arcade)						--�]�V�C�����x
		while TRUE do								
			if Global[Arcade].Game ~= 1 then					--�ˬd�O�_�C������
				DelObj(turtle)
			end
			
			if ReadRoleValue(turtle,EM_RoleValue_Register1) ~= 0 then
				DelObj(turtle)
			end

--			if CheckDistance( turtle, Arcade, 5) ==TRUE then					--�߬d�Z���O�_����
--				local boomEd = Global[Arcade].boom
--				local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)		--Ū���a�ثe����
--				AddBuff ( Player , 622217 , 0 , -1 )					--�w�t
--				WriteRoleValue(Player,EM_RoleValue_Register1,PlayerSC-1)		--���榩��
--				ScriptMessage( Player , Player , 0, "PlayerPoint"..PlayerSC.."/3", 0 )		--�٦�PlayerSC/3��!
--				Global[Arcade].boom = boomEd +1	
--				Say(turtle,Global[Arcade].boom)						--�Q�t���{�b�z�X��
--				Sleep(5)
--				DelObj(turtle)
--			end		
		Sleep(5)
		end 
end


function lua_nehelia_easter_turtleRange()	--�d��@���A�P�_��x�l�b�Z�����~�����z��
	local Player = OwnerID()
	local turtle = TargetID()
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
	local room = ReadRoleValue(turtle,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
 	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
	local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)				--Ū���a�ثe����

	AddBuff ( Player , 622217 , 0 , 2 )							--�w�t
	WriteRoleValue(Player,EM_RoleValue_Register1,PlayerSC-1)				--���榩��
		if Global[Arcade].boom ~= nil then
	Global[Arcade].boom = Global[Arcade].boom +1
		end
		if PlayerSC>=2 then
			ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_14]".."[SC_EASTER_2012NE_18]".. PlayerSC-1, C_SYSTEM )	--�D�������A�ѤU���Ƭ��G
				if PlayerSC-1>=0 then
				KORS_buffUpDown( Player , 622174 , 1 , 1 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
				end
		else
			ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_17]", C_SYSTEM )			--�D���Ӧh�������A���ѤF
			CancelBuff( Player , 622174 )
		end

--	Say(turtle,Global[Arcade].boom)	--�Q�t���{�b�z�X��
	Sleep(5)
	DelObj(turtle)
end


function lua_nehelia_easter_Fire()	--�g��Q�t���@��
	local Player = OwnerID()		--���a
	local turtle = TargetID()		--�Ӧ����Q�t
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)	--�ߤl���x
	local Boom=ReadRoleValue(turtle,EM_RoleValue_OrgID)

		if Boom==120555 then
			SysCastSpellLv( turtle ,turtle , 499277 , 0) 	 --�k�N���X
			SetPlot(turtle,"range","lua_nehelia_easter_FireBooM",30)
			WriteRoleValue(turtle,EM_RoleValue_Register1,1)
		else
	--		Hide(turtle,0)
			DelObj(turtle)
		end

end


function lua_nehelia_easter_FireBooM()	--�w�t��
local Player = OwnerID()
	AddBuff ( Player , 622217 , 0 , 2 )
	ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_14]", C_SYSTEM )			--�D���Ӧh�������A���ѤF
end


function lua_nehelia_easter_FireCheck()	--�߬d�k�N
	local Player = OwnerID()
	local Tag = TargetID()
	local TagOid = ReadRoleValue(Tag,EM_RoleValue_OrgID)

		if tagOid==120553 or tagOid==120554 or tagOid==120555 then
			return TRUE
		else		
			return FALSE
		end
end


function lua_nehelia_easter_Del()	--�Ԥ�߱m���R��
	local Player = OwnerID()
		SetFlag ( Player , 546229 , 0 )
end



--------------------------------------------------------------------------------------------------------------
--�ĤGNPC���ܤ��e
--------------------------------------------------------------------------------------------------------------

function lua_nehelia_easter_Npc01()--2��NPC������
	local Player=OwnerID()
	local NPC=TargetID()
	local score = ReadRoleValue(Player,EM_RoleValue_Register1)	--�C������ 

		if score>=3 then
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_22]" )--����I�A�~�M�����L���F�A�o���i��I
			GiveBodyItem( Player , 530894 , 1 ) --�����m�J�g��ٸ����y
		else
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_19]" )--�ڰڡI�쩳�ӫ���}�̫ᨺ�@�i�C�ѬO�b�̫�@�i���d���ѡA�n�i�c��I
			AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_20]" , "lua_nehelia_easter_Npc02", 0 )--�̫����d�O����
		end
end


function lua_nehelia_easter_Npc02()--2��NPC���̫����d
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_21]" )--�N�O�o�ӹC���ڡA�n��ׯQ�t�������C
end

--------------------------------------------------------------------------------------------------------------
--���եΦۦ浹��
--------------------------------------------------------------------------------------------------------------

function lua_nehelia_easter_GiveP()--�ۤv����
	local Player=OwnerID()
	local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)				--Ū���a�ثe����

	if PlayerSC==0 then
		WriteRoleValue(Player,EM_RoleValue_Register1,1)					--�p�ȦbPlayer���W,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--�ثe��o���ơGPlayerSC
	elseif PlayerSC==1 then
		WriteRoleValue(Player,EM_RoleValue_Register1,2)					--�p�ȦbPlayer���W,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--�ثe��o���ơGPlayerSC
	elseif PlayerSC==2 then
		WriteRoleValue(Player,EM_RoleValue_Register1,3)					--�p�ȦbPlayer���W,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--�ثe��o���ơGPlayerSC
	else
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--�ثe��o���ơGPlayerSC
	end

end