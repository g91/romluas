function CheckGreatTargetHP(Value)
local TargetObj = Role:new( TargetID() )
local OwnerObj = Role:new( OwnerID() )

if  TargetObj:HP() > Value  then 
	OwnerObj:Say( "OK �ؼ�HP�n�j��300" )
	return true;
end
OwnerObj:Say( "False �ؼ�HP�n�j��300" )
return false; 
end