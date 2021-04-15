-------------------------------Initialization--------------------------------------------
function kg_Z14PE03_Init()
	Lua_Zone14_PE03_GlobalSet()
	Lua_Zone14_PE03_PESet()
end

function Lua_Zone14_PE03_GlobalSet()--�ܼƫŧi
	Zone14_PE03_PEIndex = 1403
	Zone14_PE03_UndeadCount = 0--�_�I�̫���[�W���ͬ������ͪ�����e�ƶq
	Zone14_PE03_UndeadMax = 10--�_�I�̫���P���ͬ������ͪ����W��
	Zone14_PE03_FlagID = 780885
	Zone14_PE03_FinishLine = 0--���I
	Zone14_PE03_QuestNPC = 0
	Zone14_PE03_WagonTrain = {}--����
	Zone14_PE03_Var = {}
	Zone14_PE03_Var["MapID"] = 433
	Zone14_PE03_Var["Enemy"] = {	105433,	--�u�\�h�L	--PID 140302
					105434,	--�u�\�k�v
					105435,	--�u�\�N�x
					105436	--�u�\�ɮv
					}
	Zone14_PE03_Var["Friend"] = {   105437,	--�_�I��1234	--PID 140301
					105438,	
					105439,	
					105440	
					}
	Zone14_PE03_FriendDeadDialogue = { "[SC_PE_ZONE14_03_TALK11]","[SC_PE_ZONE14_03_TALK12]","[SC_PE_ZONE14_03_TALK13]","[SC_PE_ZONE14_03_TALK14]","[SC_PE_ZONE14_03_TALK15]" }
end

function Lua_Zone14_PE03_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE14_03_NAME"					-- ��ԫe�e
	local PE_Desc = "SC_PE_ZONE14_03_DESC"					-- �e�u��a��ݭn�ɵ��A���ɵ����o�Q��񤤪������ͪ��h�h���Z�A��̤��������\�o�بƱ����o�͡C
	local PEIndex = Zone14_PE03_PEIndex
	local PHIndex = Zone14_PE03_PHIndex
	local TestID = 1
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , Zone14_PE03_Var["MapID"] )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	PE_AddPhase( PEIndex , 10 , "SC_PE_ZONE14_03_PH1_NAME", "SC_PE_ZONE14_03_PH1_DESC", 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , 10, 10, "", "", "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, 10, 10, false )
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	PE_SetCallBackOnPlayerEnter (PEIndex, "Lua_Zone14_PE03_Enter" )--�i�J�ϰ�
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone14_PE03_Leave" )--���}�ϰ�
	PE_Start( PEIndex , 10 )--�ƥ�Ұ�
end

function Lua_Zone14_PE03_Enter( PEIndex , Player )
	--DebugMsg(0,0,GetName(Player).."("..Player..")".." Enter "..PEIndex )
end

function Lua_Zone14_PE03_Leave( PEIndex ,Player )
	--DebugMsg(0,0,GetName(Player).."("..Player..")".." Leave "..PEIndex )
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
end

----------------------------------------------�ޯ�----------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_ReBuffBag()--�j�I�]�Q����
	local Oid = OwnerID()
	local Tid = TargetID()
	local NewBuffLv = KS_CheckBuffLV(Oid,509188)-1
	CancelBuff(Oid,509188)--�����j�I�]Buff
	if NewBuffLv>0 then
		AddBuff(Oid,509188,NewBuffLv-1,-1)
	else
		ScriptMessage( Oid, Oid, 2 , "[SC_PE_ZONE14_03_MESSAGE01]" , "0xffff0f0f" )--�A������I�U���G�w�g�ŤF�K
	end
end

function Lua_Zone14_PE03_Skill01()--�����q��
	local Oid = OwnerID()
	local Tid = TargetID()
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497336,"Name") , 50 , 148, 150, 0 , "Lua_Zone14_PE03_Skill01_CheckStatus")==1 then
		--WriteRoleValue(Oid,EM_RoleValue_Register10,1)
	end
end

function Lua_Zone14_PE03_Skill01_CheckStatus( ObjID, CheckStatus )
	local Oid = OwnerID()
	local Tid = TargetID()
	if CheckStatus>0 then
		EndCastBar(Oid,CheckStatus)
		if CheckBuff(Oid,509242)==true then
			CancelBuff(Oid,509242)
			SetModeEx( Tid , EM_SetModeType_Show, false)--�O�_ø�s�X�ҫ�
			CallPlot( Tid,"LuaFunc_ResetObj",Tid )--�j���
			kg_Z14PE03_GetQuestKey( Oid , 3 )--���a,�ƶq
		end
	else
		EndCastBar(Oid,CheckStatus)
	end
end

function Lua_Zone14_PE03_Skill02()--�����������
	local Oid = OwnerID()--���a
	local Tid =TargetID()--�����ͪ�
	if KillID( Oid, Tid )==TRUE then
		kg_Z14PE03_GetQuestKey( Oid , 1 )--���a,�ƶq
	end
end

function Lua_Zone14_PE03_Skill03()--�~��
	CancelBuff(OwnerID(),509223)--�M�����a���W���·t�A�G
end

function Lua_Zone14_PE03_Skill04()--�ɵ�����
	local Oid = OwnerID()--���a
	local Tid = TargetID()--NPC
	CallPlot( Tid , "Lua_Zone14_PE03_Skill04_01", Oid , Tid )
end

function Lua_Zone14_PE03_Skill04_01( Oid , Tid )--NPC�򪱮a��ܻP�����{
	if CheckBuff(Oid,509188)==true then
		Say(Tid,"[SC_PE_ZONE14_03_MESSAGE04]")--�A���M�W�ۭI�t�ɵ���}����ӨӡK�o�u�O�K�ӤF���_�F�I
		Sleep(10)
		local QuestNum=KS_CheckBuffLV(Oid,509188)
		kg_Z14PE03_GetQuestKey( Oid , QuestNum )--���a,�ƶq
		CancelBuff(Oid,509188)
	else
		Say(Tid,"[SC_PE_ZONE14_03_MESSAGE02]")--�ɵ��H�A���I�U���}�F�A�F�覭�N�����աK
		Sleep(15)
		ScriptMessage( Oid, Oid, 2 , "[SC_PE_ZONE14_03_MESSAGE03]" , "0xffff0f0f" )--�A�ۦ�d�ݪ���I�U�A�o�{�G�M�ŪŦp�]�C�u�n�A�^�h���@��F�K
	end
end

function Lua_Zone14_PE03_Skill05()--�g���ͩR
	local Oid = OwnerID()
	local Tid =TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_Register10)==0 then
		WriteRoleValue(Tid,EM_RoleValue_Register10,1)--�w�g�Q���a�N�F
		kg_Z14PE03_GetQuestKey( Oid , 3 )--���a,�ƶq
		Zone14_PE03_UndeadCount = Zone14_PE03_UndeadCount-1
		if Zone14_PE03_UndeadCount<0 then Zone14_PE03_UndeadCount=0 end
		DebugMsg( 0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount )
	end
end

function Lua_Zone14_PE03_Skill06()--�۳����
	local Oid = OwnerID()--���a
	local Vehicle = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if CheckID(Vehicle)==true then
		DelObj( Vehicle )
		WriteRoleValue(Oid,EM_RoleValue_Register9,0)
	end
	Vehicle = kg_GetRangePos(Oid,105480,30,-90)--�b���a���� �Z��30�X
	WriteRoleValue( Oid,EM_RoleValue_Register9,Vehicle )--�b���a���W�O�����
	WriteRoleValue( Vehicle,EM_RoleValue_Register9,Oid )
	AddToPartition( Vehicle,ReadRoleValue(Oid,EM_RoleValue_RoomID) )
end

function Lua_Zone14_PE03_Skill07()--�@�e�M�a
	local Tid =TargetID()--����
	CancelBuff(Tid,509222)
	AddBuff(Tid,509195,0,-1)
end

function Lua_Zone14_PE03_Skill07_01()--���������@�e�����a�����{
	local Tid =TargetID()--���a
	if CheckBuff( Tid, 509182 )==true and KS_CheckBuffLV(Tid,509250)>=10 then
		CancelBuff(Tid,509250)
		kg_Z14PE03_GetQuestKey( Tid , 15 )--���a,�ƶq
	end
end

function Lua_Zone14_PE03_Skill07_02()--�Q��buff�ӧP�_�����P���a�����Z��
	local Oid = OwnerID()--���a
	local Horse = Zone14_PE03_WagonTrain.Horse
	if kg_GetDis(Oid,Horse)>=300 or CheckID(Horse)~=true then
		CancelBuff(Oid,509250)
	end
end

function Lua_Zone14_PE03_Skill08()--���īe��(�۳�p��)	SC_NORIDE_2	--�A�L�k�b���ϥΧ��M�C
	local Oid = OwnerID()--���a
	if CheckBuff( Oid, 509196 )==true then--�b�p�դW�h�[�t
		local Goods = ReadRoleValue( ReadRoleValue(Oid,EM_RoleValue_Register10) , EM_RoleValue_Register9 );
		if CheckID(Goods)==true and ReadRoleValue(Goods,EM_RoleValue_IsNPC)==1 then
			AddBuff( Goods , 509257, 30, 20 );
		end
		AddBuff(Oid,509982,0,-1);
	end
	if kg_GetDis( Oid , Zone14_PE03_FlagID , 0 )>150 and CheckBuff( Oid, 509196 )~=true then
		ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	else
		if ReadRoleValue(Oid, EM_RoleValue_AttachObjGUID)~=-1 then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--�Х����}���M
		elseif CheckBuff( Oid, 509196 )~=true then--���W�S������buff�N��������buff
			local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID)
			Lua_Z14PE03_Skill08_DelHorse( Oid )--�R�����e������
		
			local Horse = kg_GetPos( Oid, 105481 )--�������Τp��
			kg_InvisibleObjInit( Horse )
			WriteRoleValue(Horse,EM_RoleValue_IsWalk,0)
			WriteRoleValue(Horse,EM_RoleValue_PassengerAttackable,1)--�����i���
		
			local Goods = kg_GetRangePos(Oid,105441,30,180)
			MoveToFlagEnabled( Goods, false )
			SetModeEx( Goods , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
			kg_MoveTarget( Goods )--�|���ʪ��йv
		
			WriteRoleValue( Horse,EM_RoleValue_Register9,Goods )
			WriteRoleValue( Goods,EM_RoleValue_Register9,Horse )
			WriteRoleValue( Oid,EM_RoleValue_Register10,Horse )
			WriteRoleValue( Horse,EM_RoleValue_Register10,Oid )
			WriteRoleValue( Goods,EM_RoleValue_Register10,Oid )
			AddToPartition( Goods,RoomID )
			AddToPartition( Horse,RoomID )
			SetCursorType( Horse , 40 )
			BeginPlot(Horse,"Lua_Zone14_PE03_Skill08_HorseCheckPlayer",0)
			SetPlot(Goods,"dead","Lua_Zone14_PE03_Dead04_02",0)
			AddBuff(Goods,508887,0,-1)--���^��
			AddBuff( Goods, 507514, 0, -1 )--�K�̪v��
			AddBuff(Oid,509196,0,-1)--�M��buff
			AttachObj( Horse , Oid , 2 ,"p_down","p_top" )--���s���a
			AttachObj( Goods , Horse , 0 ,"p_down","p_top" )--�Ԩ��s��
		end
	end
end

function Lua_Zone14_PE03_Skill08_GoodsCheckBuff()
	local Goods=OwnerID()
	local Player = ReadRoleValue( Goods, EM_RoleValue_Register10 )--�bPE�ϰ쪺�@�ɳf���s�դ��Areg10 ��"��"
	if CheckBuff(Player,509196)==true or ReadRoleValue(Player,EM_RoleValue_OrgID)==105481 then	--�ˬd���a�O�_�b���W
		AddBuff( Player ,508560, 1 ,-1 )--���i����
	end
end

function Lua_Zone14_PE03_Skill08_HorseCheckPlayer()--����d���a�O�_�_�u�Φ��`
	local Horse = OwnerID()
	local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
	local Player = ReadRoleValue(Horse,EM_RoleValue_Register10)
	local timer = 0
	--DebugMsg(0,0,"HorseCheckPlayer Start..")
	while 1 do
		SysCastSpellLv( Goods,Goods,497450,0 )--�s�J
		if timer%2==0 then
			if CheckID(Player)~=true or ReadRoleValue(Player,EM_RoleValue_IsDead)==1 or GetDistance(Player,Horse)>=300 or ReadRoleValue(Player,EM_RoleValue_IsPlayer)~=1 then
				Lua_Z14PE03_Skill08_DelHorse(Horse)
				break
			else
				if CheckBuff(Player,509196 )==true or ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==1 then--���a�S���b���W�ζi�J�԰��h�}�l�|�[�f���w����Buff,�ΨӥR���������m�p�ƾ�,�C10��@�|
					CancelBuff(Goods,509259)
				else
					if KS_CheckBuffLV(Goods,509259)>=1 and ReadRoleValue(Player,EM_RoleValue_IsAttackMode)==0 then
						Lua_Z14PE03_Skill08_DelHorse(Horse)
						break
					end
					AddBuff(Goods,509259,0,-1)--�[�W�f���ܦw��
				end
			end
		end
		Sleep(50)
		timer = timer+1
	end
end

function Lua_Zone14_PE03_Skill08_01()--�U��,���a�Q�Ǫ����ɤ]�|�U��
	local Oid = OwnerID()--���a
	CancelBuff(Oid,508560)--�w������
	local Horse =  ReadRoleValue(Oid,EM_RoleValue_Register10 )
	if CheckID(Horse)==true and Lua_Zone14_PE03_CheckMapID(Oid)==true then
		local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
		DetachObj(Horse)
		SetPos( Horse,kg_GetPos(Oid) )
		DetachObj(Goods)
		SetPos( Goods,kg_GetRangePos(Horse,nil,25,180))
		Lua_Z14PE03_Skill08_HorseSetup(Horse,true)
		SysCastSpellLv( Goods,Goods,497377,0 )
	end
	CancelBuff_NoEvent(Oid,509196)
end

function Lua_Z14PE03_Skill08_TouchHorse()--�I���W��
	local Oid = OwnerID()--���a
	local Horse = TargetID()
	--Say(Horse,"TouchHorse....Horse="..Horse)
	local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9)
	--DebugMsg(0,0,"Player Reg10= "..ReadRoleValue(Oid,EM_RoleValue_Register10) )
	if ReadRoleValue(Oid,EM_RoleValue_AttachObjGUID)~=-1 then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--�ޯ���󤣲�
	elseif ReadRoleValue(Oid,EM_RoleValue_Register10)==Horse then
		Lua_Z14PE03_Skill08_HorseSetup(Horse,false)
		SetPos(Oid,kg_GetPos(Horse))
		AddBuff(Oid,509196,0,-1)
		AttachObj( Horse , Oid , 2 ,"p_down","p_top" )
		AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
	end
end

function Lua_Z14PE03_Skill08_HorseSetup(Horse,Visible)
	Hide(Horse)
	SetModeEx( Horse , EM_SetModeType_ShowRoleHead, Visible) 	---�Y����(�_)
	SetModeEx( Horse , EM_SetModeType_Mark, Visible)
	SetModeEx( Horse , EM_SetModeType_Show, Visible)--�O�_ø�s�X�ҫ�
	if Visible==true then
		SetPlot( Horse , "touch" , "Lua_Z14PE03_Skill08_TouchHorse" , 30)
	else
		SetPlot( Horse , "touch" , "" , 30)
	end
	Show(Horse,0)
end

function Lua_Z14PE03_Skill08_DelHorse(Obj)--���a���`�ɤ]�|�I�s
	Obj = Obj or OwnerID()
	if ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==1 then
		CancelBuff_NoEvent(Obj,509196)
		local Horse =  ReadRoleValue(Obj,EM_RoleValue_Register10)
		if CheckID(Horse)==true then
			WriteRoleValue(Obj,EM_RoleValue_Register10,0)
			local Goods = ReadRoleValue(Horse,EM_RoleValue_Register9 )
			DetachObj( Goods )
			DelObj( Goods )
			DelObj( Horse )
		end
	elseif ReadRoleValue(Obj,EM_RoleValue_OrgID)==105481 then
		local Player = ReadRoleValue(Obj,EM_RoleValue_Register10)
		if CheckID(Player)==true then CancelBuff_NoEvent(Player,509196) end
		local Goods = ReadRoleValue(Obj,EM_RoleValue_Register9 )
		DetachObj( Goods )
		DelObj( Goods )
		DelObj( Obj )
	end
end

function Lua_Zone14_PE03_MonsterSkill01()--�۳ꤣ���ͪ�
	local Oid = OwnerID()--�Ǫ�����
	local RoomID =ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local BossID = Zone14_PE03_Var["Enemy"][3]--�N�x
	local MageID = Zone14_PE03_Var["Enemy"][2]--�k�v
	local Undead=0
	for i=1,3 do
		if i==1 then
			Undead = kg_GetRangePos(Oid,BossID,60)
		elseif i==2 then
			Undead = kg_GetRangePos(Oid,MageID,60,45)
		else
			Undead = kg_GetRangePos(Oid,MageID,60,-45)
		end
		SetModeEx( Undead , EM_SetModeType_Revive, false )	--�i����
		AddToPartition(Undead,RoomID)
		AddBuff(Undead,509477,0,-1)
	end
end
----------------------------------------------Check-----------------------------------------------------------------------------
function Lua_Zone14_PE03_CheckMapID( Obj )
	Obj = Obj or OwnerID()
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	if CheckMapID(x,y,z,433)==true or CheckMapID(x,y,z,1)==true then
		return true
	end
	ScriptMessage( Obj, Obj, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function Lua_Zone14_PE03_CheckTarget01()--�P�w�ؼЬO�_���q��
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==117783 and CheckBuff(Oid,509242)==true then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE03_CheckTarget02()--�P�w�ؼЬO�_���u�\�N�x
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105435 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end 

function Lua_Zone14_PE03_CheckTarget03()--�P�w�ؼЬO�_������(�u�\�ɮv��)
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105441 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end 

function Lua_Zone14_PE03_CheckTarget04()--�P�w�ؼЬO�_��ú�^���ꪺNPC
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==117781 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end 

function Lua_Zone14_PE03_CheckPID01s()--�P�w�ؼЬO�_���_�I�̫���
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140301  then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE03_CheckPID01ss()--�P�w�ؼЬO�_���_�I�̫���
	local Oid =OwnerID()
	local Tid = TargetID()
	if (ReadRoleValue(Tid,EM_RoleValue_PID)==140301 or ReadRoleValue(Tid,EM_RoleValue_PID)==140303) and CheckBuff(Tid,509248) then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE03_CheckPID02s()--�P�w�ؼЬO�_�������ͪ�
	local Oid =OwnerID()
	local Tid = TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140302 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE03_CheckPID02ss()--�P�w�ؼЬO�_�������ͪ�(�R�E����)
	local Oid =OwnerID()
	local Tid = TargetID()
	local Player = ReadRoleValue(Oid,EM_RoleValue_Register10)
	if ReadRoleValue(Tid,EM_RoleValue_PID)==140302 and Player~=0 then
		return TRUE
	end
	ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone14_PE03_CheckArea01()--�P�w�O�_�bNPC=>A����
	local Oid = OwnerID()--���a
	if kg_GetDis( Oid , Zone14_PE03_FlagID , 0 )<=150 then
		return true
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function Lua_Zone14_PE03_CheckBuff01()--�ˬd���a���W���S��E buff ,������
	local Tid = TargetID()--���a
	if CheckBuff( Tid , 509182 ) then
		return true
	end
	return false
end

function Lua_Zone14_PE03_CheckTicket()--�ˬd���a���W���S�����㨮��
	local Vehicle = OwnerID()
	local Player =TargetID()
	if ReadRoleValue(Player, EM_RoleValue_AttachObjGUID)~=-1 then
		ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE14_03_ERROR01]" , 0 )--�Х����}���M
	elseif ReadRoleValue(Player,EM_RoleValue_Register9)==Vehicle and CheckBuff(Player,509180)==true then
		if ReadRoleValue(Vehicle,EM_RoleValue_Register10)~=-1 then
			return true
		else
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE14_03_MESSAGE06]" , "0xffff0f0f" )--���L��
		end
	else
		ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	end
	return false
end

----------------------------------------------Born------------------------------------------------------------------------------------
function Lua_Zone14_PE03_Born( Oid )--�X�ͦ@��
	Oid = Oid or OwnerID()
	SetFlag( Oid, 544801, 1 )--�������_��
end

function Lua_Zone14_PE03_Born01() --�����ͪ��X��
	local Oid =OwnerID()--�����ͪ�
	Lua_Zone14_PE03_Born(Oid)
	WriteRoleValue(Oid,EM_RoleValue_PID,140302)
end

function Lua_Zone14_PE03_Born02()--�_�I��,�Y��PE�ߤ@���������h��140303
	local Oid =OwnerID()--�_�I��
	Lua_Zone14_PE03_Born(Oid)
	SetDefIdleMotion(Oid,-1)--�]�w��l�ʧ@
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)--���`��w�A�קK�P�ɳQ�@��Ǫ������ɭP����p����~
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--�Q���a��ū
	WriteRoleValue(Oid,EM_RoleValue_PID,140301)
end

function Lua_Zone14_PE03_Born03()--����
	local Oid =OwnerID()--����
	Hide(Oid)
	Lua_Zone14_PE03_Born(Oid)
	kg_Target(Oid)
	SetModeEx( Oid , EM_SetModeType_Revive, false )	--�i����
	Show(Oid,0)
	AddBuff(Oid,509251,0,-1)--�w�ɧ䪱�a���|�O�@buff
end

function Lua_Zone14_PE03_Born04()--���I�d��@��
	local Oid =OwnerID()--���I
	Zone14_PE03_FinishLine=Oid
	Hide(Oid)
	kg_InvisibleObjInit( Oid )
	Show(Oid,0)
	setplot( Oid,"range","Lua_Zone14_PE03_FinishLine",100 )
	Lua_Zone14_PE03_WTCtrlInit()
end

function Lua_Zone14_PE03_Born05()--�����a�O���d��@��
	function Lua_Zone14_PE03_FloorGetHeight()
		local Player = OwnerID()--���a
		local Obj = TargetID()--�d��@�����D�H
		local Vehicle = ReadRoleValue(Player,EM_RoleValue_Register10)--�R�E��: ���a������ӥB�����b�W��,�p��: �p�ժ�GID
		if CheckBuff( Player , 509180 )==true and ReadRoleValue(Vehicle,EM_RoleValue_OrgID)==105480 then
			SetPos( Player, kg_GetPosRX( Player  ,nil , 0 , 0 ) )
			--Say(Player,"Vehicle GetHeight!!")
		elseif CheckBuff( Player , 509183 )==true and CheckBuff( Player , 509196 )==true and ReadRoleValue(Vehicle,EM_RoleValue_OrgID)==105481 then
			local Goods = ReadRoleValue(Vehicle,EM_RoleValue_Register9)--���o�f��
			DetachObj(Goods)
			SetPos( Goods,kg_GetPosRX(Player,nil,25,0,180) )
			AttachObj( Goods , Vehicle , 0 ,"p_down","p_top" )
			--Say(Goods,"GetHeight!!")
		end
	end
	
	SetPlot( OwnerID(),"range","Lua_Zone14_PE03_FloorGetHeight",150 )
end

function Lua_Zone14_PE03_Born06()--����NPC�N�ۤv�O�b�����ܼ�,���F�򨮶�������ܥ�
	Zone14_PE03_QuestNPC=OwnerID()
end

function Lua_Zone14_PE03_FinishLine()--���a��F��a�P�w�O�_���������{
	local Player = OwnerID()
	if CheckBuff(Player,509183)==true and CheckBuff(Player,509196)==true then
		kg_Z14PE03_GetQuestKey( Player , 15 )
		Lua_Z14PE03_Skill08_DelHorse(Player)
	end
end

function Lua_Zone14_PE03_VehicleBorn()--���b�ҪO�W
	local Oid =OwnerID()
	Lua_Zone14_PE03_Born( Oid )
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--�D�H�S���b�b����W
	SetModeEx( Oid , EM_SetModeType_Revive, false )	--�i����
	AddBuff(Oid,508887,0,-1)--���^��
	AddBuff( Oid, 507514, 0, -1 )--�K�̪v��
	BeginPlot( Oid,"Lua_Zone14_PE03_VehicleLiveTimer",0 )
end

function Lua_Zone14_PE03_VehicleTouch( Seat , UpDown )--���a�I��W��
	local Player = OwnerID()
	local Vehicle = TargetID()
	--DebugMsg(0,0,"Seat = "..Seat)--���a�W���᪺��m�A�U���|��-1
	--DebugMsg(0,0,"UpDown = "..UpDown)--�W��1 �U��0
	local SkillID = {}
	SkillID[1]={ 497341 , 0  }--�ļ�
	SkillID[2]={ 497342 , 0  }--�[�t
	if UpDown==1 then
		WriteRoleValue(Player,EM_RoleValue_Register10,Vehicle)--�N�Ĩ��O�b���a���W
		WriteRoleValue(Vehicle,EM_RoleValue_Register10,Player)--�N�Ĩ��O�b���a���W
		for i in pairs(SkillID) do
			SetExSkill( Player , Vehicle , SkillID[i][1] , SkillID[i][2] )
		end
	elseif UpDown ==0 then
		WriteRoleValue(Player,EM_RoleValue_Register10,0)
		WriteRoleValue(Vehicle,EM_RoleValue_Register10,-1)
		DelExSkill( Player , -1 , -1 )
		BeginPlot(Vehicle,"Lua_Zone14_PE03_VehicleExplode",0)
	end
end

function Lua_Zone14_PE03_VehicleLiveTimer()--���a��۳�X��10�����S�W���N�R��,�C10���ˬd�O�_�W�X�ϰ�d��
	local Vehicle = OwnerID()
	for i =1 , 10 do
		Sleep(10)
		if ReadRoleValue(Vehicle,EM_RoleValue_Register10)>0 then--���a�W����h���X�R���P�w
			break
		elseif i==10 then
			DelObj(Vehicle)
		end
	end
	while 1 do
		local X = ReadRoleValue( Vehicle , EM_RoleValue_X )
		local Y = ReadRoleValue( Vehicle , EM_RoleValue_Y )
		local Z = ReadRoleValue( Vehicle , EM_RoleValue_Z )
		if Zone14_PE03_Var["MapID"]~=nil then
			--DebugMsg(0,0,"Vehicle MapID="..Zone14_PE03_Var["MapID"])
			if CheckMapID(X,Y,Z,Zone14_PE03_Var["MapID"])~=true and CheckMapID(X,Y,Z,1)~=true and ReadRoleValue(Vehicle,EM_RoleValue_Register10)~=-1 then
				KillID(Vehicle,Vehicle)
			end
		else
			DebugMsg(0,0,"MapID==nil!")
			KillID(Vehicle,Vehicle)
		end
		Sleep(100)
	end
end

function Lua_Zone14_PE03_VehicleExplode()--���a�U���z�}
	local Vehicle = OwnerID()
	local Player = ReadRoleValue(Vehicle,EM_RoleValue_Register9)
	SysCastSpellLv( Vehicle,Vehicle,497373,10)--�d��D�]
	ScriptMessage( Player, Player, 2 , "[SC_PE_ZONE14_03_MESSAGE05]" , "0xffff0f0f" )
	Sleep(30)
	SysCastSpellLv(Vehicle,Vehicle,497372,0)--���z
	Sleep(3)
	KillID(Vehicle,Vehicle)
end

function Lua_Zone14_PE03_VehicleAttack()
	local Vehicle = OwnerID()
	local Undead = TargetID()
	KillID(Vehicle,Undead)
end

----------------------------------------------Dead--------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_UndeadDead( Oid , Tid )--�����ͪ����`�@��
	if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then--��ܬ��_�I�̭��ͥX�Ӫ�
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		Zone14_PE03_UndeadCount = Zone14_PE03_UndeadCount-1
		if Zone14_PE03_UndeadCount<0 then Zone14_PE03_UndeadCount=0 end
		DebugMsg(0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
	end
	
	if ReadRoleValue(Tid,EM_RoleValue_OrgID)==105480 then--�R�E��
		local Player = ReadRoleValue(Tid,EM_RoleValue_Register9)--�䪱�a
		if CheckBuff( Player, 509180 )==true then
			kg_Z14PE03_GetQuestKey( Player , 1 )--���a,�ƶq
		end
	end
end

function Lua_Zone14_PE03_Dead01()--�����ͪ����` EM_RoleValue_Register10 ��ܦ������ͪ����_�I�̭��ͪ�
	local Oid =OwnerID()--�����ͪ�
	local Tid =TargetID()--�����R�E��or ��L
	Lua_Zone14_PE03_UndeadDead( Oid , Tid )
	local PickOwner = GetGUIDByDBID( ReadRoleValue(Oid,EM_RoleValue_BeginAtkDBID) )
	if PickOwner>0 then Tid=PickOwner end
	if CheckBuff(Tid,509184)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then--�i��ݭn�P�wGM
		kg_Z14PE03_GetQuestKey( Tid , 1 )--���a,�ƶq
	end
	return true
end

function Lua_Zone14_PE03_Dead02()--�u�\�ɮv���`
	local Oid =OwnerID()--�����ͪ�
	local Tid =TargetID()--�����R�E��or ��L
	Lua_Zone14_PE03_UndeadDead( Oid ,Tid )
	local PickOwner = GetGUIDByDBID( ReadRoleValue(Oid,EM_RoleValue_BeginAtkDBID) )
	if PickOwner>0 then Tid=PickOwner end
	if CheckBuff(Tid,509185)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then
		kg_Z14PE03_GetQuestKey( Tid , 15 )--���a,�ƶq
	elseif CheckBuff(Tid,509184)==true and ReadRoleValue(Tid,EM_RoleValue_IsPlayer)==1 then--�i��ݭn�P�wGM
		kg_Z14PE03_GetQuestKey( Tid , 1 )--���a,�ƶq
	end
	return true
end

function Lua_Zone14_PE03_Dead03()--�_�I�̦��`
	local Oid =OwnerID()--�_�I��
	if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then--�w�g�Q���N
		return true
	end
	if ReadRoleValue(Oid,EM_RoleValue_Register7)==0 then
		WriteRoleValue(Oid,EM_RoleValue_Register7,1)--��w���`�A�קK�Q�Ǫ����ƥ���
		Say(Oid, Zone14_PE03_FriendDeadDialogue[kg_Rand(5)] )
		PlayMotion(Oid,ruFUSION_ACTORSTATE_DYING)--���񦺤`�ʧ@
		SetDefIdleMotion(Oid,ruFUSION_MIME_IDLE_DEAD)--�]�w�]�ʧ@�����`
		local FriendArray = Zone14_PE03_WagonTrain.Friend
		if FriendArray~=nil then
			for i in pairs(FriendArray) do
				if FriendArray[i]==Oid then
					DebugMsg(0,0,"Pe1403_RemoveWTMember.."..Oid)
					Debuglog(2,"Pe1403_RemoveWTMember.."..Oid)
					table.remove( Zone14_PE03_WagonTrain.Friend,i )
					DebugMsg(0,0,"Pe1403_WTMemberCount="..table.getn(Zone14_PE03_WagonTrain.Friend))
					Debuglog(2,"Pe1403_WTMemberCount.."..table.getn(Zone14_PE03_WagonTrain.Friend))
					break
				end
			end
		end
		CancelBuff(Oid, 509304 )
		AddBuff(Oid,509248,0,-1)--����buff
		Hide(Oid)
		kg_DeadBody( Oid )
		Show(Oid,0)
		local UndeadCount = Zone14_PE03_UndeadCount+1
		if UndeadCount<= Zone14_PE03_UndeadMax  then
			Zone14_PE03_UndeadCount=UndeadCount
			DebugMsg(0,0,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
			Debuglog(2,"Zone14_PE03_UndeadCount = "..Zone14_PE03_UndeadCount)
			CallPlot( Oid,"Lua_Zone14_PE03_UndeadReborn",Oid,1 )
			return false
		end
		CallPlot( Oid,"Lua_Zone14_PE03_UndeadReborn",Oid,0 )
		return false
	end
end

function Lua_Zone14_PE03_UndeadReborn( Oid , UndeadBorn )--�_�I�̭��ͬ������ͪ�,Oid:�_�I��,
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	Sleep(100)
	if ReadRoleValue(Oid,EM_RoleValue_Register10)~=1 and UndeadBorn==1 then --���a�S���Q���a�N
		WriteRoleValue(Oid,EM_RoleValue_Register10,2)--�w�i�J���Ͷ��q
		local UnDeadID = Zone14_PE03_Var["Enemy"][kg_Rand(3)]
		local UnDead = kg_GetPos(Oid,UnDeadID)
		SetModeEx( UnDead , EM_SetModeType_Revive, false )	--�i����
		WriteRoleValue( UnDead,EM_RoleValue_Register10,1 )
		AddToPartition(UnDead,RoomID)
	end
	if ReadRoleValue(Oid,EM_RoleValue_PID)==140301 then
		CallPlot( Oid,"LuaFunc_ResetObj",Oid )--�j���
	else
		DelObj(Oid)
	end
end

function Lua_Zone14_PE03_Dead04_01()--�������`
	local Oid =OwnerID()--����
	BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WtFail",0 )
	BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WTCtrlInit",300)--30��᭫�ͨ���
	return true
end

function Lua_Zone14_PE03_Dead04_02()--���a�۳�X�Ӫ��������`
	local Goods =OwnerID()--����
	local Horse = ReadRoleValue(Goods,EM_RoleValue_Register9)
	local Player = ReadRoleValue(Horse,EM_RoleValue_Register10)
	CancelBuff_NoEvent(Player,509196)
	DetachObj(Horse)
	SetPos( Horse,kg_GetPos(Player) )
	DetachObj(Goods)
	SetPos( Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
	Hide(Horse)
	SetModeEx( Horse , EM_SetModeType_Show, true)--�O�_ø�s�X�ҫ�
	Show(Horse,0)
	BeginPlot( Horse,"kg_Z14PE03_HorseRunAway", 1 )
	WriteRoleValue(Player,EM_RoleValue_Register10,0)
	return true
end