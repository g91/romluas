--路邊的炸醬麵外送包 效果

function LuaI_207064( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--使用對象不正確，請對玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG08]"  , C_SYSTEM )	--使用對象不正確，請對玩家使用。
			return false
		end
	elseif ( Option == "USE" ) then
		local X = Rand( 100 )    
		if X >= 0 and X <=30  then  
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT01]"  , C_SYSTEM ) --你獲得了[506338]效果。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT01]"  , C_SYSTEM ) --你獲得了[506338]效果。
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506338,0 ,3600) --剩餘的炸醬麵(60m)  --坐騎移動速度增加(Buff0)%。
		elseif X >= 31 and X <=60 then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT02]"  , C_SYSTEM ) --你獲得了[506337]效果。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT02]"  , C_SYSTEM ) --你獲得了[506337]效果。
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506337,0 ,1800) --很好吃的炸醬麵 (30m) --HP與MP上限增加(Buff0)%。
		elseif X >= 61 and X <= 90 then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT03]"  , C_SYSTEM ) --你獲得了不好吃的炸醬麵效果。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT03]"  , C_SYSTEM ) --你獲得了不好吃的炸醬麵效果。
			CastSpell( TargetID(),TargetID(), 495127) --10%的生命恢復 10%的魔力恢復
		elseif X >= 91  then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT04]"  , C_SYSTEM ) --你獲得了[506339]效果。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT04]"  , C_SYSTEM ) --你獲得了[506339]效果。
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506339,0 ,300) --被吐出來的炸醬麵(5m)  --移動速度下降(Buff0)%。
		end
	end
end


--黑色服裝變身效果 效果

function LuaI_207048( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--使用對象不正確，請對玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG08]"  , C_SYSTEM )	--使用對象不正確，請對玩家使用。
			return false
		end
	elseif ( Option == "USE" ) then
		local BorG = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  
		If BorG == 0 then
			CastSpell( TargetID(),TargetID(), 494779) --Motion
			sleep(20)
			AddBuff(TargetID(), 506341  ,0 ,3600) 
		elseif BorG == 1 then
			CastSpell( TargetID(),TargetID(), 494779) --Motion
			sleep(20)
			AddBuff(TargetID(), 506342  ,0 ,3600) 
		end
	end
end