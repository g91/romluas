--
function LuaS_AG_424104_R1()
	local Obj=OwnerID()
	SetPlot(Obj,"range","Lua_AG_424104_011",150)
end
function Lua_AG_424104_011()
	local Player=OwnerID()
	local Obj=TargetID()
	local ReValue=ReadRoleValue(Obj,EM_RoleValue_Register4)
		if CheckAcceptQuest(Player,424104)==true and ReValue==0 and CheckFlag(Player,544964)==false then
			if CheckFlag(Player,545009)==true then
				WriteRoleValue(Obj,EM_RoleValue_Register4,1)
				CallPlot(Obj,"Lua_AG_424104_021",Player,Obj)
			end
			return true
		else
			return true
		end
end
--�D�@���A�ݭn�@�Ӥ����buff
function Lua_AG_424104_021(Player,Obj)
	local A=Lua_AG_ProductRing1(Obj)
	local B=Lua_AG_ProductKeyMan1(Obj)
		for i=1,6,1 do
			Sleep(2)
			AddBuff(A[i],509573,1,20)
			Sleep(2)	
			AddBuff(A[i],509572,1,20)
			Sleep(2)
			PlayMotion(A[i],148)
		end
		PlayMotion(B[2],81)
		AddBuff(B[2],509574,1,16)
	local T=AGUSE02(Obj)
		AddBuff(Player,507646,0,45)
		AddBuff(Obj,509422,1,20)
		Sleep(20)
		Say(A[1],"[SC_424104_1]")--1
		Sleep(10)
			PlayMotion(B[1],112)
		Say(B[1],"[SC_424104_2]")
		Sleep(40)
		Say(B[2],"[SC_424104_3]")--�������K�ڬO�b��ʦL�Ѷ}���A�u�O�ٻݭn�@�Ǳ���K
		Sleep(40)
		Say(B[1],"[SC_424104_4]")--������I
		Sleep(20)
			PlayMotion(B[2],83)
		Sleep(20)
	Lua_Ag_424104_Dying(A,Obj)
		Say(B[3],"[SC_424104_5]")--�o�K�o�O���^�ơK
		Sleep(40)
			PlayMotion(B[2],112)
		Say(B[2],"[SC_424104_6]")--�V�̰��j���]�k�m�W�A���F��A�N�O�o��^�ơC
		Sleep(30)
			AdjustFaceDir(B[1],B[2],0)
			AdjustFaceDir(B[2],B[1],0)
		Say(B[1],"[SC_424104_7]")--���K���K�ڪ����I�ڪ��_���I
			CastSpell(B[2],B[1],497561)
		Sleep(10)
			PlayMotion(B[1],12)
		Sleep(20)
			CastSpellPos(B[1],T[1],800,T[3],497246,1)
		Sleep(40)
		Say(B[2],"[SC_424104_8]")--�����K�����a�A��o�ë��ͩR�F�O�C
		Sleep(10)
			PlayMotion(B[3],109)
		Say(B[3],"[SC_424104_9]")--�A�쩳�O�֡H�٦��K��o�ͤF����Ʊ��I���ڸ����M���I
		Sleep(20)
			AdjustFaceDir(B[3],B[2],0)
		Sleep(20)
		Say(B[2],"[SC_424104_10]")--�٦��X���ѹ��b���C���L�K�A���ٯవ����H���䨺�ӳå�K�ڨ��L�A�K�N�O�A�@���b�}�a�ڶ}�Ҫ������O�a�H
		Sleep(40)
			PlayMotion(B[3],112)
		Say(B[3],"[SC_424104_11]")--���H���D�O�����ǩ_�����Ӫ��H�ҥH�o�@�����O�A�I�U���׺ݡK������n���s�Ϊ��·СH�A���ئa�쩳�O�K
		Sleep(40)
		Say(B[2],"[SC_424104_12]")
		Sleep(20)
			AdjustFaceDir(B[2],B[3],0)
		Sleep(20)
			CastSpell(B[2],B[3],497561)
		Sleep(10)
			--PlayMotion(B[2],31)
			PlayMotion(B[3],12)
			SetModeEx(B[3],EM_SetModeType_Mark,true)
		Sleep(20)
			if 	CheckID(Player)==false	or
				CheckAcceptQuest(Player,424104)==false then
				for i=1,6,1 do
					DelObj(A[i])
				end
				for i=1,3,1 do
					DelObj(B[i])
				end
				WriteRoleValue(Obj,EM_RoleValue_Register4,0)
				return
			end
		Say(B[2],"[SC_424104_13]")
	local Killer=Lua_DW_CreateObj("obj",105479,B[2])
		Hide(B[2])
		WriteRoleValue(Killer,EM_RoleValue_Register1,B[2])
		WriteRoleValue(Killer,EM_RoleValue_Register2,Obj)
		WriteRoleValue(Killer,EM_RoleValue_Register3,Player)
		Sleep(10)
		WriteRoleValue(Obj,EM_RoleValue_Register4,0)
			SetAttack(Killer,Player)
		for i=1,6,1 do
			DelObj(A[i])
		end
		DelObj(B[1])
		CallPlot(B[3],"Lua_AG_HiBeHurt",B[3],Killer,Player)
end
--��A�ݭn�@�ة�
function Lua_AG_ProductRing1(Obj)
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID );
	local RoleDate = Role:new( Obj );
	local BaseX = RoleDate :X();
	local BaseY = RoleDate :Y();
	local BaseZ = RoleDate :Z();
	local BaseDir = RoleDate :Dir();
	local MonsterGroup = {};
	local MonsterID = 118246 ;
	local X=6			--��6���I
	local Dis=25			--�Z���30�X�B
		for i=1,X,1 do
			MonsterGroup[i]=CreateObj( MonsterID , BaseX-Dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+Dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		end
		for i = 1,X,1 do
			AdjustFaceDir(MonsterGroup[i],Obj,0)
			AddToPartition( MonsterGroup[i] , RoomID )
			SetModeEx(MonsterGroup[i],EM_SetModeType_Mark,false)
		end
	return MonsterGroup
end
--keyman
function Lua_AG_ProductKeyMan1()
	local b1=Lua_DW_CreateObj("flag",118243,780871,15,1,1)	--�¥�
			SetModeEx(b1,EM_SetModeType_Mark,false)
	local b2=Lua_DW_CreateObj("flag",118245,780871,16,1,1)	--
			SetModeEx(b2,EM_SetModeType_Mark,false)
	local b3=Lua_DW_CreateObj("flag",118244,780871,17,1,1)	--����
			SetModeEx(b3,EM_SetModeType_Mark,false)
	local B={b1,b2,b3}
	return B
end
----------------------------------------------------------------------------
--
function LuaS_AG_424104_R2()
	local Obj=OwnerID()
	SetPlot(Obj,"range","Lua_AG_424104_012",150)
end
function Lua_AG_424104_012()
	local Player=OwnerID()
	local Obj=TargetID()
	local ReValue=ReadRoleValue(Obj,EM_RoleValue_Register4)
		if CheckAcceptQuest(Player,424104)==true and ReValue==0 and CheckFlag(Player,544964)==false then
			if CheckFlag(Player,545010)==true then
				WriteRoleValue(Obj,EM_RoleValue_Register4,1)
				CallPlot(Obj,"Lua_AG_424104_022",Player,Obj)
			end
			return true
		else
			return true
		end
end
--�D�@���A�ݭn�@�Ӥ����buff
function Lua_AG_424104_022(Player,Obj)
	local A=Lua_AG_ProductRing2(Obj)
	local B=Lua_AG_ProductKeyMan2(Obj)
		for i=1,6,1 do
			Sleep(2)
			AddBuff(A[i],509573,1,20)
			Sleep(2)	
			AddBuff(A[i],509572,1,20)
			Sleep(2)
			PlayMotion(A[i],148)
		end
		PlayMotion(B[2],81)
		AddBuff(B[2],509574,1,16)
	local T=AGUSE02(Obj)
		AddBuff(Player,507646,0,45)
		AddBuff(Obj,509422,1,20)
		Sleep(20)
		Say(A[1],"[SC_424104_1]")--1
		Sleep(10)
			PlayMotion(B[1],112)
		Say(B[1],"[SC_424104_2]")
		Sleep(40)
		Say(B[2],"[SC_424104_3]")--�������K�ڬO�b��ʦL�Ѷ}���A�u�O�ٻݭn�@�Ǳ���K
		Sleep(40)
		Say(B[1],"[SC_424104_4]")--������I
		Sleep(20)
			PlayMotion(B[2],83)
		Sleep(20)
	Lua_Ag_424104_Dying(A,Obj)
		Say(B[3],"[SC_424104_5]")--�o�K�o�O���^�ơK
		Sleep(40)
			PlayMotion(B[2],112)
		Say(B[2],"[SC_424104_6]")--�V�̰��j���]�k�m�W�A���F��A�N�O�o��^�ơC
		Sleep(30)
			AdjustFaceDir(B[1],B[2],0)
			AdjustFaceDir(B[2],B[1],0)
		Say(B[1],"[SC_424104_7]")--���K���K�ڪ����I�ڪ��_���I
			CastSpell(B[2],B[1],497561)
		Sleep(10)
			PlayMotion(B[1],12)
		Sleep(20)
			CastSpellPos(B[1],T[1],800,T[3],497246,1)
		Sleep(40)
		Say(B[2],"[SC_424104_8]")--�����K�����a�A��o�ë��ͩR�F�O�C
		Sleep(10)
			PlayMotion(B[3],109)
		Say(B[3],"[SC_424104_9]")--�A�쩳�O�֡H�٦��K��o�ͤF����Ʊ��I���ڸ����M���I
		Sleep(20)
			AdjustFaceDir(B[3],B[2],0)
		Sleep(20)
		Say(B[2],"[SC_424104_10]")--�٦��X���ѹ��b���C���L�K�A���ٯవ����H���䨺�ӳå�K�ڨ��L�A�K�N�O�A�@���b�}�a�ڶ}�Ҫ������O�a�H
		Sleep(40)
			PlayMotion(B[3],112)
		Say(B[3],"[SC_424104_11]")--���H���D�O�����ǩ_�����Ӫ��H�ҥH�o�@�����O�A�I�U���׺ݡK������n���s�Ϊ��·СH�A���ئa�쩳�O�K
		Sleep(40)
		Say(B[2],"[SC_424104_12]")
		Sleep(20)
			AdjustFaceDir(B[2],B[3],0)
		Sleep(20)
			CastSpell(B[2],B[3],497561)
		Sleep(10)
			--PlayMotion(B[2],31)
			PlayMotion(B[3],12)
			SetModeEx(B[3],EM_SetModeType_Mark,true)
		Sleep(20)
			if 	CheckID(Player)==false	or
				CheckAcceptQuest(Player,424104)==false then
				for i=1,6,1 do
					DelObj(A[i])
				end
				for i=1,3,1 do
					DelObj(B[i])
				end
				WriteRoleValue(Obj,EM_RoleValue_Register4,0)
				return
			end
		Say(B[2],"[SC_424104_13]")
	local Killer=Lua_DW_CreateObj("obj",105479,B[2])
		Hide(B[2])
		WriteRoleValue(Killer,EM_RoleValue_Register1,B[2])
		WriteRoleValue(Killer,EM_RoleValue_Register2,Obj)
		WriteRoleValue(Killer,EM_RoleValue_Register3,Player)
		Sleep(10)
		WriteRoleValue(Obj,EM_RoleValue_Register4,0)
			SetAttack(Killer,Player)
		for i=1,6,1 do
			DelObj(A[i])
		end
		DelObj(B[1])
		CallPlot(B[3],"Lua_AG_HiBeHurt",B[3],Killer,Player)
end
--��A�ݭn�@�ة�
function Lua_AG_ProductRing2(Obj)
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID );
	local RoleDate = Role:new( Obj );
	local BaseX = RoleDate :X();
	local BaseY = RoleDate :Y();
	local BaseZ = RoleDate :Z();
	local BaseDir = RoleDate :Dir();
	local MonsterGroup = {};
	local MonsterID = 118252 ;
	local X=6			--��6���I
	local Dis=25			--�Z���30�X�B
		for i=1,X,1 do
			MonsterGroup[i]=CreateObj( MonsterID , BaseX-Dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+Dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		end
		for i = 1,X,1 do
			AdjustFaceDir(MonsterGroup[i],Obj,0)
			AddToPartition( MonsterGroup[i] , RoomID )
			SetModeEx(MonsterGroup[i],EM_SetModeType_Mark,false)
		end
	return MonsterGroup
end
--keyman
function Lua_AG_ProductKeyMan2()
	local b1=Lua_DW_CreateObj("flag",118249,780871,15,1,1)	--�¥�
			SetModeEx(b1,EM_SetModeType_Mark,false)
	local b2=Lua_DW_CreateObj("flag",118251,780871,16,1,1)	--
			SetModeEx(b2,EM_SetModeType_Mark,false)
	local b3=Lua_DW_CreateObj("flag",118250,780871,17,1,1)	--����
			SetModeEx(b3,EM_SetModeType_Mark,false)
	local B={b1,b2,b3}
	return B
end
----------------------------------------------------------------------------
function AGUseful_Act()
	local MT={12,14,18,19,20,21,31,32,33,34,36,37,38,45,46,51,52,55,56,57,81,83,84,85,87,88,91,92,101,102,105,108,109,112,119,120,121,122,148,161,162,163,164,165,166,181,182,183,184}
	return MT
end

function lua_AGTEST01()
	local MT=AGUseful_Act()
	local x= table.getn(MT)
		for i=1,x do
			Say(OwnerID(),MT[i])
			PlayMotion(OwnerID(),MT[i])
			Sleep(20)
		end
end

function lua_AGtest02()
	local XYZ=AGuse02(OwnerID())
	while 1 do
		PlayMotion(OwnerID(),164)
		Sleep(10)
		CastSpellPos(OwnerID(),XYZ[1],XYZ[2],XYZ[3],497131,3)
		Sleep(5)
		PlayMotion(OwnerID(),161)
		Sleep(10)
		PlayMotion(OwnerID(),161)
		Sleep(10)
		PlayMotion(OwnerID(),161)		
		Sleep(10)
		PlayMotion(OwnerID(),161)
		Sleep(50)
	end
end
function lua_AGtest03()
	while 1 do
		PlayMotion(OwnerID(),164)
		Sleep(70)
	end
end