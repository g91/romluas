------------------------------------------------------------------------------�¯٫קP�w
function LuaS_103120_507410Check()
	local Player = TargetID()
	if	Player == OwnerID()	then
		return false
	end
	if	CheckBuff(Player,507410)	then
		local PosOfBuff = Lua_BuffPosSearch( Player , 507410 )
		local PowerLv = BuffInfo(Player,PosOfBuff,EM_BuffInfoType_Power)
		if	PowerLv >8	then
			AddBuff(Player,507412,1,-1) --gg���O
			local DontSeeBall = DW_CreateObjEX("obj",116755,Player,0,0)--�z���y(��j�k�N)
			Lua_ObjDontTouch( DontSeeBall )--���Ϊ���
			AddToPartition(DontSeeBall,0)
			SysCastSpellLv(OwnerID(),DontSeeBall,496393,1)--����̾_�i(�ˮ`)(script)
		end
	end
	return true
end
--------------------------------------------------------------------------------�ŭ������
function LuaS_103120_496393Create()
	if	CheckBuff(TargetID(),507412)	then
		CancelBuff(TargetID(),507412) --�����T��
		local NO16 = DW_CreateObjEX("obj",104809,TargetID(),1,0) --�Х�16��
		SysCastSpellLv(TargetID(),NO16,496266,1)--��w�ؼ�
		CallPlot(NO16,"LuaFunc_Obj_Suicide",100) --�]�w16����������
	end
end
------------------------------------------------------------------------------�Ŷ��ᦱ����
function LuaS_103120_508073Check()
	local Player = TargetID()
	local PosOfBuff = Lua_BuffPosSearch( Player , 508073 )
	local PowerLv = BuffInfo(Player,PosOfBuff,EM_BuffInfoType_Power)
	if	PowerLv ==13	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_12]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_13]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_12]", "0xFF98E0E7" )
	elseif	PowerLv == 8	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_11]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_09]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_11]", "0xFF98E0E7" )
	elseif	PowerLv == 0	then
		ScriptMessage( Player, Player, 2 , "[SC_103120_SANC_10]", "0xFF98E0E7" )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_09]", 0 )
		ScriptMessage( Player, Player, 0 , "[SC_103120_SANC_10]", "0xFF98E0E7" )
	end
end
--------------------------------------------------------------------------------���˥���
function LuaS_103120_LightCercle(Obj)
	SetPlot(Obj,"range","LuaS_103120_LightCercleMessage",390)
	AddBuff(Obj,508005,1,-1)
	while	true	do
		sleep(30)
		if	PE_GetActivePhaseIndex(1)~=0	then
			SysCastSpellLv(Obj,Obj,496390,2)
			SysCastSpellLv(Obj,Obj,496392,1)
		else
			return
		end
	end
end

function LuaS_103120_LightCercleMessage()
	ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_103120_CON_05004]", 0 )
end

function LuaS_103120_LightCercleNoSelf()
	if	TargetID() == OwnerID()	then
		return false
	end
	return true
end
------------------------------------------------------------------------------------���O�Ҧ�����
function LuaS_103120_TargetBuild(Num,BossID)
	local Target = {}--�ؼ�=�ƶq+1
	for i=1,4,1 do --4��
		Target[i] = {}
		for d=1,3,1 do
			local Temp=CreateObj_ByObjPoint(BossID,104775,Boss_103120_ReferencePoint[i])
			local TempObj=LuaS_103120_AidBuild_0(Temp,1,true,d,1);
			Target[i][d]=	LuaS_103120_AidBuild_0(	--�i����I�j�H�j�f���ǲ���
						Lua_CreateObjByDir( 
						 TempObj,
						104776 ,
						200 ,
						 0),
					1,--�����W�ߩ�԰��~
					false,--���i����
					d	) --���ܭ��V
			CallPlot(Target[i][d],"LuaS_103120_AidBuild_1",Target[i][d],BossID) --�����̦ۤv�H������
		end
	end
	return Target --�N�i����I�j���}�C�^��
end
--------------------------------------------------------------------
--------------------------------------------------------------------
function LuaS_103120_AidBuild_0(Obj,Condtition,BanAttack,DirChange,LiveTime)
	if	Condtition == 1	then--�����W�ߩ�԰��~
		DW_UnFight(Obj)
	elseif	Condtition ==2	then--�O�����ĩM����
		SetModeEx(Obj,EM_SetModeType_Fight,false) 
	end
	Lua_ObjDontTouch( Obj ) --���Ϊ���
	AddToPartition(Obj,0) -- �[�J����
	MoveToFlagEnabled(Obj, false)
	if	BanAttack==true	then
		AddBuff(Obj,507899,1,-1)--���i����
	end
	SetDir( Obj, (ReadRoleValue(Obj,EM_RoleValue_Dir)+(DirChange-2)*45)%360 )
	if	LiveTime~=nil	then
		WriteRoleValue(Obj,EM_RoleValue_LiveTime,LiveTime)
	end
	return Obj
end
--------------------------------------------------------------------
--------------------------------------------------------------------�ۥѲ���
function LuaS_103120_AidBuild_1(Obj,BossID)
	if	Obj == nil	then
		DeBugMSG(0,0,"Warming!! LuaS_103120_AidBuild_1==>Obj is nil")
		return false
	elseif	BossID==nil	then
		DeBugMSG(0,0,"Warming!! LuaS_103120_AidBuild_1==>BossID is nil")
		return false
	end
	local x,y,z
	While	true	do
		sleep(10)
		if	ReadRoleValue(Obj,EM_RoleValue_NpcOnMove)==0	then--���ʤ�����
			if	CheckDistance(Obj,BossID, 400)	then
				x=ReadRoleValue(Obj,EM_RoleValue_X)-150+DW_Rand(300)
				z=ReadRoleValue(Obj,EM_RoleValue_Z)+150-DW_Rand(300)
				y=GetHeight( x , ReadRoleValue(Obj,EM_RoleValue_Y) , z )
				if	DW_XYZCheckDis(x,y,z,ReadRoleValue(BossID,EM_RoleValue_X),ReadRoleValue(BossID,EM_RoleValue_Y),ReadRoleValue(BossID,EM_RoleValue_Z))<=400	then
					MoveDirect( Obj, x , y , z ) --�X��~����
					Sleep((DW_Rand(99)%3+1)*10)
				end
			else
				FaceObj( Obj, BossID)
				Sleep((DW_Rand(99)%3+1)*10)
			end
		end
	end
end
--------------------------------------------------------------------
--------------------------------------------------------------------�R������
function LuaS_103120_AidBuild_2(Array)
	for i=1,4,1 do
		if	Array[i]~= nil	then
			for d=1,3,1 do
				if	Array[i][d]~=nil	then
					DW_CheckThenDel(Array[i][d])
				end
			end
		end
	end
end
--------------------------------------------------------------------
function LuaS_103120_MuzzleBuild(Array,Lv,Obj,boolin)
	for i=1,4,1 do --4��
		for d=1,3,1 do		
			if	DW_Rand(999)%23==0	or boolin==true	then
				local Temp = CreateObj_ByObjPoint(Obj,104775,Boss_103120_ReferencePoint[i])
				local TempObj = LuaS_103120_AidBuild_0(Temp,1,true,1,6)
				SysCastSpellLv(TempObj,Array[i][d],Boss_103120_KillerWeaponList[DW_Rand(5)],Lv)
				if	boolin==nil	then
					break -- �@�ӰѦ��I�̦h�}���@��
				end
			end
		end
	end
end
--���ݳ�챱��
--------------------------------------------------------------------
--�ջ��
--------------------------------------------------------------------
LuaS_103120_Ghost_Controler = {}
function LuaS_103120_Ghost_Controler.enter(Ghost)
	local GhostValue = FSM_GetState(Ghost,"Execute")
	GhostValue.Array = {}
	GhostValue.Num = GetMoveFlagCount(780085)-1--�ջ�ƶq = 780085�X�`��-1
end
-------------------------------------
function LuaS_103120_Ghost_Controler.update(Ghost)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	"Over"
	end

	local GhostValue = FSM_GetState(Ghost,"Execute")
	for i=1,GhostValue.Num,1 do
		if	GhostValue.Array[i]==nil	then
--�Ĥ@��
			GhostValue.Array[i] = DW_CreateObjEX("flag",104620,780085,i,1,200)
			AddBuff(GhostValue.Array[i],507927,1,-1)
		else
--����B�z
--�p�G�ջ��
			if	CheckID(GhostValue.Array[i])==false	or
				ReadRoleValue(GhostValue.Array[i],EM_RoleValue_IsDead)==1	then
--�A�e�@���X��
				GhostValue.Array[i] = DW_CreateObjEX("flag",104620,780085,i,1,200)
				AddBuff(GhostValue.Array[i],507927,1,-1)
			end
		end
--�H������
		if	DW_Rand(999)%17==0	then
			DW_MoveRand(GhostValue.Array[i],100,1,780085,i)
			sleep(20)
		end
	end
end
-------------------------------------
function LuaS_103120_Ghost_Controler.leave(Ghost)
--�R���Ҧ����ջ�
	local GhostValue = FSM_GetState(Ghost,"Execute")
	for i=1,GhostValue.Num,1 do
		DW_CheckThenDel(GhostValue.Array[i])
	end
end

--------------------------------------------------------------------
LuaS_103120_Ghost_Dispear = {}
function LuaS_103120_Ghost_Dispear.update(Ghost)
	LuaS_103120_Ghost_Controler = {}
--�q�ӰT���]�i�H
end
--------------------------------------------------------------------����������g��
function LuaS_103120_TargetSearch()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
end
----------------------------------------------------------------------------
--�ĥ|���q����O�J��
--------------------------------------------------------------------
--��O�J�����@��
function LuaS_104618_DontDie()
	local Me = OwnerID()
	Say(Me,"[SC_103120_CON_40105]")
	WriteRoleValue(Me,EM_RoleValue_LiveTime,1)
	WriteRoleValue(Me,EM_RoleValue_HP,(ReadRoleValue(Me,EM_RoleValue_MaxHP)*0.3))
	return false
end
--�e���]�ƨþާ@��
function LuaS_103120_Freezer(Equip,Obj)
	while	true	do
		sleep(5)
--�n����
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
--�D�԰���
			if	HateListCount( Obj)==0	or
				ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
--�b�˳Ʈ���
				if	CheckDistance(Obj,Equip, 70)	then
--�S�I�k
					if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
--�p�G�˳ƳQ�I�k
						if	CheckBuff(Equip,507773)==true	then
							CancelBuff(Equip,507876)
							local Ran = DW_Rand(999)
							if	Ran % 11==0	then
--�J��
								PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
								Say(Obj,"[SC_103120_CON_40102]")
							elseif	Ran % 17==0	then
--�j�s
								Say(Obj,"[SC_103120_CON_40103]")
							end
						else
							sleep(20)
							if	CheckBuff(Equip,507773)==false	then--�T�{�O�I
								CastSpellLv(Obj,Equip,496280,1)--�}�l�I�k��w
								AddBuff(Equip,507876,1,3)
							end
						end
					else
--�w�g�b�I�k���� �n�P�_���S��buff
						local Ran = DW_Rand(999)
						if	CheckBuff(Equip,507773)==true	then
							CancelBuff(Equip,507876)
							SysCastSpellLv(Equip,Obj,492185,1)
							if	Ran%7==0	then
								Say(Obj,"[SC_103120_CON_40104]")
							end
						end
					end
				else
					DW_GetClose(Obj,Equip,55)
				end
			end
		end
	end
end

----------------------------------------------------------------------------
--�e���]�ƨð�����
function LuaS_103120_Thief(Equip,Obj)
	while	true	do
		sleep(15)
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
			if	HateListCount( Obj)==0	or
				ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
				if	CheckDistance(Obj,Equip,50)	then
					if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
						--���q�ʧ@
						CastSpellLv(Obj,Equip,496281,1)
						AddBuff(Equip,507773,1,3)
					end
				else
					DW_GetClose(Obj,Equip,40)
				end
			end
		end
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------�w���R��
function LuaS_103120_SafeDelObj(Obj)
	if	Obj==nil	then
		return false
	elseif	CheckID(Obj)==false or	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
		return false
	else
		DelObj(Obj)
		return true
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------�O�����]�w��
function LuaS_103120_Phase402_ForceSet(Obj)
	DW_UnFight(Obj)--���i�԰�
	Lua_ObjDontTouch( Obj )--���Q�o�{
	AddToPartition(Obj,0)
	AddBuff(Obj,507774,1,-1)--�S��
	SetPlot(Obj,"range","LuaS_103120_ForceTouch",35) --�}�ҤO��
	return Obj
end

---------------------------------------------------------------------------------------------------
--�o��Ĳ�oboss����O�J��
--------------------------------------------------------------------
function LuaS_103120_EricTMan(Anborel)
	local TMan = OwnerID()
--�����Y�H��buff�N��O���۪�
	while	true	do
		sleep(10)
		if	PE_GetActivePhaseIndex(1)~=50	then
			break
		end
		if	CheckBuff(TMan,507892)	then
			SetDefIdleMotion(TMan,ruFUSION_MIME_CRAFTING_LOOP)
			if	DW_Rand(999)%5==0		then
				PlayMotion(TMan,ruFUSION_ACTORSTATE_EMOTE_KICK)
			elseif	DW_Rand(999)%17==0	then
				PE_AddVar("EricTouchAmount",1)
			end
		else
			FaceObj( TMan, Anborel )
			AddBuff(TMan,507892,1,-1)
		end
	end
end

---------------------------------------------------------------------------------------------------
--�෽�l������
--------------------------------------------------------------------------------------------------
function LuaS_104761_Dead()
	return false
end
--------------------------------------------------------------------------------------------
--�Ķ����K�ׯ෽
function LuaS_116726_SetPlot()
	local Sec = 20 --���X�෽�H�����j
	local Owner = OwnerID()
	SetPlot(Owner,"dead","LuaS_104761_Dead",0)--�ä����`
	SetPlot(Owner,"touch","LuaS_116726_Touch",40)
	while	true	do
		sleep(20)
		if	ReadRoleValue(Owner,EM_RoleValue_PID)>12	then
			ScriptMessage( Owner, 0, 2, "[SC_103120_SANC_03]", 0 )
			DW_CheckThenDel(Owner) --��q�Ӻ�
		end
		SysCastSpellLv(Owner,Owner,496375,1)--���X�෽�H��(�C2��)
	end
end


function LuaS_116726_Touch()
	local Owner = OwnerID()
	local Target = TargetID()
	if	CheckBuff(Owner,507926)	then
		ScriptMessage( Owner, Owner, 1,"[SC_103120_SANC_08]", 0 )--�A�w�g�a���෽�F�I
		return false
	end
	if	BeginCastBarEvent(Owner,Target,"[SC_USING]",10,ruFUSION_ACTORSTATE_CAST_BEGIN,ruFUSION_ACTORSTATE_CAST_BEGIN,0 ,"LuaS_116726_GetSource")~=1	then
		ScriptMessage( Owner, Owner, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function LuaS_116726_GetSource(Executer,Result)
	if	Result>0	then
--���\���A
		local Target = TargetID()
		local PID = ReadRoleValue(Target,EM_RoleValue_PID)
		EndCastBar(Executer,Result)--�M���I�k��
		local Obj = SearchRangeNPC( Executer , 52 ) --�ˬd�d�򤺪��q�I
		for i=0,table.getn(Obj),1 do
			if	ReadRoleValue(Obj[i],EM_RoleValue_OrgID)==104757	then
				if	Boss_103120_BonusCheck ==0	then--����
					PE_AddVar("GetSource",10)
					LuaPE_KS_SetBonus( 1, 1, 8 , Executer )
					AddBuff(Executer,508075,0,-1)--�p��
				end
				ScriptMessage( Executer, Executer, 2, "[SC_103120_SANC_07]", 0 ) --���ܪ��a
				break
			end
			if	i==table.getn(Obj)	then --�d�򤺵L�h����buff
				AddBuff(Executer,507926,1,-1)
			end
		end
		WriteRoleValue(Target,EM_RoleValue_PID,PID+1)--�֭p�@��
		if	PID==11	then--�u��Q�Ķ��Q��
			ScriptMessage( Target, 0, 2, "[SC_103120_SANC_03]", 0 )
			DW_CheckThenDel(Target)--�R��
		end
	else
--���Ѫ��A
		EndCastBar(Executer,Result)--�M���I�k��
	end
end

function LuaS_116726_CancelBuff_01()
	local Owner = OwnerID()
	if	CheckBuff(Owner,507926)==true	then
		if	Boss_103120_BonusCheck ==0	then--����
			LuaPE_KS_SetBonus( 1, 1, 8,Owner )
			CancelBuff(Owner,507926)
			PE_AddVar("GetSource",10)--PE
			AddBuff(Owner,508075,0,-1)--�p��
		end
	end
	if	CheckBuff(Owner,508073)	then
		ScriptMessage( Owner, Owner, 0 ,"[SC_103120_SANC_14]", C_Yellow )
		CancelBuff(Owner,508073)
	end
end

function LuaS_116726_CancelBuff_02()
	local Owner = OwnerID()
	if	CheckBuff(Owner,508073)	then
		ScriptMessage( Owner, Owner, 0 ,"[SC_103120_SANC_14]", C_Yellow )
		CancelBuff(Owner,508073)
	end
end
-----------------------------------------------------------------------

--�෽���ͻP����
function LuaS_116726_OutputControl(GIDArray, ResetTimeArray,CreateRange,IfInitial)
	if	IfInitial==false	then
		for i=1,GetMoveFlagCount(780087)-1,1 do
			if	GIDArray[i]==nil	then
				if	ResetTimeArray[i] > 60	then
					GIDArray[i] = LuaS_116726_InitialSetPlot(DW_CreateObjEX("flag",116726,780087,i,1,CreateRange))
				else
					ResetTimeArray[i] = ResetTimeArray[i]+1
				end
			elseif	CheckID(GIDArray[i])==false	then
				GIDArray[i] = nil
				ResetTimeArray[i]=0
			end
		end
	else
		for i=1,GetMoveFlagCount(780087)-1,1 do
			GIDArray[i] = LuaS_116726_InitialSetPlot(DW_CreateObjEX("flag",116726,780087,i,1,CreateRange))
			ResetTimeArray[i] = 0
		end
	end
	return GIDArray,ResetTimeArray
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
function LuaS_116726_InitialSetPlot(Obj)
	BeginPlot(Obj,"LuaS_116726_SetPlot",0)
	return Obj
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
function LuaS_116726_AllClear(Array)
	for i=1,table.getn(Array),1 do
		DW_CheckThenDel(Array[i])
	end
end
-----------------------------------------------------------------------
function LuaS_SanctionDeadCount()
	local Target = TargetID()
	if	Boss_103120_BonusCheck ==0	then--����
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
	DW_CheckThenDel(OwnerID())
	return true
end


---------------------------------------------------------------------- ���~�]�ت��{�����O
function LuaS_103120_ItemDropList(Option)
	local PlayerID = OwnerID()
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725504 , 1 ) 
		GiveBodyItem( PlayerID , 206593 , 5 ) 
		if	DW_Rand(10000)<5	then
			GiveBodyItem( PlayerID , 725317 , 1) 
		end
		-----------   5.0.2  ���|boss�a��s�W�t��P���Ʊ���  --------------
		local R1 = Rand(100)+1
	--	Say(PlayerID, "R1 ="..R1 )
		if R1 > 95 then  -- random 1 ~ 100 , 5%�����t��
				if DW_Rand(100)>20 then --  80% ��a�t��
					GiveBodyItem( PlayerID , 552085 , 1)   -- ��a�t��
				else  -- 10%��b�t��
					GiveBodyItem( PlayerID , 552086 , 1)   -- ��b�t��
				end
		end
		local R2 = Rand(100)+1
--		Say(PlayerID, "R2 ="..R2 )
		if R2 >95 then  -- random 1 ~ 100 , 5%�����S�����
				if DW_Rand(100)>20 then --  80% ��a����
					GiveBodyItem( PlayerID , 241753 , 1)   -- ��a����
				else  -- 20%��b����
					GiveBodyItem( PlayerID , 241754 , 1)   -- ��b����
				end
		end

		-------------------------------------------------

	end
end

-----------------------------------------------------------------------�������_�@��
function LuaS_103120_BossDrop(Obj)
	ScriptMessage( Obj, -1, 2, "[SC_103120_CON_00000]", C_Yellow )
	for i=1,GetMoveFlagCount(780090),1 do
		LuaS_103120_DropNPCSet(DW_CreateObjEX("flag",116784,780090,i,1,140))
	end
end

function LuaS_103120_DropNPCSet(Obj)
	SetModeEx(Obj,EM_SetModeType_ShowRoleHead,false)  --���q���
	SetModeEx(Obj,EM_SetModeType_HideName,true)  --���q�W��
	SetPlot(Obj,"touch","LuaS_103120_DropTouchPlot",30)--Ĳ�I�@��
	WriteRoleValue(Obj,EM_RoleValue_LiveTime,30) --�s���ɶ�
	AddBuff(Obj,505498,1,-1) --�S��
	return Obj
end


function LuaS_103120_DropTouchPlot()
	SetPlot(TargetID(),"touch","",0)
	if	CheckAcceptQuest(OwnerID(),423651)==true	and
		CountBodyItem(OwnerID(),208310)==0	then
		GiveBodyItem(OwnerID(),208310,1)
	end
	GiveBodyItem(OwnerID(),240665,1)--�����ٸ�
	GiveBodyItem(OwnerID(),208435,1)--����������
	DW_CheckThenDel(TargetID())
end

-----------------------------------------------------------------------�i�J�X�եd��}���I���@��
function LuaS_Zone16to210_01()
	SetPlot(OwnerID(),"collision","LuaS_Zone16to210_02",0)
end

function LuaS_Zone16to210_02()
	local Coordinate = {}
	Coordinate[1] = {-1426.2,125,120,300.7}
	Coordinate[2] = {238.4,10,1764.8,72.9}
	Coordinate[3] = {2156.3,-125.1,184.5,176.2}
	Coordinate[4] = {75.9,10,-1368.9,287.2}

	local i = DW_Rand(999)%4+1
	ChangeZone( OwnerID() , 210 , 0 , Coordinate[i][1] , Coordinate[i][2] , Coordinate[i][3] , Coordinate[i][4] )
end

-------------------------------------------------------------------------�O���˴�

function LuaS_103120_IfOwnForceBuff()
	if	CheckBuff(TargetID(),507775)	then
		return false
	end
	return true
end