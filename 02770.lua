
--====================================���W�@��===========================================================
function teacatodo_121473_speak() --��ܼ@��
	local Owner = OwnerID()
	local Target = TargetID()
	local brother=ReadRoleValue(Target , EM_RoleValue_Register2)----�����O�_�i�H���W 0��ܥi�H 1��ܤ��� 
	local Player = SearchRangePlayer( Owner , 10)
	local secondseat = Lua_Mounts_Copilot( Owner )--���L�M�����H�y�M
	for i = 0 , table.getn( Player) do
		DW_CancelTypeBuff(68,Player[i])--�M�����M�ɡA�I���U��	
	end
	if CheckFlag(Owner,547132)==true and CheckBuff( Owner , 623637 )==true then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--���ʵ���
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --������y�I
	elseif CheckFlag(Owner,547132)==true then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC10]")--�ˬd���L�Q�^�O
	else
		if CheckFlag(Owner,547131)==true then--�ˬd���L������y
			SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC06]")

		elseif CheckFlag(Owner,547130)==true then--���ˬd���a�O�_���L
			SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--���ʵ���
			AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --������y�I

		else 

			if brother == 1 then --��ܤ��i���W
				SetSpeakDetail(Owner , "[SC_2012_TEACATODO_NPC09]") --�ڤw�g��F�X�ӫi��...
		
			else
				SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC01]") --�u�O���A�i���@�j����W�@�_�������N...
				if CheckBuff(Owner,623627) ==true then
					SetSpeakDetail( Owner  ,"[SC_2012_TEACATODO_NPC11]"  )--���a���ܨ�BUFF�U���
				elseif CheckFlag(Owner,547133)==true then--�ˬd���L���u�L
					SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--���ʵ���
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --������y�I
					SetFlag(Owner,547130,1)
				else	
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT01]" ,  "teacatodo_121473_speak2",0 )--�аݥi�H���o��ԲӤ@�I�ܡH
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 ) --���n�N��A�ڨS����
				end
			end
		end
	end
end


function teacatodo_121473_speak2() --������
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue(Target , EM_RoleValue_Register2)
	if  brother==0 then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC02]")--�گR�b���~���ӹA���d���کM�ڭ�...
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT03]" ,  "teacatodo_121473_speak3",0 )--�������ӫ�򰵡H
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121473_start",0 )--�����F�A���N��ڰe�L�h�a
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 )--���n�N��A�ڨS����
	end
end


function teacatodo_121473_speak3() --�W�h����
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue( Target , EM_RoleValue_Register2)
	if  brother == 0 then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC03]") --�ڷ|����A�e�L�h...
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121473_start",0 )--�����F�A���N��ڰe�L�h�a
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 )--���n�N��A�ڨS����
	end
end

function teacatodo_121473_speak4() --���ѥ[����
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC04]") --��A�S�t...
end

--====================================���ʳ����@��==========================================================

function teacatodo_121473_start() --���ʶ}�l�A�������a2����������BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue( Target , EM_RoleValue_Register2)
	local secondseat = Lua_Mounts_Copilot( Owner )--���L�M�����H�y�M
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	DW_CancelTypeBuff(68, Owner)
	CloseSpeak( Owner)
	if  brother == 0 and checkbuff(Owner , 623700 )== false then
		if secondseat == false then --���b��y
			ScriptMessage( Owner , Owner , 1 , "[SC_2012_TEACATODO_WARNING6]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
		else
			SysCastSpellLv(Owner,Target,850434,0)
			setflag(Owner, 547133, 1)  
			SetPos(Owner, 203.7, 74.0, -230.1, 0 )
			AddBuff( Target , 623700 , 0 , 1 )	-- �I��@��1�������k�N
		end
		DesignLog( Owner , 121473 , "Lv = "..Lv.." SubLv = "..SubLv )--�^�Ǭ��ʰѻP��
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_Z21_Q424542_03]" , 0 ) --�ؼЦ��L��
	end
end


function Teacat_egg_BuffValue()--���ʵ����A�p�����
	local Owner = OwnerID()
	local BuffID = 623635
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
		WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	if BuffLv ==-1 then
		ScriptMessage(Owner,Owner,3,"[SC_2012_TEACATODO_BUFFSCORE]",0) 
		if checkbuff( Owner, 623627) == false then
			CancelBuff(Owner , 623635 )--���d���b�k�J
			CancelBuff(Owner , 623673 )--�[�
			CancelBuff(Owner , 623676 )--��W����
			CancelBuff(Owner , 623677 )--�h�ä�
			CancelBuff(Owner , 623679 )--ĵ�٤�
			CancelBuff(Owner , 623688 )--ĵ�ٵ{��
		end
	else
		ScriptMessage(Owner,Owner,3,"[SC_2012_TEACATODO_BUFFSCORE]",0) 
		if checkbuff( Owner, 623627) == false then
			CancelBuff(Owner , 623635 )--���d���b�k�J
			CancelBuff(Owner , 623673 )--�[�
			CancelBuff(Owner , 623676 )--��W����
			CancelBuff(Owner , 623677 )--�h�ä�
			CancelBuff(Owner , 623679 )--ĵ�٤�
			CancelBuff(Owner , 623688 )--ĵ�ٵ{��
		end

		addbuff(Owner,623637,BuffLv,180)
	end
		SetFlag(Owner,547130,1)
		setflag(Owner,547133,0)
end


function teacatodo_121473_getgift()--�������y
	local Owner=OwnerID()
	local Target=TargetID()
	local BuffID = 623637
	local Bufflv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC07]")
	if Score==-1 or checkflag(Owner,547133)==true then
		GiveBodyItem(  Owner, 724059 , 1 )	
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC08]")--�w����
	elseif Score<=19 then
		GiveBodyItem(Owner,206266,1)--�����y1
	elseif Score<=39 then
		GiveBodyItem(Owner,206266,2)--�����y2
	else 
		GiveBodyItem(Owner,206266,3)--�����y4
	end

	setflag(Owner,547131,1)
	CancelBuff( Owner , 623635 )
	CancelBuff( Owner , 623637 )	
	Lua_Festival_11_All(Owner)
	DesignLog( Owner , 1214731 , "Lv = "..Lv.." SubLv = "..SubLv )--�^�Ǭ��ʰѻP��

end
--====================================�ޯ�@��===========================================================

function Teacat_egg_Skill1()--�ޯ�1���b�k�s
	local Player = OwnerID()
	local Npc = TargetID()
	local BuffID = 623677
	local BuffID2 = 623679
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
	local BuffLv2 =  FN_CountBuffLevel(Player,BuffID2)
	local R = Rand(9)
	if CheckBuff(player, 623677) == false and CheckBuff(player, 623679) == false then
		if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
	end

	if BuffLv >=1 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
			Cancelbuff( Player , BuffID)
			AddBuff(Player ,BuffID,BuffLv-1,-1)
		end

	elseif BuffLv == 0 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			Cancelbuff( Player , BuffID)
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end	
		end
	end


	if BuffLv2 >=1 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
			Cancelbuff( Player , BuffID2)
			AddBuff(Player ,BuffID2,BuffLv2-1,-1)
		end

	elseif BuffLv2 == 0 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			Cancelbuff( Player , BuffID2)
			Cancelbuff_NoEvent( Player ,  623688)
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end	
		end
	end
end

function Teacat_egg_Skill2()--�ޯ�2�����D
	local Player = OwnerID()
	local Npc = TargetID()
	local BuffID = 623673
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
	
	if BuffLv >=1 then	
		Cancelbuff( Player , BuffID)
		AddBuff(Player ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Player , BuffID)	
	end
end

--====================================�J���@��===========================================================

function Teacat_egg_Hideitem()--�����W���_��H(������)�ϥͫ�A�����|�X�{n����l�b�k�J
	GlobalTempTable = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29}--�����ܼ�(�b�k�J�����ͩ�P��)
	local player = OwnerID()
	local egg
	for i=1,15 do
		local R = Rand(#GlobalTempTable)+1
		egg = CreateObjByFlag(121486 , 781202,GlobalTempTable[R] , 1 )  --���ͳJ�bR����m
		WriteRoleValue(egg ,EM_RoleValue_PID,GlobalTempTable[R]);         --�N�J�g�Jtable��
		SetModeEx(egg    ,EM_SetModeType_Show , true )                                --���
		SetModeEx( egg    , EM_SetModeType_Strikback, false ) 	    --����
		SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false)  --�Q�j�M
		SetModeEx( egg    , EM_SetModeType_Obstruct, true )	 	    --����
		SetModeEx( egg    , EM_SetModeType_Mark, true )		    --�аO
		SetModeEx( egg   , EM_SetModeType_Move, false )		    --����
		SetModeEx( egg  , EM_SetModeType_Searchenemy, false )	    --����
		SetModeEx( egg   , EM_SetModeType_HideName, false )	    --�W��
		SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )	    --�Y����
		SetModeEx( egg , EM_SetModeType_Fight , false )		    --�i�������
		SetModeEx( egg   , EM_SetModeType_Gravity, true )		    --���O	
		AddToPartition(egg ,0)						    --�N���ê��J��ܥX��
		SetPlot( egg ,"touch","Teacat_egg_click",20 )			    --�IĲ�@��
		table.remove(GlobalTempTable,R);				    --�N�Q�IĲ���J�q�ثe��m����
	end
end

function Teacat_egg_click()--�IĲ�@���A��J�Q�I����...
	local player = OwnerID()
	local localegg = TargetID()
	Lua_Hao_Check_SetPlot_Touch( Player )


	if CheckBuff( player , 623627) == true then--���a������Buff...
		Lua_FE_Reset(player)
		if BeginCastBarEvent(player, localegg, "[SC_2012_TEACATODO_GET]", 10, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0, "Teacat_egg_click2" )~=1 then
		end
	else
		ScriptMessage( player ,player,2,"[SC_2012_TEACATODO_EGG]",C_SYSTEM ) --�r��--�o�O�@���s�A���b�k�J
	end
end

function Teacat_egg_click2(ObjID, CheckStatus)--�IĲ�@���A��J�Q�I����...
	local player = OwnerID()
	local localegg = TargetID()
	local NM = ReadRoleValue(localegg ,EM_RoleValue_PID);
	local RR = Rand(#GlobalTempTable)+1
	if( CheckStatus > 0 ) then
		if Checkbuff(Player,  623627) == true then
			if checkbuff( Player, 623635) == false then
				ScriptMessage(Player,Player,3,"[SC_2012_TEACATODO_WARNING]",0) 
				DelObj(localegg)	                   --���Q�I�����J����
				AddBuff ( player, 623633, 0, -1 )     --��J���ޯ�
				AddBuff ( player, 623635, 0, -1 )     --��o�b�k�J����
				local egg = CreateObjByFlag(121486,781202,GlobalTempTable[RR] , 1 )    --���ͪ���brr����m
				WriteRoleValue(egg,EM_RoleValue_PID,GlobalTempTable[RR])		  --�N�J�g�Jtable��
				SetModeEx(egg    ,EM_SetModeType_Show , true ) 			  --���
				SetModeEx( egg    , EM_SetModeType_Strikback, false )			  --����
				SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false )	  --�Q�j�M
				SetModeEx( egg    , EM_SetModeType_Obstruct, true )			  --����
				SetModeEx( egg    , EM_SetModeType_Mark, true )			  --�аO
				SetModeEx( egg   , EM_SetModeType_Move, false )			  --����
				SetModeEx( egg  , EM_SetModeType_Searchenemy, false )		  --����
				SetModeEx( egg   , EM_SetModeType_HideName, false )		  --�W��
				SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )		  --�Y����
				SetModeEx( egg , EM_SetModeType_Fight , false )			  --�i�������
				SetModeEx( egg   , EM_SetModeType_Gravity, true )			  --���O
				AddToPartition(egg , 0 )						  --�N���ê��J��ܥX��
				Hide( egg )
				CallPlot( egg , "Teacat_egg_click3" , egg , 100 )
				table.remove(GlobalTempTable,RR);					  --�N�Q�IĲ���J�q�ثe��m����
				table.insert(GlobalTempTable,NM);					  --�N�Q�IĲ���J���ܷs��table
				EndCastBar( player, CheckStatus );
			else
				DelObj(localegg)	                   --���Q�I�����J����
				AddBuff ( player, 623633, 0, -1 )     --��J���ޯ�
				AddBuff ( player, 623635, 0, -1 )     --��o�b�k�J����
				local egg = CreateObjByFlag(121486,781202,GlobalTempTable[RR] , 1 )    --���ͪ���brr����m
				WriteRoleValue(egg,EM_RoleValue_PID,GlobalTempTable[RR])		  --�N�J�g�Jtable��
				SetModeEx(egg    ,EM_SetModeType_Show , true ) 			  --���
				SetModeEx( egg    , EM_SetModeType_Strikback, false )			  --����
				SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false )	  --�Q�j�M
				SetModeEx( egg    , EM_SetModeType_Obstruct, true )			  --����
				SetModeEx( egg    , EM_SetModeType_Mark, true )			  --�аO
				SetModeEx( egg   , EM_SetModeType_Move, false )			  --����
				SetModeEx( egg  , EM_SetModeType_Searchenemy, false )		  --����
				SetModeEx( egg   , EM_SetModeType_HideName, false )		  --�W��
				SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )		  --�Y����
				SetModeEx( egg , EM_SetModeType_Fight , false )			  --�i�������
				SetModeEx( egg   , EM_SetModeType_Gravity, true )			  --���O
				AddToPartition(egg , 0 )						  --�N���ê��J��ܥX��
				Hide( egg )
				CallPlot( egg , "Teacat_egg_click3" , egg , 100 )
				table.remove(GlobalTempTable,RR);					  --�N�Q�IĲ���J�q�ثe��m����
				table.insert(GlobalTempTable,NM);					  --�N�Q�IĲ���J���ܷs��table
				EndCastBar( player, CheckStatus );
			end
		else
			EndCastBar( player, CheckStatus );
		end
		
	else
		EndCastBar( player, CheckStatus );
--	--	say(Player,"get egg is error")	
	end
end	

function Teacat_egg_click3( egg , Sec )

	Sleep(Sec)
	Show (egg, 0)
	SetPlot( egg ,"touch","Teacat_egg_click", 20 )				  --���жi�J�I���@��
end

function Teacat_egg_rangeskill()--�J�|�i�汽�y���ޯ�A����npc�|��npc�ԹL�h
	local Egg = OwnerID()
	local Player = TargetID()
	local BuffID = 623635
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
--	say(Player,"aa")
	--say(Npc,"11")
	if BuffLv >=1 then
		Cancelbuff( Player , BuffID)
		AddBuff(Player ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Player , BuffID)
	end

	while true do
	Sleep(10)	
--	say(Egg,"1")
--	say(Npc,"a")
		CastSpell( Egg, Egg , 850441)
	end
end

function Teacat_egg_rangeskill2()--����npc�|��npc�ԹL�h
	local Egg = OwnerID()
	local Npc = TargetID()--�P�w�����a
	local CheckNpc = { 121472, 121474 }
	
	local Num = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- 121472
	--say(Egg,"1")
--	say(Npc,"a")

	for i = 1 , #(CheckNpc) , 1 do	
		if Num == CheckNpc[i] then
			local Egg_X = ReadRoleValue( Egg , EM_RoleValue_X )
			local Egg_Y = ReadRoleValue( Egg , EM_RoleValue_Y )
			local Egg_Z = ReadRoleValue( Egg , EM_RoleValue_Z )
			local Range
			for i = 1 , 10 , 1 do
				Range = Math.random( Rand(-41)-10 , Rand(41)+10 )
				Egg_X = Egg_X+Range
				Egg_Z = Egg_Z+Range
				Egg_Y = GetHeight( Egg_X , Egg_Y , Egg_Z )
			--	if CheckLine( Npc , Egg_X , Egg_Y , Egg_Z ) == true then
					MoveDirect( Npc , Egg_X , Egg_Y , Egg_Z )
					WriteRoleValue( Npc ,EM_RoleValue_IsWalk , 0  )
					break
			--	end
			end
		end
	end
end






--====================================���ޤH���@��=========================================================
function Teacat_egg_FramNPC()----�A���D�H�|���_���y���W������Buff�����a
	local Npc = OwnerID()
	local Player = TargetID()
	local BuffID1 = 623677
	local BuffLv1
	while true do
	Sleep(10)

		CastSpell( Npc, Npc , 850440)--���汽�y�ޯ�1�@��
	--	SysCastSpellLv( Npc, Npc , 850442, 0)--���汽�y�ޯ�2�@��
	--	SysCastSpellLv( Npc, Npc , 850453 , 0)--���汽�y�ޯ�3�@��
	end
end

function Teacat_egg_FramNPCskill()----�A���D�H���ޯ�A�u�n���a������buff�Q�L�ݨ�|��Debuff(�h�ä�)
	local Npc = OwnerID()
	local Player = TargetID()
	local BuffID1 = 623677
	local BuffLv1
	if CheckBuff(player , 623635) == true then--�p�G���߳J...
		BuffLv1 = Lua_Hao_Return_Buff_Lv( Player  , BuffID1 )
		if checkbuff(player, 623679) ==false then
			if CheckBuff(player , BuffID1)== false then
				say(Npc, "[SC_2012_TEACATODO_FRAMNPC02]" )
		    		AddBuff ( player,623677, 0, -1 ) --�|��DeBuff�����a
			--	addBuff ( Player, 623700, 0, 1 )
			else

				AddBuff ( player,623677, 0, -1 ) --�|��DeBuff�����a
				if BuffLv1>4 then	
					if checkbuff(player, 623679) ==false then
						say(Npc,"[SC_2012_TEACATODO_FRAMNPC01]")
					end
						AddBuff ( player, 623679, 9, -1 )
						AddBuff ( player, 623688, 0, -1 )
						CancelBuff(player , 623676 )
						CancelBuff(player , 623677 )
						CancelBuff(player , 623700 )
				end
			--	addBuff ( Player, 623700, 0, 1 )
			end
		end
	end
end

--function Teacat_egg_FramNPCskill2()--�A���D�H���ޯ�2�A�u�n���a��Debuff(�h�ä�)5�h�A�Q�L�ݨ�|��Debuff(ĵ�٤�)
--	local Npc = OwnerID()
--	local Player = TargetID()
--	local BuffID1 = 623677
--	local BuffLv1
--	if CheckBuff(player , BuffID1)==true then
--		BuffLv1 = Lua_Hao_Return_Buff_Lv( Player  , BuffID1 )
--		if BuffLv1>4 then	
--			if checkbuff(player, 623679) ==false then
--				say(Npc,"[SC_2012_TEACATODO_FRAMNPC01]")
--				AddBuff ( player, 623679, 9, -1 )
--				AddBuff ( player, 623688, 0, -1 )
--				CancelBuff(player , 623676 )
--				CancelBuff(player , 623677 )
--				CancelBuff(player , 623700 )
--				
--			end
--		end
--	end
--end

function Teacat_egg_timesup()--ĵ�ٮɶ���
	local Player = OwnerID()
	CancelBuff(Player, 623679)
	CancelBuff(Player, 623673)
	CancelBuff(Player, 623676)
	if CheckBuff(Player, 623627)==true then
		CancelBuff(Player, 623627)
		ScriptMessage(Player,Player,1,"[SC_2012_TEACATODO_WARNING2]",0)
	end
	BeginPlot(Player,"Teacat_egg_BuffValue",0)
end	




---------------------------------------------------------------------------�A���k�D�H���ޯ�
function Teacat_egg_FramNPC2()----�A���k�D�H�|���_���y���W������Buff�����a
	local Npc = OwnerID()
	while true do
	Sleep(15)
		local R = Rand(9)
		if R >= 2 then	
			CastSpell( Npc, Npc , 850443)--���汽�y�ޯ�@��
			
		else
			CastSpell( Npc, Npc , 850448)--���汽�y�ޯ�@��2
		end
		CastSpell( Npc, Npc , 850453)--���汽�y�ޯ�3�@��	
	end
end

function Teacat_egg_FramNPC2skill()----�A���k�D�H���ޯ�A�u�n���a������buff�Q�L�ݨ�|��Debuff(�[�)
	local Npc = OwnerID()
	local Player = TargetID()
	if CheckBuff(player , 623635) == true then--�p�G���߳J...
--		if CheckBuff(Player, 623679)==false then
			if CheckBuff(player , 623673)==false then
				say(Npc,"[SC_2012_TEACATODO_FRAMNPC03]")
	    			AddBuff ( player,623673, 0, -1 ) --�|��DeBuff�����a
			--	addBuff ( Player, 623700, 0, 1 )
			else
				AddBuff ( player,623673, 0, -1 ) --�|��DeBuff�����a
			--	addBuff ( Player, 623700, 0, 1 )	
			end	
	--	end
	end
end


function Teacat_egg_FramNPC2skill2()
	local Npc = OwnerID()
	local Player = TargetID()
	if CheckBuff(player , 623635) == true then--�p�G���߳J...
		if CheckBuff(Player, 623679) ==false then
			if CheckBuff(player , 623676)==false then
				say(Npc,"[SC_2012_TEACATODO_FRAMNPC04]")
				AddBuff ( player,623676, 0, 3 ) --�|��DeBuff�����a
			else
	    			AddBuff ( player,623676, 0, 3 ) --�|��DeBuff�����a
			end
		end
	end
end

----====================================���ʽd�򪺼@��=======================================================
function teacatodo_121473_Range()--���ʽd��
	local NPC = OwnerID()--npc
	local NW = SearchRangeNPC(Npc , 700)
	local Players = { }
	for i =0, table.getn(NW) do 
	local OrgID = ReadRoleValue(NW[i], EM_RoleValue_OrgID)
		if OrgID==121473 then 
			WriteRoleValue(Npc, EM_RoleValue_Register3, NW[i])
			WriteRoleValue(NW[i], EM_RoleValue_Register3, Npc)
			break
		end
	end

	while true do
		sleep(10)
		local GTplayer = SearchRangePlayer(Npc, 500)
		local brother = ReadRoleValue(Npc, EM_RoleValue_Register3)
		local tic=0 
		for n = 0, table.getn(GTplayer) do
			if CheckBuff(GTplayer[n], 623627)==true then--�p�G���a������Buff,�h�⪱�a��J���a�C��
				tic=tic+1--�������W���a�ƶq
				if CheckFlag(GTplayer[n],547139) ==false then--�ˬd�O�_�����n���~
					setflag(GTplayer[n],547139,1)--�����n���~
					table.insert(Players, GTplayer[n])--��J�stable
				end
			end
		end
		if table.getn(Players)>0 then
			local NewTable= {}
			for i= 1, table.getn(Players) do --���y���a�PNPC�������Z��,�W�X�d��|ĵ�i
			local distance = GetDistance( NPC, Players[i] )
		--	say(Npc,"444")
				if CheckBuff( Players[i] , 623627) == true and CheckFlag( Players[i] , 547131 ) == false then
					if distance > 330  then
						ScriptMessage(Players[i],Players[i],1,"[SC_2012_TEACATODO_WARNING4]",0)
						CancelBuff( Players[i] , 623627 )--���a�Q�������	
						CancelBuff( Players[i] , 623635 )--�b�k�J�Q����
						CancelBuff( Players[i] , 623673 )--�[�
						CancelBuff( Players[i] , 623677 )--�h�ä�
						CancelBuff( Players[i] , 623679 )--ĵ�٤�
						setflag(Players[i],547139,0)
						setflag(Players[i],547132,1)
					else
						table.insert(NewTable, Players[i])
						if distance >= 260 and distance < 330 then--���a�PNPC�Z��375�X,ĵ�i���a
						ScriptMessage(Players[i],Players[i],1,"[SC_2012_TEACATODO_WARNING3]",0)--ĵ�i���a���֦^�h�_�h�|�������	
						end
					end
				end
		
			end
			Players = NewTable
		end	
		if tic <=3 then
			WriteRoleValue(brother,EM_RoleValue_Register2, 0)
		else
			WriteRoleValue(brother,EM_RoleValue_Register2, 1)
		end
	end
end	

--====================================���եΫ��O=======================================================
function teacatodo_replay()--�����@��
	local Owner=OwnerID()
	CancelBuff( Owner , 623627 )--���
	CancelBuff( Owner , 623673 )--�[�
	CancelBuff( Owner , 623677 )--�h�ä�
	CancelBuff( Owner , 623678 )--�s����
	CancelBuff( Owner , 623679 )--ĵ�٤�
	CancelBuff( Owner , 623635 )--���d���b�k�J(���ʤ�)
	CancelBuff( Owner , 623637 )--���d���b�k�J(�����)
	setflag(Owner,547130,0)--���ʵ���
	setflag(Owner,547131,0)--������y
	setflag(Owner,547132,0)--�^�O�O��
	setflag(Owner,547133,0)--���u�X��
	setflag(Owner,547139,0)--�����
end

function teacatodo_buff0()--�S����
	local Owner = OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547130,1)
	setflag(Owner,547139,1)
end

function teacatodo_buff(LV)
	local Owner = OwnerID()
	setflag(Owner,547130,1)
	setflag(Owner,547139,1)
	addbuff(Owner,623637,LV,180)
end

--====================================�p�ļ@��====================================
function teacatodo_121536_speak()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC01]") --�������|���ڿ}�G�Y��...�A�ڡA���n�N��
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT01]" ,  "teacatodo_121536_speak2",0 )--�аݥi�H���o��ԲӤ@�I�ܡH
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121536_speak3",0 ) --���n�N��A�ڨS����
end

function teacatodo_121536_speak2()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC02]")--�ԲӪ����Χڤ]���O�ܲM��..
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121536_start",0 )--�����F�A���N��ڰe�L�h�a
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121536_speak3",0 )--���n�N��A�ڨS����
end

function teacatodo_121536_start()
	local Owner = OwnerID()
	local Target = TargetID()
	CloseSpeak( Owner)
	SetPos(Owner, -11.3, 67.1, -38.0, 0 )
end

function teacatodo_121536_speak3()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC03]")
end