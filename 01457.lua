--���եΫ��O

function LuaN_mika_09summerlove_test01() --�M�ٸ�
	Say(OwnerID(), " test message : delete title !" )
	DelBodyItem( OwnerID() , 530001 , 1 ) --�R�ٸ�
	DelBodyItem( OwnerID() , 530002 , 1 ) --�R�ٸ�
end

function LuaN_mika_09summerlove_test02() --�M�X��
	Say(OwnerID(), " test message : delete flag !" )
	SetFlag( OwnerID()  , 542981 , 0 ) -- �R �Ѩ϶i�椤(�@��)
	SetFlag( OwnerID()  , 542982 , 0 ) -- �R �c�]�i�椤(�@��)
	SetFlag( OwnerID()  , 542978 , 0 ) -- �R �Ѩ�(����)
	SetFlag( OwnerID()  , 542979 , 0 ) -- �R �c�](����)
	SetFlag( OwnerID()  , 542983 , 0 ) -- �R �Ѩ϶i�椤(�ӫ�)
	SetFlag( OwnerID()  , 542984 , 0 ) -- �R �c�]�i�椤(�ӫ�)
	SetFlag( OwnerID()  , 542980 , 0 ) -- �R �i�I������§��
	SetFlag( OwnerID()  , 542985 , 0 ) -- �R ���ѻ�L����§��
	SetFlag( OwnerID()  , 542973 , 0 ) -- �R �i�I������§��
	SetFlag( OwnerID()  , 542974 , 0 ) -- �R ���ѻ�L����§��
	SetFlag( OwnerID()  , 542987 , 0 ) -- �R ���ѻP�p�Ѩϥ���L
	SetFlag( OwnerID()  , 542989 , 0 ) -- �R ���ѻP�p�c�]����L
	SetFlag( OwnerID()  , 542993 , 0 ) -- �R �w���L���ʤ���
	SetFlag( OwnerID()  , 542994 , 0 ) -- �R �w���L�ҧ�����
	SetFlag( OwnerID()  , 542995 , 0 ) -- �R �w���L�p�Ѩ��d��
	SetFlag( OwnerID()  , 542996 , 0 ) -- �R �w���L�p�c�]�d��
end


function LuaN_mika_09summerlove_test03() --����buff���A
	Say(OwnerID(), " test message : All buff reset !" )
	CancelBuff( OwnerID(), 504156 ) -- �����R�ʨϪ�
	Sleep(10) 
	CancelBuff( OwnerID(), 504160 ) -- �����c�@�@�Ϫ�
	Sleep(10) 
	CancelBuff( OwnerID(), 504180 ) -- �����R�ʨϪ�(�ӫ�)
	Sleep(10) 
	CancelBuff( OwnerID(), 504181 ) -- �����c�@�@�Ϫ�(�ӫ�)
	Sleep(10) 
	CancelBuff( OwnerID(), 504161 ) -- ���� �߸Hbuff
	Sleep(10) 
	CancelBuff( OwnerID(), 504162 ) -- ���� ����buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504223 ) -- ���� �߸Hbuff
	Sleep(10) 
	CancelBuff( OwnerID(), 504335 ) -- ���� ����buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504157 ) -- ���� �C��buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504158 ) -- ���� �C��buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504222 ) -- ���� �߸Hbuff
	Sleep(10) 
	CancelBuff( OwnerID(), 504337 ) -- ���� ����buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504338 ) -- ���� �߸Hbuff
	Sleep(10) 
	CancelBuff( OwnerID(), 504339 ) -- ���� ����buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504220 ) -- ���� �C��buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504221 ) -- ���� �C��buff
	Sleep(10) 
	Say(OwnerID(), " test message : All reset ok ! " )
end

function LuaN_mika_09summerlove_test04()  -- ���R��buff 
	Say(OwnerID(), " test message : Give heart !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --���a���ʧO
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --�I�k��H���ʧO
	if BorG_Target == 0 then --��H�O�k��
		AddBuff( TargetID(), 504335, 1, 900 ) -- 
	elseif BorG_Target == 1 then --��H�O�k��
		AddBuff( TargetID(), 504162, 1, 900 ) -- 
	end
end

function LuaN_mika_09summerlove_test05()  -- ���߸Hbuff
	Say(OwnerID(), " test message : To be heartbroken !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --���a���ʧO
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --�I�k��H���ʧO
	if BorG_Target == 0 then --��H�O�k��
		AddBuff( TargetID(), 504223, 1, 900 ) -- 
	elseif BorG_Target == 1 then --��H�O�k��
		AddBuff( TargetID(), 504161, 1, 900 ) --
	end
end

function LuaN_mika_09summerlove_test06()  -- ���C��buff
	Say(OwnerID(), " test message : Be a frog !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --���a���ʧO
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --�I�k��H���ʧO

	if BorG_Target == 0 then --��H�O�k��
		AddBuff( TargetID(), 504158, 1, 900 ) -- �����buff
	elseif BorG_Target == 1 then --��H�O�k��
		AddBuff( TargetID(), 504157, 1, 900 ) -- ������buff
	end
end

function lua_mika_summerlove_test07() 
	AddBuff( OwnerID(),  504156, 0, 30) -- �Ѩ� �@��
	SetFlag( OwnerID()  , 542981 , 1 ) -- �Ѩ϶i�椤(�@��)
end

function lua_mika_summerlove_test08() 
	AddBuff( OwnerID(),  504160, 0, 30) -- �c�] �@��
	SetFlag( OwnerID()  , 542982 , 1 ) --  �c�]�i�椤(�@��)
end

function lua_mika_summerlove_test09() 
	AddBuff( OwnerID(),  504180, 0, 30) -- �Ѩ� mall
	SetFlag( OwnerID()  , 542983 , 1 ) -- �Ѩ϶i�椤(�ӫ�)
end

function lua_mika_summerlove_test10() 
	AddBuff( OwnerID(),  504181, 0, 30) -- �c�] mall
	SetFlag( OwnerID()  , 542984 , 1 ) -- �c�]�i�椤(�ӫ�)
end




