function Lua_Dan_111700_Flowers()
	--sleep(300)
	
                
	--AddBuff( OwnerID() ,503153, 1 , 10 )
                --sleep(20)
	SetPlot( OwnerID(),"touch","Lua_Dan_111700_flowerTouch", 100)


end


		     
		      	



function Lua_Dan_111700_flowerTouch()
	--Say(TargetID(),"TargetID")  ����
	--Say(OwnerID(),"OwnerID")  ���a

	--SetPlot( TargetID(),"touch","",30 )

	local Bag2 = CheckFlag(OwnerID()  , 542519)
	local bagcheck = CountBodyItem( OwnerID() , 204216)
	if bagcheck == 0 then
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_111700_36]", C_SYSTEM )--�Ю��]�k�U�A�ӱĶ��a!
	elseif Bag2 == true then
	 	
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_SR_111700_24]", C_SYSTEM )
	else

		if bagcheck >= 1 then
			if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_19]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END	, 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
				AttachCastMotionTool( OwnerID(), 210510) --�m���Z��������

				while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- ���\
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break
						elseif ( CastBarStatus < 0 ) then -- ����
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break
						end
					end
				end


				if ( result == "OKOK" ) then
					-- SetPlot( TargetID(),"touch","Lua_Dan_111700_flowerTouch",100 )
					 SetFlag( OwnerID()  , 542519 , 1 )
					 ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_SR_111700_24]", C_SYSTEM )
					GiveBodyItem( OwnerID() ,  204217  , 1 )  
					DelBodyItem ( OwnerID() ,  204216  , 1 )  
		--                       sleep(10)
		--			 BeginPlot (TargetID() , "Lua_Dan_111700_Flowers", 10) 

				end
			end
	
		end
	end

end