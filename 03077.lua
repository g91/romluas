-----------------------------------------------------426689�}�l������
--�﨤��ϥΪ��~
--123043 �H�������
--243029 ��u�u��]
--243050�G������O
function lua_Z28_123043_1()
	if CountBodyItem( OwnerID(),243029 ) > 0 then--��u�u��]
		return true
	else
		--�G�V�|�I���W�S���ײz�Ϊ��u��......
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1]", 0 )
		return false
	end
end
function lua_Z28_123043_1_1()
		--���v��
		local num =Rand( 100 )
		--Say( OwnerID(),num)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN)
		Sleep(20)
		if num>= 30 then
			--���\���U�w�g�G��������A�ô��W���s����O
			--ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1_1]", 0 )
			Say( OwnerID(), "[SC_123043_1_1]" )
			GiveBodyItem( OwnerID(), 243050, 1 )
		----1/3����
		else
			--���ڡI�G��������Q�A�@���A�����d��A�����X�ӤF�I
			--ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1_2]", 0 )
			Say( OwnerID(), "[SC_123043_1_2]" )
		end
		return 1
end