function LuaI_110671_0()
	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 20000 ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) 


		local saymode = 1;

		while 1 do
			
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 10000 then
				sleep(1)
			else
				if ( saymode == 1 ) then
					Say( OwnerID() , GetString("SAY_110671_1") ) --/* 納達斯這傢伙，怎麼還不回來？真是氣死我了！
					saymode = 2;
				else
					Say( OwnerID() , GetString("SAY_110671_2") ) --/*這次回來一定要好好教訓他！		
					saymode = 1;
				end
			end

			sleep( 150 )

		end

end

function LuaS_110671()

	LoadQuestOption( OwnerID() );
	
	if  CountBodyItem(OwnerID(),200710) > 0 then --檢查身上的任務物品

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110671_1") , "LuaS_110671_1", 0 );--/*這是你兒子叫我給你的信。
	
	end
end	
	
function LuaS_110671_1()
	
	
	SetSpeakDetail( OwnerID(), GetString("ST_110671_1")   );--/*這是納達斯給我的信？他人在什麼地方？

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110671_2") , "LuaS_110671_2", 0 );--/*他說你看了信就知道了。

end

function LuaS_110671_2()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	DelBodyItem( OwnerID() , 200710 , 1 )--扣掉給帕拉斯的信200710
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 10000 ) 
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_110671_3" , 0 )
end

function LuaS_110671_3()

	MoveToFlagEnabled( OwnerID() , false )


	PlayMotion( OwnerID(), 131)--帕拉斯開信
	sleep( 40 )	

	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_110671"), C_SYSTEM );--畫面中央訊息：帕拉斯打開了信件，麻靈藥粉末散了開來。
	CastSpell( OwnerID(),OwnerID(),491004) -- 中毒特效
	sleep( 30 )
			
	Say( OwnerID() , GetString("ST_110671_2") )--說話：「奇怪？這是什麼味道...」
	sleep( 30 )
--	PlayMotionEX( OwnerID(), 12,13)--帕拉斯昏倒
	PlayMotion( OwnerID(), 12)--帕拉斯昏倒
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_110671_1"), C_SYSTEM );--畫面中央訊息：帕拉斯聞到麻靈菇粉末，昏倒在地…

	SetFlag( TargetID(), 540791, 1 );	--給予完成任務重要物品540791


	--45秒後，帕拉斯復活
	sleep( 450 )				
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( TargetID() ,false)
	LuaFunc_ResetObj( OwnerID() )


end
