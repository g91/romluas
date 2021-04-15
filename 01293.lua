---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_112582_0() --²ú®R¡D¨U·ç©i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600187 , "Test_Shop_Close" ); --ºaÅAñZ¥Ò°Ó©±
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_ANGRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
		sleep(1)
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		Say(OwnerID(),"[SC_112582_0]")
		sleep(1800)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_112583_0() --±ö®æ¡D¨U·ç©i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600188 , "Test_Shop_Close" ); --ºaÅAÂê¥Ò°Ó©±
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_ANGRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
		sleep(1)
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		Say(OwnerID(),"[SC_112582_1]")
		sleep(1800)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_112584_0() --¨Ø¸¦¡D¨U·ç©i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600217 , "Test_Shop_Close" ); --ºaÅA¥Ö¥Ò°Ó©±
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_ANGRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
		sleep(1)
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		Say(OwnerID(),"[SC_112582_2]")
		sleep(1800)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_114370_0() --µáº¸¡D¨U·ç©i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor )
	SetShop( OwnerID() , 600218 , "Test_Shop_Close" ); --ºaÅA¥¬¦ç°Ó©±
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_114371_0() --ÄRµ·¡D¨U·ç©i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor )
	SetShop( OwnerID() , 600246 , "Test_Shop_Close" ); --ºaÅA¹¢«~°Ó©±
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_115407_0() --¯Ç¦è¡D¨U·ç©i¡A³]©w¤p¦a¹ÏIcon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat )
end

function LuaS_115407_1() --¯Ç¦è¡D¨U·ç©i¡A¹ï¸Ü¨ç¦¡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_115407_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_01]" , "YOYO_OreShop", 5 ) --ºaÅAÄq¥Û°Ó©±
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_02]" , "YOYO_WoodShop", 5 ) --ºaÅA¤ì§÷°Ó©±
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_03]" , "YOYO_HerbShop", 5 ) --ºaÅAÃÄ¯ó°Ó©±
end

function YOYO_OreShop() --ºaÅAÄq¥Û°Ó©±
	SetShop( TargetID() , 600134 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_WoodShop() --ºaÅA¤ì§÷°Ó©±
	SetShop( TargetID() , 600135 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_HerbShop() --ºaÅAÃÄ¯ó°Ó©±
	SetShop( TargetID() , 600136 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_115408_0() --¶®²úµ·¡D¨U·ç©i¡A³]©w¤p¦a¹ÏIcon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
end

function LuaS_115408_1() --¶®²úµ·¡D¨U·ç©i¡A¹ï¸Ü¨ç¦¡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_115408_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_04]" , "YOYO_HorseShop", 5 ) --ºaÅA§¤ÃM°Ó©±
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_05]" , "YOYO_SuppliesShop", 5 ) --ºaÅAª«¸ê°Ó©±
end

function YOYO_HorseShop() --ºaÅA§¤ÃM°Ó©±
	SetShop( TargetID() , 600457 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SuppliesShop() --ºaÅAª«¸ê°Ó©±
	SetShop( TargetID() , 600458 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_116048_0() --±ö¼Ö¸¦¡D¨U·ç©i¡A³]©w¤p¦a¹ÏIcon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat )
end

function LuaS_116048_1() --±ö¼Ö¸¦¡D¨U·ç©i¡A¹ï¸Ü¨ç¦¡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_116048_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_01]" , "YOYO_SpOreShop", 5 ) --ºaÅA¯S®íÄq¥Û°Ó©±
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_02]" , "YOYO_SpWoodShop", 5 ) --ºaÅA¯S®í¤ì§÷°Ó©±
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_03]" , "YOYO_SpHerbShop", 5 ) --ºaÅA¯S®íÃÄ¯ó°Ó©±
end

function YOYO_SpOreShop() --ºaÅA¯S®íÄq¥Û°Ó©±
	SetShop( TargetID() , 600459 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SpWoodShop() --ºaÅA¯S®í¤ì§÷°Ó©±
	SetShop( TargetID() , 600557 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SpHerbShop() --ºaÅA¯S®íÃÄ¯ó°Ó©±
	SetShop( TargetID() , 600558 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_116049_0() --©_ÄR¶®¡D¨U·ç©i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600247 , "Test_Shop_Close" ); --ºaÅA°t¤è°Ó¤H
end