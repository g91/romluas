
function LuaS_422073()  --���b��F���W
	if (CheckAcceptQuest(OwnerID(),422073)==true )and( CheckCompleteQuest( OwnerID() , 422073) == false) then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422073]","LuaS_422073_1",0) --�K�˽Чڨӧ�A�C                                                      
	end
End

function LuaS_422073_1()
	CloseSpeak( OwnerID())
	local CODA =LuaFunc_CreateObjByObj ( 112735,TargetID())
	WriteRoleValue(TargetID(), EM_RoleValue_PID, CODA )
	WriteRoleValue( CODA , EM_RoleValue_PID , OwnerID() )
	Say( CODA , "[SC_422073_1]" )	--�@��N�O�A��
	BeginPlot(TargetID(),"LuaS_422073_2",0)		
	Hide( TargetID())               		  --���å���NPC 
	BeginPlot(CODA, "LuaS_422073_3",0)
end


function LuaS_422073_2()
	sleep(150)
	Show(OwnerID() , 0)
end	

function LuaS_422073_3()
	Yell( OwnerID(),"[SC_422073_2]",2)	--��ڨӧa�A�Фp�ߦ樫�A�Ѳ��q�b�@���W�G�U�\�h�����C
	sleep(20)
	Yell( OwnerID(),"[SC_422073_3] ",2)	--�o�O���F�n������n���Y���K��L�رڡA�]�i��O�A���t�@��
	--LuaFunc_MoveToFlag(OwnerID() , 780353, 1 , 0 )	
	--MoveToFlagEnabled(OwnerID(),false  )
	sleep(30)
	Yell( OwnerID(),"[SC_422073_4] ",2)	
	sleep(30)
	Yell( OwnerID(),"[SC_422073_14] ",2)	
	sleep(30)
	BeginPlot(OwnerID(), "LuaS_422073_4",0)
 	DisableQuest(OwnerID() , true )	--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	
end

function LuaS_422073_4()
	BeginPlot(OwnerID(),"LuaS_422073_5",0)
	BeginPlot(OwnerID(),"LuaS_422073_7",0)
end

function LuaS_422073_5()											--47��
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	MoveToFlagEnabled(OwnerID(), false )
	for i =1,12 do
		LuaFunc_MoveToFlag( OwnerID(),780354, i,0)
		if	i==2 	then
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				sleep(20)
				Yell(OwnerID(), "[SC_422073_5]",2)	--��A�Q�B�_�ӤF�ڡ�Ѳ��q���o�ɭԴN�Τ��I
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(),"[SC_422073_6]",2)	--�ӧa�A�~��e�i�C
			
			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--�S�Q��...�A�|���o�ӳ����A���I�����A�M���@�U......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--�ڭ��~�򨫧a
			
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--�c...�A�٦n�ܡH
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--�N�֨�F�A�p�ߤ@�I�C
			
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				say(OwnerID(), "[SC_422073_15]")	--�D�`�n
			end
	
		end
		
		if	i==4 	then													--90��
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--��A�Q�B�_�ӤF�ڡ�Ѳ��q���o�ɭԴN�Τ��I
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(50)
				Yell(OwnerID(),"[SC_422073_6]",2)	--�ӧa�A�~��e�i�C
			
			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--�S�Q��...�A�|���o�ӳ����A���I�����A�M���@�U......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--�ڭ��~�򨫧a
	
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--�c...�٦n�ܡH
				sleep(60)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(50)
				Yell(OwnerID(),"[SC_422073_10]",2)	--�N�֨�F�A�p�ߤ@�I�C
		
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				say(OwnerID(), "[SC_422073_15]")	--�D�`�n
				sleep(10)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(50)
			end
		end

		if	i==6 	then													--126��
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--��A�Q�B�_�ӤF�ڡ�Ѳ��q���o�ɭԴN�Τ��I
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(30)
				Yell(OwnerID(),"[SC_422073_6]",2)	--�ӧa�A�~��e�i�C

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--�S�Q��...�A�|���o�ӳ����A���I�����A�M���@�U......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--�ڭ��~�򨫧a
		
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--�c...�٦n�ܡH
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--�N�֨�F�A�p�ߤ@�I�C
		
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--�D�`�n
			end
		end
		
		if	i==7	then	
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(50)
			end
	
		if	i==8	then													--162��
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--��A�Q�B�_�ӤF�ڡ�Ѳ��q���o�ɭԴN�Τ��I
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_6]",2)	--�ӧa�A�~��e�i�C

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--�S�Q��...�A�|���o�ӳ����A���I�����A�M���@�U......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--�ڭ��~�򨫧a
				
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--�c...�٦n�ܡH
				sleep(60)
				Yell(OwnerID(),"[SC_422073_10]",2)	--�N�֨�F�A�p�ߤ@�I�C
				
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--�D�`�n
			end
		end

		if	i==10 	then
			local R = Rand( 100 ) + 1
			if R >= 0 and R < 26 and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then	
				AddBuff(player , 503149 ,0 , 10)   
				SetFlag(player ,542414, 1 )
				Yell(OwnerID(), "[SC_422073_5]",2)	--��A�Q�B�_�ӤF�ڡ�Ѳ��q���o�ɭԴN�Τ��I
				sleep(20)
				CastSpell(OwnerID(),player,492904)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(30)
				Yell(OwnerID(), "[SC_422073_6]",2)	--�ӧa�A�~��e�i�C

			End
			if R >= 25 and R <51  and (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503151 ,0 , 10)
				SetFlag(player ,542415, 1 )
				Yell(OwnerID(), "[SC_422073_7]",2)	--�S�Q��...�A�|���o�ӳ����A���I�����A�M���@�U......
				sleep(20)
				CastSpell(OwnerID(), player,492905)	
				sleep(50)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(30)
				Yell(OwnerID() ,"[SC_422073_8]",2)	--�ڭ��~�򨫧a
			end
			if R >= 50 and R <76  and(CheckAcceptQuest(player ,422073)==true )and ( CheckCompleteQuest(player  , 422073) == false) then
				AddBuff(player , 503156,0 ,5)
				SetFlag(player ,542416, 1 )
				Yell(OwnerID(), "[SC_422073_9]",2)	--�c...�٦n�ܡH
				sleep(60)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(30)
				Yell(OwnerID(),"[SC_422073_10]",2)	--�N�֨�F�A�p�ߤ@�I�C
			
			end
			if R >= 75 and R <101  and (CheckAcceptQuest(player ,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) then
				sleep(10)
				Yell(OwnerID(), "[SC_422073_15]",2)	--�D�`�n
				sleep(10)
				Yell(OwnerID(), "[SC_422073_17]",2)	--�Ȯɥ𮧤@�U�C
				sleep(30)
			end
		end



		if	i==11 	then
					
				if (CheckAcceptQuest(player,422073)==true ) and ( CheckCompleteQuest(player , 422073) == false) and (CheckFlag( player,542414)==false) and (CheckFlag( player,542415)==false) and (CheckFlag( player,542416)==false) then	
	 			Yell(OwnerID(),"[SC_422073_11]",2)	--�F���_�I�A�O�ּƨS�I����󳴨����H���I
				SetFlag(player ,542513, 1 )		--���ȧ����X��
				GiveBodyItem(player ,200277, 1 )
				sleep(30)
					
				end
				Yell(OwnerID(),"[SC_422073_12]",2)	--�{�b�A�ڭ��`��Ө�Ѳ��q����A�N�b�e�褣���B���}�ޡA�O���A��§���A�H���C
				SetFlag(player ,542513, 1 )	--���ȧ����X��
				sleep(30)		
				end
		
		end
		if	i==12 	then
				sleep(10)			
			return
			end
		DelObj(OwnerID())
	
end	
		

function LuaS_422073_6()	--��b�򥻪k�N������@��
	CancelBuff( TargetID(), 503149 )
end


function LuaS_422073_9()	--��b�򥻪k�N������@��
	CancelBuff( TargetID(), 503151 )
end




function LuaS_422073_7()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while 	CheckID(player)	and
		GetDistance(player,OwnerID()) < 500	and
		ReadRoleValue( Player , EM_RoleValue_IsDead) == 0 do

		if	GetDistance(player,OwnerID()) > 350	then
			scriptmessage(player,player,0, "[SC_422073_13]",0)
			sleep(30)
		end
		sleep(20)
	end
	if	checkID(player)	then
		scriptmessage(player,player,0, "[SC_422073_16]",0)
		scriptmessage(player,player,2," [SC_422073_16]",0)

	end
	DelObj(OwnerID())
end


