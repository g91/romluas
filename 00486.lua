function LuaQ_420367_Complet()

	Say( OwnerID() , GetString("ST_420322_3") )	-- �еy�ݤ@�U�C
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420368_1") )	-- �ڲ{�b�N�o�Ǫ��~�V�X�X���եΪ��Ʊڬr���C
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- �Ѭr���S��
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( OwnerID() , GetString("ST_420367_1") )	-- �ݰ_���C����G���Ӳz�Q�ڡK
	sleep(10)

end

function LuaQ_420368_Complet()

	Say( OwnerID() , GetString("ST_420322_3") )	-- �еy�ݤ@�U�C
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420368_1") )	-- �ڲ{�b�N�o�Ǫ��~�V�X�X���եΪ��Ʊڬr���C
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- �Ѭr���S��
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420322_2") )	-- �n�F�A�o�˴N��F�I
	sleep(10)

end

function LuaS_200952_KillAnt()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if ( Dis < 100 ) then
		local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		--Say(OwnerID(), "Target = "..OrgID )
		if ( OrgID == 100434 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_6") , 0 )	-- �A�ϥ� |cffffffff[�Ʊڬr��]|r
			BeginPlot( OwnerID() , "LuaS_KillAntPotion" , 0 )
			CastSpell( OwnerID() , TargetID() , 491191 )	-- �Ʊڬr���S��
			if ( CheckFlag( OwnerID() , 540827 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay1" , 0 )
			elseif ( CheckFlag( OwnerID() , 540828 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay2" , 0 )
			elseif ( CheckFlag( OwnerID() , 540829 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay3" , 0 )
			end
		elseif ( OrgID == 1001 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SYS_TOUCH_NOTARGET") , 0 )	-- �S���ؼ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_2") , 0 )	-- �ؼШëD�d���ԧJ���ơA�����ӧ�r���Φb��誺���W�I
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_1") , 0 )	-- �P�ؼжZ���ӻ��A�Aı�o��r����L�h�ä���ǽT������設�W�I
	end

end

function LuaS_KillAntPotion()
	DelBodyItem ( OwnerID() , 200952, 1 )		-- �Ʊڬr��
end

function LuaS_KillAntPlay1()
	SetFlag( TargetID() , 540827 , 1 )	-- �α��ƾ��L�ĪG
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_4") , 0 )	-- �r����d���ԧJ���Ʀ��G�S�����󪺼v�T�K
end
function LuaS_KillAntPlay2()
	SetFlag( TargetID() , 540828 , 1 )	-- �α��ƾ��ƻs����
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_5") , 0 )	-- �r����d���ԧJ���Ƶo�ͤF�ĥΡA�d���ԧJ�����ܦ��F�Ⱖ�I
	local KingAnt = LuaFunc_CreateObjByObj ( 100434 , OwnerID() )
	BeginPlot( KingAnt  , "LuaS_KillAntPlay2b" , 0 )
end
function LuaS_KillAntPlay2b()
	MonsterLivingTime( 6000 )
end
function LuaS_KillAntPlay3()
	SetFlag( TargetID() , 540829 , 1 )	-- �α��ƾ���������
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_3") , 0 )	-- �r����d���ԧJ���Ƶo�ͤF�ĥΡA�d���ԧJ���Ʀ��`�F�I
	SetStopAttack( OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	Sleep( 30 )
	DelFromPartition( OwnerID() )
	Sleep( 6000 )
	AddToPartition( OwnerID() , 0 )
end