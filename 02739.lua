--每新增一個副本地圖，就使用以下函式
--第一隻Boss不需填戰鬥開始劇情
--如果資料庫欄位已有製作者填入函式，請要求加入防駭客的通用函示於SCRIPT內。

function Cl_Resist_Hackers_NpcTable(ZoneID,ObjID)--新增區域在此列表新增

	local NpcTable = {}
	local BossDead = {}
	local BossNum = 0
	--測試區使用--
	NpcTable[938] = { 106609 , 106198 , 106596 , 106900 , 106814  } --依照1~最後一王順序依照順序填入
	BossDead[938] = { 0 , 1 , 2 , 3 , 4 } --判斷是幾王死亡解開防駭客
	NpcTable[940] = { 107581 , 107589 , 107591 , 107593 , 107592 , 106640 , 106833 }  
	BossDead[940] = { 0 , 1 , 2 , 2 , 4 , 5 , 6 }
	--Z23庫勒奇蟻穴--
	NpcTable[146] = { 106382 , 106307 , 106604 , 106292 , 106300  }
	BossDead[146] = { 0 , 1 , 1 , 3 , 4 }
	NpcTable[147] = { 107302 , 107196 , 107218 , 107314 , 106656  }
	BossDead[147] = { 0 , 1 , 1 , 3 , 4 }
	NpcTable[148] = { 107307 , 107199 , 107223 , 107321 , 107234  }
	BossDead[148] = { 0 , 1 , 1 , 3 , 4 }
	--Z24封蝕城--
	NpcTable[149] = { 106609 , 106198 , 106596 , 106900 , 107466 , 106814  }  
	BossDead[149] = { 0 , 1 , 2 , 3 , 3 , 4 }
	NpcTable[150] = { 107453 , 107455 , 107459 , 107462 , 107467 , 106816  } 
	BossDead[150] = { 0 , 1 , 2 , 3 , 3 , 4 }
	--Z25布托曼迷霧亡城--
	NpcTable[151] = { 106853 , 106890 , 106444 , 107228 , 106450 }  
	BossDead[151] = { 0 , 1 , 2 , 2 , 4 }
	NpcTable[152] = { 107581 , 107589 , 107591 , 107593 , 107592 , 106640 , 106833 }  
	BossDead[152] = { 0 , 1 , 2 , 2 , 4 , 5 , 6 }
	NpcTable[153] = { 107583 , 107605 , 107606 , 107608 , 107615 } 
	BossDead[153] = { 0 , 1 , 2 , 2 , 4 }
	--Z26貝拉蒂亞王城--因為此副本全由Script編寫，所以已由腳本程式（蝌蚪）製作
	--Z27巨鯊地窖--
	NpcTable[157] = { 108150 , 108144 , 107836 , 107834 , 107852 , 107832 , 107871 }  
	BossDead[157] = { 0 , 1 , 2 , 3 , 3 , 4 , 5 } 
	NpcTable[158] = { 108175 , 108157 , 108166 , 108176 , 108163 }  
	BossDead[158] = { 0 , 1 , 2 , 3 , 3 }   
	NpcTable[159] = { 108177 , 108160 , 108169 , 108178 , 108164 } 
	BossDead[159] = { 0 , 1 , 2 , 3 , 3 } 
	--Z28莫維芬尖柱--
	NpcTable[160] = { 107964, 107965, 107966, 107967, 107968 }  --Raid
	BossDead[160] = { 0 , 1 , 2 , 3 , 4 } 
	NpcTable[161] = { 108302, 108291, 108293,  108307, 108295 } --Normal  
	BossDead[161] = { 0 , 1 , 2 , 3 , 4 }   
	NpcTable[162] = { 108309, 108292, 108294, 108314, 108296 }  --Easy
	BossDead[162] = { 0 , 1 , 2 , 3 , 4 } 
	--Z29寶座墳場--
	NpcTable[163] = { 108276, 108275, 108481, 108279, 108280, 108281, 108282 }  --Raid
	BossDead[163] = { 0 , 1 , 2 , 3 , 4 , 5 , 6 } 
	NpcTable[164] = { 103387, 108408, 108482, 108411, 108485 }  --Normal  
	BossDead[164] = { 0 , 1 , 2 , 3 , 4 }     
	NpcTable[165] = { 103391, 108414, 108483, 108417, 108488 }  --Easy
	BossDead[165] = { 0 , 1 , 2 , 3 , 4 } 
	--Z30卡沙愛蘭地窖--
	NpcTable[166] = { 108432, 108434, 108438, 108440, 108441 }  --Raid
	BossDead[166] = { 0 , 1 , 2 , 3 , 4  }  
	NpcTable[167] = { 108634, 103402, 108572, 108639, 108579  } --Normal  
	BossDead[167] = { 0 , 1 , 2 , 3 , 4 }     
	NpcTable[168] = { 108644, 103412, 108584, 108642, 108591 }  --Easy
	BossDead[168] = { 0 , 1 , 2 , 3 , 4 }
	--Z32骷髏巖--
	NpcTable[169] = { 108596, 108684 , 108598 , 108599 , 108600 , 108601 , 108602 } --Raid  (雙胞胎1王判斷洛菈古瓦迪)
	BossDead[169] = { 0 , 1 , 2 , 3 , 4 , 5 , 6 } 
	NpcTable[170] = { 108698 , 108880 , 108703 , 108685 , 108687  } --Normal  
	BossDead[170] = { 0 , 1 , 2 , 3 , 4 }     
	NpcTable[171] = { 108700 , 108886 , 108704 , 108686 , 108692 }  --Easy
	BossDead[171] = { 0 , 1 , 2 , 3 , 4 }
	--Z33-1巨魔之巢--
	NpcTable[172] = { 108800 , 108804 , 108809 , 108814 } --Raid 
	BossDead[172] = { 0 , 1 , 2 , 3 } 
	NpcTable[173] = { 108912 , 108916 , 109002 }  --Normal  
	BossDead[173] = { 0 , 1 , 2 }     
	NpcTable[174] = { 108914 , 108921 , 109006 }  --Easy
	BossDead[174] = { 0 , 1 , 2 }
	--Z33-2渡鴉之心--
	NpcTable[175] = { 108818, 108825, 108830 }  --Raid 1王判斷勾卡爾、2王判斷科諾瓦
	BossDead[175] = { 0, 1, 2 };
	NpcTable[176] = { 103761, 103769 }  --Normal
	BossDead[176] = { 0, 1 };
	NpcTable[177] = { 103765, 103771 }  --Easy
	BossDead[177] = { 0, 1 };
	--Z34 儀式峽谷--
	NpcTable[178] = {}  --Raid
	BossDead[178] = { 0, 1, 2, 3, 4, 5, 6 };
	NpcTable[179] = {}  --Normal
	BossDead[179] = {};
	NpcTable[180] = {}  --Easy
	BossDead[180] = {};

	--AC2--
	NpcTable[196] = { 108947 , 108948 , 108949 , 108950 }
	BossDead[196] = { 0 , 1 , 2 , 3 }
	NpcTable[197] = { 108962 , 108963 , 108964 , 108965 }
	BossDead[197] = { 0 , 1 , 2 , 3 }
	NpcTable[198] = { 108974 , 108975 , 108976 , 108977 }
	BossDead[198] = { 0 , 1 , 2 , 3 }
	NpcTable[199] = { 108989 , 108990 , 108991 , 108992 } --1王判定莎多薩
	BossDead[199] = { 0 , 1 , 2 , 3 }
  
	for i = 1 , table.getn( NpcTable[ZoneID] ) , 1 do
		if ObjID == NpcTable[ZoneID][i] then --檢查OwnerID的OrgID在NpcTable第幾個欄位
			BossNum = i --將欄位記錄下來並離開迴圈
			break
		end
	end
	return BossDead[ZoneID][BossNum] , BossNum --傳出要檢查的BOSS目標與自己的BOSS順序
end
------------------------以下都不需要變動----------------------------
function Cl_Resist_HackersBossNum( _ownerID ) ---掛在BOSS物件產生劇情
  local OwnerID =  _ownerID or OwnerID()
  local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
  local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
  local ObjID = ReadRoleValue( OwnerID , EM_RoleValue_OrgID )
  
  Lua_Cl_Resist_Hackers = Lua_Cl_Resist_Hackers or {} --宣告全域變數
  Lua_Cl_Resist_Hackers[RoomID] = Lua_Cl_Resist_Hackers[RoomID] or {}
  Lua_Cl_Resist_Hackers[RoomID]["BossID"] = Lua_Cl_Resist_Hackers[RoomID]["BossID"] or {}
  
  local BossDead , BossNum = Cl_Resist_Hackers_NpcTable(ZoneID,ObjID) --取出自己為幾王
  Lua_Cl_Resist_Hackers[RoomID]["BossID"][BossNum] = OwnerID --依照副本BOSS順位記錄起自己的GUID
  DebugMsg( 0 , 0 , "BossDead="..BossDead.."   "..BossNum )
end
function Cl_Resist_HackersFightBegin( _ownerID ) ---掛在BOSS戰鬥開始
  local OwnerID =  _ownerID or OwnerID()
  local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
  local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
  local ObjID = ReadRoleValue( OwnerID , EM_RoleValue_OrgID )
  DebugMsg( 0 , 0 , "ZoneID="..ZoneID.."   "..ObjID )
  local BossDead , BossNum = Cl_Resist_Hackers_NpcTable(ZoneID,ObjID)
  DebugMsg( 0 , 0 , "BossDead="..BossDead.."   "..BossNum )
  if Lua_Cl_Resist_Hackers[RoomID]["BossID"][BossDead] ~= -1 then --開戰前檢查上一個BOSS是否已經死亡
    AddBuff( OwnerID , 508071 , 0, -1 )
  end
end
function Cl_Resist_HackersBossDead( _ownerID ) ---掛在BOSS死亡事件
  DebugMsg( 0 , 0 , "--Cl_Resist_HackersBossDead--")
  local OwnerID =  _ownerID or OwnerID()
  DebugMsg( 0 , 0 , "OwnerID="..OwnerID)
  local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
  local BossNum = 0
  local GlobalNum = table.getn(Lua_Cl_Resist_Hackers[RoomID]["BossID"])
  for i = 1 , GlobalNum , 1 do
    DebugMsg( 0 , 0 , "==="..Lua_Cl_Resist_Hackers[RoomID]["BossID"][i])
    if Lua_Cl_Resist_Hackers[RoomID]["BossID"][i] == OwnerID then --核對全域變數內自己的GUID是第幾順位
      Lua_Cl_Resist_Hackers[RoomID]["BossID"][i] = -1 --將順位內的GUID更改為-1確認為死亡
      DebugMsg( 0 , 0 , "+++++")
      break
    end
  end
end
--/gm ? pcall Cl_Say_BossNameID
function Cl_Say_BossNameID()
  local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
  for i = 1 , table.getn(Lua_Cl_Resist_Hackers[RoomID]["BossID"]) , 1 do
    say ( OwnerID() , "BossNo."..i.."   name="..GetName( Lua_Cl_Resist_Hackers[RoomID]["BossID"][i] ) )
  end
end