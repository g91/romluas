function LuaFunc_WoundSoldier()
	local Talk = {}
	if ReadRoleValue( TargetID() , EM_RoleValue_Sex ) == 0 then
		Talk = {[1]="[SC_111164_MALE_01]" , [2]="[SC_111164_MALE_02]" , [3]="[SC_111164_MALE_03]", [4]="[SC_111164_MALE_04]", [5]="[SC_111164_MALE_05]"   }
	else
		Talk = {[1]="[SC_111164_FEMALE_01]" , [2]="[SC_111164_FEMALE_02]" , [3]="[SC_111164_FEMALE_03]", [4]="[SC_111164_FEMALE_04]", [5]="[SC_111164_FEMALE_05]"    }
	end
	local i = Rand(table.getn( Talk )) + 1
	SetSpeakDetail( OwnerID(), Talk[i] )	
end

function LuaS_111173_0()
	if CheckCompleteQuest( OwnerID() , 421166 ) == true or CheckAcceptQuest( OwnerID() , 421166 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_421166_0")   ); --/*你依然能夠看到我...不知道馬爾雷回來的時候，是否也能像你一樣能夠看到我、跟我說話...
	else
		LoadQuestOption( OwnerID() )
		if CheckCompleteQuest( OwnerID() , 421165 ) == true and CheckAcceptQuest( OwnerID() , 421166 ) == false then
			AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421166_1"),  "LuaS_111173_1",  0 ); --/*你忘記之前的事了嗎？
		end 
	end
end

function LuaS_111173_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_421165_Complete" , 0 )
end


function LuaQ_421165_Complete()
	local Disting = LuaFunc_CreateObjByObj ( 111174, OwnerID() )
	Hide( OwnerID() )
	sleep( 300 )
	Delobj( Disting )
	Show( OwnerID() , 0 )
end

function LuaS_111178_0()
	local Party = LuaFunc_PartyData(OwnerID())
	local Check = "NO"
	for i = 1 , Party[0] , 1 do
		if  CheckCompleteQuest( Party[i] , 421170 ) == false and CheckAcceptQuest( Party[i] , 421170 ) == true then
			Check = "YES"
		end 
	end  
	LoadQuestOption( OwnerID() )
	if Check == "YES" and ReadRoleValue( OwnerID() , EM_RoleValue_Sex ) == 1 then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421170_0"),  "LuaS_111178_1",  0 ); --/*親吻這隻青蛙
	end 
end
function LuaS_111178_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_111178_2" , 0 )
end
function LuaS_111178_2()
	local Party = LuaFunc_PartyData(targetID())
	Say( OwnerID() , GetString("SC_421170_1") ) --/*噢！YES！YES！就是這個！
	sleep( 10 )
	CastSpell( OwnerID() , OwnerID() , 490103 )
	sleep( 10 )
	Hide( OwnerID() )
	local Chris = LuaFunc_CreateObjByObj ( 111179, OwnerID() )
	Say( Chris , GetString("SC_421170_2") ) --/*太棒了！我變回原來的樣子了！
	for i = 1 , Party[0] , 1 do
		if  CheckCompleteQuest( Party[i] , 421170 ) == false and CheckAcceptQuest( Party[i] , 421170 ) == true then
			SetFlag(Party[i] , 541297 , 1 )
		end 
	end  	
	sleep( 300 )
	Say( Chris , GetString("SC_421170_3") ) --/*噢！拜託～不要又來了！
	CastSpell( Chris , Chris, 490103 )
	sleep( 10 )
	Delobj( Chris)
	Show( OwnerID() , 0 )

end

Function LuaI_202424_Quest()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetString("SC_202424_0"));
	AddBorderPage( OwnerID(), GetString("SC_202424_1"));
	AddBorderPage( OwnerID(), GetString("SC_202424_2"));
	AddBorderPage( OwnerID(), GetString("SC_202424_3"));
	AddBorderPage( OwnerID(), GetString("SC_202424_4"));

	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	

end
