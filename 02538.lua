-----------------------------------------------------------------------------------------------GM�M�Υ]	
function ic_gm_00()--�M�t��
	WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203525_5]" , C_SYSTEM )		--�A�t�Ťw�g�M�ŤF�I	
end
function ic_FixAllGoldEq( )
	return FixAllEq( OwnerID() ,400 )
end
function ic_gm_01()--�ĸ˥](240234)
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , {	209581,1,209582,1,209583,1,
								209584,1,209585,1,240215,1,
								240216,1,240233,1,240217,1,
								240218,1,240231,1,240232,1,
								241496,1,241492,1,222921,1} }
return BaseTressureProc(   itemset , 15 ) -- 1  �O�ݨD�I�]��?
end
function ic_gm_02()--�־��](241489)
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 	241366,1,241367,1,241368,1,
								241369,1,241370,1} }
return BaseTressureProc(   itemset ,5) 
end
function ic_gm_03()--���ե](241490)	
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 	241529,1,241372,1,241373,1,
								241374,1,241375,1,241488,1,
								241597,1,241491,1,241494,1,
								241495,1,241493,1,206710,1,
								206946,1,209502,1,207568,1,
								209502,1} }
return BaseTressureProc(   itemset ,17) 
end
function ic_gm_04()--�ǻ���(241526)	
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 	227174,1,227175,1,227176,1,
								227177,1,227178,1,227179,1,
								227180,1,228052,1,228053,1,
								228054,1,228055,1,228056,1} }
return BaseTressureProc(   itemset ,12) 
end
function ic_gm_05()--�c�]��(241527)	
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 	228033,1,228034,1,228035,1,
								228036,1,228037,1,228038,1,
								228039,1,228040,1,228041,1,
								228042,1,228043,1,228044,1} }
return BaseTressureProc(   itemset ,12)
end
function ic_gm_06()--���ӥ](241528)	
local play=OwnerID()
local play_VOC_1
local play_VOC_2
local playlV=ReadRoleValue(play, EM_RoleValue_LV )
	if 	   playlV>70 and playlV<76 then
			GiveBodyItem(play,241530,99)
			GiveBodyItem(play,241536,99)
	elseif playlV>75 and playlV<81 then
			GiveBodyItem(play,241531,99)
			GiveBodyItem(play,241537,99)
	elseif playlV>80 and playlV<86 then
			GiveBodyItem(play,241532,99)
			GiveBodyItem(play,241538,99)
	elseif playlV>85 and playlV<91 then
			GiveBodyItem(play,241533,99)
			GiveBodyItem(play,241539,99)
	elseif playlV>90 and playlV<96 then
			GiveBodyItem(play,241534,99)
			GiveBodyItem(play,241540,99)
	elseif playlV>95 and playlV<101 then
			GiveBodyItem(play,241535,99)
			GiveBodyItem(play,241541,99)			
	end				
	play_VOC_1=ReadRoleValue(play,EM_RoleValue_VOC )
	play_VOC_2=ReadRoleValue(play,EM_RoleValue_VOC_SUB)							
	if play_VOC_1== 2 or play_VOC_2== 2 then
		if 		playlV>69 and playlV<77 then
				GiveBodyItem(play,213225,999)
		elseif 	playlV>76 and playlV<84 then
				GiveBodyItem(play,213226,999)
		elseif 	playlV>83 and playlV<91 then
				GiveBodyItem(play,213227,999)
		elseif 	playlV>90 and playlV<98 then
				GiveBodyItem(play,213228,999)
		elseif 	playlV>97 and playlV<105 then
				GiveBodyItem(play,213229,999)
		end	
			GiveBodyItem(play,200762,99)
			GiveBodyItem(play,200563,99)
	end	
	play_VOC_1=ReadRoleValue(play,EM_RoleValue_VOC )
	play_VOC_2=ReadRoleValue(play,EM_RoleValue_VOC_SUB)	
	if play_VOC_1== 3 or play_VOC_2== 3 then
		if 		playlV>69 and playlV<77 then
				GiveBodyItem(play,213230,999)
		elseif 	playlV>76 and playlV<84 then
				GiveBodyItem(play,213231,999)
		elseif 	playlV>83 and playlV<91 then
				GiveBodyItem(play,213232,999)
		elseif 	playlV>90 and playlV<98 then
				GiveBodyItem(play,213233,999)
		elseif 	playlV>97 and playlV<105 then
				GiveBodyItem(play,213234,999)
		end	
			GiveBodyItem(play,200762,99)
			GiveBodyItem(play,200563,99)	
	end
end
function ic_gm_07()--�ī~�](241574)	
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 	241557,99,241558,99,241569,99,
								241572,99,241568,99,241573,99,
								241560,99,241561,99,241562,99,
								241564,99,241565,99,241566,99,
								241567,99,241559,99,241571,99,
								241563,99,241570,99,241371,99,
								207583,1,207584,1}}
return BaseTressureProc(itemset,17) -- 1  �O�ݨD�I�]��?			
end
function ic_gm_08()--GM��(241575)	
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240234,1,241489,1,241490,1,241526,1,241527,1,241528,1,241574,1}}
return BaseTressureProc(itemset ,7)
end
-----------------------------------------------------------------------------------------------����---EM_RoleValue_LV  --EM_RoleValue_VOC---EM_RoleValue_VOC_SUB
function ic_buff_fire()	--����
AddBuff(OwnerID(),509983,0 ,-1 )
end
-----------------------------------------------------------------------------------------------��ۤv�WBUFF��
function ic_AddBuff(BUFF)
local mob=OwnerID()
	AddBuff(mob,BUFF,0,-1)
end
-----------------------------------------------------------------------------------------------��������BOSS��
--name=�X�и��X  --isaac=�������W��  --Boss=���նZ�����ؼ�  --BOSSGOGO=�Z�� �W�L�Z���|�⤤��������9�f�U �g��1
function ic_All_Boss100_1(name,isaac,Boss,BOSSGOGO)---���չw���y
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local Boss100=Lua_DW_CreateObj("flag",104693,name,1,0)										---���նZ����
			ic_All_nolook_00(Boss100)	
			AddToPartition(Boss100,RoomID)
			WriteRoleValue(Boss100,EM_RoleValue_PID,isaac)
			WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
			callplot(Boss100, "ic_All_Boss100_2" , BOSSGOGO)
end

function ic_All_Boss100_2(BOSSGOGO)	
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
--local BOSS9898=GetDistance( OwnerID(), Boss)
local Boss9898
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		if  ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1  then
			DelObj(OwnerID())
		end
		if  BOSS9898>=BOSSGOGO then
			WriteRoleValue(isaac,EM_RoleValue_register9,1)
			DelObj(OwnerID())
		end
	end
end
function ic_All_BOSSXX()																	---���`��
	local isaac=ic_ReadRoleValue(OwnerID(),0)	
		ic_WriteRoleValue(isaac,10,1)
end
-----------------------------------------------------------------------------------------------�Ǫ��}�U�Ͳy�W�L�Ǧ^�ͩ��I
function ic_All_mob100_1(MOBGOGO,BUFF,dir)---(MOBGOGO=�Z��,BUFF=�ǰe�^�Ӫ��k�N(��),dir=���V)
local mob=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local X0
local Y0
local Z0
local Boss100 = star_CreateObj_NoAdd( OwnerID() , 104693 , 0 , 0 , 0 , RoomID , 0 ) ---�Ͳy
		ic_All_nolook_00(Boss100)	
		AddToPartition(Boss100,RoomID)
		WriteRoleValue(Boss100,EM_RoleValue_register1,mob)
		callplot(Boss100, "ic_All_mob100_2" , MOBGOGO,BUFF,dir)
end
function ic_All_mob100_2(MOBGOGO,BUFF,dir) 
local Boss100=OwnerID()
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local MOB9898=GetDistance( OwnerID(), mob)
local X0
local Y0
local Z0
	while true do
		MOB9898=GetDistance( OwnerID(), mob)
		sleep(10)
		if  ReadRoleValue( mob, EM_RoleValue_IsDead ) == 1  then
			DelObj(Boss100)
		end
		if  MOB9898>=MOBGOGO then
			AddBuff(mob,BUFF,0 ,-1 )
			sleep(10)
			ic_NoAttackPlayer(mob)
			X0=ReadRoleValue(Boss100 ,EM_RoleValue_X)
			Y0=ReadRoleValue(Boss100 ,EM_RoleValue_Y)
			Z0=ReadRoleValue(Boss100 ,EM_RoleValue_Z)
			SetPos( mob , X0 , Y0 , Z0 ,dir)
			CancelBuff(mob, BUFF)
		end
	end
end
-----------------------------------------------------------------------------------------------���������a
function ic_NoAttackPlayer( NPC )--���������a(NPC=���w���ؼ�)
	if ic_InCombat( NPC ) == true then
		local AttackTID = ReadRoleValue( NPC, EM_RoleValue_AttackTargetID )
		if ReadRoleValue( AttackTID, EM_RoleValue_IsPlayer ) == 1 then
			SetStopAttack( NPC )				
		end
	end
end
function ic_InCombat( NPC )--�O�_�԰���	
	if ReadRoleValue( NPC, EM_RoleValue_AttackTargetID ) == 0 and HateListCount( NPC ) == 0 then
		return false
	else
		return true
	end
end
-----------------------------------------------------------------------------------------------���w�ؼ��H���ͩǦ�ADD
function ic_mob_Rand_add( TargetObj , ObjDBID ,Dir,Rand) --1.TargetObj:�ؼ�   2. ObjDBID:�n���ͪ���DBID 3.Dir���� 4.�Z��
	local Obj = Role:new( TargetObj ) 
	local RoomID = ReadRoleValue(TargetObj , EM_RoleValue_RoomID)
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Luck=0
	local Luck1=0
	Luck=DW_Rand(Rand)
	Luck1=DW_Rand(4)
	if Luck1==1 then
		local mob = CreateObj(ObjDBID, BaseX +Luck, BaseY , BaseZ+Luck , Dir, 1 )	
		AddToPartition( mob , RoomID )	
		return mob
	elseif	Luck1==2 then
		local mob = CreateObj(ObjDBID, BaseX -Luck, BaseY , BaseZ-Luck , Dir, 1 )	
		AddToPartition( mob , RoomID )	
		return mob
	elseif	Luck1==3 then
		local mob = CreateObj(ObjDBID, BaseX +Luck, BaseY , BaseZ-Luck , Dir, 1 )	
		AddToPartition( mob , RoomID )	
		return mob
	elseif	Luck1==4 then
		local mob = CreateObj(ObjDBID, BaseX -Luck, BaseY , BaseZ+Luck , Dir, 1 )	
		AddToPartition( mob , RoomID )	
		return mob
	end	
end
-----------------------------------------------------------------------------------------------���w�ؼ��H���ͩǨS��ADD
function ic_mob_Rand_noadd( TargetObj , ObjDBID ,Dir,Rand)--1.TargetObj:�ؼ�   2. ObjDBID:�n���ͪ���DBID 3.Dir���� 4.�Z��
	local Obj = Role:new( TargetObj ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Luck=0
	local Luck1=0
	Luck=DW_Rand(Rand)
	Luck1=DW_Rand(4)
	if Luck1==1 then
		local mob = CreateObj(ObjDBID, BaseX +Luck, BaseY , BaseZ+Luck , Dir, 1 )		
		return mob
	elseif	Luck1==2 then
		local mob = CreateObj(ObjDBID, BaseX -Luck, BaseY , BaseZ-Luck , Dir, 1 )		
		return mob
	elseif	Luck1==3 then
		local mob = CreateObj(ObjDBID, BaseX +Luck, BaseY , BaseZ-Luck , Dir, 1 )		
		return mob
	elseif	Luck1==4 then
		local mob = CreateObj(ObjDBID, BaseX -Luck, BaseY , BaseZ+Luck , Dir, 1 )		
		return mob
	end	
end
-----------------------------------------------------------------------------------------------������GM
function ic_GM_NO_KK()
	if ReadRoleValue(TargetID() , EM_RoleValue_VOC ) ~= 0 then 
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_VOC ) ==0 then 
		return false
	end
end
-----------------------------------------------------------------------------------------------�ƥ����M��
function ic_All_door(door)---�I��~�Y����~����~����~�i���~�Q�j�M~����~�_----����~�O
	SetModeEx( door , EM_SetModeType_Mark, false)										
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 								
	SetModeEx( door , EM_SetModeType_Obstruct, true) 									
	SetModeEx( door , EM_SetModeType_Strikback, false) 									
	SetModeEx( door , EM_SetModeType_Move, false) 									
	SetModeEx( door , EM_SetModeType_Fight, false) 										
	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)							
	SetModeEx( door , EM_SetModeType_Searchenemy, false)
	SetModeEx( door , EM_SetModeType_NotShowHPMP, true) 
end	
-----------------------------------------------------------------------------------------------�z���y�M��
function ic_All_nolook_00(mob10)---�W��~���q�Y����~�аO~����~����~�i�������~����~�_
	SetModeEx( mob10  , EM_SetModeType_HideName, true )
	SetModeEx( mob10  , EM_SetModeType_ShowRoleHead, false )
	SetModeEx( mob10  , EM_SetModeType_Mark, false )
	SetModeEx( mob10  , EM_SetModeType_Move, false )
	SetModeEx( mob10  , EM_SetModeType_Searchenemy, false )
	SetModeEx( mob10  , EM_SetModeType_Fight , false )
	SetModeEx( mob10  , EM_SetModeType_Strikback, false )	
end	
-----------------------------------------------------------------------------------------------�_�c�M��
function ic_All_bobo(bobo)--�I��~�Y����~����~�O--����~����~���~����~���~�_
	SetModeEx( bobo , EM_SetModeType_Mark, true)			
	SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		
	SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			
	SetModeEx( bobo , EM_SetModeType_Strikback, false) 
	SetModeEx( bobo , EM_SetModeType_Move, false) 	
	SetModeEx( bobo , EM_SetModeType_Fight, false) 
	SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	
	SetModeEx( bobo , EM_SetModeType_Searchenemy, false)				
	SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) 
	SetModeEx( bobo , EM_SetModeType_HideName, false) 
end
-----------------------------------------------------------------------------------------------�ϥΫ�|�^�Ǥ@�Ө̾ڤ���ȥѤj�ܤp�ƦC�n��table�Atable�s�񪺭ȴN�O���a��GID
function ic_HateListSort(ObjGID)	
	local RoomID= ReadRoleValue(ObjGID,EM_RoleValue_RoomID);
	local Count = HateListCount(ObjGID)	
	local TempGID = 0
	local TempHate = 0
	--local SwitchTemp = 0
	local TempList = {}
	--local SortedList = {}
	local NameSort = {}
	local IsSmaller = 0
	for i=0 , Count-1 do
		TempGID = HateListInfo(ObjGID,i,EM_HateListInfoType_GItemID)
		TempHate = HateListInfo(ObjGID,i,EM_HateListInfoType_HatePoint)
		IsSmaller =0;
		if table.getn(TempList) > 0 then
			for j=1 , table.getn(TempList) do					
				if TempHate > TempList[j] then
					table.insert(TempList , j , TempHate)
					table.insert(NameSort , j , TempGID)						
					IsSmaller = 1;
					break
				end
			end
			if IsSmaller ==0 then	
				TempList[table.getn(TempList)+1] = TempHate
				NameSort[table.getn(NameSort)+1] = TempGID
			end
		else
			TempList[table.getn(TempList)+1] = TempHate
			NameSort[table.getn(NameSort)+1] = TempGID
		end

	end
	for i,v in ipairs(TempList) do
	end
	for i,v in ipairs(NameSort) do
	end
	return NameSort
end
-----------------------------------------------------------------------------------------------�R�����aBUFF��
function ic_playBUFFXX(play0_400,BUFF1,BUFF2,BUFF3,BUFF4,BUFF5,BUFF6,BUFF7,BUFF8,BUFF9,BUFF10)
					---play0_400= 0=���ϰ� 1-400= �d��   BUFF1~BUFF10=���X
	if 	play0_400~=0 then				
		local Search = SearchRangePlayer ( OwnerID() , play0_400)--�d��̤j400
		for i = 0 , table.getn(Search)	do
			if CheckID( Search[i] ) == true and ReadRoleValue( Search[i] , EM_RoleValue_IsPlayer ) == 1 then	
				if CheckBuff( Search[i] , BUFF1 ) == true or
					CheckBuff( Search[i] , BUFF2 ) == true or
					CheckBuff( Search[i] , BUFF3 ) == true or
					CheckBuff( Search[i] , BUFF4 ) == true or
					CheckBuff( Search[i] , BUFF5 ) == true or
					CheckBuff( Search[i] , BUFF6 ) == true or
					CheckBuff( Search[i] , BUFF7 ) == true or
					CheckBuff( Search[i] , BUFF8 ) == true or
					CheckBuff( Search[i] , BUFF9 ) == true or
					CheckBuff( Search[i] , BUFF10 ) == true	then						
							CancelBuff(Search[i], BUFF1)	
							CancelBuff(Search[i], BUFF2)	
							CancelBuff(Search[i], BUFF3)
							CancelBuff(Search[i], BUFF4)	
							CancelBuff(Search[i], BUFF5)
							CancelBuff(Search[i], BUFF6)
							CancelBuff(Search[i], BUFF7)	
							CancelBuff(Search[i], BUFF8)
							CancelBuff(Search[i], BUFF9)
							CancelBuff(Search[i], BUFF10)		
				end	
			end		
		end
	end
	if play0_400==0 then
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local TempPlayer = SetSearchAllPlayer(RoomID)												
		local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() 												
			if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then	
				if CheckBuff( ThesePlayer[i] , BUFF1 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF2 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF3 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF4 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF5 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF6 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF7 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF8 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF9 ) == true or
					CheckBuff( ThesePlayer[i] , BUFF10 ) == true	then						
							CancelBuff(ThesePlayer[i], BUFF1)	
							CancelBuff(ThesePlayer[i], BUFF2)	
							CancelBuff(ThesePlayer[i], BUFF3)
							CancelBuff(ThesePlayer[i], BUFF4)	
							CancelBuff(ThesePlayer[i], BUFF5)
							CancelBuff(ThesePlayer[i], BUFF6)
							CancelBuff(ThesePlayer[i], BUFF7)	
							CancelBuff(ThesePlayer[i], BUFF8)
							CancelBuff(ThesePlayer[i], BUFF9)
							CancelBuff(ThesePlayer[i], BUFF10)		
				end	
			end					
		end
	end		
end
-----------------------------------------------------------------------------------------------�R��NPC��
function ic_npcXX(npc0_400,npc1,npc2,npc3,npc4,npc5,npc6,npc7,npc8,npc9,npc10)
			   ---npc0_400= 0=���ϰ� 1-400= �d��   npc1~npc10=���X
	if 	npc0_400~=0 then				
		local Search = SearchRangeNPC ( OwnerID() , npc0_400 )
		for i = 0 , table.getn(Search) do
			if Search[i] ~= OwnerID() then
				if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc1 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc2 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc3 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc4 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc5 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc6 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc7 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc8 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc9 or	
					ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	npc10 then
					DelObj(Search[i])
				end		
			end
		end	
	end
	if npc0_400==0 then
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
		local ID=GetSearchResult()
		local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
		for i = 0 , NPCXX do
			ID=GetSearchResult() 
			ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			if ID2==npc1 or 
			   ID2==npc2 or 
			   ID2==npc3 or 
			   ID2==npc4 or 
			   ID2==npc5 or 
			   ID2==npc6 or 
			   ID2==npc7 or 
			   ID2==npc8 or 
			   ID2==npc9 or 
			   ID2==npc10	then
				DelObj(ID)
			end
		end
	end		
end
-----------------------------------------------------------------------------------------------���w�X�Хͪ���O�_�nADD
function ic_mob_flag_add_Y_N(TargetObj,ObjDBID,flag,Rand,yesno) 
						--TargetObj=�ؼ� ObjDBID=�n���ͪ���DBID flag=�X�� Rand=�X�мƦr yesno 1=��ADD 2=�S��ADD
	local RoomID = ReadRoleValue(TargetObj , EM_RoleValue_RoomID)
	local add12=yesno
	if add12==1 then
		mob=CreateObjByFlag(ObjDBID,flag,Rand,1)
			AddToPartition( mob , RoomID )	
			return mob
	elseif add12==2 then
		mob=CreateObjByFlag(ObjDBID,flag,Rand,1)
			return mob
	end	
end
-----------------------------------------------------------------------------------------------�M��CD��
function ic_skill_CD_0(TargetObj,MagicID,Value)---TargetObj==�ؼ� MagicID==�k�N���X  Value  0=¾�~  1=�˳� 2=���~
	local CD = GameObjInfo_Int( MagicID ,"ColdownTime")
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")
	local Data
	if CD > 0 then
		if Value ==0  then
			WriteRoleValue( TargetObj , EM_RoleValue_Coldown_Job + Type ,  0 )
			Data = ReadRoleValue( TargetObj , EM_RoleValue_Coldown_Job + Type )
		elseif Value == 1 then
			WriteRoleValue( TargetObj , EM_RoleValue_Coldown_EQ + Type ,  0 )
			Data = ReadRoleValue( TargetObj , EM_RoleValue_Coldown_EQ + Type )
		elseif Value == 2 then
			WriteRoleValue( TargetObj , EM_RoleValue_Coldown_Item + Type ,  0 ) 
			Data = ReadRoleValue( TargetObj , EM_RoleValue_Coldown_Item + Type )
		end
		CD = GameObjInfo_Int( MagicID ,"ColdownTime")
	end
end
-----------------------------------------------------------------------------------------------�T�{���S���I�k��
function ic_magic_ing(TargetObj,time0)---TargetObj==�ؼ� time0=���ݬ��
	while 	ReadRoleValue(TargetObj, EM_RoleValue_SpellMagicID  ) ~= 0 do
		sleep(time0)
	end
end
-----------------------------------------------------------------------------------------------�i�վ㵽�c��
function ic_Neutral(X)---? pcall ic_Neutral_MAX(X)
local PlayerID = OwnerID()
AddRoleValue( PlayerID , EM_RoleValue_GoodEvil ,X)
end
-----------------------------------------------------------------------------------------------���Ѱʧ@��(�s����)
function ic_crafting(TargetObj,X,sleep1)---TargetObj==�ؼ� X== 1=start 2=idle 3=end sleep1=���ݬ�� (������ʤ����}��)
	if TargetObj == nil then
		return
	end
	local mob=TargetObj
		if 	   x==1 then
			--SetModeEx(mob,EM_SetModeType_Fight,false) 									
			--SetModeEx(mob,EM_SetModeType_Move,false) 									
			PlayMotion(mob,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			sleep(sleep1)
		elseif x==2 then
			SetIdleMotion(mob,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
			sleep(sleep1)
		elseif x==3 then
			PlayMotion(mob,ruFUSION_ACTORSTATE_CRAFTING_END)
			sleep(sleep1)
			--SetModeEx(mob,EM_SetModeType_Fight,true) 									
			--SetModeEx(mob,EM_SetModeType_Move,true) 
			SetIdleMotion(mob,ruFUSION_ACTORSTATE_NORMAL)
		end
end
-----------------------------------------------------------------------------------------------���Ѱʧ@��(��L��)
function ic_emote_sleep(TargetObj,X,sleep1)---TargetObj==�ؼ� X== 1=down 2=idle 3=up sleep1=���ݬ�� (������ʤ����}��)
	local mob=TargetObj
		if 	   x==1 then
			SetModeEx(mob,EM_SetModeType_Fight,false) 										
			SetModeEx(mob,EM_SetModeType_Move,false) 											
			PlayMotion(mob,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
			sleep(sleep1)
		elseif x==2 then
			SetIdleMotion(mob,ruFUSION_ACTORSTATE_SLEEP_LOOP)
			sleep(sleep1)
		elseif x==3 then
			PlayMotion(mob,ruFUSION_ACTORSTATE_SLEEP_END)
			sleep(sleep1)
			SetModeEx(mob,EM_SetModeType_Fight,true) 										
			SetModeEx(mob,EM_SetModeType_Move,true) 										
		end
end
-----------------------------------------------------------------------------------------------�T�����  ic_say_all_plays(TargetObj,say,X)
function ic_say_all_play(say,X)--say="[�r��]" x== 1=�� 2=�� 3=�T�� 4=��+�T�� 5=��+�T��(�ϰ�)
local mob=OwnerID()
local Message=say
	if 	   X==1 then
		ScriptMessage(mob,-1,1,say,2)
	elseif X==2 then
		ScriptMessage(mob,-1,2,say,2)
	elseif X==3 then
		ScriptMessage(mob,-1,0,say,2)	
	elseif X==4 then
		ScriptMessage(mob,-1,1,say,2)
		ScriptMessage(mob,-1,0,say,2)
	elseif X==5 then
		ScriptMessage(mob,-1,2,say,2)
		ScriptMessage(mob,-1,0,say,2)
	end
end
-----------------------------------------------------------------------------------------------
function ic_say_play(TargetObj,play123,say,X)--say="[�r��]" x== 1=�� 2=�� 3=�T�� 4=��+�T�� 5=��+�T��(��H)
local mob=TargetObj
local mob1=play123
local Message=say
	if 	   X==1 then
		ScriptMessage(mob,mob1, 1,say, 0 )
	elseif X==2 then
		ScriptMessage(mob,mob1,2,say, 0 )
	elseif X==3 then
		ScriptMessage(mob,mob1,0,say, 0 )	
	elseif X==4 then
		ScriptMessage(mob,mob1,1,say, 0 )
		ScriptMessage(mob,mob1,0,say, 0 )
	elseif X==5 then
		ScriptMessage(mob,mob1,2,say, 0 )
		ScriptMessage(mob,mob1,0,say, 0 )
	end
end	
-----------------------------------------------------------------------------------------------�]���O
function ic_say_all_world(say,People,X)--say="[�r��]" People= 0��H 1�� 2�Ҧ� X=1 �� 2�� 3�� 4��
local mob=OwnerID()
local Message=say
local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if 	   X==1 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx(mob,People,0,say) 
		end
	elseif X==2 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx(mob,People,1,say) 
		end
	elseif X==3 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx(mob,People,2,say) 
		end
	elseif X==4 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsgEx(mob,People,3,say) 
		end
	end
end	
-----------------------------------------------------------------------------------------------�g�J�f�U
function ic_WriteRoleValue(TargetObj,X,Value)--TargetObj==�ؼ� X== 0=PID 1-10=1-10�f�U Value=�g�J��
local mob=TargetObj
	if 	   X==0 then
		WriteRoleValue(mob,EM_RoleValue_PID,Value)
	elseif X==1 then
		WriteRoleValue(mob,EM_RoleValue_register1,Value)
	elseif X==2 then
		WriteRoleValue(mob,EM_RoleValue_register2,Value)
	elseif X==3 then
		WriteRoleValue(mob,EM_RoleValue_register3,Value)
	elseif X==4 then
		WriteRoleValue(mob,EM_RoleValue_register4,Value)
	elseif X==5 then
		WriteRoleValue(mob,EM_RoleValue_register5,Value)
	elseif X==6 then
		WriteRoleValue(mob,EM_RoleValue_register6,Value)
	elseif X==7 then
		WriteRoleValue(mob,EM_RoleValue_register7,Value)
	elseif X==8 then
		WriteRoleValue(mob,EM_RoleValue_register8,Value)
	elseif X==9 then
		WriteRoleValue(mob,EM_RoleValue_register9,Value)
	elseif X==10 then
		WriteRoleValue(mob,EM_RoleValue_register10,Value)
	end	
end
-----------------------------------------------------------------------------------------------Ū���f�U
function ic_ReadRoleValue(TargetObj,X)
--TargetObj==�ؼ� X== 0=PID 1-10=1-10�f�U 11=ROOMID 12=��e�ؼ� 13=X�y�� 14=Y�y�� 15=Z�y�� 16=���V 17=ZONEID
local mob=TargetObj
local Value
	if 	   X==0 then
		Value=ReadRoleValue(mob,EM_RoleValue_PID)
	elseif X==1 then
		Value=ReadRoleValue(mob,EM_RoleValue_register1)
	elseif X==2 then
		Value=ReadRoleValue(mob,EM_RoleValue_register2)
	elseif X==3 then
		Value=ReadRoleValue(mob,EM_RoleValue_register3)
	elseif X==4 then
		Value=ReadRoleValue(mob,EM_RoleValue_register4)
	elseif X==5 then
		Value=ReadRoleValue(mob,EM_RoleValue_register5)
	elseif X==6 then
		Value=ReadRoleValue(mob,EM_RoleValue_register6)
	elseif X==7 then
		Value=ReadRoleValue(mob,EM_RoleValue_register7)
	elseif X==8 then
		Value=ReadRoleValue(mob,EM_RoleValue_register8)
	elseif X==9 then
		Value=ReadRoleValue(mob,EM_RoleValue_register9)
	elseif X==10 then
		Value=ReadRoleValue(mob,EM_RoleValue_register10)
	elseif X==11 then
		Value=ReadRoleValue(mob,EM_RoleValue_RoomID)
	elseif X==12 then
		Value=ReadRoleValue(mob,EM_RoleValue_AttackTargetID)	
	elseif X==13 then
		Value=ReadRoleValue(mob,EM_RoleValue_X)
	elseif X==14 then
		Value=ReadRoleValue(mob,EM_RoleValue_Y)
	elseif X==15 then
		Value=ReadRoleValue(mob,EM_RoleValue_Z)
	elseif X==16 then	
		Value=ReadRoleValue(mob,EM_RoleValue_Dir)
	elseif X==17 then	
		Value=ReadRoleValue(mob,EM_RoleValue_ZoneID)	
	end	
	return Value
end
-----------------------------------------------------------------------------------------------Ū��buff����
function ic_buff_lv(TargetObj,buff_power)--TargetObj==�ؼ� buff_power= buff���X
	local mob=TargetObj
	local buff= Lua_BuffPosSearch( mob,buff_power)
	local bufflv=BuffInfo(mob,buff,EM_BuffInfoType_Power)
	return bufflv
end
-----------------------------------------------------------------------------------------------Ū��q��
function ic_HP_Max_Now(TargetObj)
local mob=TargetObj
local MaxHP = ReadRoleValue(mob,EM_RoleValue_MaxHP)								
local NowHP = ReadRoleValue(mob,EM_RoleValue_HP)     						 		
local HPPercent = NowHP / MaxHP
	return HPPercent
end
-----------------------------------------------------------------------------------------------��w��q��
function ic_LockHP(TargetObj,X)--TargetObj==�ؼ� X=1-0.1% -1�Ѱ�
local mob=TargetObj
	LockHP(mob,ReadRoleValue(mob,EM_RoleValue_MaxHP)*X,"")
end
-----------------------------------------------------------------------------------------------�W�[�۵M���O���F����I��
function ic_iob_8_9_buff()
	local own = OwnerID()
	local SoulP = ReadRoleValue ( own, EM_RoleValue_SoulPoint)
	local buff
	local buff1
	local job_1=ReadRoleValue(own,EM_RoleValue_VOC)
	local job_2=ReadRoleValue(own,EM_RoleValue_VOC_SUB)
	if job_1==9 or job_1==8 then
		if job_1==9 then	
			WriteRoleValue( own, EM_RoleValue_SoulPoint,SoulP+10)	
		end
		if job_1==8 then
			buff=ic_buff_lv(own,503827)
			if job_2==2  then
				buff1=14-buff
			end
			if job_2~=2  then
				buff1=9-buff
			end
			if buff1~=0 then
				AddBuff(own,503827,buff1,-1 )
			end	
		end
	elseif job_1~=8 and job_1~=9 then
		say(own,"[TOOLTIPS_LIMIT_CLASS]  NO  ".."[SC_VOC_DRUID]".."  OR  ".."[SC_VOC_Harpsyn]")
	end	
end