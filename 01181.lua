function LuaS_421725_CHECK()
	if CountBodyItem( OwnerID() , 203634 ) >= 1 then
		local OBJ = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		if OBJ == 112143 or OBJ == 112144 or OBJ == 112147 then
			--Say( OwnerID() , GetName( TargetID() ) )
			return true
		--elseif OBJ == 112148 then
			--Say( OwnerID() , "This is Broken!!" )
			--return false
		else
			return false
		end
	else
		return false
	end

end

function LuaS_421725_DO()
	if CountBodyItem( OwnerID() , 203634 ) >= 1 then
		DelBodyItem( OwnerID() , 203634 , 1 )
		return true
	else
		return false
	end
end

function LuaS_421725_COMPLETE()
	DelBodyItem( TargetID() , 203634 , CountBodyItem( TargetID() , 203634 ) )	-- �R���h�l������
	return true
end

function LuaS_421728_COMPLETE()
	BeginPlot( OwnerID() , "LuaS_421728_COMPLETE_DO" , 0 )
	return true
end

function LuaS_421728_COMPLETE_DO()
	local GoodMachine  =  CreateObjByObj( 112147, OwnerID() , 1  )	--���ͦn���˸m
	Hide( OwnerID() )
	Sleep( 100 )
	if  GoodMachine ~= nil and CheckID( GoodMachine ) == true then	DelObj( GoodMachine )	end

	Show( OwnerID() , 0 )
	local Player = SearchRangePlayer ( OwnerID() , 300 )	-- �j�M���񪺪��a
	for i = 0 , table.getn( Player ) do
		if Player[i] ~= -1 then
			ScriptMessage( OwnerID(), Player[i] , 2 , "[SC_421728_1]"  , C_SYSTEM )	-- �o���˸m�P���@���b�����j�ؤ��U�A���G�S�G�٤F�I
		end
	end
end

function LuaS_112148()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421725 ) == true then
		SetFlag( OwnerID() , 542304 , 1 )	-- ���U�K�[�������
	end
end

function LuaS_421731()	-- �򥢪�����
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421731 , 1 ) )
	ShowBorder( OwnerID() , 421731 , GetObjNameByGUID( 421731 ) , "ScriptBorder_Texture_Paper" )
end

function LuaS_421739()	-- �h�����D�H
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421739 , 1 ) )
	ShowBorder( OwnerID() , 421739 , GetObjNameByGUID( 421739 ) , "ScriptBorder_Texture_Paper" )
end

function LuaS_112194()	-- �s�����ܸ�
	LoadQuestOption( OwnerID() )	-- ���J���ȼҪO

	if CheckAcceptQuest( OwnerID() , 421733 ) == true and CheckFlag( OwnerID() , 542305 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_112194_01]" , "LuaS_112194_Fight" , 0 )	-- �֧�[112138]�������٨ӡI�I
	end
end

function LuaS_112194_Fight()
	CloseSpeak( OwnerID() )  --������ܵ���
	BeginPlot( TargetID() , "LuaS_112194_FightStart" , 0 )
end

function LuaS_112194_FightStart()

	DisableQuest( OwnerID() , true )
	--MoveToFlagEnabled( OwnerID() , false )

	local PlayerDBID = ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 
	Say( OwnerID() , "[SC_112194_02]" )		-- �����I�A���٧ڴN�١A���ں⤰��I�H
	Sleep( 15 )
	Say( OwnerID() , "[SC_112194_03]" )		-- �����ƴN�̦ۤv����O�Ӯ��^�h�I�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_PROVOKE )
	Sleep( 25 )
	local Space = CreateObjByObj( 101274 , OwnerID() , 1 )
	Hide( OwnerID() )

	BeginPlot( Space ,"LuaS_112194_LiveTime" , 0 )		-- �]�w�ͦs�ɶ�
	SetPlot( Space , "Dead" , "LuaS_112194_Dead" , 0 )	-- �]�w���`�@��

	SetAttack( Space , TargetID() )

	Sleep( 5 )
	while true do
		if CheckID( Space ) ~= true or ReadRoleValue( Space , EM_RoleValue_IsNPC ) ~= 1 then
			Sleep( 5 )
			Show( OwnerID() , 0 )
			--SetPos( OwnerID() , X , Y , Z , Dir )
			--Sleep( 5 )
			if  Luafunc_Player_Alive( TargetID() , PlayerDBID , 250 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 and CheckFlag( TargetID() , 542305 ) == true then 

			end
			--MoveToFlagEnabled( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		Sleep( 10 )
	end

end

-----------------------------------------------------------------------------------------------
function LuaS_112194_LiveTime()
	LuaFunc_Obj_Suicide( 300 )
end
-----------------------------------------------------------------------------------------------	
function LuaS_112194_Dead()
	if  ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 and CheckAcceptQuest( TargetID() , 421733 ) == true then 
		SetFlag( TargetID() , 542305 , 1 )
	end
	SetStopAttack( OwnerID() )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	BeginPlot( OwnerID() , "LuaS_112194_Dead_Show" , 0 )
	return false
end

function LuaS_112194_Dead_Show()
	Say( OwnerID() , "[SC_112194_04]" )		-- ���I�ڪ��D�F�I�ڻ��I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	Sleep( 45 )
	DelObj( OwnerID() )
end

function LuaS_421742_CHECK()	-- �t�����n�D���@
	local Object = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if Object == 112220 then	-- �V������
		if CountBodyItem( OwnerID() , 203696 ) < 1 then
			if CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == true then
				return false
			end
			return true
		else
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_421742_01]"  , C_DEFAULT )		-- �A���ӥ��N���W�o�@��[203696]�˨�[ZONE_CALAMUS POINT]��[112221]�̡I
			return false
		end

	elseif Object == 112221 then	-- �x�����
		if CountBodyItem( OwnerID() , 203696 ) >= 1 then
			if CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == true then
				return false
			end
			return true
		else
			return false
		end
	end
end

function LuaS_421742_DO()
	if DelBodyItem( OwnerID() , 203696 , 1 ) then
		if CheckFlag( OwnerID() , 542347 ) == false and CheckFlag( OwnerID() , 542348 ) == false and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542347 , 1)	-- �������D�t���D�^ 1 ��M��
		elseif CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == false and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542348 , 1)	-- �������D�t���D�^ 2 ��M��
		elseif CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542349 , 1)	-- �������D�t���D�^ 3 ��M��
		end
	end
	return true
end

function LuaS_112242()	-- ���˪��@��
		SetPlot( OwnerID() , "Touch" , "LuaS_112242_01" , 30 )
end

function LuaS_112242_01()
	BeginPlot( TargetID() , "LuaS_112242_02" , 0 )
end

function LuaS_112242_02()
	local Nawusika =  CreateObjByObj( 112208 , OwnerID() , 1  )	--���ͷR���D�R�Q�ƥd
	Hide( OwnerID() )
	Sleep( 300 )
	if  Nawusika ~= nil and CheckID( Nawusika ) == true then	DelObj( Nawusika )	end
	Show( OwnerID() , 0 )
end




-------�p����---------

function LuaS_421843_0()
	if	CountBodyItem( OwnerID() , 203812 )>0	then
		return true
	else
		return false
	end
end
