--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE() --說明
	
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE" )  );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁
	
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_LIVING_SAY() --生活技能說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_LIVING_SAY_NEW" )   );
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_LEARNING_SAY() --學習生活技能說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_LEARNING_SAY" )   );
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_GATHER_SAY() --小地圖顯示採集點說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_GATHER_SAY" )   );--你可以在小地圖上按右鍵，並在選單中選擇「採集點顯示」，然後勾選你所想要顯示的採集點（挖礦點、伐木點或採藥點）。

					                             --往後在你四處活動時，就可以在小地圖看到採集點的實際位置了。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_MINE()--精鍊說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_MINE" )   );

		--一般製造直接用挖出來的礦石就可以，但有些進階的製造需要純度更高的礦石，這個時候就需要冶煉了。

		--若你要精鍊礦石，需要在系統列中打開「生產製造」的介面，選擇「礦石精鍊」項目，然後再從列表中選擇你所要精鍊的礦石，只要你身邊有打鐵器具就可以精鍊礦石了。

		--記住喔！要進行礦石精鍊，必須先找到打鐵器具。

		--你剛剛已經學會了一些基本的礦石精鍊，而其他礦石的精鍊配方，可以向各處的礦工協會的成員購買。


	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_WOOD()--削製說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_WOOD" )   );

	--雖然剛砍下來的木頭本身便可製造不少物品，但好的木製產品還是需要對材料進行一些處理，這些處理就是削製。

	--我先教你刺槐與柳木的削製，等等你可以從系統列中打開「生產製造」的介面，選擇「木材削製」項目，然後再從列表中選擇你所要削製的木頭。

	--只要你的附近有木工器具，就可以把木頭削製成木材了。

	--削製好的木材，就可以用來製造一些木製的武器、防具或其他器具，不過想學製造的話就得要靠其他的專家了。

	--如果你要其他木材的削製配方，各處樵夫協會的成員都可以買得到。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_HERB()--提煉說明

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_HERB" )   );

	--藥草直接使用的效果有限，因此有些配方會要求品質更高的原料；為了獲得這些原料，我們需要學習如何提煉。

	--你已經學會了如何提煉苦葉草跟山魔楊草，接下來只要打開系統列中的「生產製造」介面，選擇「草藥提煉」項目，然後再從列表中選擇你所要提煉的草藥。只要你身邊有煉金器具就可進行草藥提煉了，等等就去試試看吧！

	--如果你還想學其他的草藥提煉，記得去找其他採藥人協會的成員，只要花一點點費用，他們都很願意將配方交給你喔～！


	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end