function Lua_na_Germany2_en1_reday1()
	if CheckBuff ( ownerID(), 507851) == true then --SUKI����1
		ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_02]",  0 )--���ʥ��b�i�椤
		ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_GERMANY2_02]",  0 )
		return FALSE

	else
		ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_01]",  C_SYSTEM )
		return TRUE
	end
end


function lua_na_Germany2_en1_reday2()
	SetFlag(OwnerID(), 544937, 0) --SUKI����1�X��(�̧ǳq�L�U�⧯�����)
end