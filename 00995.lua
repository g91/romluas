function yuyu_111593_0() --ñ���I1

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


		if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO	
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111593_1", 0 ) --�ڭnñ��
		end


end

function yuyu_111593_1()	

	local Map =  CheckFlag( OwnerID()  , 542154 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX1_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX1_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX1_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX1_0()

	SetFlag( OwnerID()  , 542154 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end
---------------------------------
function yuyu_111594_0() --ñ���I2

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end



			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111594_1", 0 ) --�ڭnñ��
			end

end

function yuyu_111594_1()	
	local Map =  CheckFlag( OwnerID()  , 542155 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX2_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX2_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX2_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX2_0()

	SetFlag( OwnerID()  , 542155 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end
---------------------------------
function yuyu_111595_0() --ñ���I3

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111595_1", 0 ) --�ڭnñ��
			end

end

function yuyu_111595_1()	
	local Map =  CheckFlag( OwnerID()  , 542156 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX3_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX3_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX3_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX3_0()

	SetFlag( OwnerID()  , 542156 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end

---------------------------------
function yuyu_111596_0() --ñ���I4

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111596_1", 0 ) --�ڭnñ��
			end

end

function yuyu_111596_1()	
	local Map =  CheckFlag( OwnerID()  , 542157 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX4_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX4_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX4_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX4_0()

	SetFlag( OwnerID()  , 542157 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end


function yuyu_111597_0() --ñ���I5

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111597_1", 0 ) --�ڭnñ��
			end


end

function yuyu_111597_1()	

	local Map =  CheckFlag( OwnerID()  , 542158 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX5_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX5_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX5_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX5_0()

	SetFlag( OwnerID()  , 542158 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end
---------------------------------
function yuyu_111598_0() --ñ���I6

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111598_1", 0 ) --�ڭnñ��
			end

end

function yuyu_111598_1()	
	local Map =  CheckFlag( OwnerID()  , 542159 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX6_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX6_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX6_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX6_0()

	SetFlag( OwnerID()  , 542159 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end
---------------------------------
function yuyu_111599_0() --ñ���I7

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111599_1", 0 ) --�ڭnñ��
			end

end

function yuyu_111599_1()	
	local Map =  CheckFlag( OwnerID()  , 542160 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX7_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX7_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX7_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX7_0()

	SetFlag( OwnerID()  , 542160 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end

---------------------------------
function yuyu_111600_0() --ñ���I8

	LoadQuestOption( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		for i = 0 , Count do                                                           --�ˬdbufftype
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end


			if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_00")   )--�z�A�n�Ū�����C�A�ڬO�ʰ��j�C�檺ñ��B�޲z���A�ݭn����A�ȩO
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_01") , "yuyu_111600_1", 0 ) --�ڭnñ��
			end


end

function yuyu_111600_1()	
	local Map =  CheckFlag( OwnerID()  , 542161 ) --�ˬd���W�X��
	local MapPlay =  CountBodyItem( OwnerID() , 203236) --�ʰ��j�C��a��

		if  MapPlay == 0  then
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_13")   ) --�S�a��
		elseif Map == false then

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_02")   )

				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_03") , "Lua_BOX8_0", 0 ) --�ڿ��1��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_04") , "Lua_BOX8_0", 0 ) --�ڿ��2��§��
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111577_YU_05") , "Lua_BOX8_0", 0 ) --�ڿ��3��§��
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--�z�A�A���I�]�S���Ŷ��o�I�Х���z�@�U�A�ӳ�I
			end	
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_06")   )  --�x�H�A�w�g��ñ��F��I
		end	


end

function Lua_BOX8_0()

	SetFlag( OwnerID()  , 542161 , 1 )  --�S���L���X��

	local P = 100
	local XX = Rand( P )   


	if XX >= 70 and XX <= 100 then   --30%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_07")   )
		GiveBodyItem( OwnerID() , 203238 , 1 ) --�n�ʻŸ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	elseif   XX >= 35 and XX <= 70 then   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_08")   )
		GiveBodyItem( OwnerID() , 203239 , 1 ) --�n�ʯ���§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	else   --35%
		SetSpeakDetail( OwnerID(), GetString("SC_111577_YU_09")   )
		GiveBodyItem( OwnerID() , 203240 , 1 ) --�n�ʸɵ�§��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "yuyu_111593_0", 0 ) --�^��W�@��
	end
end