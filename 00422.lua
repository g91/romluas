function RuneMark_Cloister()

--	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN );
--	CastSpell( OwnerID() , TargetID() , 490112 );	-- �Ѭr���S��
--	Sleep(20)
	--ruFUSION_ACTORSTATE_CAST_LOOP
--	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_END );
--	Sleep(20)
--	SetFlag( TargetID()  , 540781 , 1 );			-- ���}�ƥ��_��_�o��׹D�|

	Say ( OwnerID(),  GetString("ST_110184_4") )	--�Ĥl�A�@�����֧A�@�����Q�I

end

function LuaI_CloisterKey()
	SetPlot( OwnerID() , "Range" , "Enter_Cloister" , 65);
end

function Enter_Cloister()
--for��l���աA����������
	--if CheckFlag( OwnerID()  , 540781 ) == true then
		-- Say ( TargetID(),  "�A�N�i�J�ƥ��I" );
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_CLOISTER_1") , 0 )	--�A��L�]�k�پ��A�i�J�F�׹D�|�I

			if PlayerLV <= 25 then
			AddBuff( OwnerID() ,502039,1 ,1200);							--�[�J�p��
			end
		sleep(10)
		if ChangeZone( OwnerID() , 102, -1, 1334, 330, 2911, 163) then

			DesignLog(OwnerID(),102,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	--else
		-- Say ( TargetID(),  "�A�Q�@�h�]�k�پ��צ�A�L�k�A�e�i�I" );
		--ScriptMessage( OwnerID(), OwnerID(), 0, "�A�Q�@�h�]�k�پ��צ�A�L�k�A�e�i�I" , 0 );
	--end

end

function LuaI_TransPort_Zone2A()
	SetPlot( OwnerID() , "Collision" , "LuaFunc_TransPort_Zone2A" , 0);	
end
function LuaFunc_TransPort_Zone2A()
	ChangeZone( OwnerID() , 2 , 0 , -1722 , -475, 2111 , 256 );
--	ChangeZone( OwnerID() , 2 , 0,-1722, -479, 2100,261);
--	ChangeZone( OwnerID() , 2 ,-1, -1723, -475, 2116, 253);
end
