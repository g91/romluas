function LuaS_110989_2() --新增判斷等級,string
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_7")   ) --依您的等級，參加本活動需要先支付押金 12000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_6")   ) --依您的等級，參加本活動需要先支付押金 10000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_5")   ) --依您的等級，參加本活動需要先支付押金 9000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_4")   ) --依您的等級，參加本活動需要先支付押金 8000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_3")   ) --依您的等級，參加本活動需要先支付押金 7000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_2")   ) --依您的等級，參加本活動需要先支付押金 6000 金，您確定要參加嗎？
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
	SetSpeakDetail( OwnerID(), GetString("ST_110989_2_1")   ) --依您的等級，參加本活動需要先支付押金 5000 金，您確定要參加嗎？
	end
	if  CheckBuff(OwnerID() , 501603 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_3") , "LuaS_110989_3", 0 ) --/*我要參加
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110989_4") , "LuaS_110989_0", 0 ) --/*讓我考慮一下

end

function LuaS_110989_3()
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=46 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 12000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 12 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -12000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=41 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 10000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 10 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -10000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=36 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 9000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 9 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -9000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=31 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 8000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 8 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -8000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=26 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 7000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 7 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -7000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=21 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 6000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 6)
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -6000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	elseif  ReadRoleValue( OwnerID() , EM_RoleValue_LV)>=15 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money) > 5000 then
			if CheckBuff(OwnerID() , 501603 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then		
			GiveBodyItem( OwnerID() , 200007 , 5 )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -5000 )
			else SetSpeakDetail( OwnerID(), GetString("ST_110989_3_1")   ) --您的道具空間不足
			end
		else  SetSpeakDetail( OwnerID(), GetString("ST_110989_3_2")   ) --您的金錢不足
		end
	end

		SetSpeakDetail( OwnerID(), GetString("ST_110989_3")   ) 
	--好的，確實收到了您的押金，
end
