--�w�R�`����
function lua_mika_dancefes_trans()
	while true do 
		CastSpell( OwnerID() , OwnerID() , 495125 ) --�ܨ�����ӼҼ�
		sleep(60)
		CastSpell( OwnerID() , OwnerID() , 491934 ) --�ܨ���Ĩۣ
		local P = 100
		local X = Rand( P )    
		if X >= 0 and X <= 30  then  
	--		Say(OwnerID(), X)
			sleep(150)
		elseif X >= 31 and X <=60  then  
	--		Say(OwnerID(), X)
			sleep(180)
		elseif X >= 61 and X <=80  then  
	--		Say(OwnerID(), X)
			sleep(200)
		elseif X >= 81 and X <=100  then  
	--		Say(OwnerID(), X)
			sleep(220)
		end
	end
end


--------------------------------------------------------------------
function lua_mika_dancefes_PID1() --�g�J���pid�Ȭ�1
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 1)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID2() --�g�J���pid�Ȭ�2
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 2)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID3() --�g�J���pid�Ȭ�3
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 3)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID4() --�g�J���pid�Ȭ�4
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 4)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID5() --�g�J���pid�Ȭ�5
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 5)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID6() --�g�J���pid�Ȭ�6
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 6)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID7() --�g�J���pid�Ȭ�7
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 7)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_PID8() --�g�J���pid�Ȭ�8
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 8)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--�üƽd�򤺲���  (�d��, �Cx���� , �C�����ʶZ��)
end

function lua_mika_dancefes_pidshow() --show���pid
	local PID = ReadRoleValue(TargetID() , EM_RoleValue_PID) 
	Say(OwnerID(), PID)
end

--�i�RĨۣ�ܨ��Ĥ� 502184
--Ĩۣ�H�ܨ��Ĥ�  502132