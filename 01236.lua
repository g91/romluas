----------------------------------------------------------
--「菈蘇．哲斯」對話劇情
----------------------------------------------------------
function NPC_110748_TALK()		--兌換NPC對話
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_TALK]" )	--預設對話
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_01]" , "NPC_110748_WantPreview" , 0 )	--我想看看有什麼裝備能兌換
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_02]" , "NPC_110748_How" , 0 )	--要怎麼兌換？
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_03]" , "NPC_110748_WantExchange" , 0 )	--我要兌換裝備
end

function NPC_110748_WantPreview()	--預覽商店說明
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_11]" )	--你想看哪種裝備？
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_110748_Preview(1)" , 0 )	--守護
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_110748_Preview(2)" , 0 )	--殘殺
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_110748_Preview(3)" , 0 )	--迅捷
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_110748_Preview(4)" , 0 )	--魔導
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_110748_Preview(5)" , 0 )	--癒合
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--返回上一頁
end

function NPC_110748_Preview( ArmorType )	--預覽商店
	if ArmorType == 1 then	--守護鎧甲
		SetShop( TargetID() , 600226 , "" )
	elseif ArmorType == 2 then	--殘殺鎖甲
		SetShop( TargetID() , 600398 , "" )
	elseif ArmorType == 3 then	--迅捷皮甲
		SetShop( TargetID() , 600597 , "" )
	elseif ArmorType == 4 then	--魔導布衣
		SetShop( TargetID() , 600598 , "" )
	elseif ArmorType == 5 then	--癒合布衣
		SetShop( TargetID() , 600599 , "" )
	end
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end

function NPC_110748_How()	--兌換裝備說明
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_21]" )	--要怎麼兌換？
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--返回上一頁
end

function NPC_110748_WantExchange()	--我要兌換裝備
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_31]" )	--你要兌換哪種裝備？
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_110748_Exchange_Step1(1)" , 0 )	--守護鎧甲
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_110748_Exchange_Step1(2)" , 0 )	--殘殺鎖甲
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_110748_Exchange_Step1(3)" , 0 )	--迅捷皮甲
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_110748_Exchange_Step1(4)" , 0 )	--魔導布衣
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_110748_Exchange_Step1(5)" , 0 )	--癒合布衣
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--返回上一頁
end

function NPC_110748_Exchange_Step1( ArmorType )	--選擇部位
	local ArmorCategoryName = {
		"[SC_ARMORCATEGORY_01]" , 	--守護
		"[SC_ARMORCATEGORY_02]" , 	--殘殺
		"[SC_ARMORCATEGORY_03]" , 	--迅捷
		"[SC_ARMORCATEGORY_04]" , 	--魔導
		"[SC_ARMORCATEGORY_05]" }	--癒合
	local ArmorTypeName = { 
	"[SYS_ARMORTYPE_00]" , 	--鎧甲
	"[SYS_ARMORTYPE_01]" , 	--鎖甲
	"[SYS_ARMORTYPE_02]" , 	--皮甲
	"[SYS_ARMORTYPE_03]" , 	--布衣
	"[SYS_ARMORTYPE_03]" } 	--布衣
	
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_32][$SETVAR1=" .. ArmorCategoryName[ ArmorType ] .. "][$SETVAR2=" .. ArmorTypeName[ ArmorType ] .."]" )	--兌換說明
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_00]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 1 )" , 0 )	--頭部
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_03]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 2 )" , 0 )	--上身
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_07]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 3 )" , 0 )	--肩甲
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_02]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 4 )" , 0 )	--鞋子
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_01]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 5 )" , 0 )	--手套
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_06]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 6 )" , 0 )	--腰帶
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_04]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 7 )" , 0 )	--下身
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_05]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 8 )" , 0 )	--披風
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_WantExchange" , 0 )	--返回上一頁
end

function YoYo_TestSay()
	Say( OwnerID() , table.concat( { "[SYS_ARMORPOS_00]" , "[SYS_ARMORPOS_01]" } ) )
end

function NPC_110748_Exchange_Step2( ArmorType , ArmorPos )	--兌換確認
	local Armor = {}
	Armor[ 1 ] = {
		234970	,	--風野守護頭盔
		234971	,	--風野守護盔甲
		234972	,	--風野守護肩甲
		234973	,	--風野守護長靴
		234974	,	--風野守護手套
		234975	,	--風野守護腰帶
		234976	,	--風野守護長褲
		234977	}	--風野守護披風
	Armor[ 2 ] = {
		234978	,	--風野殘殺頭盔
		234979	,	--風野殘殺護甲
		234980	,	--風野殘殺肩甲
		234981	,	--風野殘殺長靴
		234982	,	--風野殘殺護手
		234983	,	--風野殘殺腰帶
		234984	,	--風野殘殺護腿
		234985	}	--風野殘殺披風
	Armor[ 3 ] = {
		234986	,	--風野迅捷護額
		234987	,	--風野迅捷皮衣
		234988	,	--風野迅捷皮肩
		234989	,	--風野迅捷長靴
		234990	,	--風野迅捷手套
		234991	,	--風野迅捷腰帶
		234992	,	--風野迅捷皮褲
		234993	}	--風野迅捷披風
	Armor[ 4 ] = {
		234994	,	--風野魔導護額
		234995	,	--風野魔導大衣
		234996	,	--風野魔導肩飾
		234997	,	--風野魔導長靴
		234998	,	--風野魔導手套
		234999	,	--風野魔導腰帶
		235000	,	--風野魔導長褲
		235001	}	--風野魔導披風
	Armor[ 5 ] = {
		235002	,	--風野癒合護額
		235003	,	--風野癒合外衣
		235004	,	--風野癒合肩甲
		235005	,	--風野癒合布鞋
		235006	,	--風野癒合手套
		235007	,	--風野癒合腰帶
		235008	,	--風野癒合長褲
		235009	}	--風野癒合披風
		
	local Material = {  
	208346 ,	--風野守護鋼材
	208347 ,	--風野殘殺碎刃
	208348 ,	--風野迅捷獸皮
	208349 ,	--風野魔導布料
	208350 }	--風野癒合布料
	
	local ArmorName = "[" .. Armor[ ArmorType ][ ArmorPos ] .."]"
	local MaterialName = "[" .. Material[ ArmorType ] .."]"
	
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_33][$SETVAR1=" .. ArmorName .. "][$SETVAR2=" .. MaterialName .. "]" )	--兌換確認說明
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_34]" , "NPC_110748_Exchange_Step3(" .. Armor[ ArmorType ][ ArmorPos ] .. "," .. Material[ ArmorType ] .. ")" , 0 )	--是的，我要兌換
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_35]" , "NPC_110748_TALK" , 0 )	--我要再考慮一下
end

function NPC_110748_Exchange_Step3( Armor , Material )
	if CountBodyItem( OwnerID() , Material ) >= 20 then
		GiveBodyItem( OwnerID() , Armor,1)
		DelBodyItem( OwnerID()  , Material , 20 )
		CloseSpeak( OwnerID() )	--關閉對話視窗
	else
		SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_36]" )	--你所準備的材料數量不足，無法兌換喔！
	end
end
