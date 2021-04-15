function MagicPlot_500733()
local Obj = Role:new( OwnerID() )
local TargetObj = Role:new( TargetID() )
Local Dir , Dx , Dz


Dir = TargetObj:Dir() + 180
if Dir > 360 then 
	Dir = Dir - 360;
end

Dir = ( 360 - Dir ) / 57.2958

for i = 15 , 0 , -5 do
	Dx = math.cos( Dir ) * i
	Dz = math.sin( Dir ) * i
	if  CheckLine( TargetID() , TargetObj:X() + Dx , TargetObj:Y() , TargetObj:Z()+Dz ) == true  then
		break;
	end

end

SetPos( OwnerID() , TargetObj:X() + Dx , TargetObj:Y() , TargetObj:Z()+Dz , TargetObj:Dir() );

end