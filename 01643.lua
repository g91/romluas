
function Yuyu_GuildWarTestLua_1_00()--取得能量

	local OID = OwnerID()
	local TID =TargetID()

	AddGuildWarEnergy( OID, 500 );  --增減能量

end

function Yuyu_GuildWarTestLua_2_00()--取得戰績

	local OID = OwnerID()
	local TID =TargetID()

	GiveBodyItem( OID , 206685 , 500 ) --返還戰績50

end

function Yuyu_GuildWarTestLua_3_00()--說出目前的 能量數 & 戰績數

	local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績

	Say(  OwnerID() ,"Now_R ="..Now_R )
	Say(  OwnerID() ,"Now_E ="..Now_E )


end

--  /gm ? runplot Yuyu_GWar_Leader_00   --變成軍團長

--=============================================================================================

function Yuyu_GWB_TEST01() 

	SetRoleCampID( OwnerID(), 7 )--寫入陣營  7

end

function Yuyu_GWB_TEST02() 

	SetRoleCampID( OwnerID(), 8 )--寫入陣營  8

end

function Yuyu_GWB_TEST03() 

	AddBuff( OwnerID() , 505418 , 0 , -1 )

end

function Yuyu_GWB_TEST04() 
	local P_INT = 1500
	AddBuff( OwnerID() , 505919 , P_INT , -1 )

end

function Yuyu_GWB_TEST010() 
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發

end

function Yuyu_GWB_TEST011() 

	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local MaxHP = ReadRoleValue( AttackTarget , EM_RoleValue_MaxHP )
	Say(AttackTarget,"AttackTarget")
	Say(AttackTarget,MaxHP)

end


 --/gm DetachImplement
 --離開載具

function Yuyu_GWB_TEST05()--give全部的東西
--榮譽建築
GiveBodyItem(OwnerID() , 206660 ,1)
GiveBodyItem(OwnerID() , 206661 ,1)
GiveBodyItem(OwnerID() , 206662 ,1)
GiveBodyItem(OwnerID() , 206663 ,1)
GiveBodyItem(OwnerID() , 206664 ,1)
GiveBodyItem(OwnerID() , 206665 ,1)
--兵工廠
GiveBodyItem(OwnerID() , 206760 ,1)
GiveBodyItem(OwnerID() , 206761 ,1)
GiveBodyItem(OwnerID() , 206762 ,1)
GiveBodyItem(OwnerID() , 206763 ,1)
Sleep(10)
GiveBodyItem(OwnerID() , 206764 ,1)
GiveBodyItem(OwnerID() , 206765 ,1)
GiveBodyItem(OwnerID() , 206766 ,1)
GiveBodyItem(OwnerID() , 206767 ,1)
--據點商店
GiveBodyItem(OwnerID() , 206666 ,1)
GiveBodyItem(OwnerID() , 206667 ,1)
GiveBodyItem(OwnerID() , 206668 ,1)
GiveBodyItem(OwnerID() , 206669 ,1)
GiveBodyItem(OwnerID() , 206680 ,1)
GiveBodyItem(OwnerID() , 206681 ,1)
Sleep(10)
GiveBodyItem(OwnerID() , 206682 ,1)
GiveBodyItem(OwnerID() , 206683 ,1)
GiveBodyItem(OwnerID() , 206684 ,1)
GiveBodyItem(OwnerID() , 206687 ,1)
GiveBodyItem(OwnerID() , 206688 ,1)
GiveBodyItem(OwnerID() , 206689 ,1)
end

function Yu_Test_GuildWar_TitleName_00()--取得所有公會城戰稱號
	GiveBodyItem(OwnerID(),530433,1)
	GiveBodyItem(OwnerID(),530434,1)
	GiveBodyItem(OwnerID(),530435,1)
	GiveBodyItem(OwnerID(),530436,1)
	GiveBodyItem(OwnerID(),530437,1)
	GiveBodyItem(OwnerID(),530438,1)
	GiveBodyItem(OwnerID(),530439,1)
	GiveBodyItem(OwnerID(),530440,1)
	GiveBodyItem(OwnerID(),530441,1)
	GiveBodyItem(OwnerID(),530442,1)
	GiveBodyItem(OwnerID(),530443,1)
	GiveBodyItem(OwnerID(),530444,1)
	GiveBodyItem(OwnerID(),530445,1)
	GiveBodyItem(OwnerID(),530446,1)
	GiveBodyItem(OwnerID(),530447,1)
	GiveBodyItem(OwnerID(),530448,1)
	GiveBodyItem(OwnerID(),530449,1)
	GiveBodyItem(OwnerID(),530450,1)
	GiveBodyItem(OwnerID(),530451,1)
	GiveBodyItem(OwnerID(),530452,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530453,1)
	GiveBodyItem(OwnerID(),530454,1)
	GiveBodyItem(OwnerID(),530455,1)
	GiveBodyItem(OwnerID(),530456,1)
	GiveBodyItem(OwnerID(),530457,1)
	GiveBodyItem(OwnerID(),530458,1)
	GiveBodyItem(OwnerID(),530459,1)
	GiveBodyItem(OwnerID(),530460,1)
	GiveBodyItem(OwnerID(),530461,1)
	GiveBodyItem(OwnerID(),530462,1)
	GiveBodyItem(OwnerID(),530463,1)
	GiveBodyItem(OwnerID(),530464,1)
	GiveBodyItem(OwnerID(),530465,1)
	GiveBodyItem(OwnerID(),530466,1)
	GiveBodyItem(OwnerID(),530467,1)
	GiveBodyItem(OwnerID(),530468,1)
	GiveBodyItem(OwnerID(),530469,1)
	GiveBodyItem(OwnerID(),530470,1)
	GiveBodyItem(OwnerID(),530471,1)
	GiveBodyItem(OwnerID(),530472,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530473,1)
	GiveBodyItem(OwnerID(),530474,1)
	GiveBodyItem(OwnerID(),530475,1)
	GiveBodyItem(OwnerID(),530476,1)
	GiveBodyItem(OwnerID(),530477,1)
	GiveBodyItem(OwnerID(),530513,1)
	GiveBodyItem(OwnerID(),530514,1)
	GiveBodyItem(OwnerID(),530515,1)
	GiveBodyItem(OwnerID(),530516,1)
	GiveBodyItem(OwnerID(),530517,1)
	GiveBodyItem(OwnerID(),530518,1)
	GiveBodyItem(OwnerID(),530519,1)
	GiveBodyItem(OwnerID(),530520,1)
	GiveBodyItem(OwnerID(),530521,1)
	GiveBodyItem(OwnerID(),530522,1)
	GiveBodyItem(OwnerID(),530523,1)
	GiveBodyItem(OwnerID(),530524,1)
	GiveBodyItem(OwnerID(),530525,1)
	GiveBodyItem(OwnerID(),530526,1)
	GiveBodyItem(OwnerID(),530527,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530528,1)
	GiveBodyItem(OwnerID(),530529,1)
	GiveBodyItem(OwnerID(),530530,1)
	GiveBodyItem(OwnerID(),530531,1)
	GiveBodyItem(OwnerID(),530532,1)
	GiveBodyItem(OwnerID(),530533,1)
	GiveBodyItem(OwnerID(),530534,1)
	GiveBodyItem(OwnerID(),530535,1)
	GiveBodyItem(OwnerID(),530536,1)
	GiveBodyItem(OwnerID(),530537,1)
	GiveBodyItem(OwnerID(),530538,1)
	GiveBodyItem(OwnerID(),530539,1)
	GiveBodyItem(OwnerID(),530540,1)
	GiveBodyItem(OwnerID(),530541,1)
	GiveBodyItem(OwnerID(),530542,1)
	GiveBodyItem(OwnerID(),530543,1)
	GiveBodyItem(OwnerID(),530544,1)
	GiveBodyItem(OwnerID(),530545,1)
	GiveBodyItem(OwnerID(),530546,1)
	GiveBodyItem(OwnerID(),530547,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530548,1)
	GiveBodyItem(OwnerID(),530549,1)
	GiveBodyItem(OwnerID(),530550,1)
	GiveBodyItem(OwnerID(),530551,1)
	GiveBodyItem(OwnerID(),530552,1)
	GiveBodyItem(OwnerID(),530553,1)
	GiveBodyItem(OwnerID(),530554,1)
	GiveBodyItem(OwnerID(),530555,1)
	GiveBodyItem(OwnerID(),530556,1)
	GiveBodyItem(OwnerID(),530557,1)
	GiveBodyItem(OwnerID(),530558,1)
	GiveBodyItem(OwnerID(),530559,1)
	GiveBodyItem(OwnerID(),530560,1)
	GiveBodyItem(OwnerID(),530561,1)
	GiveBodyItem(OwnerID(),530562,1)
	GiveBodyItem(OwnerID(),530563,1)
	GiveBodyItem(OwnerID(),530564,1)
	GiveBodyItem(OwnerID(),530565,1)
	GiveBodyItem(OwnerID(),530566,1)
	GiveBodyItem(OwnerID(),530567,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530568,1)
	GiveBodyItem(OwnerID(),530569,1)
	GiveBodyItem(OwnerID(),530570,1)
	GiveBodyItem(OwnerID(),530571,1)
	GiveBodyItem(OwnerID(),530572,1)
	GiveBodyItem(OwnerID(),530573,1)
	GiveBodyItem(OwnerID(),530574,1)
	GiveBodyItem(OwnerID(),530575,1)
	GiveBodyItem(OwnerID(),530576,1)
	GiveBodyItem(OwnerID(),530577,1)
	GiveBodyItem(OwnerID(),530578,1)
	GiveBodyItem(OwnerID(),530579,1)
	GiveBodyItem(OwnerID(),530580,1)
	GiveBodyItem(OwnerID(),530581,1)
	GiveBodyItem(OwnerID(),530582,1)
	GiveBodyItem(OwnerID(),530583,1)
	GiveBodyItem(OwnerID(),530584,1)
	GiveBodyItem(OwnerID(),530585,1)
	GiveBodyItem(OwnerID(),530586,1)
	GiveBodyItem(OwnerID(),530587,1)
	sleep(30)
	GiveBodyItem(OwnerID(),530588,1)
	GiveBodyItem(OwnerID(),530589,1)
	GiveBodyItem(OwnerID(),530590,1)
	GiveBodyItem(OwnerID(),530591,1)
	GiveBodyItem(OwnerID(),530592,1)
	GiveBodyItem(OwnerID(),530593,1)
	GiveBodyItem(OwnerID(),530594,1)
	GiveBodyItem(OwnerID(),530595,1)
	GiveBodyItem(OwnerID(),530596,1)
	GiveBodyItem(OwnerID(),530597,1)
	GiveBodyItem(OwnerID(),530598,1)
	GiveBodyItem(OwnerID(),530599,1)
	GiveBodyItem(OwnerID(),530600,1)
	GiveBodyItem(OwnerID(),530601,1)
	GiveBodyItem(OwnerID(),530602,1)
	GiveBodyItem(OwnerID(),530603,1)

end

function Yu_Test_GuildWar_TitleName_02()--移除所有公會城戰稱號
	DelBodyItem(OwnerID(),530433,1)
	DelBodyItem(OwnerID(),530434,1)
	DelBodyItem(OwnerID(),530435,1)
	DelBodyItem(OwnerID(),530436,1)
	DelBodyItem(OwnerID(),530437,1)
	DelBodyItem(OwnerID(),530438,1)
	DelBodyItem(OwnerID(),530439,1)
	DelBodyItem(OwnerID(),530440,1)
	DelBodyItem(OwnerID(),530441,1)
	DelBodyItem(OwnerID(),530442,1)
	DelBodyItem(OwnerID(),530443,1)
	DelBodyItem(OwnerID(),530444,1)
	DelBodyItem(OwnerID(),530445,1)
	DelBodyItem(OwnerID(),530446,1)
	DelBodyItem(OwnerID(),530447,1)
	DelBodyItem(OwnerID(),530448,1)
	DelBodyItem(OwnerID(),530449,1)
	DelBodyItem(OwnerID(),530450,1)
	DelBodyItem(OwnerID(),530451,1)
	DelBodyItem(OwnerID(),530452,1)
	sleep(30)
	DelBodyItem(OwnerID(),530453,1)
	DelBodyItem(OwnerID(),530454,1)
	DelBodyItem(OwnerID(),530455,1)
	DelBodyItem(OwnerID(),530456,1)
	DelBodyItem(OwnerID(),530457,1)
	DelBodyItem(OwnerID(),530458,1)
	DelBodyItem(OwnerID(),530459,1)
	DelBodyItem(OwnerID(),530460,1)
	DelBodyItem(OwnerID(),530461,1)
	DelBodyItem(OwnerID(),530462,1)
	DelBodyItem(OwnerID(),530463,1)
	DelBodyItem(OwnerID(),530464,1)
	DelBodyItem(OwnerID(),530465,1)
	DelBodyItem(OwnerID(),530466,1)
	DelBodyItem(OwnerID(),530467,1)
	DelBodyItem(OwnerID(),530468,1)
	DelBodyItem(OwnerID(),530469,1)
	DelBodyItem(OwnerID(),530470,1)
	DelBodyItem(OwnerID(),530471,1)
	DelBodyItem(OwnerID(),530472,1)
	sleep(30)
	DelBodyItem(OwnerID(),530473,1)
	DelBodyItem(OwnerID(),530474,1)
	DelBodyItem(OwnerID(),530475,1)
	DelBodyItem(OwnerID(),530476,1)
	DelBodyItem(OwnerID(),530477,1)
	DelBodyItem(OwnerID(),530513,1)
	DelBodyItem(OwnerID(),530514,1)
	DelBodyItem(OwnerID(),530515,1)
	DelBodyItem(OwnerID(),530516,1)
	DelBodyItem(OwnerID(),530517,1)
	DelBodyItem(OwnerID(),530518,1)
	DelBodyItem(OwnerID(),530519,1)
	DelBodyItem(OwnerID(),530520,1)
	DelBodyItem(OwnerID(),530521,1)
	DelBodyItem(OwnerID(),530522,1)
	DelBodyItem(OwnerID(),530523,1)
	DelBodyItem(OwnerID(),530524,1)
	DelBodyItem(OwnerID(),530525,1)
	DelBodyItem(OwnerID(),530526,1)
	DelBodyItem(OwnerID(),530527,1)
	sleep(30)
	DelBodyItem(OwnerID(),530528,1)
	DelBodyItem(OwnerID(),530529,1)
	DelBodyItem(OwnerID(),530530,1)
	DelBodyItem(OwnerID(),530531,1)
	DelBodyItem(OwnerID(),530532,1)
	DelBodyItem(OwnerID(),530533,1)
	DelBodyItem(OwnerID(),530534,1)
	DelBodyItem(OwnerID(),530535,1)
	DelBodyItem(OwnerID(),530536,1)
	DelBodyItem(OwnerID(),530537,1)
	DelBodyItem(OwnerID(),530538,1)
	DelBodyItem(OwnerID(),530539,1)
	DelBodyItem(OwnerID(),530540,1)
	DelBodyItem(OwnerID(),530541,1)
	DelBodyItem(OwnerID(),530542,1)
	DelBodyItem(OwnerID(),530543,1)
	DelBodyItem(OwnerID(),530544,1)
	DelBodyItem(OwnerID(),530545,1)
	DelBodyItem(OwnerID(),530546,1)
	DelBodyItem(OwnerID(),530547,1)
	sleep(30)
	DelBodyItem(OwnerID(),530548,1)
	DelBodyItem(OwnerID(),530549,1)
	DelBodyItem(OwnerID(),530550,1)
	DelBodyItem(OwnerID(),530551,1)
	DelBodyItem(OwnerID(),530552,1)
	DelBodyItem(OwnerID(),530553,1)
	DelBodyItem(OwnerID(),530554,1)
	DelBodyItem(OwnerID(),530555,1)
	DelBodyItem(OwnerID(),530556,1)
	DelBodyItem(OwnerID(),530557,1)
	DelBodyItem(OwnerID(),530558,1)
	DelBodyItem(OwnerID(),530559,1)
	DelBodyItem(OwnerID(),530560,1)
	DelBodyItem(OwnerID(),530561,1)
	DelBodyItem(OwnerID(),530562,1)
	DelBodyItem(OwnerID(),530563,1)
	DelBodyItem(OwnerID(),530564,1)
	DelBodyItem(OwnerID(),530565,1)
	DelBodyItem(OwnerID(),530566,1)
	DelBodyItem(OwnerID(),530567,1)
	sleep(30)
	DelBodyItem(OwnerID(),530568,1)
	DelBodyItem(OwnerID(),530569,1)
	DelBodyItem(OwnerID(),530570,1)
	DelBodyItem(OwnerID(),530571,1)
	DelBodyItem(OwnerID(),530572,1)
	DelBodyItem(OwnerID(),530573,1)
	DelBodyItem(OwnerID(),530574,1)
	DelBodyItem(OwnerID(),530575,1)
	DelBodyItem(OwnerID(),530576,1)
	DelBodyItem(OwnerID(),530577,1)
	DelBodyItem(OwnerID(),530578,1)
	DelBodyItem(OwnerID(),530579,1)
	DelBodyItem(OwnerID(),530580,1)
	DelBodyItem(OwnerID(),530581,1)
	DelBodyItem(OwnerID(),530582,1)
	DelBodyItem(OwnerID(),530583,1)
	DelBodyItem(OwnerID(),530584,1)
	DelBodyItem(OwnerID(),530585,1)
	DelBodyItem(OwnerID(),530586,1)
	DelBodyItem(OwnerID(),530587,1)
	sleep(30)
	DelBodyItem(OwnerID(),530588,1)
	DelBodyItem(OwnerID(),530589,1)
	DelBodyItem(OwnerID(),530590,1)
	DelBodyItem(OwnerID(),530591,1)
	DelBodyItem(OwnerID(),530592,1)
	DelBodyItem(OwnerID(),530593,1)
	DelBodyItem(OwnerID(),530594,1)
	DelBodyItem(OwnerID(),530595,1)
	DelBodyItem(OwnerID(),530596,1)
	DelBodyItem(OwnerID(),530597,1)
	DelBodyItem(OwnerID(),530598,1)
	DelBodyItem(OwnerID(),530599,1)
	DelBodyItem(OwnerID(),530600,1)
	DelBodyItem(OwnerID(),530601,1)
	DelBodyItem(OwnerID(),530602,1)
	DelBodyItem(OwnerID(),530603,1)

end

function Yu_GuildWar_TitleMission_Key_00()--公會城戰稱號任務，重要物品給予
	SetFlag( TargetID() , 543771 , 1 ) -- 男爵技能型稱號				完成任務後執行的劇情，TargetID是玩家
end

function Yu_GuildWar_TitleMission_Key_01()--公會城戰稱號任務，重要物品給予
	SetFlag( TargetID() , 543773 , 1 ) -- 子爵技能型稱號				完成任務後執行的劇情，TargetID是玩家
end

function Yu_GuildWar_TitleMission_Key_02()--公會城戰稱號任務，重要物品給予
	SetFlag( TargetID() , 543775 , 1 ) -- 伯爵技能型稱號				完成任務後執行的劇情，TargetID是玩家
end

function Yu_GuildWar_TitleMission_Key_03()--公會城戰稱號任務，重要物品給予
	SetFlag( TargetID() , 543777 , 1 ) -- 侯爵技能型稱號				完成任務後執行的劇情，TargetID是玩家
end

function Yu_GuildWar_TitleMission_Key_04()--公會城戰稱號任務，重要物品給予
	SetFlag( TargetID() , 543779 , 1 ) --  公爵技能型稱號				完成任務後執行的劇情，TargetID是玩家
end