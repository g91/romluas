function yuyu_flag2_3_00()                                                                                                 
	local A = 10
	local X = Rand( A )                                                                                        --Rand(隨機旗子的數量)
	local DDD = CreateObjByFlag( 100652, 780207 , X , 1 );                             --參照指定物件的位置來產生物件　(產生的物件ID，旗子ID，隨機的旗號，產生的數量)
	WriteRoleValue( DDD , EM_RoleValue_PID , X )			       --將DDD的位置X值存在PID裡
                BeginPlot(DDD, "yuyu_flag2_3_01" , 0 )                                               
end

function yuyu_flag2_3_01()                                         
	sleep(30)
	AddToPartition( OwnerID() , 0 )                                                             --加進舞台(加入者 , 舞台層級)
	setplot(  OwnerID()  , "dead","yuyu_flag2_3_02",0 )			--死亡劇情
 	SetFightMode (  OwnerID()  , 0, 1, 0, 1 )
end

function yuyu_flag2_3_02()  
	local A = 10
	local X = Rand( A )                                                                                                  
	local DDD = CreateObjByFlag( 100652, 780207 , X , 1 );                      --參照指定物件的位置來產生物件　(產生的物件ID，旗子ID，隨機的旗號，產生的數量)
	if X == ReadRoleValue(OwnerID() , EM_RoleValue_PID )  then	--防止怪物原地重生
		X = X + 1
		if X >= A then
			X = 0
		end
	end
	WriteRoleValue( DDD , EM_RoleValue_PID , X )
	BeginPlot( DDD,"yuyu_flag2_3_01",0)
	 Say( OwnerID() , GetString("SC_YU_100917") )   
	return true                                                                                                --return true  --該角色會死，return flase  --該角色不會死，血全滿
end