function OpenMailBoxByItem(Option)

	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local Player = OwnerID()

	if Language == "cn" then
		ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_418]" , 0 )
		return false
	end

	if Option == "CHECK" then
--	if OpenMail() == true then
		if OpenMailEx(Player)  == true then 
		-- 2011.06.10  �ץ��w��t�Ӧ^��bug,  �ק���O�� OpenMailEx
		-- 2011.09.08  ���׼��O��^���H���l�c�ƻs���~�����D
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
	-- 2011.06.10  �ץ��w��t�Ӧ^��bug,  �ק���O�� OpenBankEx
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
	-- 2011.06.10  �ץ��w��t�Ӧ^��bug,  �ק���O�� OpenACEx
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