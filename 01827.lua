Function LuaS_423282()
          	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(), 423282)==true and  (CheckFlag(OwnerID(),543975)==false )	then			
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423282_0]","LuaS_423282_1", 0 )
	end
	if	CheckAcceptQuest(OwnerID(), 423283)==true and  (CheckFlag(OwnerID(),543976)==false )	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422633_1]","LuaS_423283_1", 0 )
	end
end
function LuaS_423282_1()
	SetSpeakDetail( OwnerID(), "[SC_423282_1]")
	if 	CountBodyItem(OwnerID(),204889)>=1  then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423282_2]","LuaS_423282_2", 0 )
	end
end
function LuaS_423282_2()
	DelBodyItem( OwnerID(), 204889, 1 )
	SetSpeakDetail( OwnerID(), "[SC_423282_3]"  )---([115188]使用了你所給予的[204889]，並恢復了一點朝氣。)
	SetFlag( OwnerID() , 543975, 1 )
end

function LuaS_423283_1()
	SetSpeakDetail( OwnerID(), "[SC_423283_1]")
	SetFlag( OwnerID() , 543976, 1 )
end


