
--�����Ŷꨩ§�]
function lua_mika_phshellbag(GiveCount)
	local Player = OwnerID()
	local Item = 240181  -- �����Ŷꨩ Phirius Shell

	local Get

	Get = Lua_Hao_Check_Item_Stack( Player , Item , GiveCount )
	if Get ~= GiveCount then
		ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )	-- �A�̦h�u��O�d1000�ӥ����Ŷꨩ�A�Ӫ��~���o�ƶq�w�F�W���C
		return false
	else
		GiveBodyItem(Player, Item, GiveCount )
	end
end