function LuaS_112621_0() --要放到任務NPC 112621 海威．明斯頓 模板中對話劇情的函式，對話劇情的OwnerID()是玩家，TargetID()是NPC

	LoadQuestOption( OwnerID() ) --載入任務 NPC 的模板資訊(有這一段才會出現任務以及模板中的一般對話內容)

	if CheckAcceptQuest( OwnerID() , 422185 ) == true then --檢查是否已經接了任務 422185 大怪魚與漁夫
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_0]", "LuaS_112621_1",0 ); --產生對話選項，按了以後執行函式 LuaS_112621_1
		--/*對話選擇：（聽老漁夫講述關於鳴沙海岸過去的故事）
	end

	if CheckAcceptQuest( OwnerID() , 422188 ) == true then --檢查是否已經接了任務
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_2]", "LuaS_112621_2",0 ); --/*我想向您請教關於一種叫做馬蹄蟹的食材的事情
	end

	if CheckAcceptQuest( OwnerID() , 422192 ) == true then --檢查是否已經接了任務 
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_4]", "LuaS_112621_3",0 ); --/*聽老漁夫海威?明斯頓講述關於鳴沙漁夫們的傳說
	end
	if CheckAcceptQuest( OwnerID() , 422196) == true and CheckFlag( OwnerID() , 542507 ) == false then --檢查是否已經接了任務並且沒有得到旗標 542507 過 
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_6]", "LuaS_112621_4",0 ); --/*你考慮了一下，決定告訴他關於船隻被破壞的真相
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_7]", "LuaS_112621_5",0 ); --/*你清了清喉嚨，決定試著說服他先喝下那瓶酒
	end
	--/*預設就有離開對話選項
end

function LuaS_112621_1() --選項按下去之後要執行的函式，被對話選項呼叫的函式 OwnerID()是玩家，TargetID()是NPC

	SetSpeakDetail( OwnerID(), "[SC_112621_1]" ) --產生此頁對話內容的函式
	--/*當年，當鳴沙海岸的某一個漁夫；第一次在海裡發現這些大怪魚也會拿著魚網和魚叉抓魚的時候......（以下略）

	SetFlag( OwnerID() , 542504 , 1 ) --打開重要旗標542504， 0 是關閉 ， 1 是打開，只要一打開此頁就會執行

	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --產生一個選項，按了之後執行函式 LuaS_112621_0
	--/*返回上一頁
end

function LuaS_112621_2() 
	SetSpeakDetail( OwnerID(), "[SC_112621_3]" ) --/*食材？哈哈哈！我沒聽錯吧？竟然有人把馬蹄蟹當成食材？......（以下略）
	SetFlag( OwnerID() , 542505 , 1 ) --打開重要旗標
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*返回上一頁
end

function LuaS_112621_3() 
	SetSpeakDetail( OwnerID(), "[SC_112621_5]" ) --/*關於這個傳說，可是從很早之前就流傳下來的......（以下略）
	SetFlag( OwnerID() , 542506, 1 ) --打開重要旗標
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*返回上一頁
end

function LuaS_112621_4() 
	SetSpeakDetail( OwnerID(), "[SC_112621_8]" ) --/*（你將船隻遭到破壞以及麥朗的苦衷都告訴了這個老漁夫，這個老人靜靜的聽完你的敘述後，沉默了許久）......（以下略）
	SetFlag( OwnerID() , 542507, 1 ) --打開重要旗標
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*返回上一頁
end

function LuaS_112621_5() 
	SetSpeakDetail( OwnerID(), "[SC_112621_9]" ) --/*（老漁夫用他那雖已老邁卻仍然澄澈的藍眼睛盯著你，靜靜聽著你說服他先喝下那瓶酒的說詞，忽然，他發出一陣爽朗的笑聲）......（以下略）
	SetFlag( OwnerID() , 542507, 1 ) --打開重要旗標
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ) --/*返回上一頁
end

--斷裂的魚叉
function LuaI_204322_Quest() --物品選執行 Server 端劇情，把函式名稱填在使用效果的欄位內
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 422220, 1 )) --增加一頁石碑，內容是取自任務 422220 的任務敘述
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422220,str , "ScriptBorder_Texture_Paper" )	 --設定石碑其他項目
end