function LuaYU_111800_0()
	DisableQuest( OwnerID() , false )
	CloseSpeak( OwnerID() )
	SetCursorType( OwnerID() , 1)
	SetPlot( OwnerID(),"touch","LuaYU_111800_1",80 )
	DisableQuest( OwnerID() , true )
end

function LuaYU_111800_1()  
	SetPlot( TargetID(),"touch","",0 )
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(),"LuaYU_111800_2",0) 
end

function LuaYU_111800_2()  
	CloseSpeak( TargetID() )
	DisableQuest( OwnerID() , true )

	local NumDay = ReadRoleValue(OwnerID() , EM_RoleValue_PID ) --每日重置旗標
	local Title = NumDay - 69	--稱號收集旗標

	local Save01 =  CheckFlag( TargetID()  , Title )   --稱號收集
	local Save02 =  CheckFlag( TargetID()  , NumDay )   --每日重置
	local Oil =  CountBodyItem( TargetID() , 203475 )  --特調豬油溶液
	local LD = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 


	if LD == 5168 and  Save01 == false and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...準備好喔！我要丟豬油了！
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --投擲
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --檢查目前是否有此buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --哇～太好了，我開始有滑動的感覺！
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --謝謝你的幫忙！請收下這個禮物吧！
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --啊...對了...我是在煙囪上看風景不是卡住喔...！
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --暖冬禮盒
			SetFlag( TargetID()  , Title , 1 )  --給旗標(稱號收集)
			SetFlag( TargetID()  , NumDay , 1 )  --給旗標(每日重置)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --咦...假動作喔！不是說要丟豬油了...害我緊張了一下...。
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end

	elseif LD == 5168 and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...準備好喔！我要丟豬油了！
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --投擲
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --檢查目前是否有此buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --哇～太好了，我開始有滑動的感覺！
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --謝謝你的幫忙！請收下這個禮物吧！
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --啊...對了...我是在煙囪上看風景不是卡住喔...！
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --暖冬禮盒
			SetFlag( TargetID()  , NumDay , 1 )  --給旗標(每日重置)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --咦...假動作喔！不是說要丟豬油了...害我緊張了一下...。
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end


	elseif Save01 == false and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --你是必爾汀叔叔嗎？
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --我不是我不是，你認錯人了！我只是覺得煙囪上很溫暖，來這裡看風景而已...。
		PlayMotion( OwnerID() , 122)    
		sleep(40)
		Say( TargetID() , GetString("SC_111584_YU_18") )  --這樣呀...那[111584]要我去救的那個被卡在煙囪上的必爾汀叔叔在哪裡呢...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_19") .. "|r" )  --啊！是我是我就是我！快來救我～！
		PlayMotion( OwnerID(), 120)    
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_20") )  --...你剛剛不是說你不是...
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...準備好喔！我要丟豬油了！
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --投擲
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --檢查目前是否有此buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --哇～太好了，我開始有滑動的感覺！
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --謝謝你的幫忙！請收下這個禮物吧！
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --啊...對了...我是在煙囪上看風景不是卡住喔...！
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --暖冬禮盒
			SetFlag( TargetID()  , Title , 1 )  --給旗標(稱號收集)
			SetFlag( TargetID()  , NumDay , 1 )  --給旗標(每日重置)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --咦...假動作喔！不是說要丟豬油了...害我緊張了一下...。
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end
	
	elseif Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --你是必爾汀叔叔嗎？
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --我不是我不是，你認錯人了！我只是覺得煙囪上很溫暖，來這裡看風景而已...。
		PlayMotion( OwnerID() , 122)    
		sleep(40)
		Say( TargetID() , GetString("SC_111584_YU_18") )  --這樣呀...那[111584]要我去救的那個被卡在煙囪上的必爾汀叔叔在哪裡呢...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_19") .. "|r" )  --啊！是我是我就是我！快來救我～！
		PlayMotion( OwnerID(), 120)    
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_20") )  --...你剛剛不是說你不是...
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...準備好喔！我要丟豬油了！
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --投擲
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --檢查目前是否有此buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --哇～太好了，我開始有滑動的感覺！
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --謝謝你的幫忙！請收下這個禮物吧！
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --啊...對了...我是在煙囪上看風景不是卡住喔...！
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --暖冬禮盒
			SetFlag( TargetID()  , NumDay , 1 )  --給旗標(每日重置)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --咦...假動作喔！不是說要丟豬油了...害我緊張了一下...。
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end

	elseif Save02 == false and Oil > 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --你是必爾汀叔叔嗎？
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --我不是我不是，你認錯人了！我只是覺得煙囪上很溫暖，來這裡看風景而已...。
		PlayMotion( OwnerID(), 122)    
		sleep(40)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_22") .. "|r" )  --看你包包好像都滿了，背那麼重還能上來屋頂呀...。
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

	elseif Save02 == true and Oil > 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_30") )  --你...又卡住了呀...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_24") .. "|r" )  --哈哈哈...是你呀...我剛剛想說把外套脫下來再試試看，沒想到還是卡住了！哈哈哈！不能再麻煩你了啦！我自己想辦法！
		PlayMotion( OwnerID(), 121) 
		sleep(10)
		PlayMotion( OwnerID(), 121) 
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 


	else
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --你是必爾汀叔叔嗎？
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --我不是我不是，你認錯人了！我只是覺得煙囪上很溫暖，來這裡看風景而已...。
		PlayMotion( OwnerID(), 122)    
		sleep(30)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_23") .. "|r" )  --如果你方便的話幫我到凡瑞娜絲城中央廣場找湯尼球卡告訴他我在煙囪上等他來聊天看風景...請他快點來！
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 	

	end	

end