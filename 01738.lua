function LuaI_114478_0()

	local Flag = 780557
	local GuestID = {114968,114969,114970,114971,114972}
	local Guest = {}
	local FlagNum = 2
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X , Y , Z , Dir
	
	for pry , obj in pairs(GuestID) do
		X = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_X )
		Y = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Y )
		Z = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Z )
		Dir = GetMoveFlagValue( Flag , FlagNum, EM_RoleValue_Dir )			
		Guest[FlagNum-1] = CreateObj( obj , X , Y , Z , Dir , 1 )
		WriteRoleValue( Guest[FlagNum-1] , EM_RoleValue_IsWalk , 1 )
		AddToPartition( Guest[FlagNum-1] , RoomID )
--		SetDefIdleMotion( Guest[FlagNum-1]  , ruFUSION_MIME_SIT_CHAIR_LOOP )
--		PlayMotionEX( Guest[FlagNum-1]  , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP	)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + FlagNum -1 , Guest[FlagNum-1] )
		DisableQuest( Guest[FlagNum-1] , true )
		FlagNum = FlagNum + 1
	end	
	
end
function LuaQ_422966_Complete()

	local Buff = 504004
	AddBuff(TargetID() , Buff , 0 , 60 )
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		Tell( TargetID() , OwnerID() , "[SC_422967_0]" ) --那位沒落貴族又來光顧了，說起來真巧，每次他來這時都會發生事情......
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )
		BeginPlot( OwnerID() , "LuaS_422967_Begin" , 0 )
	end
	
	Tell( TargetID() , OwnerID() , "[SC_422967_1]" ) --如果想賺點外快，就去幫幫那位沒落貴族吧！
	
end

function LuaS_422967_Begin()

	local Flag = 780557
	local Mark = CreateObjByFlag( 114507 , Flag , 1 , 1 )
	local Service = CreateObjByFlag( 114506 , Flag , 7 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Guest = {}
		
	for i = 1 , 5 , 1 do
		Guest[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
		MoveToFlagEnabled( Guest[i] , false ) --防止亂轉
	end
	
	WriteRoleValue( Mark , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Service , EM_RoleValue_IsWalk , 1 )	
	AddToPartition( Mark , RoomID )
	AddToPartition( Service , RoomID )
	MovetoFlagEnabled( Mark , false )
	MovetoFlagEnabled( Service , false )	
	
	Yell( Mark , "[SC_422967_2]" , 3 ) --氣死我了！竟然會有這麼囂張的盜賊，直接就盤據在路旁洗劫路人！
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 20 )
	CallPlot( Service , "LuaS_422967_Move" , 9 )
	LuaFunc_MoveToFlag( Mark , Flag , 8 , 0 )
	sleep( 5 )
	AdjustFaceDir( Mark , Service , 0 )
	sleep( 5 )
	AdjustFaceDir( Service , Mark , 0 )
	Yell( Mark , "[SC_422967_3]" , 3 ) --那些貨物雖然不值什麼錢，但是這一口怨氣我可吞不下啊！
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 20 )	
	AdjustFaceDir( Mark , OwnerID() , 0 )	
	AdjustFaceDir( Service , OwnerID() , 0 )
	Yell( Mark , "[SC_422967_4]" , 3 ) --大家聽著！如果有人可以去給那些盜賊一點教訓，幫我把貨物拿回來，我就給他一筆豐厚的賞金。
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	
	for i = 1 , 5 , 1 do
		AdjustFaceDir( Guest[i] , Mark , 0 )
	end
	
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )	
	sleep( 30 )
--	SetDefIdleMotion( Guest[1]  , ruFUSION_MIME_NONE )
--	PlayMotion( Guest[1] , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
	sleep( 20 )
	Move( Guest[1] , GetMoveFlagValue( Flag , 10 , EM_RoleValue_X ) , GetMoveFlagValue( Flag , 10 , EM_RoleValue_Y ) , GetMoveFlagValue( Flag , 10 , EM_RoleValue_Z ) )
	sleep( 10 )
	SetDir( Mark ,GetMoveFlagValue( Flag , 8 , EM_RoleValue_Dir ) )	
	SetDir( Service , GetMoveFlagValue( Flag , 9 , EM_RoleValue_Dir ) )
	Yell( Guest[1] , "[SC_422967_5]" , 3 ) --喔～賞金啊！這下不愁喝酒錢了！...嗝！小子，你倒是說說看是哪裡的盜賊？我幫你...嗝！
	for i = 2 , 5 , 1 do
--		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
--		SetDefIdleMotion( Guest[i]  , ruFUSION_MIME_NONE )
		if i == 2 or i == 4 then
			AdjustFaceDir( Guest[i] ,Guest[i+1]  , 0 )	
		else
			AdjustFaceDir( Guest[i] ,Guest[i-1]  , 0 )	
		end
	end
	sleep( 30 )	
	for i = 2 , 5 , 1 do
		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end	
	sleep( 30 )
	for i = 2 , 5 , 1 do
		if i == 2 or i == 3 then
			AdjustFaceDir( Guest[i] ,Guest[i+2]  , 0 )	
		else
			AdjustFaceDir( Guest[i] ,Guest[i-2]  , 0 )	
		end
		PlayMotion( Guest[i] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end
	sleep( 30 )
	Yell( Mark , "[SC_422967_6]" , 3 ) --他們就在外頭那條山路的路旁，大剌剌的坐在路旁喝酒。
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	for i = 2 , 5 , 1 do
		AdjustFaceDir( Guest[i] , Mark , 0 )
	end
	sleep( 10 )
	Yell( Guest[4] , "[SC_422967_7]" , 3 ) --外頭的路旁...咦！那些...不是....不是馬龍...馬龍兄弟....盜賊團的手下嗎？
	PlayMotion( Guest[4] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	sleep( 30 )
	Yell( Guest[1] , "[SC_422967_8]" , 3 ) --馬龍....馬龍兄弟啊...那不了！....惹到馬龍兄弟...就算有錢買酒，怕沒命喝啊....當我剛剛什麼都沒說...
	AddBuff( Guest[1] , 500235 , 0 , 1 ) 
	sleep( 30 )
	LuaFunc_MoveToFlag( Guest[1] , Flag , 2 , 0 )
	Yell( Mark , "[SC_422967_9]" , 3 ) --哼！......還有人願意接下這個委託嗎？
	AdjustFaceDir( Mark , OwnerID() , 0 )	
	AdjustFaceDir( Service , OwnerID() , 0 )
	sleep( 10 )
	for i = 1 , 5 , 1 do
		local Dir = GetMoveFlagValue( Flag , i+1 , EM_RoleValue_Dir )
--		if i == 1 then
--			local X = GetMoveFlagValue( Flag , i+1, EM_RoleValue_X )
--			local Y = GetMoveFlagValue( Flag , i+1, EM_RoleValue_Y )
--			local Z = GetMoveFlagValue( Flag , i+1, EM_RoleValue_Z )
--			SetPos(  Guest[i] , X , Y , Z , Dir )
--			sleep( 5 )
--		end
		SetDir( Guest[i] , Dir )
--		PlayMotionEX( Guest[i]  , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP	)
--		SetDefIdleMotion( Guest[i]  , ruFUSION_MIME_SIT_CHAIR_LOOP )
	end	
	sleep( 10 )
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 10 )
	Yell( Mark , "[SC_422967_10]" , 3 ) --嘖！馬龍兄弟盜賊團有這麼可怕嗎？看到你們這模樣，也難怪他們會如此囂張！
	PlayMotion( Mark , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	Yell( Mark , "[SC_422967_11]" , 3 ) --沒關係！我相信還是會有見義勇為的人出現，我就在這酒館等著，改變主意要接受委託的人隨時可以過來找我？

	CallPlot( Service , "LuaS_422967_Move" , 11 )	
	LuaFunc_MoveToFlag( Mark , Flag , 10 , 0 )
	sleep( 5 )
	local Dir = GetMoveFlagValue( Flag , 10 , EM_RoleValue_Dir ) 
	Setdir( Mark , Dir )	
	sleep( 5 )
	SetPlot( Mark , "range" , "LuaS_422967_RangeCancelBuff" , 500 )
	sleep( 10 )
	DelObj( Mark )
	DelObj( Service )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	
end

function LuaS_422967_Move( FlagNum )
	local Flag = 780557 
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if FlagNum > 9 then
		local Dir = GetMoveFlagValue( Flag , FlagNum  , EM_RoleValue_Dir ) 
		Setdir( OwnerID() , Dir )
	end
end

function LuaS_422967_RangeCancelBuff()
	local Buff = 504004
	CancelBuff( OwnerID() , Buff )
end

function LuaS_114509_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422969 ) == true then
	 	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422969_0]", "LuaS_114509_1", 0 )  --聆聽見習騎士的注意事項
	end
end

function LuaS_114509_1()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		 	SetSpeakDetail( OwnerID(), "[SC_422969_1]") --（[114509]已經開始演說了）
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
		BeginPlot( TargetID() , "LuaS_114509_Play" , 0 )
	end
end

function LuaS_114509_Play()
	local Flag = 780558
	local Schoolar = {}
	local Lance = CreateObjByflag( 114913 , Flag , 1 , 1 )
	local Ytrinel = CreateObjByflag( 114914 , Flag , 2 , 1 )
	local John = CreateObjByflag( 114915 , Flag , 3 , 1 )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = CreateObjByFlag(114357 , Flag  , 12 , 1 ) --負責給玩家旗標的
	Lua_ObjDontTouch( Ball ) 
	WriteRoleValue( Lance , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Ytrinel , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( John , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( Lance , false )
	MoveToFlagEnabled( Ytrinel , false )
	MoveToFlagEnabled( John , false )
	if CheckID( TargetID() ) == true then
		SetPosByFlag( TargetID() , Flag , 12 )
		AddBuff( TargetID() , 503977 , 0 , 180 )
	end
	for i = 1 , 2 , 1 do
		local ID
		if i == 1 then ID = 114916 else ID = 114922 end
		Schoolar[i] = CreateObjByFlag( ID , Flag , 3 + i , 1 )
		WriteRoleValue(  Schoolar[i] , EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( Schoolar[i]  , false ) 
	end
	Yell( OwnerID() , "[SC_422969_2]" , 3 ) --所有這次加入的見習騎士們，請迅速過來集合！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	sleep( 10 )
	for i = 1 , 2 , 1 do
		AddToPartition( Schoolar[i] , RoomID )
		CallPlot( Schoolar[i] , "LuaS_114509_Move" , 5 + i , 0 )
	end
	sleep( 50 )
	AdjustFaceDir(Schoolar[1] , OwnerID()  , 0 )
	AdjustFaceDir(Schoolar[2] , OwnerID()  , 0 )
	sleep( 20 )
	PlayMotion( Schoolar[1] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Schoolar[2] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 30 )
	for i = 1 , 2 , 1 do
		SetIdleMotion( Schoolar[i] ,ruFUSION_MIME_EMOTE_IDLE)
	end
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422969_3]" , 3 ) --見習騎士們，仔細聽清楚了！首先，歡迎大家加入獅心騎士團，我是你們的騎士師範，凱‧凱因斯，負責訓練大家。
	sleep( 30 )
	Yell( OwnerID() , "[SC_422969_4]" , 3 ) --在獅心騎士團裡，要謹記下列幾點...
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_5]" , 3 ) --第一點，騎士團團長，大將軍蘭斯所說的話要絕對服從！
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_6]" , 3 ) --第二點，副團長伊崔妮的命令也要絕對服從！
	AddToPartition( Ytrinel , RoomID )
	AddToPartition( John , RoomID )
	AdjustFaceDir( John , OwnerID() ,  0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 10 )
	CallPlot( Ytrinel , "LuaS_114509_Move" , 8 , 0 )
	CallPlot( John , "LuaS_114509_Move" , 9 , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_7]" , 3 ) --第三點，所有小隊長的命令，也要絕對服從！
	sleep( 20 )
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_NONE)
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_8]" , 3 ) --咳....以上三點，大家先在心裡反覆默唸幾遍，絕對要記下來！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir( John , OwnerID() ,  0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 20 )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 10 )
	Yell(John , "[SC_422969_9]" , 3 ) --這麼嚴肅，可是會把大家嚇跑的唷！凱老師～你的熱情呢？
	sleep( 10 )
	AdjustFaceDir( OwnerID() , John , 0 )
	AdjustFaceDir( Ytrinel , OwnerID() , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_422969_10]" , 3 ) --真的嗎？可是騎士師範不是該有騎士師範的模樣......要認真、嚴肅......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	Yell(John , "[SC_422969_11]" , 3 ) --按照你的本性去做就行囉～
	sleep( 20 )
	Yell( OwnerID() , "[SC_422969_12]" , 3 ) --呼～太好了！咳咳～
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	sleep( 30 )
	SetDir( OwnerID() , Dir )
	sleep( 5 )
	Yell( OwnerID() , "[SC_422969_13]" , 3 ) --各位，我可愛的學生們～請把剛剛我說的話都忘記吧！讓我們重新開始～
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	sleep( 30 )	
	Yell( OwnerID() , "[SC_422969_14]" , 3 ) --在獅心騎士團裡，只要謹記一點！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )	
	Yell( OwnerID() , "[SC_422969_15]" , 3 ) --那就是團長跟副團長都是非常和藹可親的人，小隊長們以及我都會好好帶領大家，照顧大家，你們只要拿出熱情與衝勁，跟隨正義的腳步前進，把獅心騎士團當成自己溫馨的家，團員們都是支持著你們的家人，這樣就可以了～
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 50 )	
	Yell( OwnerID() , "[SC_422969_16]" , 3 ) --嗯！給大家一點時間，慢慢品嚐，用心去感受獅心騎士團帶給大家的溫暖吧！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_THREATEN )
	sleep( 20 )	
	AdjustFaceDir( Ytrinel , John , 0 )
	sleep( 10 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_17]" , 3 ) --約翰，你告訴凱要嚴肅，只是想看他為難的樣子吧？
	sleep( 10 )
	AdjustFaceDir(  John , Ytrinel ,0 )
	AdjustFaceDir( OwnerID() , John , 0 )
	sleep( 10 )
	PlayMotion( John  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( John , "[SC_422969_18]" , 3 ) --呵呵，我怎麼會這樣想呢？這可是我跟凱增進感情的方式呢！
	sleep( 30 )
	PlayMotion( OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( Ytrinel , "[SC_422969_19]" , 3 ) --論能力，你確實是個可佩的人，約翰，但是如果能夠改變你那玩世不恭的態度，你會成為一個更有實力的人的。
	sleep( 30 )
	PlayMotion( John  , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	AdjustFaceDir( OwnerID() , Ytrinel , 0 )
	Yell( John , "[SC_422969_20]" , 3 ) --就算我的實力再怎麼好，也比不上副團長妳，不愧是被尊稱為「鐵薔薇」的人呢！
	sleep( 30 )
	AddToPartition( Lance , RoomID )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_21]" , 3 ) --不需要把你那套花言巧語用在我身上，約翰，把心思放在認真做事上吧！
	sleep( 30 )
	LuaFunc_MoveToFlag( Lance , Flag , 10 , 0 )
	Yell( Lance , "[SC_422969_22]" , 3 ) --這些人是....？
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	AdjustFaceDir( OwnerID() , Lance , 0 )	
	AdjustFaceDir( Ytrinel , Lance , 0 )	
	AdjustFaceDir( John , Lance , 0 )	
	sleep( 10 )
	AdjustFaceDir( Lance , Ytrinel , 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SALUTE )	
	sleep( 20 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Ytrinel , "[SC_422969_23]" , 3 ) --這是凱所推薦，剛加入的見習騎士們。
	sleep( 10 )	
	for i = 1 , 2 , 1 do
		PlayMotion( Schoolar[i] ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	end
	AdjustFaceDir( Lance , Ball  , 0 )
	sleep( 10 )
	Yell( Lance , "[SC_422969_24]" , 3 ) --最近的見習騎士似乎有點多......
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	AdjustFaceDir( Lance , Ytrinel , 0 )
	Yell( Lance , "[SC_422969_25]" , 3 ) --不過既然是凱所推薦，又有伊崔妮妳的帶領，我不擔心。
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	AdjustFaceDir( Lance , Ball  , 0 )
	AdjustFaceDir( Ytrinel , Ball, 0 )	
	AdjustFaceDir( John , Ball , 0)	
	SetDir( OwnerID() , Dir )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Lance , "[SC_422969_26]" , 3 ) --見習騎士們，拿出實力來證明你們自己吧！....希望下次的初階騎士受封典禮上，還看得到你們。
	sleep( 30 )
	LuaFunc_MoveToFlag( Lance , Flag , 11 , 0 )
	sleep( 10 )
	AdjustFaceDir( Lance , Ytrinel , 0 )	
	AdjustFaceDir( OwnerID() , Ytrinel , 0 )	
	AdjustFaceDir( Ytrinel , Lance , 0 )	
	AdjustFaceDir( John , Ytrinel , 0 )	
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	Yell( Lance , "[SC_422969_27]" , 3 ) --以妳卓越的領導才能，讓他們快些跟上騎士團的腳步吧。
	sleep( 20 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Yell( Ytrinel , "[SC_422969_28]" , 3 ) --是...是的，我會努力。
	sleep( 20 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 30 )
	CallPlot( Lance , "LuaS_114509_Move" , 1 , 1 )
	sleep( 20 )
	CallPlot( Ytrinel , "LuaS_114509_Move" , 2 , 1 )
	CallPlot( John , "LuaS_114509_Move" , 3 , 1 )
	sleep( 20 )
	SetDir( OwnerID() , Dir )
	sleep( 10 )	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	for i = 1 , 2 , 1 do
		CallPlot( Schoolar[i] , "LuaS_114509_Move" , 3 + i , 1 )
	end
	AddToPartition( Ball,RoomID )
	SetPlot( Ball , "Range" , "LuaS_114509_Range" , 300 )
	sleep( 10 )
	DelObj( Ball )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_114509_Move( FlagNum , State )
	local Flag = 780558
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if State == 1 then
		Delobj( OwnerID() )
	end
end

function LuaS_114509_Range()
	local Flag = 543749
	CancelBuff_NoEvent( OwnerID() , 503977 )
	if CheckAcceptQuest( OwnerID() , 422969 ) == true then
		SetFlag( OwnerID() , Flag , 1 )
	end
end
--要在大將軍蘭斯身上的對話劇情加選項
function LuaS_422990_1()
	CloseSpeak( OwnerID() )
	local Buff = 506186-- client 劇情檢查用
	AddBuff( OwnerID() , Buff , 0 , 180 )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422990_1]" , 0 ) --領主國會議已經開始了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422990_1]" , 0 ) --領主國會議已經開始了
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID())
		BeginPlot( TargetID() , "LuaS_422990_Play" , 0 )
	end
end

function LuaQ_422990_Accept()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422990_1]" , 0 ) --領主國會議已經開始了
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422990_1]" , 0 ) --領主國會議已經開始了
	end
end
--預先在場地上種植用 client script 隱藏的貴族、貴族護衛以及仕女
function LuaS_422990_Play()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780559
	local Lance = CreateObjByFlag( 114911 , Flag , 1 , 1 )
	local Douny = CreateObjByFlag( 114742 , Flag , 5 , 1 )
	local Ytrinel = CreateObjByFlag( 114912 , Flag , 6 , 1 )
	local Gavy = CreateObjByFlag( 114743 , Flag , 4 , 1 )
	local Guard = {}
	
	WriteRoleValue( Lance , EM_RoleValue_Register+1 , 0 )	
	for i = 1 , 2 , 1 do
		Guard[i] = CreateObjByFlag( 114959 , Flag , 4+i , 1 )
		WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 1 )
	end
	
	Lua_Drama_Radar( Lance , 422990 )
	Lua_Drama_Radar( Ytrinel , 422990 )	
	--Hide( OwnerID() )
	WriteRoleValue( Lance , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Gavy , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Douny , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Ytrinel , EM_RoleValue_IsWalk , 1 )
	AddToPartition( Lance , RoomID )
--	SetDefIdleMotion( Douny, ruFUSION_MIME_EMOTE_SPEAK)
--	SetDefIdleMotion( Ytrinel, ruFUSION_MIME_EMOTE_SPEAK)
	MoveToFlagEnabled( Lance , false )
	MoveToFlagEnabled( Douny , false )
	MoveToFlagEnabled( Ytrinel , false )
	
	AddToPartition( Douny , RoomID )
	AddToPartition( Ytrinel , RoomID )
	sleep( 10 )
	Yell( Douny , "[SC_422990_13]" , 3 ) --領主國會議就要開始，到現在還沒有半個領主出席，這下可糟糕了！
	sleep( 20 )
	Yell( Ytrinel , "[SC_422990_14]" , 3 ) --別慌張，先把這件事情向蘭斯團長報告。	
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	CallPlot( Ytrinel , "LuaS_422990_MoveFlag" , 3 , 0 )
	LuaFunc_MoveToFlag( Douny , Flag , 2 , 0 )
	LuaFunc_MoveToFlag( Lance , Flag , 8 , 0 )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Delobj( Gavy )
		Delobj( Guard[1] )
		Delobj( Guard[2] )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	sleep( 10 )
	AdjustFaceDir( Lance , Douny, 0 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel, Lance ,  0 )
	sleep( 10 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 15 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 15 )	
	Yell( Lance , "[SC_422990_2]" , 3 ) --[114742]，這是怎麼回事？
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Douny , "[SC_422990_3]" , 3 ) --大....將軍....受邀的領主國....到目前為止...都沒人出席....
	sleep( 10 )
	AdjustFaceDir(   Lance , Ytrinel, 0 )
	sleep( 10 )
	Yell( Lance , "[SC_422990_4]" , 3 ) --艾翁呢？連艾翁都沒派人來？
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 10 )
	AdjustFaceDir( Lance , Douny, 0 )
	sleep( 10 )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Delobj( Gavy )
		Delobj( Guard[1] )
		Delobj( Guard[2] )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	AddToPartition( Gavy , RoomID )
	MovetoFlagEnabled( Gavy , false )
	for i = 1 , 2 , 1 do
		AddToPartition( Guard[i] , RoomID )
		MovetoFlagEnabled( Guard[i]  , false )
	end
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Douny , "[SC_422990_5]" , 3 ) --是...是的...
	sleep( 10 )
	Yell( Gavy , "[SC_422990_6]" , 3 ) --瞧瞧，這是什麼狀況，領主國會議，竟然沒有半個領主出席！
	for i = 1 , 2 , 1 do
		CallPlot( Guard[i]  , "LuaS_422990_MoveFlag" , 9+i , 0 )
	end
	LuaFunc_MoveToFlag( Gavy , Flag , 9 , 0 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel, Lance ,  0 )
	AdjustFaceDir(  Lance , Gavy , 0 )
	sleep( 10 )
	AdjustFaceDir(  Gavy, Lance ,  0 ) 
	sleep( 10 )
	Yell( Gavy , "[SC_422990_7]" , 3 )--你應該非常明白為何會如此吧，大～將～軍～
	PlayMotion( Gavy , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	Yell( Lance , "[SC_422990_8]" , 3 )--我會派人去艾翁問明白原因。
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	sleep( 20 )	
	Yell( Gavy , "[SC_422990_9]" , 3 )--還需要問嗎？這一切都是因為你干預王室運作，讓人王的威信蕩然無存，才會連六大領主國，甚至是艾翁，都不願意出席領主國會議！
	PlayMotion( Gavy , ruFUSION_ACTORSTATE_EMOTE_POINT )
	for i = 1 , 2 , 1 do
		PlayMotion( Guard[i] , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	end
	sleep( 10 )
	Yell( Lance , "[SC_422990_10]" , 3 )--......
	sleep( 10 )
	Yell( Ytrinel , "[SC_422990_11]" , 3 )--霍夫曼爵士，你誤會蘭斯大將軍了！他其實是為了王室.....
	PlayMotion( Ytrinel  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 10 )	
	AdjustFaceDir(  Douny, Ytrinel ,  0 )
	AdjustFaceDir(  Gavy , Ytrinel, 0 )
	AdjustFaceDir(  Lance , Ytrinel , 0 )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	AdjustFaceDir(  Douny, Lance ,  0 )
	AdjustFaceDir(  Ytrinel , Lance, 0 )
	AdjustFaceDir(  Lance , Gavy , 0 )
	Yell( Gavy , "[SC_422990_12]" , 3 )--哼！蘭斯，雖然我現在還找不到你謀害先王，趁機奪取王權的證據，有一天，我一定會揭露你那偽善的面具。
	sleep( 20 )
	for i = 1 , 2 , 1 do
		CallPlot( Guard[i]  , "LuaS_422990_MoveFlag" , 4+i , 1 )
	end
	LuaFunc_MoveToFlag( Gavy , Flag , 4 , 0 )
	Delobj( Gavy )
	if Lua_Check_Drama_Statu( Lance ) == false and Lua_Check_Drama_Statu( Ytrinel ) == false then
		SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
		sleep( 10 )
		Delobj( Ytrinel )
		Delobj( Douny )
		Delobj( Lance )
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	sleep( 10 )
	AdjustFaceDir(  Lance , Ytrinel , 0 )
	sleep( 10 )
	PlayMotion( Lance , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	PlayMotion( Ytrinel , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Douny , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 20 )
	CallPlot( Ytrinel  , "LuaS_422990_MoveFlag" , 5 , 1 )
	CallPlot( Douny  , "LuaS_422990_MoveFlag" , 6 , 1 )
	LuaFunc_MoveToFlag( Lance , Flag , 12 , 0 )
	sleep( 10 )
	local Dir = GetMoveFlagValue( Flag , 12 , EM_RoleValue_Dir )
	SetDir( Lance , Dir )
	WriteRoleValue( Lance , EM_RoleValue_Register+1 , 777 )
	SetPlot( Lance , "range" , "LuaS_422990_Range" , 300 )
	sleep( 10 )
	Delobj( Lance )
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422990_MoveFlag( FlagNum , Del)
	local Flag = 780559
	if Del == 1 then
		Sleep( 30 )
	end
	LuaFunc_MoveToFlag( OwnerID() , Flag , FlagNum , 0 )
	if Del == 1 then
		DelObj( OwnerID() )
	end
end

function LuaS_422990_Range()
	local KeyItem = 543750
	CancelBuff_NoEvent( OwnerID() , 506186 )
	if CheckAcceptQuest( OwnerID() , 422990 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) > 0 then
		SetFlag( OwnerID() , KeyItem , 1 )
	end
end

--要在傑斯莫克里夫身上的對話劇情加選項
function LuaS_422993_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422993_1]" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422993_1]" , 0 ) 
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID())
		BeginPlot( TargetID() , "LuaS_422993_Play" , 0 )
	end
end

function LuaS_422993_Play()
	local Flag = 780575
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local NPC_ID = {114676,114677,114678,114679}
	local Obj , Obj2
	local OrgDir , OrgDir2
	local Jazz = CreateObjbyObj( 114675 , OwnerID()  )
	local Player =ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	Hide( OwnerID() )
	Hide( Jazz)
	WriteRoleValue( Jazz , EM_RoleValue_IsWalk , 1 )
	Show( Jazz , RoomID )
	MoveToflagEnabled( Jazz , false )
	Lua_Drama_Radar( Jazz , 422993 )
	LuaFunc_MoveToFlag( Jazz , Flag , 1 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[1] , 100 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir(  Jazz, Obj ,  0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	Yell( Jazz , "[SC_422993_2]" , 3 ) --村長，這位是從達拉尼斯城來艾翁的使節，是我的朋友，剛來到布拉村作客。
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )
	AdjustFaceDir(  Jazz , Player , 0 )
	sleep( 5 )
	AdjustFaceDir(  Obj , Player , 0 )	
	sleep( 5 )
	Yell(  Obj , "[SC_422993_3]" , 3 ) --歡迎～歡迎～您的朋友就是我們布拉村的朋友，不好意思沒有什麼東西好招待，有任何需要幫忙的，請您務必告訴我。
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	sleep( 25 )
	AdjustFaceDir(  Jazz, Obj ,  0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep( 20 )
	Yell( Jazz , "[SC_422993_4]" , 3 ) --我繼續帶使節去逛逛，晚點再回來找您聊天。
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	Yell(  Obj, "[SC_422993_5]" , 3 ) --呵呵～好，沒問題！
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	sleep( 20 )
	SetDir( Obj , OrgDir )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 2 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[2] , 300 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir( Obj , Jazz, 0 )
	sleep( 5 )	
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	Yell( Obj , "[SC_422993_6]" , 3 ) --快過來！傑斯小子。
	sleep( 10 )
	Yell( Jazz , "[SC_422993_7]" , 3 ) --我來了。
	LuaFunc_MoveToFlag( Jazz , Flag , 3 , 0 ) 
	sleep( 5 )
	AdjustFaceDir(  Jazz, Obj , 0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( Obj , "[SC_422993_8]" , 3 ) --嚐嚐我剛釀好的酒，味道還好嗎？
	sleep( 20 )
	PlayMotion( jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( jazz , "[SC_422993_9]" , 3 ) --好喝！看來待會兒的聚會可以暢飲一番了！
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
	Yell( Obj , "[SC_422993_10]" , 3 ) --呵呵呵～.....咦？這位是？
	sleep( 15 )
	AdjustFaceDir(  Jazz, Player , 0 )
	AdjustFaceDir(  Obj , Player , 0 )
	sleep( 5 )
	PlayMotion( jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( jazz , "[SC_422993_11]" , 3 ) --這是從達拉尼斯城來艾翁的者，這位是方絲華夫人。
	sleep( 20 )
	PlayMotion( Obj, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	Yell( Obj , "[SC_422993_12]" , 3 ) --歡迎～待會兒一起來參加聚會吧！
	sleep( 15 )
	AdjustFaceDir(  Jazz, Obj , 0 )
	AdjustFaceDir(  Obj , Jazz, 0 )
	sleep( 5 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	Yell( Jazz , "[SC_422993_13]" , 3 ) --我會帶他過來的，先失陪，我繼續帶使節去逛逛。
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_LAUGH )	
	Yell( Obj , "[SC_422993_14]" , 3 ) --好，那待會兒見囉！呵呵～
	sleep( 10 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 4 , 0 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	SetDir( Obj , OrgDir )
	Obj = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[3] , 100 )
	Obj2 = LuaFunc_SearchNPCbyOrgID( Jazz , NPC_ID[4] , 100 )
	OrgDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	OrgDir2 = ReadRoleValue( Obj2 , EM_RoleValue_Dir )
	sleep( 5 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir( Obj2 , Jazz , 0 )
	sleep( 5 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )	
	Yell( Obj , "[SC_422993_15]" , 3 ) --[114675]領主，日安。
	sleep( 10 )
	Yell( Jazz , "[SC_422993_16]" , 3 ) --嘿！說過很多次了，怎麼還在叫我領主？
	LuaFunc_MoveToFlag( Jazz , Flag , 5 , 0 )
	sleep( 5 )
	AdjustFaceDir(  Jazz , Obj ,0 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir(  Obj2 , Jazz , 0 )
	sleep( 5 )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE )	
	Yell(Obj2 , "[SC_422993_17]" , 3 ) --在我們心中，你永遠是艾翁的領主，只有你能保護我們，帶領我們。
	AdjustFaceDir(  Jazz , Obj2 ,0 )
	sleep( 20 )	
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	
	Yell( Jazz , "[SC_422993_18]" , 3 ) --我沒有你們說的那麼好。
	sleep( 20 )	
	AdjustFaceDir(  Jazz , Obj ,0 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_POINT )	
	Yell( Jazz , "[SC_422993_19]" , 3 ) --西方那頭盤據的盜賊，還有攻擊的跡象嗎？
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Obj , "[SC_422993_20]" , 3 ) --暫時沒有。
	AdjustFaceDir(  Jazz , Obj ,0 )
	sleep( 20 )	
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Jazz , "[SC_422993_21]" , 3 ) --嗯，繼續按照我告訴你們的方式防衛。
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Yell( Obj , "[SC_422993_22]" , 3 ) --是，傑斯領主！
	sleep( 20 )		
	Yell( Jazz , "[SC_422993_23]" , 3 ) --你....真是的。
	sleep( 20 )
	AdjustFaceDir(  Obj2 , Player , 0 )
	Yell( obj2 , "[SC_422993_24]" , 3 ) --這位是....？
	sleep( 5 )
	AdjustFaceDir(  Jazz , Player , 0 )
	AdjustFaceDir(  Obj2 , Player , 0 )
	sleep( 10 )
	Yell( Jazz , "[SC_422993_25]" , 3 ) --這位是我的朋友，從達拉尼斯城來艾翁的使節。
	AdjustFaceDir(  Obj , Player , 0 )
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep( 20 )
	PlayMotion( Obj , ruFUSION_ACTORSTATE_EMOTE_WAVE )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	Yell( Obj2 , "[SC_422993_26]" , 3 ) --歡迎你來到布拉村，傑斯的朋友就是我們的朋友，待會兒一起來喝酒狂歡吧！
	sleep( 15 )
	AdjustFaceDir(  Jazz , Obj2 ,0 )
	sleep( 5 )
	Yell( Jazz , "[SC_422993_27]" , 3 ) --我會帶他過來的。
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	sleep( 10 )
	AdjustFaceDir(  Obj , Jazz , 0 )
	AdjustFaceDir(  Obj2 , Jazz , 0 )
	sleep( 10 )
	PlayMotion( Obj2 , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	
	Yell( Obj2 , "[SC_422993_28]" , 3 ) --那待會兒見囉！
	sleep( 20 )
	AdjustFaceDir(  Jazz , Player , 0 )
	Yell( Jazz , "[SC_422993_29]" , 3 ) --我們回去吧。
	PlayMotion( Jazz , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 10 )
	SetDir( Obj , OrgDir )
	SetDir( Obj2 , OrgDir2 )
	if Lua_Check_Drama_Statu( Jazz ) == false then
		DelObj( Jazz)
		Show( OwnerID() , RoomID )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end
	LuaFunc_MoveToFlag( Jazz , Flag , 6 , 0 )
	sleep( 5 )
	SetDir( Jazz ,Dir )
	sleep( 5 )
	SetPlot( Jazz , "range" , "LuaS_422993_Range" , 300 )
	sleep( 10 )
	DelObj( Jazz)
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422993_Range()
	local KeyItem = 543751
	if CheckAcceptQuest( OwnerID() , 422993 ) == true then
		SetFlag( OwnerID() , KeyItem , 1)
	end
end

function LuaI_114700_0_A()
	sleep( 30 )
	local Flag = 780576
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Owl = CreateObjByFlag( 114701 , Flag , 1 , 1 )
	local Wall = LuaFunc_SearchRoomNPCbyOrgID( OwnerID() , 114771 )
	local Queen = CreateObjByFlag( 103304, Flag , 2 , 1 )
	local Guard = {}
	local ChangeBuff  = 506187--王妃的變身buff	
	
	for i = 1 , 4 , 1 do
		Guard[i] = CreateObjByFlag( 103305 , Flag , 5+i , 1 )
		AddToPartition( Guard[i] , RoomID )
		SetRoleCamp(Guard[i] , "Visitor" )
		SetIdleMotion( Guard[i] , ruFUSION_MIME_EMOTE_IDLE )
	end
	
	AddToPartition( Queen , RoomID )
	SetRoleCamp( Queen , "Visitor" )
	AddBuff( Queen , ChangeBuff , 0 , -1 )

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , Wall )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , Queen )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , Guard[4] )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , Guard[3] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , Guard[2] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Guard[1] )	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Owl )
	AddToPartition( Owl , RoomID )
	SetPlot( OwnerID() , "range" , "LuaI_114700_1" , 100 )
	sleep(30)
	SetIdleMotion( Queen , ruFUSION_MIME_SIT_CHAIR_LOOP )
end

function LuaS_114700_0_A()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423009 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423009_0]", "LuaS_114700_1_A", 0 ) --出發吧！
	end
end

function LuaS_114700_1_A()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage ( OwnerID()  ,  OwnerID()  , 1 , "[SC_423009_1]" , 0 ) --[114700]已經先一步出發了。
		ScriptMessage ( OwnerID()  ,  OwnerID()  , 0 , "[SC_423009_1]" , 0 )
	else
		BeginPlot( TargetID() , "LuaQ_423009_PLAY" , 0 )
	end
end

function LuaQ_423009_Accept()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage ( TargetID()  ,  TargetID()  , 1 , "[SC_423009_1]" , 0 ) --[114700]已經先一步出發了。
		ScriptMessage ( TargetID()  ,  TargetID()  , 0 , "[SC_423009_1]" , 0 )
	else
		BeginPlot( OwnerID() , "LuaQ_423009_PLAY" , 0 )
	end
end

function LuaQ_423009_PLAY()
	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )	
	local Wall = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Owl = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Midnight = CreateObjByObj( 103442 , OwnerID() )
	local Flag = 780576
	local Owl_2 = CreateObjByFlag( 103443, Flag , 1 , 1 )
	local Queen = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )
	local Rowl = CreateObjByFlag( 103441 , Flag , 3 , 1 )
	local Gino = CreateObjByFlag( 103440 , Flag , 4 , 1 )
	local Jazz = CreateObjByFlag( 103306 , Flag , 5 , 1 )
	local Guard = {}
	local ChangeBuff  = 506187--王妃的變身buff
	local Magic  = 492668 --王妃以及士兵變身的特效
	local Zone , Room , X , Y , Z , Dir = 15 , 0 , -9440 , -160 , 11473 , 295 --要傳送過去的位置
	local NoAttackBuff = 502550
	local ArgoBuff = 506189
	local Area = 1 --暫定
	local KeyItem = 543740
	local TimeOver = 0
	WriteRoleValue( Midnight , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Owl_2 , EM_RoleValue_IsWalk , 1 )	
	
	Hide( Owl )
	Hide( OwnerID() )
	AddToPartition( Owl_2 , RoomID )
	AddToPartition( Midnight , RoomID )	

	SetPlot( Owl_2 , "dead" , "LuaQ_423009_dead" , 0 )
	SetPlot( Midnight , "dead" , "LuaQ_423009_dead" , 0 )
	AddBuff( Owl_2 , 506276 , 0 , -1 )
	AddBuff( Midnight , 506275 , 0 , -1 )
	MoveToFlagEnabled( Owl_2 , false )
	MoveToFlagEnabled( Midnight , false )
	SetRoleCamp( Owl_2 , "Visitor" )
	SetRoleCamp( Midnight , "Visitor" )	
		
	if CheckID( Wall ) == true then
		SetModeEX( Wall , EM_SetModeType_Obstruct , false)
	end
	
	for i = 1 , 4 , 1 do
		Guard[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3+i )
		if CheckID( Guard[i] ) == false then 
			Guard[i] = CreateObjByFlag( 103305 , Flag , 5+i , 1 )
			AddToPartition( Guard[i] , RoomID )
			SetRoleCamp(Guard[i] , "Visitor" )
			SetIdleMotion( Guard[i] , ruFUSION_MIME_EMOTE_IDLE )
		end
	end

	if CheckID( Queen ) == false then
		Queen = CreateObjByFlag( 103304, Flag , 2 , 1 )
		AddToPartition( Queen , RoomID )
		SetRoleCamp( Queen , "Visitor" )
		AddBuff( Queen , ChangeBuff , 0 , -1 )
		sleep( 30 )
		SetIdleMotion( Queen , ruFUSION_MIME_SIT_CHAIR_LOOP )
	end

	CallPlot( Owl_2 , "LuaQ_423009_Move" , 10 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 11 , 0 )
	AdjustFaceDir(  Guard[1] , Owl_2 , 0 )
	AdjustFaceDir(  Guard[2] , Owl_2 , 0 )
	sleep( 5 )
	AdjustFaceDir(  Guard[1] , Guard[2] , 0 )
	AdjustFaceDir(  Guard[2] , Guard[1] , 0 )
	sleep( 10 )
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 12 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 13 , 0 )	
	Yell( Guard[1] , "[SC_423009_2]" , 3 ) --竟然有這麼高大的侍女？
	sleep( 20 )
	Yell( Guard[2] , "[SC_423009_3]" , 3 ) --你真失禮，明明是很漂亮的女性，尤其是長髮的那位，簡直是絕色啊～
	sleep( 10 )
	AdjustFaceDir(Owl_2 ,  Guard[2] , 0 )
	sleep( 10 )
	ScriptMessage( Midnight ,  0 , 2 , "[SC_423009_4]" , 0 ) --[103442]壓低音量悄聲地說...
	ScriptMessage( Midnight ,  0 , 0 , "[SC_423009_4]" , 0 ) --[103442]壓低音量悄聲地說...
	Yell( Midnight , "[SC_423009_5]" , 2 ) --別、別衝動，這裡是傑斯的國家。
	sleep( 20 )
	ScriptMessage( Owl_2 ,  0 , 2 , "[SC_423009_6]" , 0 ) --[103443]抿嘴，勉強鬆開握緊的拳頭
	ScriptMessage( Owl_2 ,  0 , 0 , "[SC_423009_6]" , 0 ) --[103443]抿嘴，勉強鬆開握緊的拳頭
	AdjustFaceDir(Owl_2 ,  Guard[3] , 0 )
	sleep( 10 )
	Yell( Midnight , "[SC_423009_7]" , 2 ) --呼～
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 14 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 15 , 0 )	
	AdjustFaceDir(  Guard[3] , Owl_2 , 0 )
	AdjustFaceDir(  Guard[4] , Midnight , 0 )
	sleep( 10 )	
	Yell( Guard[3] , "[SC_423009_8]" , 3 ) --咦？我沒見過這幾位！
	FaceObj( Owl_2 , Guard[3] )
	sleep( 20 )
	SetDefIdleMotion( Guard[3] , ruFUSION_MIME_IDLE_COMBAT_2H )
	SetDefIdleMotion( Guard[4] , ruFUSION_MIME_IDLE_COMBAT_2H )
	Yell( Guard[4] , "[SC_423009_9]" , 3 ) --大膽！竟敢假冒
	PlayMotion( Owl_2 , ruFUSION_ACTORSTATE_ATTACK_1H_SP )
	sleep( 10 )
	PlayMotionEX( Guard[3] , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD )
	AdjustFaceDir(  Guard[4] , Owl_2 , 0 )
	FaceObj( Owl_2 , Guard[4] )
	sleep( 10 )
	PlayMotion( Owl_2 , ruFUSION_ACTORSTATE_SP_SPINKICK )
	sleep( 10 )
	PlayMotionEX( Guard[4] , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD )
	sleep( 10 )
	Yell( Midnight , "[SC_423009_10]" , 2 ) --哎，這兩人真是～
	PlayMotion( Midnight , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 20 )
	Yell( Owl_2 , "[SC_423009_11]" , 2 ) --嘖，我忍很久了...
	CallPlot( Owl_2 , "LuaQ_423009_Move" , 16 , 0 )
	LuaFunc_MoveToFlag( Midnight , Flag , 17 , 0 )	
	sleep( 10 )
	Yell( Midnight , "[SC_423009_12]" , 3 ) --沒想到真有這種事，會活動的「屍體」哪～[103304]王妃。	
	CallPlot( Guard[1] , "LuaQ_423009_Move" , 1, 1 )
	CallPlot( Guard[2] , "LuaQ_423009_Move" , 1, 1 )
	PlayMotion( Midnight , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE	)
	sleep( 20 )
	Yell( Queen , "[SC_423009_13]" , 3 ) --哼！擅闖的野貓，你們的下場只有一個！
	sleep( 20 )
	SetIdleMotion( Queen , ruFUSION_MIME_NONE )	
	CastSpell( Queen ,Queen ,Magic )
	CancelBuff( Queen , ChangeBuff )
	CancelBuff( Owl_2 , 506276 )
	CancelBuff( Midnight , 506275 )
	SetRoleCamp( Queen , "Monster" )
	--SetRoleCamp( Midnight , "SNPC" )
	SetRoleCamp( Owl_2 , "SNPC" )
	if CheckID( TargetID() ) == true then
		SetAttack( Queen , TargetID() )
	end
	--SetAttack( Midnight , Queen )
	SetAttack( Owl_2 , Queen )
	local result = 0
	for i = 1 , 240 , 1 do
		local Check = 0
		if CheckID( TargetID() ) == true and ReadRoleValue( Queen , EM_RoleValue_IsPlayer ) ~= 1 then
			SetAttack( Queen , TargetID() )
		end
		for i = 1 , HateListCount(Queen ) , 1 do
			local ID = HateListInfo(Queen ,i-1 , EM_HateListInfoType_GItemID )
			if ReadRoleValue( ID , EM_RoleValue_IsPlayer ) == 1 then
				Check = 1
			end
		end
		if CheckID( Queen ) == false or ReadRoleValue( Queen , EM_RoleValue_IsDead ) == 1 then
			result = 1
			break
		end
		if Check == 0 and result == 0 and i > 60  then
			break
		end
		if i == 240 then
			TimeOver = 1
		end
		sleep( 10 )	
	end
	if result == 1 then
		TimeOver = 0
		WriteRoleValue( Rowl , EM_RoleValue_IsWalk ,0 )
		WriteRoleValue( Gino , EM_RoleValue_IsWalk ,0 )
		AddToPartition( Rowl , RoomID )
		AddToPartition( Gino , RoomID )
		MoveToFlagEnabled( Rowl , false )
		MoveToFlagEnabled( Gino , false )
		SetPlot( Rowl , "dead" , "LuaQ_423009_dead" , 0 )
		SetPlot( Gino , "dead" , "LuaQ_423009_dead" , 0 )
		Yell(Rowl , "[SC_423009_14]" , 3 ) --母親大人！
		Yell(Gino , "[SC_423009_15]" , 3 ) --發生什麼事了？
		FaceObj( Rowl , Queen )
		FaceObj( Gino , Queen )
		SetFightMode( Rowl , 0 , 0 , 0 , 1 )
		SetFightMode( Gino , 0 , 0 , 0 , 1 )
		ScriptMessage( Owl_2 , -1 , 2 , "[SC_423009_16]" , 0 ) --竟敢弄壞我的玩具！沒關係，我還有兩隻可以對付你們～
		ScriptMessage( Owl_2 , -1 , 0 , "[SC_423009_16]" , 0 ) --竟敢弄壞我的玩具！沒關係，我還有兩隻可以對付你們～
		sleep( 30 )
		PlayMotion( Guard[3] , ruFUSION_ACTORSTATE_REVIVING	)
		PlayMotion( Guard[4] , ruFUSION_ACTORSTATE_REVIVING	)
		CastSpell( Guard[3] , Guard[3] ,Magic )
		CastSpell( Guard[4] , Guard[4] ,Magic )
		sleep( 10 )
		AdjustFaceDir(  Rowl , Guard[3] , 0 )		
		AdjustFaceDir(  Gino , Guard[4] , 0 )
		AdjustFaceDir(  Midnight , Guard[4] , 0 )
		AdjustFaceDir(  Owl_2 , Guard[3] , 0 )	
		sleep( 20 )
		WriteRoleValue( Jazz , EM_RoleValue_IsWalk ,0 )
		AddToPartition( Jazz , RoomID )
		SetPlot( Jazz , "dead" , "LuaQ_423009_dead" , 0 )
		MoveToFlagEnabled( Jazz , false )
		Yell( Jazz , "[SC_423009_17]" , 3 ) --勞爾、傑諾！
		SetRoleCamp( Guard[3] , "Monster" )
		SetRoleCamp( Guard[4] , "Monster" )
		SetAttack( Guard[3] ,  Rowl )
		SetAttack( Guard[4] ,  Gino )
		SetFightMode( Rowl , 0 , 1 , 0 , 1 )
		SetFightMode( Gino , 0 , 1 , 0 , 1 )
		SetFightMode( Jazz , 0 , 1 , 0 , 1 )
		AddBuff( Rowl , NoAttackBuff , 0 , -1 )
		AddBuff( Gino , NoAttackBuff , 0 , -1 )
		AddBuff( Jazz, NoAttackBuff , 0 , -1 )	
		LuaFunc_MoveToFlag( Jazz , Flag , 20 , 0 )
		sleep( 5 )
		AdjustFaceDir( Jazz , OwnerID() , 0 )
		AddBuff( Jazz, ArgoBuff , 0 , -1 )	
		CallPlot( Rowl , "LuaQ_423009_Move_2" , 18 , Jazz)
		CallPlot( Gino , "LuaQ_423009_Move_2" , 19 , Jazz)

		for i = 1 , 240 , 1 do
			result = 0
			local Check = 0
			for j = 3 , 4 , 1 do
				if CheckID( Guard[j] ) == false or ReadRoleValue(Guard[j] , EM_RoleValue_OrgID ) ~= 103305 or ReadRoleValue(Guard[j] ,EM_RoleValue_IsDead) == 1 then
					result = result + 1
				end
				for k = 1 , HateListCount(Guard[j]) , 1 do
					local ID = HateListInfo(Guard[j] ,k-1 , EM_HateListInfoType_GItemID )
					if ReadRoleValue( ID , EM_RoleValue_IsPlayer ) == 1 then
						Check = 1
					end
				end
			end
			if result >= 2 then
				break
			end
			if Check == 0 and result < 2 and i > 60 then
				break
			end
			if i == 240 then
				TimeOver = 1
			end
			sleep( 10 )
		end
		local Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , Area ) == true then
				if CheckAcceptQuest( ID , 423009 ) == true and result >= 2 and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
					SetFlag( ID , KeyItem , 1 )
				else
					if result < 2 then
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 and TimeOver == 0 then

						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 and TimeOver == 0 then
							ScriptMessage( ID , ID , 1 , "[SC_423009_19]" , 0 ) --由於你並未參與戰鬥導致任務失敗！請重新挑戰！
							ScriptMessage( ID , ID , 0 , "[SC_423009_19]" , 0 )
						else
							ScriptMessage( ID , ID , 1 , "[SC_423009_20]" , 0 ) --由於戰鬥時間過長導致任務失敗！請重新挑戰！
							ScriptMessage( ID , ID , 0 , "[SC_423009_20]" , 0 )						
						end
					end
				end
				ChangeZone( ID , Zone , Room , X , Y , Z, Dir )
			end
		end	
	else
		local Player = SetSearchAllPlayer(RoomID)
		for i = 1 , Player , 1 do 
			local ID = GetSearchResult()
			if  Lua_ObjAreaCheck( ID , Area ) == true then
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 and TimeOver == 0 then
					ScriptMessage( ID , ID , 1 , "[SC_423009_18]" , 0 ) --由於你無法進行戰鬥導致任務失敗！請重新挑戰！
					ScriptMessage( ID , ID , 0 , "[SC_423009_18]" , 0 )
				elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 and TimeOver == 0 then
					ScriptMessage( ID , ID , 1 , "[SC_423009_19]" , 0 ) --由於你並未參與戰鬥導致任務失敗！請重新挑戰！
					ScriptMessage( ID , ID , 0 , "[SC_423009_19]" , 0 )
				else
					ScriptMessage( ID , ID , 1 , "[SC_423009_20]" , 0 ) --由於戰鬥時間過長導致任務失敗！請重新挑戰！
					ScriptMessage( ID , ID , 0 , "[SC_423009_20]" , 0 )						
				end
				ChangeZone( ID , Zone , Room , X , Y , Z, Dir )
			end
		end		
	end
	if CheckID( Queen ) == true and ReadRoleValue(Queen , EM_RoleValue_OrgID ) == 103304 and ReadRoleValue(Queen ,EM_RoleValue_IsDead) == 0 then
		CastSpell( Queen ,Queen ,Magic )
		sleep( 5 )
		DelObj( Queen )
	end
	for i = 1 , 4 , 1 do
		if CheckID( Guard[i] ) == true and ReadRoleValue(Guard[i] , EM_RoleValue_OrgID ) == 103305 and ReadRoleValue(Guard[i] ,EM_RoleValue_IsDead) == 0 then
			CastSpell( Guard[i] ,Guard[i] ,Magic )
			sleep( 5 )
			Delobj( Guard[i] )
		end
	end
	Delobj( Rowl )
	DelObj( Gino )
	DelObj( Jazz )
	DelObj( Owl_2 )
	DelObj( Midnight )
	Show( OwnerID()  , RoomID )
	Show( Owl , RoomID )
	if CheckID( Wall ) == true then
		SetModeEX( Wall , EM_SetModeType_Obstruct , true)
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_423009_Move(Flagnum, Del)
	local Flag = 780576
	LuaFunc_MoveToFlag( OwnerID() , Flag , Flagnum , 0 )
	if Del == 1 then
		DelObj( OwnerID() )
	end
end

function LuaQ_423009_Move_2(Flagnum , Jazz)
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	local Flag = 780576
	LuaFunc_MoveToFlag( OwnerID() , Flag , Flagnum , 0 )
	AdjustFaceDir(  OwnerID() , Jazz , 0 )
	sleep( 10 )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	if FlagNum == 18 then
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_UNARMED )
	else
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )	
	end
end

function LuaQ_423009_dead()
	return false
end

function LuaI_114700_1()
--	if CheckAcceptQuest( OwnerID() , 423008 ) == true or CheckAcceptQuest( OwnerID() , 423009 ) == true then
		if CheckBuff( OwnerID() , 506188 ) == false then
			AddBuff( OwnerID() , 506188 , 0 , -1 )
		end 
--	end
end

function LuaI_423008_Transport_0()
	SetPlot( OwnerID()  , "collision", "LuaI_423008_Transport_1" , 30 )
end

function LuaI_423008_Transport_1()
	local Zone = 253
	local Room = -1
	local X , Y , Z ,Dir = 544 , 1 , 695 , 270
	if CheckAcceptQuest( OwnerID() , 423008 ) == true or CheckAcceptQuest( OwnerID() , 423009 ) == true or ( CheckCompleteQuest( OwnerID() , 423008 ) == true and CheckCompleteQuest( OwnerID() , 423009 ) == false ) then
		ChangeZone( OwnerID() , Zone , Room , X , Y, Z , Dir )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0  , "[SC_423008_NOT_READY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1  , "[SC_423008_NOT_READY]" , 0 )
	end
end

function LuaI_423008_Transport_2()
	SetPlot( OwnerID()  , "range", "LuaI_423008_Transport_3" , 30 )
end

function LuaI_423008_Transport_3()
	local Zone = 15
	local Room = 0
	local X , Y , Z ,Dir = -9027 , -129 , 9875 , 360
	ChangeZone( OwnerID() , Zone , Room , X , Y, Z , Dir )
end

function LuaM_506190_0()
	local Zone_i = 253 
	local Area = 1
	local Zone_f = 15
	local Room = 0
	local X , Y , Z ,Dir = -9075 , -114 , 9871 , 180
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == Zone_i and Lua_ObjAreaCheck( OwnerID() , Area ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_423009_18]" , 0 ) --由於你無法進行戰鬥導致任務失敗！請重新挑戰！
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423009_18]" , 0 )
		ChangeZone( OwnerID() , Zone_f , Room , X , Y, Z , Dir )
	end
end