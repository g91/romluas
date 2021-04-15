------------------------------------------以下為初始劇情，讓魯安達隨機出現------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
function LuaI_110177_0()

	Local LuoPartition = Rand(4)
	local Luo = CreateObjByFlag(110177,780019,LuoPartition,1)
	AddToPartition( Luo , 0 )
	SetIdleMotion( Luo,ruFUSION_ACTORSTATE_SLEEP_LOOP )
	Sleep (30)
end
--------------------------------------------------以下為對話相關的劇情----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_0()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_0" )  );--/*別趕我～我還要喝～

--	if CheckFlag( OwnerID(),540330 ) == true and CheckFlag(OwnerID(),540331) == false then  --檢查是否完成任務的前半段
	if CheckFlag(OwnerID(),540331) == false and CheckAcceptQuest( OwnerID(), 420220 ) == true then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_1" ) , "LuaS_110177_1", 0 ) 
		--/*魯安達先生，請您起來，在這邊睡會感冒的！

	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_0" ) , "LuaS_110177_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_1()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_1" )   );
	--/*你是誰啊？我又在哪裡…？
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_2" ) , "LuaS_110177_2", 0 ) 
	--/*魯安達先生，是議長要我來找您的，請您趕緊回去。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_2()

	SetSpeakDetail( OwnerID(), GetString( "ST_110177_2" )  );
	--/*是這樣啊...我怎麼又喝醉了...頭痛的要命...一定是被那個狠心的酒吧老闆給摔的...
	--  這樣的糗態讓你看見真不好意思，我現在馬上就回去。
	--  謝謝你啊，年輕人～
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SO_110177_3" ) , "LuaS_110177_3", 0 ); --/*回去時請小心。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_3()

	CloseSpeak( OwnerID() );	--關閉對話視窗
--	SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( TargetID() , true )
	SetFlag( OwnerID(), 540331, 1 ); --給予完成任務的旗標
	BeginPlot( TargetID(),"LuaS_110177_4",10)	--呼叫其他函式

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_4()	--/*要演一段戲
	Sleep (5)
	PlayMotion (OwnerID() , ruFUSION_ACTORSTATE_SLEEP_End ) -- 讓魯安達起床
	Sleep (15)
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	-- 把醉漢名字改成魯安達，不行的話就改成置換NPC的方式，讓醉漢消失，召喚魯安達來進行動作
	for n = 1 , 3 do  -- 讓他在附近亂走一陣子
		Func_rand_walker(OwnerID(), 5 , 30 )
		Say ( OwnerID() , GetString("SAY_110177_0")) --/* 議會是往那邊？
		Sleep (30)

	end

	Say ( OwnerID() , GetString("SAY_110177_1")) --/* 對了，是往那個方向...
	Move( OwnerID() , 4346 ,53 , -604) --讓 NPC 朝一個固定方向前進，但不用到定點
	sleep (30) -- 時間到就重置 NPC
	Local LuoPartition = Rand(4)
	Hide( OwnerID()) --讓角色消失
	sleep(300)
	Show( OwnerID(), 0 )  --讓角色出現
	SetPosByFlag( OwnerID() , 780019, LuoPartition )--將角色移動到指定的旗號位置
	PlayMotionEX(  OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN ,ruFUSION_ACTORSTATE_SLEEP_LOOP )
	sleep( 30 )
--	SetPlot( OwnerID(),"touch","",40)
	DisableQuest( OwnerID() , false )
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110177_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end