function lua_givecard2()
	for i = 770171,770340,1 do
		GiveBodyItem (OwnerID(),i,1);
		sleep(10)
	end
end