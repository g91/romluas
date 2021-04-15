-----------------------------------------------------------------------------
--Z27_南提村
-----------------------------------------------------------------------------
-----------------------------------------------------426519友好表示一：美味烤肉
--122825 烤肉架
--242924 狼腿肉(目標:10)
--對其使用狼腿肉(目標:10)(NPC:108132)
function lua_Z27Q426519_1()
	if CountBodyItem( OwnerID(),242924 ) > 0 then
		return true
	else
		--你沒有可以烤的東西
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426519_1]", 0 )
		return false
	end
end
function lua_Z27Q426519_2()
	--判斷用buff
	if CheckBuff( TargetID(),624726 )==false then
		CallPlot( TargetID(),"lua_Z27Q426519_3",OwnerID() )
		return 1
	else
		--肉還在烤著～
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426519_2]", 0 )
		return 1
	end
end
function lua_Z27Q426519_3( player )
	local num = Rand(50) +100
	AddBuff( OwnerID(),624726,0,num )
	if DelBodyItem( player,242924,1 ) then
		Sleep(10)
		--把肉片放到架子上，開始烤肉～
		ScriptMessage( OwnerID(), player, 2, "[SC_426519_3]", 0 )
		--Say( OwnerID(), "[SC_426519_3]" )
		Sleep(10)
		DW_QietKillOne( player,108132 )
		return 1
	end
end
-----------------------------------------------------426520友好表示二：種田樂
--122828 刺瓜田地
--242925 裝滿的水桶(目標:5)
--對其使用裝滿的水桶(目標:5)(NPC:108133)
function lua_Z27Q426520_1()
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(),242925 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426520_1]","lua_Z27Q426520_2",0)--灌溉田地！
		--你沒有可以用來灌溉的水
	end

end
function lua_Z27Q426520_2()
	CloseSpeak( OwnerID())
	--判斷用buff
	if CheckBuff( TargetID(),624726 )==false then
		CallPlot( TargetID(),"lua_Z27Q426520_3",OwnerID() )
		return 1
	else
		--已經灌溉過了～
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426520_2]", 0 )
		return 1
	end
end
function lua_Z27Q426520_3( player )
	local num = Rand(50) +100
	AddBuff( OwnerID(),624726,0,num )
	if DelBodyItem( player,242925,1 ) then
		Sleep(10)
		--將水桶內的水均勻的撒在田地上～
		ScriptMessage( OwnerID(), player, 2, "[SC_426520_3]", 0 )
		Sleep(10)
		DW_QietKillOne( player,108133 )
		return 1
	end
end
-----------------------------------------------------426522進行談判
--122832 本．肖恩
--242926 第七隊先發隊長親筆信函
--(旗標548353)把信送去給本．肖恩
function lua_Z27Q426522_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426522 )==true and CheckFlag( OwnerID() ,548353 )==false then
		if CountBodyItem( OwnerID(),242926 ) > 0 then--轉交第七隊先發隊長的信件
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426522_0]","lua_Z27Q426522_2",0 )
		else
			--你說隊長有信要給我？信在哪裡？
			SetSpeakDetail( OwnerID(), "[SC_426522_1]" )	
		end
	end
end
function lua_Z27Q426522_2()
	CloseSpeak( OwnerID())
	--對了，確實是隊長的親筆信函。
	SetSpeakDetail( OwnerID(), "[SC_426522_2]" )
	SetFlag( OwnerID(), 548353  ,1)
	DelBodyItem( OwnerID(),242926,1 ) 
end
-----------------------------------------------------426525見證人
--122835 利卜布
--122836 巴美露
--122837 拉里羅
function lua_Z27Q426525_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true  and  CheckFlag( OwnerID() ,548349 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_1_1",0 )--長老，族長要舉辦儀式，需要你在場。
	end
end
function lua_Z27Q426525_2()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true and CheckFlag( OwnerID() ,548350 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_2_1",0 )
	end
end
function lua_Z27Q426525_3()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true and CheckFlag( OwnerID() ,548351 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_3_1",0 )
	end
end
--給完成的旗標
--(旗標548349)
--(旗標548350)
--(旗標548351)
function lua_Z27Q426525_1_1()
	--呼嘎～儀式？知道了！馬上回去！
	--SetSpeakDetail( OwnerID(), "[SC_426525_1_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548349  ,1)
	CallPlot( OwnerID(),"lua_Z27_122835_1",0 )
end
function lua_Z27Q426525_2_1()
	--呼嘎～好久沒看到儀式，期待～！
	--SetSpeakDetail( OwnerID(), "[SC_426525_2_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548350  ,1)
	CallPlot( OwnerID(),"lua_Z27_122836_1",0 )
end
function lua_Z27Q426525_3_1()
	--呼嘎～真的有儀式？回去沒有，殺了你！
	--SetSpeakDetail( OwnerID(), "[SC_426525_3_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548351  ,1)
	CallPlot( OwnerID(),"lua_Z27_122837_1",0 )
end
--122841 利卜布離開消失
--122842 巴美露離開消失
--122843 拉里羅離開消失
function lua_Z27_122835_1()
	local newnpc = 122841
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122841_1]" )--呼嘎～有外敵，非常忙，怎麼突然要辦儀式。
		LuaFunc_moveToFlag( obj,781338,1,0 )
		DelObj( obj)
end
function lua_Z27_122836_1()
	local newnpc = 122842
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122842_1]" )--呼嘎～辦儀式好！大家心情都會好！
		LuaFunc_moveToFlag( obj,781338,2,0 )
		DelObj( obj)
end
function lua_Z27_122837_1()
	local newnpc = 122843
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122843_1]" )--呼嘎～狩獵期到了，肥美的食物還在等著我們，要快～
		LuaFunc_moveToFlag( obj,781338,3,0 )
		DelObj( obj)
end

-----------------------------------------------------426526友情象徵
--122822 羅傑爾．凱薩
--242930 呼嚕的友好證明
--取得呼嚕族族長的通行證明(旗標548352)
--將呼嚕的友好證明送交給羅傑爾．凱薩(旗標548356)
function lua_Z27Q426526_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426526 )==true and CheckFlag( OwnerID() ,548356 )==false then
		if CountBodyItem( OwnerID(),242930 ) > 0 then--轉交呼嚕的友好證明
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426526_0]","lua_Z27Q426526_2",0 )
		else
			--辛苦了，不過你說的證明在哪裡？
			SetSpeakDetail( OwnerID(), "[SC_426526_1]" )	
		end
	end
end
function lua_Z27Q426526_2()
	CloseSpeak( OwnerID())
	--讓我瞧瞧這得來不易的證明。
	SetSpeakDetail( OwnerID(), "[SC_426526_2]" )
	SetFlag( OwnerID(), 548352  ,1)
	SetFlag( OwnerID(), 548356  ,1)
	DelBodyItem( OwnerID(),242930,1 ) 
end





-----------------------------------------------------------------------------
--Z27 路人
-----------------------------------------------------------------------------
-----------------------------------------------------史塔克海盜團陪你說話
function lua_Z27m_Talk1()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk1_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk1_1()
	local num = Rand(5)+1
	--Say( OwnerID(),num)
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK1_"..num.."]")
end
-----------------------------------------------------法蘭克海盜團陪你說話
function lua_Z27m_Talk2()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk2_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk2_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK2_"..num.."]")
end
-----------------------------------------------------沒事幹的商人陪你說話
function lua_Z27m_Talk3()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk3_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk3_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK3_"..num.."]")
end

