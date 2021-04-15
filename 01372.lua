Function LuaI_204802(Option)
	local PlayerID = OwnerID()
	local PackageID = 204802
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201139 , 1 )
		GiveBodyItem( PlayerID , 201610 , 5 )
		GiveBodyItem( PlayerID , 201134 , 5 )
		GiveBodyItem( PlayerID , 202506 , 5 )
		GiveBodyItem( PlayerID , 202902 , 2 )
		GiveBodyItem( PlayerID , 202903 , 10 )
	end

end

Function LuaI_204803(Option)
	local PlayerID = OwnerID()
	local PackageID = 204803
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902 , 5 )
		GiveBodyItem( PlayerID , 202903 , 20 )
		GiveBodyItem( PlayerID , 202904 , 5 )
		GiveBodyItem( PlayerID , 202905 , 3 )
		GiveBodyItem( PlayerID , 202435 , 5 )
	end

end

Function LuaI_204804(Option)
	local PlayerID = OwnerID()
	local PackageID = 204804
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201134 , 5 )
		GiveBodyItem( PlayerID , 201460 , 3 )
		GiveBodyItem( PlayerID , 201610 , 5 )
		GiveBodyItem( PlayerID , 222925 , 1 )
		GiveBodyItem( PlayerID , 222926 , 1 )
	end

end

Function LuaI_204805(Option)
	local PlayerID = OwnerID()
	local PackageID = 204805
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201134 , 20 )
		GiveBodyItem( PlayerID , 201460 , 5 )
		GiveBodyItem( PlayerID , 222927 , 1 )
	end

end

Function LuaI_204806(Option)
	local PlayerID = OwnerID()
	local PackageID = 204806
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201610 , 20 )
		GiveBodyItem( PlayerID , 201460 , 5 )
		GiveBodyItem( PlayerID , 222928 , 1 )
	end

end

Function LuaI_204807(Option)
	local PlayerID = OwnerID()
	local PackageID = 204807
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202822 , 5 )
		GiveBodyItem( PlayerID , 202823 , 5 )
		GiveBodyItem( PlayerID , 201458 , 5 )
		GiveBodyItem( PlayerID , 201459 , 5 )
		GiveBodyItem( PlayerID , 203043 , 5 )
		GiveBodyItem( PlayerID , 202506 , 5 )
	end

end

Function LuaI_204808(Option)
	local PlayerID = OwnerID()
	local PackageID = 204808
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201095 , 5 )
		GiveBodyItem( PlayerID , 201097 , 5 )
		GiveBodyItem( PlayerID , 203040 , 5 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 203053 , 1 )
		GiveBodyItem( PlayerID , 202506 , 5 )
	end
end

Function LuaI_204809(Option)
	local PlayerID = OwnerID()
	local PackageID = 204809
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201458 , 10 )
		GiveBodyItem( PlayerID , 201459 , 10 )
		GiveBodyItem( PlayerID , 203043 , 10 )
		GiveBodyItem( PlayerID , 201088 , 1 )
		GiveBodyItem( PlayerID , 201238 , 1 )
		GiveBodyItem( PlayerID , 203054 , 1 )
		GiveBodyItem( PlayerID , 202506 , 10 )
	end

end

Function LuaI_205737(Option)
	local PlayerID = OwnerID()
	local PackageID = 205737
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201293 , 1 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201450 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
		GiveBodyItem( PlayerID , 201610 , 1 )
	end

end

Function LuaI_205926(Option) --������ضQ��§�]
	local PlayerID = OwnerID()
	local PackageID = 205926
	local NeedSpace = 14
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 223401 , 1 )
		GiveBodyItem( PlayerID , 223353 , 1 )
		GiveBodyItem( PlayerID , 223354 , 1 )
		GiveBodyItem( PlayerID , 223355 , 1 )
		GiveBodyItem( PlayerID , 223356 , 1 )
		GiveBodyItem( PlayerID , 201237 , 2 )
		GiveBodyItem( PlayerID , 201097 , 5 )
		GiveBodyItem( PlayerID , 201610 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
	end
end

Function LuaI_205929(Option) --�ˤ����F§�]
	local PlayerID = OwnerID()
	local PackageID = 205929
	local NeedSpace = 14
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 222906 , 1 )
		GiveBodyItem( PlayerID , 222907 , 1 )
		GiveBodyItem( PlayerID , 222908 , 1 )
		GiveBodyItem( PlayerID , 222909 , 1 )
		GiveBodyItem( PlayerID , 222910 , 1 )
		GiveBodyItem( PlayerID , 201237 , 2 )
		GiveBodyItem( PlayerID , 201097 , 5 )
		GiveBodyItem( PlayerID , 201610 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
	end

end

Function LuaI_205928(Option) --�ѪŶ¦�§�]
	local PlayerID = OwnerID()
	local PackageID = 205928
	local NeedSpace = 14
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 223427 , 1 )
		GiveBodyItem( PlayerID , 205857 , 1 )
		GiveBodyItem( PlayerID , 222926 , 1 )
		GiveBodyItem( PlayerID , 222925 , 1 )
		GiveBodyItem( PlayerID , 201139 , 1 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 203053 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 205547 , 1 )
		GiveBodyItem( PlayerID , 201365 , 1 )
		GiveBodyItem( PlayerID , 201610 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
		GiveBodyItem( PlayerID , 203329 , 1 )

	end
end

Function LuaI_205927(Option) --���F�w��§�]
	local PlayerID = OwnerID()
	local PackageID = 205927
	local NeedSpace = 13
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 205857 , 1 )
		GiveBodyItem( PlayerID , 222926 , 1 )
		GiveBodyItem( PlayerID , 222925 , 1 )
		GiveBodyItem( PlayerID , 201139 , 1 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 203053 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 205547 , 1 )
		GiveBodyItem( PlayerID , 201365 , 1 )
		GiveBodyItem( PlayerID , 201610 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
		GiveBodyItem( PlayerID , 203329 , 1 )
	end
end

Function LuaI_205958(Option) --�s��_�I§�]
	local PlayerID = OwnerID()
	local PackageID = 205958
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202451 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201619 , 1 )
		GiveBodyItem( PlayerID , 530311 , 1 )
	end
end

Function LuaI_205907(Option) --������§�]
	local PlayerID = OwnerID()
	local PackageID = 205907
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--GiveBodyItem( PlayerID , 202451 , 1 )
		GiveBodyItem( PlayerID , 201139 , 6 )
		GiveBodyItem( PlayerID , 203289 , 1 )
		--GiveBodyItem( PlayerID , 530311 , 1 )
	end
end

Function LuaI_205999(Option) --�W���~§�]
	local PlayerID = OwnerID()
	local PackageID = 205999
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201139 , 3 )
		GiveBodyItem( PlayerID , 201134 , 10 )
		GiveBodyItem( PlayerID , 203035 , 1 )
		GiveBodyItem( PlayerID , 203674 , 1 )
	end
end

Function LuaI_206047(Option) --��o§�]
	local PlayerID = OwnerID()
	local PackageID = 206047
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 222925 , 1)
		GiveBodyItem( PlayerID , 222926 , 1 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 203489 , 5 )
		GiveBodyItem( PlayerID , 203162 , 4 )
	end
end

Function LuaI_206048(Option) --��������§�]
	local PlayerID = OwnerID()
	local PackageID = 206048
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201141 , 3)
		GiveBodyItem( PlayerID , 201139 , 1 )
		GiveBodyItem( PlayerID , 205547 , 1 )
		GiveBodyItem( PlayerID , 202435 , 5 )
		GiveBodyItem( PlayerID , 202903 , 5 )
	end
end
Function LuaI_206096(Option) --�饻��ѡ����զX
	local PlayerID = OwnerID()
	local PackageID = 206096
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 200137 , 5)
		GiveBodyItem( PlayerID , 530383 , 1 )
	end
end
Function LuaI_206097(Option) --�饻�s��զX
	local PlayerID = OwnerID()
	local PackageID = 206097
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201141 , 1)
		GiveBodyItem( PlayerID , 201619 , 1 )
	end
end
Function LuaI_206098(Option) --�饻�ڪ��p�βզX
	local PlayerID = OwnerID()
	local PackageID = 206098
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202435 , 3)
		GiveBodyItem( PlayerID , 202902 , 3)
		GiveBodyItem( PlayerID , 202903 , 3 )
	end
end
Function LuaI_206099(Option) --�饻�����զX
	local PlayerID = OwnerID()
	local PackageID = 206099
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201971 , 1)
		GiveBodyItem( PlayerID , 201134 , 1 )
	end
end
Function LuaI_206100(Option) --�饻�B�ʤ���զX
	local PlayerID = OwnerID()
	local PackageID = 206100
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203591 , 1)
		GiveBodyItem( PlayerID , 202904 , 2 )
		GiveBodyItem( PlayerID , 202902 , 2 )
	end
end
Function LuaI_206101(Option) --�饻Ū�Ѥ���զX
	local PlayerID = OwnerID()
	local PackageID = 206101
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202931 , 1)
		GiveBodyItem( PlayerID , 202717 , 1 )
	end
end
Function LuaI_206102(Option) --�饻Ū�Ѥ���զX
	local PlayerID = OwnerID()
	local PackageID = 206102
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201448 , 1)
		GiveBodyItem( PlayerID , 201449 , 1 )
		GiveBodyItem( PlayerID , 203041 , 1)
		GiveBodyItem( PlayerID , 202881 , 1 )
	end
end

Function LuaI_206128(Option) --�_�I��§�]
	local PlayerID = OwnerID()
	local PackageID = 206128
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 204802 , 1)
		GiveBodyItem( PlayerID , 204763 , 1 )		
	end
end

Function LuaI_206137(Option) --�洫BC§��
	local PlayerID = OwnerID()
	local PackageID = 206137
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202435 , 3)				
	end
end

Function LuaI_206136(Option) --�ֿn�洫2000BC§��
	local PlayerID = OwnerID()
	local PackageID = 206136
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203591 , 1)				
	end
end

Function LuaI_206135(Option) --�ֿn�洫5000BC§��
	local PlayerID = OwnerID()
	local PackageID = 206135
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203591 , 1)				
		GiveBodyItem( PlayerID , 201097 , 1)
		GiveBodyItem( PlayerID , 203040 , 1)
	end
end

Function LuaI_206134(Option) --�ֿn�洫10000BC§��
	local PlayerID = OwnerID()
	local PackageID = 206134
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201619 , 2)				
		GiveBodyItem( PlayerID , 203591 , 2)
		GiveBodyItem( PlayerID , 201095 , 1)
		GiveBodyItem( PlayerID , 201097 , 2)
		GiveBodyItem( PlayerID , 203040 , 2)
	end
end

Function LuaI_206160(Option) --�}�ݶ����p�y��
	local PlayerID = OwnerID()
	local PackageID = 206160
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202881 , 1)				
		GiveBodyItem( PlayerID , 202928 , 1)
	end
end

Function LuaI_206161(Option) --�k��������
	local PlayerID = OwnerID()
	local PackageID = 206161
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201508 , 1)	
		GiveBodyItem( PlayerID , 201603 , 1)		
		GiveBodyItem( PlayerID , 201504 , 1)
	end
end

Function LuaI_206162(Option) --�x�T�y����
	local PlayerID = OwnerID()
	local PackageID = 206162
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902 , 2)	
		GiveBodyItem( PlayerID , 202903 , 2)		
		GiveBodyItem( PlayerID , 202904, 2)
	end
end

Function LuaI_206163(Option) --����h��
	local PlayerID = OwnerID()
	local PackageID = 206163
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201619, 1)
		GiveBodyItem( PlayerID ,200807, 1)
	end
end

Function LuaI_206229(Option) --���F§�]
	local PlayerID = OwnerID()
	local PackageID = 206229
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203090, 3)
		GiveBodyItem( PlayerID ,206221, 3)
		GiveBodyItem( PlayerID ,203086, 3)
	end
end

Function LuaI_206230(Option) --���§�]
	local PlayerID = OwnerID()
	local PackageID = 206230
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203086, 3)
		GiveBodyItem( PlayerID ,203088, 3)
		GiveBodyItem( PlayerID ,203090, 3)
	end
end

Function LuaI_206232(Option) --����OB§��
	local PlayerID = OwnerID()
	local PackageID = 206232
	local NeedSpace = 12
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201610, 3)
		GiveBodyItem( PlayerID ,202434, 3)
		GiveBodyItem( PlayerID ,201141, 3)
		GiveBodyItem( PlayerID ,201139, 3)
		GiveBodyItem( PlayerID ,203591, 1)
		GiveBodyItem( PlayerID ,202800, 1)
		GiveBodyItem( PlayerID ,204283, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202506, 3)
		GiveBodyItem( PlayerID ,202903, 3)
	end
end

Function LuaI_206233(Option) --Dungeon Survivor Bag
	local PlayerID = OwnerID()
	local PackageID = 206233
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203525, 1)		
		GiveBodyItem( PlayerID ,203877, 2)		
		GiveBodyItem( PlayerID ,203415, 1)		
		GiveBodyItem( PlayerID ,201141, 1)		
		GiveBodyItem( PlayerID ,202506, 1)
		GiveBodyItem( PlayerID ,201458, 1)
		GiveBodyItem( PlayerID ,201459, 1)
		GiveBodyItem( PlayerID ,203043, 1)		
	end
end

Function LuaI_206244(Option) --Lv20���y�]
	local PlayerID = OwnerID()
	local PackageID =  206244
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201460, 1)		
		GiveBodyItem( PlayerID ,203525, 1)		
		GiveBodyItem( PlayerID ,201619, 3)				
	end
end

Function LuaI_206226(Option) --Lv10���y�]
	local PlayerID = OwnerID()
	local PackageID =  206226
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203155, 2)		
		GiveBodyItem( PlayerID ,201971, 1)			
	end
end

Function LuaI_206231(Option) --Lv15���y�]
	local PlayerID = OwnerID()
	local PackageID =  206231
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,202902, 5)		
		GiveBodyItem( PlayerID ,203784, 5)		
		GiveBodyItem( PlayerID ,202434, 1)				
	end
end

Function LuaI_206245(Option) --Lv25���y�]
	local PlayerID = OwnerID()
	local PackageID = 206245
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local Country = "kr"

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Language == Country then
			DebugMsg( 0 , 0 , "Language ="..Language )
			GiveBodyItem( PlayerID , 204073 , 1)		
			GiveBodyItem( PlayerID , 201237 , 1)
		else
			DebugMsg( 0 , 0 , "Language ="..Language )
			GiveBodyItem( PlayerID , 202881 , 1)		
			GiveBodyItem( PlayerID , 204073 , 1)		
			GiveBodyItem( PlayerID , 201237 , 1)
		end
	end
end
Function LuaI_206313(Option) --�饻§�]�@
	local PlayerID = OwnerID()
	local PackageID = 206313
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201609, 1)		
		GiveBodyItem( PlayerID ,202902, 3)		
		GiveBodyItem( PlayerID ,202903, 3)						
	end
end
Function LuaI_206312(Option) --�饻§�]�G
	local PlayerID = OwnerID()
	local PackageID = 206312
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,205547, 1)		
		GiveBodyItem( PlayerID ,203525, 1)		
		GiveBodyItem( PlayerID ,201610, 1)						
	end
end
Function LuaI_206311(Option) --��ߪ̥�§�]
	local PlayerID = OwnerID()
	local PackageID = 206311
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201971, 1)		
		GiveBodyItem( PlayerID ,202903, 1)		
		GiveBodyItem( PlayerID ,202435, 1)
		GiveBodyItem( PlayerID ,202902, 1)						
	end
end

Function LuaI_206320(Option) --�֭p10000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206320
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203525, 1)		
		GiveBodyItem( PlayerID ,201610, 1)		
		GiveBodyItem( PlayerID ,201448, 1)
		GiveBodyItem( PlayerID ,201449, 1)
		GiveBodyItem( PlayerID ,203041, 1)						
	end
end

Function LuaI_206321(Option) --�֭p5000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206321
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201087, 1)		
		GiveBodyItem( PlayerID ,201237, 1)		
		GiveBodyItem( PlayerID ,203053, 1)
								
	end
end
Function LuaI_206322(Option) --�֭p2000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206322
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201134, 1)		
	end
end
Function LuaI_206323(Option) --��ιD��զX
	local PlayerID = OwnerID()
	local PackageID = 206323
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201134, 1)		
		GiveBodyItem( PlayerID ,201610, 1)		
		GiveBodyItem( PlayerID ,201619, 1)
		GiveBodyItem( PlayerID ,203591, 1)						
	end
end
Function LuaI_206384(Option) --�֭p2000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206384
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201610, 1)						
	end
end
Function LuaI_206385(Option) --�֭p5000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206385
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201448, 1)		
		GiveBodyItem( PlayerID ,201449, 1)		
		GiveBodyItem( PlayerID ,203041, 1)						
	end
end
Function LuaI_206386(Option) --�֭p10000BC§�]
	local PlayerID = OwnerID()
	local PackageID = 206386
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203525, 1)		
		GiveBodyItem( PlayerID ,201450, 1)		
		GiveBodyItem( PlayerID ,201457, 1)
		GiveBodyItem( PlayerID ,203042, 1)						
	end
end

Function LuaI_206246(Option) --�y���}�ӫ��g��J
	local PlayerID = OwnerID()
	local PackageID = 206246
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201610, 10)		
		GiveBodyItem( PlayerID ,201134, 10)		
		GiveBodyItem( PlayerID ,201445, 10)							
	end
end

Function LuaI_206247(Option) --�y���}�ӫ����ֳJ
	local PlayerID = OwnerID()
	local PackageID = 206247
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203525, 3)		
		GiveBodyItem( PlayerID ,201139, 3)		
		GiveBodyItem( PlayerID ,201141, 3)
		GiveBodyItem( PlayerID ,201445, 25)						
	end
end

Function LuaI_206438(Option) --�y���}�ӫ��J1
	local PlayerID = OwnerID()
	local PackageID = 206438
	local NeedSpace = 13
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,202928, 10)		
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)		
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202881, 1)
		GiveBodyItem( PlayerID ,202506, 5)
	end
end

Function LuaI_206439(Option) --�y���}�ӫ��J2
	local PlayerID = OwnerID()
	local PackageID = 206439
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,222928, 1)		
		GiveBodyItem( PlayerID ,201610, 10)		
		GiveBodyItem( PlayerID ,201619, 10)					
	end
end

Function LuaI_206440(Option) --�y���}�ӫ��J3
	local PlayerID = OwnerID()
	local PackageID = 206440
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,222927, 1)		
		GiveBodyItem( PlayerID ,201134, 10)		
		GiveBodyItem( PlayerID ,201619, 10)								
	end
end

Function LuaI_206474(Option) --�y���}�ӫ��Z���j�ƳJ
	local PlayerID = OwnerID()
	local PackageID = 206474
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201087, 1)		
		GiveBodyItem( PlayerID ,206338, 10)		
		GiveBodyItem( PlayerID ,202506, 2)		
		GiveBodyItem( PlayerID ,202928, 1)		
		GiveBodyItem( PlayerID ,201093, 1)		
		GiveBodyItem( PlayerID ,202903, 2)		
		GiveBodyItem( PlayerID ,202435, 2)								
	end
end

Function LuaI_206475(Option) --�y���}�ӫ�����j�ƳJ
	local PlayerID = OwnerID()
	local PackageID = 206475
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,201237, 1)		
		GiveBodyItem( PlayerID ,206339, 10)		
		GiveBodyItem( PlayerID ,202506, 2)		
		GiveBodyItem( PlayerID ,202928, 1)		
		GiveBodyItem( PlayerID ,201093, 1)		
		GiveBodyItem( PlayerID ,202903, 2)		
		GiveBodyItem( PlayerID ,202435, 2)								
	end
end

Function LuaI_206476(Option) --�y���}�ӫ����~�j�ƳJ
	local PlayerID = OwnerID()
	local PackageID = 206476
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID ,203053, 1)		
		GiveBodyItem( PlayerID ,206340, 10)		
		GiveBodyItem( PlayerID ,202506, 2)		
		GiveBodyItem( PlayerID ,202928, 1)		
		GiveBodyItem( PlayerID ,201093, 1)		
		GiveBodyItem( PlayerID ,202903, 2)		
		GiveBodyItem( PlayerID ,202435, 2)								
	end
end

Function LuaI_206553(Option)
	local PlayerID = OwnerID()
	local PackageID = 206553
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201134 , 20 )
		GiveBodyItem( PlayerID , 201460 , 5 )
		GiveBodyItem( PlayerID , 225216 , 1 )
	end

end

Function LuaI_206554(Option)
	local PlayerID = OwnerID()
	local PackageID = 206554
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201610 , 20 )
		GiveBodyItem( PlayerID , 201460 , 5 )
		GiveBodyItem( PlayerID , 225217 , 1 )
	end

end