--0829�s�W �ץ� AC2"�ˬd���a�^�m������"�|�y�������ޯ�{�Ϊ����D
function AC2_SpellCheck851731()
	local Player = OwnerID()
	local CheckResult = true
	local SkillBuff = {}
	SkillBuff[ 1 ] = 500675 --���
	SkillBuff[ 2 ] = 500745 --����
	SkillBuff[ 3 ] = 505445 --�j�N���_-�`�F�M�h�ܨ�
	SkillBuff[ 4 ] = 505296 --�j�N���_ - ����
	SkillBuff[ 5 ] = 504887 --�v�˪��ޯ�

	for i = 1, #SkillBuff, 1 do
		if ( SkillBuff[ i ] ~= nil and SkillBuff[ i ] ~= 0 ) then
			if CheckBuff( Player, SkillBuff[ i ] ) == true then
				CheckResult = false
			end
		end
	end
	--DebugMsg( 0, 0, "AC2_CastSpell851731_CheckResult[ "..tostring( CheckResult ).." ]" )
	if CheckResult == false then
		return false
	end
	return true
end
function Lua_na_AC2openTheGift()
	local Owner = OwnerID()
	local LV=ReadRoleValue( Owner , EM_RoleValue_LV )
	local Gift = {	[1] = 727027, 
			[2] = 727028, 
			[3] = 727029 }
	if Lv < 80 then
		GiveBodyItem(Owner,Gift[1],1)
		GiveBodyItem(Owner,Gift[1],1)
	elseif Lv < 85 then
		GiveBodyItem(Owner,Gift[2],1)
		GiveBodyItem(Owner,Gift[2],1)
	else
		GiveBodyItem(Owner,Gift[3],1)
		GiveBodyItem(Owner,Gift[3],1)
	end
end


function Lua_na_AC2Resorce()
	GiveBodyItem(OwnerID(),727032,1)
end