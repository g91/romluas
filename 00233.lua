Function LuaI_110424()

	SetPlot( OwnerID(), "touch", "LuaQ_110424_1", 40)

end
---------------------------------------------------------------------------------------------------------------
Function LuaQ_110424_1()

	 if CountBodyItem( OwnerID(), 200968) >=1 then
		DelBodyItem( OwnerID(), 200968, 1);  --�ˬd�çR���i�𤧤�
		BeginPlot( TargetID(), "LuaQ_110424_2",0); 
	end

End
-----------------------------------------------------------------------------------------------------------------
Function LuaQ_110424_2()

	--CastSpell( OwnerID(), OwnerID(), "�S�Ľs��");
	 --sleep(300)
	--Hide( OwnerID() );  --���øշҤ��O
	Local Obj01 = CreateObjbyObj( 100282, OwnerID(), 1);  --���͸շ��~
	
	For i=1,200,1 do
		if checkID( TargetID() ) == False then
			break  --�ˬd���쪱�a�A���}
		end
		if ReadRoleValue( TargetID(), EM_RoleValue_IsDead)==1 then
			Break; --���a�w���`�A���}
		end
		sleep(60); --�@(1200),20mins
	end

	Delobj( Obj01);  --�R���շ��~
	--if CheckID( TargetID() ) ==ture then (�N���a�ǰe�X�W��zone)
		
End