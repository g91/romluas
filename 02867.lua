--�x�T�y����ܥ�
--World 2 �ϰ�x�T�y����ܿﶵ
--�R�W�Glua_�@�ɴX�H_MTSnoopSZ()	MT=�D�� SNOOP=���� SZ=��ܼ@��
function lua_World3_MTSnoopSZ()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local item = 0						--�ΨӰO���C�X�����ضq
	local Flag = lua_Transport_FlagSet( ZoneID )		--�^�ǰϰ�����X�� �C
	local tmpPoint = lua_Transport_LocalSet( ZoneID )	--�i�ǰe���Ȧs��m�I�A�禡�^�Ǥ@�Ӱ}�C�A�����Ӱϰ�i�ǰe���a�I�C
	local Str = ""
	local Detail = ""
		Detail = lua_Snoopy_SpeakDetail()
		SetSpeakDetail( Player , Detail )			--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
			--�}�Ҧ��a�ǰe��
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );	--�A���\�}�ҤF���a���Ȫ̤����C
			end
			--�C�X�ǰe�ﶵ(501638=�M�{�T��)
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#tmpPoint do
					local loc = tmpPoint[i]	--loc =�i�ǰe���ϰ�
					local tmpFlag = lua_Transport_FlagSet( loc )
						if CheckFlag( Player , tmpFlag ) == true then
						--	item = item +1
						--	if item <= 5 then
							local PointName = lua_Transport_LocalName( loc )
							Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --�ǰe��[$VAR1]
							AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 
						--	else
						--		AddSpeakOption( Player, TargetID(),  "[SC_205764_2]" ,"lua_MTSnoopSZ_NEXT", 0 ); --�U�@��
						--		return
						--	end
						end
				end

			end
end