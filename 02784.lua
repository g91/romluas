--205807  205808 ���� + ������
--SC_unwarm_1 �r��t�C
function un_Xmas2012_warmwinter_die(num)  --�x�V���ﺶ���X�p��
local own = OwnerID()
if num == nil then
	num = DW_Rand(10)
end
local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
local create 
	if num == 5 then       --10%���v�X�B��
		ScriptMessage( own, 0, 2, "[SC_UNWARM_1]", 0 ) --�A�Pı��P��ū׫�t���C�C
		local x,y,z = ReadRoleValue(own,EM_RoleValue_X),ReadRoleValue(own,EM_RoleValue_Y),ReadRoleValue(own,EM_RoleValue_Z)
		create = Az_RND_Ary(-70,70,2)  --�H���ͩ��I��
		local x1  
		local z2 
		if create[1] >= 0 then
			x1 = -50
		else
			x1 = 50
		end
		if create[2] >= 0 then
			z2 = -50
		else
			z2 = 50
		end
		local monstar = CreateObj ( 121596 , x+(create[1]+x1*2) , y , z+(create[2]+z2*2) , 0 , 1) 
		AddToPartition( monstar, RoomID)
		BeginPlot(monstar , "un_warmwinter_diemonster" ,0 )
		WriteRoleValue(monstar,EM_RoleValue_register1,0)
		WriteRoleValue(monstar,EM_RoleValue_LiveTime,30)
		SetModeEx(monstar,EM_SetModeType_Gravity, false)
		
	end
end

function un_warmwinter_diemonster()  --�p�Ǫ�AI
	local own = OwnerID()
	local timee = 0 --�K�̤��諸�ɶ� 3��
	SetModeEx(own,EM_SetModeType_Mark, false)  --�@�}�l�������a�I��
	MoveToFlagEnabled( own, false )
	SetPlot( own,"touch","un_warmwinter_diemonster_1",30 )
	--�@�X�ͧP�_�̪񪺪��a****
	--CallPlot( own, "un_warmwinter_diemonster_3", Player )
	local allplayer = {}
	allplayer = SearchRangePlayer ( own , 300 )
	if #allplayer == 0 then
		Delobj(own)  --�P��S�H�A�ۧR
	end
	--*****
	while 1 do
		sleep(10)
		timee = timee+1
		if timee <=3 then
			cancelbuff(own,504457)
		end
		if checkbuff(own,504457) == false  then
			sysCastSpelllv(own,own,499752,0) --�C��I��
			if checkID(allplayer[0]) == false then --�H�����ۧR!
				Delobj(own)
			end
			local x,y,z,dir = DW_Location( allplayer[0] )
			local RunTime = Move( own, x, y, z )
		else
			SetModeEx(own,EM_SetModeType_Mark, true)
			MoveToFlagEnabled( own, true) 
			addbuff(own,623750,0,-1)
			break
		end
		--499752 ���צB�� 504457
	end
end

function un_warmwinter_diemonster_1()  --�p�ǳQ�I�H��1
	local tar = TargetID()
		--if ReadRoleValue(tar,EM_RoleValue_register1) ==0 then
			--WriteRoleValue(tar,EM_RoleValue_register1,1) 
			BeginCastBarEvent( OwnerID(), tar, "[SC_UNWARM_2]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "un_warmwinter_diemonster_3" )
		--end
end
function un_warmwinter_diemonster_2()  --�p�ǥ���H�ۧR
Delobj(OwnerID())
end

function un_warmwinter_diemonster_3(Obj,CheckResult)  --�p�ǳQ�I�H��2
	if CheckResult > 0 then
		local tar = TargetID()
		SetModeEx(tar,EM_SetModeType_Mark, false)
		GiveBodyItem( OwnerID(), 205809, 1 ) --�����a�B��
		Delobj(tar)
	end
	EndCastBar( OwnerID(), CheckResult )
end
function un_warmwinter_diemonster_4() --���ȧ����R���X��
	DelBodyItem( TargetID(), 547191, 1 )
	SetFlag( TargetID(), 547333, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( TargetID() , 1209951 , "complete" )
end