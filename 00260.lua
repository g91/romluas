function LuaQ_420237_Complet()
	Hide( OwnerID())
	CastSpell( OwnerID(),OwnerID(),490101)
	sleep( 50 )
	local DarkKnight = CreateObjbyObj( 100136, OwnerID() , 1 )
--	AddToPartition( DarkKnight ,0)
	SetRoleCamp( DarkKnight , NPC )  --�����������a
	Say( DarkKnight , GetString("YELL_100265_0") )
	 --/*�ڦA����o�O�q�K�K�_���I�N�Ҧ������ߥH�Ω}�d�ٵ��o�ӥ@�ɡI
	sleep ( 50 )
	CancelBuff( OwnerID(), 500900 )
	SetRoleCamp( DarkKnight , MONSTER )  --�}�l�������a
	SetPlot( DarkKnight , "Dead" , "LuaI_100265_Dead" , 40 ) 
	SetAttack( DarkKnight , TargetID() )
	DelObj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------
function LuaI_100265_Dead()

	SAY( OwnerID() , GetString("YELL_100265_1") )
	 --/*�L�����H���I�A�̷M�����欰�u�����w�h�Q���I�ΡA���û��L�k�N�w�h�Q�����s�b�ٷ��I	

end