function Init_RoleData_Function( )
	-- �Ⲿ�����󭫷s�[�J
 	function Role:AddtoPartition( RoomID )
		if( RoomID == nil ) then 
			RoomID  = -1;
		end
		AddToPartition( self.RoleID , -1 ) 
	end
	
	-- �⪫�󲾰�(�����)
 	function Role:DelFromPartition( )
		DelFromPartition( self.RoleID , -1 ) 
	end

	function Role:Move( X , Y, Z )
		Move( self.RoleID  , X , Y ,Z );	
	end

	--�]�w��l�@��
	function Role:SetAutoPlot( PlotName )
		SetPlot( self.RoleID , "Range" , PlotName , Range )
	end
	--�]�w�B�I�@��
	function Role:SetTouchPlot( PlotName , Range )
		SetPlot( self.RoleID , "Touch" , PlotName , Range )
	end
	--�]�w�d��@��
	function Role:SetRangePlot( PlotName , Range )
		SetPlot( self.RoleID , "Range" , PlotName , Range )
	end
	--�]�w���`�@��
	function Role:SetDeadPlot( PlotName  )
		SetPlot( self.RoleID , "Dead" , PlotName , 0 )
	end


	--����@��
	function Role:RunPlot( Plot )
		RunPlot( self.RoleID , Plot )
	end

	--�]�w�����󬰰ӤH
	function Role:SetShop( ShopObjID , CloseShopPlot )
		SetShop( self.RoleID , ShopObjID , CloseShopPlot )
	end
	
	-- �d�򻡸�
	function Role:Say( Msg )
		Say( self.RoleID , Msg )
	end

	--�]�w����
	function Role:SetAttack( TargetID )
		SetAttack( self.RoleID , TargetID )
	end
	--�]�w�������
	function Role:SetStopAttack(  )
		SetStopAttack( self.RoleID  )
	end
	--�������~
	function Role:GiveBodyItem( OrgID , Count  )
		return GiveBodyItem( self.RoleID , OrgID , Count  )
	end
	--�R�����~
	function Role:DelBodyItem( OrgID , Count  )
		return DelBodyItem( self.RoleID , OrgID , Count  )
	end
	function Role:GiveBodyItemEx( OrgID , Count , RuneVolume, Inheart , Rune1 , Rune2 , Rune3 ,Rune4  )
		return GiveBodyItemEx( self.RoleID , OrgID , Count ,RuneVolume, Inheart , Rune1 , Rune2 , Rune3 ,Rune4  )
	end


	-- �]�w���]�B
	function Role:IsWalk( Flag )
		WriteRoleValue( self.RoleID ,EM_RoleValue_IsWalk , Flag  )
	end

	function Role:SetLiveTime( Time  )
		WriteRoleValue( self.RoleID , EM_RoleValue_LiveTime,Time )
	end

end