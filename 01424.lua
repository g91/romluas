function LuaYU_TaiwanCCB2_01()

	AddBuff(  OwnerID(),  503217, 1, -1)

	While true do

		PlayMotion( OwnerID(), 125) 
		AddBuff( OwnerID() ,503012 ,1 ,5 ); --特效 

		sleep(50)
	end

end

function LuaYU_TaiwanCCB2_02()


	SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_01]"   )--親愛的冒險者您好，我是《天天領天天有效》活動大使 - 小橘，為了讓您在冒險的旅程中更加快速的成長！<CM>每天</CM>都歡迎您來向我領取<CM>冒險者專屬的禮物</CM>喔！讓我天天幫您加油！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_02]" , "LuaYU_TaiwanCCB2_03", 0 ) --我要領虛寶
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_03]" , "LuaYU_TaiwanCCB2_04", 0 ) --我要領坐騎
	
end


function LuaYU_TaiwanCCB2_03()

	local daylygift =  CheckFlag( OwnerID()  , 543286 ) --每日重置
	local Taiger =  CountItem( OwnerID() , 201928 ) --永久紫雷戰虎坐騎

	if daylygift == true then

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111577_YU_14]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_04]"   )--親愛的冒險者，您今天已經領取過<CM>冒險者專屬的禮物</CM>了喔！想必您今天肯定經歷過相當精彩又豐富的旅程，<CM>歡迎您明天再來向我領取！讓我為您加油！</CM>
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --回上一頁

	else

		GiveBodyItem( OwnerID() ,  203574  , 3 ) --高級經驗藥劑
		GiveBodyItem( OwnerID() ,  201610  , 6 ) --技能藥劑
		GiveBodyItem( OwnerID() ,  202322  , 3 ) --高效幸運藥劑
		SetFlag( OwnerID()  , 543286 , 1 ) --打開重置旗標

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWANCCB2_10]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_05]"   )--親愛的冒險者，您辛苦了！希望這份<CM>冒險者專屬的禮物</CM>能為您帶來快速的成長，讓您更深入的體驗更加豐富的冒險旅程！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --回上一頁


	end

end

function LuaYU_TaiwanCCB2_04()

	local daylygift =  CheckFlag( OwnerID()  , 543286 ) --每日重置
	local Taiger =  CountItem( OwnerID() , 201928 ) --永久紫雷戰虎坐騎

	if Taiger > 0 then

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_DAN_111700_20]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_06]"   )--騎乘著紫雷戰虎坐騎的您看起來十分的威武！您還喜歡嗎！？活動期間內每位冒險者都<CM>只能擁有一匹</CM>喔！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_08]" , "LuaYU_TaiwanCCB2_05", 0 ) --坐騎的使用方法
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --回上一頁

	else

		GiveBodyItem( OwnerID() ,  201928  , 1 ) --永久紫雷戰虎坐騎

		ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWANCCB2_11]".. "|r" , 0 ) --

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_07]"   )--勇猛的坐騎才能匹配勇敢的冒險者！活動期間內每位冒險者都可以擁有一匹勇猛的<CM>紫雷戰虎坐騎</CM>喔！讓他載著您加速探索更多的冒險旅程吧！
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_TAIWANCCB2_08]" , "LuaYU_TaiwanCCB2_05", 0 ) --坐騎的使用方法
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --回上一頁

	end

end

function LuaYU_TaiwanCCB2_05()

		SetSpeakDetail( OwnerID(), "[SC_TAIWANCCB2_09]"   )--親愛的冒險者，打開您的背包( 快捷鍵 B )找到坐騎：<CM>[201928]</CM>直接點擊<CM>滑鼠右鍵</CM>，就可以騎乘坐騎囉！這時候您在<CM>畫面的右上角<CM>將會出現該坐騎的效果圖示，要取消騎乘狀態，只需要針對<CM>坐騎的效果圖示</CM>點擊<CM>滑鼠右鍵</CM>，就可以取消騎乘狀態囉！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_TaiwanCCB2_02", 0 ) --回上一頁

end

function Yu_TaiwanNewPlayerPackage_01( Option )
	local PlayerID = OwnerID()
	local PackageID = 206000		--神諭之戰新手包
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then

			ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWAN_PACKAGE_01]".. "|r" , 0 ) --
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 202322 , 1 )	
		GiveBodyItem( PlayerID , 202264 , 1 )	
		GiveBodyItem( PlayerID , 202320 , 1 )	
		GiveBodyItem( PlayerID , 201139 , 1 )	
		GiveBodyItem( PlayerID , 203576 , 1 )	
		GiveBodyItem( PlayerID , 203044 , 2 )	
		GiveBodyItem( PlayerID , 203045 , 2 )	
		GiveBodyItem( PlayerID , 203336 , 1 )	

	end
end

function Yu_TaiwanNewPlayerPackage_02( Option )
	local PlayerID = OwnerID()
	local PackageID = 206001		--惡魔甦醒虛擬包
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then

			ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_TAIWAN_PACKAGE_01]".. "|r" , 0 ) --
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 202322 , 1 )	
		GiveBodyItem( PlayerID , 202319 , 1 )	
		GiveBodyItem( PlayerID , 202321 , 1 )	
		GiveBodyItem( PlayerID , 201139 , 2 )	
		GiveBodyItem( PlayerID , 203050 , 2)	
		GiveBodyItem( PlayerID , 203051 , 2 )	
		GiveBodyItem( PlayerID , 203052 , 2 )	
		GiveBodyItem( PlayerID , 203305 , 1 )	

	end
end