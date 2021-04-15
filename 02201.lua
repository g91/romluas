------------------------Lua������------------------------------------
--[[
a and b�G�p�Ga��false�A�h��^a�F�_�h��^b
a or b�G�p�G a ��true�A�h��^a�F�_�h��^b
y= a  and b or c  --�̫�y���Ȭ�c
]]--

function kg_ForLoopTest()	--for�j����վ�z�Ai�N���O�}�C�̪���i�����,���׬O���p�J��w��Y��array���j��]�p�A����pairs�N��F

	local days = {"Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday"}
	local revdays = {}	--�ϦV��
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"ipairs")	--�L�X�@�P�����r��M�Ʀr
	for i,v in ipairs(days) do	----i�q�@�}�l�A�C���`�����|�A�[�@�A��i����}�C�̪���ƼơA�j��N�|���� �Av�h�N��}�C�̨C����ƪ����e
		DebugMsg(0,0,"i = "..i)
		revdays[v]=i	--�s�@�ϦV��
		DebugMsg(0,0,"v = "..v)
		DebugMsg(0,0,revdays[v])
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"pairs")	--�L�X1~7
	for i in pairs(days) do	
		revdays[days[i]]=i	--�s�@�ϦV��
		DebugMsg(0,0,revdays[days[i]])
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"table.getn")	--�L�X�@�P�����r��
	for i=1,table.getn(days) do
		DebugMsg(0,0,days[i])
	end
	
	--�{�b�� revdays={ ["Sunday"]=1 , [ "Monday"]=2, [ "Tuesday"]=3 , ["Wednesday"]=4 , ["Thursday"]=5 , ["Friday"]=6, ["Saturday"]=7 }
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"�ϦV��revDays :") DebugMsg(0,0,"table.getn")
	for i=1 ,table.getn(revdays) do	--�L���X�F���
		DebugMsg(0,0,"i= "..i)
		DebugMsg(0,0,revdays[i])
	end
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"ipairs")
	for i,v in ipairs(revdays) do	--�]�L���X�F��
		DebugMsg(0,0,"i= "..i)	--�si�]�L���X�ӡA�ݨ찭
		DebugMsg(0,0,"v= "..v)
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"pairs")
	for i in pairs(revdays) do	--�ߤ@�i�H�L�X�Ӫ�
		DebugMsg(0,0,"i= "..i)	--�L�X�@�P�����W��
		local v =revdays[i]
		DebugMsg(0,0,"v= "..v)	--�L�X�}�C���e
	end
end

function kg_IteratorTest()
	local Array = { 1,2,3,4,5,6,6,8,9,10 }
	local iterator = function (table,cb)
		for i=1,#table do
			cb(table[i])
		end
	end
	local Count = function (container,elem)
		local n = 0
		iterator(container,function(value)
			if value==elem then
				n=n+1
			end
		end )
		return n
	end
	DebugMsg(0,0,Count(Array,6))
	
	local elements_of = function(table)
		local i=0
		return 	function()
				i=i+1
				return table[i]
			end
	end
	local Count2 = function (container,elem)
		local n = 0
		for value in elements_of(container) do
			if value ==elem then
				n=n+1
			end
		end
		return n
	end
	DebugMsg(0,0,Count2(Array,6))
	
	local function Count3(container,elem)
		local n=0
		for i in pairs(container) do
			if container[i]==elem then
				n=n+1
			end
		end
		return n
	end
	DebugMsg( 0,0,Count3(Array,6) )
end

-------------------------------OO����--------------------------------------------
function kg_OOfunctionTest()
	local RoleArray={};
	RoleArray.RoleID=OwnerID();
	function RoleArray:ShowName(test)
		Say( self.RoleID,test);
	end
	function RoleArray.ShowName2(self,test)
		Say( self.RoleID,test);
	end
	
	RoleArray:ShowName("123");
	RoleArray:ShowName2("456");
	RoleArray.ShowName2(RoleArray, "789");
end


function kg_OOtest()
	local Player = kg_Role:new(OwnerID());
	if Player:inbattle() then
		Player:Say("inbattle!!!!");
	end
	local CustomClass = {	Var3=456,
				CustomMsg = function (self,tempstring)
					Say(self.RoleID,tempstring);
				end ,
				Var4="ohohohohohohohoh~~~"
				};
	
	
	local Boss = kg_Role:new( Player:getpos(117201,30,10) , CustomClass );
	Boss:ModeEX( EM_SetModeType_Gravity,false );
	Boss:SetLiveTime(10);
	Boss:AddToPartition( Player:RoomID() );
	Boss:Say( "My Gid="..Boss.Gid.." ,PosX="..Boss:X().." ,Var3="..Boss.Var3.." ,Var4="..Boss.Var4.." ,ZoneID="..Boss:ZoneID() );
	Boss:CustomMsg("MessageTest..");
	local OldTick = GetTickCount()
	local NewTick = 0
	local num = 0
	if Boss:isnpc() then
		for i =1,10 do
			--[[
			NewTick =  GetTickCount();
			num =NewTick-OldTick ;
			OldTick = NewTick;
			DebugMsg(0,0,num);--1000
			]]--
			Boss:Reg(i,10-i+1);
			temp = temp or "nil";
			Boss:Say("register_"..i.." = "..Boss:Reg(i)  );
			Sleep(10)
		end
	end
end

----------------------------------Data Structure ����------------------------------


