--�t�Ӧ@�ά���_�_�c

-- �Ǫ����`��]�� �_�c�X�{�@��

--�_�c1
function Lua_mika_monstersum_lv10trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114989 , 10 , 50 )	-- ����ID�B��μƶq�B�b�|��
end

--�_�c2
function Lua_mika_monstersum_lv20trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114990 , 10 , 50 )	-- ����ID�B��μƶq�B�b�|��
end

--�_�c3
function Lua_mika_monstersum_lv30trea()
	local Treasure = {}
	Treasure  = Lua_Davis_BornByMultilateral( 114991 , 10 , 50 )	-- ����ID�B��μƶq�B�b�|��
end



--�_�c�}�Ҽ@��

--����10�_�c
Function  Lua_mika_monstersum_treas10_1() --���b���󲣥XSCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas10_2" , 30 );
end

function Lua_mika_monstersum_treas10_2()
--	Say(OwnerID(), "OwnerID 1") --���a			
--	Say(TargetID(), "TargetID 1") --�_�c

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--���L���A�еy�ԦA�աC
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					--	Say(TargetID(), " treasure 1")
						GiveBodyItem( OwnerID() , 725152 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas10_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas10_2",50 )
			end
		end

end


--����20�_�c
Function  Lua_mika_monstersum_treas20_1() --���b���󲣥XSCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas20_2" , 30 );
end

function Lua_mika_monstersum_treas20_2()
--	Say(OwnerID(), "OwnerID 1") --���a			
--	Say(TargetID(), "TargetID 1") --�_�c

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--���L���A�еy�ԦA�աC
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					--	Say(TargetID(), " treasure 2")
						GiveBodyItem( OwnerID() , 725153 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas20_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas20_2",50 )
			end
		end
end

--�_�c 3
Function  Lua_mika_monstersum_treas30_1() --���b���󲣥XSCRIPT
	SetPlot( OwnerID() , "touch" , "Lua_mika_monstersum_treas30_2" , 30 );
end

function Lua_mika_monstersum_treas30_2()
--	Say(OwnerID(), "OwnerID 1") --���a			
--	Say(TargetID(), "TargetID 1") --�_�c

		if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--���L���A�еy�ԦA�աC
			return										--
		end											--
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )												--					--
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
					--	Say(TargetID(), " treasure 3")
						GiveBodyItem( OwnerID() , 725154 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						DelObj(TargetID())  
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
						SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
					end	
				end
			elseif ( result == "DAME" ) then
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C 
				SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
			end
		end
end