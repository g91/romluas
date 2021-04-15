------------------------------------------------------------------------
function William_240863_01()
	local Index={}
	Index[1]=545842 --Z01_嚎叫山麓
	Index[2]=545843 --Z02_銀湧之野
	Index[3]=545844 --Z03_掠鴉荒原
	Index[4]=545845 --Z04_艾索蘭斜谷
	Index[5]=545846 --Z05_海波拉高原
	Index[6]=545847 --Z06_塵荒峽谷
	Index[7]=545848 --Z07_鳴沙海岸
	Index[8]=545849 --Z08_原生之地
	Index[9]=545850 --Z09_奧圖拉傑火山
	Index[10]=545851 --Z10_蘇希歷亞草原
	Index[11]=545852 --Z11_龍牙山脊
	Index[12]=545853 --Z15_雷蹄之丘
	Index[13]=545854 --Z16_南傑諾斯塔森林
	Index[14]=545855 --Z17_北傑諾斯塔森林
	Index[15]=545856 --Z18_萊慕沙漠
	Index[16]=545857 --Z19_希尼斯特之地
	Index[17]=545858 --Z20_紅土丘陵
	Index[18]=545859 --Z21_塔圖印海灣
	local Num=table.getn(Index)
	for i=1,table.getn(Index),1 do
		if CheckFlag( OwnerID(), Index[i] )==False then
			Num=Num-1
		else break
		end
	end
	if Num==0 then
		local x=Rand(table.getn(Index))+1
		Setflag( OwnerID(), Index[x], 1 ) --給予隨機取得的任務權限
	end
	GiveBodyItem( OwnerID(), 240864, 1 ) --依旗標編號給予相對應的任務物品
end
------------------------------------------------------------------------
function William_240864_01()
	ClearBorder(OwnerID()) --石碑內容初始化

	local ZONE={}
	ZONE[545842]="[ZONE_WAILING MOUNTAINS]" --Z01_嚎叫山麓
	ZONE[545843]="[ZONE_SILVERSPRING]" --Z02_銀湧之野
	ZONE[545844]="[ZONE_RAVENFELL]" --Z03_掠鴉荒原
	ZONE[545845]="[ZONE_ASLAN NORTH]" --Z04_艾索蘭斜谷
	ZONE[545846]="[ZONE_HYBORA HIGHLANDS]" --Z05_海波拉高原
	ZONE[545847]="[ZONE_DUSTBLOOM CANYON]" --Z06_塵荒峽谷
	ZONE[545848]="[ZONE_WEEPING COAST]" --Z07_鳴沙海岸
	ZONE[545849]="[ZONE_SAVAGE LANDS]" --Z08_原生之地
	ZONE[545850]="[ZONE_MOUNT AL TURAJ]" --Z09_奧圖拉傑火山
	ZONE[545851]="[ZONE_SASCILIA STEPPES]" --Z10_蘇希歷亞草原
	ZONE[545852]="[ZONE_DRAGONFANG RIDGE]" --Z11_龍牙山脊
	ZONE[545853]="[ZONE_THUNDERHOOF_MESA]" --Z15_雷蹄之丘
	ZONE[545854]="[ZONE_SOUTH_JENOTAR_FOREST]" --Z16_南傑諾斯塔森林
	ZONE[545855]="[ZONE_NORTHERN_JANOST_FOREST]" --Z17_北傑諾斯塔森林
	ZONE[545856]="[ZONE_LYMOR_DESERT]" --Z18_萊慕沙漠
	ZONE[545857]="[ZONE_SINISTER_LANDS]" --Z19_希尼斯特之地
	ZONE[545858]="[ZONE_Z20_RED_HILLS]"--Z20_紅土丘陵
	ZONE[545859]="[ZONE_TATURIN_GULF]" --Z21_塔圖印海灣

	local NPC={}
	NPC[545842]="[119886]" --Z01_羅恩
	NPC[545843]="[119887]" --Z02_阿特雷
	NPC[545844]="[119888]" --Z03_布瑪
	NPC[545845]="[119889]" --Z04_德克斯特
	NPC[545846]="[119890]" --Z05_卡洛特
	NPC[545847]="[119891]" --Z06_維納爾
	NPC[545848]="[119892]" --Z07_博克特
	NPC[545849]="[119893]" --Z08_賽門
	NPC[545850]="[119894]" --Z09_索蘭卡
	NPC[545851]="[119895]" --Z10_依萊文
	NPC[545852]="[119896]" --Z11_厄達斯
	NPC[545853]="[119897]" --Z15_法亞提克
	NPC[545854]="[119898]" --Z16_提爾巴特
	NPC[545855]="[119899]" --Z17_克萊爾
	NPC[545856]="[119900]" --Z18_雷爾特
	NPC[545857]="[119901]" --Z19_塔多倫
	NPC[545858]="[119902]" --Z20_凡希
	NPC[545859]="[119903]" --Z21_艾奇亞

	for Flag ,Str in pairs(ZONE) do
		if CheckFlag( OwnerID(), Flag )==True then
			local Name=NPC[Flag]
				AddBorderPage(OwnerID(), "[SC_240864_CONTENT][$SETVAR1="..Str.."][$SetVAR2="..Name.."]") --組合石碑內容與關鍵字串
		end
	end
	ShowBorder(OwnerID(),0,"[SC_240864_TITLE]","ScriptBorder_Texture_Paper") --顯示石碑標題"行動指令"	
end
------------------------------------------------------------------------
function William_NPC425000_01() --初始劇情
	local NPC={}
	NPC[119886]=545842
	NPC[119887]=545843
	NPC[119888]=545844
	NPC[119889]=545845
	NPC[119890]=545846
	NPC[119891]=545847
	NPC[119892]=545848
	NPC[119893]=545849
	NPC[119894]=545850
	NPC[119895]=545851
	NPC[119896]=545852
	NPC[119897]=545853
	NPC[119898]=545854
	NPC[119899]=545855
	NPC[119900]=545856
	NPC[119901]=545857
	NPC[119902]=545858
	NPC[119903]=545859

	for OrgId ,FlagID in pairs(NPC) do
		if 	OrgId==ReadRoleValue ( OwnerID() , EM_RoleValue_OrgID ) then
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, FlagID ) 
		end
	end
end
------------------------------------------------------------------------
function William_NPC425000_02() --對話劇情
	LoadQuestOption(OwnerID())
	local FlagID=ReadRoleValue ( TargetID() , EM_RoleValue_Register1 ) 
	if	CheckAcceptQuest(OwnerID(),425000)==TRUE and --檢查玩家是否已取得任務425000
		CheckFlag( OwnerID(), FlagID)==true then --檢查玩家是否已取得任務旗標
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_NPC425000_03",0) --增加按鈕
	end
end
------------------------------------------------------------------------
function William_NPC425000_03()
	local FlagID=ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
	local Detail={}
	Detail[545842]="[SC_425000_Z01]"
	Detail[545843]="[SC_425000_Z02]"
	Detail[545844]="[SC_425000_Z03]"
	Detail[545845]="[SC_425000_Z04]"
	Detail[545846]="[SC_425000_Z05]"
	Detail[545847]="[SC_425000_Z06]"
	Detail[545848]="[SC_425000_Z07]"
	Detail[545849]="[SC_425000_Z08]"
	Detail[545850]="[SC_425000_Z09]"
	Detail[545851]="[SC_425000_Z10]"
	Detail[545852]="[SC_425000_Z11]"
	Detail[545853]="[SC_425000_Z15]"
	Detail[545854]="[SC_425000_Z16]"
	Detail[545855]="[SC_425000_Z17]"
	Detail[545856]="[SC_425000_Z18]"
	Detail[545857]="[SC_425000_Z19]"
	Detail[545858]="[SC_425000_Z20]"
	Detail[545859]="[SC_425000_Z21]"

	for SpeakID ,StringID in pairs(Detail) do
		if SpeakID==FlagID then
		   SetSpeakDetail( OwnerID(),StringID) --口頭偵查報告
		   GiveBodyItem( OwnerID(), 240865, 1 ) --給予完成任務物品
		   DelBodyItem( OwnerID(),FlagID, 1 ) --刪除對應旗標(任務權限)
		   DelBodyItem( OwnerID(),240864, 1 ) --刪除任務提示物品
		end
	end
end
------------------------------------------------------------------------