--===========================================================================--
function LuaS_ComShop() --���J����NPC�Ҫ����H�}�ҹ�ܼ@��

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_dindin_leave", 0 ); --/���}	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_ComShop_1() --�ѹ�ܼ@���I�s�H�}�Ұө�
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaS_MountShop_AB() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_A", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_B") , "LuaS_MOUTH_SHOP_B", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_AA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_BB") , "LuaS_MOUTH_SHOP_BB", 0 ) --/*���ɧ��M


end

function LuaS_MountShop_AC() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_A", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_C") , "LuaS_MOUTH_SHOP_C", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_AA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_CC") , "LuaS_MOUTH_SHOP_CC", 0 ) --/*���ɧ��M

end

function LuaS_MountShop_AD() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_A", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_D") , "LuaS_MOUTH_SHOP_D", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_AA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_DD") , "LuaS_MOUTH_SHOP_DD", 0 ) --/*���ɧ��M

end
-------------------------------------------------------------------------------------------------------------------------------
function LuaS_MountShop_OAB() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_OA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_B") , "LuaS_MOUTH_SHOP_OB", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_OAA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_BB") , "LuaS_MOUTH_SHOP_OBB", 0 ) --/*���ɧ��M


end

function LuaS_MountShop_OAC() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_OA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_C") , "LuaS_MOUTH_SHOP_OC", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_OAA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_CC") , "LuaS_MOUTH_SHOP_OCC", 0 ) --/*���ɧ��M

end

function LuaS_MountShop_OAD() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_A") , "LuaS_MOUTH_SHOP_OA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_D") , "LuaS_MOUTH_SHOP_OD", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_AA") , "LuaS_MOUTH_SHOP_OAA", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_MOUNTH_SHOP_DD") , "LuaS_MOUTH_SHOP_ODD", 0 ) --/*���ɧ��M

end

function LuaS_MountShop_Z31() --���M�ӤH

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[".."241182".."]" , "LuaS_MOUTH_SHOP_Z31A", 0 ) --/*���ɧ��M
	AddSpeakOption( OwnerID(), TargetID( ), "[".."241183".."]" , "LuaS_MOUTH_SHOP_Z31B", 0 ) --/*���ɧ��M
end
--------------------------------------------------------------------------------------------------------------------------------------
function LuaS_MOUTH_SHOP_A()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_A2" , 0 )
end
function LuaS_MOUTH_SHOP_B()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_B2" , 0 )
end
function LuaS_MOUTH_SHOP_C()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_C2" , 0 )
end
function LuaS_MOUTH_SHOP_D()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_D2" , 0 )
end

function LuaS_MOUTH_SHOP_AA()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_A3" , 0 )
end
function LuaS_MOUTH_SHOP_BB()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_B3" , 0 )
end
function LuaS_MOUTH_SHOP_CC()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_C3" , 0 )
end
function LuaS_MOUTH_SHOP_DD()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_D3" , 0 )
end
function LuaS_MOUTH_SHOP_OA()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OA2" , 0 )
end
function LuaS_MOUTH_SHOP_OB()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OB2" , 0 )
end
function LuaS_MOUTH_SHOP_OC()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OC2" , 0 )
end
function LuaS_MOUTH_SHOP_OD()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OD2" , 0 )
end

function LuaS_MOUTH_SHOP_OAA()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OA3" , 0 )
end
function LuaS_MOUTH_SHOP_OBB()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OB3" , 0 )
end
function LuaS_MOUTH_SHOP_OCC()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OC3" , 0 )
end
function LuaS_MOUTH_SHOP_ODD()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OD3" , 0 )
end
function LuaS_MOUTH_SHOP_Z31A()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OZ31A" , 0 )
end
function LuaS_MOUTH_SHOP_Z31B()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaS_MOUTH_SHOP_OZ31B" , 0 )
end
---=================================================================================-------