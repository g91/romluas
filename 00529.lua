function LuaS_110782_0()
	LoadQuestOption( OwnerID() ) 
	if CheckFlag(OwnerID() , 540839 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_1") , "LuaS_110782_1", 0 )  --/*ť���A�i�H�K�O���ѧڧ��M
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_A", 0 ) --/*���ɧ��M
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_B") , "LuaS_MOUTH_SHOP_B", 0 ) --/*���ɧ��M

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_AA", 0 ) --/*���ɧ��M
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_BB") , "LuaS_MOUTH_SHOP_BB", 0 ) --/*���ɧ��M

	end		
	
end

function LuaS_110782_1()
	if CheckFlag(OwnerID() , 540840 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110782_1")   ); 
		--/*���T�A�]���ȴ�_�I�̨�|�|����ڦ��q�污�A�ҥH���@�N���ѧK�O�@�����M���A���L�u���@�����|��I
		--/*�ڭɵ��A������15������|�ۤv�^�ӡA�ҥH�O���O�F�ڡI
		--/*�A�ǳƦn�F�ܡH
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_2") , "LuaS_110782_2", 0 )  --/*�Эɧڣ��ǧ��M	
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110782_2")   ); 
		--/*�ڤW�����O�w�g�ɵ��A�@���F�ܡH�����Ӧ������L�u���@�����|�a�I
		--/*�o�O�ڿѥͪ��u��A�ڥi����ѬO�K�O���H�ڡI�ӥB���ɧ��M 15 �����u�n 9 �ȡA��ܫK�y�������F�O�I
		SetFlag( OwnerID() , 540839 , 0 )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP") , "LuaS_110782_4", 0 ) --/*���ɧ��M
	end
end

function LuaS_110782_2()
	CloseSpeak( OwnerID() )
	SetFlag( OwnerID() , 540839 , 0 )
	SetFlag( OwnerID() , 540840 , 1 )
	CastSpell( OwnerID() , TargetID() , 491035 )
end

function LuaS_110782_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110782_3")   ); 
	--/*�A�n�����@�ӡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110782_3") , "LuaS_110782_4", 0 ) --/*�հ��A15 ���� 9 ��

end

function LuaS_110782_4()
	CloseSpeak( OwnerID() )
--	BeginPlot( OwnerID() , "LuaS_MOUTH_SHOP_A" , 0 )
	OpenShop()
end