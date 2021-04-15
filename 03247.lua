
local g_Obj = {};
g_Obj.Marissa = {};	-- �U�h��������

local g_Magic = {};
g_Magic.SpreadFear = {};
g_Magic.SpreadFear.ID = 499138;	-- ���߽����ˮ`
g_Magic.SpreadFear.Lv = {};
g_Magic.SpreadFear.Lv[951] = 0;
g_Magic.SpreadFear.Lv[178] = 0;
g_Magic.SpreadFear.Lv[179] = 0;
g_Magic.SpreadFear.Lv[180] = 0;

local g_Buff = {};
g_Buff.SpreadFear = {};	-- ���߽���
g_Buff.SpreadFear.ID = 503561;	-- ���߽��� - ���߮ĪG

function MagicBase_503561_Check()	-- ���߽��� �ˬd�P�_

	local Owner = OwnerID();
	local Target = TargetID();
	Say( Owner, "Fear O" );
	Say( Target, "Fear T" );

	if CheckBuff( Target, g_Buff.SpreadFear.ID ) and Target == Owner then
		DebugMsg( 0, 0, "�ؼФw�����߮ĪG�A�B�ؼЬ��ۤv" );
		return false;
	elseif Target == Owner then
		DebugMsg( 0, 0, "�ؼЬ��ۤv" );
		return false;
	elseif CheckBuff( Target, g_Buff.SpreadFear.ID ) then
		DebugMsg( 0, 0, "�ؼШ��W�w�����߮ĪG" );
		return false;
	end

	DebugMsg( 0, 0, "Spread Fear" );
	return true;
end

function MagicBase_505754_Plot()

	local Owner = OwnerID();
	local Target = TargetID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );

	Say( Owner, "Fear Plot O" );
	Say( Target, "Fear Plot T" );
	SysCastSpellLv( Owner, Target, g_Magic.SpreadFear.ID, g_Magic.SpreadFear.Lv[Zone] );
end