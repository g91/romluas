function LuaYU_111446_0()

	LoadQuestOption( OwnerID() )

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_16")  ) --�ȮM��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_17")  , "LuaYU_111446_1", 0 ) --����y�^�m�^�X����z
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_34")  , "LuaYU_111446_15", 0 ) --�S��}���Ť夶��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_18")  , "LuaYU_111446_2", 0 ) -- �^�m�Ť�H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_19")  , "LuaYU_111446_13", 0 ) --�I�����ŲŤ�Ų�w���b





end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_1()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_20")  ) --����y�^�m�^�X����z
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��



end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_2()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_21")  ) --�ȮM��2
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_22")  , "LuaYU_111446_3", 0 ) --�^�m�ȩ_�H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_23")  , "LuaYU_111446_4", 0 ) --�^�m�Q��H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_24")  , "LuaYU_111446_5", 0 ) --�^�m�P�e�H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_25")  , "LuaYU_111446_6", 0 ) --�^�m�Ϲ��H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_26")  , "LuaYU_111446_7", 0 ) --�^�m�����H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_3()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_27")  ) --�T�w�^�m�ȩ_�H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_8", 0 ) --�T�w

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_4()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_28")  ) --�T�w�^�m�Q��H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_9", 0 ) --�T�w

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_5()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_29")  ) --�T�w�^�m�P�e�H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_10", 0 ) --�T�w

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_6()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_30")  ) --�T�w�^�m�Ϲ��H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_11", 0 ) --�T�w

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_7()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_31")  ) --�T�w�^�m�����H��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_12", 0 ) --�T�w

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_8()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203268 ) --�ȩ_

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then	
			sleep(10)

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724140  , 1 )  --�@��
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724141  , 1 )  ---�G��	
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724142  , 1 )  ---�T��	
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --�ڶȥN���̤����P�§A���^�m�A�o��§���N��ڭ̪��@�I�߷N�A���§A�I
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --�S�^�m�~
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

		end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_9()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203269 ) --�Q��

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then	
		

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724143  , 1 )  --�@��
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724144  , 1 )  ---�G��	
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724145  , 1 )  ---�T��	
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --�ڶȥN���̤����P�§A���^�m�A�o��§���N��ڭ̪��@�I�߷N�A���§A�I
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			end

		else

			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --�S�^�m�~
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
		end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_10()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203270 ) --�P�e

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then
			

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724146  , 1 )  --�@��
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724147  , 1 )  ---�G��	
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724148  , 1 )  ---�T��	
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --�ڶȥN���̤����P�§A���^�m�A�o��§���N��ڭ̪��@�I�߷N�A���§A�I
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			else

				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --�S�^�m�~
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
		end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_11()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203271 ) --�Ϲ�

		if  Rune >= 1 then	

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then			
	

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724149  , 1 )  --�@��
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724150  , 1 )  ---�G��	
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724151  , 1 )  ---�T��	
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --�ڶȥN���̤����P�§A���^�m�A�o��§���N��ڭ̪��@�I�߷N�A���§A�I
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			else

				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --�S�^�m�~
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
		end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_12()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203272 ) --����

		if  Rune >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then	
			

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724152  , 1 )  --�@��
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724153  , 1 )  ---�G��	
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724154  , 1 )  ---�T��	
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )	
				end

				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --�ڶȥN���̤����P�§A���^�m�A�o��§���N��ڭ̪��@�I�߷N�A���§A�I
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��
			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --�S�^�m�~
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

		end


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_13()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_33")  ) --<CM>[203267]</CM>�㦳�j�j���]�k��O�A�i�H��[��Ǫ�ų�O�������Ť�����A����ų�O�}���Ť媺���v�A�]���һݭn�����ƫD�`�öQ�A�@��u�ѽ�̤������Ť�Ų�w�v�ϥΡA���O�p�G�A�i�H����<CP>6�Ӥ��P�������Ͳ��Ť�U100��</CP>�A���@�N���ѧI��<CM>�@�~[203267]</CM>���z�I

		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_38]" , "LuaYU_111446_14_1", 0 ) --����O�Ͳ��Ť�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_39]" , "LuaYU_111446_14_2", 0 ) --�I��[203267]
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_14_1()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_40")  ) --�Ͳ��Ť�]�t<CP>[200850]</CP>�B<CP>[200851]</CP>�B<CP>[200852]</CP>�B<CP>[200853]</CP>�B<CP>[200854]</CP>�B<CP>[200855]</CP>�@6�ءA�i�z�L���ѥ@�ɦU�a���]�����o�A�O�q�ƥͲ����ʤ��i�ίʪ����~�C

		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_39]" , "LuaYU_111446_14_2", 0 ) --�I��[203267]

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_14_2()

	local R1 =  CountBodyItem( OwnerID() , 200850 ) --�s��
	local R2 =  CountBodyItem( OwnerID() , 200851 ) --�N�o
	local R3 =  CountBodyItem( OwnerID() , 200852 ) --����
	local R4 =  CountBodyItem( OwnerID() , 200853 ) --����
	local R5 =  CountBodyItem( OwnerID() , 200854 ) --�¤�
	local R6 =  CountBodyItem( OwnerID() , 200855 ) --�V�X

	if R1 >= 100 and R2 >= 100 and R3 >= 100 and R4 >= 100 and R5 >= 100 and R6 >= 100 then


		DelBodyItem( OwnerID() , 200850 , 100 )
		DelBodyItem( OwnerID() , 200851 , 100 )
		DelBodyItem( OwnerID() , 200852 , 100 )
		DelBodyItem( OwnerID() , 200853 , 100 )
		DelBodyItem( OwnerID() , 200854 , 100 )
		DelBodyItem( OwnerID() , 200855 , 100 )

		GiveBodyItem( OwnerID() , 203267  , 1 ) --���ŲŤ�Ų�w
		
		SetSpeakDetail( OwnerID(), "[SC_101222_YU_42]"   )--�o�O�z�ݭn��<CM>[203267]</CM>�A���z�n�B�I

	else

		SetSpeakDetail( OwnerID(), "[SC_101222_YU_41]"   )--��p�A�z�S��������<CN>�Ͳ��Ť�</CN>��I<CP>[200850]</CP>�B<CP>[200851]</CP>�B<CP>[200852]</CP>�B<CP>[200853]</CP>�B<CP>[200854]</CP>�B<CP>[200855]</CP>..��6�بC�س��ݭn<CS>100��</CS>��I
	end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_15()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_35") .. GetString("SC_101222_YU_37")  ) --�S��}���Ť夶��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --�^��W�@��

end