function LuaAI_101534()
	local Count = 0
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			if Count == 15 then--每 20 秒會對之前上過弱點識破的人使用瞄準投擲
				EnableNpcAI( OwnerID() , false )
				sleep(30)
				local PPL = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
				for i = 0 , HateListCount( OwnerID() ) -1 , 1 do
					if HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID ) == PPL then
						Say( OwnerID() , "[SC_101534_1]" )
						AdjustFaceDir( OwnerID(), PPL ,0 )
						sleep(5)
						CastSpellLV( OwnerID() , PPL , 492430 , 30 )  --阿龐修改，將原先的9改成30
						sleep(15)
						CancelBuff( PPL , 501658 )
						Count = Count +2
						break
					end
				end
				WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0 )
				EnableNpcAI( OwnerID() ,true)
			end
			local RandNum = Rand( 10000 )
			RandNum = RandNum - 100*math.floor( RandNum/100 )
			if RandNum < 50 then --每秒有 25% 機率對範圍內仇恨最高的目標（只剩一個人時才打主坦）並且沒有暈眩的角色使用昏眩砍擊，阿龐修改，將25%改成50%
				local Attack
				if HateListCount( OwnerID() ) >= 2 then
					for i = 1 , HateListCount( OwnerID() ) -1 , 1 do
						Attack = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
						if GetDistance( OwnerID() ,  Attack ) < 51 and CheckBuff( OwnerID() , 502575 ) == false then
							Say( OwnerID() , "[SC_101534_2]" )
							CastSpellLV( OwnerID() , Attack , 492428 , 0 )     --阿龐修改，將原先的9改成0
							break
						end
					end
				else
					Attack = HateListInfo(OwnerID() ,0 , EM_HateListInfoType_GItemID )
					if GetDistance( OwnerID() ,  Attack ) < 51 and CheckBuff( OwnerID() , 502575 ) == false then
						CastSpellLV( OwnerID() , Attack , 492428 , 0 ) 
					end
				end
			end
			sleep(10)
			Count = Count + 1
			if Count > 20 then
				Count = 0
			end
		else
			Count = 0
			WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0 )
			sleep(60)
		end
	end
end

function LuaAI_101534_SKill()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID() )
end