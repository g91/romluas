function lua_givecard1()
	for i = 770000,770170,1 do
		GiveBodyItem (OwnerID(),i,1);
		sleep(10)
	end
end