

function LuaS_420829_2()--�Ŧ��Ĥ����ˬd
	if ReadRoleValue(TargetID(), EM_RoleValue_OrgID)==100675 then
		if CheckBuff( TargetID() , 500447) then
			return true
		else
			return false
		end
	else
		return false
	end
end 

function LuaS_420829_3()--�Ŧ��Ĥ����ϥ�
	CancelBuff( TargetID() , 500447)--�����L�Ī��A
	WriteRoleValue(TargetID(),EM_RoleValue_PID,OwnerID())
	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("EM_420829_0") , 0 )		--�A���\�}�ѤF�]�������m�I
end




function LuaS_100675()
	local maxhp=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) --�ŧi�̤j����q
	local hp=ReadRoleValue(OwnerID(),EM_RoleValue_HP) -- �ŧi�ثe����q
	local Shield=false --�ŧi�@�ު��A
	local Player={}  --�ŧi�Ű}�C
	WriteRoleValue ( OwnerID() ,EM_RoleValue_PID , 0 )  --�M�Ŧۤv��PID
	local Breaker = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --�NPID�e�� Breaker ����

	while true do --�L���j��
		maxhp=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) --���s���HP�̤j��
		hp=ReadRoleValue(OwnerID(),EM_RoleValue_HP) --���s���HP ��
		Breaker = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --���s��� PID ��

		
		if hp/maxhp < 0.77 then  --�p�G��֩�ʤ����C�Q�C
			
			if Breaker == 0 then -- �p�GPID�����٨S�����a
				CastSpell(OwnerID(),OwnerID(),491207)--�}�ҵL��
				Player = SearchRangePlayer ( OwnerID(), 325 ) --������񪺪��a

				for i=0 , table.getn(Player) do
					if Player[i]~= -1 then
						ScriptMessage( OwnerID(), Player[i] , 2, GetString("EM_100675_1") , 0 )--��ڶ�w���~���ܱo�M�j���J�A�������I�I
						if CheckAcceptQuest( Player[i] , 420827) then
							SetFlag( Player[i], 540947, 1 )--��������
						end
					end
				end
			else
				if CheckID( Breaker ) then --�p�G PID �������a��� �B�Ӫ��a�٦b�u�W
					if GetDistance( OwnerID(), Breaker  ) >310 then -- �p�G�Ӫ��a���o�ӻ�
						WriteRoleValue ( OwnerID() ,EM_RoleValue_PID , 0 ) --���gPID�� 0 (�S�����a )
						CastSpell(OwnerID(),OwnerID(),491207)--�}�ҵL��
						Player = SearchRangePlayer ( OwnerID(), 310 ) --�j�M���񪺪��a
						for i=0 , table.getn(Player) do
							if Player[i]~=-1 then
								ScriptMessage( OwnerID(), Player[i] , 2, GetString("EM_100675_1") , 0 )--��ڶ�w���~���ܱo�M�j���J�A�������I�I
								if CheckAcceptQuest( Player[i] , 420827) then
									SetFlag( Player[i], 540947, 1 )--��������
								end
							end
						end
					end
				end
			end
		end
		Sleep(10)
	end
end




--�H�U�O25�Ū��@��