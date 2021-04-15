function LuaSpeak_110377()

	-- 設定對話內容
		SetSpeakDetail( OwnerID(), "SD_110377_1"   );--#你好！你想學習挖礦嗎？
							     --#挖礦可以很賺錢呦～
							     --#你看我，不是一副有錢的樣子嗎？	
	
	-- 加入對話選項
		-- 加入學習採礦
		local MaxLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_Mining );
		
		if( MaxLV == 0 ) then

			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_1" , "LuaSO_110377_1", 0 );--#請教我挖礦
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_4" , "LuaSO_110377_LEAVE", 0 );--#我再考慮看看
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_6" , "LuaSO_110377_LEAVE", 0 );--#我早就會了
		
		end

		


end





--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110377_1()

	-- 學習採礦

	SetSpeakDetail( OwnerID(), "SD_110377_2"   );--#想要挖礦，除了要有良好的體力外，還要有不怕吃苦的精神。你準備好了嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_2", 	"LuaSO_110377_2", 	0 );	-- 是 --#我準備好了！
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_3", 	"LuaSO_110377_LEAVE", 	0 );	-- 否 --#那我不學了！

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110377_2()
	SetSpeakDetail( OwnerID(), "SD_110377_3"   );--#你現在可以挖礦了！
						     --#在我後方有個坑道，裡面有些初級的礦物，你可以去挖挖看。
						     --#但是記得先裝備上我給你的挖礦工具。
	SetScriptFlag( OwnerID(), 540069, 1 );	-- 給予初級挖礦原資格
	GiveBodyItem ( OwnerID(), 210371, 1 ) -- 給予挖礦工具  Ex: GiveBodyItem( OwnerID(), 210368, 1 );
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_5", 	"LuaSO_110377_LEAVE", 	0 );	--#謝謝你！再見！
end
--------------------------------------------------------------------------------------------------------------------------


function LuaSO_110377_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------