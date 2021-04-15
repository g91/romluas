------------------------Lua概念區------------------------------------
--[[
a and b：如果a為false，則返回a；否則返回b
a or b：如果 a 為true，則返回a；否則返回b
y= a  and b or c  --最後y的值為c
]]--

function kg_ForLoopTest()	--for迴圈測試整理，i代表的是陣列裡的第i筆資料,結論是假如遇到針對某個array的迴圈設計，都用pairs就對了

	local days = {"Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday"}
	local revdays = {}	--反向表
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"ipairs")	--印出一星期的字串和數字
	for i,v in ipairs(days) do	----i從一開始，每次循環都會再加一，當i等於陣列裡的資料數，迴圈就會結束 ，v則代表陣列裡每筆資料的內容
		DebugMsg(0,0,"i = "..i)
		revdays[v]=i	--製作反向表
		DebugMsg(0,0,"v = "..v)
		DebugMsg(0,0,revdays[v])
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"pairs")	--印出1~7
	for i in pairs(days) do	
		revdays[days[i]]=i	--製作反向表
		DebugMsg(0,0,revdays[days[i]])
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"table.getn")	--印出一星期的字串
	for i=1,table.getn(days) do
		DebugMsg(0,0,days[i])
	end
	
	--現在的 revdays={ ["Sunday"]=1 , [ "Monday"]=2, [ "Tuesday"]=3 , ["Wednesday"]=4 , ["Thursday"]=5 , ["Friday"]=6, ["Saturday"]=7 }
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"反向表revDays :") DebugMsg(0,0,"table.getn")
	for i=1 ,table.getn(revdays) do	--印不出東西來
		DebugMsg(0,0,"i= "..i)
		DebugMsg(0,0,revdays[i])
	end
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"ipairs")
	for i,v in ipairs(revdays) do	--也印不出東西
		DebugMsg(0,0,"i= "..i)	--連i也印不出來，看到鬼
		DebugMsg(0,0,"v= "..v)
	end
	
	DebugMsg(0,0,"-----------------------") DebugMsg(0,0,"pairs")
	for i in pairs(revdays) do	--唯一可以印出來的
		DebugMsg(0,0,"i= "..i)	--印出一星期的名稱
		local v =revdays[i]
		DebugMsg(0,0,"v= "..v)	--印出陣列內容
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

-------------------------------OO測試--------------------------------------------
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

----------------------------------Data Structure 測試------------------------------


