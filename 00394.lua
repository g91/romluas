function LuaS_110055_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_1") , "LuaS_110055_1", 0 ) --/*嚎叫山簏與賢者之眼
	if CheckCompleteQuest( OwnerID() , 420087 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_2") , "LuaS_110055_2", 0 ) --/*羅格鎮與羅格
	end
	if CheckCompleteQuest( OwnerID() , 420083 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_3") , "LuaS_110055_3", 0 ) --/*皮爾拉諾克與羅格之死
	end
end

function LuaS_110055_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_1")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*回上一頁	
end

function LuaS_110055_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_2")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*回上一頁	
end

function LuaS_110055_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_3")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*回上一頁	
end

function LuaI_420067_0()--魔力聚集處初始劇情
	SetPlot( OwnerID() , "Range" , "LuaI_420067_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 490101 )  -- 出生後幫自己上特效魔法
end

function LuaI_420067_1()
	SetPlot( OwnerID() , "Range" , "LuaI_420067_B" , 200 )
end

function LuaI_420067_2()
	SetPlot( OwnerID() , "Range" , "LuaI_420067_C" , 200 )
end

function LuaI_420067_A()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_0"), 0 ); --/*水晶劇烈的振動著，這附近一定有強大的魔力源。
	end
end

function LuaI_420067_B()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_1"), 0 ); --/*水晶發出共鳴的嗡嗡聲，看來這裡充溢著魔力。
	end
end

function LuaI_420067_C()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_2"), 0 ); --/*水晶輕微的顫抖著，應該是已經偵測到一絲魔力了。
	end
end
function LuaI_200184()
	local MagicPlot = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110092 , 50 , 0)
	if MagicPlot ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_4"), 0 ); --/*需要魔力聚集處。
		return False		
	end
end

function LuaI_200184_Use()
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_3"), 0 ); --/*水晶吸收了附近的魔力，顏色慢慢轉變，並停止了振動。
	GiveBodyItem( OwnerID() , 200185 , 1 )
end

function LuaI_201075()
	if CountBodyItem( OwnerID() , 200169 ) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SAY_201075_1"), 0 ); --/*需要羅格之矛。
		return false
	end
end

function LuaI_201075_Use()
	DelBodyItem( OwnerID() , 200169 , 1 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SAY_201075_0"), 0 ); --/*符文從你手中消失，化為一道光芒纏繞著羅格之矛。
	GiveBodyItem( OwnerID() , 200190 , 1 )
end
--------------------------420088_瓦解魔力聚集_魔力聚集處-------------------------------------------------------
Function LuaQ_420088_ClickObj() 
	if CheckFlag( OwnerID() , 540210) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420088_1"), 0 ); --/*你已瓦解了魔力聚集。		
		return -1
	elseif CountBodyItem( OwnerID() , 200190 ) < 1  then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420088_0"), 0 ); --/*需要發光的羅格之矛。
		return -1
	else
		return 1
	end
end
---------------------------------------------------------------------------------------------------------------
Function LuaQ_420088_AfterClickObj() --點擊後觸發的劇情--有插動作，不可用已有的代替
	
	local Count = CountBodyItem( OwnerID(), 200190);

	if( Count >= 1) then
		DelBodyItem( OwnerID() , 200190 , 1 )
		BeginPlot( TargetID(),"LuaFunc_420088_Clear",0)
  		return 1;
	end

	return -1;
END
---------------------------------------------------------------------------------------------------------------
Function LuaFunc_420088_Clear() --只要拿掉原有特效即可，所以省略淨化的魔法以及動作
	SetPlot(OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
--	DisableQuest( OwnerID() , true )
	local Spider = {}
	local PlayerTeam = LuaFunc_PartyData(TargetID())
	for i = 1 , PlayerTeam[0] , 1 do
		if CheckAcceptQuest( PlayerTeam[i] ,420088 ) == true then
			SetFlag( PlayerTeam[i] , 540210 , 1 )
		end
	end 
	for i = 1 , 3 , 1 do
		Spider[i] = CreateObjByFlag ( 100030 , 780044, i ,1 )
		BeginPlot( Spider[i] , "LuaQ_420088_Sui" , 0 )
		AddToPartition( Spider[i] , 0 )
		SetAttack(Spider[i] , TargetID() )
	end
	SetPlot( Spider[1] , "dead" , "LuaQ_420088_Play" , 40 )
	while 1 do
		if CheckID(Spider[1]) == false and CheckID(Spider[2]) == false and CheckID(Spider[3]) == false then
			break
		else 
			sleep( 30 )
		end
	end
	
	sleep(300)--休息30秒，等待系統回復到可再次被點擊的狀態
	local Spear = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110492 , 50 , 0)

	if CheckID(Spear) then
		DelObj( Spear)
	end
	SetPlot(OwnerID(),"touch","",0)
--	DisableQuest( OwnerID() , false )
	CastSpell( OwnerID(),OwnerID(), 490101 ) --重新上原有的特效魔法
END

--------------------------------------------------------------------------------------------------------------
function LuaQ_420088_Sui() 
	LuaFunc_Obj_Suicide(50)
end	
---------------------------------------------------------------------
function LuaQ_420088_Play()
	local PlayerTeam = HateListCount( OwnerID() )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if CheckCompleteQuest(ID ,420083) == false and CountBodyItem(ID, 200191 ) == 0 then
			GiveBodyItem( ID , 200191 , 1 )
		end
	end 
	local Rog = CreateObjByFlag ( 110501 , 780044, 0 ,1 )
--	SetPlot( Rog , "touch" , "LuaFunc_Obj_Nothing" ,0 )
	DisableQuest( Rog , true )
	AddToPartition( Rog , 0 )
	BeginPlot( Rog , "LuaQ_420088_Play_0" , 0)
	return 1
end	
---------------------------------------------------------------------
function LuaQ_420088_Play_0()
	local MagicPlot = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110092 , 150 , 0)
	local Obj = Role:new(MagicPlot)
	local Spear = 0
	MoveToFlagEnabled( OwnerID() , False )
	WriteROleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	LuaFunc_WaitMoveTo( OwnerID(), Obj:X() , Obj:Y() , Obj:Z() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_OH_PIERCE )
	sleep( 30 )
	Spear = LuaFunc_CreateObjByObj ( 110492 , MagicPlot )
	if CheckID( Spear ) == true then
		SetModeEx( Spear , EM_SetModeType_Mark, false) 
		SetModeEx( Spear, EM_SetModeType_HideName, false) 
		SetModeEx( Spear, EM_SetModeType_ShowRoleHead, false) 
	end
	CancelBuff( MagicPlot, 500900 );--清掉原有的特效BUFF
	DelObj(OwnerID() )
end
---------------------------------------------------------------------
function LuaS_200191_0() --羅格的骨骸

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420083, 1  ) );

	ShowBorder( OwnerID(), 420083, "[200191]", "ScriptBorder_Texture_Paper" );	

end
