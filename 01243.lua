					
function LuaDan_111700_0()
	SetSpeakDetail(OwnerID(), "[SC_DAN_111700_1]" )--NPC���   --.."[SC_DAN_111700_3]"
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_2]", "LuaDan_111700_4", 0) --�ڷQ�n��F�ѬK�B�`�y����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_4]", "LuaDan_111700_1", 0) --����Q���Ѫ��m�JStealed eggs
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_5]", "LuaDan_111700_2", 0) --�����ä������Petal collection
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_6]", "LuaDan_111700_3", 0) --����C�������Hide and Dig
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW01]", "Lua_mika_spring_reward", 0) --�I�����y����

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW09]", "Lua_mika_springfes_changeitem", 0) --�I��[206847]
	end

end
---------------------------------------------------------------------------------------------------
function LuaDan_111700_1()--����Q���Ѫ��m�JStealed eggs
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_7]") --�Q���ѱm�J���Ȥ���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_12]", "LuaDan_111700_5", 0) --�p����^�Q���Ѫ��m�J
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_18]", "LuaDan_111700_8", 0) --��10���Q���Ѫ��m�J�I������
end
------------------------------------------------------------------------------------------------------
function LuaDan_111700_2()
        SetSpeakDetail (OwnerID(), "[SC_DAN_111700_8]" ) --��ä�����֥��Ȥ���
        AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_13]", "LuaDan_111700_6", 0) --�p�󦬶��i�����
        AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_25]", "LuaDan_111700_9", 0) --��20���i���ä�I�����y
end
---------------------------------------------------------------------------------------------------------
function LuaDan_111700_3()
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_9]" ) --�C������֥��Ȥ���
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_14]", "LuaDan_111700_7", 0) --�p��i��C�������
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_4()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]") --�K�B�`�y���ʭI�� 
         AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "LuaDan_111700_4_1", 0)  --�K�B�`�y���ʭI��2
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_0", 0)--�^��W�@��
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_4_1()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]") --�K�B�`�y���ʭI��2 
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_0", 0)--�^��W�@��	
end
-----------------------------------------------------------------------------------------------------------
function lua_mika_springfes_changeitem()  --�I�����m��
	SetSpeakDetail(OwnerID(), "[SC_SPRINGFES_NEW07]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW08]", "lua_mika_springfes_changeitem1", 0) --�ڭn�I��[206847]

end

function lua_mika_springfes_changeitem1()
	local item = CountBodyItem(OwnerID(), 202435) --�a
	if item >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_112502_OK]") --���A�K�B�`�ּ֡I 
		GiveBodyItem(OwnerID(), 206847, 1)
		DelBodyItem(OwnerID(), 202435, 1)
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]") --�A�ҫ������~�ƶq����
		 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_springfes_changeitem", 0)--�^��W�@��
	end
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_5()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_15]" ) --���^�m�J���ȱо�
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--�^��W�@��
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_6()
	 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_16]" ) --�����i����ä�о� 
      	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--�^��W�@��
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_7()
	 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_17]" ) --�i��C������ֿ�k 
   	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_3", 0)--�^��W�@��
end

------------------------------------------------------------------------------------------------------------
function LuaDan_111700_8()  --�m�J���Ȧ^��
	local Coloureggs = CheckFlag(OwnerID()  , 542427) --�T�{���ѬO�_�ѹL����  
	if Coloureggs == false then
		if EmptyPacketCount( OwnerID() ) >= 2 and QueuePacketCount( OwnerID() ) == 0 then
			if CountBodyItem( OwnerID() , 204215) >= 10 then  --�m�J > 10
       				 	 DelBodyItem( OwnerID() , 204215 , 10 ) --�R���m�J10��
       					 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_19]" ) --�I�����~���
		           			  GiveBodyItem( OwnerID() , 204218  , 3 )   -- �귽
                       				 GiveBodyItem( OwnerID() , 204216  , 1 ) --�󱼪��]�k�U
                         				 SetFlag( OwnerID()  , 542427 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
                         			 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--�^��W�@��
			else
				                SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]") --�A���ƶq�����I�����
                			                AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C	
			 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_111700_1", 0 ) --�^��W�@��    
		end
                else
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --�w�g�I���L���y���(���W��flag)
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--�^��W�@��                		
        	end 
end
-----------------------------------------------------------------------------------------------------------------
function LuaDan_111700_9()  --��ä���Ȧ^��
      	  local Coloureggs = CheckFlag(OwnerID()  , 542428) --�T�{���ѬO�_�ѹL����  
	if Coloureggs == false then
		if EmptyPacketCount( OwnerID() ) >= 2 and QueuePacketCount( OwnerID() ) == 0 then
			if CountBodyItem( OwnerID() , 204217) >= 1 then  
       			                 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_23]" ) --�I�����~���
		           		  GiveBodyItem( OwnerID() , 204218  , 3 )   -- �귽                     
				  DelBodyItem( OwnerID() , 204217 , 1 ) --�R���]�k�U
				local X = Rand( 100 )    
				if X >= 0 and X <=25  then  
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,503112,0 ,3600) --���ڹ� 
				elseif X >= 26 and X <= 50 then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,503113,0 ,3600) --���a��ڹ� 
				elseif X >= 51 and X <= 75 then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,502946,0 ,3600) --�ŧѧڹڹ� 
				elseif X >= 76  then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,502929,0 ,3600) --���Y��ڹ� 
				end		     					
                    			  SetFlag( OwnerID()  , 542428 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
                       			  AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--�^��W�@��
			else
				  SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]") --�A�ҫ������~�ƶq�����C 
              			  AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C	
			 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_111700_2", 0 ) --�^��W�@��    
		end
               else
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --�w�g�I���L���y���(���W��flag)
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--�^��W�@��                		
        	end 
end

------------------------------------------------------------------------------
function Lua_mika_spring_reward() --�I�����y����
	SetSpeakDetail(OwnerID(), "[SC_SPRINGFES_NEW02]" )-- �I�����~�p�U�G (��)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW03]", "Lua_mika_spring_reward01", 0) --�ڭn�I��[204094]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW04]", "Lua_mika_spring_reward02", 0) --�ڭn�I��[204379]
end
------------------------------------------------------------------------------
function Lua_mika_spring_reward01() --�ڭn�I��[204094] �Ŵ���§��
	local Owner = OwnerID()
	local Target = TargetID()
	local item = CountBodyItem( Owner , 204218 ) --�a�F����
	local random = rand(100)

	if item >= 12 then --�p�G�ƶq��
		SetSpeakDetail(Owner , "[SC_DAN_111700_31]" )--�ӴΤF�A�`���o��h���P�������귽�A���N���A�o�Ǽ��y�o�I
		GiveBodyItem( Owner , 204094  , 1 ) --�� �Ŵ���§��X1
		GiveBodyItem( Owner , 241481 , 15 ) --�����P������X15
		if random <20 then
			GiveBodyItem( Owner , 725449 , 1 )  --���|�귽�]
		end
		DelBodyItem( Owner , 204218 , 12 ) --�R �a�F����
	else --�p�G�ƶq����
		SetSpeakDetail(Owner, "[SC_DAN_111700_32]" )--�A�S�������ƶq�������A����I�����y�A�ЦA�[�[�o�a�C	
		AddSpeakOption( Owner, Target, "[SO_BACK]" , "Lua_mika_spring_reward", 0 ) --�^��W�@�� 
	end	
end
------------------------------------------------------------------------------
function Lua_mika_spring_reward02() --�ڭn�I��[204379] �m�J§��
	local Owner = OwnerID()
	local Target = TargetID()
	local item = CountBodyItem( Owner , 204218 ) --�a�F����

	if item >= 12 then --�p�G�ƶq��
		SetSpeakDetail(Owner, "[SC_DAN_111700_31]" )--�ӴΤF�A�`���o��h���P�������귽�A���N���A�o�Ǽ��y�o�I
		GiveBodyItem( Owner , 204379  , 1 ) --�� �m�J§��X1
		GiveBodyItem( Owner , 241481 , 15 ) --�����P������X15
		DelBodyItem( Owner , 204218 , 12 ) --�R �a�F����
	else --�p�G�ƶq����
		SetSpeakDetail( Owner , "[SC_DAN_111700_32]" )--�A�S�������ƶq�������A����I�����y�A�ЦA�[�[�o�a�C	
		AddSpeakOption( Owner , Target , "[SO_BACK]" , "Lua_mika_spring_reward", 0 ) --�^��W�@�� 
	end	
end


function Lua_mika_spring_flowertest()
	local X = Rand( 100 )    
	if X >= 0 and X <=25  then  
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,503112,0 ,3600) --���ڹ� 
	elseif X >= 26 and X <= 50 then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,503113,0 ,3600) --���a��ڹ� 
	elseif X >= 51 and X <= 75 then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,502946,0 ,3600) --�ŧѧڹڹ� 
	elseif X >= 76  then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,502929,0 ,3600) --���Y��ڹ� 
	end
end