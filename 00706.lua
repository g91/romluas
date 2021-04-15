function LuaS_421159_0()

	if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541299 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_421159_1")   ); --/*我知道了，別打我...別打我...我說就是了。
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_2"),  "LuaS_421159_2",  0 ); --/*詢問奧圖
	else		
		LoadQuestOption( OwnerID() );
		if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541299 ) == false then
			AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_0"),  "LuaS_421159_1",  0 ); --/*將茜妮的話告訴奧圖
		end
	end
end

function LuaS_421159_1()
	SetSpeakDetail( OwnerID(), GetString("SC_421159_3")   );
	--/*什麼不尋常的東西？我才沒有碰什麼東西！混帳！
	--/*你們這些黑曜騎士團的走狗！黑曜騎士團算什麼？
	--*抓一堆人去死還不是打不贏獨眼巨人，只會在鎮裡頤指氣使，現在還可以隨便就懷疑人啊！
	if CheckAcceptQuest( OwnerID() , 421159 ) == true and CheckFlag( OwnerID() , 541296 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SC_421159_4"),  "LuaS_421159_3",  0 ); --/*用武力讓奧圖冷靜
	end
end

function LuaS_421159_2()
	SetSpeakDetail( OwnerID(), GetString("SC_421159_5")   );
	--/*我真的沒有發現什麼奇怪的東西。
	--/*不過...龍牙冰湖湖底的泥沙混著一些熔渣，我最近常常偷偷撈那些熔渣起來...
	--/*那些熔渣的味道讓我很難受，但是裡面有一些金屬可以提煉出來，我就把黑曜
	--/*騎士團配給的金屬偷偷藏起來，用這些金屬偷幫他們修補盔甲...
	--/*這就是全部了！要怎麼處罰我都接受！但別再找人來打我了...
	SetFlag( OwnerID() , 541296 , 1 )
end

function LuaS_421159_3()
	CloseSpeak(OwnerID())
	DisableQuest( TargetID() , true )

	BeginPlot( TargetID() , "LuaS_421159_4" , 0 )
end

function LuaS_421159_4()
	local GreenOtto,Player=OwnerID(),TargetID();
	Hide( GreenOtto )
	local GetLoc=function(GUID_or_FlagID,FlagNum)
		local x,y,z,dir
		if	FlagNum==nil	then
			--Obj
			local Obj = GUID_or_FlagID;
			x=ReadRoleValueFloat(Obj,EM_RoleValue_X);
			y=ReadRoleValueFloat(Obj,EM_RoleValue_Y);
			z=ReadRoleValueFloat(Obj,EM_RoleValue_Z);
			dir=ReadRoleValueFloat(Obj,EM_RoleValue_Dir);
		else
			--Flag
			local FlagID = GUID_or_FlagID
			x=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X);
			y=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Y);
			z=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z);
			dir=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Dir);
		end
		return x,y,z,dir;
	end
	local UnKnowValue=EM_RoleValue_PID;
	WriteRoleValue( GreenOtto , UnKnowValue , 10 )
	MoveToFlagEnabled( GreenOtto , false )
	local x,y,z,dir=GetLoc(GreenOtto)
	local RedOtto=CreateObj(100736,x,y,z,dir,1);
	AddtoPartition(RedOtto,0);
	SetAttack( RedOtto, Player )
	SetPlot( RedOtto , "dead" , "LuaS_421159_dead" , 0 )
	CallPlot( RedOtto , "LuaFunc_Obj_Suicide" , 10 ) 
	Say( RedOtto , "[SC_421159_7]" ) --/*講打啊？來啊！
	while true do
		sleep(10)
		if CheckID(RedOtto)==false or HateListCount(RedOtto)==0 or ReadRoleValue(RedOtto,EM_RoleValue_IsDead)==1 then
			break;
		end
		x,y,z,dir=GetLoc(RedOtto);
	end
	SetPos( GreenOtto , x,y,z,dir )
	Show( GreenOtto , 0 )
	local DBID = ReadRoleValue( Player, EM_RoleValue_DBID ) 
	if Luafunc_Player_Alive( Player,DBID,250 ) == true and ReadRoleValue( Player, EM_RoleValue_IsDead) ~= 1 and CheckFlag( Player , 541299 ) == true then
		Say( GreenOtto , "[SC_421159_6]" ) --/*別打了！別打了！我說就是了。
		PlayMotion( GreenOtto ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	end
	sleep(50)
	WriteRoleValue( GreenOtto , UnKnowValue , 0 )
	MoveToFlagEnabled( GreenOtto , true )
	DisableQuest( GreenOtto , false )
end

function LuaS_421159_dead()

	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckAcceptQuest( TargetID() , 421159 ) == true then 
		SetFlag( TargetID() , 541299, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_421159_Reset()
	LuaFunc_Obj_Suicide(10)
end