--�K����s
function LuaI_205898( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*���M�����A
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --�����Bbuff
						CastSpell( TargetID(), TargetID(), 494149 ) --�ܰs�ʧ@
						CancelBuff(TargetID(), 504666) --�������B
						DelBodyItem( OwnerID() , 205898 , 1 ) --�K����s
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC18]" , C_SYSTEM )	--�A���ѤF�P�򪺴H�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC18]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --���K��buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC16]" , C_SYSTEM )	--�A���ΤF�K����s�A��M�P������o���C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC16]"  , C_SYSTEM )	--
						return true
					end
				end
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*���M�����A
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --�����Bbuff
						CastSpell( TargetID(), TargetID(), 494149 ) --�ܰs�ʧ@
						CancelBuff(TargetID(), 504666) --�������B
						DelBodyItem( OwnerID() , 205898 , 1 ) --�K����s
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC06]" , C_SYSTEM )	--�A���ѤF���P�򪺴H�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC06]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC07]" , C_SYSTEM )	--�Y�Ӽ��������a�ϥεK����s�A�ĤƤF�A�P�򪺴H�N�C
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC07]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --���K��buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC08]" , C_SYSTEM )	--�A�ܽй�趼�ΤF�@�~[205898]�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC08]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC09]" , C_SYSTEM )	--�Y�Ӽ��������a�ܽЧA���ΤF[205898]�A�A��Mı�o�����o���C
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC09]"  , C_SYSTEM )	--
						return true
					end
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then
		CastSpell( TargetID(), TargetID(), 494184 ) 
	end
end

--���B��s
function LuaI_205899( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*���M�����A
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --�����Bbuff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --���K��buff
						CastSpell( TargetID(), TargetID(), 494149 ) --�ܰs�ʧ@
						CancelBuff(TargetID(), 504665) --�����K��
						DelBodyItem( OwnerID() , 205899 , 1 ) --���B��s
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC19]" , C_SYSTEM )	--�A�����F�P�򪺼��סC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC19]"  , C_SYSTEM )	--
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC17]" , C_SYSTEM )	--�A���ΤF[205899]�A��M�P������o�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC17]"  , C_SYSTEM )	--
						return true
					end
				end
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*���M�����A
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
					return false
				else
					if CheckBuff(TargetID(), 504665) == true then  --���K��buff
						CastSpell( TargetID(), TargetID(), 494149 ) --�ܰs�ʧ@
						CancelBuff(TargetID(), 504665) --�����K��
						DelBodyItem( OwnerID() , 205899 , 1 ) --���B��s
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC10]" , C_SYSTEM )	--�A�����F���P�򪺼��סC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC10]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC11]" , C_SYSTEM )	--�Y�ӯ��������a�ϥη��B��s�A�ĤƤF�A�P�򪺼��סC
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC11]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504666) == true then  --�����Bbuff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--�ϥι�H�w�����ۦP�����ĪG�A�L�k�ϥΡC
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC12]" , C_SYSTEM )	--�A�ܽй�趼�ΤF�@�~[205899]�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC12]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC13]" , C_SYSTEM )	--�Y�ӯ��������a�ܽЧA���ΤF[205899]�A�A��Mı�o�����o�N�C
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC13]"  , C_SYSTEM )	--
						return true
					end
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then
		CastSpell( TargetID(), TargetID(), 494185 ) 
	end
end

--�S�հ�s�k�N
function LuaI_205894( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() == OwnerID() )   then   --�Y��H�O�ۤv
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC01]" , C_SYSTEM )	--�����~�L�k��ۤv�ϥΡA�й�䥦���a�ϥΡC
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC01]"  , C_SYSTEM )	--�����~�L�k��ۤv�ϥΡA�й�䥦���a�ϥΡC
				return false
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*���M�����A
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
					return false
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC14]" , C_SYSTEM )	--�A�ܽй��@�P���Τ@�~[205894]�C
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC14]"  , C_SYSTEM )	
					ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC15]" , C_SYSTEM )	--�Y�ӤH�ܽЧA�@�P���ΤF[205894]�C
					ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC15]"  , C_SYSTEM )	
					return true
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--�����~�u����L���a�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then
	--	PlayMotion( TargetID(), 118) --��
	--	PlayMotion( OwnerID(), 118) --��
		local RANDOWN = rand(19)
		if RANDOWN == 0 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP1/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "0HP" )
		elseif RANDOWN == 1 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP1/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "1MP" )
		elseif RANDOWN == 2 then  
			CastSpell( OwnerID(), TargetID(), 494262 ) --�����]��1/1
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494262 ) 
			sleep(10)
--			Say(OwnerID(), "2attack" )
		elseif RANDOWN == 3 then  
			CastSpell( OwnerID(), TargetID(), 494260 ) --hpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494260 ) 
			sleep(10)
--			Say(OwnerID(), "3hpmax" )
		elseif RANDOWN == 4 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP2/7
			sleep(10)
			CastSpell(TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "5HP" )
		elseif RANDOWN == 5 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP2/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "5MP" )
		elseif RANDOWN == 6 then  
			CastSpell( OwnerID(), TargetID(), 494188 ) --�R�� 1/1
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494188 ) 
			sleep(10)
--			Say(OwnerID(), "6up" )
		elseif RANDOWN == 7 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP3/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "7HP" )
		elseif RANDOWN == 8 then  
			CastSpell( OwnerID(), TargetID(), 494260 ) --hpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494260 ) 
			sleep(10)
--			Say(OwnerID(), "8hpmax" )
		elseif RANDOWN == 9 then  
			CastSpell( OwnerID(), TargetID(), 494261 ) --mpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494261 ) 
			sleep(10)
--			Say(OwnerID(), "9mpmax" )
		elseif RANDOWN == 10 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP3/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "10MP" )
		elseif RANDOWN == 11 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP5/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "11MP" )
		elseif RANDOWN == 12 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP4/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "12HP" )
		elseif RANDOWN == 13 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP6/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "13MP" )
		elseif RANDOWN == 14 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP5/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "14HP" )
		elseif RANDOWN == 15 then  
			CastSpell( OwnerID(), TargetID(), 494261 ) --mpmax 2/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494261 ) 
			sleep(10)
--			Say(OwnerID(), "15mpmax" )
		elseif RANDOWN == 16 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP4/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "16MP" )
		elseif RANDOWN == 17 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP6/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "17HP" )
		elseif RANDOWN == 18 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP7/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "18MP" )
		elseif RANDOWN == 19 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP7/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "19HP" )
		end
	end
end

--(1) up       1/20	1�p�ɤ��A�R���v����3%    504631 -
--(2) mpmax 2/20	1�p�ɤ��A�̤jMP�W������5%  504632
--(3) hpmax 2/20	1�p�ɤ��A�̤jHP�W������5%  504633
--(4)attack  1/20	1�p�ɤ��A�����]��U����5%  504634
--(5) hp  7/20	������_�ϥΪ�����HP15%	494186 --Castspell -
--(6) mp 7/20	������_�ϥΪ�����MP15%	494187 --Castspell --