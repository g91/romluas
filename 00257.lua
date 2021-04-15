--¸É¹Úºô¨©´ß
function LuaI_110135()

	SetPlot( OwnerID(),"touch","LuaQ_110135_1",40)

end
---------------------------------------------------------------------------------------------------
function LuaQ_110135_1()

	if CheckAcceptQuest( OwnerID(), 420062) == true  then
		BeginPlot(TargetID(), "LuaQ_110135_shell", 0)
	end

End
---------------------------------------------------------------------------------------------------
function LuaQ_110135_shell()

	local shell = Rand(99)
	if shell < 20 then
		GiveBodyItem( TargetID(), 200045, 1)
	else
		GiveBodyItem( TargetID(), 200046, 1)
	end
	Hide(OwnerID())
	sleep(50)
	Show(OwnerID(),0)

End
