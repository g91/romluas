function LuaS_110497_0()
--DeBugMSG(0,0,GetServerDataLanguage())
	LoadQuestOption( OwnerID() )
	if CountBodyItem(OwnerID() , 200208 ) > 0 then
		if	GetServerDataLanguage()  == "kr"	then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_110497_A]", "LuaS_110497_2",0 )	--�������Z��(����)
		else
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_110497_A]", "LuaS_110497_1",0 )	
		end
	end
end

function LuaS_110497_1()
	SetSpeakDetail( OwnerID(), "[SC_110497_1]" )
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_110497_2]", "LuaS_110497_2",0 );
	AddSpeakOption( OwnerID(), TargetID(),  "[SC_110497_3]", "LuaS_110497_3",0 );
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_110497_0",0 );
end

function LuaS_110497_2()
	CloseSpeak(OwnerID() )
	local Weapon = {[1] = 211492 , [2] = 211493 , [3] = 211493 , [4] = 211494 , [5] = 211494 , [6] = 211492  , [7] = 211492 , [8] = 211494   }
	local Class = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	if CountbodyItem(OwnerID() , 200208 ) > 0 then
		DelBodyItem( OwnerID() , 200208 , 1 )
		GiveBodyItem_EQ(OwnerID() ,Weapon[Class] ,1 ,0 )
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_110497_5]",0)	
	end

end

function LuaS_110497_3()
	CloseSpeak(OwnerID() )
	BeginPlot( OwnerID() , "LuaS_110497_4" , 0 )
end

function LuaS_110497_4()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "[SC_110497_4]"); 
		DialogSelectStr( OwnerID() , "[SO_YES]" );
		DialogSelectStr( OwnerID() , "[SO_NO]" );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
			local Weapon = {[1] = 211492 , [2] = 211493 , [3] = 211493 , [4] = 211494 , [5] = 211494 , [6] = 211492  , [7] = 211492 , [8] = 211494   }
			local Class = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account  ) >0 and CountBodyItem(OwnerID() , 200208 ) > 0 then
	 			if AddMoney_Account( OwnerID() ,  EM_ActionType_PlotGive , -1 )==true then--���a��I1���p�A��o�@���W���Z���ɯ�
					DelBodyItem( OwnerID() , 200208 , 1 )
					GiveBodyItem_EQ(OwnerID() ,Weapon[Class] ,3 ,0 )
				else
					ScriptMessage(OwnerID(),OwnerID(),1,"[SC_EXCHANGE_FAIL]",0);
				end
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_110497_5]",0)	
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end