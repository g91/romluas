--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/19
--�ק���: 2009/04/06
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--��y�m�J �K�����y���ʥ�
------------------------------------------------------------------------------
function LuaI_204122ranbowegg( Option )
	local PlayerID = OwnerID()
	local PackageID = 204122		--��y�m�J
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724268 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  ��y�m�J ran�X���~  204122
------------------------------------------------------------------------------
--��ᤧ�q	204123    30%
--���a�줧�q	204124    28%
--�ŧѧڤ��q	204125    22%
--���Y�ᤧ�q	204126    20%
-------------------------------------------------------------------------------
------------------------------------------------------------------------------
--�K�B���l      204223    �a�ߤl�^�a�h ���ʥ�
------------------------------------------------------------------------------
function LuaI_204223box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204223		--�K�B���l 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724332 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  �K�B���l  ran�X���~
------------------------------------------------------------------------------
--204224 ����N�� x 3    55% 
--204119 �d���c x2       45%
-------------------------------------------------------------------------------
 -- �D���d���c           
------------------------------------------------------------------------------
--�ϥιD������ߤl�k�N ���\��ߤl�|�ܦ��D��"��^���Ԥ��"  
------------------------------------------------------------------------------
function LuaI_204119_Check()  --�ˬd�����~�O�_�b�S�wNPC���W
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 112581 --�Ԥ�� ����npc

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_01") , C_SYSTEM )	--�ШϥΩ�a�^�Ԥ�ߤW�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_01") , C_SYSTEM )	--�ШϥΩ�a�^�Ԥ�ߤW�C
		return false	
	end
end
------------------------------------------------------------------------------
function LuaI_204119_Effect()   --���v�P�w 
	local RANDOWN = rand(100)
	if RANDOWN >35 then  -- ���ߤl ���v��65%
		BeginPlot( OwnerID() , "LuaI_204119_Delgoods" , 0 )  
		BeginPlot( TargetID() , "LuaI_204119_Reset" , 0 )
	else --�ߤl�{��  35%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_02") , C_SYSTEM )	--�ߤl�{�פF�A�������C
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_02") , C_SYSTEM )	--�ߤl�{�פF�A�������C
	end

end
------------------------------------------------------------------------------
function LuaI_204119_Reset()
	Hide(OwnerID() )
	sleep(1200)
	LuaFunc_ResetObj( OwnerID() )	
end
------------------------------------------------------------------------------
function LuaI_204119_Delgoods()   --���\��^        
	sleep(20)	
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_204119_03") , C_SYSTEM )	--�A���\�a�a�^�ߤl�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_204119_03") , C_SYSTEM )	--�A���\�a�a�^�ߤl�I
	GiveBodyItem( OwnerID() , 204120, 1 )
	DelBodyItem( OwnerID() , 204119 , 1) 
end
------------------------------------------------------------------------------
