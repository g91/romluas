function LuaS_205066()--�������b

	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_113029_0]" );
	ShowBorder( OwnerID(), 0, "[205066]", "ScriptBorder_Texture_Paper" )	
end

function LuaS_113098()--�ݤ����F��

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_A]" , "LuaS_113098_1", 0 ) -- �ڭn�ϥ�100�Ӳů�ݤ�����1�i���Ťu�K�O��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_B]" , "LuaS_113098_2", 0 ) -- �ڭn�ϥ�30�i���Ťu�K�O�������@�i�M�a�Ťu�K�O��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_C]" , "LuaS_113098_3", 0 ) -- �ڭn�ϥ�10�i�M�a�Ťu�K�O������1�i�j�v�u�K�O��
end

function LuaS_113098_1()--�ݤ�������

	if (CountBodyItem( OwnerID(), 204918 )<100)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������

	elseif Lua_SafeGive( OwnerID() , 204898 , 1 )==true then
		DelBodyItem( OwnerID() , 204918 , 100 )
--		GiveBodyItem( OwnerID(), 204898, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113098_2()--���Ŵ��M�a

	if (CountBodyItem( OwnerID(), 204898 )<30)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������

	elseif Lua_SafeGive( OwnerID() , 204899 , 1 )==true then
		DelBodyItem( OwnerID() , 204898 , 30 )
--		GiveBodyItem( OwnerID(), 204899, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113098_3()--�M�a���j�v

	if (CountBodyItem( OwnerID(), 204899 )<10)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������

	elseif Lua_SafeGive( OwnerID() , 204897 , 1 )==true then
		DelBodyItem( OwnerID() , 204899 , 10 )
--		GiveBodyItem( OwnerID(), 204897, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113100()--�����ťN�����j�v

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_E]" , "LuaS_113100_1", 0 ) -- �ڭn�ϥ�2000�T�����ťN������1�i�j�v�u�K�O��
end

function LuaS_113100_1()

	if (CountBodyItem( OwnerID(), 203038 )<2000)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������

	elseif Lua_SafeGive( OwnerID() , 204897 , 1 )==true then
		DelBodyItem( OwnerID() , 203038 , 2000 )
--		GiveBodyItem( OwnerID(), 204897, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_113101()--�ݶ����i

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113101_0]" , "LuaS_113101_1", 0 ) -- �ΤO�V���A�N�ݶ����s���ů�ݤ�
end

function LuaS_113101_1()

	if (CountBodyItem( OwnerID(), 205631 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������

	elseif Lua_SafeGive( OwnerID() , 205644 , 1 )==true then
		DelBodyItem( OwnerID() , 205631 , 1 )
--		GiveBodyItem( OwnerID(), 205644, 1 )
		CloseSpeak( OwnerID() )
	end
end

function LuaS_205644()--�Ť�ݤ��]

	local R = Rand( 801 ) + 200
		if R==1000 then
			if (CountBodyItem( OwnerID(), 530378 )<1)then
				local A = Rand( 5 )
				if A == 4 then
					GiveBodyItem( OwnerID(), 530378, 1 )
					GiveBodyItem( OwnerID(), 204918, 30000 )
					CastSpell( OwnerID(),OwnerID(),493699)
				else
					GiveBodyItem( OwnerID(), 204918, R )
				end
			else
				GiveBodyItem( OwnerID(), 204918, R )
			end 
		else
			GiveBodyItem( OwnerID(), 204918, R )
	end
end

function LuaS_113319()--�֤��ഫ

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319]" , "LuaS_113319_1", 0 ) -- �������ഫ�Z���֤ߩҾA�Ϊ�¾�~
end

function LuaS_113319_1()

	if CheckBuff( OwnerID() , 504037)== true then
		SetSpeakDetail(OwnerID(),"[SC_113319_1]") --�֤ߥ��B��ܮz���A
	else
		SetSpeakDetail(OwnerID(),"[SC_113319_2]") --�ഫ���Iĵ�i
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_3]" , "LuaS_113319_check_1", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204900]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_4]" , "LuaS_113319_check_2", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204901]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_5]" , "LuaS_113319_check_3", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204902]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_6]" , "LuaS_113319_check_4", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204903]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_7]" , "LuaS_113319_check_5", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204904]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_8]" , "LuaS_113319_check_6", 0 ) -- �ڦҼ{�M���F�A�������ഫ[204905]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_11]" , "LuaS_113319_check_7", 0 ) -- �ڦҼ{�M���F�A�������ഫ[206692]�I
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113319_12]" , "LuaS_113319_check_8", 0 ) -- �ڦҼ{�M���F�A�������ഫ[206693]�I
	end
end

function LuaS_113319_check_1()

	if (CountBodyItem( OwnerID(), 204900 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204900 , OwnerID())
	end
end

function LuaS_113319_check_2()

	if (CountBodyItem( OwnerID(), 204901 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204901, OwnerID())
	end
end

function LuaS_113319_check_3()

	if (CountBodyItem( OwnerID(), 204902 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204902 , OwnerID())
	end
end

function LuaS_113319_check_4()

	if (CountBodyItem( OwnerID(), 204903 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204903, OwnerID())
	end
end

function LuaS_113319_check_5()

	if (CountBodyItem( OwnerID(), 204904 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204904 , OwnerID())
	end
end

function LuaS_113319_check_6()

	if (CountBodyItem( OwnerID(), 204905 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 204905, OwnerID())
	end
end

function LuaS_113319_check_7()

	if (CountBodyItem( OwnerID(), 206692 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 206692, OwnerID())
	end
end

function LuaS_113319_check_8()

	if (CountBodyItem( OwnerID(), 206693 )<1)then	
		SetSpeakDetail(OwnerID(),"[SC_113030_D]") --�A�ʤֻݭn������
	else
		CloseSpeak( OwnerID() )
		CallPlot( TargetID() , "LuaS_113319_2" , 206693, OwnerID())
	end
end

function LuaS_113319_2(obj , PPL)
	DisableQuest( OwnerID() , true )
	local x = Rand( 100 ) + 1 
	Say(OwnerID()   , "[SC_113319_9]" ) 
	sleep( 15 )
	Say(OwnerID()    , "[SC_113319_10]" )
	sleep( 15 )
	CastSpellLv( OwnerID() ,PPL , 493698, x ) 
	if CountBodyItem( PPL , obj ) > 0 then
		DelBodyItem( PPL, obj , 1 )
		AddBuff(PPL , 504037 , 0 , 86400 )  
		local R = Rand( 8 )
		if R== 0 then
			GiveBodyItem( PPL, 204900, 1 )
		elseif R==1 then
			GiveBodyItem( PPL, 204901, 1 )
		elseif R ==2 then
			GiveBodyItem( PPL, 204902, 1 )
		elseif R ==3 then
			GiveBodyItem( PPL , 204903, 1 )
		elseif R ==4 then
			GiveBodyItem( PPL , 204904, 1 )
		elseif R == 5 then
			GiveBodyItem( PPL , 204905, 1 )
		elseif R == 6 then
			GiveBodyItem( PPL ,  206692 , 1 )
		else
			GiveBodyItem( PPL ,206693 , 1 )
		end
	end
	DisableQuest( OwnerID() , false )  
end






