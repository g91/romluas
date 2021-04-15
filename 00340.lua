----------------------------------------------------------------------------
--快速設定裝備函式內容
----------------------------------------------------------------------------
function YoYo_WriteBodyEQ( EQPart , OrgObjID , Inherent1 , Inherent2 , Inherent3 , Inherent4 , Inherent5 , Inherent6 , Rune1 , Rune2 , Rune3 ,  Rune4 , Level , Tier )
	--設定裝備與階層
	if OrgObjID < 210000 or OrgObjID > 240000 then	--判斷裝備編號區間
		Say( OwnerID() , "OrgObjID Errors!! range between 210000 ~ 240000 " )	--錯誤訊息
	else
		SetRoleEq_Player( OwnerID() , EQPart , OrgObjID )
		--SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_OrgObjID , OrgObjID )	--修改裝備ID
		
		local EQLimitLv = GameObjInfo_Int( OrgObjID , "LimitLv" )	--取得該裝備的限制等級
		local EQTier = math.ceil( EQLimitLv / 20 )	--取得該裝備的階層
		--Say( OwnerID() , "EQLimitLv = " .. EQLimitLv .. " , EQTier = " ..  EQTier )
		
		if Tier <= EQTier or Tier > 20 then
			Say( OwnerID() , "Tier Errors!! This obj tier range between " .. EQTier .. " ~ 20 " )	--錯誤訊息
		else
			Tier = Tier - EQTier + 10
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_PowerQuality , Tier )	--修改階層
		end
	end	

	--設定附加能力
	local Inherent = { Inherent1 , Inherent2 , Inherent3 , Inherent4 , Inherent5 , Inherent6 }
	local InherentType = { EM_ItemValueType_Inherent1 , EM_ItemValueType_Inherent2 , EM_ItemValueType_Inherent3 , EM_ItemValueType_Inherent4 , EM_ItemValueType_Inherent5 , EM_ItemValueType_Inherent6 }
	for i = 1 , #Inherent do
		if Inherent[ i ] < 510000 or Inherent[ i ] > 520000 then
			if Inherent[ i ] ~= 0 then
				Say( OwnerID() , "Inherent" .. i .. " Errors!! range between 510000 ~ 520000 " )	--錯誤訊息
			else
				SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , InherentType[ i ] , 0 )	--修改附加能力 = 0
				Say( OwnerID() , "Inherent" .. i .. " = 0 " )
			end
		else
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , InherentType[ i ] , Inherent[ i ] )	--修改天生能力
		end
	end
	
	--設定符文
	local Rune = { Rune1 , Rune2 , Rune3 ,  Rune4 }
	local RuneType = { EM_ItemValueType_Rune1 , EM_ItemValueType_Rune2 , EM_ItemValueType_Rune3 , EM_ItemValueType_Rune4 }
	for i = 1 , #Rune do
		if Rune[ i ] < 520000 or Rune[ i ] > 530000 then
			if Rune[ i ] ~= 0 then
				Say( OwnerID() , "Rune" .. i .. " Errors!! range between 520000 ~ 530000 " )	--錯誤訊息
			else
				SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , RuneType[ i ] , 0 )	--修改符文 = 0
				Say( OwnerID() , "Rune" .. i .. " = 0 " )
			end
		else
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , RuneType[ i ] , Rune[ i ] )	--修改符文
		end
	end
	
	--設定精鍊等級
	if Level < 0 or Level > 20 then
		Say( OwnerID() , "PowerLv Errors!! range between 0 ~ 20 " )	--錯誤訊息
	else	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_Level , Level )	--修改精鍊等級
	end
	
	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_MaxDurable , 20000 )	--修改最大耐久度 = 200
	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_Durable , 20000 )	--修改耐久度 =200
end