function lua_givecard5()
	for i = 770581,770720,1 do
		GiveBodyItem (OwnerID(),i,1);
		sleep(10)
	end
end