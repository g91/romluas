-------------------��֤֪���T�^�ǧA�n���y��-----------------
	
function DW_Location(GUID_or_FlagID,FlagNum)
	local x,y,z,dir
	if	FlagNum==nil	then
		--Obj
		local Obj = GUID_or_FlagID;
		x=ReadRoleValueFloat(Obj,EM_RoleValue_X);
		y=ReadRoleValueFloat(Obj,EM_RoleValue_Y);
		z=ReadRoleValueFloat(Obj,EM_RoleValue_Z);
		dir=ReadRoleValueFloat(Obj,EM_RoleValue_Dir);
	else
		--Flag
		local FlagID = GUID_or_FlagID
		x=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X);
		y=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Y);
		z=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z);
		dir=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Dir);
	end
	x	=x-x%0.01;
	y	=y-y%0.01;
	z	=z-z%0.01;
	return x,y,z,dir;
end
-------���Ψ禡:�PŪ2�i�즡�����(�^��true�h���ġAfalse�h���S��)-----------------
	
function DW_CheckGameInfoBitColumn(DBID,ColumnStr,SN)
	local Value = GameObjInfo_Int(DBID,ColumnStr);
	if	CheckBit(Value,SN)==true	then
		return true;
	else
		return false;
	end
end

----------------�p�G�Ӱ򥻪k�N��dot�ݩʫh�^��false------------------------------
	
function DW_ExcludeDotBuff(BuffID)
--BuffID:	system return to this function
--"SettingFlag": Column Name of Objeditor v0.20
--3:		SN of Dot in "SettingFlag" Column

	if	DW_CheckGameInfoBitColumn(BuffID,"SettingFlag",3)==true	then
DeBugMSG(0,0,"Dot NO!")
		return false
	end
end
----------------�ư�Table�A���H�����G-------------------------------
	
--�qTable1���A�H����ƶq��Count�����e�ȡA�ư�Table2�������e�ȡA���|�MTable2���ȭ���
function Lua_TableRuleOut(Table1,Table2,Count)
	local OriTable=Table1;
	local RuleOut=Table2;
	local Final={};
	local Temp={};
	local Max=#RuleOut;
	if RuleOut==nil or RuleOut[1]==nil then
		for SN,Var in pairs(OriTable) do
			table.insert(Temp,Var);
		end
	else
		for SN,Var in pairs(OriTable) do
			for j=1,Max do
				if Var==RuleOut[j] then
					break;
				end
				if j==Max then
					table.insert(Temp,Var);
				end
			end
		end
	end
	for i=1,Count do
		if #Temp==0 then
			return Final;
		end
		local SN=DW_Rand(#Temp)
		table.insert(Final,Temp[SN]);
		table.remove(Temp,SN);
	end
	return Final;
end

----------------------�Y�ؼе��P�ۤv�^��false------------------------
	
function Lua_ExcludeSelf()
	if TargetID()==OwnerID() then
		return false;
	end
end
----------�`�����ȧ����ɨϥΪ��禡�A�i�m���L�禡����---------
	
function DW_CycleQuestEnd(OpenFlag,CloseFlag,PEScore)
	local NPC,Player = OwnerID(),TargetID();
	SetFlag(Player,OpenFlag,1);
	SetFlag(Player,CloseFlag,0);
	if PEScore~=nil then
		Lua_ZonePE_3th_GetScore( PEScore,  false);--�������Ȫ��n��(12.21�ץ�)
		--CallPlot(Player,"Lua_ZonePE_3th_GetScore",PEScore);--�������Ȫ��n��(08.01�s�W)
	end
	DisableQuest(NPC,false);--�Ѷ}NPC
end
---------��u�����}�Ҵ`�����ȡA�i�}�ҥ��N�ƶq���X�СA�i�m���L�禡����----------------
	
function DW_BranchQuestEnd(...)
	local NPC,Player = OwnerID(),TargetID();
	for i=1,select("#",...) do
		local FlagID=select(i,...);
		SetFlag(Player,FlagID,1);
	end
	DisableQuest(NPC,false);--�Ѷ}NPC
end
--�P�_����M�y�ж����Z��
	
function DW_GetDistance(GUID,x,y,z)--�����Y�Ӯy�Ъ��Z��
	local Owner=OwnerID() or 0;
	local RoomID=ReadRoleValue(Owner,EM_RoleValue_RoomID);
	if GUID==nil then
		DeBugMSG(0,RoomID,"GUID==nil Plz Check ur code")
		return 0;
	end
	local xx,yy,zz=DW_Location(GUID);
	local Dis=DW_XYZCheckDis(xx,yy,zz,x,y,z);
	return Dis;
end
function DW_GetDisToFlag(flag, num, x,y,z)--�X�Ш�Y�Ӯy�Ъ��Z��
	if not flag then
		DebugMsg(0,0, "flag is nil");
		return false;
	end
	if not num then
		DebugMsg(0,0, "num is nil");
		return false;
	end
	local xx,yy,zz=DW_Location(flag, num);
	local Dis=DW_XYZCheckDis(xx,yy,zz,x,y,z);
	return Dis;
end
function DW_DisOfFlagAndObj(flagOrgID, FlagID, ObjGuid)--�X�Ш�Y�Ӫ��󪺶Z��
	local x,y,z,dir=DW_Location(flagOrgID, FlagID);
	return DW_GetDistance(ObjGuid, x,y,z);
end
--�y���H���k�h

function Lua_RandLoc(RandRange)
	local x=RandRange
	return x-(DW_Rand(x*2));
end
--�}���I������
	
function Lua_PlayBGM(GUID)--��_�I�����֪�����
	if GUID==nil then
		if OwnerID()==nil then
			DeBugMSG(0,0,"GUID is nil, function return");
		else
			DeBugMSG(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"GUID is nil, function return")
		end
		return false;
	end
	WriteRoleValue(GUID,EM_LuaValueFlag_IsStopBGM,0);	--�O�J�ä[���
	ClientEvent_Range(GUID,0,"playmusic");
end
function Lua_StopBGM(GUID)--�Ȱ��I�����֪�����
	if GUID==nil then
		if OwnerID()==nil then
			DeBugMSG(0,0,"GUID is nil, function return");
		else
			DeBugMSG(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"GUID is nil, function return")
		end
		return false;
	end
	WriteRoleValue(GUID,EM_LuaValueFlag_IsStopBGM,1);	--�O�J�ä[���
	ClientEvent_Range(GUID,0,"stopmusic");
end
function Lua_CheckBMGState()--���ի��O�G�ˬd����ثe���I�����ּ��񪬺A
	local Player=OwnerID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID)
	if ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==0 then
		return DeBugMSG(0,RoomID,"This one is NPC, not PLAYER !!");
	elseif ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==1 then
		return DeBugMSG(0,RoomID,"BGM STOP!!");
	elseif ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==0 then
		return DeBugMSG(0,RoomID,"BGM Playing...");
	end
end

--��s����C����ơA�簣�����s�b���뤤���ؼСA�^�ǹ�ڦ��Ī�����ƶq
	
function Lua_FlashHateList(Parameter)
	local GUID=Parameter;
	GUID=GUID or OwnerID();
	local Max=HateListCount(GUID);
	local z
	local OutNum=0;
	if Max==0 then
		return 0;
	else
		for Pos=0,Max-1,1 do
			z=HateListInfo(GUID,Pos , EM_HateListInfoType_GItemID);
			if CheckRelation(GUID , z , EM_CheckRelationType_Attackable)==false then--�M������1�G���i�Q����
				ClearHateList(GUID,z);
				OutNum=OutNum+1
			end
		end
	end
	return Max-OutNum;
end

--�N���󧹥��ð_�ӡA�Ѽƥi����A���N�O��ۤv�ð_��

function Lua_Disappear(ID)
	local GUID=ID;
	GUID=GUID or OwnerID();
	if GUID==nil then
		return false;
	end
	SetModeEx(GUID,EM_SetModeType_HideName,true);
	SetModeEx(GUID,EM_SetModeType_Mark,false);
	SetModeEx(GUID,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(GUID,EM_SetModeType_Show,false);
	SetModeEx(GUID,EM_SetModeType_Fight,false);
	SetModeEx(GUID,EM_SetModeType_Strikback,false);
	SetModeEx(GUID,EM_SetModeType_Searchenemy,false);
	return true;
end

--���o����P�Y�Ӯy��(xyz)�������I=>3D Dis �O�qxyz�����󪺪�
	
function DW_Relative(GUID,Tx,Ty,Tz,Dis)
	local x,y,z,dir=DW_Location(GUID)
	local RelativeX,Relativey,Relativez
	local DisX,DisY,DisZ
	DisX=Tx-x;
	DisY=Ty-y;
	DisZ=Tz-z;
	local Distance=(DisX^2+DisY^2+DisZ^2)^0.5;
	local RelativeDistance=Distance-Dis
	local Correction
	if RelativeDistance>0 then
		Correction=1;
	else
		Correction=-1;
	end
	local Rate=math.abs(RelativeDistance/Distance);
	RelativeX=x+((Rate*DisX)*Correction);
	Relativey=y+((Rate*DisY)*Correction);
	RelativeZ=z+((Rate*DisZ)*Correction);
	RelativeX=RelativeX-RelativeX%0.1;
	RelativeY=RelativeY-RelativeX%0.1;
	RelativeZ=RelativeZ-RelativeX%0.1;
	return RelativeX,RelativeY,RelativeZ
end
--���o�۹�Y�Ӯy�Ъ����V,���Vxyz
	
function DW_GetDir(x,y,z,GUIDorFlagID,FlagSN)
	local Gx,Gy,Gz,dir
	if FlagSN==nil then
		Gx,Gy,Gz,dir=DW_Location(GUIDorFlagID);
	else
		Gx,Gy,Gz,dir=DW_Location(GUIDorFlagID,FlagSN);
	end
	local Dir=CalDir(x-Gx,z-Gz);
	--Dir=Dir-Dir%0.1--�h��Ѥp���I�@��
	return Dir;--�^�ǭ��V
end
--�^��p1�۹�p2�����׮t�A���Ȥ���180~ �t180�����A���ȫ�p1 �bp2 �k��A�t�ȫ�p1 �bp2����
	
function DW_GetDiffOfDirs(p1, p2)
	local dir1,dir2=p1,p2;
	if dir1<0 then
		dir1=360+dir1;
	end
	if dir2<0 then
		dir2=360+dir2;
	end
	if dir1-dir2 > 180 then
		return (360-(dir1-dir2))*-1;
	elseif dir1-dir2 < -180 then
		return 360+(dir1-dir2);
	else
		return dir1-dir2;
	end
end
--���o�Y�y���I���۹﨤�׮y��(�u������)
	
function DW_NewLocation(Angle,Dis,x,y,z,Dir)
	local Pos = {};
	local Pi_Value;
	Pi_Value = (math.pi/180)*(Dir+Angle)
	Pos.x = x +(Dis*math.cos(Pi_Value))
	Pos.z = z -(Dis*math.sin(Pi_Value))
	Pos.y = GetHeight(Pos.x, y, Pos.z);
	return Pos.x, Pos.y, Pos.z, Dir;
end

--���o�Y�y���I���۹﨤�׮y��(�u������ �ӥB���|�ե����� �i�H�P�W�@�禡���)

function DW_PureNewLoc(Angle,Dis,x,y,z,Dir)
	local Pos = {};
	local Pi_Value;
	Pi_Value = (math.pi/180)*(Dir+Angle)
	Pos.x = x +(Dis*math.cos(Pi_Value))
	Pos.z = z -(Dis*math.sin(Pi_Value))
	Pos.y = y;
	return Pos.x, Pos.y, Pos.z, Dir;
end
--�B�~������A������b�T�w�ɶ���ۦ�Ѱ��s��
function DW_DetachObj(GUID, time)
	sleep(time);
	DetachObj(GUID);
end
--�bTarget������C����MGUID�A�p�G����C�����o����ơA�^��pos,  �Y�L�h�^��false
	
function DW_HatePosInfo(Target, GUID)
	if not		Target	then	return false;	end
	if not		GUID	then	return false;	end
	local num= HateListCount(Target);
	if num==0 then
		return false;
	else
		for pos=0, num-1, 1 do
			if	HateListInfo(Target, pos, EM_HateListInfoType_GItemID)==GUID	then
				return pos;
			end
		end
		return false;
	end
end
--�bTarget������C����MGUID�A�p�G����C�����o����ơA�[�W���PAmount�q�������
	
function DW_HateAdd(Target, GUID, Amount)
	local	pos	=DW_HatePosInfo(Target, GUID);
	if	not pos	then	return	false;	end
	local	point	=HateListInfo(Target, pos, EM_HateListInfoType_HatePoint);
	SetHateListPoint(Target, pos, point+Amount);
	return true;
end
--�bTarget������C����MGUID�A�p�G����C�����o����ơA�N����ȳ]��Amount
	
function DW_HateSet(Target, GUID, Amount)
	local	pos	=DW_HatePosInfo(Target, GUID);
	if	not pos	then	return	false;	end
	SetHateListPoint(Target, pos, Amount);
	return true;
end
--�^��GUID ���̤j�ͩR�Ȫ��ʤ����X ��ڦ�q�O�h��
	
function DW_GetHPpercentVar(GUID, percent)
	if not	GUID	then
		return false;
	end
	local MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);

	local HP		=MaxHP*(percent/100);
	HP			=math.floor(HP)
	return	HP;
end

--�^��GUID ���ثe��q �O�̤j�ͩR�Ȫ��ʤ����X
	
function DW_GetHPpercent(GUID)
	if not	GUID	then
		return false;
	end
	local HP 		=ReadRoleValue(GUID, EM_RoleValue_HP);
	if	HP<=0		then
		return 0;
	end
	local MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	if	HP>=MaxHP	then
		return 100;
	end
	local percent		=HP/MaxHP;
	percent			=percent-percent%0.001;--�p���I3��
	percent			=percent*100;
	return	percent;
end
--�W�[GUID ���ثe��q �̤j�ͩR�Ȫ��ʤ����X
	
function DW_AddHPpercent(GUID, percent)
	if not	GUID	then
		return false;
	end
	local	HP		=ReadRoleValue(GUID, EM_RoleValue_HP);
	local	MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	local	oneP		=math.floor(MaxHP/100);
	local	Amount		=math.floor(oneP*percent);
	if	Amount+HP >= MaxHP	then
		WriteRoleValue( GUID, EM_RoleValue_HP, MaxHP);
	else
		WriteRoleValue( GUID, EM_RoleValue_HP, Amount+HP);
	end
end

--�]�wGUID ���ثe��q ���̤j�ͩR�Ȫ��ʤ����X
	
function DW_SetHPpercent(GUID, percent)
	if not	GUID	then
		return false;
	end
	local	HP		=ReadRoleValue(GUID, EM_RoleValue_HP);
	local	MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	local	oneP		=math.floor(MaxHP/100);
	local	Amount		=math.floor(oneP*percent);
	WriteRoleValue( GUID, EM_RoleValue_HP, Amount);
end
--�R���ۤv
	
function DelSelf()
	DelObj(OwnerID());
end

--�R���Ҧ�buff
	
function DW_clsBuff(ObjID)
	if not ObjID then return false; end
	if not CheckID(ObjID) then return false; end

	local n = BuffCount(ObjID);
	for pos=0, n, 1 do
		CancelBuff_NoEvent(ObjID, BuffInfo(ObjID, pos, EM_BuffInfoType_BuffID));
	end
	return true;
end

--1~num, ���|���ƪ�Rand, ���P����rand�����A ���঳sleep�A�Y�����������]���|���ơI�n�Y�����i�୫�ƪ������A�ЬݤU�@�Ө禡

function DW_Ran(num)
--[[�쪩���A�ϥ�Global���x�s
	local guid=OwnerID();
	if(num==nil)then
		DebugMsg(0,ReadRoleValue(guid,EM_RoleValue_RoomID),"DW_Ran : parameter is nil");
		return;
	end
	if(Global_dw_ran_id==nil)or(Global_dw_ran_id~=num)or(#Global_dw_ran_table==0)or(Global_dw_ran_owner~=guid)then
		--��l��: 1.�����إ� 2.���P���ϥ� 3.�w�g�����L�@�� 4.�ϥΪ̤��P
		Global_dw_ran_owner=guid;
		Global_dw_ran_id=num;
		Global_dw_ran_table={};
		for i=1,num,1 do
			Global_dw_ran_table[i]=i;
		end
	end
	return table.remove(Global_dw_ran_table,DW_Rand(#Global_dw_ran_table))
--]]
	local t={};
	local LastOne;
	return	function()
			if(#t==0)then
				for i=1,num,1 do
					t[i]=i;
				end
				if(LastOne~=nil)and(#t>1)then
					table.remove(t,LastOne);
				end
			end
			LastOne=table.remove(t,DW_Rand(#t))
			return LastOne;
		end

end
--1~num, �b�@�������u���|���ơv��Rand�A�W�@�������M�U�@�����Y�i��|���ơA�Ҧp 15234 �O�Ĥ@��  42315�O�ĤG��  �o���N���ƤF�⦸�� 4
function DW_CircleRand(num)
	local t={};
	return	function()
			if(#t==0)then
				for i=1,num,1 do
					t[i]=i;
				end
			end
			return table.remove(t,DW_Rand(#t));
		end
end
--�򥻭l�ͪ��W�h�A��master�䤣��Φ��`�A�N�ۤv�R���A�o�O�j��I
function DW_tokenrule(master)
	while true do
		sleep(10);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			DelObj(OwnerID());
			return;
		end
	end
end
--�Proom�����a�s��
function DW_roombroadcast(msg_type,msg,msg_color)
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if(msg_type==nil)or(msg==nil)then
		DebugMsg(0,room,"parameter is nil");
		return false;
	end
	if(msg_color==nil)then
		msg_color=0;
	end
	if(msg_type==2)then
		msg="[$MUTE]"..msg;
	end
	local num=SetSearchAllPlayer(room);
	for i=1,num,1 do
		local player=GetSearchResult();
		ScriptMessage(player,player,msg_type,msg,msg_color);
	end
end