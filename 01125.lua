function LuaI_VBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203649		--花仙子的浪漫禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 720301 , 1 )	
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724171 , 1 )	
		end

	end
end

--亞當

function LuaYU_112150_20()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_01]"   )--每年花神節的時候，玫瑰總是開得特別燦爛、艷麗～在這戀人們的節日裡，你是否願意付出你的真心、耐心來守護你的愛情呢？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "LuaYU_112150_21", 0 ) --花神節的由來
	AddSpeakOption( OwnerID(), TargetID(), "[SC_VALENTINE_BLESSING_1]" , "Lua_Valentine_blessing_talk", 0 ) --祈求花神的祝福
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_6") , "LuaS_112151_20", 0 ) --我想製作愛情巧克力

end

function LuaYU_112150_21()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   )--花神節的故事
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_20", 0 ) --確認

end

--騎乘動作

function LuaYU_112150_30()

	AddBuff( OwnerID() ,502558 ,1 ,-1 ); --騎乘獨角獸   		

end


--花神節活動 培植玫瑰活動測試指令

function Lua_flowerevent_every0()  --當天次數歸零
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_every10() --將當天次數+10
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 10 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_everyshow() --show出當天次數
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_total0()  --將活動期間總次數歸零
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , 0 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_total30() --將活動期間總次數+30
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , 30 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_totalshow()  --show出活動期間總次數
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time)
end
