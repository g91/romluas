--�t���ħJ����
function LuaYU_PlayMusic_0()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 124) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 
	end

end


--�t���N�L

function LuaYU_PlayMusic_2()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 126) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 
	end

end


--�t���a��

function LuaYU_PlayMusic_7()

	While true do
		sleep(40)
			PlayMotion( OwnerID(), 125) 
			AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 
	end

end






--NPC�ɥR����

function LuaYU_PlayMusic_4()

	local MusicdoneOK = CheckCompleteQuest( OwnerID(), 422271 ); --�P�_���a�O�_�����ӥ���

	if MusicdoneOK == true then   --����

		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_18]"  ) 


	elseif ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 10 then

		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_08]"  ) 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_MUSICPLAY_06]"  , "LuaYU_PlayMusic_6", 0 )--�M�䪾��

	else
		SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_08]"  ) 

	end



end

function LuaYU_PlayMusic_5()

	LoadQuestOption( OwnerID() )


end

function LuaYU_PlayMusic_6()

	SetSpeakDetail(  OwnerID(), "[SC_MUSICPLAY_07]"  ) --�־�����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MUSICPLAY_05]"  , "LuaYU_PlayMusic_5", 0 )--�־��s�@


end






---------------------------------------------------------------------------------------------------------------------------- �ħJ���� 

function YUYULua_PlayMusic_00( Option ) --204421


	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end



	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503334 ) == true then --�p�G�ثe �j�����\������٦b

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C

		else		

			BeginPlot( OwnerID() , "YUYULua_PlayMusic_01" , 0 )            --�}�l�t���־�

		end

	end

end

function YUYULua_PlayMusic_01( ) --204421  �ħJ���� 



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/sax.mp3",FALSE)   --2011.4 �s�W����

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_PROVOKE , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211824 ); --�m���Z�����ħJ����
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493069, 0)
			AddBuff( OwnerID() ,503334 ,0 ,150 ); --�j�����\ 



		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- �N�L 

function YUYULua_PlayMusic_10( Option ) --204461

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503333 ) == true then --�p�G�ثe �t�����\������٦b

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C

		else			


			BeginPlot( OwnerID() , "YUYULua_PlayMusic_11" , 0 )  

		end

	end


end

function YUYULua_PlayMusic_11( ) --204461  �N�L 




--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/guitar.mp3",FALSE)  --2011.4 �s�W����

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211822 ); --�m���Z�����N�L
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493068, 0)	
			AddBuff( OwnerID() ,503333 ,0 ,150 ); --�t�����\ 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end




end

---------------------------------------------------------------------------------------------------------------------------- �Q�w  

function YUYULua_PlayMusic_20( Option ) --204462

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503333 ) == true then --�p�G�ثe �t�����\������٦b

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C

		else			


			BeginPlot( OwnerID() , "YUYULua_PlayMusic_21" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_21( ) --204462  �Q�w  


---	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/lute.mp3",FALSE)  --2011.4 �s�W����
 
	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR , ruFUSION_ACTORSTATE_EMOTE_POINT , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211826 ); --�m���Z�����Q�w
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493067, 0)
			AddBuff( OwnerID() ,503333 ,0 ,150 ); --�t�����\ 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end




end

---------------------------------------------------------------------------------------------------------------------------- �a�� 

function YUYULua_PlayMusic_30( Option ) --204463

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503335 ) == true then --�p�G�ثe �u�����\������٦b

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C

		else			



			BeginPlot( OwnerID() , "YUYULua_PlayMusic_31" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_31( ) --204463  �a�� 


--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/tambourin.mp3",FALSE)  --2011.4 �s�W����

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , ruFUSION_ACTORSTATE_EMOTE_DANCE , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211825 ); --�m���Z�����a��
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493071, 0)
			AddBuff( OwnerID() ,503335 ,0 ,150 ); --�u�����\ 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- �F�a   ����

function YUYULua_PlayMusic_40( Option ) --204464

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then

		if CheckBuff( OwnerID() , 503335 ) == true then --�p�G�ثe �u�����\������٦b

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MUSICPLAY_04]" , 0 )  --�N�o���C

		else			



			BeginPlot( OwnerID() , "YUYULua_PlayMusic_41" , 0 )  


		end

	end


end

function YUYULua_PlayMusic_41( ) --204464  �F�a


--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )
	PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/maracas.mp3",FALSE)  --2011.4 �s�W����

	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C


	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , ruFUSION_ACTORSTATE_EMOTE_DANCE , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211823 ); --�m���Z�����F�a
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 

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
			

			CastSpelllv( OwnerID() ,  OwnerID() , 493070, 0)
			AddBuff( OwnerID() ,503335 ,0 ,150 ); --�u�����\ 


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
		end
	end



end

---------------------------------------------------------------------------------------------------------------------------- �þ��P�ħJ���� 

function YUYULua_PlayMusic_50( Option ) --204421

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�


			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false

		else
			return true
		end


	elseif ( Option == "USE" ) then




			BeginPlot( OwnerID() , "YUYULua_PlayMusic_51" , 0 )  



	end

end

function YUYULua_PlayMusic_51( ) --204421



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )


--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211841 ); --�m���Z�����ħJ����
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 
	AddBuff( OwnerID() ,503338 ,0 ,6 ); --�ĪG


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
			
			BeginPlot( OwnerID() , "YUYULua_PlayMusic_52" , 0 )  
--			CastSpelllv( OwnerID() ,  OwnerID() , 492458, 1)	--����


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
			CancelBuff( OwnerID() ,503338 )
		end
	end



end

function YUYULua_PlayMusic_52( ) --204421



--	Say(OwnerID(),"123")
--	PlaySound( OwnerID(), "sound\\interface\\ui_player_equip.mp3", false )

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --�A�u�����t���F�@�q�]�k���֡C

	if BeginCastBar( OwnerID(), "[SC_MUSICPLAY_00]", 50 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
	 AttachCastMotionTool( OwnerID(), 211841 ); --�m���Z�����ħJ����
	AddBuff( OwnerID() ,503012 ,0 ,5 ); --�S�� 
	AddBuff( OwnerID() ,503338 ,0 ,6 ); --�ĪG


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
			
			BeginPlot( OwnerID() , "YUYULua_PlayMusic_51" , 0 )  
--			CastSpelllv( OwnerID() ,  OwnerID() , 492458, 1)	--����


		elseif ( result == "DAME" ) then

			CancelBuff( OwnerID() ,503012 )
			CancelBuff( OwnerID() ,503338 )
		end
	end



end




---�H�U�O�־��]

function YUYULua_PlayMusic_60( Option,ItemID ) 
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ItemID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		local Item   = {	204558,--�s�@���־�
				204559,
				204560,
				204561,
				204562,

				204563,--�ӫ�7�Ѫ��]
				204564,
				204565,
				204566,
				204567,

				204573,--�ӫ�7�Ѫ��]
				204574,
				204575,
				204576,
				204577,

				206412,--�ӫ�30�Ѫ��]
				206413,
				206414,
				206415,
				206416

				}

		local GIVEID= {	204542,
				204543,
				204544,
				204545,
				204546,

				204421,
				204461,
				204462,
				204463,
				204464,

				204568,
				204569,
				204570,
				204571,
				204572,

				206417,
				206418,
				206419,
				206420,
				206421

				}


		for i= 1 , table.getn(Item) do

			if ItemID == Item[i] then 
				GiveBodyItem( PlayerID , GIVEID[i] , 1 )	

			end
		end

	end
end

function Lua_Hao_Musical_Instruments( )	-- �P�_�Q�I��ؼЬO�_�����a

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Player = ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer )

	if Player ~= 1 then
	--	DebugMsg( OwnerID() , RoomID , TargetID().." = "..Player )
		return false
	end
--	DebugMsg( OwnerID() , RoomID , TargetID().." = "..Player )
	return true
end

function Lua_Hao_Musical_Reset_CD( )	-- ���m�S�w�k�N��CD

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Magic = { 493067 , 493068 , 493069 , 493070 , 493071 }
	local Buff = { 503333 , 503334 , 503335 }

	for i = 1 , table.getn(Magic) , 1 do
		local Class = GameObjInfo_Int( Magic[i] ,"ColdownClass")  -- ��o�Ӫk�N���I�k�N�o��� - ����
		local Type = GameObjInfo_Int( Magic[i] ,"ColdownType")  -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o����
		local CD = GameObjInfo_Int( Magic[i] ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�
	--	DebugMsg( OwnerID() , RoomID , "Class = "..Class.." Type = "..Type )
		if CD > 0 then
		--	DebugMsg( OwnerID() , RoomID , TargetID().." "..Magic[i] )
			WriteRoleValue( TargetID() , EM_RoleValue_Coldown_Job + Type , 0 )
			local Data = ReadRoleValue( TargetID() , EM_RoleValue_Coldown_Job + Type )
		--	DebugMsg( OwnerID() , RoomID , TargetID().." , Data = "..Data )
		--	DebugMsg( OwnerID() , RoomID , TargetID().." , Coldown = "..CD )
		end
	end

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( TargetID() , Buff[i] )
	end
end