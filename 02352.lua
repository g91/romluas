--
function LuaQ_424104_Accept()
	local Player=TargetID()
	local Obj=OwnerID()
	local count=ReadRoleValue(Obj,EM_RoleValue_Register4)
	if	count==0	then
		--�a�I1
		SetFlag(Player,545008,1)
		WriteRoleValue(Obj,EM_RoleValue_Register4,1)
	elseif	count==1	then
		--�a�I2
		SetFlag(Player,545009,1)
		WriteRoleValue(Obj,EM_RoleValue_Register4,2)
	else
		--�a�I3
		SetFlag(Player,545010,1)
		WriteRoleValue(Obj,EM_RoleValue_Register4,0)
	end
end
--
function LuaS_AG_424104_R()
	local Obj=OwnerID()
	SetPlot(Obj,"range","Lua_AG_424104_01",150)
end
function Lua_AG_424104_01()
	local Player=OwnerID()
	local Obj=TargetID()
	local ReValue=ReadRoleValue(Obj,EM_RoleValue_Register4)
		if CheckAcceptQuest(Player,424104)==true and ReValue==0 and CheckFlag(Player,544964)==false then
			if CheckFlag(Player,545008)==true then
				WriteRoleValue(Obj,EM_RoleValue_Register4,1)
				CallPlot(Obj,"Lua_AG_424104_02",Player,Obj)
			end
			return true
		else
			return true
		end
end
function Lua_118213_adbuff()
	AddBuff(OwnerID(),509329,1,999)
end
--�D�@���A�ݭn�@�Ӥ����buff
function Lua_AG_424104_02(Player,Obj)
	local A=Lua_AG_ProductRing(Obj)
	local B=Lua_AG_ProductKeyMan(Obj)
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
		SetModeEx(B[3],EM_SetModeType_Mark,true)
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
function Lua_AG_ProductRing(Obj)
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID );
	local RoleDate = Role:new( Obj );
	local BaseX = RoleDate :X();
	local BaseY = RoleDate :Y();
	local BaseZ = RoleDate :Z();
	local BaseDir = RoleDate :Dir();
	local MonsterGroup = {};
	local MonsterID = 118212 ;
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
function Lua_AG_ProductKeyMan()
	local b1=Lua_DW_CreateObj("flag",117958,780871,15,1,1)	--�¥�
			SetModeEx(b1,EM_SetModeType_Mark,false)
	local b2=Lua_DW_CreateObj("flag",118159,780871,16,1,1)	--
			SetModeEx(b2,EM_SetModeType_Mark,false)
	local b3=Lua_DW_CreateObj("flag",117959,780871,17,1,1)	--����
			SetModeEx(b3,EM_SetModeType_Mark,false)
	local B={b1,b2,b3}
	return B
end
--dying
function Lua_Ag_424104_Dying(A,Obj)
	local T=AGUSE02(Obj)
	Say(A[1],"[SC_112077_OD_3]")
	Sleep(10)
		for i=1,5,2 do
			PlayMotion(A[i],12)
			CastSpellPos(A[i],T[1],800,T[3],497246,1)
			Sleep(10)
		end
		for i=2,6,2 do
			PlayMotion(A[i],12)
			CastSpellPos(A[i],T[1],800,T[3],497246,1)
			Sleep(10)
		end
	return
end
--���`�@��
function Lua_105479_Dead()
	SetPlot(OwnerID(),"dead","Lua_105479_01",0)
end
function Lua_105479_01()
	local Own=OwnerID()
		DelFromPartition(Own)
	local Obj=ReadRoleValue(Own,EM_RoleValue_Register1)
	local Player=ReadRoleValue(Own,EM_RoleValue_Register3)
		Sleep(10)
		Show(Obj,0)
		sleep(5)
		Say(Obj,"[SC_424104_14]")
		SetFlag(Player,544964,1)	--544964 �������
		Sleep(10)
		DelObj(Obj)
		DelObj(Own)
	return true
end

function Lua_AG_HiBeHurt(Own,Killer,Player)
	sleep(50)
	for i=1,90,1 do
		sleep(10)
		local Kill=ReadRoleValue(Killer,EM_RoleValue_IsDead)
		local Killed=ReadRoleValue(Player,EM_RoleValue_IsDead)
			if CheckID(Killer)==false then
				DelObj(Own)
				return
			end
			if CheckAcceptQuest( Player,424104)==true then
				if Kill==true then
					PlayMotion(Own,148)
					Sleep(20)
					ScriptMessage(Player,Player,0,"[SC_424104_15]","0xffff80c0")--�ڨS���jê�K�A�֮���[209290]�^�h�K�����]�k�v�����ܫ����H��ߡK
					Sleep(10)
					DelObj(Own)
					return
				elseif Killed==true then
					DelObj(Killer) 
					DelObj(Own)
					return
				end
			else
				DelObj(Killer)
				DelObj(Own)
				return
			end
			if CheckDistance(Own,Player,250)==false then
				DelObj(Killer) 
				DelObj(Own)
				return
			end
	end
	DelObj(Killer)
	DelObj(Own)
	return	
end

function LuaQ_424104_ClickObj()
	if CheckFlag(OwnerID(),544964)==true then
		return true
	end
	return false
end
function LuaQ_424104_AfterClickObj()
	GiveBodyItem(OwnerID(),209290,1)
	SetFlag(OwnerID(),545016,1)
	return 1
end
--�ᱼ
function LuaT_118213_GiveUP()
	SetFlag(OwnerID(),544964,0)
	SetFlag(OwnerID(),545016,0)
end
--------------------------------------------------------------------------------------------------------
--�T���� 1�ǰe�W���x 2 �z���H-�D�����@�� 3 �H���Ψ禡 4 �Ǫ����W�����`�@��
--��l�@��(�d��@��)

function LuaS_AG_424107_Range()
	SetPlot(OwnerID(),"range","LuaS_424107_lua",120)
end
function LuaS_424107_lua()
	CallPlot(TargetID(),"LuaS_AG_424107",TargetID(),OwnerID())
end
function LuaS_AG_424107(Obj,Player)
	--local Player=OwnerID()
	--local Obj=TargetID()
		if CheckAcceptQuest(Player,424107)==false then
			return
		end
		if CheckFlag(Player,545013)==true then
			return
		end
	local num=ReadRoleValue(Obj,EM_RoleValue_Register5)
		if num==0 then	
			WriteRoleValue(Obj,EM_RoleValue_Register5,9)	--���g��12�A�H�۪��a�����ȭn�k0
			local mos={}
			local Cat=AGUSE02(Obj)
			local Cat1={Cat[1]+40,Cat[2],Cat[3]}
			local Cat2={Cat[1]-24,Cat[2],Cat[3]+32}
			local Cat3={Cat[1]-24,Cat[2],Cat[3]-32}
			local Rad,xyz=Lua_AG_ProMos_Rand(Obj)			--1��12�j�p��table
			local Obj1=Lua_DW_CreateObj("xyz",118233,Cat1,1,156,1)	--����
			local Obj2=Lua_DW_CreateObj("xyz",118232,Cat2,1,79,1)		--�ڨj
			local Obj4=Lua_DW_CreateObj("xyz",117580,Cat2,1,79,1)		--�ڨj�o�q��
			local Obj3=Lua_DW_CreateObj("xyz",118234,Cat3,1,300,1)	--�L�q
			local AllObj={Obj1,Obj2,Obj3,Obj4}				--�Ҧ�����table
				for i=1,4,1 do
					SetModeEx(AllObj[i],EM_SetModeType_Mark,false)
				end
			Sleep(20)
			PlayMotion(Obj1,112)
			Say(Obj1,"[SC_424107_1]")
			Sleep(40)
			Say(Obj2,"[SC_424107_2]")
				if CheckID(Player)==0 or  CheckDistance(Obj,Player,250)==false then
					WriteRoleValue(Obj,EM_RoleValue_Register5,0)
					Lua_AG_DelObj(AllObj,mos)
					return
				end
			Sleep(40)
			Say(Obj3,"[SC_424107_3]")
			Sleep(40)
				if CheckID(Player)==0 or  CheckDistance(Obj,Player,250)==false then
					WriteRoleValue(Obj,EM_RoleValue_Register5,0)
					Lua_AG_DelObj(AllObj,mos)
					return
				end
			PlayMotion(Obj2,148)
			Say(Obj1,"[SC_101361_1]")					--�٪o���O
			Sleep(40)
			PlayMotion(Obj3,81)
			CallPlot(Obj2,"Lua_AGAdbuff_424107_1",Obj2,Obj,497554)
			CallPlot(Obj1,"Lua_AGAdbuff_424107_2",Obj1,Obj,497562)
			AddBuff(Obj,509383,1,300)
			AddBuff(Obj3,509383,1,300)
				if CheckID(Player)==0 or  CheckDistance(Obj,Player,200)==false then
					WriteRoleValue(Obj,EM_RoleValue_Register5,0)
					Lua_AG_DelObj(AllObj,mos)
					return
				end
			AddBuff(Player,508190,1,300)
			Sleep(20)
			for i=2,4,1 do
				Sleep(20)
					if CheckID(Player)==0 then
						WriteRoleValue(Obj,EM_RoleValue_Register5,0)
						Lua_AG_DelObj(AllObj,mos)
						return
					end
				ScriptMessage(Player,Player,1,"[SC_424107_4]",0)
				Sleep(10)
					if CheckID(Player)==0 then
						WriteRoleValue(Obj,EM_RoleValue_Register5,0)
						Lua_AG_DelObj(AllObj,mos)
						return
					end
				Rad=Lua_AG_424107_01(Player,Obj,AllObj,Rad,i)
					if Rad==1 then
						ScriptMessage(Player,Player,1,"[SAY_420635_1]",0)
						return
					end
				Sleep(20)
			end
			if CheckID(Player)==0 then
				WriteRoleValue(Obj,EM_RoleValue_Register5,0)
				Lua_AG_DelObj(AllObj,mos)
				return
			end
		CancelBuff(Player,508190)
		CancelBuff(Obj,509383)	
		Say(Obj1,"[SC_424107_5]")
		Sleep(40)
		Say(Obj3,"[SC_424107_6]")
			if num==0 then
				if CheckID(Player)==0 then
					WriteRoleValue(Obj,EM_RoleValue_Register5,0)
					Lua_AG_DelObj(AllObj,mos)
					return
				end
				SetFlag(Player,545013,1)
			end
		local Test={}
		Lua_AG_DelObj(AllObj,Test)
		Sleep(50)
		SetPos(Player,2906,132,11063,2)
	else
		ScriptMessage(Player,Player,1,"[SAY_420635_1]",0)
	end
	return
end
--AddBuff
function Lua_AGAdbuff_424107_1(Caster,Casted,x)
	while 1 do
		SysCastSpellLv(caster,Casted,x,499)
		Sleep(5)
	end
end
function Lua_AGAdbuff_424107_2(Caster,Casted,x)
	while 50 do
		CastSpell(caster,Casted,x)
		Sleep(5)
	end
end

--�����@��
function Lua_AG_424107_01(Player,Obj,AllObj,Rad,x) 
	local mos={}
	local count={9,7,4,0}
	local monst=0
		for i=1,x,1 do
			if CheckID(Player)==0 then
				CancelBuff(Obj,509383)
				WriteRoleValue(Obj,EM_RoleValue_Register5,0)
				Lua_AG_DelObj(AllObj,mos)
				return 1
			end
			monst=CreateObj(105629,Rad[i][1],Rad[i][2],Rad[i][3],Rad[i][4],1)
			AddToPartition(monst,0)
			WriteRoleValue(monst,EM_RoleValue_Register5,Obj)
			Sleep(1)
			SetAttack(monst,Player)
			table.remove(Rad,i)
			table.insert(mos,monst)
		end
		Say(mos[1],"[SC_105451_"..x.."]")
		for i=1,150,1 do
			Sleep(20)
			if CheckID(Player)==0 then
				CancelBuff(Obj,509383)
				WriteRoleValue(Obj,EM_RoleValue_Register5,0)
				Lua_AG_DelObj(AllObj,mos)
				return 1
			end
			if CheckAcceptQuest(Player,424107)==true then
				if ReadRoleValue(Player,EM_RoleValue_IsDead)==0 then
					if CheckDistance(Obj,Player,250)==true then
						local num1=ReadRoleValue(Obj,EM_RoleValue_Register5)
						if  num1==count[x] then
							return Rad
						end
					else
						CancelBuff(Player,508190)
						CancelBuff(Obj,509383)
						WriteRoleValue(Obj,EM_RoleValue_Register5,0)
						Lua_AG_DelObj(AllObj,mos)
						return 1
					end
				else
					CancelBuff(Player,508190)
					CancelBuff(Obj,509383)
					WriteRoleValue(Obj,EM_RoleValue_Register5,0)
					Lua_AG_DelObj(AllObj,mos)
					return 1
				end
			else
				CancelBuff(Player,508190)
				CancelBuff(Obj,509383)
				WriteRoleValue(Obj,EM_RoleValue_Register5,0)
				Lua_AG_DelObj(AllObj,mos)
				return 1
			end
		end	
	WriteRoleValue(Obj,EM_RoleValue_Register5,0)
	Lua_AG_DelObj(AllObj,mos)	
	return 1
end
--�R���Ҧ�����
function Lua_AG_DelObj(T,T2)
	for Index,value in pairs(T2) do
		DelObj(value)
	end
	for Index,value in pairs(T) do
		DelObj(value)
	end
	return
end
--�H������12�Ӯy��{x,y,z,dir}
function Lua_AG_ProMos_Rand(Obj)
	local Txyz=AGUSE02(Obj);
	local Rxz={};
	local txz={};
	local dir=0;
	local Rx=0;
	local Rz=0;
		for i=1,12,1 do
			dir=Rand(360)
			Rx=Rand(160)-80
			Rz=Rand(160)-80
			txz={Txyz[1]+Rx,Txyz[2],Txyz[3]+Rz,dir}
			table.insert(Rxz,txz)
		end
	return Rxz,Txyz
end
-- ���`�@��
function Lua_AG_StonMons()
	SetPlot(OwnerID(),"dead","Lua_AG_StonMon_dead",0)
end
function Lua_AG_StonMon_dead()
	local Mid=ReadRoleValue(OwnerID(),EM_RoleValue_Register5)	--�⤤�����s��Ū�i��
	local num=ReadRoleValue(Mid,EM_RoleValue_Register5)	--����F�X���Ǫ��ƥ�Ū�i��
	num=num-1
	WriteRoleValue(Mid,EM_RoleValue_Register5,num)		--�g�^����
	return true
end

--��ܼ@��(�X�o)
function LuaS_424107_Pos()
	LoadQuestOption(OwnerID())
	--"[SC_423688_1]" �ڷǳƦn�F�A�X�o�a�I
	if CheckAcceptQuest(OwnerID(),424107)==true and CheckFlag(OwnerID(),545013)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423688_1]","LuaS_424107_Pos01",0)
	end
end
--�ǰe�N�S��model/fx/skill/holy/act_cathexis_c_down_e.ros
function LuaS_424107_Pos01()
	local Rnum=ReadRoleValue(TargetID(),EM_RoleValue_Register4)
	if Rnum==0	then	
		SetPos(OwnerID(),1481,687,13431,274)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,1)
	elseif Rnum==1 then
		SetPos(OwnerID(),2036,715,9555,317)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,2)
	elseif Rnum==2 then
		SetPos(OwnerID(),78,1041,12682,270)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,3)
	elseif Rnum==3 then
		SetPos(OwnerID(),4832,569,11054,172)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,4)
	elseif Rnum==4 then
		SetPos(OwnerID(),2945,569,11935,42)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,5)
	elseif Rnum==5 then
		SetPos(OwnerID(),4279,569,9346,260)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,6)
	elseif Rnum==6 then
		SetPos(OwnerID(),4313,569,12752,100)
		WriteRoleValue(TargetID(),EM_RoleValue_Register4,0)
	end
end