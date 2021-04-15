------------------------------------------------------------------------�ɥR-----------------------------------------------------------------------------
function AC2_NpcHideQuest_00()--��NPC�u��ܷ�u���ȡ]William�s�W�^
	local Ctrl = OwnerID()
	local CtrlID = ReadRoleValue( Ctrl, EM_RoleValue_OrgID )
	local Season = GetWorldVar( "OneYear_AC_Season" )
	local AC2Stage = GetWorldVar( "OneYear_AC_Type" )
	local IndexNpc = {}
	local MarkFX = 503217
	IndexNpc[ 1 ] = { 123637, 123638, 123639 }
	IndexNpc[ 2 ] = { 123638, 123639 }
	IndexNpc[ 3 ] = { 123639 }
	if Season < 4 then
		for i = 1, #IndexNpc[ Season ], 1 do
			if CtrlID == IndexNpc[ Season ][ i ] then
				DisableQuest( Ctrl, true )
				if CtrlID == 123633 then--�bZ2������NPC�]�Z���D�E���^�Y�W���W�`�y���ʥμлx
					AddBuff( Ctrl, MarkFX, 0, -1 ) 
				end
				return
			end
		end
	end
	--if CtrlID==123762 then
	--	if AC2Stage~=2 then
	--		DisableQuest( Ctrl, true )
	--		return
	--	end
	--end
end
------------------------------------------------------------------------�ǰe����-----------------------------------------------------------------------------

function AC2_arcane_Enter()			--���k�ǤJ�f
	SetPlot(OwnerID(),"touch","AC2_arcane_ChangeZone_1",100)
end

function AC2_arcane_ChangeZone_1()
	if GetWorldVar( "OneYear_AC_Type" ) >= 2 then
		ChangeZone( OwnerID(), 81 , 0, 1.2,-106,1.2, 0 );
	end 
end

function AC2_arcane_Exit()			--���k�ǥX�f
	SetPlot(OwnerID(),"touch","AC2_arcane_ChangeZone_2",100)
end

function AC2_arcane_ChangeZone_2()
	ChangeZone( OwnerID(), 2 , 0, 5138,50,-3370, 75 ) 
end

function AC2_Season_Entrance()		--����J�f
	SetPlot(OwnerID(),"touch","AC2_Season_Entrance_portal",100)
end

function AC2_Season_Entrance_portal()
	local PortalName = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	for i=1,4 do
		if (PortalName == 123649+i) and (CheckFlag(OwnerID(),548983+i)==true) then
			CallPlot(OwnerID(),"AC2_Season_portal_in",i)
		elseif (PortalName == 123649+i) and (CheckFlag(OwnerID(),548983+i)==false) then
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_AC2NPC_4]", 0 );	--�|���q�L�����F���\�i�A�L�k�i�J�I
		end
	end
end

function AC2_Season_portal_in(Num)
	if Num==1 then
		ScriptMessage(OwnerID(), OwnerID(), 2,"[SC_AC2_CHANGE_ZONE]", 0 );	--��Ĳ�I���󤧪��ɡA�j�N���F���d�F�A���ߴ��A��y�F�A���O��......
		Sleep(10)
		ChangeZone( OwnerID(), 196 , -1, 1052,278,1023, 342 ) 	--�a
	elseif Num==2 then
		ScriptMessage(OwnerID(), OwnerID(), 2,"[SC_AC2_CHANGE_ZONE]", 0 );	--��Ĳ�I���󤧪��ɡA�j�N���F���d�F�A���ߴ��A��y�F�A���O��......
		Sleep(10)
		ChangeZone( OwnerID(), 197 , -1, 2455,651,3290, 15 ) 	--��
	elseif Num==3 then
		ScriptMessage(OwnerID(), OwnerID(), 2,"[SC_AC2_CHANGE_ZONE]", 0 );	--��Ĳ�I���󤧪��ɡA�j�N���F���d�F�A���ߴ��A��y�F�A���O��......
		Sleep(10)
		ChangeZone( OwnerID(), 198 , -1, 3554 ,1511 ,3426, 202 ) 	--��
	elseif Num==4 then
		ScriptMessage(OwnerID(), OwnerID(), 2,"[SC_AC2_CHANGE_ZONE]", 0 );	--��Ĳ�I���󤧪��ɡA�j�N���F���d�F�A���ߴ��A��y�F�A���O��......
		Sleep(10)
		ChangeZone( OwnerID(), 199 , -1, 273,-150,-66, 80 ) 	--���P
	else
		return
	end
end

function AC2_Season_EXIT_portal()				--�ƥ��X�f
	SetPlot(OwnerID(),"range","AC2_Season_portal_Out",100)
end

function AC2_Season_portal_Out()
	ChangeZone( OwnerID(), 81 , 0, 1.2,-106,1.2, 80 ) 	--���k�Ǥ���
end

------------------------------------------------------------------------�ɤ�NPC��t-----------------------------------------------------------------------------

function AC2_Event_Quest_0()
	if CheckCompleteQuest(OwnerID(),427142)==false and 
	   CheckFlag(OwnerID(),548981)==false then
		SetPlot(OwnerID(),"range","AC2_Event_Quest_1",100)
	else
		SetPlot(OwnerID(),"range","",0)
	end
end

function AC2_Event_Quest_1()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc,EM_RoleValue_Register2)==0 then
		WriteRoleValue(npc,EM_RoleValue_Register2,1)
		AdjustFaceDir(npc,player, 0 )
		setflag(player,548981,1)
		sleep(10)
		Say(npc,"[SC_AC2NPC_2]")
		PlayMotionEX( npc,ruFUSION_ACTORSTATE_EMOTE_WAVE,ruFUSION_ACTORSTATE_EMOTE_WAVE)
		sleep(20)
		WriteRoleValue(npc,EM_RoleValue_Register2,0)
	elseif CheckFlag(OwnerID(),548981)==true then
		return
	else
		return
	end
end

-------------------------------------------------------------------------------------���~�]�w--------------------------------------------------------------------------------------

function AC2_S1_ChangeKey_Check(ItemID,OPTION)		--���~�P�_�Akey�O�P�_�H���O�_�����I���BkeyItem�O�P�w�_�ͬO�_����I��
	local Player= OwnerID()
	if (OPTION=="Key") then
		if CountBodyItem(player,ItemID)>=100 then
			return true
		else
			ScriptMessage(player, player, 0,"[SC_SASA2012_08]", 0 );
			return false
		end
	elseif (OPTION=="KeyItem") then
		if CountBodyItem(player,ItemID)>0 then
			return true
		else
			ScriptMessage(player, player, 0,"[SC_SASA2012_08]", 0 );
			return false
		end
	end
end

function AC2_S1_ChangeKey(ItemID,OPTION)
	local player = OwnerID()
	local collection = {[243231]=243235,[243232]=243236,[243233]=243237,[243234]=243238}
	local keypool = {[243235]=548984,[243236]=548985,[243237]=548986,[243238]=548987}
	if  (OPTION=="Key") then
		for part,key in pairs(collection)  do
			if ItemID == part then
				CallPlot(Player,"AC2_S1_ChangeKey_del",player,part,key)
			end
		end
	elseif (OPTION=="KeyItem") then
			if CheckFlag(Player,keypool[ItemID])==false then
				CallPlot(Player,"AC2_S1_ChangeKeyItem_del",player,ItemID,keypool[ItemID])
			else
				ScriptMessage(player, player, 0,"[SC_AC2NPC_3]", 0 ); --�A�w�֦��i�J�����󪺸��C
				return false
			end
	end
end

function AC2_S1_ChangeKey_del(player,part,key)
	DelBodyItem(player,part,100)
	GiveBodyItem(player,key,1)
end

function AC2_S1_ChangeKeyItem_del(player,key,value)
	DelBodyItem(player,key,1)
	SetFlag(player,value,1)
end



-----------------------------------------------------��L�]�m--------------------------------------------------------------------------

function player_revive_buff()	--�_���I�Ǫ��p���y
	SetPlot(OwnerID(),"range","andrus_pray",50)
end

function andrus_pray()		--�[�]�t250%�A10��
	AddBuff(OwnerID(),625702,0,8)
end

-----------------------------------------------------��ܳ]�w--------------------------------------------------------------------------
function AC2_Q_427142_0()			--�J�|�}�Ȫ����n�A���
	LoadQuestOption(OwnerID())

	AdjustFaceDir(TargetID(),OwnerID(),0);	
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	if CheckAcceptQuest(OwnerID(),427142)==true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427142_0]","AC2_Q_427142_1(1)",0)
	elseif CheckAcceptQuest(OwnerID(),427143)==true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427143_0]","AC2_Q_427142_1(2)",0)
	end

end

function AC2_Q_427142_1(choose)		--�J�|�}�Ȫ����n�A���
	if choose==1 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427142_1]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427142_2]","AC2_Q_427142_2(1)",0)
	elseif choose==2 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427143_1]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427143_2]","AC2_Q_427142_2(2)",0)
	end
end

function AC2_Q_427142_2(choose)		--�J�|�}�Ȫ����n�A���
	if choose==1 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427142_3]")
		SetFlag(OwnerID(),549106,1)
	elseif choose==2 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427143_3]")
		SetFlag(OwnerID(),549109,1)
	end
end

function AC2_Q_427144_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),427144)==true and CheckFlag(OwnerID(),549110)==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427144_0]","AC2_Q_427144_1",0)
	end
end


function AC2_Q_427144_1()
	SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427144_1]")
	SetFlag(OwnerID(),549110,1)
end


function AC2_Q_427144_2()
	SetSpeakDetail(OwnerID(),"[SC_AC2_Q_427144_2]")
	SetFlag(OwnerID(),549111,1)
end


function AC2_Stage_1_quest_npcspeak_1()		--�Ĥ@���qNPC�Aú����
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);	--
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q

	AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q1_1]","AC2_Stage_1_quest_npcspeak_2",0)	--��������
	if CheckCompleteQuest(OwnerID(),427144)==true and CheckFlag(OwnerID(),549124)==true and Phase==1 then
		--�����������j����åB�������k�Ǫ��سy�A�~�i�H�ݨ��ﶵ�APS:�����b���q�@�~�����ﶵ�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q1_5]","AC2_Stage_1_quest_npcspeak_4",0) --�����ﶵ	
	elseif 	CheckAcceptQuest(OwnerID(),427144)==true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q_427144_0]","AC2_Q_427144_2",0)	
	end
end

function AC2_Stage_1_quest_npcspeak_2()
	local player=OwnerID()				
	SetSpeakDetail(player,"[SC_AC2_Q1_2]")			
	AddSpeakOption(player,player,"[SC_AC2_Q1_3]","AC2_Stage_1_quest_npcspeak_3",0)	
end

function AC2_Stage_1_quest_npcspeak_3()
	local player=OwnerID()				
	SetSpeakDetail(player,"[SC_AC2_Q1_4]")
	if CheckAcceptQuest(player,427145)==true then		
		SetFlag(player,549110,1)	
	elseif CheckFlag(player,549124)==false then
		AddSpeakOption(player,player,"[SC_AC2_Q2_7]","AC2_Stage_1_quest_npcspeak_3_1",0)
		--AddSpeakOption(player,player,"[SC_AC2_Q1_7]","AC2_Stage_1_quest_npcspeak_Buff(2)",0)
		--AddSpeakOption(player,player,"[SC_AC2_Q1_6]","AC2_Stage_1_quest_npcspeak_Buff(1)",0)		
	end
end

function AC2_Stage_1_quest_npcspeak_3_1()
	local player=OwnerID()
	--Say(TargetID(),"AC2_Stage_1_quest_npcspeak_3_1")
	SetFlag(player,549123,1)
	SetFlag(player,549124,1)	
	CloseSpeak(player)
end

function AC2_Stage_1_quest_npcspeak_4()
	local player=OwnerID()				
	SetSpeakDetail(player,"[SC_AC2_Q1_2]")	
	AddSpeakOption(player,player,"[SC_AC2_Q1_6]","AC2_Stage_1_quest_npcspeak_Buff(1)",0)	
	AddSpeakOption(player,player,"[SC_AC2_Q1_7]","AC2_Stage_1_quest_npcspeak_Buff(2)",0)
	AddSpeakOption(player,player,"[SO_110377_4]","AC2_Stage_1_quest_npcspeak_1",0)		
end

function AC2_Stage_1_quest_npcspeak_Buff(Num)
	local player=OwnerID()
--	DesignLog( Player , 120552 , "Accept" )
	if Num==1 then
		if ReadRoleValue( Player , EM_RoleValue_Money ) < 3000 then
			ScriptMessage( Player, Player, 1, "[SAY_MOUTH_ERROR_A]", 0 ); --/*�A���W���������C
		else
			AddRoleValue( Player , EM_RoleValue_Money , -(3000) ) 
			Lua_OneYear_P1_PayMoney( 3000 , OwnerID() )	
			SetFlag(OwnerID(),548982,1)
			AC2_randBuff(1)
		end

	elseif Num==2 then
		if ReadRoleValue( Player , EM_RoleValue_Money ) < 30000 then
			ScriptMessage( Player, Player, 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
		else
			AddRoleValue( Player , EM_RoleValue_Money , -(30000) )
			Lua_OneYear_P1_PayMoney( 30000 , OwnerID() )		
			SetFlag(OwnerID(),548982,1)
			AC2_randBuff(2)
		end
	end
			CloseSpeak(OwnerID())
end

function AC2_randBuff(Num)
	local playerJob = ReadRoleValue(OwnerID(),EM_RoleValue_VOC)
	local VocCheck = {	
			[1]={1,2,3,6,7,10},		--���z¾�~
			[2]={4,5,8,9}			--�I�k¾�~
			}
	local meleebuff = {[1]=625644,[2]=625645,[3]=625648,[4]=625649,[5]=625650,[6]=625652,[7]=625654,[8]=625655}
	local casterbuff = {[1]=625645,[2]=625646,[3]=625647,[4]=625650,[5]=625651,[6]=625653,[7]=625655,[8]=625656}
		for key,value in pairs(VocCheck[1]) do 
			local R = DW_Rand(8) --�`�`�s�WRAND�ץ� 2014.08/27
			if playerJob == value  then
				if Num==1 then
					AddBuff(OwnerID(),meleebuff[R],0,1800)
	 				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_AC2_Q1_8]", 0 );
					break
				elseif Num==2 then
					AddBuff(OwnerID(),meleebuff[R],0,7200)
	 				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_AC2_Q1_8]", 0 );
					break	
				end
			end	
		end
		
		for key,value in pairs(VocCheck[2]) do 
			if playerJob == value  then
				local R2 = DW_Rand(8) --�`�`�s�WRAND�ץ� 2014.08/27
				if Num==1 then
					AddBuff(OwnerID(),casterbuff[R2],0,1800)
	 				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_AC2_Q1_8]", 0 );
					break
				elseif Num==2 then
					AddBuff(OwnerID(),casterbuff[R2],0,7200)	
	 				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_AC2_Q1_8]", 0 );
					break
				end
			end	
		end
end

function AC2_Stage_2_quest_npcspeak_1()		--�ĤG���qNPC�A�o���ȥ�
	local player=OwnerID()	
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q

	AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q1_1]","AC2_Stage_2_quest_npcspeak_2(1)",0)		--�٧U����
	if CheckFlag(OwnerID(),547894)==false  and Phase==2 then						--�����S���C��X�Ф~�|�X�{���ﶵ�A
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q2_7]","AC2_Stage_2_quest_npcspeak_2(2)",0)	--�@�N�٧U�A���o�i�����ȺX��
	elseif Phase~=2 then
		DisableQuest( Ctrl, true )
	end
	LoadQuestOption(player)
end



function AC2_Stage_2_quest_npcspeak_2(Num)
	local player=OwnerID()		
	if Num==1 then		
		SetSpeakDetail(player,"[SC_AC2_Q2_1]")			
		AddSpeakOption(player,player,"[SC_AC2_Q2_2]","AC2_Stage_2_quest_npcspeak_3",0)--���ꨬ���|��o����˪����֡H
	elseif Num==2 then
		SetSpeakDetail(player,"[SC_AC2_Q2_6]")	
		--Say(TargetID(),"AC2_Stage_2_quest_npcspeak_2")
		SetFlag(player,549123,1)
		SetFlag(player,547894,1)
	end	
end

function AC2_Stage_2_quest_npcspeak_3()--�������ֳN������
	local player=OwnerID()				
	SetSpeakDetail(player,"[SC_AC2_Q2_3]")				
end

function AC2_Stage_2_quest_npcspeak_4()		--�U���ܡAú��NPC
	local player=OwnerID()	
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q

	AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q1_1]","AC2_Stage_2_quest_npcspeak_2(1)",0)		--�٧U����
	AddSpeakOption(player,player,"[SC_AC2_Q2_8]","AC2_Stage_2_quest_npcspeak_5",0)			--ú��ﶵ

	LoadQuestOption(player)			
end

function AC2_Stage_2_quest_npcspeak_5()	--���껡��&�ﶵ
	local player=OwnerID()	
	SetSpeakDetail(player,"[SC_AC2_Q2_9]")
	AddSpeakOption(player,player,"[SC_AC2_Q2_4][$SETVAR1=".."[".."202844".."]".."]","AC2_Stage_2_quest_npcspeak_give_item(1)",0)
	AddSpeakOption(player,player,"[SC_AC2_Q2_4][$SETVAR1=".."[".."SC_AC2_Q2_5".."]".."]","AC2_Stage_2_quest_npcspeak_give_item(2)",0)
end

function AC2_Stage_2_quest_npcspeak_give_item(Num)	--�����Ť���]�ۡA���F�����ȥi�Hú��A���ɤ]�i�Hú
	local player = OwnerID()
	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q
	if Num==1 and Phase==2 then
		if DelBodyItem(OwnerID(),202844,1) then	
			AC2_randBuff(2)
			SetFlag(OwnerID(),548983,1)
			Lua_OneYear_P2_PayMaterial( 1 , player )
		else
			ScriptMessage(player, player, 0,"[SC_424982_ITEM_3][$SETVAR1=".."[".."202844".."]".."]", 0 );
			ScriptMessage(player, player, 1,"[SC_424982_ITEM_3][$SETVAR1=".."[".."202844".."]".."]", 0 );
		end
	elseif Num==2 and Phase==2 then
		SetSpeakDetail(player,"[SC_AC2_Q2_10]")
		AddSpeakOption(player,player,"[SC_AC2_Q2_11][$SETVAR1=".."1".."]","AC2_Stage_2_quest_npcspeak_Buff(1)",0)
		AddSpeakOption(player,player,"[SC_AC2_Q2_11][$SETVAR1=".."2".."]","AC2_Stage_2_quest_npcspeak_Buff(2)",0)
		AddSpeakOption(player,player,"[SC_AC2_Q2_11][$SETVAR1=".."3".."]","AC2_Stage_2_quest_npcspeak_Buff(3)",0)
		AddSpeakOption(player,player,"[SC_AC2_Q2_11][$SETVAR1=".."4".."]","AC2_Stage_2_quest_npcspeak_Buff(4)",0)
	elseif Phase~=2	then	--���O�ĤG���q�����p
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_13]", 0 );
	else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );
	end
			CloseSpeak(OwnerID())
end

function AC2_Stage_2_quest_npcspeak_Buff(Num)	--�Ť�զXú��P�ʥ�����
	local runes = { 
			[1]={520024,520044,520204},
			[2]={520064,520084,520104},
			[3]={520144,520164,520184},
			[4]={520124,520224,520044}
			}
	local LoseRunes = {}
	local OwnItem = 0 	--�����P�_
	local player = OwnerID()
	if Num==1 then
		if CountBodyItem(player, runes[1][1])>=1 and CountBodyItem(player, runes[1][2])>=1 and CountBodyItem(player, runes[1][3])>=1 then
			for r=1,3 do
				DelBodyItem(player,runes[1][r],1)
			end
			Lua_OneYear_P2_PayMaterial( 1 , player )
			AC2_randBuff(2)
			SetFlag(OwnerID(),548983,1)
			OwnItem = 3
			CloseSpeak(player)
		else
				for key,value in pairs(runes[1]) do 
					if CountBodyItem(player,value)>=1 then
						OwnItem = OwnItem +1
					elseif CountBodyItem(player,value)==0  then
						table.insert(LoseRunes,value)
					end
				end
		end
	elseif Num==2 then
		if CountBodyItem(player, runes[2][1])>=1 and CountBodyItem(player, runes[2][2])>=1 and CountBodyItem(player, runes[2][3])>=1 then
			for r=1,3 do
				DelBodyItem(player,runes[2][r],1)
			end
			Lua_OneYear_P2_PayMaterial( 1 , player )
			AC2_randBuff(2)
			SetFlag(OwnerID(),548983,1)
			OwnItem = 3
			CloseSpeak(player)
		else
				for key,value in pairs(runes[2]) do 
					if CountBodyItem(player,value)>=1 then
						OwnItem = OwnItem +1
					elseif CountBodyItem(player,value)==0  then
						table.insert(LoseRunes,value)
					end
				end
		end
	elseif Num==3 then
		if CountBodyItem(player, runes[3][1])>=1 and CountBodyItem(player, runes[3][2])>=1 and CountBodyItem(player, runes[3][3])>=1 then
			for r=1,3 do
				DelBodyItem(player,runes[3][r],1)
			end
			Lua_OneYear_P2_PayMaterial( 1 , player )
			AC2_randBuff(2)
			SetFlag(OwnerID(),548983,1)
			OwnItem = 3
			CloseSpeak(player)
		else
				for key,value in pairs(runes[3]) do 
					if CountBodyItem(player,value)>=1 then
						OwnItem = OwnItem +1
					elseif CountBodyItem(player,value)==0  then
						table.insert(LoseRunes,value)
					end
				end
		end
	elseif Num==4 then
		if CountBodyItem(player, runes[4][1])>=1 and CountBodyItem(player, runes[4][2])>=1 and CountBodyItem(player, runes[4][3])>=1 then
			for r=1,3 do
				DelBodyItem(player,runes[4][r],1)
			end
			Lua_OneYear_P2_PayMaterial( 1 , player )
			AC2_randBuff(2)
			SetFlag(OwnerID(),548983,1)
			OwnItem = 3
			CloseSpeak(player)
		else
				for key,value in pairs(runes[4]) do 
					if CountBodyItem(player,value)>=1 then
						OwnItem = OwnItem +1
					elseif CountBodyItem(player,value)==0  then
						table.insert(LoseRunes,value)
					end
				end
		end
	end
	CloseSpeak(player)
	if OwnItem == 0 then	--�Ť�զX���ʡA���W�@�ӳ��S��
		DebugMsg(0,0,"OwnItem="..OwnItem)
		ScriptMessage(player, player, 0,"[SC_424982_ITEM_1][$SETVAR1=".."["..LoseRunes[1].."]".."][$SETVAR2=".."["..LoseRunes[2].."]".."][$SETVAR3=".."["..LoseRunes[3].."]".."]", 0 );
		ScriptMessage(player, player, 1,"[SC_424982_ITEM_1][$SETVAR1=".."["..LoseRunes[1].."]".."][$SETVAR2=".."["..LoseRunes[2].."]".."][$SETVAR3=".."["..LoseRunes[3].."]".."]", 0 );
		CloseSpeak(player)
	elseif OwnItem==1 then
		DebugMsg(0,0,"OwnItem="..OwnItem)
		ScriptMessage(player, player, 0,"[SC_424982_ITEM_2][$SETVAR1=".."["..LoseRunes[1].."]".."][$SETVAR2=".."["..LoseRunes[2].."]".."]", 0 );
		ScriptMessage(player, player, 1,"[SC_424982_ITEM_2][$SETVAR1=".."["..LoseRunes[1].."]".."][$SETVAR2=".."["..LoseRunes[2].."]".."]", 0 );
	elseif OwnItem==2 then
		DebugMsg(0,0,"OwnItem="..OwnItem)
		ScriptMessage(player, player, 0,"[SC_424982_ITEM_3][$SETVAR1=".."["..LoseRunes[1].."]".."]", 0 );
		ScriptMessage(player, player, 1,"[SC_424982_ITEM_3][$SETVAR1=".."["..LoseRunes[1].."]".."]", 0 );
	elseif OwnItem== 3 then
		return true
	end
end

function AC2_FlagClose()
	--Say(OwnerID(),"GOT IT")
	SetFlag(TargetID(),549123,0)	
end

----------------------------------------------------------�I������-----------------------------------------------------------------------------------------
function AC2_NPC_CHANGE_ITEM_1_0()		--�I��NPC���
	local NPCORGID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if NPCORGID==123640 then	--�a���ƧI��		
		SetSpeakDetail(OwnerID(),"[SC_AC2_123640_0]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_2]","AC2_NPC_CHANGE_ITEM_1_1(1)",0)
	elseif NPCORGID==123641 then	--�����ƧI��		
		SetSpeakDetail(OwnerID(),"[SC_AC2_123640_1]")		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_2]","AC2_NPC_CHANGE_ITEM_1_1(2)",0)
	elseif NPCORGID==123642 then	--�����ƧI��		--������
		SetSpeakDetail(OwnerID(),"[SC_AC2_123640_2]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_2]","AC2_NPC_CHANGE_ITEM_1_1(3)",0)
	elseif NPCORGID==123643 then	--���P���ƧI��		--������
		SetSpeakDetail(OwnerID(),"[SC_AC2_123640_3]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_2]","AC2_NPC_CHANGE_ITEM_1_1(4)",0)
	end
end

function AC2_NPC_CHANGE_ITEM_1_1(Num)	--�I���ﶵ
	if Num == 1 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHANGE_1_0][$SETVAR1=".."[".."243223".."]".."][$SETVAR2=".."[".."243227".."]".."][$SETVAR3=".."[".."243264".."]".."]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_1][$SETVAR1=".."[".."243227".."]".."]","AC2_NPC_CHANGE_ITEM_1_2(1)",0)	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_6]","AC2_NPC_CHANGE_ITEM_1_2(2)",0)	
	elseif Num == 2 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHANGE_1_3][$SETVAR1=".."[".."243224".."]".."][$SETVAR2=".."[".."243228".."]".."][$SETVAR3=".."[".."243264".."]".."][$SETVAR4=".."[".."243227".."]".."]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_1][$SETVAR1=".."[".."243228".."]".."]","AC2_NPC_CHANGE_ITEM_1_2(3)",0)	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_6]","AC2_NPC_CHANGE_ITEM_1_2(4)",0)
	elseif Num == 3 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHANGE_1_4][$SETVAR1=".."[".."243225".."]".."][$SETVAR2=".."[".."243229".."]".."][$SETVAR3=".."[".."243264".."]".."][$SETVAR4=".."[".."243227".."]".."][$SETVAR5=".."[".."243228".."]".."]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_1][$SETVAR1=".."[".."243229".."]".."]","AC2_NPC_CHANGE_ITEM_1_2(5)",0)	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_6]","AC2_NPC_CHANGE_ITEM_1_2(6)",0)
	elseif Num == 4 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHANGE_1_5][$SETVAR1=".."[".."243226".."]".."][$SETVAR2=".."[".."243230".."]".."][$SETVAR3=".."[".."243264".."]".."][$SETVAR4=".."[".."243227".."]".."][$SETVAR5=".."[".."243228".."]".."][$SETVAR6=".."[".."243229".."]".."]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_1][$SETVAR1=".."[".."243230".."]".."]","AC2_NPC_CHANGE_ITEM_1_2(7)",0)	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_CHANGE_1_6]","AC2_NPC_CHANGE_ITEM_1_2(8)",0)
	end
end

function AC2_NPC_CHANGE_ITEM_1_2(Num)	--�I���@��
	if Num==1 then	--�j�a���ƧI���A�a�������Ƭ��a�ߺ��
		if CountBodyItem(OwnerID(),243223)>=5 and  CountBodyItem(OwnerID(),243264)>=5 then
			DelBodyItem(OwnerID(),243223,5)
			DelBodyItem(OwnerID(),243264,5)
			GiveBodyItem(OwnerID(),243227,1)
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==2 then	--�j�a���ƧI���A�a�ߺ����Ƭ��a�����
		if CountBodyItem(OwnerID(),243227)>=1 then
			DelBodyItem(OwnerID(),243227,1)
			GiveBodyItem(OwnerID(),243223,DW_Rand(3)+1)
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==3 then	--�����ƧI���A�������+�a�ߺ����Ƭ��۹گ[��	
		if CountBodyItem(OwnerID(),243224)>=5 and  CountBodyItem(OwnerID(),243227)>=1 and  CountBodyItem(OwnerID(),243264)>=5 then
			DelBodyItem(OwnerID(),243224,5)
			DelBodyItem(OwnerID(),243264,5)
			DelBodyItem(OwnerID(),243227,1)
			GiveBodyItem(OwnerID(),243228,1)
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==4 then	--�����ƧI���A�۹گ[����Ƭ��������+�a�����	
		if CountBodyItem(OwnerID(),243228)>=1 then
			DelBodyItem(OwnerID(),243228,1)
			for i=0,1 do
				GiveBodyItem(OwnerID(),243223+i,DW_Rand(3)+1)
			end
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==5 then	--�����ƧI���A�������+�۹گ[��+�a�ߺ����Ƥۦ�X��
		if CountBodyItem(OwnerID(),243225)>=5 and  CountBodyItem(OwnerID(),243227)>=1 and  CountBodyItem(OwnerID(),243228)>=1 and CountBodyItem(OwnerID(),243264)>=5 then
			DelBodyItem(OwnerID(),243225,5)
			DelBodyItem(OwnerID(),243264,5)
			for i=0,2 do
				DelBodyItem(OwnerID(),243227+i,1)
			end
			GiveBodyItem(OwnerID(),243229,1)
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==6 then	--�����ƧI���A�ۦ�X����Ƭ��������+�������+�j�a���
		if CountBodyItem(OwnerID(),243229)>=1 then
			DelBodyItem(OwnerID(),243229,1)
			for i=0,2 do
				GiveBodyItem(OwnerID(),243223+i,DW_Rand(3)+1)
			end
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==7 then	--���P���ƧI���A�����+�ۦ�X��+�۹گ[��+�a�ߺ����ƤѩR����
		if CountBodyItem(OwnerID(),243226)>=5 and  CountBodyItem(OwnerID(),243227)>=1 and  CountBodyItem(OwnerID(),243228)>=1 and  CountBodyItem(OwnerID(),243229)>=1 and CountBodyItem(OwnerID(),243264)>=5 then
			DelBodyItem(OwnerID(),243225,5)
			DelBodyItem(OwnerID(),243264,5)
			for i=0,3 do
				DelBodyItem(OwnerID(),243227+i,1)
			end
			GiveBodyItem(OwnerID(),243230,1)
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	elseif Num==8 then	--���P���ƧI���A�ѩR������Ƶ����+�������+�������+�j�a���
		if CountBodyItem(OwnerID(),243230)>=1 then
			DelBodyItem(OwnerID(),243230,1)
			for i=0,3 do
				GiveBodyItem(OwnerID(),243223+i,DW_Rand(3)+1)
			end
		else
			ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_WEAVE_REWARD_06]", 0 );	
		end
	end
	CloseSpeak(OwnerID())
end

function AC2_NPC_CHECK_MONEY()		--�i��NPC�A�����a�˵��ֿn�h�֤F
	local Money = GetWorldVar( "OneYear_AC_Money")
	local Material = GetWorldVar( "OneYear_AC_Material")
	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q
	if Phase==1 then	
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHECK_MONEY][$SETVAR1="..Money.."]")
	elseif Phase==2 then			
		SetSpeakDetail(OwnerID(),"[SC_AC2_CHECK_MATERIAL][$SETVAR1="..Material.."]")
	else
		LoadQuestOption(OwnerID())
	end
end

function AC2_ReSet_KeyItem_UseCheck()
	local player = OwnerID()
	if CheckFlag(player,549124)==true or CheckFlag(player,547894)==true then
		return true
	else
		ScriptMessage(OwnerID(), OwnerID(), 1,"[SC_Z24Q425567_01]", 0 );
		return false	
	end
end

function AC2_ReSet_KeyItem_Used()
	local player = OwnerID()
	SetFlag(player,549124,0)
	SetFlag(player,547894,0)
	UseItemDestroy()
end 

function ac2_test_rune(Num)
	local runes = { 
			[1]={520024,520044,520204},
			[2]={520064,520084,520104},
			[3]={520144,520164,520184},
			[4]={520124,520224,520044}
			}
	for i=1,3 do
		GiveBodyItem(OwnerID(),runes[Num][i],1)
	end
end

function AC2_MAGA_CAST_01()
	local obj = OwnerID()
	AddBuff(obj,621733,0,-1)
	PlayMotion(obj, ruFUSION_ACTORSTATE_BUFF_BEGIN )
end

function AC2_Season_Quest_Cli()
--	local Phase = GetWorldVar( "OneYear_AC_Type" ) --�������q
	local Season = GetWorldVar( "OneYear_AC_Season" ) --�����u�`
	local player = OwnerID()
	local NPCORGID =  ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if Season==1 and NPCORGID==123636 and CheckFlag(player,549126)==false then
		SetFlag(player,549126,1)
	elseif Season==2 and NPCORGID==123637 and CheckFlag(player,549127)==false then
		SetFlag(player,549127,1)
	elseif Season==3 and NPCORGID==123638 and CheckFlag(player,549128)==false then
		SetFlag(player,549128,1)
	elseif Season==4 and NPCORGID==123639 and CheckFlag(player,549129)==false then
		SetFlag(player,549129,1)
	end
	LoadQuestOption(player)
end