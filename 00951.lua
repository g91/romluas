function LuaS_110989_2() --穝糤耞单,string
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_7")   ) --ㄌ眤单把セ笆惠璶や┿ 12000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_6")   ) --ㄌ眤单把セ笆惠璶や┿ 10000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_5")   ) --ㄌ眤单把セ笆惠璶や┿ 9000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_4")   ) --ㄌ眤单把セ笆惠璶や┿ 8000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_3")   ) --ㄌ眤单把セ笆惠璶や┿ 7000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_2")   ) --ㄌ眤单把セ笆惠璶や┿ 6000 眤絋﹚璶把盾
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_1")   ) --ㄌ眤单把セ笆惠璶や┿ 5000 眤絋﹚璶把盾
	end
	if  CheckBuff(OwnerID() , 501603 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_3") , "LuaS_110989_3", 0 ) --/*и璶把
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_4") , "LuaS_110989_0", 0 ) --/*琵иσ納

end

function LuaS_110989_3()
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 12000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 12 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -12000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 10000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 10 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -10000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 9000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 9 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -9000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 8000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 8 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -8000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 7000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 7 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -7000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 6000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 6)
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -6000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 5000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 5 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -5000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --眤笵ㄣ丁ぃì
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --眤窥ぃì
		end
	end

		SetSpeakDetail( OwnerID(), GetString("ST_110989_3")   ) 
	--絋龟Μ眤┿
end
