-----------------------------420090_�ƻ�������_�������ȼ@��_�L�Y------------------------------------------
Function LuaQ_420090_Complet()
	
--	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	DisableQuest( OwnerID() , true )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
	sleep(15)
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	sleep(5)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() ,GetString("SAY_110060_420090_1") ) --/*�Цw�R�A�{�b�ڭn�}�l�غc�Ť媺�O�q�C
	sleep(20)
	AddBuff( OwnerID() , 504935 , 0 , -1 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	CancelBuff( OwnerID() , 504935 )
	if CheckID( TargetID() ) == true then
		GiveBodyItem( TargetID() , 201075 , 1 )
	end
	sleep( 20 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() ,GetString("SAY_110060_420090_2") ) --/*�o�˴N�i�H�F�C
	sleep(30)
	SetDir( OwnerID(), Dir )
	sleep( 5)
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep( 10 )
	DisableQuest( OwnerID() , false )
--	SetPlot( OwnerID(),"touch","",40)

end
---------------------------420066_��t���]��_�������ȼ@��_����h------------------------------------------
Function LuaQ_420066_Complet()

--	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	sleep(5)
	Say( OwnerID(),GetString("SAY_110051_420066_1") )--/*�еy�ݤ���C
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(10)
	Say( OwnerID(),GetString("SAY_110051_420066_2") )--/*�@�����ǳƦn�F�A���G�ܧִN�|�X��...
	sleep(10)
	CastSpell( OwnerID(),OwnerID(),490099)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( OwnerID(),GetString("SAY_110051_420066_3") )--/*�o�ӵ��G...��...�ݨӤj�Ƥ����C
	sleep(10)
--	SetPlot( OwnerID(),"touch","",40)

end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

--------------------------420068_�O�H�ԷX�����s�n_�����]�k�}------------------------------------------------
------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
--Function LuaQ_420068_ClickObj() --�I����Ĳ�o���@��--�i�Τp���w�g�g�n���禡�N��
--------------------------------------------------------------------------------------------------------------
Function LuaQ_420068_AfterClickObj() --�I����Ĳ�o���@��--�����ʧ@�A���i�Τw�����N��
	
	local Count = CountBodyItem( OwnerID(), 200186);

	if( Count >= 1 ) then

		local Result = DelBodyItem( OwnerID(), 200186, 1 );
		if( Result ) then

			BeginPlot( TargetID(),"LuaFunction_420068_Clear",0) 
			--�]���n�Ǧ^�Ȥ~��B�z�A�ҥH�ΩI�s���覡�Ӫ�t�ʧ@
  			return 1;
		end
	end

	return -1;
END
---------------------------------------------------------------------------------------------------------------
Function LuaFunction_420068_Clear()

	CancelBuff( OwnerID(), 500900 );--�M���즳���S��BUFF--�`�N�A�ѩ�O�Q�I�s�L�Ӱ���A�]�����۰}�ܬ�Owner

	CastSpell( OwnerID(), OwnerID(), 490102 );-- �R�O���۰}�I�i�@�Ӫk�N���ͷs�S��
	sleep(300)--��30��A���ݨt�Φ^�_��i�A���Q�I�������A

	CancelBuff( OwnerID(), 500902 );--�M���s�S��BUFF
	CastSpell( OwnerID(),OwnerID(),490101) --���s�W�즳���S���]�k
END
---------------------------------------------------------------------------------------------------------------
---------------------------------------------�w�f�H���I�]-----------------------------------------------------
function LuaI_200167()
	local LuckyNum = Rand(5)
	DelBodyItem( OwnerID() , 200167 , 1 )

	if LuckyNum == 1 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200164) == 0 then
			GiveBodyItem( OwnerID() , 200164 , 1 )
		else
			GiveBodyItem( OwnerID() , 200622 , 1 )
		end
	elseif LuckyNum == 2 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200165) == 0 then
			GiveBodyItem( OwnerID() , 200165 , 1 )
		else
			GiveBodyItem( OwnerID() , 200620 , 1 )
		end
	elseif LuckyNum == 3 then
		if CheckAcceptQuest( OwnerID() , 420065 ) and CountItem( OwnerID(),200166) == 0 then
			GiveBodyItem( OwnerID() , 200166 , 1 )
		else
			GiveBodyItem( OwnerID() , 200619 , 1 )
		end
	elseif LuckyNum == 4 then
			GiveBodyItem( OwnerID() , 200618 , 1 )
	else
			GiveBodyItem( OwnerID() , 200620 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------
--��� �������Ʋz����
Function LuaQ_420093_Complete()

	MoveToFlagEnabled( OwnerID(), false );
--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_nothing", 40);	--NPC��w
	sleep(10);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_APPLAUSE );		--���ʧ@
	sleep(20);
	WaitMoveTo( OwnerID(),  63 , 22 , -6258 );	--���ʨ���w�y��
	sleep(20);
	Say( OwnerID(), "�u�n�[�W�o�Ǧ״N�����F...");		--���d��o��
	sleep(30);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_INSTANT);	--���I�k�ʧ@
	sleep(50);
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY );	--���ӧQ�ʧ@
--	setplot( OwnerID(), "touch" , "", 40);	--NPC�Ѱ���w
	sleep(600);
	MoveToFlagEnabled(  OwnerID(), true);
	
End
------------------------------------------------------------------------------------------------------------
------------------------------�}��------------------------------------------------------
function LuaQ_420088_Accept()
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand, 0, 1 );
	sleep( 100 )
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand, 210054, 1 );
end
