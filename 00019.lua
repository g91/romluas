function Init_RoleData_Function( )
	-- 把移除物件重新加入
 	function Role:AddtoPartition( RoomID )
		if( RoomID == nil ) then 
			RoomID  = -1;
		end
		AddToPartition( self.RoleID , -1 ) 
	end
	
	-- 把物件移除(不顯示)
 	function Role:DelFromPartition( )
		DelFromPartition( self.RoleID , -1 ) 
	end

	function Role:Move( X , Y, Z )
		Move( self.RoleID  , X , Y ,Z );	
	end

	--設定初始劇情
	function Role:SetAutoPlot( PlotName )
		SetPlot( self.RoleID , "Range" , PlotName , Range )
	end
	--設定處碰劇情
	function Role:SetTouchPlot( PlotName , Range )
		SetPlot( self.RoleID , "Touch" , PlotName , Range )
	end
	--設定範圍劇情
	function Role:SetRangePlot( PlotName , Range )
		SetPlot( self.RoleID , "Range" , PlotName , Range )
	end
	--設定死亡劇情
	function Role:SetDeadPlot( PlotName  )
		SetPlot( self.RoleID , "Dead" , PlotName , 0 )
	end


	--執行劇情
	function Role:RunPlot( Plot )
		RunPlot( self.RoleID , Plot )
	end

	--設定此物件為商人
	function Role:SetShop( ShopObjID , CloseShopPlot )
		SetShop( self.RoleID , ShopObjID , CloseShopPlot )
	end
	
	-- 範圍說話
	function Role:Say( Msg )
		Say( self.RoleID , Msg )
	end

	--設定攻擊
	function Role:SetAttack( TargetID )
		SetAttack( self.RoleID , TargetID )
	end
	--設定停止攻擊
	function Role:SetStopAttack(  )
		SetStopAttack( self.RoleID  )
	end
	--給予物品
	function Role:GiveBodyItem( OrgID , Count  )
		return GiveBodyItem( self.RoleID , OrgID , Count  )
	end
	--刪除物品
	function Role:DelBodyItem( OrgID , Count  )
		return DelBodyItem( self.RoleID , OrgID , Count  )
	end
	function Role:GiveBodyItemEx( OrgID , Count , RuneVolume, Inheart , Rune1 , Rune2 , Rune3 ,Rune4  )
		return GiveBodyItemEx( self.RoleID , OrgID , Count ,RuneVolume, Inheart , Rune1 , Rune2 , Rune3 ,Rune4  )
	end


	-- 設定為跑步
	function Role:IsWalk( Flag )
		WriteRoleValue( self.RoleID ,EM_RoleValue_IsWalk , Flag  )
	end

	function Role:SetLiveTime( Time  )
		WriteRoleValue( self.RoleID , EM_RoleValue_LiveTime,Time )
	end

end