
-------------掛在116269賽弗爾史奎普身上  以便玩家重複拿取指示信件--------------------
function LuaS_116269()
LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_1]", "Luas_116269_STORY_1", 0 )	--A1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_7]", "Luas_116269_STORY_3", 0 )
--	if	CheckCompleteQuest( OwnerID(), 423571 )==true and CountBodyItem ( OwnerID(), 208129 )==0 then 
		--當玩家解過423571返回達拉尼斯任務，且沒有指示信件 那麼
--		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_1", 0 )--我把信件弄丟了
--	end
	--if	CheckCompleteQuest( OwnerID(), 423568 )==false and CheckCompleteQuest( OwnerID(), 423513 )==true 
	--	and CountBodyItem ( OwnerID(), 208130 )==0 then 
		--當玩家沒有解過423568英雄再見任務但有解完裡線的423513潛於表面事物下的任務(此為裡線有解，表線沒解)
	--	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_1", 0 )--我把信件弄丟了
	--elseif 
	--	CheckCompleteQuest( OwnerID(), 423513 )==false and CheckCompleteQuest( OwnerID(), 423568 )==true 
	--	and CountBodyItem ( OwnerID(), 208129 )==0 then 
		--當玩家沒有解過423513潛於表面事物下的任務但有解完表線的423568英雄再見任務(此為表線有解，裡線沒解)
	--	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_1]", "Luas_116269_2", 0 )--我把信件弄丟了
	--end	
end

--function LuaS_116269_1()
--	SetSpeakDetail(OwnerID(),"[SC_116269_0]")
--	GiveBodyItem ( OwnerID(), 208130, 1 )--給的這封信是給表線沒解的玩家指示信件
--end

--function LuaS_116269_2()
--	SetSpeakDetail(OwnerID(),"[SC_116269_0]")
--	GiveBodyItem ( OwnerID(), 208129, 1 )--給的這封信是給裡線沒解的玩家指示信件
--end

function Luas_116269_STORY_1()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_2]")--Q1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_4]", "Luas_116269_STORY_2", 0 )--下一頁A2
end

function Luas_116269_STORY_2()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_5]")--Q2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_7]", "Luas_116269_STORY_3", 0 )--下一頁A3
end

function Luas_116269_STORY_3()	--
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_8]")--Q3
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_9]", "Luas_116269_STORY_3_1", 0 )--下一頁A3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_17]", "Luas_116269_STORY_3_2", 0 )--下一頁A3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_21]", "Luas_116269_STORY_3_3", 0 )--下一頁A3-3
end

function Luas_116269_STORY_3_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_10]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_11]", "Luas_116269_STORY_3_1_1", 0 )--下一頁A3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_1_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_13]")--Q3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_14]", "Luas_116269_STORY_3_1_2", 0 )--下一頁A3-1-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_1_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_15]")--Q3-1-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_18]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_19]", "Luas_116269_STORY_3_2_1", 0 )--下一頁A3-2-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_2_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_20]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_3()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_22]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_23]", "Luas_116269_STORY_3_3_1", 0 )--下一頁A3-3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_24]", "Luas_116269_STORY_3_3_2", 0 )--下一頁A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_3_1()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_25]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_24]", "Luas_116269_STORY_3_3_2", 0 )--下一頁A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end

function Luas_116269_STORY_3_3_2()
	SetSpeakDetail(OwnerID(),"[SC_116269_K_STORY_26]")--Q3-1
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_23]", "Luas_116269_STORY_3_3_1", 0 )--下一頁A3-3-2
	AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_116269_K_STORY_12]", "Luas_116269_STORY_3", 0 )--回到Q3
end