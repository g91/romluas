function Hsiang_OpenSuitSkill()
	CloseSpeak( OwnerID() )--���e�s�W�A�ت��b�������e�@�ӹ�ܮ�
	OpenSuitSkill()
end

function Hsiang_SetModelScale( x )
	SetModelScale( OwnerID() , x/100 ) 
end

function Hsiang_SetRoleValue( type , value )
	WriteRoleValue( OwnerID() , type , Value )
end

function Hsiang_AddBuff( BuffID , lv )
	AddBuff(OwnerID() , BuffID , Lv  , -1 )
end

function Hsiang_GetDBKeyValue(  )
	Say( OwnerID() ,  GetDBKeyValue('ExItemID_00') )

end

function Hsiang_OpenRare3EqExchange()
	OpenRare3EqExchangeItem()
end