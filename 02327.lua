--
--在目標面前產生箱子。 /gm ? runplot  lua_AGCreatBoxTest
--產生坐在箱子上面的npc。 /gm ? runplot lua_AGPeopleOnBoxTest
--記算路徑點並儲存，執行後會跑一個小密蜂路徑。 /gm ? runplot lua_BoxCountPoint
--(需等上面那個跑完。) 從自身位置產生走路工 /gm ? runplot lua_AGtestToPoint
--刪除物件與清空變數用 /gm ? runplot lua_AGDelallTest
--
--刪除清空建出的所有東西
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
--在目標面前產生箱子
function lua_AGCreatBoxTest( )
		--清掉上一次的資料
		if VAR_AGBOX~=nil then
			for i=1,#VAR_AGBOX do
				DelObj(VAR_AGBOX[i])
			end
			VAR_AGBOX=nil
		end
		--
	VAR_AGBOX ={}		--全域1.箱子編號
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local tmpX,tmpY,tmpZ = 0,0,0
	local tmpDir = BaseDir*math.pi/180
	local WoodBox = 111028	--箱子ID
	local num = 10			--想產生的數量
		--開始產生箱子
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
--讓人坐在箱子上面
function lua_AGPeopleOnBoxTest()
		--清掉上一次的資料
		if VAR_AGtestNPC ~=nil then
			for i=1,#VAR_AGtestNPC do
				DelObj(VAR_AGtestNPC[i])
			end
			VAR_AGtestNPC=nil
		end
		--
	VAR_AGtestNPC={}		--全域2.npc編號
	local BoxTable=VAR_AGBOX	--把全域1讀進來
	local num =10			--取npc數量
	--塞npc編號到table 110020+num個
	local NPC = {}
		for i=1,num do
			NPC[i] = 110019+i
		end
	local boxdir = ReadRoleValue( BoxTable[1],EM_RoleValue_Dir )
		--只是希望npc都面向自己
		if boxdir >180 then
			boxdir = boxdir-180
		else
			boxdir = boxdir+180
		end
		--開始隨機坐人
		for i=1,#BoxTable,1 do
			local k =Rand(num)+1
			local x,y,z,dir = DW_Location( BoxTable[i] )	--共用函式，取得xyz
				VAR_AGtestNPC[i] = CreateObj( NPC[k] , x,y+10,z,boxdir,1 )
					SetDefIdleMotion(VAR_AGtestNPC[i],ruFUSION_MIME_SIT_CHAIR_LOOP);
					SetModeEx(VAR_AGtestNPC[i],EM_SetModeType_Gravity,false);
				AddToPartition( VAR_AGtestNPC[i],0 ) 
				table.remove(NPC,k)
				num=num-1
		end
end
--執行後產生路徑點並記錄，整個function是寫死的，沒變化
function lua_BoxCountPoint()
	VAR_AGTESTROAD = {}
	local obj = 106794	--可視路徑點ID
	local k=1		--記錄有幾個點
	--走過去用點位4,3,2,1,0,5,6,7,8
	for i = 1,#VAR_AGBOX,1 do
		local x,y,z,dir = DW_Location( VAR_AGBOX[i] )
		dir = dir*math.pi/180	--算原始
		if i%2==1 then
			for j=4,0,-1 do
				VAR_AGTESTROAD[k]={}
					VAR_AGTESTROAD[k]["X"] = x +25 * math.cos(dir+math.pi*2*(j/8))
					VAR_AGTESTROAD[k]["Y"] = y
					VAR_AGTESTROAD[k]["Z"] = z -25 * math.sin(dir+math.pi*2*(j/8))	
				local tmpobj=CreateObj( obj,VAR_AGTESTROAD[k]["X"],VAR_AGTESTROAD[k]["Y"],VAR_AGTESTROAD[k]["Z"],dir,1)
					AddToPartition( tmpobj,0 )	
					CallPlot(tmpobj,"lua_AGtestDelSelf",0)	--將產生的點刪掉用
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
	--走回來用點位0,1,2,3,4,8,7,6,5
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
--將產生的路徑點自刪用
function lua_AGtestDelSelf()
	Sleep(20)
	DelObj(OwnerID())
end
--從自己的位置產生一隻npc讓他走路
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
		local Sec = move( npc,x,y,z )	--最後走回初始的位置
			Sleep(Sec*3)
			DelObj(npc)		
end