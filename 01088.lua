function LuaYU_111800_0()
	DisableQuest( OwnerID() , false )
	CloseSpeak( OwnerID() )
	SetCursorType( OwnerID() , 1)
	SetPlot( OwnerID(),"touch","LuaYU_111800_1",80 )
	DisableQuest( OwnerID() , true )
end

function LuaYU_111800_1()  
	SetPlot( TargetID(),"touch","",0 )
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(),"LuaYU_111800_2",0) 
end

function LuaYU_111800_2()  
	CloseSpeak( TargetID() )
	DisableQuest( OwnerID() , true )

	local NumDay = ReadRoleValue(OwnerID() , EM_RoleValue_PID ) --�C�魫�m�X��
	local Title = NumDay - 69	--�ٸ������X��

	local Save01 =  CheckFlag( TargetID()  , Title )   --�ٸ�����
	local Save02 =  CheckFlag( TargetID()  , NumDay )   --�C�魫�m
	local Oil =  CountBodyItem( TargetID() , 203475 )  --�S�սުo���G
	local LD = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 


	if LD == 5168 and  Save01 == false and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...�ǳƦn��I�ڭn��ުo�F�I
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --���Y
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --�ˬd�ثe�O�_����buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --�z��Ӧn�F�A�ڶ}�l���ưʪ��Pı�I
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --���§A�������I�Ц��U�o��§���a�I
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --��...��F...�ڬO�b�ϧw�W�ݭ������O�d���...�I
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --�x�V§��
			SetFlag( TargetID()  , Title , 1 )  --���X��(�ٸ�����)
			SetFlag( TargetID()  , NumDay , 1 )  --���X��(�C�魫�m)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --�x...���ʧ@��I���O���n��ުo�F...�`�ں�i�F�@�U...�C
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end

	elseif LD == 5168 and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...�ǳƦn��I�ڭn��ުo�F�I
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --���Y
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --�ˬd�ثe�O�_����buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --�z��Ӧn�F�A�ڶ}�l���ưʪ��Pı�I
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --���§A�������I�Ц��U�o��§���a�I
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --��...��F...�ڬO�b�ϧw�W�ݭ������O�d���...�I
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --�x�V§��
			SetFlag( TargetID()  , NumDay , 1 )  --���X��(�C�魫�m)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --�x...���ʧ@��I���O���n��ުo�F...�`�ں�i�F�@�U...�C
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end


	elseif Save01 == false and Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --�A�O�����Ũ����ܡH
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --�ڤ��O�ڤ��O�A�A�{���H�F�I�ڥu�Oı�o�ϧw�W�ܷŷx�A�ӳo�̬ݭ����Ӥw...�C
		PlayMotion( OwnerID() , 122)    
		sleep(40)
		Say( TargetID() , GetString("SC_111584_YU_18") )  --�o�˧r...��[111584]�n�ڥh�Ϫ����ӳQ�d�b�ϧw�W�������Ũ����b���̩O...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_19") .. "|r" )  --�ڡI�O�ڬO�ڴN�O�ڡI�֨ӱϧڡ�I
		PlayMotion( OwnerID(), 120)    
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_20") )  --...�A��褣�O���A���O...
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...�ǳƦn��I�ڭn��ުo�F�I
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --���Y
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --�ˬd�ثe�O�_����buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --�z��Ӧn�F�A�ڶ}�l���ưʪ��Pı�I
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --���§A�������I�Ц��U�o��§���a�I
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --��...��F...�ڬO�b�ϧw�W�ݭ������O�d���...�I
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --�x�V§��
			SetFlag( TargetID()  , Title , 1 )  --���X��(�ٸ�����)
			SetFlag( TargetID()  , NumDay , 1 )  --���X��(�C�魫�m)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --�x...���ʧ@��I���O���n��ުo�F...�`�ں�i�F�@�U...�C
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end
	
	elseif Save02 == false and Oil > 0 and EmptyPacketCount( TargetID() ) >= 1  and QueuePacketCount( TargetID() ) == 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --�A�O�����Ũ����ܡH
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --�ڤ��O�ڤ��O�A�A�{���H�F�I�ڥu�Oı�o�ϧw�W�ܷŷx�A�ӳo�̬ݭ����Ӥw...�C
		PlayMotion( OwnerID() , 122)    
		sleep(40)
		Say( TargetID() , GetString("SC_111584_YU_18") )  --�o�˧r...��[111584]�n�ڥh�Ϫ����ӳQ�d�b�ϧw�W�������Ũ����b���̩O...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_19") .. "|r" )  --�ڡI�O�ڬO�ڴN�O�ڡI�֨ӱϧڡ�I
		PlayMotion( OwnerID(), 120)    
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_20") )  --...�A��褣�O���A���O...
		sleep(20)
		Say( TargetID() , GetString("SC_111584_YU_26") )  --...�ǳƦn��I�ڭn��ުo�F�I
		sleep(20)		
		CastSpell( TargetID(), OwnerID(), 492164) --���Y
		sleep(50)
		if CheckBuff( OwnerID() , 502396 ) == true then                                                                       --�ˬd�ثe�O�_����buff
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_21") .. "|r" )  --�z��Ӧn�F�A�ڶ}�l���ưʪ��Pı�I
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			PlayMotion( OwnerID(), 121) 
			sleep(10)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_27") .. "|r" )  --���§A�������I�Ц��U�o��§���a�I
			sleep(20)
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_28") .. "|r" )  --��...��F...�ڬO�b�ϧw�W�ݭ������O�d���...�I
			sleep(20)
			DelBodyItem( TargetID() , 203475 , 1 )
			GiveBodyItem( TargetID() , 202839  , 1 )   --�x�V§��
			SetFlag( TargetID()  , NumDay , 1 )  --���X��(�C�魫�m)	
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )   
			sleep(10)		
			Hide(OwnerID())
			sleep(300)
			Show(OwnerID() , 0 )					
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 
		else
			Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_29") .. "|r" )  --�x...���ʧ@��I���O���n��ުo�F...�`�ں�i�F�@�U...�C
			sleep(30)			
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 5168 )   
			BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

		end

	elseif Save02 == false and Oil > 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --�A�O�����Ũ����ܡH
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --�ڤ��O�ڤ��O�A�A�{���H�F�I�ڥu�Oı�o�ϧw�W�ܷŷx�A�ӳo�̬ݭ����Ӥw...�C
		PlayMotion( OwnerID(), 122)    
		sleep(40)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_22") .. "|r" )  --�ݧA�]�]�n�������F�A�I�����ٯ�W�ӫγ��r...�C
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 

	elseif Save02 == true and Oil > 0 then
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_30") )  --�A...�S�d��F�r...
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_24") .. "|r" )  --������...�O�A�r...�ڭ��Q����~�M��U�ӦA�ոլݡA�S�Q���٬O�d��F�I�������I����A�·ЧA�F�աI�ڦۤv�Q��k�I
		PlayMotion( OwnerID(), 121) 
		sleep(10)
		PlayMotion( OwnerID(), 121) 
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 


	else
		CloseSpeak( TargetID() )
		DisableQuest( OwnerID() , true )
		 Say( TargetID() , GetString("SC_111584_YU_16") )  --�A�O�����Ũ����ܡH
		sleep(20)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_17") .. "|r" )  --�ڤ��O�ڤ��O�A�A�{���H�F�I�ڥu�Oı�o�ϧw�W�ܷŷx�A�ӳo�̬ݭ����Ӥw...�C
		PlayMotion( OwnerID(), 122)    
		sleep(30)
		Say( OwnerID() ,  "|cffffff20" .. GetString("SC_111584_YU_23") .. "|r" )  --�p�G�A��K�������ڨ�Z��R���������s��������y�d�i�D�L�ڦb�ϧw�W���L�Ӳ�Ѭݭ���...�ХL���I�ӡI
		sleep(20)
		BeginPlot( OwnerID(),"LuaYU_111800_0",0) 	

	end	

end