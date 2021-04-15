--離開的路
function LuaS_Discowood_InstanceOutWay()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_8") , "LuaS_Discowood_InstanceOutOption", 0 ) --玩家選項：( 踏進這片光芒，回到凡瑞娜絲城…… )
end


function LuaS_Discowood_InstanceOutOption()
	CloseSpeak(OwnerID())
	BeginPlot(OwnerID(),"LuaS_Discowood_InstanceOut",0)
end

--秘境使者初始劇情

function LuaS_Discowood_InstanceManShop()
	SetShop( OwnerID() , 600121 , "Test_Shop_Close" )
end
--秘境使者
function LuaS_Discowood_InstanceTalk()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_1") , "LuaS_Discowood_InstanceTalk_1", 0 ) --玩家選項：我要怎麼重置秘境
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_2") , "LuaS_Discowood_InstanceTalk_2", 0 ) --玩家選項：我想進入秘境
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SO_110439_0") , "LuaS_110490_OpenShop", 0 ) --玩家選項：我想進入秘境
end

function LuaS_Discowood_InstanceTalk_1()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111284_3")   )--重置秘境的方法和重直副本相同，找個沒有副本進度的新隊長，請他邀請你加入隊伍，等他進入秘境之後再進入副本就可以了。如果你們想維持隊伍，將隊伍解散後，請新隊長重新組隊即可，隊長不可與之前相同。或是你確定隊伍中沒有任何人留在秘境當中，五分鐘之後秘境也會重置。
end

function LuaS_Discowood_InstanceTalk_2()
	if CountBodyItem(OwnerID() , 200392) > 0 then
		CloseSpeak(OwnerID())
		BeginPlot(OwnerID(),"LuaS_Discowood_InstanceTalk_3",0)
	else
		SetSpeakDetail ( OwnerID(), GetString ( "SC_111284_4" )   )--秘境不是說進去就能進去的好嗎？你要有入場券才行！
	end
end

function LuaS_Discowood_InstanceTalk_3()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_111284_5") )	-- 你確定要進入秘境嗎？你已經找好隊伍並確定秘境副本的進度了嗎？
	DialogSelectStr( OwnerID() , GetString("SC_111284_6") )			-- 是的，我確定！
	DialogSelectStr( OwnerID() , GetString("SC_111284_7") )			-- 我再想想……
	AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	local DoubleCheck = EnterInstance_Ask( OwnerID() )
	if DoubleCheck == "Yes" then
		if ChangeZone( OwnerID(), 200 , -1, 522 , 455 , 1087 , 3) then
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function EnterInstance_Ask( Player )

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- 防無窮迴圈，120 = 一分鐘
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			DialogClose( Player )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			else
				DialogResult = "Etc"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			end
		end
	end

	return DialogResult

end













