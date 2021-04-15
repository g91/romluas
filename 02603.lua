--AC��BUFF
function AC1_fxForThePool1()
	local Player = OwnerID()
	--local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	--local X = ReadRoleValue( Player , EM_RoleValue_X )
	--local Y = ReadRoleValue( Player , EM_RoleValue_Y )
	--local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	--local Range = 60
	--local ObjX , ObjZ = {} , {}
	--local ObjID = 120328
	--local Npc = {}
	SetModeEx( Player , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	SetModeEx( Player, EM_SetModeType_ShowRoleHead, false )
	SetModeEx( Player  , EM_SetModeType_HideName, false )

	--for i = 1 , 4 , 1 do
	--	ObjX[i] = X - Range * math.cos(math.pi*2*(i/4))
	--	ObjZ[i] = Z + Range * math.sin(math.pi*2*(i/4))
	--	Npc[i] = CreateObj( ObjID , ObjX[i] , Y , ObjZ[i] , 0 , 1 )
	--	MoveToFlagEnabled( Npc[i] , false )
	--	AddToPartition( Npc[i] , Room )
	--end
	AddBuff(Player,622001,0,-1);
end
function AC1_fxForThePool2()
	AddBuff(OwnerID(),622002,0,-1);
end

function AC1_lv1QNPCreat()
	local NpcObj={};
	for i=1,14,1 do
		NpcObj[i] = Lua_DW_CreateObj( "flag" , 120332+i , 780871 , i , 1 , 1 );
		DebugMsg(0,0,i.." create OK!")
	end
end

--npc�d��@��
--�X��546166�A��L�����N�����û��X��
--�X��546165�A���F��N������
function AC1_npcCatchTarget1()
	SetPlot( OwnerID(), "range" , "AC1_npcCatchTarget2" , 100 )
end
--���p�S��546166 �N��546165
function AC1_npcCatchTarget2()
	if CheckFlag(OwnerID(),546067) ==false then
		NpcSay( TargetID() ,"[SC_AC1_L1_NPCTELL]"); 
		Setflag(OwnerID(),546165,1)
		AdjustFaceDir(TargetID(),OwnerID(),0);
		PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_WAVE );
	end
end

--npc�d��@��
--�X��546166�A��L�����N�����û��X��
--�X��546165�A���F��N������
function AC1_npcCatchTarget3()
	SetPlot( OwnerID(), "range" , "AC1_npcCatchTarget4" , 100 )
end
--���p�S��546166 �N��546165
function AC1_npcCatchTarget4()
	if CheckFlag(OwnerID(),546067) ==false then
		NpcSay( TargetID() ,"[SC_AC1_L1_NPCTELL2]"); 
		Setflag(OwnerID(),546165,1)
		AdjustFaceDir(TargetID(),OwnerID(),0);
		PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_WAVE );
	end
end

--npc��ܰʧ@
function AC1_npcLoqGiveFlag()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
end
--

function AC1_boss1CenterCtrlCreat()
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	Lua_ACWB_Boss1_Ctrl()
end

--
--��l��
--����@�ӫ��O��������t����
--��l�ơA�������npc��Areload
function AC1_npcCtrlInit()
	local TimeC=ReadRoleValue(OwnerID(),EM_RoleValue_Register1);
	local NPC1=ReadRoleValue(OwnerID(),EM_RoleValue_Register2);	--��t1��npc
	local NPC2=ReadRoleValue(OwnerID(),EM_RoleValue_Register3);
		if TimeC~=0 then
			DelObj(TimeC);
			WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0);
		end
		if NPC1~=0 then
			DelObj(NPC1);
			WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0);
		end
		if NPC2 ~=0 then
			DelObj(NPC2);
			WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0);
		end
	
end
--��l�@��
--���ͭp�ɾ�npc�A�����p�ɾ�npc(���_)
--���ͤ�����t�A���_������t
function AC1_npcCtrl()
	local npcCtrl=OwnerID()
	--�ɶ�����npc
	local timeCtrl=LuaFunc_CreateObjByObj( 120423, npcCtrl )			
		WriteRoleValue(npcCtrl,EM_RoleValue_Register1,timeCtrl)	
		WriteRoleValue(timeCtrl,EM_RoleValue_Register1,npcCtrl)
		--���W�p�ɾ�	
		CallPlot(timeCtrl,"AC1_npcTimeCtrl",npcCtrl);						
end
--���ͤ�����t�p�ɾ�npc
function AC1_npcTimeCtrl(npcCtrl)
	local NTime=0;
	local i=0
	local NPCA=0;
	local NPCB=0;
	local TNPC1={113961,113962,113964}
	local TNPC2={113980,120420,120421}
		--NTime��F3�ɲ��ͪ�t1�ANTime��F7�ɲ��ͪ�t2
		while true do
			if NTime==0 then
				if i<3 then i=i+1 else i=1 end --i�{3�k1
				DebugMsg(0,0,"i="..i)
			elseif NTime%7==0 then
				NPCB=CreateObjByFlag( TNPC2[i], 780871 , 3 , 1 );
				DebugMsg(0,0,"CreateObj="..TNPC2[i])
				NPCA=ReadRoleValue(npcCtrl,EM_RoleValue_Register3)
				DebugMsg(0,0,"NPCA="..NPCA)
				WriteRoleValue(npcCtrl,EM_RoleValue_Register3,NPCB);
				CallPlot(NPCB,"AC1_npcThrowCoin2",NPCA);
				NPCA=0;
			elseif NTime%3==0 then
				NPCB=CreateObjByFlag( TNPC1[i], 780871 , 1 , 1 );
				DebugMsg(0,0,"CreateObj="..TNPC1[i])
				NPCA=ReadRoleValue(npcCtrl,EM_RoleValue_Register2)
				DebugMsg(0,0,"NPCA="..NPCA)
				WriteRoleValue(npcCtrl,EM_RoleValue_Register2,NPCB);
				CallPlot(NPCB,"AC1_npcThrowCoin1",NPCA);
				NPCA=0;
			end
			--Sleep(36000);			--�C�p��
			Sleep(200)
			NTime=NTime+1;		--�C�L1�p�ɥ[1
			if NTime==8 then NTime=0 end
			DebugMsg(0,0,"NTime="..NTime)
		end

end
--���ͤ�����t1�A���bnpc���W
function AC1_npcThrowCoin1(NPCA)
	--����l�������X����
	if NPCA ~= 0 then
		MoveToFlagEnabled( NPCA , false )
		SetModeEx( NPCA  , EM_SetModeType_Mark, false )		--���I��
		LuaFunc_MoveToFlag( NPCA, 780871, 5 , 0 )			--���ʦ�5���X
		Sleep(50)
		DelObj(NPCA)
	end
	--
	local Obj=OwnerID()
	SetModeEx( Obj , EM_SetModeType_Mark, false )
	AddToPartition(Obj,0)
	WriteRoleValue( Obj , EM_RoleValue_IsWalk , 0 )
	DebugMsg(0,0,Obj.."addtoPartion")
	LuaFunc_MoveToFlag( Obj, 780871, 2 , 0 )
	Sleep(50)
	SetModeEx( Obj , EM_SetModeType_Mark, true )	
end
--���ͤ�����t2
function AC1_npcThrowCoin2(NPCA)
	--����l�������X����
	if NPCA ~= 0 then
		MoveToFlagEnabled( NPCA , false )
		SetModeEx( NPCA  , EM_SetModeType_Mark, false )		--���I��
		LuaFunc_MoveToFlag( NPCA, 780871, 5 , 0 )			--���ʦ�5���X
		Sleep(50)
		DelObj(NPCA)
	end
	--
	local Obj=OwnerID()
	SetModeEx( Obj , EM_SetModeType_Mark, false )
	DebugMsg(0,0,Obj.."addtoPartion")
	AddToPartition(Obj,0)
	WriteRoleValue( Obj,EM_RoleValue_IsWalk , 1 ) 
	LuaFunc_MoveToFlag( Obj, 780871, 4 , 0 )
	Sleep(50)
	SetModeEx( Obj , EM_SetModeType_Mark, true )		
end

--npc��ܮɲ��ͭ��V�P�ʧ@�G
function AC1_npcAdjudustdirPlayer()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(OwnerID(),TargetID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
end
function WorldAC_PhaseChange(time)
	SetWorldVar( "Zone2_WorldPE_Phase"  , time )--�]�w���q

end
