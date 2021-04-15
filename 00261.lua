function LuaS_110099_0()

	if CheckCompleteQuest( OwnerID(), 420161 ) == true and CheckFlag( OwnerID(), 540249) ~= true then  
		SetSpeakDetail( OwnerID(), GetString("ST_110099_0")   );
		--/*�n�a�I�ڴN��o�G�Ƨi�D�A�G
		--�b�s�諸�R���ե�����A�̥X�W���H�n��O�j�_�I�a�u�D�S���­}�ڡv�F�A�­}�ڱq�Q�@���}�l�N�b�o�����v�_
		--�I�A�T�Q�~�����v�ͲP�A�o���X�Ӫ��_�æh���ӼơC�i�O�b�L�|�Q���ɡA�o��M�q�o�����v�����θ�A�A�]�S��
		--�H���D�L���U���A���L�A�H�̧����ߪ��O�A�L�ҫ����X�Ӫ��_�áA�쩳�æb���̡H

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_1") , "LuaS_110099_1", 0 ) 
		--/*�o�G�Ƨڦۤp�N�ռ���ԤF�A���ȳs�����a��b���̡H

	else
		LoadQuestOption( OwnerID() );	--���J���ȡA�b���F���Ȥ���n����
	end
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110099_1")   );
	--/*���ȳs�����a��N�b��G�u�D�S���­}�ڡv�_�èS�H���D�b���̡A���O�ڭˬO���ǽu���A���L��ڷQ���ոէA�O�_����
	--  �����i��h�����o���K�C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_2") , "LuaS_110099_2", 0 ) 
	--/*�����Ӧp���ҩ��ڪ��i��H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110099_2")   );
	--/*�p�G�A������ӳ��h���ǪF��^�ӡA�ڱN�|��کҪ��D���u�����ɵ��A�A�o�O�ܦM�I���@��ơA�n���n�h�A�ۤv��
	--  �{�M���C�p�G�@�N���ܡA�A�ӧ�ڡI
	SetFlag( OwnerID() , 540249, 1)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110099_0") , "LuaS_110099_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110099_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end
--------------------------------------------------------------------------------------------------------------------
Function LuaI_110124() 

	SetPlot( OwnerID() , "touch" , "LuaQ_420163_ClickObj" , 40 )

END
--------------------------------------------------------------------------------------------------------------------
Function LuaQ_420163_ClickObj()

	if CheckFlag( OwnerID(), 540250) ~= true and CountBodyItem( OwnerID(), 200687) > 0 then -- �����a���Ѥ���ᤣ��A�����s�X��
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
		BeginPlot( TargetID(),"LuaQ_420163_Sum",0)	
	end

END
--------------------------------------------------------------------------------------------------------------------
function LuaQ_420163_Sum()

	local Owner = Role:new( OwnerID() )
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	local X = Owner:X() 
	local Y = Owner:Y() 
	local Z = Owner:Z()
	local SeaDog_A = CreateObj( 100038, X+50 , Y ,  Z, 0 , 1 )--�Ǫ��N��
	local SeaDog_B = CreateObj( 100038, X, Y ,  Z+50, 0 , 1 )--�Ǫ��N��
	local SeaDog_C = CreateObj( 100038, X-50 , Y ,  Z-50, 0 , 1 )--�Ǫ��N��

	AddToPartition( SeaDog_A,0)
	AddToPartition( SeaDog_B,0)
	AddToPartition( SeaDog_C,0)
	BeginPlot(SeaDog_A,"LuaQ_420163_Sui",0)
	BeginPlot(SeaDog_B,"LuaQ_420163_Sui",0)
	BeginPlot(SeaDog_C,"LuaQ_420163_Sui",0)
	SetAttack( SeaDog_A , TargetID() )
	SetAttack( SeaDog_B , TargetID() )
	SetAttack( SeaDog_C , TargetID() )
	sleep(30)
	while 1 do

		if CheckID(SeaDog_A) == false and CheckID(SeaDog_B) == false and CheckID(SeaDog_C) == false then

			if  Luafunc_Player_Alive( TargetID(),DBID,150 ) == true or ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
					--��O�N�����S��
					Hide( OwnerID())
					SetFlag( TargetID(),540250,1)
			end
			break
		end
		sleep( 30 )
	end
	sleep( 200 )
	Show( OwnerID() ,0)
	SetPlot( OwnerID() , "touch" , "LuaQ_420163_ClickObj" , 40 )
	
end
--------------------------------------------------------------------------------------------------------------------
function LuaQ_420163_Sui() 
	LuaFunc_Obj_Suicide(300)
end	
---------------------------------------------------------------------