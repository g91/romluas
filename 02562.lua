
function Lua_nehelia_runrun()
	setflag( TargetID() , 546091 , 1)
	setflag( TargetID() , 546060 , 1 )
	setflag( TargetID() , 546101 , 0 )
end


function Lua_nehelia_runrun1()
	setflag( TargetID() , 546060 , 0 )
end


function Lua_nehelia_runrun2()
	setflag( TargetID() , 546061 , 0 )
end

function Lua_nehelia_runrun3()
	setflag( TargetID() , 546062 , 0 )
end

function Lua_nehelia_runrun4()
	setflag( TargetID() , 546063 , 0 )
end

function Lua_nehelia_runrun5()
	setflag( TargetID() , 546084 , 0 )
end

function Lua_nehelia_runruncheck()
	local oid = OwnerID()
	local A = CheckFlag( oid , 546060)
	local B=CheckFlag( oid , 546061 )
	local C=CheckFlag( oid ,546062 )
	local D=CheckFlag( oid , 546063 )
	local E=CheckFlag(  oid, 546084 )
	local f = CheckFlag (oid , 546091 )
		if f == FALSE then
			if   C==true or D==true then
			 SetSpeakDetail( oid , "[SC_THANKS_RUN02]" )
			elseif E==true or A==true or B==true then
			LoadQuestOption ( oid )
			else
				if CheckFlag ( oid ,546101 ) == FALSE  then
					SetFlag ( oid , 546101 , 1 )
				end	
			LoadQuestOption ( oid )
			end
		elseif f == TRUE then
			if a == TRUE or f == TRUE then	
			LoadQuestOption ( oid )
			elseif  B==true or C==true or D==true or E== true then
			 SetSpeakDetail( oid , "[SC_THANKS_RUN02]" )

			end
		end
end

