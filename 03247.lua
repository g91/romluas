
local g_Obj = {};
g_Obj.Marissa = {};	-- 各層的瑪莉莎

local g_Magic = {};
g_Magic.SpreadFear = {};
g_Magic.SpreadFear.ID = 499138;	-- 恐懼蔓延傷害
g_Magic.SpreadFear.Lv = {};
g_Magic.SpreadFear.Lv[951] = 0;
g_Magic.SpreadFear.Lv[178] = 0;
g_Magic.SpreadFear.Lv[179] = 0;
g_Magic.SpreadFear.Lv[180] = 0;

local g_Buff = {};
g_Buff.SpreadFear = {};	-- 恐懼蔓延
g_Buff.SpreadFear.ID = 503561;	-- 恐懼蔓延 - 恐懼效果

function MagicBase_503561_Check()	-- 恐懼蔓延 檢查判斷

	local Owner = OwnerID();
	local Target = TargetID();
	Say( Owner, "Fear O" );
	Say( Target, "Fear T" );

	if CheckBuff( Target, g_Buff.SpreadFear.ID ) and Target == Owner then
		DebugMsg( 0, 0, "目標已有恐懼效果，且目標為自己" );
		return false;
	elseif Target == Owner then
		DebugMsg( 0, 0, "目標為自己" );
		return false;
	elseif CheckBuff( Target, g_Buff.SpreadFear.ID ) then
		DebugMsg( 0, 0, "目標身上已有恐懼效果" );
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