function lua_givecard4()
	for i = 770411,770580,1 do
		GiveBodyItem (OwnerID(),i,1);
		sleep(10)
	end
end