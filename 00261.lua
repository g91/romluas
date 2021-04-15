function LuaS_110099_0()

	if CheckCompleteQuest( OwnerID(), 420161 ) == true and CheckFlag( OwnerID(), 540249) ~= true then  
		SetSpeakDetail( OwnerID(), GetString("ST_110099_0")   );
		--/*好吧！我就把這故事告訴你：
		--在廣闊的愛爾諾伊海中，最出名的人要算是大冒險家「道特˙威迪歐」了，威迪歐從十一歲開始就在這片海洋冒
		--險，三十年的海洋生涯，發掘出來的寶藏多不勝數。可是在他四十歲時，卻突然從這片海洋消失匿跡，再也沒有
		--人知道他的下落，不過，人們更關心的是，他所挖掘出來的寶藏，到底藏在哪裡？

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_1") , "LuaS_110099_1", 0 ) 
		--/*這故事我自小就耳熟能詳了，價值連城的地方在哪裡？

	else
		LoadQuestOption( OwnerID() );	--載入任務，在接了任務之後要關閉
	end
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110099_1")   );
	--/*價值連城的地方就在於：「道特˙威迪歐」寶藏沒人知道在哪裡，但是我倒是有些線索，不過～我想先試試你是否有足
	--  夠的勇氣去探索這秘密。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_2") , "LuaS_110099_2", 0 ) 
	--/*我應該如何證明我的勇氣？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110099_2")   );
	--/*如果你能到水手墓場去拿些東西回來，我將會把我所知道的線索分享給你，這是很危險的一件事，要不要去你自己考
	--  慮清楚。如果願意的話，再來找我！
	SetFlag( OwnerID() , 540249, 1)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------
Function LuaI_110124() 

	SetPlot( OwnerID() , "touch" , "LuaQ_420163_ClickObj" , 40 )

END
--------------------------------------------------------------------------------------------------------------------
Function LuaQ_420163_ClickObj()

	if CheckFlag( OwnerID(), 540250) ~= true and CountBodyItem( OwnerID(), 200687) > 0 then -- 讓玩家打敗水手後不能再把水手叫出來
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
		BeginPlot( TargetID(),"LuaQ_420163_Sum",0)	
	end

END
--------------------------------------------------------------------------------------------------------------------
function LuaQ_420163_Sum()

	local Owner = Role:new( OwnerID() )
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	local X = Owner:X() 
	local Y = Owner:Y() 
	local Z = Owner:Z()
	local SeaDog_A = CreateObj( 100038, X+50 , Y ,  Z, 0 , 1 )--怪物代用
	local SeaDog_B = CreateObj( 100038, X, Y ,  Z+50, 0 , 1 )--怪物代用
	local SeaDog_C = CreateObj( 100038, X-50 , Y ,  Z-50, 0 , 1 )--怪物代用

	AddToPartition( SeaDog_A,0)
	AddToPartition( SeaDog_B,0)
	AddToPartition( SeaDog_C,0)
	BeginPlot(SeaDog_A,"LuaQ_420163_Sui",0)
	BeginPlot(SeaDog_B,"LuaQ_420163_Sui",0)
	BeginPlot(SeaDog_C,"LuaQ_420163_Sui",0)
	SetAttack( SeaDog_A , TargetID() )
	SetAttack( SeaDog_B , TargetID() )
	SetAttack( SeaDog_C , TargetID() )
	sleep(30)
	while 1 do

		if CheckID(SeaDog_A) == false and CheckID(SeaDog_B) == false and CheckID(SeaDog_C) == false then

			if  Luafunc_Player_Alive( TargetID(),DBID,150 ) == true or ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
					--日記燒掉的特效
					Hide( OwnerID())
					SetFlag( TargetID(),540250,1)
			end
			break
		end
		sleep( 30 )
	end
	sleep( 200 )
	Show( OwnerID() ,0)
	SetPlot( OwnerID() , "touch" , "LuaQ_420163_ClickObj" , 40 )
	
end
--------------------------------------------------------------------------------------------------------------------
function LuaQ_420163_Sui() 
	LuaFunc_Obj_Suicide(300)
end	
---------------------------------------------------------------------