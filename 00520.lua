function LuaS_110581()	--¾�~�޲z��

	LoadQuestOption( OwnerID() );  --���J���ȼҪO
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110581_1") , "LuaS_110581_1",0 );	--�ڷQ�ഫ�D��¾
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110581_2") , "LuaS_110581_2",0 );	--�D��¾���S��
	end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_110581_1()	--¾�~�޲z��
	CloseSpeak( OwnerID() )			-- ������ܵ���
	-- GiveBodyItem(OwnerID(),540821,1)--�����n���~540821�u�}�Ҵ�¾�~�����v
	OpenChangeJob()

	end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_110581_2()	--¾�~�޲z��

	SetSpeakDetail( OwnerID() , "[ST_CHANGJOB]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_BACK]" , "LuaS_110581" , 0 )		--��^�W�@��

end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ChangeJob_Intro()
	SetSpeakDetail( OwnerID(), "[SC_CHANGEJOB_DETAIL]"  )
end
