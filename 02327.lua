--
--�b�ؼЭ��e���ͽc�l�C /gm ? runplot  lua_AGCreatBoxTest
--���ͧ��b�c�l�W����npc�C /gm ? runplot lua_AGPeopleOnBoxTest
--�O����|�I���x�s�A�����|�]�@�Ӥp�K�����|�C /gm ? runplot lua_BoxCountPoint
--(�ݵ��W�����Ӷ]���C) �q�ۨ���m���ͨ����u /gm ? runplot lua_AGtestToPoint
--�R������P�M���ܼƥ� /gm ? runplot lua_AGDelallTest
--
--�R���M�ūإX���Ҧ��F��
function lua_AGDelallTest()
	VAR_AGTESTROAD=nil
	if VAR_AGBOX ~=nil then
		for i=1,#VAR_AGBOX do
			DelObj(VAR_AGBOX[i])
		end
		VAR_AGBOX=nil
	end
	if VAR_AGtestNPC ~=nil then
		for i=1,#VAR_AGtestNPC do
			DelObj(VAR_AGtestNPC[i])
		end
		VAR_AGtestNPC=nil
	end
end
--�b�ؼЭ��e���ͽc�l
function lua_AGCreatBoxTest( )
		--�M���W�@�������
		if VAR_AGBOX~=nil then
			for i=1,#VAR_AGBOX do
				DelObj(VAR_AGBOX[i])
			end
			VAR_AGBOX=nil
		end
		--
	VAR_AGBOX ={}		--����1.�c�l�s��
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local tmpX,tmpY,tmpZ = 0,0,0
	local tmpDir = BaseDir*math.pi/180
	local WoodBox = 111028	--�c�lID
	local num = 10			--�Q���ͪ��ƶq
		--�}�l���ͽc�l
		for i = 1 , num , 1 do	
			tmpX = BaseX+i*50*math.cos(tmpDir)
			tmpY = GetHeight(BaseX+i*50*math.cos(tmpDir),BaseY,BaseZ-i*50*math.sin(tmpDir) )
			tmpZ = BaseZ-i*50*math.sin(tmpDir)		
			VAR_AGBOX[i] = CreateObj( WoodBox , tmpX,tmpY,tmpZ,BaseDir,1  )
				SetModeEx( VAR_AGBOX[i]  , EM_SetModeType_Obstruct, true )
				SetModeEx( VAR_AGBOX[i]  , EM_SetModeType_Obstruct, true )
				AddToPartition( VAR_AGBOX[i],0 )
		end  
end
--���H���b�c�l�W��
function lua_AGPeopleOnBoxTest()
		--�M���W�@�������
		if VAR_AGtestNPC ~=nil then
			for i=1,#VAR_AGtestNPC do
				DelObj(VAR_AGtestNPC[i])
			end
			VAR_AGtestNPC=nil
		end
		--
	VAR_AGtestNPC={}		--����2.npc�s��
	local BoxTable=VAR_AGBOX	--�����1Ū�i��
	local num =10			--��npc�ƶq
	--��npc�s����table 110020+num��
	local NPC = {}
		for i=1,num do
			NPC[i] = 110019+i
		end
	local boxdir = ReadRoleValue( BoxTable[1],EM_RoleValue_Dir )
		--�u�O�Ʊ�npc�����V�ۤv
		if boxdir >180 then
			boxdir = boxdir-180
		else
			boxdir = boxdir+180
		end
		--�}�l�H�����H
		for i=1,#BoxTable,1 do
			local k =Rand(num)+1
			local x,y,z,dir = DW_Location( BoxTable[i] )	--�@�Ψ禡�A���oxyz
				VAR_AGtestNPC[i] = CreateObj( NPC[k] , x,y+10,z,boxdir,1 )
					SetDefIdleMotion(VAR_AGtestNPC[i],ruFUSION_MIME_SIT_CHAIR_LOOP);
					SetModeEx(VAR_AGtestNPC[i],EM_SetModeType_Gravity,false);
				AddToPartition( VAR_AGtestNPC[i],0 ) 
				table.remove(NPC,k)
				num=num-1
		end
end
--����Უ�͸��|�I�ðO���A���function�O�g�����A�S�ܤ�
function lua_BoxCountPoint()
	VAR_AGTESTROAD = {}
	local obj = 106794	--�i�����|�IID
	local k=1		--�O�����X���I
	--���L�h���I��4,3,2,1,0,5,6,7,8
	for i = 1,#VAR_AGBOX,1 do
		local x,y,z,dir = DW_Location( VAR_AGBOX[i] )
		dir = dir*math.pi/180	--���l
		if i%2==1 then
			for j=4,0,-1 do
				VAR_AGTESTROAD[k]={}
					VAR_AGTESTROAD[k]["X"] = x +25 * math.cos(dir+math.pi*2*(j/8))
					VAR_AGTESTROAD[k]["Y"] = y
					VAR_AGTESTROAD[k]["Z"] = z -25 * math.sin(dir+math.pi*2*(j/8))	
				local tmpobj=CreateObj( obj,VAR_AGTESTROAD[k]["X"],VAR_AGTESTROAD[k]["Y"],VAR_AGTESTROAD[k]["Z"],dir,1)
					AddToPartition( tmpobj,0 )	
					CallPlot(tmpobj,"lua_AGtestDelSelf",0)	--�N���ͪ��I�R����
					k=k+1
					Sleep(2)
			end
		else
			for j=5,8,1 do
				VAR_AGTESTROAD[k]={}
					VAR_AGTESTROAD[k]["X"] = x +25 * math.cos(dir+math.pi*2*(j/8))
					VAR_AGTESTROAD[k]["Y"] = y
					VAR_AGTESTROAD[k]["Z"] = z -25 * math.sin(dir+math.pi*2*(j/8))	
				local tmpobj=CreateObj( obj,VAR_AGTESTROAD[k]["X"],VAR_AGTESTROAD[k]["Y"],VAR_AGTESTROAD[k]["Z"],dir,1)
					AddToPartition( tmpobj,0 )	
					CallPlot(tmpobj,"lua_AGtestDelSelf",0)	
					k=k+1
					Sleep(2)
			end
		end
	end
	--���^�ӥ��I��0,1,2,3,4,8,7,6,5
	for i = #VAR_AGBOX,1,-1 do
		local x,y,z,dir = DW_Location( VAR_AGBOX[i] )
		dir = dir*math.pi/180
		if i%2==0 then
			for j=0,4,1 do
				VAR_AGTESTROAD[k]={}
					VAR_AGTESTROAD[k]["X"] = x +25 * math.cos(dir+math.pi*2*(j/8))
					VAR_AGTESTROAD[k]["Y"] = y
					VAR_AGTESTROAD[k]["Z"] = z -25 * math.sin(dir+math.pi*2*(j/8))	
				local tmpobj=CreateObj( obj,VAR_AGTESTROAD[k]["X"],VAR_AGTESTROAD[k]["Y"],VAR_AGTESTROAD[k]["Z"],dir,1)
					AddToPartition( tmpobj,0 )	
					CallPlot(tmpobj,"lua_AGtestDelSelf",0)
					k=k+1
					Sleep(2)
			end
		else
			for j=8,5,-1 do
				VAR_AGTESTROAD[k]={}
					VAR_AGTESTROAD[k]["X"] = x +25 * math.cos(dir+math.pi*2*(j/8))
					VAR_AGTESTROAD[k]["Y"] = y
					VAR_AGTESTROAD[k]["Z"] = z -25 * math.sin(dir+math.pi*2*(j/8))	
				local tmpobj=CreateObj( obj,VAR_AGTESTROAD[k]["X"],VAR_AGTESTROAD[k]["Y"],VAR_AGTESTROAD[k]["Z"],dir,1)
					AddToPartition( tmpobj,0 )	
					CallPlot(tmpobj,"lua_AGtestDelSelf",0)	
					k=k+1
					Sleep(2)
			end
		end
	end
end
--�N���ͪ����|�I�ۧR��
function lua_AGtestDelSelf()
	Sleep(20)
	DelObj(OwnerID())
end
--�q�ۤv����m���ͤ@��npc���L����
function lua_AGtestToPoint()
	local box = 2
	local x,y,z,dir = DW_Location( OwnerID() )
	local npc = CreateObj( 120224,x,y,z,dir,1)
		moveToFlagEnabled( npc, false )
		AddToPartition( npc,0 )
		for i=1,#VAR_AGTESTROAD,1 do
			DebugMsg(0,0,"i="..i)
			local Sec = move( npc,VAR_AGTESTROAD[i]["X"],VAR_AGTESTROAD[i]["Y"],VAR_AGTESTROAD[i]["Z"] )
			Sleep(Sec*3)
		end
		local Sec = move( npc,x,y,z )	--�̫ᨫ�^��l����m
			Sleep(Sec*3)
			DelObj(npc)		
end