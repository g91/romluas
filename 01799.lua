LD_GL_VAR1 = 100;
LD_GL_TB1 = {LD_TB1K1 = 1, LD_TB1K2 = true, LD_TB1K3 = "TB1K3"};
LD_GL_TB2 = {LD_TB2K1 = true, LD_TB2K2 = {LD_TB2K2V1 = false, LD_TB2K2V2 = "220d"}};
LD_GL_TB3 = {LD_TB3K1 = "TestString",  LD_TB3K2 = {LD_TB3V2K1 = LD_GL_TB2, LD_TB3V2K2 = {}}, LD_TB3K3 = 100};

local LD_GL_UP_VAR1 = 11;

function LD_Test()
	local x = 100;
	local y = 200;
	y = y + LD_GL_UP_VAR1;
	local z = LD_Test2(x, y);
	local str = "This is a string.";
	str = str.." + ";
	str = str.."This is another string";
	z = z + 10;
	local testbool = true;
	local l1 = 1;
	local l2 = 2;
	local l3 = 3;
	local l4 = l1 + l2 + l3;
end

function LD_Test2(x, y)
	local a = x + 1;
	local b = y + 2;
	return a + b;
end