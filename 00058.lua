Function LuaQ_420240_Accept()

	SetPlot( OwnerID(), "touch", "LuaFunc_Obj_BUSY", 40);	--��w���ŮR
	
	local Parlas
	sleep( 30);
	Parlas = CreateObj( 100217, -4288,  233, -8085 , 0, 1);		--���ͩ��Դ�
	AddToPartition( Parlas, 0  );	--��ܩ��Դ�
	SetAttack( Parlas, TargetID() );	--�]�w�����}�ҥ��Ȫ�
	BeginPlot(Parlas, "LuaQ_420240_Suicide",0);	--�ˬd�B�����]�w
	sleep( 10);

	While 1 do
		if CheckID(Parlas) == false then	--�Y�O���Դ��w����
			SetPlot( OwnerID(), "touch","",0);	--���s�}�Ҭ��ŮRĲ�I�@��
			break	--���X�j��
		end
		sleep( 20 )	--�j���ˬd���j�ɶ�
	end
End
---------------------------------------------------------------------------------------
Function LuaQ_420240_Suicide()
	LuaFunc_Obj_Suicide( 300 );
end