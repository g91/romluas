function LuaWS_Frog01_0()

	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP  )
	
	while 1 do
		Say(OwnerID(),"[SC_Frog01_0]")	--�U����͡B�U��p�j�A�w��Ө��ԤҰ����ΡA�o�̦��̰��j���]�k�v�A�M�̷N�Q���쪺�岧�]�N�I
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_1]")	--�S���@�Ӧa��A��ݨ���ԤҰ����Χ�Ϊ�������t�I
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_2]")	--�o�̦��U�جõ}���ͪ��A�A���Υh��a�A�N��ݨ����}�b�]�����B���r����H�B�n�x���i�h�A��M�A�٦��|���ܪ��C��C
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_3]")	--
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_4]")	--
		Sleep(100)

	Sleep(3000)
	end
end

function LuaWS_Magic_0()
	while 1 do
		local R=RandRange(1,2)		
				Beginplot (OwnerID(),"LuaWS_Magic_R",0)
	Sleep(600)
	end
end

function LuaWS_Magic_1()

	local Ball=Lua_DW_CreateObj("flag" ,116486,780740,1)
	local Rab=Lua_DW_CreateObj("flag" ,116487,780740,2)
	Hide(Rab)
	local Roo=Lua_DW_CreateObj("flag" ,116488,780740,3)
	Hide(Roo)
	local Lion=Lua_DW_CreateObj("flag",116491,780740,4)
	Hide(Lion)
	local Box=Lua_DW_CreateObj("flag",116492,780740,1)
	local g1=Lua_DW_CreateObj("flag",116489,780740,5)
	local g2=Lua_DW_CreateObj("flag",116490,780740,6)
	
end

----------

function LuaWS_Magicer_0()
	SetModeEx(OWNERID() ,EM_SetModeType_ShowRoleHead ,true) -----------�q�X�Y����
	SetModeEx(OWNERID() ,EM_SetModeType_HideName ,false) 
	SetModeEx( OWNERID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	while true do
		sleep(30)
		SysCastSpellLv(OwnerID(), OwnerID(), 495220,1)
	end
end

function LuaWS_Magicer_1()
	
	while true do
		sleep(30)
		CastSpellPos(OwnerID(),-7175,450,47680,496589 ,3)

		--CastSpell( OwnerID(), Ball, 496589 )  
		--SysCastSpellLv(OwnerID(), OwnerID(), 496589,1)
	end
end




----------
function LuaWS_monster1()
		LuaFunc_MoveAllFlag( OwnerID(), 780745 )  
		Sleep(10)
		ReSetNPCInfo( OwnerID() )  
end


	