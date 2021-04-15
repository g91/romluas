function LuaS_422311_0()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422311_1]" ) 
	SLEEP(10)
	Say( OwnerID() , "[SC_422311_2]" )
	SLEEP(10)
	Say( OwnerID() , "[SC_422311_3]" )
	SLEEP(10)
	DisableQuest( OwnerID() , false ) 
END
---------------------------------------
function LuaS_422313()  --禮儀為生活之本
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422313)==true )and( CheckCompleteQuest( OwnerID() , 422313) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422313]","LuaS_422313_0",0) --沒有.......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422313_0]","LuaS_422313_1",0) --女士，什麼是禮儀規範？
	end
end

function LuaS_422313_0()
	CloseSpeak( OwnerID() )
end

function LuaS_422313_1()  
	SetSpeakDetail(OwnerID(),"[SC_422313_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422313_3]","LuaS_422313_2",0)	--我懂了.......
end

function LuaS_422313_2()  
	SetFlag(OwnerID() ,542655, 1 )
	CloseSpeak( OwnerID())
end

-------------------------------------------------------------------
function LuaS_422318()  --參與試練遊戲
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422318)==true )and( CheckCompleteQuest( OwnerID() , 422318) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422318_0]","LuaS_422318_0",0) --不，我還沒有做好心理準備！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422318_1]","LuaS_422318_1",0) --嗯，我已經準備好了！
	end
end

function LuaS_422318_0()
                SetSpeakDetail(OwnerID(),"[SC_422318_2]") ---那麼當你做好萬全準備時，請告知我！我以精靈聖王之名起誓，這絕對是個有趣的試煉遊戲！
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422318",0) 
end

function LuaS_422318_1()  
	SetSpeakDetail(OwnerID(),"[SC_422318_3]") --- 這是個明智的決定！相信自己就必定不會出錯！
                SetFlag(OwnerID() ,542662, 1 )
               AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422318",0) 
end
---------------------------------------------------
function LuaI_204593() --邀請函內容
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_204593]");
	ShowBorder( OwnerID(), 0, "[204593]" , "ScriptBorder_Texture_Paper" );
end


----------------
function LuaI_422322() 
	if	CheckCompleteQuest(OwnerID(),422322)	then
		SetSpeakDetail(OwnerID(),"[SC_422322]")
	else
		SetSpeakDetail(OwnerID(),"[SC_422322_1]")
	end
end