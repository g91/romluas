--702374  2011�R�ָ`���~,npc

Function LuaI_201388() 
	local itemset = { 13 ,""	, { 211833,1 }
                         	        , 26 ,""	, { 211834,1 }
		      , 39 ,""	, { 211835,1 }
		      , 52 ,""	, { 211836,1 }
		      , 64 ,""	, { 211837,1 } 
		      , 76 ,"" 	, { 211838,1 }
		      , 88 ,"" 	, { 211839,1 } 
		     , 100,""	, { 211840,1 } }

	return BaseTressureProc(   itemset , 1  )
end

---------------------------------------------------------------------------------------------------
function lua_mika_music_z15npc_0()	 --Z15  ���ʺ޲z��  114948
	SetSpeakDetail(OwnerID(), "[SC_DAN_112698_1]" )                                   --���ʺ޲z����ܤ��e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_2]", "lua_mika_music_z15npc_1", 0) --����R�ָ`�I��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_2]", "lua_mika_music_z15npc_2", 0) --����§�~�I���覡     
end
---------------------------------------------------------------------------------------------------

function lua_mika_music_z15npc_1()  
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_5]") 				      --�R�ָ`�I������
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_16]", "lua_mika_music_z15npc_11", 0) --��h�R�ָ`�I��
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)             --�^��W�@��
end

function lua_mika_music_z15npc_11()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_17]") 				   --�R�ָ`�I������2
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)          --�^��W�@��
end
---------------------------------------------------------------------------------------------------
function lua_mika_music_z15npc_2()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112589_6]" )	 --§�~�I���W�h
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_3]", "lua_mika_music_z15npc_21", 0) --�ڭn�I��������§�� 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_0", 0)         --�^��W�@��
end

function lua_mika_music_z15npc_21() --�I�� ������§��
	local PlayerID = OwnerID()
	local Score = CountBodyItem( OwnerID() , 204457) --����
	local Note  = CountBodyItem( OwnerID() , 204428) --����
	if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		if Score >= 15 and Note >= 15 then 
                       		SetSpeakDetail (OwnerID(), "[SC_111584_YU_27]" ) --���§A�������I�Ц��U�o��§���a�I
			DelBodyItem( OwnerID() , 204457 , 15 ) --�R������15��
			DelBodyItem( OwnerID() , 204428 , 15 ) --�R������15��
			GiveBodyItem( OwnerID() , 204427  , 1) --������§��
			DesignLog( OwnerID() , 112698 , "exchage reward" ) -- �I�����y
			----------------  �B�~��20% ���v�� ���|�귽 --------------
			local Random = rand(100)+1
			if Random > 80 then
				GiveBodyItem( PlayerID , 725449 , 1 )
			end
			-------------------------------------------------------------

			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_2", 0)--�^��W�@��
		 else
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C			  	
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_music_z15npc_2", 0)--�^��W�@��
		 end 
	else
       		 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]")  --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C	
      		 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "lua_mika_music_z15npc_2", 0 ) --�^��W�@��       
	end
end