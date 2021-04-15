--[[
普通版的技能列表
	
裂風鐵翼		進入戰鬥後3秒	6秒	0	目標單人		單體物理傷害。
風靈纏身		進入戰鬥後17秒	4秒	0	仇恨表內所有目標	保持仇恨表內隨機五個對象有風靈纏身的BUFF，一旦BUFF消失就隨機選擇再補上，不滿5人就重複上BUFF。
召喚僕從		進入戰鬥	17秒	0	自己			產生3隻風暴僕從來攻擊王的當前目標。
追殺技(無名		進入戰鬥	0	0	目標單人		若玩家風箏世界王，王會對玩家衝鋒秒殺之

擊殺之後有55%機率重生出暴怒的沃德金(107183)				
重生等待時間為8小時。(系統重生規則會自動加減30%時間)				

風靈纏身的BUFF特性	
	擁有者不能施法不能攻擊。
	"BUFF結束時，附近如果有玩家(身上不能有風靈纏身)，則將BUFF傳染給那名玩家。
	BUFF結束時，如果沒有傳染對象，則產生風暴僕從來攻擊擁有者。"
						
	
	場上所有風暴僕從總數不會超過30隻，滿30隻之後，將不會再產生。
--]]
--[[
困難版的技能列表
	
	裂風鐵翼		進入戰鬥後3秒	6秒	0	目標單人		單體物理傷害。
	風靈纏身		進入戰鬥後17秒	4秒	0	仇恨表內所有目標	保持仇恨表內隨機五個對象有風靈纏身的BUFF，一旦BUFF消失就隨機選擇再補上，不滿5人就重複上BUFF。
	召喚僕從		進入戰鬥	17秒	0	自己			產生3隻狂風僕從來攻擊王的當前目標。
	追殺技(無名		進入戰鬥	0	0	目標單人		若玩家風箏世界王，王會對玩家衝鋒秒殺之
	狂風亂竄		王的血量低於97%	王每損失3%	2(王持續動作)		隨機打1人(彈跳6次)	連鎖閃電，第一位命中者受到maxhp20%的傷害，然後彈跳到附近30碼內的玩家身上造成maxhp40%，倍數成長依此類推，造成maxhp640%傷害時停止


狂風僕從							
	風靈之力		進入戰鬥	4秒	0	目標單人		在目標身上疊加一層「風之殤」，每疊一層生命上限-2%

--]]

--巴隆之王的AI流程：
--巴隆之王每次離開戰鬥，有一段等待的時間，所有重置動作在這個階段進行
--進入戰鬥後，玩家遠離巴隆之王的距離會持續累積，達到上限值之後，巴隆之王會殺死一名玩家來重置累積的距離。
--每5秒會判斷一次。所有的玩家中選5人給風靈纏身狀態，不足5人的，會產生小怪
--下一輪的判斷會清除狀態，並在玩家附近產生小怪
--困難版的巴隆之王有狂風亂竄，以Boss的血量來做施展標準
--巴隆之王有主要技能，此技能有兩個難度的版本
--固定時間會召喚僕從
function Lua_Rebuild_103580()--Boss的AI，此劇情在出生時設定
	--變數宣告:
		
	--基本項
	local ResetHateData=false;
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss, EM_RoleValue_RoomID);
	local Target=0;	
	local IsOutCombat=0;
	local PlayerCumulativeDistance=0;
	local Enemy_Number=0;
	local Player_Number=0;
	local c_Time=0;
	local MaxHP=ReadRoleValue(Boss, EM_RoleValue_MaxHP);
	local HP_Boss=MaxHP;
	local MaxCheat_Distance=1000;
	--參數設定  (含高級世界王記錄)
	local Scale;
	if ReadRoleValue(Boss, EM_RoleValue_OrgID)==107183 then
		Scale="Hard";
		Lua_DW_WBGUIDRecord(1);
	else
		Scale="Easy";
		SetPlot(Boss,"dead","LuaS_103580_6",0);
	end
	local Spell={Discipline=495368, MainAtk=495372};
	local Buff={MakeToken=506371, SpeedUp=506375}
	--強度
	local PowerLv_Discipline=100;
	local PowerLv_MainAtk;
	if Scale == "Hard" then
		PowerLv_MainAtk = 20;
	else
		PowerLv_MainAtk = 6;
	end
	--風靈纏身相關
	local spirit ={ totalplayer=0, execution_time=0, duration=5, remain=15, buff=506371, range=50 };
	--狂風亂竄
	local PowAtkTriRate=math.floor(MaxHP*0.03);
	local LastRecordingHP=MaxHP;
	local PowAtkSpell=499644;
	--裂風鐵翼
	local MainAtk={CD=6, Delay=3, LastExeTime=-3 };
	--召喚小怪
	local TokenOrg;
	if Scale=="Hard" then
		TokenOrg = 107184;
	else
		TokenOrg = 103582;
	end
	local _loc = function ( Obj )--副函式：取座標
		local x,y,z,dir;
		x = ReadRoleValue(Obj, EM_RoleValue_X);
		y = ReadRoleValue(Obj, EM_RoleValue_Y);
		z = ReadRoleValue(Obj, EM_RoleValue_Z);
		dir = ReadRoleValue(Obj, EM_RoleValue_Dir);
		return x, y, z, dir;
	end
	local _relative = function ( x,y,z,dir,Angle,Dis)--副函式：根據座標取相對座標
		local Pos = {};
		local Pi_Value;
		Pi_Value = (math.pi/180)*(Dir+Angle)
		Pos.x = x +(Dis*math.cos(Pi_Value))
		Pos.z = z -(Dis*math.sin(Pi_Value))
		Pos.y = GetHeight(Pos.x, y, Pos.z);
		return Pos.x, Pos.y, Pos.z, Dir;
	end
	local Token={};
	local summon={limit=30, total=0, CD=5, LastExeTime=0, angle=360/3, num=3};
	local x,y,z,dir=_loc(Boss);
	
	--不生帕奇鼠
	SetFlag(Boss, 544801, 1);
	--迴圈:脫離之後物件重置，中斷可能:巴隆之王死亡
	while true do
		sleep(10)
		--Boss仇恨資料整理
		Enemy_Number=HateListCount(Boss);
		Player_Number=0;
		local playerlist={};
		for Pos=0, Enemy_Number-1, 1 do
			local GUID=HateListInfo(Boss, Pos, EM_HateListInfoType_GItemID);
			if ( ReadRoleValue(GUID, EM_RoleValue_IsPlayer) == 1 ) then
				--玩家資料整理&更新
				Player_Number=Player_Number+1;
				table.insert(playerlist, GUID);
			end
		end
		
		--世界王玩家資料檢查
		if(Scale=="Hard")then
			Lua_DW_WBLvCheck_Table(playerlist);
		end
		if Player_Number==0 then
			--離開戰鬥重新進行設定
			if IsOutCombat==1 then
				--脫離迴圈
				break;
			end
		else
			--戰鬥相關資料更新
			Target=ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
			local DifDistance=GetDistance(Boss, Target);
			local d=DifDistance-60;if(d<0)then d=0;end
			PlayerCumulativeDistance=PlayerCumulativeDistance+d;
			IsOutCombat=1;
			HP_Boss=ReadRoleValue(Boss, EM_RoleValue_HP);
			c_Time=c_Time+1;
			ResetHateData=false;
			
			--重新計算衍生物的數量
			if summon.total >= summon.limit then
				for pos=summon.total, 1, -1 do
					local _Token = Token[pos];
					local IsGone = false;
					if _Token == nil then
						IsGone = true;
					end
					if IsGone==false then
						if CheckID( _Token ) == false then
							IsGone = true;
						end
					end
					if IsGone==false then
						--排除陣亡清單
						if ReadRoleValue(_Token, EM_RoleValue_IsDead) == 1 then
							IsGone = true;
						end
					end
					if IsGone == true then
						--更新數量
						table.remove(Token, pos);
						summon.total=summon.total - 1;
					end
				end
			end

			--風靈纏身
			if(c_Time-spirit.execution_time>spirit.duration)then
				spirit.execution_time=c_Time;
				local inflected={};
				local clear={};
				local overload={};
				local newinflected={};
				for playersort=1,#playerlist,1 do
					--將玩家一分為二
					if(CheckBuff(playerlist[playersort],spirit.buff)==true)then
						table.insert(inflected,playerlist[playersort]);
						CancelBuff_NoEvent(playerlist[playersort],spirit.buff);
					else
						table.insert(clear,playerlist[playersort]);
					end
				end
				for i=#inflected,1,-1 do
					if(#clear==0)then
						break;
					end
					local dis_of_between={};
					--每個被感染的玩家

					for j=#clear,1,-1 do
						local dis=GetDistance(clear[j],inflected[i]);
						--列出所有未感染玩家與此感染者的距離
						if(#dis_of_between==0)then table.insert(dis_of_between,{dis=dis;marked=j;guid=clear[j];});else
							local getposition=false;
							for k=1,#dis_of_between,1 do
								if(dis<dis_of_between[k].dis)then
									table.insert(dis_of_between,k,{dis=dis;marked=j;guid=clear[j];})
									getposition=true;
									break;
								end
							end
							if(getposition==false)then
								table.insert(dis_of_between,{dis=dis;marked=j;guid=clear[j];})
							end
						end
					end
					--列出所有人之後
					if(dis_of_between[1].dis<=spirit.range)then
						--若距離夠近 則感染
						table.insert(newinflected,table.remove(clear,dis_of_between[1].marked));
						table.insert(clear,table.remove(inflected,i));
						AddBuff(dis_of_between[1].guid,spirit.buff,0,spirit.remain);
					else
						--若不夠則歸為超載
						table.insert(overload,table.remove(inflected,i));
					end
				end
				--若(已)無未被感染的玩家
				if(#clear==0)then
					for i=#inflected,1,-1 do
						--皆轉移至超載
						table.insert(overload,table.remove(inflected,i));
					end
				end
				--超載的數量化為小怪
				for j=#overload,1,-1 do
					if summon.total < summon.limit then
						x,y,z,dir = _loc(overload[j]);
						x,y,z,dir = _relative(x,y,z,dir, 0, 20+Rand(20) );
						local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
						AddToPartition(_Token, RoomID);
						SetAttack(_Token, overload[j]);
						BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
						table.insert(Token, _Token);
						summon.total = summon.total + 1;
					end
					table.insert(clear,table.remove(overload,j));
				end
				--確認擁有的buff數是否小於5
				if(#newinflected<5)then
					local w=(5-#newinflected);
					for i=1,w,1 do
						if(#clear==0)then
							--無人可感染 產生小怪
							local r=playerlist[DW_Rand(#playerlist)];
							if summon.total < summon.limit then
								x,y,z,dir = _loc(r);
								x,y,z,dir = _relative(x,y,z,dir, 0, 20+Rand(20) );
								local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
								AddToPartition(_Token, RoomID);
								SetAttack(_Token, r);
								BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
								table.insert(Token, _Token);
								summon.total = summon.total + 1;
							end
						else
							--隨機感染
							local r=table.remove(clear,DW_Rand(#clear));
							AddBuff(r,spirit.buff,0,spirit.remain);
						end
					end
				end
			end
			--產生小怪
			if ( (c_Time-summon.LastExeTime) >= summon.CD ) and  ( summon.total < summon.limit) then
				summon.LastExeTime = c_Time;
				for Number=1, summon.num, 1 do
					if (summon.total < summon.limit) then
						x,y,z,dir = _loc(Boss);
						x,y,z,dir = _relative(x,y,z,dir, summon.angle * Number, 20+Rand(20) );
						local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
						AddToPartition(_Token, RoomID);
						SetAttack(_Token, Target);
						BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
						table.insert(Token, _Token);
						summon.total = summon.total + 1;
					end
				end
			end
			--懲戒取巧的玩家
			if PlayerCumulativeDistance > MaxCheat_Distance then
				AddBuff(Boss, Buff.SpeedUp, 0, 3);
				ScriptMessage( Target, Target, 0, "[SC_103580_2]", C_Yellow );
				ScriptMessage( Target, Target, 2, "[SC_103580_2]", C_Yellow );
				sleep(20);
				SysCastSpellLv(Boss, Target, Spell.Discipline, PowerLv_Discipline);
				sleep(5);
				KillID(Boss, Target);
				c_Time=c_Time+1;
				ResetHateData=true;
				if ( ReadRoleValue(Target, EM_RoleValue_IsDead) == 1 ) then
					--目標死亡才重置
					PlayerCumulativeDistance=0;
				end
			end
			
			--狂風亂竄
			Enemy_Number=HateListCount(Boss);
			Player_Number=0;
			playerlist={};
			for Pos=0, Enemy_Number-1, 1 do
				local GUID=HateListInfo(Boss, Pos, EM_HateListInfoType_GItemID);
				if ReadRoleValue(GUID, EM_RoleValue_IsPlayer)==1 then
					--整理玩家資料
					Player_Number=Player_Number+1;
					table.insert(playerlist, GUID);
				end
				
			end
			--世界王玩家資料檢查
			if(Scale=="Hard")then
				Lua_DW_WBLvCheck_Table(playerlist);
			end
			
			if(Scale=="Hard")and(LastRecordingHP-PowAtkTriRate>=HP_Boss)then
				--每當boss的生命減少固定比例......
				local IsSpellOut = false;
				IsSpellOut = CastSpellLV(Boss, playerlist[DW_Rand(Player_Number)], PowAtkSpell, 1);
				if ( IsSpellOut == true ) then
					--成功施法後，才算記錄
					LastRecordingHP=HP_Boss;
					for i,_player in pairs( playerlist ) do
						ScriptMessage( _player, _player, 1, "[SC_103580_5]", C_Yellow );
						ScriptMessage( _player, _player, 0, "[SC_103580_5]", C_Yellow );
					end
					sleep(20);
					c_Time = c_Time + 2;
					ResetHateData=true;
				end
			end
			
			--裂風鐵翼, 主要攻擊技能(壓力技，對Tank產生壓力)
			if ResetHateData then
				--仇恨資料有變過
				--更新目標
				Target = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
				if ( Target == nil ) then
					AllowForNext = false;
				end
			end
			local	too_far, 	--與目標距離是否過遠
				PunishMode,	--是否正在懲戒模式
				time_up;	--是否已可施放？
				too_far = GetDistance(Boss, Target)>55;
				PunishMode = PlayerCumulativeDistance >= MaxCheat_Distance;
				time_up = c_Time - MainAtk.LastExeTime >= MainAtk.CD
			if  not too_far and not PunishMode and time_up then
				local IsSpellOut = CastSpellLV(Boss, Target, Spell.MainAtk, PowerLv_MainAtk);
				if ( IsSpellOut == true ) then
					sleep(MainAtk.Delay * 10 );
					c_Time = c_Time + MainAtk.Delay;
					MainAtk.LastExeTime=c_Time;
					ResetHateData=true;
				end
			end
		end
	end
	--物件重置
	BeginPlot(Boss, "Lua_Rebuild_ResetObj", 0);
end
function Lua_Rebuild_ResetObj()--將物件移出Partition，重新載入
	local Who=OwnerID();
	local RoomID=ReadRoleValue(Who, EM_RoleValue_RoomID);
	DelFromPartition(Who);
	sleep(100);
	AddToPartition(Who, RoomID);
end
function Lua_Rebuild_TokenRule()--衍生物處理規則:離開戰鬥、王消失或死亡 都會造成衍生物消失
	local Token, Boss = OwnerID(), TargetID();
	--不生帕奇鼠
	SetFlag(Token, 544801, 1);
	while true do
		sleep(20);
		--Boss消失或死亡
		if Boss == nil then
			break;
		end
		if CheckID(Boss) == false then
			break;
		end
		if ReadRoleValue(Boss, EM_RoleValue_IsDead) == 1 then
			break;
		end
		--離開戰鬥
		if HateListCount(Token)==0 then
			break;
		end
		if ReadRoleValue( Token, EM_RoleValue_AttackTargetID) == 0 then
			break;
		end
	end
	--衍生物消失
	DelObj(Token);
end

--普通版王的死亡劇情
	
function LuaS_103580_6()
	local x = 0
	local Player = {}
	for i=0,HateListCount( OwnerID()),1 do
		Player[i+1] = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
	end
	local Ball = {}
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		Ball[i] = Lua_DW_CreateObj("obj",115529,Player[1])
		table.remove(Player,1)
	end
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		x = DW_Rand(table.getn(Player))
		Ball[i+5] = Lua_DW_CreateObj("obj",115529,Player[x])
		table.remove(Player,x)
	end
	for i=1,table.getn(Ball),1 do
		SetPlot(Ball[i],"touch","LuaS_103580_7",45)
		WriteRoleValue(Ball[i],EM_RoleValue_LiveTime,15)
		AddBuff(Ball[i],505498,1,-1)
	end
	return true
end

--給予包包
	
function LuaS_103580_7()
	SetPlot(TargetID(),"touch","",0)
	GiveBodyItem(OwnerID(),206593,1)
	DelObj(TargetID())
end