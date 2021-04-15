function un_wepen75_01()   --弟子的說話選項   一：
	local own = OwnerID()
	LoadQuestOption( own )  --show出模板對話
	local choice = {"[SC_117939_12]","[SC_117939_18]","[SC_117939_30]",
					"[SC_117939_32]","[SC_117939_34]"}--點擊的觸發的script
	local SpeakOption = {"un_wepen75_02","un_wepen75_04","un_wepen75_05",
						 "un_wepen75_08","un_wepen75"}--對話選項
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
function un_wepen75_02()
SetSpeakDetail( OwnerID(), GetString("SC_117939_13") )--1.（繼續聽）。（接對話B）
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_14]", "un_wepen75_06", 0 )
end
function un_wepen75_03()
SetSpeakDetail( OwnerID(), GetString("SC_117940_02") )--2.詢問詳請。（接對話D）
end
function un_wepen75_04()
SetSpeakDetail( OwnerID(), GetString("SC_117939_19") )--3.詢問素材清單。（接對話E）
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_20]", "un_wepen75_04_1", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_22]", "un_wepen75_04_2", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_24]", "un_wepen75_04_3", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_26]", "un_wepen75_04_4", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_28]", "un_wepen75_04_5", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end
function un_wepen75_04_1()
SetSpeakDetail( OwnerID(), GetString("SC_117939_21") )
end
function un_wepen75_04_2()
SetSpeakDetail( OwnerID(), GetString("SC_117939_23") )
end
function un_wepen75_04_3()
SetSpeakDetail( OwnerID(), GetString("SC_117939_25") )
end
function un_wepen75_04_4()
SetSpeakDetail( OwnerID(), GetString("SC_117939_27") )
end
function un_wepen75_04_5()
SetSpeakDetail( OwnerID(), GetString("SC_117939_29") )
end
function un_wepen75_05()
SetSpeakDetail( OwnerID(), GetString("SC_117939_31") )--4.詢問取得地點。（接對話F）
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
end

---------------------------------------------------------------------------------------------對話第一層*****
function un_wepen75_06()   --是的
SetSpeakDetail( OwnerID(), GetString("SC_117939_15") )--5.詢問憑證。（接對話G-0）
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_16]", "un_wepen75_07", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end

function un_wepen75_07()
SetSpeakDetail( OwnerID(), GetString("SC_117939_17") )--5.詢問憑證。（接對話G-0）
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end
function un_wepen75_08()   --「詢問憑證」（對話G-0）
	SetSpeakDetail( OwnerID(), GetString("SC_117939_33") )
	AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_34]", "un_wepen75", 0 )
end

--------------------------------------------------------------------------------------------------------------
function un_wepen75()                                 --6.兌換憑證。（接對話G）
	local own = OwnerID()
	LoadQuestOption( own )  --show出模板對話
	local choice = {"[SC_117939_05]","[SC_117939_02]","[SC_117939_03]",
					"[SC_117939_04]","[SC_117939_01]"}--點擊的觸發的script
	local SpeakOption = {"un_wepenchoice75_4","un_wepenchoice75_1","un_wepenchoice75_2",
						 "un_wepenchoice75_3","un_wepenchoice75_5"}--對話選項
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
----------------------------------------------------------------------------------------------------------------
										--75一階橘武
----------------------------------------------------------------------------------------------------------------
function un_wepenchoice75_1()  --OwnerID() = 觸發的人 , TargetID() = NPC
	local own = OwnerID()
	local item = {209322,209323,209324,209325,209326}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --檢查是否有足材料
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --刪除材料
		end
		GiveBodyItem( own, 209392, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_2()
	local own = OwnerID()
	local item = {209327,209328,209329,209330,209331}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --檢查是否有足材料
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --刪除材料
		end
		GiveBodyItem( own, 209393, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_3()
	local own = OwnerID()
	local item = {209332,209333,209334,209335}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 then                       --檢查是否有足材料
		for i=1 , 4 do
			DelBodyItem( own, item[i], 1 )                         --刪除材料
		end
		GiveBodyItem( own, 209394, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_4() --職業專屬
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local item = {209336,209337,209338,209339,209340,209341,209342,209343}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209395, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209395, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
		--CloseSpeak( own )
	end
	CloseSpeak( own )
	--[[if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --檢查是否有足材料
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --刪除材料
		end
		GiveBodyItem( own, 209394, 1 )                              --給予物品
	else
		ScriptMessage( own, TargetID(), 1, "[SC_117939_11]" , 0 )   --兌換材料不足
	end	--]]
end
function un_wepenchoice75_5()    --種子
	local own = OwnerID()
	local item = {209373}
	if CountBodyItem(own, item[1] )>=3 then                       --檢查是否有足材料
		for i=1 , 1 do
			DelBodyItem( own, item[i], 3 )                         --刪除材料
		end
		GiveBodyItem( own, 209391, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足	
	end	
	CloseSpeak( own )
end
----------------------------------------------------------------------------------------------------------------
										--75二階橘武
----------------------------------------------------------------------------------------------------------------
function un_wepenchoice75_6()
	local own = OwnerID()
	local item = {209344,209345,209346,209347,209364}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --檢查是否有足材料
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --刪除材料
		end
		GiveBodyItem( own, 209397, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_7()  --希爾洛奧斯專屬
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local item = {209348,209349,209350,209351,209352,209353,209354,209355}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209398, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209398, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_8()  --阿努比斯專屬
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local item = {209356,209357,209358,209359,209360,209361,209362,209363}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209399, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209399, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_9()  --艾娜莉亞專屬
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local item = {209365,209366,209367,209368,209369,209370,209371,209372}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209400, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209400, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_10()
	local own = OwnerID()
	local item = {209373}
	if CountBodyItem(own, item[1] )>=10 then                       --檢查是否有足材料
		for i=1 , 1 do
			DelBodyItem( own, item[i], 10 )                         --刪除材料
		end
		GiveBodyItem( own, 209396, 1 )                              --給予物品
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --兌換材料不足	
	end	
	CloseSpeak( own )
end
----------------------------------------------------------------------------------------------------------------
										--以下為橘武兌換II
----------------------------------------------------------------------------------------------------------------
function un_wepen75_2()
	local own = OwnerID()
	--local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	LoadQuestOption( own )  --show出模板對話
	local choice = {"un_wepen75get_1","un_wepen75get_2","un_wepen75get_29","un_wepen75get_3"}--點擊的觸發的script
	local SpeakOption = {"[SC_117940_27]","[SC_117940_28]","[SC_117940_31]","[SC_117939_36]"}--對話選項
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local flag = {544927,544928,544929,544930,544931,544932,544933,544934}  --檢察旗標
	local item = {209396,209397,209398,209399,209400}
	AddSpeakOption( own,TargetID( ),"[SC_117939_55]","un_wepen75get_30", 0 )
	
	if	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
		(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
		(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
		(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
		AddSpeakOption( own,TargetID( ),SpeakOption[4], choice[4], 0 )
		AddSpeakOption( own,TargetID( ),SpeakOption[3], choice[3], 0 )
		AddSpeakOption( own,TargetID( ),SpeakOption[1], choice[1], 0 )
	else
		AddSpeakOption( own,TargetID( ),SpeakOption[2], choice[2], 0 )  --過完任務才出現的選項
	end
end
function un_wepen75get_1()  --傳說選項******************************
	local own = OwnerID()
	local SpeakOption = {"un_wepen75get_01","un_wepen75get_02","un_wepen75get_03","un_wepen75get_04",
					"un_wepen75get_05","un_wepen75get_06","un_wepen75get_07","un_wepen75get_08",
					"un_wepen75get_09","un_wepen75get_10","un_wepen75get_11","un_wepen75get_12",
					"un_wepen75get_13"}--點擊的觸發的script
	local choice = {"[SC_117940_01]","[SC_117940_02]","[SC_117940_03]","[SC_117940_04]",
						"[SC_117940_05]","[SC_117940_06]","[SC_117940_07]","[SC_117940_08]",
						"[SC_117940_09]","[SC_117940_10]","[SC_117940_11]","[SC_117940_12]",
						"[SC_117940_13]"}--對話選項
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local flag = {544919,544920,544921,544922,544923,544924,544925,544926}  --檢察旗標 
	
	local item = {209396,209397,209398,209399,209400}
	if 	CountBodyItem( own, item[1] )>=1 and CountBodyItem( own, item[2] )>=1 and
		CountBodyItem( own, item[3] )>=1 and CountBodyItem( own, item[4] )>=1 and
		CountBodyItem( own, item[5] )>=1 then
		
		--say(OWnerID(),"1")
		if 	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
			(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
			(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
			(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
			ScriptMessage( own, own, 1, "[SC_117940_29]" , 0 )  --兌換過武器
			--say(OWnerID(),"2")
			CloseSpeak( own )
		else	
		SetSpeakDetail( OwnerID(), GetString("SC_117939_38"))
		--say(OWnerID(),"3")
			if job == 1 or job == 2 or job == 3 or job == 6 then  --物理
			--say(OWnerID(),"4")
				for i=1 , 9 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end	
			if job == 4 or job == 5 or job == 8  then  --法系 
				for i=10 , 13 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end
			if  job == 7 then
				for i=1 , 4 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
				for i=7 , 9 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
				for i=12 , 13 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end
		end
	else
		--say(OWnerID(),"1")
		CloseSpeak( OWnerID() )
		ScriptMessage( own, own, 1, "[SC_117940_30]" , 0 ) --煉製鍛材的素材是缺一不可，繼續努力吧。
	end	

end
function un_wepen75get_2()  --古代選項*********************************
	local own = OwnerID()
	local choice = {"un_wepen75get_14","un_wepen75get_15","un_wepen75get_16","un_wepen75get_17",
					"un_wepen75get_18","un_wepen75get_19","un_wepen75get_20","un_wepen75get_21",
					"un_wepen75get_22","un_wepen75get_23","un_wepen75get_24","un_wepen75get_25",
					"un_wepen75get_26"}--點擊的觸發的script
	local SpeakOption = {"[SC_117940_14]","[SC_117940_15]","[SC_117940_16]","[SC_117940_17]",
						"[SC_117940_18]","[SC_117940_19]","[SC_117940_20]","[SC_117940_21]",
						"[SC_117940_22]","[SC_117940_23]","[SC_117940_24]","[SC_117940_25]",
						"[SC_117940_26]"}--對話選項
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local flag = {544927,544928,544929,544930,544931,544932,544933,544934}  --檢察旗標
	local item = {209391,209392,209393,209394,209395}
	if  CountBodyItem( own, item[1] )>=1 and CountBodyItem( own, item[2] )>=1 and
		CountBodyItem( own, item[3] )>=1 and CountBodyItem( own, item[4] )>=1 and
		CountBodyItem( own, item[5] )>=1 then
		
		--say(OWnerID(),"1")
		if	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
			(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
			(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
			(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
			ScriptMessage( own, own, 1, "[SC_117940_29]" , 0 )  --兌換過武器
			--say(OWnerID(),"2")
			CloseSpeak( own )
			else
			SetSpeakDetail( OwnerID(), GetString("SC_117939_37"))
			--say(OWnerID(),"3")
			if job == 1 or job == 2 or job == 3 or job == 6 then  --物理
			--say(OWnerID(),"4")
				for i=1 , 9 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end	
			if job == 4 or job == 5 or job == 8  then  --法系 
				for i=10 , 13 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end
			if  job == 7 then
				for i=1 , 4 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
				for i=7 , 9 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
				for i=12 , 13 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end
		end	
	else
		ScriptMessage( own, own, 1, "[SC_117940_30]" , 0 ) --煉製鍛材的素材是缺一不可，繼續努力吧。
		CloseSpeak( own )
	end	
end
function un_wepen75get_3()  --詢問更強的武器。（接對話I）
	local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_39"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_16]", "un_wepen75get_3_1", 0 )--1.詢問素材。（接對話J）
	AddSpeakOption( own,TargetID( ),"[SC_117939_18]", "un_wepen75get_3_2", 0 )--2.詢問清單。（接對話K）
	AddSpeakOption( own,TargetID( ),"[SC_117939_30]", "un_wepen75get_3_3", 0 )--3.詢問取得地點。（接對話L）
	AddSpeakOption( own,TargetID( ),"[SC_117940_31]", "un_wepen75get_29", 0 )--4.兌換傳說憑證（接對話M）
end
function un_wepen75get_3_1()  --「詢問素材」（對話J）
local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_40"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_18]", "un_wepen75get_3_2", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_30]", "un_wepen75get_3_3", 0 )
end
function un_wepen75get_3_2()  --「詢問清單」（對話K
local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_41"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_42]", "un_wepen75get_3_2_1", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_43]", "un_wepen75get_3_2_2", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_44]", "un_wepen75get_3_2_3", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_45]", "un_wepen75get_3_2_4", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_46]", "un_wepen75get_3_2_5", 0 )

end
function un_wepen75get_3_2_1()  --鍛造選項1
	SetSpeakDetail( OwnerID(), GetString("SC_117939_47"))
end
function un_wepen75get_3_2_2()  --鍛造選項2
	SetSpeakDetail( OwnerID(), GetString("SC_117939_48"))
end
function un_wepen75get_3_2_3()  --鍛造選項3
	SetSpeakDetail( OwnerID(), GetString("SC_117939_49"))
end
function un_wepen75get_3_2_4()  --鍛造選項4
	SetSpeakDetail( OwnerID(), GetString("SC_117939_50"))
end
function un_wepen75get_3_2_5()  --鍛造選項5
	SetSpeakDetail( OwnerID(), GetString("SC_117939_51"))
end

function un_wepen75get_3_3() --「詢問取得地點」（對話L）
	SetSpeakDetail( OwnerID(), GetString("SC_117939_52"))
end
function un_wepen75get_01() --傳說雙手劍
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212771   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_01]")  
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_02() --傳說單手劍
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212772   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_02]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_03() --傳說雙手斧
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212773   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_03]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_04() --傳說單手斧
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212774   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_04]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_05() --傳說雙手錘
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212775   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_05]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_06() --傳說單手錘
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212776   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_06]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_07() --傳說弓
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212777   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_07]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_08() --傳說弩
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212778   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_08]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_09() --傳說匕首
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212779  --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_09]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_10() --傳說權杖(法)
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212780   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_10]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_11() --傳說權杖(補)
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212781   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_11]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_12() --傳說雙手法杖
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212782   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_12]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_13() --傳說雙手補杖
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212783   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_13]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_27()
end
function un_wepen75get_14() --古代雙手劍
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213165   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_14]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_15() --古代單手劍
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213166   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_15]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_16() --古代雙手斧
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213167   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_16]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_17() --古代單手斧
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213168   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_17]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_18() --古代雙手錘
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213169   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_18]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_19() --古代單手錘
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213170   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_19]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_20() --古代弓
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213171   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_20]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_21() --古代弩
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213172   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_21]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_22() --古代匕首
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213173   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_22]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_23() --古代權杖(法)
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213174   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_23]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_24() --古代權杖(補)
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213175   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_24]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_25() --古代雙手法杖
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213176   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_25]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_26() --古代雙手補杖
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213177   --武器
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_26]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --給武器
	un_wepen75get_28()
end
function un_wepen75get_27() --傳說總判斷*******
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local flag = {544919,544920,544921,544922,544923,544924,544925,544926} 
	if job == 1 then SetFlag(own,flag[5],1)                        --讓玩家完成任務
	elseif 	job == 2 then SetFlag(own,flag[8],1)
	elseif 	job == 3 then SetFlag(own,flag[4],1)
	elseif 	job == 4 then SetFlag(own,flag[3],1)
	elseif 	job == 5 then SetFlag(own,flag[2],1)
	elseif 	job == 6 then SetFlag(own,flag[1],1)
	elseif 	job == 7 then SetFlag(own,flag[7],1)
	elseif 	job == 8 then SetFlag(own,flag[6],1)
	end
	CloseSpeak( own )
end
function un_wepen75get_28() --古代總判斷*******
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --職業1.戰2.遊3.影4.法5.祭6.騎7.森8.神
	local flag ={544927,544928,544929,544930,544931,544932,544933,544934} 
	if job == 1 then SetFlag(own,flag[5],1)                        --讓玩家完成任務
	elseif 	job == 2 then SetFlag(own,flag[8],1)
	elseif 	job == 3 then SetFlag(own,flag[4],1)
	elseif 	job == 4 then SetFlag(own,flag[3],1)
	elseif 	job == 5 then SetFlag(own,flag[2],1)
	elseif 	job == 6 then SetFlag(own,flag[1],1)
	elseif 	job == 7 then SetFlag(own,flag[7],1)
	elseif 	job == 8 then SetFlag(own,flag[6],1)
	end
	CloseSpeak( own )
end
function un_wepen75get_29() --傳說憑證兌換選項
	local own = OwnerID()
	LoadQuestOption( own )  --show出模板對話
	local choice = {"[SC_117939_07]","[SC_117939_08]","[SC_117939_09]","[SC_117939_10]",
					"[SC_117939_06]"}--點擊的觸發的script
	local SpeakOption = {"un_wepenchoice75_6","un_wepenchoice75_7","un_wepenchoice75_8",
						 "un_wepenchoice75_9","un_wepenchoice75_10"}--對話選項
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
function un_wepen75get_30() --觀賞用
	SetShop( TargetID( ) , 600319 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end