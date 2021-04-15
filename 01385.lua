function LuaS_102040_0() -- �@�ް_�⦡
	local BayImage = Lua_DW_CreateObj("flag",112980,780088,1) -- �إX����(�~�[)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,BayImage )--�g�JPID
	return true
end

function LuaS_102040_1() --��������
	--���h�@��
	CancelBuff(OwnerID(),503443)
	local BayImage = ReadRoleValue(OwnerID(),EM_RoleValue_PID) --Ū�X�����v��
	local XYZ = {4023 ,850, 2747}
	local Canom
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		Canom = Lua_DW_CreateObj("xyz",103474,XYZ ,0) -- �N���������j���βy
	else
		Canom = Lua_DW_CreateObj("xyz",102066,XYZ ,0) -- �N���������j���βy
	end
	Lua_ObjDontTouch(Canom) -- �I����
	NPCAttackFlag(Canom) -- �D�԰�
	SetModeEx(Canom,EM_SetModeType_Gravity,false)
	AddToPartition(Canom,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J
	BeginPlot(Canom,"LuaS_102040_2",0)
	BeginPlot(BayImage,"LuaS_102040_9",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)--PID���m
end

function LuaS_102040_2()  -- ��E��

	local Bay
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		Bay = Lua_DW_CreateObj("flag",103474,780088,1,0) --�гy����(�԰���)
	else
		Bay = Lua_DW_CreateObj("flag",102066,780088,1,0) --�гy����(�԰���)
	end
	Lua_ObjDontTouch(Bay) -- �I����
	NPCAttackFlag(Bay) -- �D�԰�
	SetModeEx(Bay,EM_SetModeType_Gravity,false)
	AddToPartition(Bay,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h

	sleep(5)
	CastSpell(OwnerID(),Bay,493219)
	sleep(15)
	BeginPlot(Bay,"LuaS_102040_3",0)
	DeBugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"Bomb!")
	DelObj(OwnerID())
end

function LuaS_102040_3() -- ����
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
	end
	for i=1,table.getn(ThesePlayer),1 do
		if	CheckBuff(ThesePlayer[i],500943)	then
			CancelBuff_NoEvent( ThesePlayer[i],500943 )
		end
		if	CheckBuff(ThesePlayer[i],501546)	then
			CancelBuff_NoEvent( ThesePlayer[i],501546 )
		end
	end
	ScriptMessage( OwnerID(), -1 , 2, "[SC_102040_0]", 0 );
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		CastSpellLv(OwnerID(),OwnerID(),493222,19)
	else
		CastSpellLv(OwnerID(),OwnerID(),493222,200)
	end
	sleep(20)
	DelObj(OwnerID())
end

function LuaS_102040_4() -- Ĳ�I�@��
	DeBugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"Geter is "..OwnerID())
	SetPlot(TargetID(),"touch","",0)
	if	DW_CheckBackpage(OwnerID())	then
		GiveBodyItem(OwnerID(),204845,1)
		DelObj(TargetID())
	else
		SetPlot(TargetID() ,"touch","LuaS_102040_4",50)
	end
end


function LuaS_102040_5() --��PID�P�_�O�_���\
-- �O�@�n�w�}	�N��w�l��X����
	if	not	CheckBuff(OwnerID(),503443)	and 	
		ReadRoleValue(OwnerID(),EM_RoleValue_PID)~= 0	then 	


		local BayImage = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		SetPlot(BayImage ,"touch","LuaS_102040_4",50)
		ScriptMessage( OwnerID(), -1, 2, "[SC_102040_3]", 0 );
		BeginPlot(BayImage ,"LuaS_102040_6",0)
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)--PID���m
	else
--�p�G�٨S�}���ܫh���h�@��
		CancelBuff(OwnerID(),503443)
	end
end

function LuaS_102040_6()
	sleep(100)
	sleep(50)
	DeBugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"Del Self")
	DelObj(OwnerID())
end

function LuaS_102040_17()
	CallPlot(OwnerID(),"LuaS_102040_7",TargetID())
end

function LuaS_102040_7(Tar)
	sleep(10)
	local Hand
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		Hand = Lua_DW_CreateObj("obj",103473, Tar,0)
	else
		Hand = Lua_DW_CreateObj("obj",102065, Tar,0)
	end
	SetModeEx(Hand ,EM_SetModeType_Strikback,false)
	SetModeEx(Hand,EM_SetModeType_Move,false)
	AddToPartition(Hand ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h
	PlayMotion(Hand ,ruFUSION_ACTORSTATE_SPAWN_BEGIN)
	CallPlot(Hand,"LuaS_102040_8",Tar)
end

function LuaS_102040_8(Tar)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,Tar)
	SetPlot(OwnerID(),"dead","LuaS_102040_14",0)
	sleep(70)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsDead) == 0	then
		AddBuff(Tar,503438,120,120)
		DelObj(OwnerID())
	end
end


function LuaS_102040_14()
	local Tar = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	CancelBuff(Tar,503436)
	BeginPlot(Tar,"LuaS_102040_15",0)
end

function LuaS_102040_15()
	sleep(10)
	DelObj(TargetID())
end

function LuaS_102040_9()
	sleep(70)
	DelObj(OwnerID())
end

function LuaS_102040_10() --�����W����l�@��

	local Initial = Lua_DW_CreateObj("flag",110578,780088,9,0)
	Lua_ObjDontTouch(Initial)
	SetModeEx(Initial,EM_SetModeType_Gravity,false)
	SetModeEx(Initial,EM_SetModeType_Show,false)
	SetModeEx(Initial,EM_SetModeType_Obstruct,true)
	AddToPartition(  Initial  ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h
	BeginPlot(Initial,"LuaS_102040_21",0)


	local GameStart = 0 --�H�x�}��
	local GameEnd = 0 --�H�x����

	local Rock1 = 0  --�T�L�۹����ŧi
	local Rock2 = 0
	local Rock3 = 0

	local Skill1 = 493578  -- �Ĥ@�۪��s��
	local Skill2 = 493595--  �ĤG�۪��s��

	local FightSec = 0 --�԰��g�L���

	local Time = 210  --�u���L���X��H

	local Step2 = 0 -- �P�_�O�_��i�J�ĤG���q
	local SaveTime = 0 --�O�I���
	local AT --�ؼ�
	local BombTime = 0 -- �l�ꭵ��������

	while	true	do
		sleep(10)
		--���m�P�_
		if	HateListCount(OwnerID()) > 0	then
			--�i�J�԰��N�}�l�p��
			FightSec = FightSec + 1 --�p��
			--��F���w��ơA�i�J�ĤG���q
			if	FightSec > Time	and --�ɶ���
				CheckBuff(OwnerID(),503435)		and  --�Ĥ@���q�Ӱ����ƭn������(���԰��Ҧ���buff)
				CheckBuff(OwnerID(),503931)==false		then --�u�����@��
				AddBuff(OwnerID(),503931,1,-1) -- �ĤG���q�����ȧP�_
				AddBuff(OwnerID(),502921,1,-1) -- �T�O�t�����|���_
				--�p�G�|���k�N�ݵo�h�~�򵥫�
				while ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID )~=0	do
					sleep(10)
				end
				CastSpell(OwnerID(),OwnerID(),493525) --�̾a�O�_�I�k�ӽT�w�O�_���U
				Say(OwnerID(),"[SC_102040_7]")
				sleep(30)
				Say(OwnerID(),"[SC_102040_8]")
				sleep(20)
				CancelBuff(OwnerID(),502921)  --�����L��
			end
			--�ĤG���q�t��
			if	Step2 == 0 	and	--�u�����@��
				CheckBuff(OwnerID(),503435)	and --�Ĥ@���q�Ӱ����ƭn������
				CheckBuff(OwnerID(),503931)	then -- �Ӧb����ɭ԰���H
				CastSpell(OwnerID(),OwnerID(),Skill1)
				sleep(20)
				CastSpell(OwnerID(),OwnerID(),Skill2)
				local PPos = Lua_HateListPos(1)
				local Unlucky = HateListInfo(OwnerID() , PPos[1]  , EM_HateListInfoType_GItemID )
				local Snack
				if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
					Snack = Lua_DW_CreateObj("obj",103480,Unlucky ) -- ���ͤ@���D�b���a�}�U
				else
					Snack = Lua_DW_CreateObj("obj",102293,Unlucky ) -- ���ͤ@���D�b���a�}�U
				end
				BeginPlot(Snack,"LuaS_102040_20",0) --�ͤj�D�@��
				AddBuff(Snack,502921,1,-1)  --�T�O�D�i�H��F���w��m
				SetAttack( Snack , Unlucky )
				local Name  = GetName(Unlucky)
				local String = "[SC_102040_9][$SETVAR1="..Name.."]"
				while true do
					sleep(10)
					if	Unlucky==nil	then --����N�~
						break
					end
					if	ReadRoleValue(Unlucky ,EM_RoleValue_IsDead) == 1	then -- ����L����
						break
					end
					if	not CheckBuff(Unlucky ,503926)	then   -- �ѱ��r����
						ScriptMessage( OwnerID(), -1, 2, String, C_Yellow ) -- ���ϴ��ܰT��
						ScriptMessage( OwnerID(), -1, 0, String, C_Yellow ) -- ���ϴ��ܰT��
						CancelBuff(Snack ,502921) --�����L��
						break
					end
				end
				Step2 = 1 --�ǳƧ���
			end
			--�԰��ǳ�
			GameEnd = 0
			if	GameStart == 0	then --�ǳƧ������аO
				DW_SetColdown(OwnerID(),493207,0) --�T�{�ۦ�CD�k�s
				-----�ت��פ��
				local Box = {}
				for i=7,12  do
					Box[i-6] = Lua_DW_CreateObj("flag",110578,780088,i,0)
					Lua_ObjDontTouch(Box[i-6]) -- �I����
					NPCAttackFlag(Box[i-6]) -- �D�԰�
					SetModeEx(Box[i-6],EM_SetModeType_Gravity,false)
					SetModeEx(Box[i-6],EM_SetModeType_Show,false)
					SetModeEx(Box[i-6],EM_SetModeType_Obstruct,true)
					AddToPartition(  Box[i-6]   ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h
					BeginPlot(Box[i-6],"LuaS_102040_16",0)
				end
				---�ŧi�����ܼ�
				Ver_Zone115_FatGirl[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = OwnerID()

				---�T�L�۹����B�z
				Rock1 = Lua_DW_CreateObj("flag",113000,780088,3)
				Rock2 = Lua_DW_CreateObj("flag",113001,780088,4)
				Rock3 = Lua_DW_CreateObj("flag",113002,780088,5)
				SetPlot(Rock1,"touch","LuaS_102040_11",50)
				SetPlot(Rock2,"touch","LuaS_102040_11",50)
				SetPlot(Rock3,"touch","LuaS_102040_11",50)
				---�������T��BUFF
				if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
					AddBuff(OwnerID(),503439 ,10,-1)
					AddBuff(OwnerID(),503440 ,100,-1)
					AddBuff(OwnerID(),503441 ,10,-1)
				else
					AddBuff(OwnerID(),503439 ,10,-1)
					AddBuff(OwnerID(),503440 ,250,-1)
					AddBuff(OwnerID(),503441 ,10,-1)
				end
				GameStart = 1	--�ǳƧ���
			end
		else
			--�M���Գ�
			GameStart = 0
			if	GameEnd == 0	then
				-------------���m��
				Step2 = 0
				FightSec = 0
				SaveTime = 0
				BombTime = 0
				-------------�R����
				--BUFF��
				CancelBuff(OwnerID(),503931)
				CancelBuff(OwnerID(),503435)
				--�۹�
				DelObj(Rock1)
				DelObj(Rock2)
				DelObj(Rock3)
				GameEnd = 1 --�M������
			end
			if	ReadRoleValue(TargetID() , EM_RoleValue_SpellMagicID )	== 0	and --�p�G�S�b�I�k
				ReadRoleValue(OwnerID(),EM_RoleValue_PID)~= 0		then --�S�S���M�ŴN���}�԰� �N���\�_�k
				LuaS_102040_5()  -- �ɩ�
			end
		end
		-----------------
		--�ޯ�`��(�԰����~�Ұ�)
		AT = ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID) --��e�ؼ�
		while HateListCount(OwnerID()) > 0 do
			--------------�O�I�ɶ�
			SaveTime = SaveTime + 1
			if	SaveTime < 7	then	break	end
			--------------�S�O�p��
			if	DW_CheckUse(OwnerID(),493207) <= 0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then -- �԰��Ҧ�
				if	CastSpell(OwnerID(),OwnerID(),493207)	then	break	end
			end
			if	DW_CheckUse(OwnerID(),493208) == 0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then -- ����ۤ�
				if	CastSpellLv(OwnerID(),OwnerID(),493208,2)	then	break	end
			end
			if	DW_CheckUse(OwnerID(),493209)==0	and  -- ���ӳN
				DW_CheckUse(OwnerID(),493208) > 0	and
				CheckBuff(OwnerID(),503931) == false	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then
				if	CastSpellLv(OwnerID(),  HateListInfo(OwnerID() ,DW_Rand(HateListCount( OwnerID()))-1  , EM_HateListInfoType_GItemID ) ,493209 , 7)	then
					Say(OwnerID(),"[SC_102040_11]")
					break
				end

			end
			if	DW_CheckUse(OwnerID(),493210)==0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then --�����i
				if	CastSpellLv(OwnerID(),OwnerID(),493210,5)	then	break	end
			end
			--------�S�O�����B�z�t��
			if	FightSec >= 60	and
				BombTime ==0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_Coldown_All ) == 0	and
				DW_CheckUse(OwnerID(),493211) <=0		then
				sleep(10)
				SaveTime = SaveTime + 1
				CancelBuff(OwnerID(),503435)
				DW_SetColdown(OwnerID(),493207,0) --�T�{�ۦ�CD�k�s
				DW_SetColdown(OwnerID(),493211,0)
				BombTime  = BombTime + 1
			end
			if	FightSec >= 120	and
				BombTime == 1	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_Coldown_All ) == 0	and
				DW_CheckUse(OwnerID(),493211) <=0		then
				sleep(10)
				SaveTime = SaveTime + 1
				CancelBuff(OwnerID(),503435)
				DW_SetColdown(OwnerID(),493207,0) --�T�{�ۦ�CD�k�s
				DW_SetColdown(OwnerID(),493211,0)
				BombTime  = BombTime + 1
			end
			if	FightSec >= 180	and
				BombTime == 2	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_Coldown_All ) == 0	and
				DW_CheckUse(OwnerID(),493211) <=0		then
				sleep(10)
				SaveTime = SaveTime + 1
				CancelBuff(OwnerID(),503435)
				DW_SetColdown(OwnerID(),493207,0) --�T�{�ۦ�CD�k�s
				DW_SetColdown(OwnerID(),493211,0)
				BombTime  = BombTime + 1

			end
			local Comunication = 0
			if	DW_CheckUse(OwnerID(),493211) <= 0	and
				CheckBuff(OwnerID(),503435)==false		and
				CheckBuff(OwnerID(),503931)==false		and	--�u��b�Ĥ@���q
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then --�}�ީI�s����
				if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
					if	SysCastSpellLv(OwnerID(),OwnerID(),493211,99)	then
						Say(OwnerID(),"[SC_102040_12]")
						Comunication = 1
					end
				else
					if	SysCastSpellLv(OwnerID(),OwnerID(),493211,499)	then
						Say(OwnerID(),"[SC_102040_12]")
						Comunication = 1
					end
				end
				if	Comunication == 1	then
					sleep(10)
					CastSpell(OwnerID(),OwnerID(),493212)
					break
				end
			end
			if	DW_CheckUse(OwnerID(),493305)==0	and
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then -- �]�O�پ�
				local RT
				for i = 0,HateListCount(OwnerID())-1	do
					RT = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
					if	ReadRoleValue(RT,EM_RoleValue_MaxMP) > 0	and
						DW_Rand(2)>1				then
						if	CastSpell(OwnerID(),RT,493305)	then	break	end
					end
				end
			end
			if	DW_CheckUse(OwnerID(),Skill1)==0	and
				CheckBuff(OwnerID(),503931)	and --�u��b��2���q
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then  -- �r��
				if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
					if	CastSpellLv(OwnerID(),OwnerID(),Skill1,2)		then	break	end
				else
					if	CastSpellLv(OwnerID(),OwnerID(),Skill1,9)		then	break	end
				end
			end
			if	DW_CheckUse(OwnerID(),Skill1) > 0	and	--�@�w���H���r�~��D
				DW_CheckUse(OwnerID(),Skill2)==0	and
				CheckBuff(OwnerID(),503931)	and --�u��b��2���q
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then  -- ��D
				if	CastSpell(OwnerID(),OwnerID(),Skill2)		then	break	end
			end
			if	DW_CheckUse(OwnerID(),493580) == 0	and
				CheckBuff(OwnerID(),503931)		and --�u��b��2���q
				ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0	then --�D���r��
				if	CastSpellLv(OwnerID(),AT,493580,20)		then	break	end
			end
			break
		end
	end
end

function LuaS_102040_18() --�Ѭr������@��
	CancelBuff(TargetID(),503926)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_102040_10]", C_Yellow ) -- ���ϴ��ܰT��
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_102040_10]", C_Yellow ) -- ���ϴ��ܰT��
end

function LuaS_102040_19()--�s�p�D���@��
	local XYZ = {4111.1, 596.7 , 2884.1}
	XYZ[1] = XYZ[1] +DW_Rand(10)-5
	XYZ[3] = XYZ[3] +DW_Rand(10)-5
	local S1 
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		S1 = Lua_DW_CreateObj("xyz",103480,XYZ,1,DW_Rand(359))
	else
		S1 = Lua_DW_CreateObj("xyz",102293,XYZ,1,DW_Rand(359))
	end

	local XYZ = {4009.1, 596.7 , 2893.1}
	XYZ[1] = XYZ[1] +DW_Rand(10)-5
	XYZ[3] = XYZ[3] +DW_Rand(10)-5
	local S2
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		S2 = Lua_DW_CreateObj("xyz",103480,XYZ,1,DW_Rand(359))
	else
		S2 = Lua_DW_CreateObj("xyz",102293,XYZ,1,DW_Rand(359))
	end

	local XYZ = {3971.1, 600.7 , 2800.1}
	XYZ[1] = XYZ[1] +DW_Rand(10)-5
	XYZ[3] = XYZ[3] +DW_Rand(10)-5
	local S3
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		S3 = Lua_DW_CreateObj("xyz",103480,XYZ,1,DW_Rand(359))
	else
		S3 = Lua_DW_CreateObj("xyz",102293,XYZ,1,DW_Rand(359))
	end

	BeginPlot(S1 ,"LuaS_102040_20",0)
	BeginPlot(S2 ,"LuaS_102040_20",0)
	BeginPlot(S3 ,"LuaS_102040_20",0)
end

function LuaS_102040_20()--�p�D�ܤj�D���@��
	local sec = 0
	local time = 10  --�X��n�ܤj�D
	while true do
		sleep(10)
		if	sec > time	then
			local BigSnake
			if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
				BigSnake = Lua_DW_CreateObj("obj",103481,OwnerID())
			else
				BigSnake = Lua_DW_CreateObj("obj",102294,OwnerID())
			end
			BeginPlot(BigSnake ,"LuaS_Discowood_CheckPeace",0)
			DelObj(OwnerID())
		end
		sec = sec + 1
	end
end

function LuaS_102040_16()
	while true do
		sleep(10)
		if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead) == 1	or
			ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode)==0	then
			DelObj(OwnerID())
		end
	end
end

function LuaS_102040_11() --Ĳ�I�@�� �άO ���~�ϥ�
	if	not CheckDistance( OwnerID(), TargetID() , 70 )	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 );
		return
	end

	local Brother
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		Brother = {103475,103476,103477}
	else
		Brother = {102068,102069,102070}
	end
	for i = 0 , 2	do
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== i+113000	then
			if	CountBodyItem(OwnerID(),204845)< 1	then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_102040_2]", 0 );
				return
			end
			Hide(TargetID())
			local NPC = Lua_DW_CreateObj("obj",Brother[i+1],TargetID())
			BeginPlot(NPC,"LuaS_102040_12",0)
			DelBodyItem(OwnerID(),204845,1)
			DelObj(TargetID())
			return
		end
	end

	if	CheckBuff(TargetID(),503438)	then
		CancelBuff_NoEvent(TargetID(),503438)
		UseItemDestroy() -- �R���ϥΤ���
		ScriptMessage( OwnerID(), -1, 2, "[SC_102040_6]", 0 );
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]", 0 );
	end
end

function LuaS_102040_12()
	sleep(10)
	CastSpell(OwnerID(),Ver_Zone115_FatGirl[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )],493242)
	sleep(30)
	LuaFunc_MoveToFlag( OwnerID(), 780088 , 6 , 0 )
	DelObj(OwnerID())
end

function LuaS_102040_13() --�k�N
	local NPC
	if	ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)==126	then
		NPC = {103475,103476,103477}
	else
		NPC = {102068,102069,102070}
	end
	local Buff = { 503439 , 503440 , 503441 }
	local String = {"[SC_102040_1]","[SC_102040_4]","[SC_102040_5]"}
	for i = 1,3 do
		if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == NPC[i]	then
			Yell(OwnerID(), String[i] ,2)
			CancelBuff(TargetID() , Buff[i])
			return
		end
	end
end

function LuaS_102040_21()
	while	true	do
		sleep(10)
		if	CheckID(TargetID())==false				or
			ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
			DelObj(OwnerID())
		end
	end
end