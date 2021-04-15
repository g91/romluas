function sasa_530677_Light(check)
	--Say( OwnerID() , check )
	if check == 0 then
		CancelBuff( OwnerID() , 508433 )
	elseif check == 1 then
		AddBuff( OwnerID() , 508433 , 0 , -1 )
	end
end