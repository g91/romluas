---�ߨ��ѨϪG��
function LuaI_421692()	

	BeginPlot( OwnerID() , "LuaI_421692_1" , 0 )
	return true
end

function LuaI_421692_1()
	
	AddBuff(OwnerID() , 501011 , 100 , 15 )  --���r�ĪG
end

---�ѨϪG���ܨ�
function LuaI_421692_2()	
	
	Say( OwnerID() , "[SC_421692]" )
	Sleep( 20 )
	CastSpell( OwnerID(),OwnerID(),492466)
	BeginPlot(OwnerID() , "LuaI_421692_3" , 0 )
	BeginPlot(OwnerID() , "LuaI_421692_4" , 0 )

end

function LuaI_421692_7()	
	
	Say( OwnerID() , "[SC_421692_3]" )
end

function LuaI_421692_3()


	local Frog = CreateObjByFlag( 112322 , 780277 , 1 , 1 )
	writerolevalue( Frog , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Frog , 0 )

	MoveToFlagEnabled( Frog , false )
	Say( Frog , "[SC_421692_1]" )
	LuaFunc_MoveToFlag( Frog , 780277 , 2 ,  10)
	LuaFunc_MoveToFlag( Frog , 780277 , 3 , 15 )
	LuaFunc_MoveToFlag( Frog , 780277 , 4 , 5 )
	BeginPlot(Frog , "LuaI_421692_5" , 0 )
	
end

function LuaI_421692_4()

	local BFrog = CreateObjByFlag( 112323 , 780279 , 1 , 1 )
	writerolevalue( BFrog , EM_RoleValue_IsWalk , 0 )
	AddToPartition( BFrog , 0 )	
	
	MoveToFlagEnabled( BFrog , false )
	Say( BFrog , "[SC_421692_2]" )
	LuaFunc_MoveToFlag( BFrog , 780279 , 2 ,  10)
	LuaFunc_MoveToFlag( BFrog , 780279 , 3 , 15 )
	LuaFunc_MoveToFlag( BFrog , 780279 , 4 , 5 )
	BeginPlot(BFrog , "LuaI_421692_6" , 0 )
end

function LuaI_421692_5()
	
	Sleep(30)
	Delobj( OwnerID() )
end

function LuaI_421692_6()
	
	Sleep(30)
	Delobj( OwnerID() )
end


----���T����

function LuaS_203622()

	local wolf = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if wolf == 100331 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203622]" , 0 )	--  �����泌�T�~��ϥΡI
		return false
	end
end


function LuaS_203622_1()
	local Small_wolf = LuaFunc_CreateObjByObj ( 112132 , TargetID() )
	AddToPartition( Small_wolf ,    0 )
	BeginPlot(Small_wolf , "LuaS_203622_2" , 0 )
	BeginPlot( TargetID() , "LuaS_203622_3" , 0 )
end


function LuaS_203622_2()
	local wolf_shit = LuaFunc_CreateObjByObj ( 112130 , OwnerID() )
	AddToPartition( wolf_shit ,    0 )
	BeginPlot(wolf_shit  , "LuaS_203622_4" , 0 )
	sleep(50)
	DelObj(OwnerID())	
end

function LuaS_203622_3()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_203622_4()
	sleep(400)
	DelObj(OwnerID())
end

-------�ߨ������T�T�K��R������

function LuaS_203622_5()

	DelObj(TargetID() )
	return true
end

----��w����

function LuaS_203624()

	AddBuff(OwnerID() , 502479 , 0 , 120 )  
end

function LuaS_203624_1()

	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID) ~= 101541 then
	
		return false
	end

	if ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
	
		return false
	end

	return true
end

function LuaS_203624_2()
	
	AddBuff(TargetID() , 502742 , 0 , 30 )  
end

------�B�f������

function LuaS_201695()

	AddBuff(OwnerID() , 502746 , 0 , -1 )  
	return true
end

function LuaS_201695_1()

	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)

	if X < 19459 or X > 22275 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_201695]" , C_SYSTEM ) -- �B�f���u��b�v��l�W�����ʡA�A�w�g�W�X�ϰ�I
		CancelBuff( OwnerID() , 502746 )
	end

	if Z < 7838 or Z>11810 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_201695]" , C_SYSTEM ) -- �B�f���u��b�v��l�W�����ʡA�A�w�g�W�X�ϰ�I
		CancelBuff( OwnerID() , 502746 )
	end
end




