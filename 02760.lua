function sean_121398_speak() --��ܼ@��
	local Owner = OwnerID()
	local Target = TargetID()
	local Player = SearchRangePlayer( Owner , 10)
	local secondseat = Lua_Mounts_Copilot( Owner )--���L�M�����H�y�M
	for i = 0 , table.getn( Player) do
		DW_CancelTypeBuff(68,Player[i])--�M�����M�ɡA�I���U��	
	end
--	if secondseat == false then --���b��y
--		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GAME_WARNING]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
--	else
	
		if CheckFlag(Owner,547083)==true and CheckBuff( Owner , 623495 )==true then
			SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")--���ʵ���
			AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 ) --������y�I

		elseif CheckFlag(Owner,547083)==true then
			SetSpeakDetail( Owner , "[SC_2012_GAME_NPC09]")--�ˬd���L�D�^�O�L

		else
			if CheckFlag(Owner,547027)==true then--�ˬd���L������y
				SetSpeakDetail( Owner , "[SC_2012_GAME_NPC06]")

			else 
				if CheckFlag(Owner,547026)==true then--���ˬd���a�O�_���L
					SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")--���ʵ���
					AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 ) --������y�I

				else 
					SetSpeakDetail( Owner , "[SC_2012_GAME_NPC01]") --���r�r�I�@�~�@�ת��n�ʸ`�S��F�C
					if CheckBuff(Owner,623484) ==true then
						SetSpeakDetail( Owner  ,"[SC_2012_GAME_NPC04]"  )--���a���ܨ�BUFF�U���

					elseif CheckFlag(Owner,547084)==true then--�ˬd���L���u�L
						SetSpeakDetail( Owner , "[SC_2012_GAME_NPC05]")
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT04]" ,  "sean_121398_getgift",0 )
						SetFlag(Owner,547026,1)

					else	
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT03]" ,  "sean_121398_speak2",0 )--ť�W�h
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT01]" ,  "sean_121398_start",0 ) --�ѥ[
						AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT02]" ,  "sean_121398_speak3",0 ) --���ѥ[
					end
				end
			end
		end
--	end
end


function sean_121398_speak2() --�W�h����
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC02]") --�W�h����
	AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT05]" ,  "sean_121398_start",0 )--�n�I���F�I
	AddSpeakOption( Owner , Owner ,"[SC_2012_GAME_OPT02]" ,  "sean_121398_speak3",0 ) --�ڤ@��X�Q�U�W�U�A�S�Ųz�A
end




function sean_121398_speak3() --���ѥ[����
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC03]") --�n�a�I���ڥt�~��H�n�F�C
end




function sean_121398_start() --���ʶ}�l�A�������a3����������BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	local secondseat = Lua_Mounts_Copilot( Owner )--���L�M�����H�y�M
	DW_CancelTypeBuff(68, Owner)
	if secondseat == false then --���b��y
		ScriptMessage( Owner , Owner , 1 , "[SC_2012_GAME_WARNING]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
	else
		CloseSpeak( Owner)
		setflag(Owner,547084,1)--�������u�P�w�X��
		SysCastSpellLv(Owner,Target,850406,0)  
	end
		DesignLog( Owner , 121398 , "Lv = "..Lv.." SubLv = "..SubLv )--�^�Ǭ��ʰѻP��
end




function sean_121398_frightenNPC()
	local Owner = OwnerID()
	local Target = TargetID()
	local CheckTable = {[110612]=1;[110613]=1;[110614]=1;[110619]=1;[110621]=1;
			       [110622]=1;[110623]=1;[110624]=1;[110629]=1;[110630]=1;
			       [110632]=1;[110637]=1;[110638]=1;[121415]=1;[121432]=1;--�p��1

			       [110021]=2;[110022]=2;[110386]=2;[110387]=2;[110389]=2;
			       [110390]=2;[110406]=2;[110407]=2;[110409]=2;[110412]=2;
			       [110536]=2;[110541]=2;[110565]=2;[110566]=2;[110567]=2;
			       [110568]=2;[110569]=2;[110573]=2;[110576]=2;[110596]=2;
			       [110609]=2;[110610]=2;[110611]=2;[110627]=2;[110628]=2;
			       [110633]=2;[110634]=2;[110635]=2;[110636]=2;[110639]=2;
			       [110642]=2;[110643]=2;[110651]=2;[110728]=2;[110752]=2;
			       [110993]=2;[111528]=2;[111621]=2;[111629]=2;[111699]=2;
			       [111745]=2;[113089]=2;[113139]=2;[113140]=2;[113351]=2;
			       [113354]=2;[116843]=2;[116847]=2;[119135]=2;[120342]=2;
			       [120344]=2;--�j�H2

			       [100938]=3;[100946]=3;[100947]=3;[110182]=3;[110784]=3;
			       [117211]=3;[117310]=3;[118128]=3;[118132]=3; --ĵ��3

			       [100135]=4;[110170]=4;[110177]=4;[110504]=4;[110505]=4;
			       [110507]=4;[110509]=4;[110510]=4;[110511]=4;[110512]=4;
		  	       [110513]=4;[110515]=4;[110516]=4;[110518]=4;[110519]=4;
			       [110520]=4;[111583]=4;[110585]=4;[110631]=4;[110688]=4;
			       [110774]=4;[110775]=4;[110776]=4;[110778]=4;[111432]=4;
			       [111606]=4;[113199]=4;[113339]=4;[113350]=4;[113352]=4;
			       [121398]=4;}--�S��4 






	local BuffID = 623486
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	local Num = ReadRoleValue( Target, EM_RoleValue_OrgID )
	local R=Rand(10)
	local A=Rand(9)

	if ReadRoleValue(TargetID(), EM_RoleValue_IsPlayer ) == 1 then--�P�_�~���O�_�����a
		ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_SPECIAL2]",0)
	else
		if CheckTable[Num] == 1 then --�~�p�Ī����p
			if BuffLv<4 then
				if A>=6 then 
					say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

				else 
					say(Target,"[SC_2012_GAME_NPCSAY2]")--�~�H���\,NPC����
				end

				addbuff(Owner,623486,0,25)--�~�H���\�A�֦�25��buff
				addbuff(Target,623487,0,25)--�~�H���\�ANPC�֦�35��buff	

			else 
				ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_BUFFLV5]",0)--�p�Ī��y�s�n���G�Ӥ֤F...
			
			end	
		end

		if CheckTable[Num] == 2 then --�~�j�H�����p
			if BuffLv==-1 then--�LBuff�����p�h�~�j�H
				if R<9 then--�~����
					say(Target,"[SC_2012_GAME_NPCHIT]")
					addbuff(Owner,507264,0,3)
					addbuff(Owner,623493,0,3)--�B�@-����3��
					addbuff(Target,623487,0,20)
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end
					addbuff(Owner,623486,4,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,20)--�~�H�ANPC�֦�50��buff
				end
				
			elseif BuffLv<=2 then--Buff�p��3�h�����p�h�~�j�H
				if R<4 then--�~����
					CancelBuff(Owner,623486)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
					addbuff(Target,623487,0,20)
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end
					addbuff(Owner,623486,4,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,20)--�~�H�ANPC�֦�50��buff
				end

			elseif BuffLv<4 then--Buff�p��5�h�����p�h�~�j�H
				if R<3 then--�~����
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-3,25)
					addbuff(Target,623487,0,20)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
						end
					addbuff(Owner,623486,4,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,20)--�~�H�ANPC�֦�50��buff
				end
			elseif BuffLv>=4 then--Buff�j��5�h�����p�h�~�j�H
				if R<2 then--�~����
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-3,25)
					addbuff(Target,623487,0,20)
					say(Target,"[SC_2012_GAME_NPCHIT2]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end

					addbuff(Owner,623486,4,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,20)--�~�H�ANPC�֦�50��buff
				end
			end
		end

		if CheckTable[Num] == 3 then --�~�u�ê����p
			if BuffLv==-1 then--�LBuff�h�~�u��
				if R<9 then
					say(Target,"[SC_2012_GAME_NPCHIT3]")
					addbuff(Owner,623494,0,5)--�B�@-�w��5��
					addbuff(Target,623487,0,20)--�~�H�ANPC�֦�50��buff
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end

					addbuff(Owner,623486,9,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,15)--�~�H�ANPC�֦�60��buff
				end
			elseif BuffLv<=6 then--Buff�p��7�h�����p�h�~�u��
				if R<7 then--�~����
					CancelBuff(Owner,623486)
					addbuff(Target,623487,0,15)
					addbuff(Owner,623494,0,3)--�B�@-�w��3��
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end

					addbuff(Owner,623486,9,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,15)--�~�H�ANPC�֦�60��buff
				end
			elseif BuffLv<69 then--Buff�p��70�h�����p�h�~�u��
				if R<6 then--�~����
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-7,25)--�~���ѡAbuff-7�h
					addbuff(Owner,623494,0,3)--�B�@-�w��3��
					addbuff(Target,623487,0,15)
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY3]")--�~�H���\,NPC����
					end

					addbuff(Owner,623486,9,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,15)--�~�H�ANPC�֦�60��buff
				end

			elseif BuffLv>=69 then--Buff�j��70�h�����p�h�~�u��
				if R<5 then--�~����
					CancelBuff(Owner,623486)
					addbuff(Owner,623486,BuffLv-7,40)
					addbuff(Owner,623494,0,3)--�B�@-�w��3��
					addbuff(Target,623487,0,15)
					say(Target,"[SC_2012_GAME_NPCHIT4]")
				else
					if A>=5 then 
						say(Target,"[SC_2012_GAME_NPCSAY]")--�~�H���\,NPC����

					else 
						say(Target,"[SC_2012_GAME_NPCSAY4]")--�~�H���\,NPC����
					end

					addbuff(Owner,623486,9,25)--�~�H���\�A�֦�25��buff
					addbuff(Target,623487,0,15)--�~�H�ANPC�֦�60��buff
				end
			end
		end

		if CheckTable[Num] == 4 then --�~�S���󪺪��p
			ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_SPECIAL]",0)--�~�L�S����
		end
	end
end





function sean_121398_checkBuff()--�t���ˬdNPC���W�O�_���Q�~��buff
	local Owner = OwnerID()
	local Target = TargetID()
	local R=Rand(10)

	if CheckBuff(Target,623487)==true then  --�t���ˬdNPC�o�{��BUFF	
		ScriptMessage(Owner,Owner,1,"[SC_2012_GAME_BUFFWARNING]",0)--(���r)�i�D���a����u�ɶ����ƹ�ؼЬI��
		return false--�t���ˬdNPC�S�o�{BUFF

	else 
		return true--���a�i�H��NPC�I��
	end
end





function sean_121398_BuffValue()--�p�����
	local Owner = OwnerID()
	local BuffID = 623486
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)

	if BuffLv ==-1 then
		ScriptMessage(Owner,Owner,3,"[SC_2012_GAME_BUFFSCORE]",0) 
	else
		ScriptMessage(Owner,Owner,3,"[SC_2012_GAME_BUFFSCORE2]",0) 
		CancelBuff( Owner , 623486 )
		addbuff(Owner,623495,BuffLv,600)
	end

	SetFlag(Owner,547026,1)
	setflag(Owner,547084,0)
end




function sean_121398_getgift()--�������a§��
	local Owner=OwnerID()
	local Target=TargetID()
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )

	local BuffID = 623495
	local Bufflv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	
	SetSpeakDetail( Owner , "[SC_2012_GAME_NPC07]")
	if Score==-1 or checkflag(Owner,547084)==true then
		GiveBodyItem(  Owner, 724059 , 1 )	
		SetSpeakDetail( Owner , "[SC_2012_GAME_NPC08]")--�w����
	elseif Score<=29 then
		GiveBodyItem(Owner,209433,1)--�����y1
	elseif Score<=59 then
		GiveBodyItem(Owner,209433,2)--�����y2
	elseif Score<=99 then
		GiveBodyItem(Owner,209433,3)--�����y3
		GiveBodyItem(Owner,240525,3)
	else 
		GiveBodyItem(Owner,209433,3)--�����y4
		GiveBodyItem(Owner,240742,1)
	end

	setflag(Owner,547027,1)
	
	CancelBuff( Owner , 623495 )	
	Lua_Festival_10_All(Owner) 
	DesignLog( Owner , 1213981 , "Lv = "..Lv.." SubLv = "..SubLv )--�^�Ǭ��ʰѻP��
end




function sean_121398_Range()--���ʽd��
	local Target = OwnerID()--���a
	local Owner = TargetID()--npc
	BeginPlot( Target, "LuaN_miyon_action02", -1 )--��npc�Y�W�����ʹϥ�
	local Players = { }--�ѻP���ʪ����a�C��

--	table.insert(Players, Owner)
	--say(Target, "start")
	while true do
		Sleep(1)
		local SearchTable = SearchRangePlayer( Target,  50 ) --NPC���y����50�X�������a
		--say(Owner, "1")
		for n= 0, table.getn(SearchTable) do
			--say(Owner, "2")
			if CheckBuff(SearchTable[n],623484 )==true then --�p�G���a������Buff,�h�⪱�a��J���a�C��
				if CheckFlag(SearchTable[n],547081) ==false then--�ˬd�O�_�����n���~
					--say(Owner, "3")
					setflag(SearchTable[n],547081,1)--�����n���~
					table.insert(Players, SearchTable[n])
				end
		--	else
		--		table.remove(SearchTable,n)
		--		setflag(Owner,547081,0)
			end
		end
		if table.getn(Players)>0 then
			local NewTable= {}
			for i= 1, table.getn(Players) do --���y���a�PNPC�������Z��,�W�X�d��|ĵ�i
				--say ( Target, "i="..i)
				local distance = GetDistance( Target, Players[i] )
				--say ( Target, "5")
				
					if CheckBuff( Players[i] , 623484) == true and CheckFlag( Players[i] , 547027 ) == false then
						if distance > 1015  then
							--say(Players[i],i)
							ScriptMessage(Players[i],Players[i],1,"[SC_2012_GAME_BUFFWARNING3]",0)
							CancelBuff( Players[i] , 623484 )--���a�Q�������	
							CancelBuff( Players[i] , 623486 )--���a�y�s�n�Q����
						--	CancelBuff( Players[i] , 623495 )--���a�`���Q����
							setflag(Players[i],547081,0)
							--say(Players[i],"test")
							setflag(Players[i],547083,1)
						else
							table.insert(NewTable, Players[i])
							if distance >= 965 and distance < 1015 then--���a�PNPC�Z��880�X,ĵ�i���a
								--say( Owner,"6")
								ScriptMessage(Players[i],Players[i],1,"[SC_2012_GAME_BUFFWARNING2]",0)--ĵ�i���a���֦^�h�_�h�|�������	
							end
						end
					end
				
			end
			Players = NewTable
		end	
	end
end

-----------------------------------------------------�H�U�����ձM�Ϋ��O-----------------------------------------------------

function sean_replay()--�����@��
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	CancelBuff( Owner , 623486 )
	CancelBuff( Owner , 623495 )
	setflag(Owner,547026,0)
	setflag(Owner,547027,0)
	setflag(Owner,547081,0)
	setflag(Owner,547083,0)
	setflag(Owner,547084,0)
end

function sean_buff0()----�S������
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547026,1)
	setflag(Owner,547081,1)
end

function sean_buff(LV)----���ʤ��ơA�бN�һݴ���BUFF���Ŷ�JLV����m
	local Owner=OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547026,1)
	setflag(Owner,547081,1)
	addbuff(Owner,623495,LV,600)
end