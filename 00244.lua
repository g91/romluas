function LuaQ_420236_Complet()

	DisableQuest( OwnerID() , true )
	--��_�Y�R��ID��X��
	local Corinna = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110043 , 150 )
	--����
	AdjustFaceDir( OwnerID(), Corinna , 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 30 )
	CastSpell( OwnerID(),OwnerID(),490098) --�I�k�S��
	sleep( 10 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep( 20 )
	Say( Corinna , GetString("SAY_110043_0") ) --/*�y�y�K�K�ȧJ�A�o�ӥշ��K�K�ڤf�n���K�K
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110042_0") ) --/*�Ӧn�F�I�o�������F�I
	sleep( 20 )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	Say( OwnerID() , GetString("SAY_110042_1") ) --/*���U�ӥu�n���o�n�n��i�N���_�F�a�o�@���h���A�����U�A���¡C
	sleep( 10 )
	DisableQuest( OwnerID() , false )

end
-------------------------------------------------------------------------------------------
function LuaQ_420236_Item(Option) -- �ϥΪ��~��|���檺�@��
	local Things = CountBodyItem( OwnerID() , 200685 )
	if Option == "CHECK" then
		if Things >= 20 and CountBodyItem( OwnerID() , 200690 ) == 0 then
			return true
		elseif Things < 20 and  CountBodyItem( OwnerID() , 200690 ) == 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_COM_LESS"), 0 ); --/*�ʤ֪��~�C
			return false
		else
			return false
		end
	elseif Option == "USE" then
		DelBodyItem( OwnerID() , 200685 , Things )
--		DelBodyItem( OwnerID() , 200684 , 1 )		
		GiveBodyItem( OwnerID() , 200690 , 1 )
	end
	
end
	