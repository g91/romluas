function LuaI_530064()
	GiveBodyItem ( TargetID() , 530064, 1 )	-- �Y�ΡG�u�P�H�x�g�P�v
	ScriptMessage( TargetID(), TargetID(), 2, GetString("ST_530063") , C_SYSTEM )	--�e�������T���G���o�Y�ΡG�u�P�H�x�g�P�v
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_530063") , 0 )		--�t�ΰT���G���o�Y�ΡG�u�P�H�x�g�P�v
end 

