function CheckGreatTargetHP(Value)
local TargetObj = Role:new( TargetID() )
local OwnerObj = Role:new( OwnerID() )

if  TargetObj:HP() > Value  then 
	OwnerObj:Say( "OK 目標HP要大於300" )
	return true;
end
OwnerObj:Say( "False 目標HP要大於300" )
return false; 
end