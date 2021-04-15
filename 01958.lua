function Init_Hao_WalkBank_AC()

	local Language = GetServerDataLanguage()
	local country = { "eneu" , "enus" , "fr" , "pl" , "de" , "es" }
	-- eneu �ڨt�^��Benus ���w�^��Bfr �k��Bpl �i���Bde �w��Bes ��Z��
	Sys_WalkBank = 1 -- �H���Ȧ�
	Sys_WalkAC = 1	-- �H�������

	for i = 1 , table.getn(country) , 1 do
		if Language == country[i] then
			Sys_WalkBank = 0
			Sys_WalkAC = 0
		end
	end
end

function Init_Hao_Test_WalkBank_AC()

	Say( OwnerID() , "Sys_WalkBank = "..Sys_WalkBank )
	Say( OwnerID() , "Sys_WalkAC = "..Sys_WalkAC )

end

function Lua_Hao_Test_OrangerBag0() --���@���J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[203553]][$SETVAR3=[203553]]"

	local itemset1 = { 
			  50 ,""		, { 202881,2 }
		--	, 8 ,""		, { 202928,2 }
		--	, 16 ,""		, { 202928,5 }
		--	, 26 ,""		, { 206340,5 } 
		--	, 36 ,"" 		, { 206340,1 }
		--	, 58 ,"" 		, { 202928,5 } 
		--	, 78,""		, { 202928,40 } 
			, 100 ,"" 		, { 202904,1 } 
							}

	local itemset2 = { 
			  50 ,""		, { 205684,1 }
		--	, 100 ,""	 	, { 203784,1 }
							}

	BaseTressureProc10(   itemset1 , 6 , itemset2 )

	return true
end

function BaseTressureProc10(   itemset  , maxprizecount , itemset2 )

	local RandValue = rand(100)
	local RandValue2 = rand(100)
	local Heap



	for i = 1 , table.getn( itemset ),3 do
		if RandValue < itemset [i] then		

			--�ˬd�O�_�����			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end

			Heap = GameObjInfo_Int( itemset[i] ,"MaxHeap")  -- ��o�Ӫ��~�����|�q���
			
			for j = 1 , table.getn( itemset[i+2] ) ,2 do
				if Heap >= itemset[i+2][j+1] then
					GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
				else
					for k = 1 , itemset[i+2][j+1] , 1 do
						GiveBodyItem( OwnerID() , itemset[i+2][j] , 1 )
					end
				end
			end

			for i = 1 , table.getn( itemset2 ) ,3 do
				if RandValue2 < itemset2[i] then
					Say( OwnerID() , "Big" )
					for j = 1 , table.getn( itemset2[i+2] ) , 2 do
						Say( OwnerID() , itemset2[i+2][j] )
						Say( OwnerID() , itemset2[i+2][j+1] )
						GiveBodyItem( OwnerID() , itemset2[i+2][j] , itemset2[i+2][j+1] )
					end
				else
					Say( OwnerID() , "Small" )
				end
			end

			if itemset[i+1] ~= "" then
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			end	
			return true;
		end
	end
	return false;
end

function Lua_Hao_Test_Reg_0()

	local Reg_00 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	Say( OwnerID() , "Reg_00 = "..Reg_00 )

end

--���F���y���@��
function Lua_Hao_SnowBall_Check( ) --�ϥΫe�ˬd
--	function Lua_Hao_SnowBall_Check( Select ) --�ϥΫe�ˬd
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Camp = ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer )
	local Boss = 104497

--	if ( Select =="CHECK" ) then	
		--	say( OwnerID(), "Owner")  ���a�ۤv
		--	say( TargetID(), "Target")  NPC�άO�䥦���a	
		if CheckDistance( OwnerID() , TargetID(), 150 ) == true then
			if Camp ~=1  and OrgID ~= Boss or TargetID() == OwnerID()  then  --�ؼФ��O���a�]���OBOSS
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_16]" , C_SYSTEM ) --<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FROSTY_NA_16]" , 0 )	--<CS>�L�k�惡�ؼШϥκ��F���y�C</CS>	
				return false
			elseif Camp == 1 then --�ؼЬO���a
				if CheckBuff( TargetID() , 508038 ) == true then --�ˬd���a���W�O�_�����HBUFF�A�ﳷ�H���A�����a�ϥΡA�i�H�Ѱ����H���A
					return true	
				end
			elseif OrgID == Boss then --�ؼЬOBOSS
				return true
			end
		else 
		--	Say(OwnerID(), "False!")	
			return false
		end

--	elseif( Select == "USE" ) then
	--	CastSpell( OwnerID() , TargetID() , 496539 )
	--	SysCastSpellLv( OwnerID() ,TargetID() , 496539 , 0 )  
--	end

end

function Lua_Hao_SnowBall_Check2()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Camp = ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer )
	local Boss = 104497

--	if Camp == 1 and TargetID() ~= OwnerID() then
--	Say(OwnerID(), "ok 1")
	if CheckBuff( TargetID() , 508038 ) == true then		
			AddBuff( OwnerID(),  508098 , 0, 7200 ) --����ɶ�2�p�ɡA�������a�T�꦳�����B�����A�I�����y������
	--		SysCastSpellLv( OwnerID() ,TargetID() , 496241 , 0 )  
			CancelBuff( TargetID() , 508038 ) -- �R�����HBUFF
			CancelBuff( TargetID() , 508036 ) -- �R���HŸBUFF
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_12]" , C_SYSTEM )	--�A���U�䥦���_�I�̫�_��ˡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FROSTY_NA_12]" , 0 )		--�A���U�䥦���_�I�̫�_��ˡC
	elseif OrgID == Boss then --�ؼЬ��B����
		AddBuff( OwnerID() ,  508098 , 0 , 7200 ) --����ɶ�2�p�ɡA�������a�T�꦳�����B�����A�I�����y������
	--	SysCastSpellLv( OwnerID() ,TargetID() , 496240 , 0 )
		CastSpell( OwnerID() , TargetID() , 496240 ) 
	end
end

function Lua_Hao_Test_Diamond()

	local X = "0"
	local Y = " "

	Say( OwnerID() ,Y..Y..X..Y..Y)	--2	2
	Say( OwnerID() ,Y..X..X..X..Y)	--1	1
	Say( OwnerID() ,X..X..X..X..X)	--0	0
	Say( OwnerID() ,Y..X..X..X..Y)	--1	1
	Say( OwnerID() ,Y..Y..X..Y..Y)	--2	2

--	local X = 0
--	local Y = 5
--	local Space = " "
--
--	For i = 1 , Y , 1 do
--		X = X + 1
--		for j = 1 , Y , 1 do
--			Y= Y - 1
--			Say ( OwnerID() , Y(Space)..X..Y(Space)  )
--		end
--	end
end

function TTTTTTest(R)
local X = 1
local Y = R - X
	for i =1,R*2-1 do
		Say(OwnerID(),string.rep(" ", Y)..string.rep("0", X)..string.rep(" ", Y))
		if i<R then
			X=X+1
			Y = R - X
		else
			X=X-1
			Y = R - X
		end
	end
end

function Lua_Hao_Test_B()

	local Z = 0
	local X = 0
	while X < 100 do
		X = X + 1
		Z = Z + X
		Say( OwnerID() , "X ="..X )
	end
	Say( OwnerID() , Z )

	local Y = ( 1 + 100 ) * 100 / 2
	Say( OwnerID() , "Y = "..Y )
end

function Lua_Hao_Test_A()

	local A = { 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 }
	for i = 1 , table.getn( A ) , 1 do
		Say( OwnerID() , A[i] )
	end
end

function Lua_Hao_Test_C()

	for i = 1 , 9 , 1 do
		for j = 1 , 9 , 1 do
			Say( OwnerID() , i.."*"..j.."="..(i*j) )
		end
	end
end

function Lua_Hao_test_Diamond_Graphics(R)	-- �T�ӵ٧�

	local X = 1
	local Y = R - X

	for i = 1 , R*2-1 , 1 do
		local A = "r"
		local B = " "
		Say( OwnerID() , String.rep( B , Y )..String.rep( A , X )..String.rep( B , Y )..String.rep( B , Y )..String.rep( A , X )..String.rep( B , Y )..String.rep( B , Y )..String.rep( A , X )..String.rep( B , Y ) )
		if i < R then
			X = X + 2
			Y = (( R*2 - 1 ) - X ) / 2
		else
			X = X - 2
			Y = (( R*2 - 1 ) - X ) / 2
		end 
	end
end

function Lua_Hao_Test_Buff_ID_Tell()

	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 }
	local BuffLv				-- �ޯ൥��
	local Count = BuffCount ( OwnerID() )	-- �d�ߨ��W���ޯ�

	for i = 0 , Count , 1 do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )	-- ����򥻪k�N���X
		for J = 1 , table.getn(Buff) , 1 do
			if BuffID == Buff[j] then
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )	-- ����򥻪k�N����
				Say( OwnerID() , "BuffID = "..BuffID.." / ".."BuffLv = "..BuffLv )
			end
		end
	end
end

function Lua_Hao_Cast_Big_Body()
	Say( OwnerID() , "123" )
	SetModelScale( OwnerID() , 0.5 )
end