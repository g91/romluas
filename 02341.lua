function Lua_na_egrass_attack() --���㪺�j�N�k���ޯ�
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1= �O 0= �_
	local random= Rand(2)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --��P�H�x�i�J�԰�
			if  random <1 then --1/2 �����|�I������k�N
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				say( OwnerID(), "CORRODE!!") -- �G�k�a�I
				CastSpell( OwnerID(), OwnerID(), 496849) -- �j�N�k���ޯ� / �G�k�ĲG
				sleep(50)
			end
		end
	sleep(100)
	end
end



function Lua_na_sflower_attack() --��ļ���j�N�G�F��
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1= �O 0= �_
	local random= Rand(2)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --��P�H�x�i�J�԰�
			if  random <1 then --1/2 �����|�I������k�N
				PlayMotion( OwnerID(), 31 )
				sleep(20)
				say( OwnerID(), "BOMB") -- �z���a�I
				CastSpell( OwnerID(), OwnerID(), 496850) -- �G�G�P�H�x�ޯ� / �G�ꬵ�u
				sleep(50)
			end
		end
	sleep(100)
	end
end