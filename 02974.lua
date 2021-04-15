function CreateTheScene1()
	local me = OwnerID();
	local Signs = 122690; 
	local wolf = 107846 ;
	local Rods = 122610;
	local x , y , z , dir = 0, 0, 0,0 ;
	local bx, by ,bz ,bdir = 0, 0, 0, 0;
	local myX = ReadRoleValue( me ,EM_RoleValue_X ) ;
	local myY =  ReadRoleValue( me , EM_RoleValue_Y ) ;
	local myZ = ReadRoleValue( me , EM_RoleValue_Z) ;
	local myDir = ReadRoleValue( me , EM_RoleValue_Dir)  ;
	local cc = 0;
	DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
	for r = 1, 12 do 
		cc = cc+1
		if r == 1 then
			x , y , z , dir= myX , myY , myZ , 0 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 2 then
			x , y , z , dir= myX+60 , myY , myZ , 270 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 3 then
			x , y , z , dir= myX+60 , myY , myZ+60 , 0 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 4 then
			x , y , z , dir= myX+60 , myY , myZ+120 , 0 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 5 then
			x , y , z , dir= myX+120 , myY , myZ , 180 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 6 then
			x , y , z , dir= myX+120 , myY , myZ+60 , 270 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 7 then
			x , y , z , dir= myX+120 , myY , myZ+120 , 0 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 8 then
			x , y , z , dir= myX+180 , myY , myZ+60 , 0 ;  
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 9 then
			x , y , z , dir= myX+180 , myY , myZ+120 , 90 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 10 then
			x , y , z , dir= myX+240 , myY , myZ , 180 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 11 then
			x , y , z , dir= myX+240 , myY , myZ+60 , 0 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		elseif r == 12 then
			x , y , z , dir= myX+300 , myY , myZ+60 , 180 ;
			DebugMsg(0, 0, "DebugMsg"..cc.."times , x = "..x.." , y = "..y.." , z= "..z.." , dir = "..dir) ;
		end
		local cSigns= CreateObj( Signs, x , y , z , dir , 1) ;
		AddToPartition(cSigns,0);  
		sleep(10) ;
	end
	DebugMsg(0, 0, "after FOR");
	Callplot(me, "CreateTheScene2");
end