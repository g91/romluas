function meek_test1()
	say(OwnerID(),"i am player")
	say(TargetID(),"i am monster")
	castspell(TargetID(),OwnerID(),496689)
end

function meek_test2()
	setplot(OwnerID(),"range","meek_test1",100)
end

function meek_test3()
	local a
	while 1 do
		a = Lua_DW_CreateObj("flag" ,100052,780848,1)	
		castspell(OwnerID(),a,496506)
		SysCastSpellLv(OwnerID(),a,497425,499) 
		sleep(50)
	end
end

function meek_test4()
	local a
	while 1 do
		a =  LuaFunc_CreateObjByObj ( 104917, OwnerID() ) 
		addbuff(a,508094,0,10)
		sleep(10)
	end
end

function meek_test5()
	CastSpell(OwnerID(),OwnerID(),497424)
	sleep(60)
	CastSpell(OwnerID(),OwnerID(),497425)	
end

function meek_test6()
	addbuff(OwnerID(),508121,0,-1)
end

function meek_test7()
	castspell(OwnerID(),OwnerID(),496689)
	addbuff(OwnerID(),508121,0,-1)
end

function meek_test8()
	if	CheckLine(OwnerID(),-7112.2,-13.8,52356.2) == true	then
		say(OwnerID(),"i can see you")
	else
		say(OwnerID(),"i can't see you")
	end
	
end

function meek_test9()
	local	tar = TargetID()
	say(tar,"i am tar")
	local	PlayerList = SearchRangePlayer ( tar , 300 )
	say(tar,PlayerList[0])
end

function meek_test10()
	castspell(OwnerID(),OwnerID(),496569)
	sleep(30)
	castspell(OwnerID(),OwnerID(),496569)
	sleep(30)
	castspell(OwnerID(),OwnerID(),496569)
	sleep(30)
end

