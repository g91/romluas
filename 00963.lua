function yuyu_111575flag_00()      
	local Owner = OwnerID()           --小安妮                        
	SetPlot( Owner,"touch","yuyu_111575flag_01",40 )
	ScriptMessage(Owner , 0 , 1 , "[SC_111575_FLAG_6]" , C_SYSTEM )
	Say( Owner , "[SC_111575_FLAG_6]" )  
end

function yuyu_111575flag_01()  
	local Owner = OwnerID() --玩家
	local Target = TargetID() --小安妮
	local Softsweets01 =  CountBodyItem( Owner , 203138 )   --高級
	local Softsweets02 =  CountBodyItem( Owner , 203139 )   --普通
	local Softsweets03 =  CountBodyItem( Owner , 203140 )   --奇怪
	local Softsweets = Softsweets01 + Softsweets02 + Softsweets03
	local room = ReadRoleValue(Target, EM_RoleValue_RoomID )
	SetPlot( Target ,"touch", " "  ,40 )
	AdjustFaceDir(Target, Owner, 0 )   --安妮轉向面對玩家

	sleep(10)
	PlayMotion( Target, 122)                                  --表演動作 122代表 idle03

	ScriptMessage(Target , 0 , 1 , "[SC_TRICK_OR_TREAT]" , C_SYSTEM ) --不給糖，就搗蛋！
	Say( Target , "[SC_TRICK_OR_TREAT]" )  --不給糖，就搗蛋！

	sleep(20)

	if Softsweets > 0 then --檢查身上有軟糖
		tell( Owner ,Target, "[SC_111575_FLAG_0]" )   --密語   受話人,發話人,string
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_0]" , C_SYSTEM ) --嘻～哇～你的包包裡面有軟糖耶～我看看這個好不好吃～
	else --身上沒有軟糖
		tell(Owner,Target, "[SC_111575_FLAG_4]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_4]" , C_SYSTEM ) --想和我玩要先去城下西區找我姐姐小安娜呀！吼～我要搗蛋！
		sleep(20)
		CastSpell( Target, Owner, 491983)
		sleep(30)
		BeginPlot( Target , "Lua_na_littleAnn_position" , 0 ) --產生新的小安妮
		return
	end

	sleep(20)
	PlayMotion( Target, 120)                                  --表演動作 120代表 idle02

	if Softsweets01 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_1]" )   --密語   受話人,發話人,string
		ScriptMessage(Target , Owner  , 1 , "[SC_111575_FLAG_1]" , C_SYSTEM ) 	--哇～好好吃喔！好棒好棒！好高級的軟糖！嘻～那麼這個禮盒就給你囉～

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203138 , 1 )
			GiveBodyItem( Owner , 203142  , 1 )   --需要商城鑰匙的禮盒
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM )  --嗚～人家想多送你一個東西可是你的包包沒有位置了啦～
		end

	elseif  Softsweets02 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_2]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_2]" , C_SYSTEM ) 	--嘻～味道還不錯，那麼就給你這個小禮物吧！

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203139 , 1 )
			GiveBodyItem( Owner , 203141  , 1 )  --普通禮物
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM ) 	--嗚～人家想多送你一個東西可是你的包包沒有位置了啦～
		end

	elseif  Softsweets03 > 0 then
		sleep(20)
		tell(Owner,Target, "[SC_111575_FLAG_3]" )   
		ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_3]" , C_SYSTEM )  --吼～好辣好酸～這是什麼奇怪的軟糖！不要欺負我～嗚嗚～咦...不過怎麼吃到後來甜甜的？
		CastSpell( Target, Owner, 491983)
		sleep(30)

		if EmptyPacketCount( Owner ) >= 1  and QueuePacketCount( Owner ) == 0 then			
			DelBodyItem( Owner , 203140 , 1 )
			GiveBodyItem( Owner , 203240 , 1 )  --補給藥水
		else
			sleep(10)
			tell(Owner,Target, "[SC_111575_FLAG_5]" )   
			ScriptMessage(Target , Owner , 1 , "[SC_111575_FLAG_5]" , C_SYSTEM )  ----嗚～人家想多送你一個東西可是你的包包沒有位置了啦～
		end
	end
	sleep(20)
	BeginPlot( Target , "Lua_na_littleAnn_position" , 0 ) --產生新的小安妮
end



function Lua_na_littleAnn_position()
	local Owner = OwnerID()
	local Z = Rand( 35)  --0~34 隨機旗標用值
	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register)  --讀取小安妮目前的位置
	local room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	if Z == Reg then
		Z = Z+1 
		if Z > 34 then  --如果Z=35，旗標只到34，所以將旗標號寫為0 
			Z = 0
		end
	elseif Z == 6 then
		if Reg ~= 7 then
			Z = 7;
		else
			Z = 8;
		end
	end

	local CCC= CreateObjByFlag( 101296, 780198 , Z , 1 )
	AddToPartition( CCC , room )                                                             
	WriteRoleValue( CCC, EM_RoleValue_Register , Z ) --寫進目前的位置
	WriteRoleValue( CCC, EM_RoleValue_PID , 0 ) --可以互動的開關
	local RegNew = ReadRoleValue( CCC , EM_RoleValue_Register)
	DebugMsg( 0,0,"Ann's Reg = " ..RegNew)
	Delobj( Owner )
end