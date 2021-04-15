function LuaYU_Mala2_Showlearn() -- 遊戲教學

--	Say(  OwnerID() ,"OwnerID()" )--玩家
--	Say(  TargetID() ,"TargetID()" )--瑪拉
	WriteRoleValue( TargetID()  , EM_RoleValue_Register+3 , 1 ) --紀錄玩家正在進行教學模式
	SetModeEx( TargetID()  , EM_SetModeType_Show , false ) --不顯示
	SetModeEx( TargetID()  , EM_SetModeType_Mark, false )--不標記
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

	local MalatinaShow = CreateObj( 111813 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx( MalatinaShow  , EM_SetModeType_Mark, false )--不標記
	AddToPartition( MalatinaShow , RoomID )  

	WriteRoleValue( MalatinaShow  , EM_RoleValue_Register ,  TargetID()  ) --記住任務瑪拉蒂娜

	BeginPlot(  MalatinaShow  , "LuaYU_Mala2_learn" , 0 )  

	Hide( TargetID())
	CloseSpeak( OwnerID() ) 
end

function LuaYU_Mala2_learn() -- 遊戲教學

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	local MissionMala = ReadRoleValue( OwnerID() , EM_RoleValue_Register ) --任務瑪拉

--	Say(OwnerID(), "OwnerID")--假教學用瑪拉
--	Say(TargetID(), "TargetID")--玩家
	sleep(10)
	PlayMotion( OwnerID(), 112)  --說話
	Say( OwnerID(), "[SC_113120_MALA2_08]")	--呦～唧唧唧唧～真正的冒險者總是會留意提示與規則，那麼開始吧！
	sleep(40)
	Show(  MissionMala ,RoomID)
	SetModeEx( MissionMala  , EM_SetModeType_Show , false ) --不顯示
	PlayMotion( OwnerID(), 112)  --說話
	Say( OwnerID(), "[SC_113120_MALA2_09]")	--冒險者，這次要給你的考驗將會是需要運用思考，規劃出最佳路線，並且和時間競賽的奪寶遊戲！
	sleep(40)
	PlayMotion( OwnerID(), 122)  --idel03
	sleep(15)
	AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( OwnerID()  , EM_SetModeType_Show , false ) --不顯示

--教學內容開始：巨型藤蔓

	local MalaTina01 = CreateObjByFlag( 111813, 780309 , 0 , 1 );----------------------------------------旗標號碼：0 表演用瑪拉
	SetModeEx( MalaTina01 , EM_SetModeType_Move, false )--移動
	SetModeEx( MalaTina01 , EM_SetModeType_Mark, false )--標記
	AddToPartition( MalaTina01 , RoomID )  

	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)

	PlayMotion( MalaTina01, 112)  --說話
	Say( MalaTina01, "[SC_113120_MALA2_10]")	--想要順利奪取寶藏，你必須好好記住六個不同性質的障礙 - 魔法封印，需要解放後加以摧毀才能通過！
	sleep(10)
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(30)
	local Floor01 = CreateObjByFlag( 113110, 780309 , 1 , 1 );--巨型藤蔓地板
	SetModeEx( Floor01 , EM_SetModeType_Mark, false )--標記
	SetModeEx( Floor01 , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( Floor01 , RoomID )  
	sleep(10)	

	Say( MalaTina01, "[SC_113120_MALA2_11]")	--這是<CY>封印(巨型藤蔓)</CY> ，需要<CS>點擊</CS>來解放他！
	sleep(30)	

	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

	local MalaTina02 = CreateObjByFlag( 111813, 780309 , 5 , 1 );----------------------------------------旗標號碼：5 表演用瑪拉
	SetModeEx( MalaTina02 , EM_SetModeType_Move, false )--移動
	SetModeEx( MalaTina02 , EM_SetModeType_Mark, false )--標記
	AddToPartition( MalaTina02 , RoomID )  

	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --面向
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	BeginPlot(  MalaTina02  , "LuaYU_111813_00" , 0 )  

	SetModeEx(  Floor01  , EM_SetModeType_Show , false ) --不顯示

	local Floor01_2 = CreateObjByFlag( 113104, 780309 , 1 , 1 );--巨型藤蔓
	SetModeEx( Floor01_2 , EM_SetModeType_Mark, false )--標記
	SetModeEx( Floor01_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( Floor01_2 , RoomID )  
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_12]")	--這是解放後的<CY>野生的巨型藤蔓</CY>，粗暴的砍伐他只會獲得一些樹枝，並無法通過，但是這些樹枝可以用來引火燃燒...唧唧唧唧～
	sleep(40)	
	AddBuff( Floor01_2 ,503990 ,1 , 3 ); --燃燒
	sleep(30)	
	CancelBuff( Floor01_2 ,503047 )
	sleep(10)	
	PlayMotion( Floor01_2, 145) --播放動作：ACTIVATE_BEGIN
	PlaySound( Floor01_2, "sound\\fx\\skill\\fire\\act_flame01_c_hand.wav", false )
	sleep(30)	
	SetModeEx(  Floor01_2  , EM_SetModeType_Show , false ) --不顯示
	Delobj(Floor01_2)
	SetModeEx(  Floor01  , EM_SetModeType_Show , true ) --顯示
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_13]") --這是<CY>封印(巨型藤蔓)</CY> ，好好記住！唧唧唧唧～
	Sleep(40)

--教學內容：大型拒馬
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --顯示
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	Delobj(Floor01)	
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(40)
	local Floor02 = CreateObjByFlag( 113108, 780309 , 1 , 1 );--大型拒馬地板
	SetModeEx( Floor02 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor02 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor02 , RoomID )  


	Say( MalaTina01, "[SC_113120_MALA2_14]") --這是<CY>封印(巨人的煉鐵拒馬)</CY> ，只要<CS>靠近</CS>就會解放！
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

--	SetPosByFlag( MalaTina01, 780309 , 4 )--傳送到 X 號旗子

	local MalaTina03 = CreateObjByFlag( 111813, 780309 , 4 , 1 );----------------------------------------旗標號碼：4 表演用瑪拉
	SetModeEx( MalaTina03 , EM_SetModeType_Move, false )--移動
	SetModeEx( MalaTina03 , EM_SetModeType_Mark, false )--標記
	AddToPartition( MalaTina03 , RoomID )  

	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --面向
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	BeginPlot(  MalaTina03  , "LuaYU_111813_00" , 0 )  

	SetModeEx(  Floor02  , EM_SetModeType_Show , false ) --不顯示
	local Floor02_2 = CreateObjByFlag( 102382, 780309 , 1 , 1 );--大型拒馬
	SetModeEx( Floor02_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor02_2 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor02_2 , RoomID )  

	Say( MalaTina03, "[SC_113120_MALA2_15] ") --<CY>巨人的煉鐵拒馬</CY>堅固的幾乎難以摧毀，但是你可以利用<CS>火砲</CS>進行破壞。
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_16] ") --至於要如何使用火砲？待會再說，唧唧唧唧～
	sleep(40)
	SetModeEx(  Floor02_2  , EM_SetModeType_Show , false ) --不顯示
	Delobj(Floor02_2)
	SetModeEx(  Floor02  , EM_SetModeType_Show , true ) --顯示	
	Say( MalaTina03, "[SC_113120_MALA2_17] ") --這是<CY>封印(巨人的煉鐵拒馬)</CY> ，好好記住！唧唧唧唧～
	Sleep(30)
--教學內容：火砲
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina03 , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina01 , EM_SetModeType_Show , true ) --顯示
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
--	SetPosByFlag( MalaTina01, 780309 , 0 )--傳送到 X 號旗子
	Delobj(Floor02)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(40)
	local Floor03 = CreateObjByFlag( 113109, 780309 , 1 , 1 );--大型火砲地板
	SetModeEx( Floor03 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor03 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor03 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_18] ") --這是<CY>封印(重型火砲車)</CY> ，需要<CS>點擊</CS>來解放他！
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina02    , EM_SetModeType_Show , true ) --顯示
	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --面向
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	
	SetModeEx(  Floor03  , EM_SetModeType_Show , false ) --不顯示
	local Floor03_2 = CreateObjByFlag( 113103, 780309 , 1 , 1 );--大型火砲台
	SetModeEx( Floor03_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor03_2 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor03_2 , RoomID )  
	Say( MalaTina02, "[SC_113120_MALA2_19] ") --只要操作<CY>重型火砲車</CY>，便可獲得召喚火砲攻擊的技能，只要選擇<CY>炮擊目標</CY>便可進行攻擊。
	sleep(30)	
	local Floor03_3 = CreateObjByFlag( 102382, 780309 , 8 , 1 );--被炸用拒馬
	SetModeEx( Floor03_3 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor03_3 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor03_3 , RoomID )  
	sleep(30)
	Say( MalaTina02, "[SC_113120_MALA2_20]") --你必須十分確定<CY>炮擊目標</CY>再下達炮擊命令，別被視角誤導射偏了，反覆確認<CS>目標的名稱</CS>吧！唧唧唧唧～
	sleep(30)
	local Floor03_4 = CreateObjByFlag( 113115, 780309 , 8 , 1 );--轟炸目標
	SetModeEx( Floor03_4 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor03_4 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor03_4 , RoomID )  

	AdjustFaceDir( Floor03_2, Floor03_3 , 0 ) --面向
	sleep(5)
	PlaySound( Floor03_2, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlayMotion( Floor03_2, 161)  --Buff0

	sleep(15)

	CastSpelllv( Floor03_4 , Floor03_4 , 493655 , 1 )
	PlaySound( Floor03_3, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlaySound( Floor03_3, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	PlayMotion( Floor03_3, 145) --播放動作：ACTIVATE_BEGIN
	Delobj(Floor03_4)

	sleep(10)
	Say( MalaTina02, "[SC_113120_MALA2_21] ") --提醒你，一座重型火砲車<CS>只有一顆火藥</CS>！選擇正確的炮擊目標非常重要！
	sleep(10)
	Delobj(Floor03_3)
	sleep(20)
	PlayMotion( Floor03_2, 145) --播放動作：ACTIVATE_BEGIN
	Delobj(Floor03_2)
	sleep(20)	
	SetModeEx(  Floor03  , EM_SetModeType_Show , true ) --顯示
--	Show(Floor03 , RoomID )	
	Say( MalaTina02, "[SC_113120_MALA2_22] ") --這是<CY>封印(重型火砲車)</CY> ，好好記住！唧唧唧唧～
	Sleep(30)


--教學內容：禁錮
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --顯示
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)

--	SetPosByFlag( MalaTina01, 780309 , 0 )--傳送到 X 號旗子
	Delobj(Floor03)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(40)
	local Floor04 = CreateObjByFlag( 113111, 780309 , 1 , 1 );--禁錮
	SetModeEx( Floor04 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor04 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor04 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_23] ") --這是<CY>封印(虛空召喚結界)</CY> ，只要<CS>靠近</CS>就會解放！
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina03    , EM_SetModeType_Show , true ) --顯示
	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --面向
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	
	SetModeEx(  Floor04  , EM_SetModeType_Show , false ) --不顯示

	local Floor04_2 = CreateObjByFlag( 102368, 780309 , 1 , 1 );--禁錮結界
	SetModeEx( Floor04_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor04_2 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor04_2 , RoomID )  
	Say( MalaTina03, "[SC_113120_MALA2_24] ") --唧唧唧唧～不小心解放了<CY>虛空召喚結界</CY>就是你噩夢的開始，他會召喚<CS>小丑之魂</CS>對你進行攻擊！
	sleep(40)	
	local Rghost = LuaFunc_CreateObjByObj ( 102369 , Floor04_2 )
	SetModeEx( Rghost , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Rghost , EM_SetModeType_Mark, false )--標記
	SetFightMode( Rghost , 0, 0, 0, 0 )
	AddBuff( Rghost ,503993 ,1 , 1 ); --傳送特效
	sleep(20)	
	Say( MalaTina03, "[SC_113120_MALA2_25] ") --擊敗<CS>小丑之魂</CS>他依然會重生在<CY>虛空召喚結界</CY>，只有摧毀<CY>虛空召喚結界</CY>才能終止他！
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_26] ") --喔！對，唧唧唧唧～當他還是封印時，直接使用重型火砲車摧毀他也不錯。
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_27]  ") --直接擊敗<CS>小丑之魂</CS>他會在短時間內重生，當然，有更好的辦法！
	sleep(30)
	PlayMotion( Floor04_2, 145) --播放動作：ACTIVATE_BEGIN
	PlaySound( Floor04_2, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	Delobj(Floor04_2)
	Delobj(Rghost)
	sleep(20)	
	SetModeEx(  Floor04  , EM_SetModeType_Show , true ) --不顯示
--	Show(Floor04 , RoomID )	
	Say( MalaTina03, "[SC_113120_MALA2_28] ") --先把<CY>[113109]</CY> ，好好記住吧！唧唧唧唧～
	Sleep(30)


--教學內容：傳送門

	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina03    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --顯示
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)

	Delobj(Floor04)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(40)
	local Floor05 = CreateObjByFlag( 113113, 780309 , 1 , 1 );--傳送門地板
	SetModeEx( Floor05 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor05 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor05 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_29]") --這是<CY>封印(神秘的魔石之門)</CY> ，需要<CS>點擊</CS>來解放他！
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina02    , EM_SetModeType_Show , true ) --顯示
	AdjustFaceDir( MalaTina02, TargetID() , 0 ) --面向
	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	
	SetModeEx(  Floor05  , EM_SetModeType_Show , false ) --不顯示
	local Floor05_2 = CreateObjByFlag( 113107, 780309 , 1 , 1 );--傳送門
	SetModeEx( Floor05_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor05_2 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor05_2 , RoomID )  

	Say( MalaTina02, "[SC_113120_MALA2_30]") --當你靠近<CY>神秘的魔石之門</CY> 時，你將被迫傳送到遊戲的入口，不過某些時候這卻是個方便的功能，唧唧唧唧～
	sleep(40)	
	Say( MalaTina02, "[SC_113120_MALA2_31] ") --但若是<CS>小丑之魂</CS>靠近的話，他將會窒息並傳送回虛空結界，而且<CY>重生的時間將會延長</CY> 。
	sleep(20)

--************
	local Ghost = CreateObjByFlag( 102369, 780309 , 7 , 1 );--禁錮結界.
	SetModeEx( Ghost , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Ghost , EM_SetModeType_Mark, false )--標記
	AddToPartition( Ghost , RoomID )  
	SetFightMode( Ghost , 0, 1, 0, 0 )

	AddBuff( Ghost ,503993 ,1 , 1 ); --傳送特效


	Beginplot( Ghost ,"LuaYU_Mala2_playgo", 0 )
	sleep(25)
	AddBuff( Ghost ,503993 ,1 , 1 ); --傳送特效
	BeginPlot( Ghost , "LuaP_Dead" , 0 )   
	sleep(30)
	SetModeEx(  Ghost  , EM_SetModeType_Show , false ) --不顯示
	Delobj( Ghost )
	sleep(20)
--************

	Delobj(Floor05_2)
	sleep(10)	
	Say( MalaTina02, "[SC_113120_MALA2_32] ") --趁著這段空窗期對<CY>虛空召喚結界</CY>進行破壞吧！唧唧唧唧～
	sleep(30)

	SetModeEx(  Floor05  , EM_SetModeType_Show , true ) --不顯示		
	Say( MalaTina02, "[SC_113120_MALA2_33] ") --這是<CY>封印(神秘的魔石之門)</CY> ，好好記住！唧唧唧唧～
	Sleep(30)

--教學內容：鑰匙

	AddBuff( MalaTina02 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina02    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina01    , EM_SetModeType_Show , true ) --顯示
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)

	Delobj(Floor05)
	sleep(10)	
	PlayMotion( MalaTina01, 75)  --使用物品
	sleep(40)
	local Floor06 = CreateObjByFlag( 113112, 780309 , 1 , 1 );--鑰匙地板
	SetModeEx( Floor06 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor06 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor06 , RoomID )  

	Say( MalaTina01, "[SC_113120_MALA2_34]") --這是<CY>封印(寶藏之鑰)</CY> ，需要<CS>點擊</CS>來解放他！
	sleep(20)	
	PlayMotion( MalaTina01, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina01 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	SetModeEx( MalaTina01    , EM_SetModeType_Show , false ) --不顯示

	SetModeEx( MalaTina03    , EM_SetModeType_Show , true ) --顯示
	AdjustFaceDir( MalaTina03, TargetID() , 0 ) --面向
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	sleep(10)
	
	SetModeEx(  Floor06  , EM_SetModeType_Show , false ) --不顯示

	local Floor06_2 = CreateObjByFlag( 113106, 780309 , 1 , 1 );--黃金之鑰
	SetModeEx( Floor06_2 , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Floor06_2 , EM_SetModeType_Mark, false )--標記
	AddToPartition( Floor06_2 , RoomID )  
	Say( MalaTina03, "[SC_113120_MALA2_35] ") --點擊<CY>寶藏之鑰</CY>取得鑰匙後穿越<CY>終點的傳送門</CY> 將會再次回到這裡，但是這個時候，你擁有鑰匙！
	sleep(40)	
	Say( MalaTina03, "[SC_113120_MALA2_36] ") --開完寶箱之後，如果還有時間，只要靠近大門將會進入下一回合！屆時，將會有更多的<CY>封印(寶藏之鑰)</CY>。
	sleep(40)
	PlayMotion( Floor06_2, 145) --播放動作：ACTIVATE_BEGIN
	PlaySound( Floor06_2, "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	Delobj(Floor06_2)
	sleep(20)
	SetModeEx(  Floor06  , EM_SetModeType_Show , true ) --不顯示		
	Say( MalaTina03, "[SC_113120_MALA2_37] ") --這是<CY>封印(寶藏之鑰)</CY> ，好好記住！唧唧唧唧～
	Sleep(20)
	AddBuff( MalaTina03 ,503993 ,1 , 1 ); --傳送特效
	Sleep(10)

	Delobj(Floor06)
	Delobj(MalaTina03)
	Delobj(MalaTina02)
	Delobj(MalaTina01)

--	Show(OwnerID() , RoomID )
	SetModeEx(  OwnerID()  , EM_SetModeType_Show , true ) --顯示
	AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
	Sleep(10)

	PlayMotion( OwnerID(), 112)  --說話
	Say( OwnerID() , "[SC_113120_MALA2_38] ") -- 呦～唧唧唧唧～第一回合只有一個<CY>封印(寶藏之鑰)</CY>，第二回合則有兩個，以此類推！
	Sleep(40)
	PlayMotion( OwnerID(), 122) --idel03
	Say( OwnerID() , "[SC_113120_MALA2_39] ") --在遊戲時限內，你能奪取多少個鑰匙，又能開啟多少個寶箱呢？唧唧唧唧～
	Sleep(40)
	WriteRoleValue( MissionMala  , EM_RoleValue_Register+3 , 0 ) --紀錄玩家正在進行教學模式
	SetModeEx(  MissionMala  , EM_SetModeType_Mark, true )--標記
	SetModeEx(  MissionMala  , EM_SetModeType_Show , true ) --顯示
--	Show(  MissionMala ,RoomID)
	SetModeEx(  OwnerID()  , EM_SetModeType_Show , false ) --顯示
	Delobj(OwnerID())

end

function LuaYU_Mala2_playgo()--進行遊戲的表演


	MoveDirect( OwnerID(), 4079.6 , 18.7 , 3379.5 )

end



--------------------------獎勵兌換-----------------------------------------

function LuaYU_Mala2_exchange()--獎勵兌換

	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --稱號5

	if Nickname05 ==1 then

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_79]"  ) --呦～唧唧唧唧～你開到<CM>鬼牌</CM>了嗎？收集越多鬼牌，我會給你越好的報酬唷～唧唧唧唧～
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_71]" , "LuaYU_Mala2_exchange_01", 0 ) -- 兌換稱號
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_72]" , "LuaYU_Mala2_exchange_02", 0 ) -- 兌換巫術卷軸
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --回上一頁

	else

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_79]"  ) --呦～唧唧唧唧～你開到<CM>鬼牌</CM>了嗎？收集越多鬼牌，我會給你越好的報酬唷～唧唧唧唧～
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_71]" , "LuaYU_Mala2_exchange_01", 0 ) -- 兌換稱號
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_72]" , "LuaYU_Mala2_exchange_02", 0 ) -- 兌換巫術卷軸
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --回上一頁

	end
end

function LuaYU_Mala2_exchange_01()--兌換稱號

	local Nickname01 =  CountBodyItem( OwnerID() , 530121 )    --稱號1
	local Nickname02 =  CountBodyItem( OwnerID() , 530122 )    --稱號2
	local Nickname03 =  CountBodyItem( OwnerID() , 530123 )    --稱號3
	local Nickname04 =  CountBodyItem( OwnerID() , 530124 )    --稱號4
	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --稱號5

	local Jokcard = 0

	if Nickname04 == 1 then
		Jokcard = 250
	elseif Nickname03 == 1 then
		Jokcard = 200
	elseif Nickname02 == 1 then
		Jokcard = 150
	elseif Nickname01 == 1 then
		Jokcard = 100
	elseif Nickname01 == 0 then
		Jokcard = 50
	end

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_74]"..Jokcard  ) 

--唧唧唧唧～在這次的挑戰裡，<CM>[205792]</CM>是非常不容易獲得，而又是能夠兌換多種特殊功能物品的管道之一！想獲得特別的稱號嗎？這次我要求的<CM>[205792]</CM>數量：
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]" , "LuaYU_Mala2_exchangeNK", 0 ) -- 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁
end

function LuaYU_Mala2_exchangeNK()--兌換稱號

	local Nickname01 =  CountBodyItem( OwnerID() , 530121 )    --稱號1
	local Nickname02 =  CountBodyItem( OwnerID() , 530122 )    --稱號2
	local Nickname03 =  CountBodyItem( OwnerID() , 530123 )    --稱號3
	local Nickname04 =  CountBodyItem( OwnerID() , 530124 )    --稱號4
	local Nickname05 =  CountBodyItem( OwnerID() , 530125 )    --稱號5

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --鬼牌

---------2011.08.08 修正玩家於副本內與瑪拉蒂娜(113120)兌換稱號後，於遊戲中點擊重型火砲車(113103)時，無法使用砲擊技能，並且在對話視窗中顯示『已經開啟一個對話選項』提示的錯誤--------
	local RunTime = 0
	local DialogStatus = 0
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
----------------------------------------------------------------------------------------
	local Jokcard = 0

	if Nickname04 == 1 then
		Jokcard = 250
	elseif Nickname03 == 1 then
		Jokcard = 200
	elseif Nickname02 == 1 then
		Jokcard = 150
	elseif Nickname01 == 1 then
		Jokcard = 100
	elseif Nickname01 == 0 then
		Jokcard = 50
	end

	local Nickname = 0

	if JOK >= Jokcard then

		if Nickname04 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530124 , 1 )
			GiveBodyItem( OwnerID() , 530125 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		--		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530125] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530125] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530125] ]", 0 )
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530125] ]", 0 )
		--	end
		elseif Nickname03 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530123 , 1 )
			GiveBodyItem( OwnerID() , 530124 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03

		--	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		--		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530124] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530124] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530124] ]", 0 )
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530124] ]", 0 )
		--	end			
		elseif Nickname02 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530122 , 1 )
			GiveBodyItem( OwnerID() , 530123 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
		--	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		--		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530123] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530123] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530123] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530123] ]", 0 );
		--	end
		elseif Nickname01 == 1 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			--DelBodyItem( OwnerID() , 530121 , 1 )
			GiveBodyItem( OwnerID() , 530122 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		--		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530122] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530122] ]" )
			---	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530122] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530122] ]", 0 );
		--	end
		elseif Nickname01 == 0 then

			CloseSpeak( OwnerID() )   					
			DelBodyItem( OwnerID() , 205792 , Jokcard )
			GiveBodyItem( OwnerID() , 530121 , 1 )
			PlayMotion( TargetID() , 121 )  --idel03
			
		--	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		--		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GETTITLE_2][$SETVAR1 = [530121] ]" , C_YELLOW )
			--	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530121] ]" )
			--	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530121] ]", 0 );
		--		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530121] ]", 0 );
		--	end
		end

--取得稱號顯示框
--		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = Nickname ]" )
--		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
--		if CheckBuff( OwnerID() , 501570 ) == false then  --增加檢查判斷
--			return
--		end
		
--		if( DialogSendOpen( OwnerID() ) == false ) then 
--			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
--			return 0
--		end

--		while true do
 --			Sleep(1)
 --			RunTime = RunTime + 1
 --			if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
 --		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_OVERTIME_MSG]", 0 )
 --				CancelBuff( OwnerID() , 501570 )
 --				DialogClose( OwnerID() )
 --				break
 --			end
 --			DialogStatus = DialogGetResult( OwnerID() )
 --			--Say( PlayerID , DialogStatus )
 --		--	DebugMsg( OwnerID() , Room , "DialogStatus = "..DialogStatus )
 --			if DialogStatus == -2 then
 --				-- DO nothing
 --			elseif DialogStatus == 0  then
 --				CancelBuff( OwnerID() , 501570 )
 --				DialogClose( OwnerID() )
 --				break
 --			end
 --		end
--取得稱號顯示框(以上)
	else
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID() , TargetID() , "[SC_111352_2]" , "LuaYU_Mala2_exchange_01" , 0 ) --回上一頁
	end
end

function LuaYU_Mala2_exchange_02()--兌換巫術卷軸

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_56]"  ) --關於巫咒卷軸
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203032]" , "LuaYU_Mala2_exchange_02_1", 0 ) -- 兌換巫咒卷軸(延長時限)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203029]" , "LuaYU_Mala2_exchange_02_2", 0 ) -- 兌換巫咒卷軸(火砲置換)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203030]" , "LuaYU_Mala2_exchange_02_3", 0 ) -- 兌換巫咒卷軸(瞬間傳送)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_73]".."[203031]" , "LuaYU_Mala2_exchange_02_4", 0 ) -- 兌換巫咒卷軸(邪惡凍結)  10 : 1
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁
end

function LuaYU_Mala2_exchange_02_1()--巫咒卷軸(延長時限)

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --鬼牌

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203032 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁

	end
end

function LuaYU_Mala2_exchange_02_2()--巫咒卷軸(火砲置換)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --鬼牌

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203029 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁

	end
end

function LuaYU_Mala2_exchange_02_3()--巫咒卷軸(瞬間傳送)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --鬼牌

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203030 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁

	end
end

function LuaYU_Mala2_exchange_02_4()--巫咒卷軸(邪惡凍結)						

	local JOK =  CountBodyItem( OwnerID() , 205792 )    --鬼牌

	if JOK >= 10 then

		CloseSpeak( OwnerID() )   					
		DelBodyItem( OwnerID() , 205792 , 10 )
		GiveBodyItem( OwnerID() , 203031 , 1 )
		PlayMotion( TargetID(), 121)  --idel03

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_exchange", 0 ) --回上一頁

	end
end

--*********************************************************

function LuaYU_delNICKNAME()--刪除所有稱號

	DelBodyItem( OwnerID() , 530121 , 1 )
	DelBodyItem( OwnerID() , 530122 , 1 )
	DelBodyItem( OwnerID() , 530123 , 1 )
	DelBodyItem( OwnerID() , 530124 , 1 )
	DelBodyItem( OwnerID() , 530125 , 1 )

	Say( OwnerID(), "OK")

end