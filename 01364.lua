function LuaS_422311_0()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422311_1]" ) 
	SLEEP(10)
	Say( OwnerID() , "[SC_422311_2]" )
	SLEEP(10)
	Say( OwnerID() , "[SC_422311_3]" )
	SLEEP(10)
	DisableQuest( OwnerID() , false ) 
END
---------------------------------------
function LuaS_422313()  --§�����ͬ�����
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422313)==true )and( CheckCompleteQuest( OwnerID() , 422313) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422313]","LuaS_422313_0",0) --�S��.......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422313_0]","LuaS_422313_1",0) --�k�h�A����O§���W�d�H
	end
end

function LuaS_422313_0()
	CloseSpeak( OwnerID() )
end

function LuaS_422313_1()  
	SetSpeakDetail(OwnerID(),"[SC_422313_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422313_3]","LuaS_422313_2",0)	--�����F.......
end

function LuaS_422313_2()  
	SetFlag(OwnerID() ,542655, 1 )
	CloseSpeak( OwnerID())
end

-------------------------------------------------------------------
function LuaS_422318()  --�ѻP�սm�C��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422318)==true )and( CheckCompleteQuest( OwnerID() , 422318) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422318_0]","LuaS_422318_0",0) --���A���٨S�����n�߲z�ǳơI
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422318_1]","LuaS_422318_1",0) --��A�ڤw�g�ǳƦn�F�I
	end
end

function LuaS_422318_0()
                SetSpeakDetail(OwnerID(),"[SC_422318_2]") ---�����A���n�U���ǳƮɡA�Чi���ڡI�ڥH���F�t�����W�_�}�A�o����O�Ӧ��쪺�շҹC���I
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422318",0) 
end

function LuaS_422318_1()  
	SetSpeakDetail(OwnerID(),"[SC_422318_3]") --- �o�O�ө������M�w�I�۫H�ۤv�N���w���|�X���I
                SetFlag(OwnerID() ,542662, 1 )
               AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422318",0) 
end
---------------------------------------------------
function LuaI_204593() --�ܽШ示�e
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_204593]");
	ShowBorder( OwnerID(), 0, "[204593]" , "ScriptBorder_Texture_Paper" );
end


----------------
function LuaI_422322() 
	if	CheckCompleteQuest(OwnerID(),422322)	then
		SetSpeakDetail(OwnerID(),"[SC_422322]")
	else
		SetSpeakDetail(OwnerID(),"[SC_422322_1]")
	end
end