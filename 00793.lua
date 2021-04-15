--/*索雷爾頓施法劇情
function LuaN_100776()
	while 1 do
	local NPC = {}
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) == 0 then 
		sleep(100)
		NPC = SearchRangeNPC(OwnerID() , 150 )
			for i=1 , table.getn(NPC) do
				if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID) == 100729 then
					CastSpell( OwnerID() , NPC[i] , 491263 )
					sleep(100)
					local Monster = LuaFunc_CreateObjByObj ( 100748 , NPC[i] )
					SetFollow( Monster , OwnerID() )
					sleep(50)
					DelObj(Monster)
					break
				end
			end
		else
		sleep(30)
		end
	end
end
----------------------------------------------------/*從投石車剪投石索
function LuaQ_421077_end()
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421077_END"), 0 ); --/*投石車的投石索被你剪下，投石車因而崩毀。
	return true
end

function LuaS_111107_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 421076 ) == true and CheckFlag( OwnerID() , 541295 ) == false then
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111107_0") , "LuaS_111107_1", 0 )
	end
end

function LuaS_111107_1()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID() , "LuaQ_421076_0" , 0 )
end

function LuaQ_421076_0()
	DisableQuest( OwnerID() ,true )
	Say( OwnerID() , GetString("SC_111107_1") )
	sleep(15)
 	Say( OwnerID() , GetString("SC_111107_2") )
	sleep(15)
	local Funter = LuaFunc_CreateObjByObj ( 101009 , OwnerID())
	Hide( OwnerID() )
	BeginPlot( Funter , "LuaQ_421076_1" , 0 )
	SetPlot( Funter , "dead" , "LuaQ_421076_2" , 40 )
	SetAttack( Funter , TargetID() )
	sleep(60)
	while 1 do
		if ReadRoleValue( Funter , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Funter) == true then  --檢查是否離開戰鬥
			sleep(60)	-- 六秒檢查一次	
		else
			Show(OwnerID() ,0)
			DisableQuest( OwnerID() ,false )
			break		
		end
		sleep(1)
	end	
end

function LuaQ_421076_1()
	LuaFunc_Obj_Suicide(60)
end

function LuaQ_421076_2()
	local Player = LuaFunc_PartyData(TargetID()) 
	local Flag = 541295
	for i = 1 , Player[0] , 1 do
		if CheckFlag( Player[i] ,Flag ) ~=true and  CheckCompleteQuest(Player[i], 421076 ) == true then
			SetFlag( Player[i] , Flag , 1 )
		end
	end
	DelObj( OwnerID() )
	return false
end

function LuaQ_421067_AfterClick(item,count)

	if count > 0 then
		if CountBodyItem( OwnerID() , Item) >= count  then
			DelBodyItem( OwnerID() , Item , count )
			BeginPlot( TargetID() , "LuaQ_421067_0",0 )
			return 1
		else
			return -1
		end
	else
		return -1
	end
end

function LuaQ_421067_0()
	local BombBox = LuaFunc_CreateObjByObj ( 111403 , OwnerID())
	Hide( OwnerID() )
	sleep(300)
	Delobj( BombBox )
	Show( OwnerID() , 0 )
end

Function LuaI_202281_Quest()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 421080,1 ));

	ShowBorder( OwnerID(), 421080, str , "ScriptBorder_Texture_Paper" )	

end

function LuaI_100764_0()

end