function Lua_bk_fd_206138()------------------------�ˬd�ؼ�  
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113648 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102558_2]" , 1 )		----- �p�u���󵲬ɨϥ�
		return false
	end	
end
function Lua_bk_fd01_206138()		----------------------�ˬd
	AddBuff(TargetID() , 504848,1,-1 )----------------------------------�����~�W�@�Ӫk�N
end

function Lua_bk_fd_ma_102737()------------------------------------------------------------����ؼХh���ͤ@�Ӫ���
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local magic =LuaFunc_CreateObjByObj (102737 , TargetID())
	AddToPartition( magic ,RoomID )	
	SysCastSpellLv(TargetID(),magic,493865,1)
	SetAttack( magic , TargetID())
	SetModeEx( magic , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( magic , EM_SetModeType_Strikback, true )--����
	SetModeEx( magic , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( magic , EM_SetModeType_Mark, false )--�аO
	SetModeEx( magic , EM_SetModeType_Move, true )--����
	SetModeEx( magic , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( magic , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( magic , EM_SetModeType_HideName, false )--�W��
	SetModeEx( magic , EM_SetModeType_Show, true )--�W��
	DelFromPartition( magic )
	AddToPartition( magic ,RoomID )	
	AddBuff(magic, 505056 , 1 , -1 )
	BeginPlot(magic,"Lua_bk_fd_04_102737",10)
end
function Lua_bk_fd_ca_113647()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	while 1 do 
		local PPL=SearchRangePlayer ( OwnerID() , 45 )
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		if x<=6 then 
			for i=0,x,1 do 
				AddBuff( PPL[i] , 504998 , 1 , 2)
			end
		end
		if x>6 then
			for i=0,5,1 do 
				AddBuff( PPL[i] , 504998 , 1 , 2)
			end
		end
		sleep(10)
	end
end
function Lua_bk_df_m2count_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local comob
	local gg=ReadRoleValue(st,EM_RoleValue_Register4)
	local m2count=OwnerID()
	local alltime =0
	local time1=0
	local mob= 0 
	while 1 do 
		sleep(10)
		comob=ReadRoleValue(boss,EM_RoleValue_Register8)
		if comob ==1 then 
			alltime=alltime+30
			comob=0
			WriteRoleValue(boss,EM_RoleValue_Register8,comob)
		end
		alltime =alltime +1
	------	DeBugMsg(0,RoomID,"alltime "..alltime)
		if alltime ==  60 or alltime ==140 or alltime ==220 or alltime ==300 or alltime ==380 or alltime ==460 or alltime ==540 then ---------------�Ĥ@���q�]1����
			mob=1
			WriteRoleValue(boss,EM_RoleValue_Register2,mob)
		end
		if alltime == 100 or alltime ==180 or alltime ==260 or alltime ==340  or alltime ==420  or alltime ==500 or alltime ==580 then
			mob=2
			WriteRoleValue(boss,EM_RoleValue_Register2,mob)
		end
		if alltime == 620 then 
			mob=3
			WriteRoleValue(boss,EM_RoleValue_Register2,mob)
		end
		if  gg==1 then 
		sleep(30)
		DelObj(m2count)
		end 
	end
end
function Lua_bk_ggboss_102802()-----------------�C60��ϥΤ@���h���a�j��
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while 1 do 
		sleep(60)
		CastSpellLV( OwnerID() , OwnerID() , 494468 , 1 )
	end
end
function Lua_bk_fd_fdoor_102736()--------------------------------------�·t�������@��-----�X3�ؤp�L
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	local fdoor=OwnerID()
	local time1=0
	local time2=0 ---------------------------------------����}�����u��
	local ss={}
	local sf1=0
	local sf2=0
	local sf3=0
	local sf4=0
	local gg=0
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102670_07]" , 1 )
	local door0=CreateObjByFlag(102736,780470,16,1)-------�إ�2�Ӫ�   780470   1 �M2
	SetModeEx( door0 , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( door0 , EM_SetModeType_Mark, false)
	SetModeEx( door0 , EM_SetModeType_HideName, false)
	SetModeEx( door0 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( door0 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( door0 , EM_SetModeType_Obstruct, true)   -----����
	SetModeEx( door0 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( door0 , EM_SetModeType_Move, false) ---����	
	SetModeEx( door0 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( door0 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( door0 , EM_SetModeType_Searchenemy, false)
	SetModeEx( door0 , EM_SetModeType_Show, true)
	AddToPartition( door0 , RoomID )
	AddBuff(door0, 505056 , 1 , -1 )	
	while 1 do
	local BossTarget=ReadRoleValue(boss,EM_RoleValue_Register5)
	gg = ReadRoleValue(st,EM_RoleValue_Register4)
	sleep(10)
		time1=time1+1
		time2=time2+1
		if gg==1 then 
			DelObj(fdoor)
			DelObj(door0)
		end
		if time1==10 then
			for i=16 ,16 ,1 do 
				ss[i] = CreateObjByFlag(102777,780470,i,1)-----------------------�b�·t�����ͥX�p�L
				AddToPartition( ss[i] , RoomID )
				SetAttack( ss[i] , BossTarget)
				BeginPlot( ss[i] ,"Lua_bk_fd_sm_102760",50)--------�p�����}�԰��N����
			end
			sf1 = CreateObjByFlag(102776,780470,16,1)-----------------------�b�·t�����ͥX�p�L
			SetModeEx( sf1 , EM_SetModeType_Searchenemy, false)
			SetModeEx( sf1 , EM_SetModeType_Fight, false)
			SetModeEx( sf1 , EM_SetModeType_Move, false)
			AddToPartition( sf1 , RoomID )
			WriteRoleValue(sf1,EM_RoleValue_PID,fdoor)
			BeginPlot( sf1 ,"Lua_bk_sfi1_102670",10)--------���L�h�״_	
		end
		if time1==30 then 
			for i=16 ,16 ,1 do 
			ss[i] = CreateObjByFlag(102777,780470,i,1)-----------------------�b�·t�����ͥX�p�L
			AddToPartition( ss[i] , RoomID )
			SetAttack( ss[i] , BossTarget)
			BeginPlot( ss[i] ,"Lua_bk_fd_sm_102760",50)--------�p�����}�԰��N����
			end
			sf4 = CreateObjByFlag(102776,780470,16,1)-----------------------�b�·t�����ͥX�p�L
			SetModeEx( sf4 , EM_SetModeType_Searchenemy, false)
			SetModeEx( sf4 , EM_SetModeType_Fight, false)
			SetModeEx( sf4 , EM_SetModeType_Move, false)
			AddToPartition( sf4 , RoomID )
			WriteRoleValue(sf4,EM_RoleValue_PID,fdoor)
			BeginPlot( sf4 ,"Lua_bk_sfi4_102670",10)--------���L�h�״_
			break
		end
	end
	sleep(200)
	DelObj(door0)
	DelObj(fdoor)
end
function Lua_bk_fd_fdoor1_102736()--------------------------------------�·t�������@��-----�X3�ؤp�L
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	local fdoor=OwnerID()
	local time1=0
	local time2=0 ---------------------------------------����}�����u��
	local ss={}
	local sf1=0
	local sf2=0
	local sf3=0
	local sf4=0
	local gg=0
	local door1=CreateObjByFlag(102736,780470,17,1)-------�إ�2�Ӫ�   780470   1 �M2
	SetModeEx( door1 , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( door1 , EM_SetModeType_Mark, false)
	SetModeEx( door1 , EM_SetModeType_HideName, false)
	SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( door1 , EM_SetModeType_Obstruct, true)   -----����
	SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
	SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
	SetModeEx( door1 , EM_SetModeType_Show, true)
	AddToPartition( door1 , RoomID )
	AddBuff(door1, 505056 , 1 , -1 )	
	while 1 do
	local BossTarget=ReadRoleValue(boss,EM_RoleValue_Register5)
	gg =ReadRoleValue(st,EM_RoleValue_Register4)
	sleep(10)
		time1=time1+1
		time2=time2+1
		if gg==1 then 
			DelObj(fdoor)
			DelObj(door1)
		end
		if time1==10 then
			ScriptMessage( boss , -1 , 2 , "[SC_102670_07]" , 1 )
			for i=17 ,17 ,1 do 
				ss[i] = CreateObjByFlag(102777,780470,i,1)-----------------------�b�·t�����ͥX�p�L
				AddToPartition( ss[i] , RoomID )
				SetAttack( ss[i] , BossTarget)
				BeginPlot( ss[i] ,"Lua_bk_fd_sm_102760",50)--------�p�����}�԰��N����
			end
			sf2 = CreateObjByFlag(102776,780470,17,1)-----------------------�b�·t�����ͥX�p�L
			SetModeEx( sf2 , EM_SetModeType_Searchenemy, false)
			SetModeEx( sf2 , EM_SetModeType_Fight, false)
			SetModeEx( sf2 , EM_SetModeType_Move, false)
			AddToPartition( sf2 , RoomID )
			WriteRoleValue(sf2,EM_RoleValue_PID,fdoor)
			BeginPlot( sf2 ,"Lua_bk_sfi2_102670",10)--------���L�h�״_
		end
		if time1==30 then 
			for i=17 ,17 ,1 do 
			ss[i] = CreateObjByFlag(102777,780470,i,1)-----------------------�b�·t�����ͥX�p�L
			AddToPartition( ss[i] , RoomID )
			SetAttack( ss[i] , BossTarget)
			BeginPlot( ss[i] ,"Lua_bk_fd_sm_102760",50)--------�p�����}�԰��N����
			end
			sf3 = CreateObjByFlag(102776,780470,17,1)-----------------------�b�·t�����ͥX�p�L
			SetModeEx( sf3 , EM_SetModeType_Searchenemy, false)
			SetModeEx( sf3 , EM_SetModeType_Fight, false)
			SetModeEx( sf3 , EM_SetModeType_Move, false)
			AddToPartition( sf3 , RoomID )
			WriteRoleValue(sf3,EM_RoleValue_PID,fdoor)
			BeginPlot( sf3 ,"Lua_bk_sfi3_102670",10)--------���L�h�״_	
			break
		end
	end
	sleep(200)
	DelObj(door1)
	DelObj(fdoor)
end
function Lua_bk_sfi1_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local fdoor=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local ta=ReadRoleValue(fdoor,EM_RoleValue_Register6)
	local sfi=OwnerID()
	local time1=0
	local mo=0
	SetPosByFlag( sfi, 780470 , 5 )
	SetModeEx( sfi , EM_SetModeType_Searchenemy, true)
	SetModeEx( sfi , EM_SetModeType_Fight, true)
	Hide(sfi)
	Show(sfi,RoomID)
	sleep(10)
	while 1 do 
		sleep(10)
		CastSpell( sfi , sfi , 494460 )-------�״_�ʧ@
		while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 494460   do
		sleep(10)
		AddBuff( ta , 504757 , 1 , 600)
		mo=mo+1
		end
		if mo >= 20 then
			break
		end
	end
	SetModeEx( sfi , EM_SetModeType_Move, true)
	BeginPlot( sfi ,"Lua_bk_fd_sm_102760",150)--------�p�����}�԰��N����
end
function Lua_bk_sfi2_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local fdoor=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local ta=ReadRoleValue(fdoor,EM_RoleValue_Register7)
	local sfi=OwnerID()
	local time1=0
	local mo=0
	SetPosByFlag( sfi, 780470 , 6 )
	SetModeEx( sfi , EM_SetModeType_Searchenemy, true)
	SetModeEx( sfi , EM_SetModeType_Fight, true)
	Hide(sfi)
	Show(sfi,RoomID)
	sleep(10)
	while 1 do 
		sleep(10)
		CastSpell( sfi , sfi , 494460 )-------�״_�ʧ@
		while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 494460   do
		sleep(10)
		AddBuff( ta , 504757 , 1 , 600)
		mo=mo+1
		end
		if mo >= 20 then
			break
		end
	end
	SetModeEx( sfi , EM_SetModeType_Move, true)
	BeginPlot( sfi ,"Lua_bk_fd_sm_102760",150)--------�p�����}�԰��N����
end
function Lua_bk_sfi3_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local fdoor=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local ta=ReadRoleValue(fdoor,EM_RoleValue_Register8)
	local sfi=OwnerID()
	local time1=0
	local mo=0
	SetPosByFlag( sfi, 780470 , 7 )
	SetModeEx( sfi , EM_SetModeType_Searchenemy, true)
	SetModeEx( sfi , EM_SetModeType_Fight, true)
	Hide(sfi)
	Show(sfi,RoomID)
	sleep(10)
	while 1 do 
		sleep(10)
		CastSpell( sfi , sfi , 494460 )-------�״_�ʧ@
		while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 494460   do
		sleep(10)
		AddBuff( ta , 504757 , 1 , 600)
		mo=mo+1
		end
		if mo >= 20 then
			break
		end
	end
	SetModeEx( sfi , EM_SetModeType_Move, true)
	BeginPlot( sfi ,"Lua_bk_fd_sm_102760",150)--------�p�����}�԰��N����
end
function Lua_bk_sfi4_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local fdoor=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local ta=ReadRoleValue(fdoor,EM_RoleValue_Register9)
	local sfi=OwnerID()
	local time1=0
	local mo=0
	SetPosByFlag( sfi, 780470 , 8 )
	SetModeEx( sfi , EM_SetModeType_Searchenemy, true)
	SetModeEx( sfi , EM_SetModeType_Fight, true)
	Hide(sfi)
	Show(sfi,RoomID)
	sleep(10)
	while 1 do 
		sleep(10)
		CastSpell( sfi , sfi , 494460 )-------�״_�ʧ@
		while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 494460   do
		sleep(10)
		AddBuff( ta , 504757 , 1 , 600)
		mo=mo+1
		end
		if mo >= 20 then
			break
		end
	end
	SetModeEx( sfi , EM_SetModeType_Move, true)
	BeginPlot( sfi ,"Lua_bk_fd_sm_102760",150)--------�p�����}�԰��N����
end
function Lua_bk_range_504998()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local ram=OwnerID()
	while 1 do 
		sleep(10)
		local pm=SearchRangePlayer(ram,400)
		local playx=0
		local px=table.getn(pm)-----���X�Ӫ��O�ƶq
		if px<=6 then 
			WriteRoleValue(st,EM_RoleValue_Register4,1)
		end
		if px>6 then 
			for i=1,px,1 do
				if ReadRoleValue( pm[px] , EM_RoleValue_IsDead) == 1 and 
				ReadRoleValue( pm[px] , EM_RoleValue_IsPlayer) == 0 and 
				ReadRoleValue( pm[px] , EM_RoleValue_VOC ) ==1  then
				playx=playx+1
				end
			end
			if px==playx then
				WriteRoleValue(st,EM_RoleValue_Register4,1)
			end
		end
	end
end
function Lua_fd_bao_113647()------------------------------���@�n
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local baoc=OwnerID()
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local ba1=0
local ba2=0
local ba3=0
local ba4=0
local ba6=0
local ba7=0
local ba8=0
local ba9=0
local bao1=0
local bao2=0
local bao3=0
local bao4=0
local mob = 0
local mx=0
	while 1 do 
	sleep(10)
		mob = ReadRoleValue(boss,EM_RoleValue_Register2)
		ba6 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
		ba7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
		ba8 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
		ba9 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
		if ba6==1 then 
		sleep(100)
		bao1 =LuaFunc_CreateObjByObj ( 113659 , ba1 )--------------������o��.
		AddToPartition( bao1 , RoomID )
		Delobj(ba1)
		WriteRoleValue(baoc,EM_RoleValue_Register6,0)
		end
		if ba7==1 then 
		sleep(100)
		bao2 =LuaFunc_CreateObjByObj ( 113659 , ba2 )--------------������o��.
		AddToPartition( bao2 , RoomID )
		Delobj(ba2)
		WriteRoleValue(baoc,EM_RoleValue_Register7,0)
		end
		if ba8==1 then 
		sleep(100)
		bao3 =LuaFunc_CreateObjByObj ( 113659 , ba3 )--------------������o��.
		AddToPartition( bao3 , RoomID )
		Delobj(ba3)
		WriteRoleValue(baoc,EM_RoleValue_Register8,0)
		end
		if ba9==1 then 
		sleep(100)
		bao4 =LuaFunc_CreateObjByObj ( 113659 , ba4 )--------------������o��.
		AddToPartition( bao4 , RoomID )
		Delobj(ba4)
		WriteRoleValue(baoc,EM_RoleValue_Register9,0)
		end
		if mob == 0 then 
			if mx==0 then 
			ba1=CreateObjByFlag(113647,780470,1,1)
			SetModeEx(  ba1 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba1 , RoomID )
			WriteRoleValue(ba1,EM_RoleValue_PID,baoc)
			SetPlot( ba1 , "touch" , "Lua_fd_bao6_ra_113647" , 50 )------�g�JĲ�I�@��		
			ba2=CreateObjByFlag(113647,780470,2,1)
			SetModeEx(  ba2 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba2 , RoomID )
			WriteRoleValue(ba2,EM_RoleValue_PID,baoc)
			SetPlot( ba2 , "touch" , "Lua_fd_bao7_ra_113647" , 50 )------�g�JĲ�I�@��
			ba3=CreateObjByFlag(113647,780470,3,1)
			SetModeEx(  ba3 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba3 , RoomID )
			WriteRoleValue(ba3,EM_RoleValue_PID,baoc)
			SetPlot( ba3 , "touch" , "Lua_fd_bao8_ra_113647" , 50 )------�g�JĲ�I�@��
			ba4=CreateObjByFlag(113647,780470,4,1)
			SetModeEx(  ba4 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba4 , RoomID )
			WriteRoleValue(ba4,EM_RoleValue_PID,baoc)
			SetPlot( ba4 , "touch" , "Lua_fd_bao9_ra_113647" , 50 )------�g�JĲ�I�@��
			mx=1
			end
		end 
		if mob == 1 then 
			if mx==1 then 
			Delobj(bao1)
			Delobj(bao2)
			Delobj(bao3)
			Delobj(bao4)
			Delobj(ba1)
			Delobj(ba2)
			Delobj(ba3)
			Delobj(ba4)
			ba1=CreateObjByFlag(113647,780470,1,1)
			SetModeEx(  ba1 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba1 , RoomID )
			WriteRoleValue(ba1,EM_RoleValue_PID,baoc)
			SetPlot( ba1 , "touch" , "Lua_fd_bao6_ra_113647" , 50 )------�g�JĲ�I�@��		
			ba2=CreateObjByFlag(113647,780470,2,1)
			SetModeEx(  ba2 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba2 , RoomID )
			WriteRoleValue(ba2,EM_RoleValue_PID,baoc)
			SetPlot( ba2 , "touch" , "Lua_fd_bao7_ra_113647" , 50 )------�g�JĲ�I�@��
			ba3=CreateObjByFlag(113647,780470,3,1)
			SetModeEx(  ba3 , EM_SetModeType_ShowRoleHead, false)
			AddToPartition( ba3 , RoomID )
			WriteRoleValue(ba3,EM_RoleValue_PID,baoc)
			SetPlot( ba3 , "touch" , "Lua_fd_bao8_ra_113647" , 50 )------�g�JĲ�I�@��
			ba4=CreateObjByFlag(113647,780470,4,1)
			SetModeEx(  ba4 , EM_SetModeType_ShowRoleHead, false )
			AddToPartition( ba4 , RoomID )
			WriteRoleValue(ba4,EM_RoleValue_PID,baoc)
			SetPlot( ba4 , "touch" , "Lua_fd_bao9_ra_113647" , 50 )------�g�JĲ�I�@��
			mx=2
			end
		end
		if mob == 2 then 
			if mx == 2 then 
			mx=1
			end
		end
		if mob== 3 then 
			Delobj(bao1)
			Delobj(bao2)
			Delobj(bao3)
			Delobj(bao4)
			Delobj(ba1)
			Delobj(ba2)
			Delobj(ba3)
			Delobj(ba4)
		end
		if mob== 4 then 
			Delobj(bao1)
			Delobj(bao2)
			Delobj(bao3)
			Delobj(bao4)
			Delobj(ba1)
			Delobj(ba2)
			Delobj(ba3)
			Delobj(ba4)
			sleep(50)
			Delobj(baoc)
		end		
	end
end
function Lua_fd_bao6_ra_113647()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local baoc=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local bao=TargetID()
	SetPlot( TargetID()  ,"touch", "" ,0 )
	local op=CreateObjByFlag ( 102737 ,780470,1,1 )-------------------------
	SetModeEx( op , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( op , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( op , EM_SetModeType_Strikback, false) ---����
	SetModeEx( op , EM_SetModeType_Move, false) ---����	
	SetModeEx( op , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( op , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( op , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( op , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( op , EM_SetModeType_Searchenemy, false)  ---���
	SetModeEx( op , EM_SetModeType_ShowRoleHead, false )
	AddToPartition( op , RoomID )
	BeginPlot( op,"Lua_bk_fd_ca_113647",0)
	WriteRoleValue(op, EM_RoleValue_Livetime,10)
	AddBuff( bao , 504849, 1 , 10 )
	WriteRoleValue(baoc,EM_RoleValue_Register6,1)	
end
function Lua_fd_bao7_ra_113647()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local baoc=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local bao=TargetID()
	SetPlot( TargetID()  ,"touch", "" ,0)
	local op=CreateObjByFlag ( 102737 ,780470,2,1 )-------------
	SetModeEx( op , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( op , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( op , EM_SetModeType_Strikback, false) ---����
	SetModeEx( op , EM_SetModeType_Move, false) ---����	
	SetModeEx( op , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( op , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( op , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( op , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( op , EM_SetModeType_Searchenemy, false)  ---���
	SetModeEx( op , EM_SetModeType_ShowRoleHead, false )
	AddToPartition( op , RoomID )
	BeginPlot( op,"Lua_bk_fd_ca_113647",0)
	WriteRoleValue(op, EM_RoleValue_Livetime,10)
	AddBuff( bao , 504849, 1 , 10 )
	WriteRoleValue(baoc,EM_RoleValue_Register7,1)
end
function Lua_fd_bao8_ra_113647()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local baoc=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local bao=TargetID()
	SetPlot( TargetID()  ,"touch", "" ,0 )
	local op=CreateObjByFlag ( 102737 ,780470,3,1 )---------------------
	SetModeEx( op , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( op , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( op , EM_SetModeType_Strikback, false) ---����
	SetModeEx( op , EM_SetModeType_Move, false) ---����	
	SetModeEx( op , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( op , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( op , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( op , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( op , EM_SetModeType_Searchenemy, false)  ---���
	SetModeEx( op , EM_SetModeType_ShowRoleHead, false )
	AddToPartition( op , RoomID )
	BeginPlot( op,"Lua_bk_fd_ca_113647",0)
	WriteRoleValue(op, EM_RoleValue_Livetime,10)
	AddBuff( bao , 504849, 1 , 10 )
	WriteRoleValue(baoc,EM_RoleValue_Register8,1)
end
function Lua_fd_bao9_ra_113647()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local baoc=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local bao=TargetID()
	SetPlot( TargetID()  ,"touch", "" ,0 )
	local op=CreateObjByFlag ( 102737 ,780470,4,1 )-------------
	SetModeEx( op , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( op , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( op , EM_SetModeType_Strikback, false) ---����
	SetModeEx( op , EM_SetModeType_Move, false) ---����	
	SetModeEx( op , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( op , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( op , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( op , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( op , EM_SetModeType_Searchenemy, false)  ---���
	SetModeEx( op , EM_SetModeType_ShowRoleHead, false )
	AddToPartition( op , RoomID )
	BeginPlot( op,"Lua_bk_fd_ca_113647",0)
	WriteRoleValue(op, EM_RoleValue_Livetime,10)
	AddBuff( bao , 504849, 1 , 10 )
	WriteRoleValue(baoc,EM_RoleValue_Register9,1)
end
function Lua_bk_fd_gb_102802()
	while 1 do 
	sleep(30)
		if HateListCount( OwnerID() ) ~= 0 then 	
		
		elseif HateListCount( OwnerID() ) == 0 then 
		sleep(200)---------20��
			DelObj(OwnerID())
		end
	end
end
function Lua_bk_dead_fd_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(st,EM_RoleValue_Register5,1)
	cl_BOSS_DEAD_GIVEITEM(240708)
end
