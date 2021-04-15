----------------------------------------------------------------------------
--�f�����~�ഫ���ƭȪ��q�Ψ禡
--��J�G�f�������~����
-- Type = 1�A�շ�����
-- Type = 2�A�j�N��
-- Type = 3�A�ڹҥ����L�O
-- Type = 4�A�����Ŷꨩ
-- Type = 5�A���q��q
-- Type = 6�A�ǩ_����
-- Type = 7�A�a�A�I��
-- Type = 8�A������L
----------------------------------------------------------------------------
function TokenItemsToValue( Type )
	CallPlot( OwnerID() , "TokenItemsToValue_2" , Type )
end
function TokenItemsToValue_2( Type )
	local OwnID = OwnerID()
	local ItemsTypeTable = { --�f�����~�M��
	206686 , -- Type = 1�A�շ�����
	206879 , -- Type = 2�A�j�N��
	208681 , -- Type = 3�A�ڹҥ����L�O
	240181 , -- Type = 4�A�����Ŷꨩ
	201545 , -- Type = 5�A���q��q
	241706 , -- Type = 6�A�ǩ_����
	203944 , -- Type = 7�A�a�A�I��
	200222 } -- Type = 8�A������L
	
	local TokenValueTable = { --�f�����ƭȽs��
	8 , 	-- TokenValue = 8		--�շ�����
	9 , 	-- TokenValue = 9		--�j�N��
	10 , 	-- TokenValue = 10	--�ڹҥ����L�O
	11 , 	-- TokenValue = 11	--�����Ŷꨩ
	12 , 	-- TokenValue = 12	--���q��q
	13 ,	-- TokenValue = 13	--�ǻ�����
	4 ,	-- TokenValue = 4	--�a�A�I��
	15 }	-- TokenValue = 15	--������L
	
	local TokenValueNameTable = { --�f���ƭȲM��
	EM_RoleValue_TrialBadgeCoin , -- Type = 1�A�շ�����
	EM_RoleValue_RelicsCoin , -- Type = 2�A�j�N��
	EM_RoleValue_DreamlandCoin , -- Type = 3�A�ڹҥ����L�O
	EM_RoleValue_PhiriusShellCoin , -- Type = 4�A�����Ŷꨩ
	EM_RoleValue_EnergyJusticeCoin , -- Type = 5�A���q��q
	EM_RoleValue_ProofLegendCoin , -- Type = 6�A�ǩ_����
	EM_RoleValue_Honor , -- Type = 7�A�a�A�I��
	EM_RoleValue_MirrorCoin } -- Type = 8�A������L
	
	local TokenLimitTable = { --�f���ƭȤW���M��A-1 = �L�W��
	-1 , -- Type = 1�A�շ�����
	10000 , -- Type = 2�A�j�N��
	-1 , -- Type = 3�A�ڹҥ����L�O
	1000 , -- Type = 4�A�����Ŷꨩ
	-1 , -- Type = 5�A���q��q
	-1 , -- Type = 6�A�ǩ_����
	25000 , -- Type = 7�A�a�A�I��
	-1 } -- Type = 8�A������L
	

	local TokenStringTable = { --�f�����r��
	"[SYS_MONEY_TYPE_8]" , 
	"[SYS_MONEY_TYPE_9]" , 
	"[SYS_MONEY_TYPE_10]" , 
	"[SYS_MONEY_TYPE_11]" , 
	"[SYS_MONEY_TYPE_12]" , 
	"[SYS_MONEY_TYPE_13]" ,
	"[SYS_MONEY_TYPE_4]" ,
	"[SYS_MONEY_TYPE_15]" } 
	
	local TokenItemCount = CountBodyItem( OwnID , ItemsTypeTable[ Type ] ) --�ثe�ϥγf�����~���ƶq
	local TokenValueCount = ReadRoleValue( OwnID , TokenValueNameTable[ Type ] ) --�ثe���ഫ���f���ƭȼƶq
	
	local CompleteString = "[SC_TOKEN_STRING_8][$SETVAR1 = "..TokenItemCount.." ][$SETVAR2 = "..TokenStringTable[ Type ].."]" --�I�����\���r��
	local FailString = "[SC_TOKEN_STRING_3]" --�I�����Ѫ��r��
--	DebugMsg( 0 , 0 , "ItemsType = " .. ItemsTypeTable[Type] )
--	DebugMsg( 0 , 0 , "TokenValue = " .. TokenValueTable[Type] )
--	DebugMsg( 0 , 0 , "TokenValueName = " .. TokenValueNameTable[Type] )
--	DebugMsg( 0 , 0 , "TokenLimit = " .. TokenLimitTable[Type] )
--	DebugMsg( 0 , 0 , "TokenItemCount = " .. TokenItemCount )
--	DebugMsg( 0 , 0 , "TokenValueCount = " .. TokenValueCount )
	
	if TokenLimitTable[ Type ] > 0 then --�p�G�W�L�f���ƭȤW���A�h�����ഫ�A����ܰT��
		if TokenValueCount + TokenItemCount > TokenLimitTable[ Type ] then
			DelBodyItem( OwnID , ItemsTypeTable[ Type ] , TokenLimitTable[ Type ] - TokenValueCount ) --�R�����~���\��ƪ����~
			AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , TokenLimitTable[ Type ] - TokenValueCount ) --��f���ƭȸɦܤW��
			ScriptMessage( OwnID , OwnID , 2 , TokenStringTable[ Type ]..FailString , 0 )
			return
		end
	end
	
	DelBodyItem( OwnID , ItemsTypeTable[ Type ] , TokenItemCount ) --�R�����~
	AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , TokenItemCount ) --�����f���ƭ�
	ScriptMessage( OwnID , OwnID , 2 , CompleteString , 0 ) --�ഫ���\�T��
end
----------------------------------------------------------------------------
--�����S�w�ƶq�f���ƭȪ��q�Ψ禡
--��J�G�f�������~����(Type)�B�������ƶq(Number)
-- Type = 1�A�շ�����
-- Type = 2�A�j�N��
-- Type = 3�A�ڹҥ����L�O
-- Type = 4�A�����Ŷꨩ
-- Type = 5�A���q��q
-- Type = 6�A�ǩ_����
-- Type = 7�A�a�A�I��
-- Type = 8�A�i�h����
-- Type = 9�A������L
----------------------------------------------------------------------------
function YOYO_GetTokenValue( Type , Number )
	local OwnID = OwnerID()
	local TokenValueTable = { --�f�����ƭȽs��
	8 , 	-- TokenValue = 8		--�շ�����
	9 , 	-- TokenValue = 9		--�j�N��
	10 , 	-- TokenValue = 10	--�ڹҥ����L�O
	11 , 	-- TokenValue = 11	--�����Ŷꨩ
	12 , 	-- TokenValue = 12	--���q��q
	13 , 	-- TokenValue = 13	--�ǻ�����
	4 , 	-- TokenValue = 4	--�a�A�I��
	14 ,	-- TokenValue = 14	--�i�h����
	15 }	-- TokenValue = 15	--������L
	
	local TokenValueNameTable = { --�f���ƭȲM��
	EM_RoleValue_TrialBadgeCoin , -- Type = 1�A�շ�����
	EM_RoleValue_RelicsCoin , -- Type = 2�A�j�N��
	EM_RoleValue_DreamlandCoin , -- Type = 3�A�ڹҥ����L�O
	EM_RoleValue_PhiriusShellCoin , -- Type = 4�A�����Ŷꨩ
	EM_RoleValue_EnergyJusticeCoin , -- Type = 5�A���q��q
	EM_RoleValue_ProofLegendCoin , -- Type = 6�A�ǩ_����
	EM_RoleValue_Honor , -- Type = 7�A�a�A�I��
	EM_RoleValue_DuelistReward , -- Type = 8�A�i�h����
	EM_RoleValue_MirrorCoin } -- Type = 9�A������L
	
	local TokenLimitTable = { --�f���ƭȤW���M��A-1 = �L�W��
	-1 , -- Type = 1�A�շ�����
	10000 , -- Type = 2�A�j�N��
	-1 , -- Type = 3�A�ڹҥ����L�O
	1000 , -- Type = 4�A�����Ŷꨩ
	-1 , -- Type = 5�A���q��q
	-1 , -- Type = 6�A�ǩ_����
	25000 , -- Type = 7�A�a�A�I��
	20000 ,  -- Type = 8�A�i�h����
	-1 } -- Type = 9�A������L
	
	local TokenStringTable = { --�f�����r��
	"[SYS_MONEY_TYPE_8]" , 
	"[SYS_MONEY_TYPE_9]" , 
	"[SYS_MONEY_TYPE_10]" , 
	"[SYS_MONEY_TYPE_11]" , 
	"[SYS_MONEY_TYPE_12]" , 
	"[SYS_MONEY_TYPE_13]" , 
	"[SYS_MONEY_TYPE_4]" , 
	"[SYS_MONEY_TYPE_14]" , 
	"[SYS_MONEY_TYPE_15]" } 
	
	local TokenValueCount = ReadRoleValue( OwnID , TokenValueNameTable[ Type ] ) --�ثe�֦����f���ƭȼƶq
	
	local CompleteString = "[SC_TOKEN_STRING_9][$SETVAR1 = "..Number.."][$SETVAR2 = "..TokenStringTable[ Type ].."]" --�I�����\���r��
	local FailString = "[SC_TOKEN_STRING_6]" --�I�����Ѫ��r��
	
	AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , Number ) --�����f���ƭ�
	ScriptMessage( OwnID , OwnID , 2 , CompleteString , 0 ) --��o�f�����T��
	
	if TokenLimitTable[ Type ] > 0 then --�p�G�W�L�f���ƭȤW���A�h�Xĵ�i�T��
		if TokenValueCount + Number > TokenLimitTable[ Type ] then
			ScriptMessage( OwnID , OwnID , 2 , TokenStringTable[ Type ] .. FailString , 0 )
		end
	end
end