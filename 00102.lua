-- OwnerID()	����@���� NPC
-- TargetID()	����Ȫ����a

function LuaInit_110091()
	-- �@�}�l�N�� NPC �ۤv��ۤv�W BUFF
	CastSpell( OwnerID(), OwnerID(), 490101 );
end

function LuaAfterClickQuestOb_110091()		-- �I�����Ȫ���᪺�B�z
	
	-- ���������Ȫ��󨭤W�� BUFF
	CancelBuff( TargetID(), 500900 );	

	-- �R�O�Q�I������, �b N ������Y�@��
	BeginPlot( TargetID(), "LuaQuestDelayProcess_110091", 0 );

	return 1; -- �Ǧ^ 1 �q���t���~���I��
end

function LuaQuestDelayProcess_110091()		-- �I�����Ȫ���᪺�B�z

	-- �I�i�R�ƪk�N
	CastSpell( OwnerID(), OwnerID(), 490102 );

	-- ���𪽨� Server ���\���󭫷s�i�H�Q����
	Sleep( 300 );

	-- ���������Ȫ��󨭤W�� �R�� BUFF
	CancelBuff( OwnerID(), 500902 );

	-- ���s�W�S�w�� BUFF
	CastSpell( OwnerID(), OwnerID(), 490101 );

end