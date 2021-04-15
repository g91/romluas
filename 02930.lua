function bico_850878_ACDps()
	SysCastSpellLv( OwnerID(), OwnerID(), 850878, 0 )
end

function bico_850882_Cancel_621218()
--498562  --盾衛型態法術集合
--621218  --顯示Buff無功能
--	CancelBuff( OwnerID(), 621218 )	--消除盾衛型態
	Lua_CDtime_set(OwnerID(),498562 ,7)
	SysCastSpellLv( OwnerID() , OwnerID(), 850883, 0 )
end

function Bico_850884_Check()--拆解型態(850884)
	local OID = OwnerID()

	if CheckBuff( OID, 624374 ) then
		CancelBuff( OID, 624377 )--耐加成
		CancelBuff( OID, 624378 )--耐加成
		--CancelBuff( OID, 621219 )--力衰減
		--CancelBuff( OID, 621221 )--力衰減

		CancelBuff( OID, 624374 )--顯示狀態
		return false
	end
	Bico_850884_State()
	return true
end


function Bico_850884_State()--拆解形態狀態
	local OID = OwnerID()
	local baseSta = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Sta )--sta不算Buff的數值
	local changeSta = KS_CheckBuffLV( OID, 624378 ) + KS_CheckBuffLV( OID, 624377 )*100		--取得指定物件身上BUFF等級
	local rate = 0.8--等級係數
	local compute = math.floor( baseSta*rate)--轉換值

	if BaseSta  == 0 or changeSta ~= compute then
		CancelBuff( OID, 624377 )--轉換100N	拆解形態
		CancelBuff( OID, 624378 )--轉換N	拆解形態
		CancelBuff( OID, 621216 )--轉換100N	盾衛型態
		CancelBuff( OID, 621217 )--轉換N	盾衛型態

		local x100 = math.floor(compute/100)
		if x100 > 0 then
			AddBuff( OID, 624377, x100-1, -1 )--轉換100N
		end

		local x1 = math.floor(compute%100)
		if x1 > 0 then
			AddBuff( OID, 624378 , x1-1, -1 )--加力
		end
		
	end
end

function bico_del624379( buff1,buff2 )
	--if CheckBuff( OwnerID() , buff1) == false then
	CancelBuff( OwnerID(), buff1 )
		CancelBuff( OwnerID(), buff2 )
	--end
end

function bico_850892_SkillLv4()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 3 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv3()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 2 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv2()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 1 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv1()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 0 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv0()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == -1 then
		return true
	else
		return false
	end
end


function bico_850892_CancelBuff()
	if CheckBuff( TargetID() , 624395 ) == true then
	CancelBuff( TargetID(), 624395 )
	end
end


function bico_624370_621167_Buff()	--如果身上有鍛造效果，取消鍛造效果
	if CheckBuff( OwnerID(), 621167 ) == true then		--主職498524
		CancelBuff( OwnerID(), 621167 )
	elseif CheckBuff( OwnerID(), 621251 ) == true then	--主職有連鎖驅動498590
		CancelBuff( OwnerID(), 621251 )
	elseif CheckBuff( OwnerID(), 621302 ) == true then	--符靈498598
		CancelBuff( OwnerID(), 621302 )
	elseif CheckBuff( OwnerID(), 622184 ) == true then	--符影850050	   
		CancelBuff( OwnerID(), 622184 )
	end	
end

function bico_624370fix()	--如果身上有戰守移轉效果，取消戰守移轉
	if CheckBuff( OwnerID(), 624369 ) == true then
		AddBuff( OwnerID(), 624318, 0, 300 )
	end
end

function bico_621167fix()
	if CheckBuff( OwnerID(), 621167 ) == true then		--主職498524
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 621251 ) == true then	--主職有連鎖驅動498590
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 621302 ) == true then	--符靈498598
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 622184 ) == true then	--符影850050	   
		AddBuff( OwnerID(), 624318, 0, 300 )
	end	
end

function bico_621303_621168()
	if CheckBuff( OwnerID(), 624369 ) == true then
		SysCastSpellLv( OwnerID(), OwnerID(), 850881, 0 )
	end
end