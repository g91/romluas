function Diamond_207075()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 100 )  -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end


function Diamond_207076()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 300 ) -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function Diamond_207077()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 500 ) -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function Diamond_207117()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 1 ) -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function Diamond_207118()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 10 ) -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function Diamond_207119()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 50 ) -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function Diamond_207120()

	AddMoney_Account( OwnerID() , EM_ActionType_PlotGive , 1000 )  -- �j�����ʥ�, �}��§�]��o���p.
	return true;
end

function LuaI_240581() -- MOLIYO TP�y*2 2011/06/17

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240584 , 2 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_240582() -- MOLIYO TP�y*5 2011/06/17

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240584 , 5 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_240583() -- MOLIYO TP�y*8 2011/06/17

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240584 , 8 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end