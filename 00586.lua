function lua_givecard3()
	for i = 770341,770410,1 do
		GiveBodyItem (OwnerID(),i,1);
		sleep(10)
	end
end