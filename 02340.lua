function bk_war_Shop()--------------------------------�@�ɾԳ��I��
	--------------LoadQuestOption( OwnerID() )   -----------Ū��
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop_0", 0 ) --�i�J�n���ө�	
end
function bk_war_shop_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --��ܤ��e--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_1", 0 ) --�i�J�n���@�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_2", 0 ) --�i�J�n���G�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_3", 0 ) --�i�J�n���T�ө�
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop", 0 ) --�^��W�@��
end
function bk_war_shop_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_1_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_1_op()
	SetShop( TargetID( ) , 600310 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_2_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_2_op()
	SetShop( TargetID( ) , 600311 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_3_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_3_op()
	SetShop( TargetID( ) , 600312 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end


function bk_war_Shop_60()--------------------------------�@�ɾԳ��I��
	--------------LoadQuestOption( OwnerID() )   -----------Ū��
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop0_60_0", 0 ) --�i�J�n���ө�	
end
function bk_war_shop0_60_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --��ܤ��e--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_60_1", 0 ) --�i�J�n���@�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_60_2", 0 ) --�i�J�n���G�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_60_3", 0 ) --�i�J�n���T�ө�
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop_60", 0 ) --�^��W�@��
end
function bk_war_shop_60_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_1_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_60_1_op()
	SetShop( TargetID( ) , 600313 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_60_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_2_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_60_2_op()
	SetShop( TargetID( ) , 600314 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_60_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_3_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_60_3_op()
	SetShop( TargetID( ) , 600315 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end

function bk_war_Shop_70()--------------------------------�@�ɾԳ��I��
	--------------LoadQuestOption( OwnerID() )   -----------Ū��
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop0_70_0", 0 ) --�i�J�n���ө�	
end
function bk_war_shop0_70_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --��ܤ��e--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_70_1", 0 ) --�i�J�n���@�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_70_2", 0 ) --�i�J�n���G�ө�
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_70_3", 0 ) --�i�J�n���T�ө�
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop_70", 0 ) --�^��W�@��
end
function bk_war_shop_70_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_1_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_70_1_op()
	SetShop( TargetID( ) , 600316 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_70_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_2_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_70_2_op()
	SetShop( TargetID( ) , 600317 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
function bk_war_shop_70_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------Ū���ӤH�n��
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_3_op", 0 ) --�i�J�n���@�ө�
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --��ܤ��e--�n���������
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --�^��W�@��
	end
end
function bk_war_shop_70_3_op()
	SetShop( TargetID( ) , 600318 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
