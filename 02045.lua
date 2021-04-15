--==================================================--

--==================================================--
--  ���`�@��                        --
--==================================================--

function LuaPE_ZONE18_PE01_Hunter_Del()
	While ZONE18_PE01_Phase > 1	do
		sleep(10)
	end
	DelObj(OwnerID())
end

function LuaMK_104286_dead_1()
	local PEIndex = ZONE18_PE01_PEIndex
	local MapID = ZONE18_PE01_Var["MapID"]				-- �ϰ�a�Ͻs��
	local Phase = ZONE18_PE01_Phase
	local SmallDead = ZONE18_PE01_Var["agidin"] 
	if	Phase == 1 	then
		SmallDead = SmallDead + 1
		ZONE18_PE01_Var["agidin"] = SmallDead				-- ���󦺤`�ƶq
		PE_SetVar( "ZONE18_PE01_Var_SmallAgidinDead" , SmallDead )	-- PE�ܼƧ��� ���󱾱�			
	end
end

function LuaS_18PE_test1()
	SetPlot(OwnerID(),"dead","LuaPE_ZONE18_PE01_HunterDead",100)
end
function LuaPE_ZONE18_PE01_HunterDead()
		local Var = ZONE18_PE01_Var
		local Controller = Var["Controller"]		-- �����
		local HunterDead = Var["HunterDead"]		-- �ثe�y�H���`��
		local Message = "[SC_PE_ZONE18_01_M27]" 				--�ڥ��𮧤@�|�C
		local NowHunter = Var["NowHunter"]
		local Controller = ZONE18_PE01_Var["Controller"]	-- �����
		local FlagID = ZONE18_PE01_Var["FlagID"]
		local HunterID = ZONE18_PE01_Var["HunterID"]
		NPCSay( OwnerID(), Message )	
		HunterDead = HunterDead + 1		-- ���`�p��
		Var["HunterDead"] = HunterDead
		ZONE18_PE01_TotalHunterDead = HunterDead
		Var["NowHunter"] = Var["NowHunter"] -1
		SetStopAttack( OwnerID() )
		SetRoleCamp( OwnerID() , "Visitor" )	

		--PE_SetVar( "ZONE18_PE01_Var_MaxHunterDead" , HunterDead )		-- PE�ܼƧ���
		if	HunterDead + Var["NowHunter"] < 10	then
			debugmsg(0,0,"newhunter")
			local Hunter = Lua_DW_CreateObj("flag" ,HunterID[rand(3)+1],FlagID[4],2,1,1)
			table.insert( ZONE18_PE01_Obj , Hunter )
			table.insert( ZONE18_PE01_Hunter ,Hunter)
			WriteRoleValue( Hunter , EM_RoleValue_LiveTime , 180 )
			WriteRoleValue(Hunter , EM_RoleValue_IsWalk, 0 )
			WriteRoleValue( Hunter, EM_RoleValue_Register+9,HateListInfo(OwnerID(),0,EM_HateListInfoType_GItemID))
			CallPlot(Hunter,"LuaPE_ZONE18_PE01_HunterDead_New_Hunter")
			CallPlot(Hunter,"LuaPE_ZONE18_PE01_AttackEnable")
			Var["NowHunter"] = Var["NowHunter"] +1
		end
		if	Var["NowHunter"] == 0	then
			CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", 30 )  		-- �Ҧ����y�H���M�h�F�A��a�Y�N���{�M���C			
		end
		--say(OwnerID(),HunterDead .."  " ..Var["NowHunter"] )
		DelObj(OwnerID())
		return false

end

function LuaPE_ZONE18_PE01_HunterDead_New_Hunter()

	local FlagID = ZONE18_PE01_Var["FlagID"]
	local HunterID = ZONE18_PE01_Var["HunterID"]
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		-- ����
	SetPlot(OwnerID(),"dead","LuaPE_ZONE18_PE01_HunterDead",100)
	SetAttack(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register+9))
	DW_MoveToFlag(OwnerID(),FlagID[2] , 5 , 20 ,1)	
	CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Phase2_FourHunterAI")
	--say(Hunter,"i hate you too "..HateListInfo(OwnerID(),0,EM_HateListInfoType_GItemID))

end


function LuaS_18PE_test2()
	SetPlot(OwnerID(),"dead","LuaPE_ZONE18_PE01_BigAgidinDead",100)
end
function LuaPE_ZONE18_PE01_BigAgidinDead()
	local ObjID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	if ZONE18_PE01_Phase > 2 then
		local Var = ZONE18_PE01_Var
		local Creater = Var["Creater"]		-- �����
		local HunterDead = Var["HunterDead"]		-- �ثe�Q���A�Ҽƥ�
		local count
		local PEIndex = ZONE18_PE01_PEIndex
		local Phase = ZONE18_PE01_Phase
		local MstDead = Var["MstDead"]			-- �ثe�����Ǫ��ƶq
		local MaxMst = Var["MaxMst"]			-- ���W�̤j�b���ƶq
		local MaxMstDead = Var["MaxMstDead"]	-- �̤j�b�����`�ƶq
		local MstID = Var["MstID"]				-- �Ǫ�ID
		local MapID = Var["MapID"]				-- �ϰ�a�Ͻs��
		local Bonus = Var["Bonus"]
		local BigDead = Var["MstDead"]
		local MaxHunterDead = ZONE18_PE01_Var["MaxHunterDead"]
--		local HunterDead = ZONE18_PE01_Var["HunterDead"]
		--local Score = (MaxHunterDead - HunterDead)*20
		if	ObjID == MstID[2]	then
			BigDead = BigDead + 1		-- ���`�p��
			Var["MstDead"] = BigDead
			PE_SetVar( "ZONE18_PE01_Var_BigAgidinDead" , BigDead )		-- PE�ܼƧ���
			WriteRoleValue( Creater, EM_RoleValue_Register+1,  ReadRoleValue( Creater, EM_RoleValue_Register+1)-1) --�w�֨Ȱ�B�ƶq-1
			
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[3] )         -- ������������
			ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Bonus[Phase]	
			
			return true
		elseif	ObjID == MstID[3]	then
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[4] )
			PE_SetVar( "ZONE18_PE01_Var_BossDead", 1 )
			--PE_GiveAllPlayersScore(PEIndex, Score)				-- ���q�ӧQ����
			ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Bonus[Phase]*20
--			ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Score
			debugmsg(0,0,"BossDead")
			return true
		end

	end
	--debugmsg(0,0,"true dead")
	return true

end

function LuaS_18PE_test()
	SetPlot(OwnerID(),"dead","LuaPE_ZONE18_PE01_HunterDead",100)
end


--==================================================--

--==================================================--
--  �e�U����                        --
--==================================================--

function LuaS_423486_0()-----���b���~204046�ϥΤU��<�ˬdlua>���U�C103498
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423486 ) == false or CountBodyItem( OwnerID() ,208199) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if   OrgID ~= 104286 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423486_0]", 0 ); -----�o��[205871]���G�u���[113447]�ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[205871]�C
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.3	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_7]", 0 ); ----�ؼоĤO�ä㤤�A�A�L�k���Q����A���ؼСI
		return false
	end
	if CountBodyItem ( OwnerID(), 208200 ) < 1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423486_2]", 0 ); ----�A�S�����U,�Щ����ȭ������o���U
		return false
	end

	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --�ؼФw�g���F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	return true
end

function LuaS_423486_1()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	local PEIndex = ZONE18_PE01_PEIndex
	local MapID = ZONE18_PE01_Var["MapID"]				-- �ϰ�a�Ͻs��
	local Bonus = ZONE18_PE01_Var["Bonus"]
	local Phase = ZONE18_PE01_Phase
	local SmallDead = ZONE18_PE01_Var["agidin"] 
	if GiveBodyItem( OwnerID() , 208199 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
		DelBodyItem(OwnerID(),208200,1)
		if	Phase == 1 	then
			SmallDead = SmallDead + 1
			ZONE18_PE01_Var["agidin"] = SmallDead				-- ���󦺤`�ƶq
			PE_SetVar( "ZONE18_PE01_Var_SmallAgidinDead" , SmallDead )	-- PE�ܼƧ��� ���󱾱�			
			CallPlot(TargetID(),"LuaPE_KS_SetBonus", PEIndex, MapID, Bonus[Phase],OwnerID() )         -- ������������
			ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Bonus[Phase]
		end
	end
	Hide(TargetID())
---	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423486_1]", 0 ); -------�A���[103301]�F�I
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())

end

function LuaS_116398_1()
	if	ZONE18_PE01_Phase == 0	then
		SetSpeakDetail( OwnerID(), "[SC_116398_1]" )
	else
		LoadQuestOption( OwnerID() )
	end
end

--==================================================--

--==================================================--
--  ���󲣥Ͱ�                        --
--==================================================--
--�����]�w --
function LuaPE_ZONE18_PE01_CreaterSet( ObjID , RoomID )
	local Controller = ZONE18_PE01_Var["Controller"]
	local Obj = KS_CreateObjMode( ObjID, Controller , nil , 30, 1, 0 )
	
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Obstruct , false )			-- ����
	SetModeEx( Obj , EM_SetModeType_Gravity , false )			-- ���O
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- ����
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Obj , EM_SetModeType_HideName , false )			-- �W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- �i�������
	SetModeEx( Obj , EM_SetModeType_Show , false )				-- ���
	AddToPartition( Obj , RoomID )

	return Obj
end

function LuaPE_ZONE18_PE01_DontLook()
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct , false )			-- ����
	SetModeEx( OwnerID() , EM_SetModeType_Gravity , false )			-- ���O
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )				-- ����
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( OwnerID() , EM_SetModeType_HideName , false )			-- �W��
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )				-- �i�������
	SetModeEx( OwnerID() , EM_SetModeType_Show , false )				-- ���
end

function LuaPE_ZONE18_PE01_art_menber()
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct , false )			-- ����
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )				-- �i�������
end


function LuaPE_ZONE18_PE01_AttackEnable()
	--SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )		-- ����	
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )				-- �i�������
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )				-- ����

end

--==================================================--
--  ���հ�                                 --
--==================================================--

function LuaPE_ZONE18_PE01_test()
	local Phase = ZONE18_PE01_Phase
	local Controller = ZONE18_PE01_Var["Controller"]
	LuaPE_ZONE18_PE01_PhaseDO( Phase )	
	BeginPlot( Controller, "LuaPE_ZONE18_PE01_DelArt", 0 )
	CallPlot( Controller, "LuaPE_ZONE18_PE01_Add_Number_PerTime" )
end
function LuaPE_ZONE18_PE01_Jump_Phase2()
	local SmallDead = ZONE18_PE01_Var["agidin"] 
	SmallDead = 60
	ZONE18_PE01_Var["agidin"] = SmallDead				-- 
	PE_SetVar( "ZONE18_PE01_Var_SmallAgidinDead" , SmallDead )	-- PE�ܼƧ��� ���󱾱�	
end
--==================================================--
--  �����t��                        --
--==================================================--
function LuaPE_ZONE18_PE01_Art()
	debugmsg(0,0,"Create Art")
-----------------------�إߺt��
	local Thickshell = KS_CreateObjMode( 104450, 780753 , 50, 20, 1, true )
	CallPlot( Thickshell ,"LuaPE_ZONE18_PE01_art_menber")
	table.insert( ZONE18_PE01_Art, Thickshell )
	local Count = PE_GetActivePlayerGUIDCount(1)

	for i = 1 , Count , 1 do
		local ID = PE_GetActivePlayerGUID(1)
		ScriptMessage( ID , ID , 1 , "[SC_PE_ZONE18_01_M28]" , "0xffffff00" ) --
		ScriptMessage( ID , ID , 0 , "[SC_PE_ZONE18_01_M28]" , "0xffffff00" )
	end

	local NowHunter = ZONE18_PE01_Var["NowHunter"]
	local temp2 = 1
	local AD = {}
	local Agidin = ZONE18_PE01_Agidin								
	local AgidinNum = table.getn(Agidin)									---
	for i = 1, AgidinNum do
		if CheckID(Agidin[i]) == true then
			debugmsg(0,0,"Agidin = " ..ReadRoleValue( Agidin[i] , EM_RoleValue_OrgID ))
			AD[temp2] = KS_CreateObjMode( ReadRoleValue( Agidin[i] , EM_RoleValue_OrgID ), Agidin[i] , nil, 0, 1, true )
			CallPlot( AD[temp2] ,"LuaPE_ZONE18_PE01_art_menber")
			SetIdleMotion( AD[temp2],ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			SetStopAttack( AD[temp2] )
			SetRoleCamp( AD[temp2] , "Visitor" )	
			FaceFlag ( AD[temp2],780753, 51 )
			table.insert( ZONE18_PE01_Art, AD[temp2] )
			CallPlot(AD[temp2],"LuaPE_ZONE18_PE01_Phase4_Agidin_Return",temp,Thickshell)
			temp2 = temp2 +1
		end
	end
	temp2 = 1



	debugmsg(0,0,"NowHunter = "..NowHunter)
	if	NowHunter > 0	then	
		local HT = {}			
		local Hunter = ZONE18_PE01_Hunter								
		local HunterNum = table.getn(Hunter)							---
		for i = 1, HunterNum do
			if CheckID(Hunter[i]) == true then
				HT[temp2] = KS_CreateObjMode( ReadRoleValue( Hunter[i] , EM_RoleValue_OrgID ), Hunter[i] , nil, 0, 1, true )
				CallPlot( HT[temp2] ,"LuaPE_ZONE18_PE01_art_menber")
				SetStopAttack( HT[temp2] )
				SetRoleCamp( HT[temp2] , "Visitor" )	
				table.insert( ZONE18_PE01_Art, HT[temp2] )
				SetIdleMotion( HT[temp2],ruFUSION_ACTORSTATE_COMBAT_UNARMED)
				FaceFlag ( HT[temp2],780753, 2 )
				CallPlot(HT[temp2],"LuaPE_ZONE18_PE01_Phase4_Hunter_Return",AD[1])
				temp2 = temp2 +1
			end
		end
		if	CheckID(HT[1]) == true	then	
			PlayMotion(HT[1],ruFUSION_ACTORSTATE_EMOTE_AMAZED)
			NPCSAY(HT[1],"[SC_PE_ZONE18_01_M104]")
		end
	end
	sleep(20)
	WriteRoleValue(Thickshell , EM_RoleValue_IsWalk, 0 )			---�Ψ���	


	DW_MoveToFlag(Thickshell,780753 , 2 , 0 ,1)
	sleep(5)
	WriteRoleValue(Thickshell , EM_RoleValue_IsWalk, 1 )			---�Ψ���
	FaceFlag ( Thickshell,780753, 4 )	
	sleep(20)
	AdjustFaceDir( Thickshell ,Thickshell,180 )		
	sleep(20)

	Count = PE_GetActivePlayerGUIDCount(1)
	for i = 1 , Count , 1 do
		local ID = PE_GetActivePlayerGUID(1)
		ScriptMessage( ID , ID , 1 , "[SC_PE_ZONE18_01_M29]" , "0xffffff00" ) --
		ScriptMessage( ID , ID , 0 , "[SC_PE_ZONE18_01_M29]" , "0xffffff00" )
	end

	DW_MoveToFlag(Thickshell,780753 , 50 , 0 ,1)	
	Hide( Thickshell )	
end

function LuaPE_ZONE18_PE01_Phase4_Hunter_Return(Target)
	sleep(20)
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 0 )			---�ζ]��
	CallPlot(OwnerID(),"MK_MoveToFlag_Face",OwnerID(),780753 , 51 , 30 ,1,Target)		
	sleep(300)
	Hide( OwnerID() )
end

function LuaPE_ZONE18_PE01_Phase4_Agidin_Return(MoveFlag,Thickshell)
		sleep(170)
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 0 )			---�ζ]��		
	CallPlot(OwnerID(),"DW_MoveToFlag",OwnerID(),780753 , 3 , 90 ,1)		
	sleep(40)
	Hide( OwnerID() )	
end


function LuaPE_ZONE18_PE01_DelArt()	
	if ZONE18_PE01_Art ~= nil then
		debugmsg(0,0,"Del Art")
		local Art = ZONE18_PE01_Art	
		for i=1, table.getn(Art) do
			DelObj(Art[i])
		end
		ZONE18_PE01_Art = {}
	end
end

--==================================================--
--  �R��                        --
--==================================================--
function LuaPE_ZONE18_PE01_DelObj()
	local Obj = ZONE18_PE01_Obj
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if CheckID(Obj[i]) == true then
				DelObj( Obj[i] )
			end
		end
	end
end

function LuaS_MK_423487()
	setflag(TargetID(),544653,1)
end