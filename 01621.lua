--test
function Lua_mika_losttreasure_test4()  --��O�ۤ�
	PlayMotion(OwnerID(), ruFUSION_MIME_CROUCH_BEGIN) 
end

function Lua_mika_losttreasure_test5() --��O�� 
	PlayMotion(OwnerID(), ruFUSION_MIME_CROUCH_END )
end

function Lua_mika_losttreasure_test6()  --
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE) 
end

function Lua_mika_losttreasure_test7()  --�}���ʧ@
	PlayMotion(OwnerID(), 145) 
end

function Lua_mika_losttreasure_test8()  --�����ʧ@
	PlayMotion(OwnerID(), 147) 
end

function Lua_mika_losttreasure_test9()  --�����R�A
	PlayMotion(OwnerID(), 148) 
end

function Lua_mika_losttreasure_magictest1()
	AddBuff(OwnerID() , 505278 , 1, 900)  --15����
	AddBuff(OwnerID() , 505279 , 1, 900)  --15����  
	AddBuff(OwnerID() , 505280 , 1, 900)  --15���� 
	AddBuff(OwnerID() , 505281 , 1, 900)  --15����
	AddBuff(OwnerID() , 505282 , 1, 900)  --15����
	AddBuff(OwnerID() , 505283 , 1, 900)  --15����  
	AddBuff(OwnerID() , 505284 , 1, 900)  --15���� 
	AddBuff(OwnerID() , 505285 , 1, 900)  --15����
end

function Lua_mika_losttreasure_magictest2()
	AddBuff(OwnerID() , 505296 , 1, 900)  --15����
end

function Lua_mika_losttreasure_magictest3()
	AddBuff(OwnerID() , 505297 , 1, 900)  --15����
end

function Lua_mika_losttreasure_magictest4()
	AddBuff(OwnerID() , 505445 , 1, 900)  --15����
end

function Lua_mika_losttreasure_delkey()
	SetFlag(OwnerID(),543491 , 0)
	SetFlag(OwnerID(),543492 , 0)
	SetFlag(OwnerID(),543493 , 0)
	SetFlag(OwnerID(),543494 , 0)
	SetFlag(OwnerID(),543495 , 0)
	SetFlag(OwnerID(),543496 , 0)
	SetFlag(OwnerID(),543497 , 0)
	SetFlag(OwnerID(),543487 , 0) -- candle 1
	SetFlag(OwnerID(),543488 , 0) -- candle 2
	SetFlag(OwnerID(),543489 , 0) -- candle 3
	SetFlag(OwnerID(),543572 , 0) -- �i�ݨ��ǰe�N�ﶵ
	SetFlag(OwnerID(),543490 , 0) -- ���Ѥw�ϥιL�ǰe
	SetFlag(OwnerID(),543406 , 0) -- ���Ѥw�ѥ[�L�j�N���_
	SetFlag(OwnerID(),543573 , 0 ) -- �R �j�N���_�i�椤
	Say(OwnerID(), "Del all keyitem.")
end


function Lua_mika_ResetColdown_trasure(ObjID,MagicID)  -- �M���S�w�k�NCD�ɶ�

	local Class = GameObjInfo_Int( MagicID ,"ColdownClass")  -- ��o�Ӫk�N���I�k�N�o��� - ����
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")  -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o����
	local CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�

	if CD > 0 then
		if Class == 3 then
			if Type == 26 or Type == 27 or Type == 28 or Type == 29 then  --26~29
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ,  0 ) 
--				Say( ObjID , ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ) )
				CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�
--				Say( ObjID , "Class = "..Class )
--				Say( ObjID , "Type = "..Type )
--				Say( ObjID , "CD = "..CD )
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function lua_mika_ResetColdown_trasure01() -- �M���k�N��CD�ɶ�
	lua_mika_ResetColdown_trasure( OwnerID() , 494772) --CD�k�s
	lua_mika_ResetColdown_trasure( OwnerID() , 494773) --CD�k�s
 	lua_mika_ResetColdown_trasure( OwnerID() , 494774) --CD�k�s
	lua_mika_ResetColdown_trasure( OwnerID() , 494777) --CD�k�s
end

