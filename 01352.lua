
function LuaS_G5_Weapon_CHECK()
	if CheckFlag( OwnerID() , 543200 ) == true then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_G5WEAPON_01]"  , C_DEFAULT )	-- 畫面中間訊息：你並未獲得認同，隱藏在這把武器裡的靈魂拒絕你的呼喚！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_G5WEAPON_01]" , 0 )		-- 你並未獲得認同，隱藏在這把武器裡的靈魂拒絕你的呼喚！
		return false
	end
end

function LuaS_205810_CHECK()
	return true
end

function LuaS_205810_DO()
	CastSpell( OwnerID() , OwnerID() , 493800 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_G5WEAPON_02]"  , C_SYSTEM )	-- 畫面中間訊息：你獲得菲恩洛斯的認同，往後你可以這把武器呼喚出菲恩洛斯！
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_G5WEAPON_02]" , 0 )		-- 你獲得菲恩洛斯的認同，往後你可以這把武器呼喚出菲恩洛斯！
	SetFlag( OwnerID() , 543200 , 1 ) 
end

function LuaI_G52_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
	SetShop( OwnerID() , 600163 , "Test_Shop_Close" )	-- 基．霍斯
end
--SC_G5WEAPON_03你隱約的可以感受到裡面有一匹躍動的靈魂在奔馳著...
function LuaS_113397()	-- 基．霍斯
	if
	CountItem( OwnerID() , 211943 ) >= 1 or
	CountItem( OwnerID() , 211944 ) >= 1 or
	CountItem( OwnerID() , 211945 ) >= 1 or
	CountItem( OwnerID() , 211946 ) >= 1 or
	CountItem( OwnerID() , 211947 ) >= 1 or
	CountItem( OwnerID() , 211948 ) >= 1 or
	CountItem( OwnerID() , 211949 ) >= 1 or
	CountItem( OwnerID() , 211950 ) >= 1 or
	CountItem( OwnerID() , 211951 ) >= 1 or
	CountItem( OwnerID() , 211952 ) >= 1 or
	CountItem( OwnerID() , 211953 ) >= 1 or
	CountItem( OwnerID() , 211954 ) >= 1
	then
		SetFlag( OwnerID() , 543202 , 1 )
	end

	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckFlag( OwnerID() , 543202 ) == true then
		if CheckCompleteQuest( OwnerID() , 422660 ) == true then
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_G5WEAPON_04]" , "LuaS_G52_OpenShop", 0 )	-- 關於菲恩洛斯的配方
		end
	end
end

function LuaS_G52_OpenShop()	-- 橘武二階配方
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	OpenShop()			-- 打開商店
end