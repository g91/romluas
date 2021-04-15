function Lua_Zone21_Assassinate_Plot(TID,Time)
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if Time == nil then Time=15 end;
	TID=TID or TargetID()
	ScriptMessage( TID, TID, 1 , "[SC_ZONE21_ASSASSINATE_START]", C_Red )
	local Msg = {	"[SC_ZONE21_ASSASSINATE_1]",
			"[SC_ZONE21_ASSASSINATE_2]",
			"[SC_ZONE21_ASSASSINATE_3]",
			"[SC_ZONE21_ASSASSINATE_4]"}
	local shadow = Lua_CreateObjByDir( TID , 105988 , 80 , 0);
	local OldX,OldY,OldZ,OldDir = Lua_GetPostion(shadow);
	local dis = 20;
	local Cal1 = math.rad(OldDir)
	local Cal2 = Cal1+math.pi*2*(4/10);
	local Cal3 = Cal1+math.pi*2*(6/10);
--	Say(TargetID(),"Cal1.."..Cal1.." Cal2.."..Cal2.." Cal3.."..Cal3.." OldDir.."..OldDir)
	local Monster1 = CreateObj( 105986, OldX-dis*math.cos(Cal2),OldY ,OldZ +dis*math.sin(Cal2),OldDir , 1 )
	local Monster2 = CreateObj( 105987, OldX- dis*math.cos(Cal3),OldY ,OldZ +dis*math.sin(Cal3),OldDir , 1 )
	AddToPartition(shadow,RoomID);
	AddToPartition(Monster1,RoomID);
	AddToPartition(Monster2,RoomID);
	Sleep(Time/2*10);
	ScriptMessage( TID, TID, 1 , Msg[math.random(4)], C_Red )
	Sleep(Time/2*10);
	DelObj(shadow);
	DelObj(Monster1);
	DelObj(Monster2);
	ScriptMessage( TID, TID, 1 , "[SC_ZONE21_ASSASSINATE_END]", C_Red )
end
function Lua_Zone21_Assassinate_Main()
	SetPlot(OwnerID(),"Range","Lua_Zone21_Assassinate_Range",100);
end
function Lua_Zone21_Assassinate_Range()
	if CheckCompleteQuest( OwnerID() , 424533 )==false then
		SetPlot(TargetID(),"Range","",0);
		--劇情表演
		CallPlot(TargetID(),"Lua_Zone21_Assassinate_Plot",OwnerID(),10);
		--重設範圍劇情
		BeginPlot(TargetID(),"Lua_Zone21_Assassinate_Main",2400);
	end
end