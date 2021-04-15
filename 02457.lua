function ic_ha_de_141_01 ()		---1王死亡劇情
	ic_ha_de_All_01(105807,ic_del_BUFF_141)
end
function ic_ha_de_141_02 ()		---2王死亡劇情
	ic_ha_de_All_02(105366,ic_del_BUFF_141)
end
function ic_ha_de_141_03 ()		---3王死亡劇情
	ic_ha_de_All_03(105641,ic_del_BUFF_141)
end
function ic_ha_de_141_04 ()		---4王死亡劇情
	ic_ha_de_All_04(105517,ic_del_BUFF_141)
end
function ic_ha_de_141_05 ()		---5王死亡劇情
	ic_ha_de_All_05(105452,ic_del_BUFF_141)
end
function ic_ha_de_141_06 ()		---6王死亡劇情
	ic_ha_de_All_06(105520,ic_del_BUFF_141)
end
function ic_ha_de_141_07 ()		---7王死亡劇情
	ic_ha_de_All_07(105677,ic_del_BUFF_141)
end
function ic_del_BUFF_141 ()		---刪除BUFF
	ic_del_BUFF_All(105366,105641,105517,105452,105520,105677)
end
--ic_nohi_All_02				---2王產生劇情(12人與6人通用)
--ic_nohi_All_03				---3王產生劇情(12人與6人通用)
--ic_nohi_All_04				---4王產生劇情(12人與6人通用)
--ic_nohi_All_05				---5王產生劇情(12人與6人通用)
--ic_nohi_All_06				---6王產生劇情(12人與6人通用)
--ic_nohi_All_07				---7王產生劇情(12人與6人通用)
-----------------------------------------------------------------上面12人
-----------------------------------------------------------------下面正常6人
function ic_ha_de_142_01 ()		---1王死亡劇情
	ic_ha_de_All_01(106043,ic_del_BUFF_142)
end
function ic_ha_de_142_02 ()		---2王死亡劇情
	ic_ha_de_All_02(106015,ic_del_BUFF_142)
end
function ic_ha_de_143_03 ()		---3王死亡劇情
	ic_ha_de_All_03(106021,ic_del_BUFF_142)
end
function ic_ha_de_144_04 ()		---4王死亡劇情
	ic_ha_de_All_04(106052,ic_del_BUFF_142)
end
function ic_ha_de_145_05 ()		---5王死亡劇情
	ic_ha_de_All_05(106048,ic_del_BUFF_142)
end
function ic_del_BUFF_142 ()		---刪除BUFF(2王,3王,4王,5王)
	ic_del_BUFF_All(106015,106021,106052,106048)
end