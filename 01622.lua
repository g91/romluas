--�j�N���_ 
--�R�B���l.�`�F�¬}.�b����x.�B�V��x
------------------------------------------------------------------
--�R�B���l

Function  Lua_mika_losttreasuredes02()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_DES05]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
						BeginPlot(  OwnerID()  , "Lua_mika_losttreasuredes03" , 0 )  
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasuredes02",60 )
			end
		end
	end
end

function Lua_mika_losttreasuredes03()     

			---------------- 2011.08.30 �s�W�ٸ����i�t�Υ��ȱ���
			local npcid = 106282
			DW_QietKillOne( OwnerID(), npcid )
			------------------------------------------------- 

			local BuffType = 0
			local Count = BuffCount ( OwnerID())
			local SetA = -1--
			local SetB = -1--
			local SetC = -1--
			local SetD = -1--
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 505282 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetA = BuffLv
				elseif BuffID == 505283 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetB = BuffLv
				elseif BuffID == 505284 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetC = BuffLv
				elseif BuffID == 505285 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetD = BuffLv
				end
			end
			local P = 4
			local XX = Rand( P )      
			if XX == 0 then   
				CancelBuff(OwnerID(),505282)
				AddBuff(OwnerID(), 505282,SetA+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES01] " , C_SYSTEM )	--�A���o�F1��[�ϥ�505282]�����|�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES01]"  , C_SYSTEM )	
			elseif XX == 1 then   
				CancelBuff(OwnerID(),505283)
				AddBuff(OwnerID(), 505283,SetB+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES02] " , C_SYSTEM )	 --�A���o�F1��[�ϥ�505283]�����|�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES02]"  , C_SYSTEM )	
			elseif XX == 2 then   
				CancelBuff(OwnerID(),505284)
				AddBuff(OwnerID(), 505284,SetC+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES03] " , C_SYSTEM )	--�A���o�F1��[�ϥ�505284]�����|�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES03] "  , C_SYSTEM )	
			elseif XX == 3 then   
				CancelBuff(OwnerID(),505285)
				AddBuff(OwnerID(), 505285,SetD+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES04] " , C_SYSTEM )	--�A���o�F1��[�ϥ�505285]�����|�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES04]"  , C_SYSTEM )	
			end

end
------------------------------------------------------------------
--�R�B���l��֦���

function Lua_mika_losttreasuredes_magic01()  --��֦���
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505282)
				AddBuff(OwnerID(), 505282,SetA-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

-----------------------------------------------------------------
function Lua_mika_losttreasuredes_magic02()  --��֦���
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505283)
				AddBuff(OwnerID(), 505283,SetB-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end
-----------------------------------------------------------------

function Lua_mika_losttreasuredes_magic03()  --��֦���
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505284)
				AddBuff(OwnerID(), 505284,SetC-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

-----------------------------------------------------------------
function Lua_mika_losttreasuredes_magic04()  --��֦���
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505285)
				AddBuff(OwnerID(), 505285,SetD-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

------------------------------------------------------------------
--�`�F�¬}
function Lua_mika_losttreasure_dark2()    --�`�F�¬} 
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if CheckBuff(OwnerID(), 505286) == false then --�p�G�S���S�wbuff
			AddBuff( OwnerID() , 503047 , 0, 5)  --���K�ۨ�
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_HALL01]" , C_SYSTEM ) --�AĲ�I��[114081]���A�G�A�����U�N�F�_�ӡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_HALL01]"  , C_SYSTEM )--�AĲ�I��[114081]���A�G�A�����U�N�F�_�ӡC
		elseif CheckBuff(OwnerID(), 505286) == true then -- �p�G���S�wbuff BUFF�s���N��
			--------------------------------------------------------------------------------------
			-- 2011.08.15  ����-NPC  �����`�F�¬}	106280
			local npcid = 106280
			DW_QietKillOne( OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			DelObj(TargetID())
			CancelBuff( OwnerID() , 505286)  --���� �b�Ƥ��K�ĪG
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_HALL02]" , C_SYSTEM )  --[114081]����b�ƮĪG���v�T�Ӯ����F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_HALL02] "  , C_SYSTEM )  --[114081]����b�ƮĪG���v�T�Ӯ����F�C
		end
	end
end
------------------------------------------------------------------
--�b����x	

Function  Lua_mika_losttreasurecure02()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	local candle = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114079, 300 , 0)       --��x
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	elseif CheckBuff(OwnerID(), 505286) == true then --�p�G���b�Ƥ��K
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_CURE01] " , C_SYSTEM )	--�A�w����[505286]�ĪG�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_CURE01]"  , C_SYSTEM )	
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_CURE03]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
	--���o[505286]
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
						--PlayMotion(candle, ruFUSION_MIME_CROUCH_BEGIN) 
						AddBuff( OwnerID() ,505286 , 0, 180)  --�b�Ƥ��K�ĪG 
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_CURE02] " , C_SYSTEM )	--�A���o�F[505286]�ĪG�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_CURE02]"  , C_SYSTEM )	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasurecure02",50 )
			end
		end
	end
end


------------------------------------------------------------------------
--�B�K��O
function Lua_mika_losttreasure_blue2() --�B�K��O
--	Say(OwnerID(),"O") ���a
--	Say(TargetID(),"T")  ��x
	local candle1 = CheckFlag (OwnerID(), 543487)
	local candle2 = CheckFlag (OwnerID(), 543488)
	local candle3 = CheckFlag (OwnerID(), 543489)
	local onoff = ReadRoleValue(TargetID() , EM_RoleValue_Register)   --��O�}�����A�A�Ȭ�1�O�w�I�U�A�Ȭ�0�O���I�U�C

	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if candle3 == true then
			ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_22]" ,0  )--3����O�w�Q�I�U�A�X�ɶ��������e�֫e����񤤥������_�w�a�C
			ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_22]" ,0  )-- 3����O�w�Q�I�U�A�X�ɶ��������e�֫e����񤤥������_�w�a�C
		elseif onoff == 1 then
			ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_23]" ,0  )-- ����O�w�Q�I�U�C
			ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_23]" ,0  )-- ����O�w�Q�I�U�C
		elseif onoff == 0 then
			if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_18]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
	while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- ���\
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- ����
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end
				if ( result == "OKOK" ) then
					if CheckID( TargetID() ) == true then
						if candle1 == true  and candle2 == true then --��O1�M��O2�w�Q�I�U (����O����3�ӡC)
			--				Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --����O�I�U
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --����O�w�Q�I�U
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505596 , 1, 1200)  --20���� 
							else
								AddBuff( OwnerID() , 505596 , 1, 900)  --15���� 
							end
							SetFlag(OwnerID(), 543489, 1) --����3����OKEY
							sleep(20)
							time = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9) 
		--					Say(OwnerID(), time)
							if time >= 240 then
								--- 6.0.1 �s�W 61�ťH�W���a�ѤU4�����H�W�q��, ��o�S��key
								if ReadRoleValue(OwnerID(), EM_RoleValue_LV)  >= 61 then-- �D¾����
									Setflag(OwnerID(), 548091, 1 )
								end

								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_19]" ,0  )--����ǨӨI�����}���n�A���_�w���j���w�g�}�ҡC
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_19] " ,0  )--����ǨӨI�����}���n�A���_�w���j���w�g�}�ҡC
								CancelBuff(OwnerID(), 505594)
								CancelBuff(OwnerID(), 505595)
								CancelBuff(OwnerID(), 505596)
								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_MSG01]" ,0  )--���_�w���G�X�{�F�S���_�c�C
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_MSG01]" ,0  )--���_�w���G�X�{�F�S���_�c�C
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest1" , 0 )   --�ͤ@���_�c
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest11" , 0 )   --�ͤ@���_�c
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest2" , 0 )   --�ͺ��_��
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest3" , 0 )   --�͵��_�c
							else
								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_19]" ,0  )--����ǨӨI�����}���n�A���_�w���j���w�g�}�ҡC
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_19] " ,0  )--����ǨӨI�����}���n�A���_�w���j���w�g�}�ҡC
								CancelBuff(OwnerID(), 505594)
								CancelBuff(OwnerID(), 505595)
								CancelBuff(OwnerID(), 505596)
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest1" , 0 )   --�ͤ@���_�c
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest11" , 0 )   --�ͤ@���_�c
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest2" , 0 )   --�ͺ��_�c
							end
							local treasuredoor = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113621, 2000 , 0)       --�_�w�j��
							PlayMotion(treasuredoor, 145) 
							Sleep(100)  --10���
							BeginPlot(OwnerID(), "Lua_mika_losttreasure_exit00" , 0 )   --�I�s���}�ζǰe�}
							Sleep(10)  --30���
							local tran = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113615, 3000 , 0)       --���j��
							BeginPlot(tran, "Lua_mika_losttreasure_delnpc2", 0)  --�R�����_�w�P���
						elseif candle1 == true then --��O1�w�Q�I�U(����O����2��)
		--					Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --����O�I�U
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --����O�w�Q�I�U
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --����O�w�Q�I�U
							ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_ICE02]" ,0  )--�A�I�U�F�ĤG��[113614]�C
							ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_ICE02] " ,0  )--�A�I�U�F�ĤG��[113614]�C
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505595 , 1, 1200)  --20���� 
							else
								AddBuff( OwnerID() , 505595 , 1, 900)  --15���� 
							end
							SetFlag(OwnerID(), 543488, 1) --����2����OKEY
						else --������1����O
		--					Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --����O�I�U
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --����O�w�Q�I�U
							ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_ICE01]" ,0  )--�A�I�U�F�Ĥ@��[113614]�C
							ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_ICE01] " ,0  )--�A�I�U�F�Ĥ@��[113614]�C
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505594 , 1, 1200)  --20���� 
							else
								AddBuff( OwnerID() , 505594 , 1, 900)  --15���� 
							end
							SetFlag(OwnerID(), 543487, 1) --����1����OKEY
						end
					end
				elseif ( result == "DAME" ) then
					SetPlot( TargetID(),"touch","Lua_mika_losttreasure_blue2",50 )
				end
			end
		end
	end
end


function Lua_mika_losttreasure_test11()
	Say(TargetID(),EM_RoleValue_Register)
end

-----------------------------------------------------------