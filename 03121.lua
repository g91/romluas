--與黑德格對話
function szLuaScript_123336()
	local player = OwnerID()
	LoadQuestOption(player)
	if CheckAcceptQuest( player,426883) then
		AddSpeakOption( player,player,"[SC_112827_0]", "szLuaScript_123336_1",0)--我準備好了
	end
end
function szLuaScript_123336_1()
	AddBuff( OwnerID(), 620001, 0, 2)
	Setflag(OwnerID(),548821,1)
	Changezone( OwnerID(), 30, 0, 19922, 127, 35282, 277 )
end
--任務426884 話說重頭
function szLuaScript_123337()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426884) and CheckFlag(OwnerID(),548822)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_123337_1]","szLuaScript_123337_1(1)",0)
	end
end
function szLuaScript_123337_1(k)
	k=k+1
	SetSpeakDetail( OwnerID(),"[SC_123337_"..k.."]")
	k=k+1
	if k>=9 then
		SetFlag(OwnerID(),548822,1)
		return
	elseif CheckAcceptQuest(OwnerID(),426884) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_123337_"..k.."]","szLuaScript_123337_1("..k..")",0)
	end
end
--打開了瓶蓋，水的氣味透出了一絲香甜，你感到臉脥發熱，似乎喝了一杯甜酒。
function ItemUseOKScript_243118()
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426886_1]",0)
	DW_QietKillOne( OwnerID(),108565 )
end
--水的氣味就像泡過屍體一般惡臭刺鼻，你感到快要窒息了。
function ItemUseOKScript_243119()
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426886_2]",0)
	DW_QietKillOne( OwnerID(),108566 )
end

--任務：落雷瀑布的石像
function SrvScript_243134()
	local O_ID=OwnerID();
	local RoomID = ReadRoleValue( O_ID , EM_RoleValue_RoomID )
	local TNPC=SearchRangeNPC(O_ID,50);
	local NPC=0;
		for i=0,table.getn(TNPC),1 do
			if ReadRoleValue( TNPC[i],EM_RoleValue_OrgID)==123346 then
				NPC=TNPC[i];
			end
		end
		if NPC~=0 then --and ReadRoleValue(O_ID,EM_RoleValue_Register1)==0	then
			CastSpell(O_ID,NPC,498978);
			ScriptMessage(O_ID,O_ID,3,"[SC_426888_1]",0)
			DW_QietKillOne( OwnerID(),108563 )
		else
			ScriptMessage( O_ID, O_ID, 3,"[SC_426888_2]", 0 );		--你得靠近一點
		end
end

--任務：空中散佈，使用物品
function CheckUseScript_426891()
	if  ReadRoleValue( TargetID(),EM_RoleValue_OrgID ) ~= 108526 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[EM_201167_3]", 0 ); -----目標錯誤
		return false
	end
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----距離太過遙遠，無法使用。
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_425572_02]", 0 ); ----對方極力掙扎中。
		return false
	end
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --牠已經死了。
		return false
	end
	return true
end
function ItemUseOKScript_426891()
	GiveBodyItem( OwnerID() , 243131 , 1 )
	--ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_03]", 0 ); -------你捉到[105193]了了！
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function szObjBegin_426897()
	local tmpObj = SearchRangeNPC( TargetID(),100);
		for i=0,#tmpObj do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID)==108567 then
				ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0);
				return false
			end
		end
		return true
end

function szObjEnd_426897()
	local tmpObj = SearchRangeNPC( TargetID(),100);
		for i=0,#tmpObj do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID)==108567 then
				ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0);
				return false
			end
		end
	CallPlot(TargetID(),"szObjEnd_426897_1",0)
	return 1
end
function szObjEnd_426897_1()
	--生出怪物
	local tmpPlay = SearchRangePlayer( OwnerID(),250);
	local tmpPlayer = {};
	local x,y,z,dir = DW_Location( OwnerID() );
	local mns = CreateObj( 108567,x,y,z,dir,1 );
		SetFightMode ( mns, 0, 0, 0, 0 );
		AddToPartition( mns,0 );
	
		for i=0,#tmpPlay do
			if CheckAcceptQuest( tmpPlay[i],426897)  then
				ScriptMessage( tmpPlay[i],tmpPlay[i],3,"[SC_108406_S1]",0);
				AddBuff( tmpPlay[i],626123,0,2 );	--預設4秒
				table.insert (tmpPlayer ,tmpPlay[i]);
			end
		end
		
		CastSpell( OwnerID(), mns, 850641 )
		SetFightMode( mns, 1, 1, 1, 1);
		SetAttack( mns, tmpPlayer[1]);
		
		local dis ;
		local hateN ;
		local know =0 ;
		
		for i=0,360 do
			dis = CheckDistance(mns,OwnerID(),150)
			hateN = HateListCount( mns );
				
				if dis==false then
					DelObj( mns);
					return
				end
				
				 if hateN==0 then
				 	know = know +1
				 	if know ==6 then
				 		DelObj( mns);
						return
				 	end
				 end
				
				if ReadRoleValue( mns , EM_RoleValue_IsDead ) == 1 then
					return
				end
				Sleep(10)
		end
		DelObj( mns);

end