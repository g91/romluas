function LuaI_100459()
	Say( OwnerID() , GetString("SAY_100459_1") ) --/* 克里夫那個笨蛋…怎麼還不來？ --改STRING1
end

	

function LuaI_100459_0() --改100459
			Say( OwnerID() , GetString("SAY_100459_2") ) --/* 如果凡瑞娜絲城警備隊有人過來的話，就麻煩了… --改STRING2	
end

function LuaS_100459_0()

	SetSpeakDetail( OwnerID(), GetString("ST_100459_0")   );
	--/*你想幹什麼？快走開！！
	if CheckAcceptQuest( OwnerID() ,420464 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_1") , "LuaS_100459_1", 0 ); --/*就是你強迫海倫夫人簽約的嗎？
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_3") , "LuaS_100459_EXIT", 0 ); --/*（還沒準備好，還是先離開吧！）
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_0") , "LuaS_100459_EXIT", 0 ); --/*（這個人好兇...）
	end
end

function LuaS_100459_1()
	SetSpeakDetail( OwnerID(), GetString("ST_100459_1")   );
	--/*想不到那老太婆把這件事告訴你了，我警告你不要多管閒事啊！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_2") , "LuaS_100459_2", 0 ); --/*快把契約還給海倫夫人，她不是自願的！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_3") , "LuaS_100459_EXIT", 0 ); --/*（還沒準備好，還是先離開吧！）
end

function LuaS_100459_2()
	CloseSpeak(OwnerID())
	Say( TargetID() , GetString("ST_100459_2") ) --/*你好大的膽子，看我怎麼教訓你！！ --改STRING3
	BeginPlot(TargetID() , "LuaFunc_420464_Reset" , 0 )
end

function LuaS_100459_EXIT()
	CloseSpeak(OwnerID())
end

Function LuaFunc_420464_Reset()
	MoveToFlagEnabled( OwnerID() , False )
	local Obj = Role:new( OwnerID() ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();

	Hide( OwnerID() )
	local Farmer = CreateObj(100459, BaseX, BaseY, BaseZ, BaseDir, 1 )		
	AddToPartition( Farmer, 0 )
	SetAttack( Farmer , TargetID())
	sleep(60)
	while 1 do
		if ReadRoleValue( Farmer , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Farmer) == true then  --檢查是否離開戰鬥
			sleep(60)	-- 六秒檢查一次	
		else
			if CheckID( Farmer) == true and ReadRoleValue(Farmer,EM_RoleValue_IsDead) == 0 then
				DelObj( Farmer )
			end 
			sleep( 300 )
			Show( OwnerID() , 0 )
			MoveToFlagEnabled( OwnerID() , True )
			break		
		end
	sleep(1)
	end
end