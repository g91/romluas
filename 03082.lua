--�T���̪��ޯ�AI�A�ت����b�S��[�t���A�U���ܨ�ؼЬ��u������������A��q"�ƭ�"�̧C�̡C
function WY_Raider_Swoop()
	local me = OwnerID()
	local Raiding = false
	local HP = 0
	local TempHP = 0
	local Destination = 0
	local timer = 0
	local AttackTarget = 0
	local x = 0
	local y = 0
	local z = 0
	local set = false
	local aim = 0
	while ReadRoleValue(me,EM_RoleValue_HP) > 0 do
		--�ˬd�O�_�B��[�t���A
		Raiding = CheckBuff(me, 622797)
		if Raiding then
			--����Ҧ��i����������ؼСA��X��q�̧C�̪�����C��"��m"�A������aim
			for n = 0, HateListCount(me)-1 do
				AttackTarget = HateListInfo( me, n, EM_HateListInfoType_GItemID)  
				if HP == 0 then 
					HP = ReadRoleValue(AttackTarget,EM_RoleValue_HP)
				elseif HP > ReadRoleValue(AttackTarget,EM_RoleValue_HP) then 
					HP = ReadRoleValue(AttackTarget,EM_RoleValue_HP)
					aim = n
				end
			end
			--�⤳���aim��m�����aID�]�������ؼ�
			AttackTarget = HateListInfo( me, aim, EM_HateListInfoType_GItemID)  		
			local hate_table = HateListCount( me )
			local maxhate = 0
			local TempHate = 0
			local TempGID = 0
			local hateID = 0
			--��ӧ����ؼЪ�����ȽĨ�̰�
			for i=0 , hate_table-1 do
				TempGID = HateListInfo( me , i , EM_HateListInfoType_GItemID )
				if TempGID == AttackTarget then
					hateID = i
				end
				TempHate = HateListInfo( me , i , EM_HateListInfoType_HatePoint )
				if maxhate < TempHate then
					maxhate = TempHate
				end
			end
			SetHateListPoint(me, hateID , maxhate*1.2)
			SetAttack(me,AttackTarget)
		end
		sleep(10)
	end
end
--���K���`�������z�I�i				
function WY_Sonic_Death()
	ScriptMessage(OwnerID(), 0, 2, "[WY_Z160_SONIC_BLAST]", 0 )
	SysCastSpellLv(OwnerID(), OwnerID(), 495256 , 0)
	SysCastSpellLv(OwnerID(), OwnerID(), 495254 , 0)
end
--���~�若�����Ǫ�����AI
function WY_SLAVE_REBEL()
	local here = OwnerID()
	local MyRoom = ReadRoleValue(here,EM_RoleValue_RoomID)
	local Obj = 0
	local slave_table = {}
	local oro_table = {}
	local Slaves = {103379,103379}
	local Oros = {107960,107425}
	if ReadRoleValue(here,EM_RoleValue_ZoneID) == 161 then
		Slaves = {108365,108365}
		Oros = {108361,108359}
	elseif ReadRoleValue(here,EM_RoleValue_ZoneID) == 162 then
		Slaves = {108380,108380}	
		Oros = {108376,108374}	
	end
	local x,y,z,dir = 0,0,0,0
	local r = 0
	local pick = 0
	local n = 0
	local active = true
	--�����a�i�J325�d�򤺤~Ĳ�o���~�若��
	SetPlot(here,"range","WY_SLAVE_REBEL_ATK",325)
	while active do
		if ReadRoleValue(here,EM_RoleValue_Register1) == 1 then
			--�гy�T�W�ϧܪ������A�õ������Ǫ��������100%��BUFF
			for Slave = 1, 3 do
				n = RandRange (1,2)
				r = RandRange(-25,-35)
				x = ReadRoleValue(here, EM_RoleValue_X)+r
				y = ReadRoleValue(here, EM_RoleValue_Y)
				z = ReadRoleValue(here, EM_RoleValue_Z)+r
				dir = RandRange (1,360)-1
				pick = RandRange(1,2)
		 		Obj = CreateObj(Slaves[pick],x,y,z,dir,1)
				AddToPartition(Obj,MyRoom)
				AddBuff(Obj,622822,0,-1)
				table.insert(slave_table,Obj)
			end
			--�гy�@���H���Ԥh����ù�A�õ������Ǫ��������100%��BUFF
			r = RandRange(25,35) 
			x = ReadRoleValue(here, EM_RoleValue_X)
			y = ReadRoleValue(here, EM_RoleValue_Y)
			z = ReadRoleValue(here, EM_RoleValue_Z)
			dir = RandRange (1,360)-1
			pick = RandRange(1,2)
			Obj = CreateObj(Oros[pick],x+r,y,z+r,dir,1)
			AddToPartition(Obj,MyRoom)
			AddBuff(Obj,622822,0,-1)
			table.insert(oro_table,Obj)

			for Slave = 1,3 do
				Say(slave_table[Slave],"[WY_Z160_SLAVE_ATK]")
				SetAttack(slave_table[Slave],oro_table[1])
			end
			for oro = 1,1 do
				r = RandRange(1,3)
				SetAttack(oro_table[oro],slave_table[r])
			end
			active = false
		end
		sleep(10)
	end
end

function WY_SLAVE_REBEL_ATK()
	WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
end

function WY_BIGGER()
	AddBuff(OwnerID(),622823,0,-1)
	AddBuff(OwnerID(),622822,0,-1)
end
