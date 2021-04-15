---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_112582_0() --���R�D�U��i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600187 , "Test_Shop_Close" ); --�a�A�Z�Ұө�
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
function LuaS_112583_0() --����D�U��i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600188 , "Test_Shop_Close" ); --�a�A��Ұө�
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
function LuaS_112584_0() --�ظ��D�U��i
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600217 , "Test_Shop_Close" ); --�a�A�֥Ұө�
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
function LuaS_114370_0() --�Ẹ�D�U��i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor )
	SetShop( OwnerID() , 600218 , "Test_Shop_Close" ); --�a�A����ө�
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_114371_0() --�R���D�U��i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor )
	SetShop( OwnerID() , 600246 , "Test_Shop_Close" ); --�a�A���~�ө�
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_115407_0() --�Ǧ�D�U��i�A�]�w�p�a��Icon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat )
end

function LuaS_115407_1() --�Ǧ�D�U��i�A��ܨ禡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_115407_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_01]" , "YOYO_OreShop", 5 ) --�a�A�q�۰ө�
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_02]" , "YOYO_WoodShop", 5 ) --�a�A����ө�
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_03]" , "YOYO_HerbShop", 5 ) --�a�A�į�ө�
end

function YOYO_OreShop() --�a�A�q�۰ө�
	SetShop( TargetID() , 600134 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_WoodShop() --�a�A����ө�
	SetShop( TargetID() , 600135 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_HerbShop() --�a�A�į�ө�
	SetShop( TargetID() , 600136 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_115408_0() --�������D�U��i�A�]�w�p�a��Icon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
end

function LuaS_115408_1() --�������D�U��i�A��ܨ禡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_115408_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_04]" , "YOYO_HorseShop", 5 ) --�a�A���M�ө�
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_05]" , "YOYO_SuppliesShop", 5 ) --�a�A����ө�
end

function YOYO_HorseShop() --�a�A���M�ө�
	SetShop( TargetID() , 600457 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SuppliesShop() --�a�A����ө�
	SetShop( TargetID() , 600458 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_116048_0() --���ָ��D�U��i�A�]�w�p�a��Icon
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat )
end

function LuaS_116048_1() --���ָ��D�U��i�A��ܨ禡
	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_116048_SPEAK]" )
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_01]" , "YOYO_SpOreShop", 5 ) --�a�A�S���q�۰ө�
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_02]" , "YOYO_SpWoodShop", 5 ) --�a�A�S�����ө�
	AddSpeakOption( Owner , Target , "[SC_HONORSHOPS_03]" , "YOYO_SpHerbShop", 5 ) --�a�A�S���į�ө�
end

function YOYO_SpOreShop() --�a�A�S���q�۰ө�
	SetShop( TargetID() , 600459 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SpWoodShop() --�a�A�S�����ө�
	SetShop( TargetID() , 600557 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end

function YOYO_SpHerbShop() --�a�A�S���į�ө�
	SetShop( TargetID() , 600558 , "" )
	CloseSpeak( OwnerID() )
	OpenShop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_116049_0() --�_�R���D�U��i
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600247 , "Test_Shop_Close" ); --�a�A�t��ӤH
end