
--================================================================================
--拿三袋符石回來，強化、融合、連接
---================================================================================

--(1)先有觸碰劇情
function LuaZ13WS_BeginCastBar_423839()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","LuaZ13WS_BeginCastBar_423839_1",30 )
end


--(2)執行BeginCastBar判斷
function LuaZ13WS_BeginCastBar_423839_1() 
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()
	if	CheckAcceptQuest(O_ID,423839)==true		and
		CheckCompleteQuest(O_ID,423839)==false		and
		CheckFlag(O_ID,544736)==false			and
		CountBodyItem(O_ID,209209)<3			then
		if	CountBodyItem(O_ID,209206)<1		or
			CountBodyItem(O_ID,209207)<1		or
			CountBodyItem(O_ID,209208)<1		then
			
				if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423839_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ13WS_BeginCastBar_423839_2" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				end
			
			end	
		end
	end



--(3)執行BeginCastBar後之結果
function LuaZ13WS_BeginCastBar_423839_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	
			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- 成功
						EndCastBar( O_ID, CheckStatus );	
						GiveBodyItem(O_ID,209209,1)	
						Beginplot(T_ID,"LuaZ13WS_BeginCastBar_423839_3",0)	
					else
						-- 失敗
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	

function LuaZ13WS_BeginCastBar_423839_3()
	DisableQuest(OwnerID(), true )					
	Hide(OwnerID())
	sleep(60)
	Show(OwnerID(),0)
	DisableQuest(OwnerID(), false )	
end

function LuaZ13WS_423839_ItemUse()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423839_ItemUse_1",0)
end

function LuaZ13WS_423839_ItemUse_1()
	local N=RandRange(1,6)
	if	CountBodyItem(TargetID(),209209)>0	then
		if	N==1	then
			GiveBodyItem( TargetID() ,209153 , 1 )
		end 
		if	N==2	then
			GiveBodyItem( TargetID() ,209154 , 1 )
		end 
		if	N==3	then
			GiveBodyItem( TargetID() ,209205 , 1 )
		end 
		if	N==4	then
			GiveBodyItem( TargetID() ,209206 , 1 )
		end 
		if	N==5	then
			GiveBodyItem( TargetID() ,209207 , 1 )
		end 
		if	N==6	then
			GiveBodyItem( TargetID() ,209208 , 1 )
		end 
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209209,1)
	end
end
--===================
function LuaZ13WS_423839_117371_0()
--帕提得
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423839)==true		and
		CheckCompleteQuest(OwnerID(),423839)==false	and	 
		CountBodyItem(OwnerID(),209209)<3		and
		CheckFlag(OwnerID(),544736)==false		and
		CheckFlag(OwnerID(),544776)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_0]","LuaZ13WS_423839_117371_1",0)
		--XX讓我來向你取三盒符文回去。
	end
	if 	CheckFlag(OwnerID(),544776)==true			then
			if	CountBodyItem(OwnerID(),209206)<1	or
				CountBodyItem(OwnerID(),209207)<1	or
				CountBodyItem(OwnerID(),209208)<1	then	
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_1]","LuaZ13WS_423839_117371_2",0)
				--我拿錯符文了，請讓我換一下。
			end 
	end 
end

function LuaZ13WS_423839_117371_1()
	SetSpeakDetail(OwnerID(),"[SC_423839_2]")
	--喔，你就自己拿吧，我會從那妮子早先預付給我的錢裡扣帳。
	SetFlag(OwnerID(),544776,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end 

function LuaZ13WS_423839_117371_2()
	SetSpeakDetail(OwnerID(),"[SC_423839_3]")
	--嗯嗯，一樣自己來，不招呼你啦。

	local n=0
		if 	CountBodyItem(OwnerID(),209153)>0	then
			DelBodyItem(OwnerID(),209153,1)
			n=n+1
		end 
		if 	CountBodyItem(OwnerID(),209154)>0	then
			DelBodyItem(OwnerID(),209154,1)
			n=n+1
		end 
		if 	CountBodyItem(OwnerID(),209205)>0	then
			DelBodyItem(OwnerID(),209205,1)
			n=n+1
		end 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,3-n )	
end 


--================

function LuaZ13WS_423839_117339_0()
--絲達
	LoadQuestOption(OwnerID())
	local n=0
	if	CheckAcceptQuest(OwnerID(),423839)==true		and
		CheckCompleteQuest(OwnerID(),423839)==false		and
		CheckFlag(OwnerID(),544736)==false		then
			
			if 	CountBodyItem(OwnerID(),209206)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			if 	CountBodyItem(OwnerID(),209207)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			if 	CountBodyItem(OwnerID(),209208)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			
			if	n==3	then
				if 	CountBodyItem(OwnerID(),209153)>0	or
					CountBodyItem(OwnerID(),209154)>0	or
					CountBodyItem(OwnerID(),209205)>0	then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_4]","LuaZ13WS_423839_117339_3",0)
					--我把你要的符文帶回來了。
				else
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_4]","LuaZ13WS_423839_117339_1",0)
					--我把你要的符文帶回來了。
				end	
			else	
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_5]","LuaZ13WS_423839_117339_2",0)
				--啊，我沒有拿回足夠的符文，請再等我一下。
			end
	end
end

function	LuaZ13WS_423839_117339_1()
	SetSpeakDetail(OwnerID(),"[SC_423839_6]")
	--喔喔，讓我看一下你拿的符文對不對......
	SetFlag(OwnerID(),544736,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end

function LuaZ13WS_423839_117339_2()
	SetSpeakDetail(OwnerID(),"[SC_423839_7]")
	--快、快，我急著用的說。
end

function LuaZ13WS_423839_117339_3()
	SetSpeakDetail(OwnerID(),"[SC_423839_8]")
	--只讓你拿三盒回來啊，你怎麼拿了不止三盒，傷腦筋的說，算了，反正以後也用得上。
	SetFlag(OwnerID(),544736,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end




--================================================================================
--記憶核心修畢
--================================================================================
function LuaZ13WS_423810_0()
--種一個隱形球，代替怪東西說話
	DisableQuest(OwnerID(), true )--絲達
	AddBuff(TargetID(),509021,1,600)--玩家
	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--搜尋npc身邊 400範圍內的NPC，放入陣列內
	local center
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 117567	 then
			center= NPC[i]
			break	
		end
	end
	local X=ReadRoleValue(center,EM_RoleValue_X)
	local Y=ReadRoleValue(center,EM_RoleValue_Y)
	local Z=ReadRoleValue(center,EM_RoleValue_Z)
	local thing=CreateObj( 117710 , X,Y,Z,1,1 )

	ks_ActSetMode(thing)
	Say(thing,"[SC_423810_0]")
	Sleep(30)
	Say(thing,"[SC_423810_1]")
	Sleep(30)
	Say(thing,"[SC_423810_2]")
	Sleep(30)
	Say(thing,"[SC_423810_3]")
	Sleep(30)
	Say(thing,"[SC_423810_4]")
	Sleep(30)
	Say(thing,"[SC_423810_5]")
	Sleep(30)
	Setflag(TargetID(),544737,1)
	Delobj(thing)
	CancelBuff(TargetID(),509021)
	DisableQuest(OwnerID(), false )
end


--================================================================================
--記憶核心充電畢
--================================================================================
function	LuaZ13WS_423841_0()
	AddBuff(TargetID(),509023,1,600)--玩家
	DisableQuest(OwnerID(), true )--絲達

	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--搜尋npc身邊 400範圍內的NPC，放入陣列內
	local center
	local power	
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 117567	 then
			center= NPC[i]
			break	
		end
	end
	Hide(center)
	local X=ReadRoleValue(center,EM_RoleValue_X)
	local Y=ReadRoleValue(center,EM_RoleValue_Y)
	local Z=ReadRoleValue(center,EM_RoleValue_Z)
	local D=ReadRoleValue(center,EM_RoleValue_Dir)
	local mmm=CreateObj( 117343 , X,Y,Z,D,1 )
	Hide(mmm)
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_Orgid ) == 117702	 then
			power= NPC[i]
			break	
		end
	end
	CastSpell(power,mmm,497201)
	AddBuff(power,507556,1,60)
	AddBuff(mmm,507556,1,60)
	PlayMotion( mmm, ruFUSION_ACTORSTATE_CAST_SP01)
	Show(mmm,0)
	AddBuff(mmm,507556,1,60)
	AdjustFaceDir( OwnerID(), mmm, 0 )
	Beginplot(OwnerID(),"LuaZ13WS_423841_1",0)
	PlayMotion(mmm,ruFUSION_ACTORSTATE_CAST_SP02)
	Sleep(50)
	AddBuff(mmm,507556,1,60)
	Sleep(50)
	CancelBuff(power,507556)
	CancelBuff(TargetID(),509023)

	Delobj(mmm)
	Show(center,0)
	DisableQuest(OwnerID(), false )
end 

function LuaZ13WS_423841_1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
end

--================================================================================
--與記憶核心對話
--================================================================================
function LuaZ13WS_423842_117566()
LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423842)==true		and
		CheckCompleteQuest(OwnerID(),423842)==false		and
		CheckFlag(OwnerID(),544738)==false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_0]","LuaZ13WS_423842_117566_1",0)
		--你是什麼？
	end
end

function LuaZ13WS_423842_117566_1()
	SetSpeakDetail(OwnerID(),"[SC_423842_1]")
	--是守護者的記憶核心，在墜毀之後，脫離本體而獨立存在。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_2]","LuaZ13WS_423842_117566_2",0)
	--守護者是什麼？
end

function LuaZ13WS_423842_117566_2()
	SetSpeakDetail(OwnerID(),"[SC_423842_3]")
	--守護所有弱小的人形生物，清除魔族，收回或摧毀禁忌符文。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_4]","LuaZ13WS_423842_117566_3",0)
	--魔族是什麼
end

function LuaZ13WS_423842_117566_3()
	SetSpeakDetail(OwnerID(),"[SC_423842_5]")
	--魔族即是將禁忌符文?入體內，改造自己以追求不屬於己身的強大力量，充滿野心的危險份子，必須毀滅
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_6]","LuaZ13WS_423842_117566_4",0)
	--神諭祝福之血是什麼？
end

function LuaZ13WS_423842_117566_4()
	SetSpeakDetail(OwnerID(),"[SC_423842_7]")
	--神諭祝福之血，擁有者將成為英雄，或墮落為魔族。
	Setflag(OwnerID(),544738,1)

end