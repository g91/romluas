--242049 ���y  �A547202 ���ȺX��
--LuaP_DW_Dead ����@��
--121631 ���a�i�ܵP
--
function BIXO_Xmas2012_Dau1() --���y�����@��
local tar = TargetID()  --�Q�������H
	if ReadRoleValue( tar , EM_RoleValue_OrgID )==121630 then
		local bufflv  
		bufflv = FN_CountBuffLevel(TargetID(),623787)  --Ū���ؼШ��W�o��Buff���X�h -1�N��SBuff
		--say(tar,"Buff = "..bufflv)
		if bufflv == 0 then
			CancelBuff( tar, 623787 )
		else
			CancelBuff( tar, 623787 )
			AddBuff(tar,623787,bufflv-1,-1)
		end
		return true
	else
		return falsea
	end
end

function BIXO_Xmas2012_Dau2() --���p�J�D���S�԰��@��!
local own = OwnerID()
SetModeEx(own,EM_SetModeType_ShowRoleHead, true)
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
Addbuff(own,623787,9,-1)  --�԰��@�}�l���ۤv�W10�h�P�_�԰��ηx�y����
local timer = 0
local player = {}  --�ѤH�P�_�P��O�_�����a
--SetPlot( own,"dead","BIXO_Xmas2012_Dau6",0 )
local bufflv  --�P�_�ۨ�Buff
local tale1 = 0
local ctrl    --���`��t+�p�ɥ�
local child1 = CreateObjByFlag( 121634, 781246 , 4 , 1 )
local child2 =	CreateObjByFlag( 121638, 781246 , 5 , 1 )
local lockdoor =  CreateObjByFlag( 106237, 781246 , 3 , 1 )
--local tablee = {child1,child2,lockdoor}

	SetModeEx(child1,EM_SetModeType_Mark, false)
	SetModeEx(child1,EM_SetModeType_HideName, true)
	SetModeEx(child1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(child1,EM_SetModeType_Strikback, false)
	--SetModeEx(child1,EM_SetModeType_Move, false)
	SetModeEx(child1,EM_SetModeType_Fight, false)
	SetModeEx(child1,EM_SetModeType_Searchenemy, false)
	SetModeEx(child1,EM_SetModeType_Obstruct, true)
	SetModeEx(child1,EM_SetModeType_Gravity, true)
	AddToPartition(child1, RoomID)
	SetModeEx(child2,EM_SetModeType_Mark, false)
	SetModeEx(child2,EM_SetModeType_HideName, true)
	SetModeEx(child2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(child2,EM_SetModeType_Strikback, false)
	--SetModeEx(child2,EM_SetModeType_Move, false)
	SetModeEx(child2,EM_SetModeType_Fight, false)
	SetModeEx(child2,EM_SetModeType_Searchenemy, false)
	SetModeEx(child2,EM_SetModeType_Obstruct, true)
	SetModeEx(child2,EM_SetModeType_Gravity, true)
	AddToPartition(child2, RoomID)
	SetModeEx(lockdoor,EM_SetModeType_Mark, false)
	SetModeEx(lockdoor,EM_SetModeType_HideName, true)
	SetModeEx(lockdoor,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(lockdoor,EM_SetModeType_Strikback, false)
	SetModeEx(lockdoor,EM_SetModeType_Move, false)
	SetModeEx(lockdoor,EM_SetModeType_Fight, false)
	SetModeEx(lockdoor,EM_SetModeType_Searchenemy, false)
	SetModeEx(lockdoor,EM_SetModeType_Obstruct, true)
	SetModeEx(lockdoor,EM_SetModeType_Gravity, false)
	AddToPartition(lockdoor, RoomID)

--WriteRoleValue(own,EM_RoleValue_register1,child1)
--WriteRoleValue(own,EM_RoleValue_register2,child2)
--WriteRoleValue(own,EM_RoleValue_register3,lockdoor)
	while 1 do
		sleep(20)
		timer = timer + 1
		bufflv = FN_CountBuffLevel(own,623787)
		--say(own,"Buff = "..bufflv)
		if bufflv<9 and bufflv>-1 then                         --���H�o�ʧ���
			if tale1 == 0 then                        --�}�l�԰��H�ỡ�@�y��
				ScriptMessage( own, 0 , 2 , "[SC_UNWARM_4]" , 0 )
				tale1 =1
			end
			player = SearchRangePlayer ( own , 300 )  --�d��300�������a�}�l�O�����a
			local player1 = {}  --���᪱�a����
			for i = 0 , (#player)-1 do
				if checkbuff(player[i],504459) == false then
					table.insert(player1,player[i])
				end
			end
			--say(own,"table = "..#player1)
			if #player1 ~=0 then
				if GetDistance( own, player1[1])<=100 then
					CastSpelllv(Own,player1[1],499756,0)
				else
					CastSpelllv(Own,player1[1],499755,0)
				end	
			else
				ScriptMessage( own, 0 , 2 , "[SC_UNWARM_5]" , 0 )
				Addbuff(own,623787,9,-1)
				tale1 = 0
			end	
		elseif bufflv<0 then  --�Q���ѤF
			ScriptMessage( own, 0 , 2 , "[SC_UNWARM_3]" , 0 )
			player = SearchRangePlayer ( own , 500 )
			for i = 0 , #player do
			--say(player[i],"in = 1")
				if CheckAcceptQuest( player[i], 425792 ) == true and   --�P�_���a�O�_��������
				CheckFlag( player[i], 547203 ) ~= true then            --�P�_���a�O�_�����������Ȫ��X��
					SetFlag(player[i],547203,1)                        --�����a��������
					--say(player[i],"in = 2")
				end
			end
			castSpelllv( own,  own, 490590,0 )
			local x1= ReadRoleValue ( own, EM_RoleValue_X)
			local y1= ReadRoleValue (  own, EM_RoleValue_Y)
			local z1=ReadRoleValue (  own, EM_RoleValue_Z)
			ctrl = CreateObj ( 102277 , x1 , y1 , z1 , 0 , 1)
			SetModeEx(ctrl,EM_SetModeType_Mark, false)
			SetModeEx(ctrl,EM_SetModeType_HideName, false)
			SetModeEx(ctrl,EM_SetModeType_NotShowHPMP, false)
			SetModeEx(ctrl,EM_SetModeType_Strikback, false)
			SetModeEx(ctrl,EM_SetModeType_Move, false)
			SetModeEx(ctrl,EM_SetModeType_Fight, false)
			SetModeEx(ctrl,EM_SetModeType_Searchenemy, false)
			SetModeEx(ctrl,EM_SetModeType_Show,false)
			AddToPartition(ctrl,roomID )
			WriteRoleValue(ctrl,EM_RoleValue_register1,child1)
			WriteRoleValue(ctrl,EM_RoleValue_register2,child2)
			Delobj(lockdoor)
			Beginplot(ctrl,"BIXO_Xmas2012_Check",0)
			Beginplot(ctrl,"BIXO_Xmas2012_Dau6",0)
			sleep(30)
			Delobj(own)
		end	
	end
end

function BIXO_Xmas2012_Dau3(num) --���p�J�D���S�ޯ�ˮ`
	local tar = TargetID()
	local bufflv  
	bufflv = FN_CountBuffLevel(tar,504458)
	if bufflv+num >= 20 then
		CancelBuff( tar, 504458 )
		AddBuff(tar,504459,0,-1)	
	else
		CancelBuff( tar, 504458 )
		AddBuff(tar,504458,bufflv+num,-1)
	end
end

function BIXO_Xmas2012_Dau4()  --���ȧ����R���X��
	local player = TargetID()
	DelBodyItem( player, 547202, 1 )
	DelBodyItem( player, 547203, 1 )
	SetFlag( player, 547326, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( Player , 1216331 , "complete" )
end
function BIXO_Xmas2012_Dau7()  --�����ȧR���H��
	DelBodyItem( TargetID(), 242048, 1 )
end
function BIXO_Xmas2012_Dau5()  --����W���@��
local own = OwnerID()
LuaP_DW_Dead()
SetPlot( own,"touch","BIXO_Xmas2012_Dau5_1",30 )
end
function BIXO_Xmas2012_Dau5_1() 
	BeginCastBarEvent( OwnerID(), TargetID(), "[SC_UNWARM_11]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "BIXO_Xmas2012_Dau5_2" )
end
function BIXO_Xmas2012_Dau5_2(Obj,CheckResult)  --�p�ǳQ�I�H��2
	if CheckResult > 0 then
		GiveBodyItem( OwnerID(), 242048, 1 ) --�����a�K�ڤڪ��H
		GiveBodyItem( OwnerID(), 547344, 1 )
		--GiveBodyItem( OwnerID(), 242049, 5 ) --�����a���y
	end
	EndCastBar( OwnerID(), CheckResult ) 
end
function BIXO_Xmas2012_Dau6()  --��t�@��+Boss����
local own = OwnerID()
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
local timer = 0
local ctrl
local child1 = ReadRoleValue(own,EM_RoleValue_register1)
local child2 = ReadRoleValue(own,EM_RoleValue_register2)
local mom = CreateObjByFlag( 121684, 781246 , 1 , 1 )

SetModeEx(mom,EM_SetModeType_Gravity, true)
AddToPartition( mom, RoomID)
MoveToFlagEnabled( child1 , false )
MoveToFlagEnabled( child2 , false )
MoveToFlagEnabled( mom , false )
Beginplot(child1,"BIXO_Xmas2012_Dau6_1",0)
Beginplot(child2,"BIXO_Xmas2012_Dau6_2",0)
Beginplot(mom,"BIXO_Xmas2012_Dau6_3",0)

--[[
local x,y,z,dir=DW_Location(781246,6);
local sec1 = Move( child1 , x , y , z )
say(child1,"time1 = "..sec1)
local x1,y1,z1,dir1=DW_Location(781246,7);
local sec2  = Move( child2 , x1 , y1 , z1 )
say(child2,"time2 = "..sec2)
local x2,y2,z2,dir2=DW_Location(781246,2);
local sec3  = Move( mom , x2 , y2 , z2 )
say(mom,"time3 = "..sec3)--]]
sleep(70)
PlayMotion(mom,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
say(mom,"[SC_UNWARM_6]")
sleep(20)
PlayMotion(child1,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
say(child1,"[SC_UNWARM_7]")
sleep(30)
--PlayMotion(mom,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
sleep(30)
PlayMotion(mom,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
say(mom,"[SC_UNWARM_8]")
sleep(30)
PlayMotion(child2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
say(child2,"[SC_UNWARM_9]")
sleep(30)
PlayMotion(mom,ruFUSION_ACTORSTATE_EMOTE_CRY)
say(mom,"[SC_UNWARM_10]")
sleep(40)
PlayMotion(child2,ruFUSION_ACTORSTATE_EMOTE_CRY)
CastSpelllv( mom,  mom, 493584,0 )
sleep(5)
Delobj(mom)
Delobj(child2)
Delobj(child1)
	while 1 do
		sleep(20)
		timer = timer +1
		--say(own,"time = "..timer)
		if timer >= 15 then
			DebugMsg(0,roomID,"----------");
			local x1= ReadRoleValue ( own, EM_RoleValue_X)
			local y1= ReadRoleValue (  own, EM_RoleValue_Y)
			local z1=ReadRoleValue (  own, EM_RoleValue_Z)
			ctrl = CreateObj ( 121630 , x1 , y1 , z1 , 0 , 1)
			SetModeEx(ctrl,EM_SetModeType_ShowRoleHead, true)
			AddToPartition(ctrl,roomID )
			sleep(10)
			delobj(own)
			break
		end
	end
end

function BIXO_Xmas2012_Dau6_1()
	local child1 = OWnerID()
	local x,y,z,dir=DW_Location(781246,6);
	local sec1 = Move( child1 , x , y , z )
	--say(child1,"time1 = "..sec1)
end

function BIXO_Xmas2012_Dau6_2()
	local child2 = OWnerID()
	local x1,y1,z1,dir1=DW_Location(781246,7);
	local sec2  = Move( child2 , x1 , y1 , z1 )
	--say(child2,"time2 = "..sec2)
end

function BIXO_Xmas2012_Dau6_3()
	local mom = OWnerID()
	local x2,y2,z2,dir2=DW_Location(781246,2);
	local sec3  = Move( mom , x2 , y2 , z2 )
	--say(mom,"time3 = "..sec3)
end

function BIXO_Xmas2012_Check()
	DebugMsg(0,0,"BIXO_Xmas2012_Check");
	sleep(750)
	local own = OwnerID();
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local x1= ReadRoleValue ( own, EM_RoleValue_X)
	local y1= ReadRoleValue (  own, EM_RoleValue_Y)
	local z1=ReadRoleValue (  own, EM_RoleValue_Z)
	local ctrl = CreateObj ( 121630 , x1 , y1 , z1 , 0 , 1)
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead, true)
	AddToPartition(ctrl,roomID )
	sleep(10)
	delobj(own)
end