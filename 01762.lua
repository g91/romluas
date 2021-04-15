function LuaS_114353_0()
	local Zone = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
--DEBUGMSG(0,0,zONE.."!!"..aREA)
	local Flag = {}
	for i = 15 , 21 , 1 do
		Flag[i] = {}
	end
	Flag = {
			[15] = {[777] = 543704 } ,
			[16] = {[820] = 543705} ,
			[17] = {[923] = 544327} , 
			[18] = {[643] = 544624} ,
			[19] = {[522] = 544680} ,
			[20] = {[222] = 545465},
			[21] = {[333] = 545618}
			}
	if Zone > 99 or Zone < 15 then
		LoadQuestOption( OwnerID() )		
	else
		SetSpeakDetail( OwnerID() , "[SC_114353_0]" )
		--哼哼！去過那麼多地方，終於又回到這塊大陸了。
		--
		--喂！那邊的傢伙，老子今天心情好，你要做什麼就說吧！
		if CheckFlag( OwnerID() , Flag[Zone][Area] ) == false then
			SetFlag( OwnerID() , Flag[Zone][Area] , 1)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111256_OT]", C_SYSTEM );
		end
		if CheckFlag( OwnerID()  , 540001 ) == false then
			SetFlag( OwnerID()  , 540001 , 1 )
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_Q]" , "LuaS_114353_Q", 0 ); --傳送是什麼？
		if Zone == 15 and Area == 777 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_114353_BACK]" , "LuaS_114353_TIPS", 0 ); --你能將我送回[ZONE_YGGNO LAND]嗎？
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111256_S]" , "LuaS_114353_S", 0 ); --我要將回程術地點登記於此
		if CheckBuff( OwnerID() , 501638 ) == false then
			LuaS_Area_List_After9(Zone , Area,Flag)
		end
	end
end

function LuaS_114353_Q()

	SetSpeakDetail( OwnerID(), "[SC_114353_QD]");
	--呼～你在[ZONE_YGGNO LAND]那地方都沒學到東西啊？
	--老子就大發慈悲的再教你一次吧！
	--
	--記好囉！說到傳送就要想到艾力克研究團。
	--
	--你只需要記得這點就好了，呼～

	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACKTALK]" , "LuaS_114353_0", 0 ); 	--我想回到剛剛的對話

end

function LuaS_114353_S()

	local Zone = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Me = Role:new( OwnerID() )
	local Area = FindMapID( Me:X() , Me:Y() , Me:Z() )
	local Point = {}
	local Str = ""
	for i = 15 , 19 , 1 do
		Point[i] = {}
	end
	Point = {
			[15] = {[777]="[ZONE_DAELANIS]"} , 
			[16] = {[820] = "[ZONE_SOUTH_JENOTAR_FOREST]"} ,
			[17] = {[923]="[ZONE_NORTHERN_JANOST_FOREST]"} ,
			[18] = {[643]="[ZONE_LYMUN_KINGDOM]"} ,
			[19] = {[522]="[ZONE_CAMPBELL_TOWNSHIP]"} ,
			[20] = {[222] ="[ZONE_FIREBOOT_DWARF_FORTRESS]"},
			[21] = {[333] ="[ZONE_TORAGG_CARAVAN]"}
			}

	if Zone > 99 or Zone < 15 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if Point[Zone][Area] == nil then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	else
		Str = "[SC_TRANSFER_SAVEHOME_MEG][$SETVAR1="..Point[Zone][Area].."]"
	end
	
	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, Str  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在開墾聚落！
		ScriptMessage( OwnerID(), OwnerID(), 0, Str , 0 )	--您將回程地點登記在開墾聚落！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[ST_TRANSFER_FAIL]"  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[ST_TRANSFER_FAIL]" , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end

function LuaS_114353_TIPS()

	SetSpeakDetail( OwnerID(), "[SC_114353_TIPS]");
	--你把傳送當成很簡單的事情，嗯？
	--告訴你，別把從這塊大陸到另一塊大陸說的那麼簡單。
	--如果你真的想回去的話，我後面的城裡面有黑曜騎士團的人，最近他們常常往來這兩塊大陸。
	--去問問看那些傢伙吧！他們應該有辦法送你回去。

	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACKTALK]" , "LuaS_114353_0", 0 ); 	--我想回到剛剛的對話
	
end