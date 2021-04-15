function OpenMailBoxByItem(Option)

	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Player = OwnerID()

	if Language == "cn" then
		ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_418]" , 0 )
		return false
	end

	if Option == "CHECK" then
--	if OpenMail() == true then
		if OpenMailEx(Player)  == true then 
		-- 2011.06.10  修正德國廠商回應bug,  修改指令為 OpenMailEx
		-- 2011.09.08  阻擋摩力游回報隨身郵箱複製物品的問題
			--Say(OwnerID(),"true")
			return true
		else
			--Say(OwnerID(),"false")
			return false
		end
	elseif  Option == "USE" then
		--Say(OwnerID(),"use ok ! ")		
	end
end

function OpenBankByItem(Option)
	if Option == "CHECK" then
--	if OpenBank() == true then
	if OpenBankEx(OwnerID() ) == true then
	-- 2011.06.10  修正德國廠商回應bug,  修改指令為 OpenBankEx
		--Say(OwnerID(),"true")
		return true
	else
		--Say(OwnerID(),"false")
		return false
	end
	elseif  Option == "USE" then
		--Say(OwnerID(),"use ok ! ")		
	end
end

function OpenACByItem(Option)
	if Option == "CHECK" then
--	if OpenAC() == true then
	if OpenACEx(OwnerID() ) == true then
	-- 2011.06.10  修正德國廠商回應bug,  修改指令為 OpenACEx
		--Say(OwnerID(),"true")
		return true
	else
		--Say(OwnerID(),"false")
		return false
	end
	elseif  Option == "USE" then
		--Say(OwnerID(),"use ok ! ")		
	end
end

--bool	OpenACEx( int TargetID );
--bool	OpenMailEx( int TargetID );
--bool    OpenBankEx( int TargetID )