

function LuaSpeak_110378()

	-- 設定對話內容
		SetSpeakDetail( OwnerID(), "SD_110378_1"   );--#今天的天氣真的很適合打鐵呢～
							     --#你想學打鐵嗎？
							     --#讓我們一起揮灑青春的汗水吧！	
	
	-- 加入對話選項
		-- 加入學習採礦
		local MaxLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_BlackSmith );
		
		if( MaxLV == 0 ) then
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_1" , "LuaSO_110378_1", 0 );--#請教我打鐵
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_6" , "LuaSO_110378_LEAVE", 0 );--#我早就會了

		end

		AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_4" , "LuaSO_110378_LEAVE", 0 );--#我再考慮看看


end





--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110378_1()

	-- 學習打鐵

	SetSpeakDetail( OwnerID(), "SD_110378_2"   );--#打鐵真是有益身心的活動，記得將來靠打鐵發達了，要好好回報我這個恩人。你準備好學打鐵了嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_2", 	"LuaSO_110378_2", 	0 );	-- 是 --#我準備好了！
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_3", 	"LuaSO_110378_LEAVE", 	0 );	-- 否 --#那我不學了！

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110378_2()
	SetSpeakDetail( OwnerID(), "SD_110378_3"   );--#你現在可以打鐵了！
						     --#我先無條件交你一兩個打鐵的方式，之後要學其他的打鐵製造，跟我買技能書就可以了。
						     --#打鐵的材料大多要靠挖礦收集，當然你也可以想辦法購買。
	SetScriptFlag( OwnerID(), 540068, 1 );	-- 給予打鐵實習生資格
	GiveBodyItem ( OwnerID(), 540085, 1 ) -- 給予技能：匕首
	GiveBodyItem ( OwnerID(), 540092, 1 ) -- 給予技能：輕劍
	GiveBodyItem ( OwnerID(), 540106, 1 ) -- 給予技能：鐵斧
	GiveBodyItem ( OwnerID(), 540110, 1 ) -- 給予技能：石塊
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_5", 	"LuaSO_110378_LEAVE", 	0 );	--#謝謝你！再見！
end
--------------------------------------------------------------------------------------------------------------------------


function LuaSO_110378_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------