function yuyu_flag2_3_00()                                                                                                 
	local A = 10
	local X = Rand( A )                                                                                        --Rand(�H���X�l���ƶq)
	local DDD = CreateObjByFlag( 100652, 780207 , X , 1 );                             --�ѷӫ��w���󪺦�m�Ӳ��ͪ���@(���ͪ�����ID�A�X�lID�A�H�����X���A���ͪ��ƶq)
	WriteRoleValue( DDD , EM_RoleValue_PID , X )			       --�NDDD����mX�Ȧs�bPID��
                BeginPlot(DDD, "yuyu_flag2_3_01" , 0 )                                               
end

function yuyu_flag2_3_01()                                         
	sleep(30)
	AddToPartition( OwnerID() , 0 )                                                             --�[�i�R�x(�[�J�� , �R�x�h��)
	setplot(  OwnerID()  , "dead","yuyu_flag2_3_02",0 )			--���`�@��
 	SetFightMode (  OwnerID()  , 0, 1, 0, 1 )
end

function yuyu_flag2_3_02()  
	local A = 10
	local X = Rand( A )                                                                                                  
	local DDD = CreateObjByFlag( 100652, 780207 , X , 1 );                      --�ѷӫ��w���󪺦�m�Ӳ��ͪ���@(���ͪ�����ID�A�X�lID�A�H�����X���A���ͪ��ƶq)
	if X == ReadRoleValue(OwnerID() , EM_RoleValue_PID )  then	--����Ǫ���a����
		X = X + 1
		if X >= A then
			X = 0
		end
	end
	WriteRoleValue( DDD , EM_RoleValue_PID , X )
	BeginPlot( DDD,"yuyu_flag2_3_01",0)
	 Say( OwnerID() , GetString("SC_YU_100917") )   
	return true                                                                                                --return true  --�Ө���|���Areturn flase  --�Ө��⤣�|���A�����
end