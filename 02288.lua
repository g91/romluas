--Z13�@������ �D��@��

function lua_mika_zone13maptest()
	for i = 1 , 31 do
		local z13mapid = {301,310,311,312,313,320,321,322,323,330,331,332,333,334,335,340,350,351,352,353,354,355,356,357,360,361,362,363,364,365,366}
		if DW_CheckMap(OwnerID(), z13mapid[i]  ) then   --�ˬd�ϰ�map id
			say(OwnerID(), z13mapid[i])
			say(OwnerID(), "ok")
		else
			say(OwnerID(), z13mapid[i] )
			say(OwnerID(), "no ok")
		end
	end
end


function LuaI_209215_check()
	if DW_CheckMap(OwnerID(), 322 ) then   --�ˬd�ϰ�map id
		return true
	elseif  DW_CheckMap(OwnerID(), 301 ) then
		return true
	elseif  DW_CheckMap(OwnerID(), 320 ) then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_209215_2]" , 0 )	--�e�������T��  �u���b[SC_ZONE13_03]�~�ব���^�������C
		return false
	end
end

function LuaI_209215_use()
	local RAN = rand(100)
	if RAN >= 81 then    -- 20
		--�z�A�u�Q�N�o�̬��R�������P�j�a���ɡ�I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY1]" , C_SYSTEM )	--��H-�ۤv , ���- �e�������T��  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY1]" , C_SYSTEM )	--��H-�P��Ҧ��H , ���- ��ܮ�
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --�w�p20��
	elseif RAN <= 80 and RAN >= 46 then   --35
		--���o��A�ڬO[$PLAYERNAME]��I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY2]" , C_SYSTEM )	--��H-�ۤv , ���- �e�������T��  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY2]" , C_SYSTEM )	--��H-�P��Ҧ��H , ���- ��ܮ�
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --�w�p20��
	elseif RAN <= 45 then   --45
		--����СССI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY3]" , C_SYSTEM )	--��H-�ۤv , ���- �e�������T��  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY3]" , C_SYSTEM )	--��H-�P��Ҧ��H , ���- ��ܮ�
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --�w�p20��
	end
end