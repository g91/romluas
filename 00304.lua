function LuaQ_420308_Check()
	local Chief = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110290 , 50 )
	local Skull = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110291 , 50 )
	if Skull == -1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200885_0"), 0 ) --/*����èS���㺸�ᾥ��������
		return false
	else
		if Chief == -1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200885_1"), 0 )--/*�A�N�@�I�I���F�i���x�b���¤W��
			CastSpell( Skull,Skull,490199) --�I�k���S��
			PlayMotionEX( Skull, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200885_2"), 0 )--/*�㺸�ᾥ�����F��w�g�X�{�F�C
			return false
		end
			
	end

end

function LuaQ_420308_USE()
	local Skull = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110291 , 50 )
	local Chief = LuaFunc_CreateObjByObj ( 110290 , Skull )
	BeginPlot( Chief , "LuaI_110290_Sui" , 0 )
end

function LuaI_110290_Sui()
	sleep( 600 )
	local Skull = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110291 , 50 )
	PlayMotion( Skull, ruFUSION_ACTORSTATE_ACTIVATE_END )
	DelObj( OwnerID() )
end