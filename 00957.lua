function yuyu_flag1_2_00()                                                                                                 
	local A = 15
	local X = Rand( A )                                                                                        --Rand(�H���X�l���ƶq)
	local CCC= CreateObjByFlag( 100917, 780210 , X , 1 );                             --�ѷӫ��w���󪺦�m�Ӳ��ͪ���@(���ͪ�����ID�A�X�lID�A�H�����X���A���ͪ��ƶq)
	WriteRoleValue( CCC, EM_RoleValue_PID , X )			       --�NDDD����mX�Ȧs�bPID��
                BeginPlot(CCC, "yuyu_flag1_2_01" , 0 )                                               
end

function yuyu_flag1_2_01()                                         
	sleep(30)
	AddToPartition( OwnerID() , 0 )                                                             --�[�i�R�x(�[�J�� , �R�x�h��)
	setplot(  OwnerID()  , "dead","yuyu_flag1_2_02",0 )			--���`�@��
 	SetFightMode (  OwnerID()  , 0, 1, 0, 1 )
end

function yuyu_flag1_2_02()  
	local A = 15
	local X = Rand( A )                                                                                                  
	local CCC = CreateObjByFlag( 100917, 780210 , X , 1 );                      --�ѷӫ��w���󪺦�m�Ӳ��ͪ���@(���ͪ�����ID�A�X�lID�A�H�����X���A���ͪ��ƶq)
	if X == ReadRoleValue(OwnerID() , EM_RoleValue_PID )  then	--����Ǫ���a����
		X = X + 1
		if X >= A then
			X = 0
		end
	end
	WriteRoleValue( CCC, EM_RoleValue_PID , X )
	BeginPlot( CCC,"yuyu_flag1_2_01",0)
	 Say( OwnerID() , GetString("SC_YU_100917") )   
	return true                                                                                                --return true  --�Ө���|���Areturn flase  --�Ө��⤣�|���A�����
end
