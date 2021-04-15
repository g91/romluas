function LuaQ_drAAA()
	local own = ownerID()
		Say(own,"i will bit 10 people")

end

function LuaQ_drBBB()
	Say(OwnerID() ,"CHECK")
	local Obj;
	local Count = SetSearchRangeInfo( OwnerID(),500 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff(ID,620027) == true and ID ~= TargetID() then

			local BuffPos = Lua_BuffPosSearch( ID, 620027 )
			Say(OwnerID() ,BuffPos )
			Say( OwnerID() , BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID))
			Say( OwnerID() , OwnerID() )
			if BuffPos >= 0 and BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() then
				CancelBuff(ID,620027)
				AddBuff(ID ,620027 , 1 ,30 );
			end
		end
	end
	
	if CheckBuff(TargetID() , 620027 ) ~= true then	
		return True
	else
		return false
	end
end

function DRDELOBJ()
	local Atable={}
	Atable=SearchRangeNPC(OwnerID(),50)
	for i=0,table.getn(Atable),1 do
		if ReadRoleValue(Atable[i],EM_RoleValue_OrgID)==100292 then
			DelObj(Atable[i])
		end
	end
end

function npcsay_monster()
	local monster = OwnerID()
	local sentence = {
			[1]="one",
			[2]="two",
			[3]="three",
			[4]="four",
			[5]="five"
			}
	local sentenceRand = Rand(5)+1
	npcsay(monster,sentence[sentenceRand])
end

function NPCSAY_WAKER_A()
	local Ctrl = OwnerID()
	local Ctime = 0
	local Dtime = 0
	local sentence = {
			[1]="[SC_WAKER_A01]",
			[2]="[SC_WAKER_A02]",
			[3]="[SC_WAKER_A03]",
			[4]="[SC_WAKER_A04]",
			[5]="[SC_WAKER_B01]",
			[6]="[SC_WAKER_B02]",
			[7]="[SC_WAKER_B03]",
			[8]="[SC_WAKER_B04]"
			}
	local MAN = Lua_DW_CreateObj( "flag" , 118948 , 781005 , 0 , 1 , 1 )
	local WOMAN = Lua_DW_CreateObj( "flag" , 118949 , 781005 , 1 , 1 , 1 )
	local ARand = Rand(4)+1
	local BRand = Rand(4)+5
	for i=0,10,2 do
		Ctime = Ctime+1
		DW_MoveDirectToFlag( MAN , 781005 , i+2, 1  )
		DW_MoveDirectToFlag( WOMAN , 781005 , i+3 , 1  )
		for i=0,6 do
			npcsay(MAN,sentence[ARand])
			npcsay(WOMAN,sentence[BRand])
		end
	end
	if Ctime==5 then
	DelObj(WOMAN)
	DelObj(MAN)
	end
	--CallPlot(ctrl,"NPCSAY_WAKER_B",ctrl)
end

--function NPCSAY_WAKER_B(Ctrl)
--	local Num = 0
--	for i=0,300,1 do
--	Num = Num+1
--		if Num == 300 then
--		CallPlot(Ctrl,"NPCSAY_WAKER_A",0)
--		break
--		end
--	end
--end

Function dr_addbuff(buff)
	local obj = obj or OwnerID()
	
end
function Lua_Z21_RecipeList_Init()
	local Z21shop = {
			[01] = {[11]=551754 ,[12]=551755 ,[13]=551756};
			[02] = {[21]=551754 ,[22]=551755 ,[23]=551756};
			[03] = {[31]=551754 ,[32]=551755 ,[33]=551756}
                                                 }
	say(OwnerID(), Z21shop[01][11] )
	--AddRecipe( OwnerID(), Z21shop[01] ); --精緻完美專家製甲箱
end

function DrclearObj()
	local X = 0
	local OID = OwnerID()
	local searchtable = SearchRangeNPC(OID ,100)
		for i=0,table.getn(searchtable) do
			if ReadRoleValue(searchtable[i],EM_RoleValue_OrgID) == 100292  then
			DelObj(searchtable[i])
			X = X+1
			end
		end
	say(OID,X)
end
