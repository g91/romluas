

--�`�y���ʦ@���]���_����q����NPC
function lua_mika_fes_magicnpc_01()
	local OID = OwnerID()
	local TID = TargetID()

	SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_01]" )   -- ���
	AddSpeakOption( OID , OID , "[SC_MAGICBOX_EVENT_06]" , "lua_mika_fes_magicnpc_03" , 0)   -- ����`�y�Ϥ�
	AddSpeakOption( OID , OID , "[SC_MAGICBOX_EVENT_02]" , "lua_mika_fes_magicnpc_02" , 0)   -- �ڷQ�I��������y

end

--�ڷQ�I��������y
function lua_mika_fes_magicnpc_02()
	local OID = OwnerID() -- player
	local TID = TargetID()   --npc

	-- ��ѵ��L�I��
	local keyid = 544302   -- ��Ѥw���§��
	local checkkey = Checkflag(OID, keyid ) 

	local buffid = 621830 --�]���_����q�I������
	local bufflv =  FN_CountBuffLevel(OID, buffid )  
	local Count1 = CountBodyItem(OID, 203292 )  --�A���P��
	local Count2 = CountBodyItem(OID, 203293 )  --������L
	local Count3 = CountBodyItem(OID, 203294 )  --���ѽ���
	local Count4 = CountBodyItem(OID, 203295 )  --�P���j��
	local Count5 = CountBodyItem(OID, 203291 )  --�ߤ߬ۦL

	if checkkey == true then -- ��ѻ�L
		SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_03]" )  -- �A���Ѥw�g�I���L�F�A�Щ��ѦA�ӧa�C
	else  -- ��ѨS��L (��1��)
	
		if Count1 > 0 or Count2 > 0 or Count3 > 0 or Count4 > 0 or Count5 > 0 then  --  �p�G���@�طϤ��@�إH�W
			CloseSpeak(OID)

			if Count1 > 0 then
				DelBodyItem(OID, 203292, 1  )
			elseif Count2 > 0 then
				DelBodyItem(OID, 203293, 1  )
			elseif Count3 > 0 then
				DelBodyItem(OID, 203294, 1  )
			elseif Count4 > 0 then
				DelBodyItem(OID, 203295, 1  )
			elseif Count5 > 0 then
				DelBodyItem(OID, 203291, 1  )
			end

		--	Say(OID, "Bufflv = "..bufflv )
			if CheckBuff(OID, 621830 ) == false then   -- �Sbuff
				Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������
				GiveBodyItem(OID, 725654 , 1 )   -- �Ϥ��]
			else  -- ��buff
				local R = Rand(100)+1
				if bufflv == 5 then     --  (��7��)
					CancelBuff(OID, buffid)

					local itemtable = {203487 , 725025 }
					local itemcount = { 7 , 1  }
					if  R >= 31 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end	
				elseif bufflv == 4 then   --  (��6��)
					Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������

					local itemtable = {203487 , 725649  }
					local itemcount = { 6 , 1  }
					if  R >= 41 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 3 then   --  (��5��)
					Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������

					local itemtable = {203487 , 725449 }
					local itemcount = { 5, 1 }
					if  R >= 61 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 2 then   --  (��4��)
					Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������

					local itemtable = {  725649 , 720289 }
					local itemcount = { 1 , 1 }
					if  R >= 11 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 1 then   --  (��3��)
					Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������

					local itemtable = { 203487 , 725654 }
					local itemcount = { 3  , 1 }
					if  R >= 71 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 0 then   --  (��2��)
					Addbuff(OID , buffid , 0 , 86400 )  -- ��24HR  �w�y���y�I������

					local itemtable = { 725449 , 724059 }
					local itemcount = { 1  , 1 }
					if  R >= 61 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				end
			end

			Setflag(OID, 544302 , 1)
		else
			SetSpeakDetail( OID , "[SC_112502_NO]" )   -- �A���������~�ƶq������I
		end
	end


end

-- ����`�y�Ϥ�
function lua_mika_fes_magicnpc_03()
	local OID = OwnerID() -- player
	SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_05]" )   -- ���
end


-- ���եΫ��O

function lua_mika_fes_magicnpc_test2()
	local OID = OwnerID() -- player

	local Count1 = CountBodyItem(OID, 203292 )  --�A���P��
	local Count2 = CountBodyItem(OID, 203293 )  --������L
	local Count3 = CountBodyItem(OID, 203294 )  --���ѽ���
	local Count4 = CountBodyItem(OID, 203295 )  --�P���j��
	local Count5 = CountBodyItem(OID, 203291 )  --�ߤ߬ۦL

	Say(OID, "count1 = "..Count1 ) 
	Say(OID, "count2 = "..Count2 ) 
	Say(OID, "count3 = "..Count3 ) 
	Say(OID, "count4 = "..Count4 ) 
	Say(OID, "count5 = "..Count5 ) 
end


function lua_mika_fes_magicnpc_test(day)
	local OID = OwnerID() -- player
	local R = Rand(100)+1

	if day == 1 then
		GiveBodyItem(OID, 725654 , 1 )   
	elseif day == 2 then
		local itemtable = { 725449 , 724059 }
		local itemcount = { 1  , 1 }
		if  R >= 61 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 3 then
		local itemtable = { 203487 , 725654 }
		local itemcount = { 3  , 1 }
		if  R >= 71 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 4 then
		local itemtable = {  725649 , 720289 }
		local itemcount = { 1 , 1 }
		if  R >= 11 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 5 then
		local itemtable = {203487 , 725449 }
		local itemcount = { 5, 1 }
		if  R >= 61 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 6 then
		local itemtable = {203487 , 725649  }
		local itemcount = { 6 , 1  }
		if  R >= 41 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 7 then
		local itemtable = {203487 , 725025 }
		local itemcount = { 7 , 1  }
		if  R >= 31 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end	
	end

end