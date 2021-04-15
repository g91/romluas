function cucusee()
	local X = 1
	local Y = 3
	Say( OwnerID() , math.mod ( X , Y) )
end

function chuchufuck( X , Y)
	local A = math.floor ( X / Y )
	local B = math.mod ( X , Y)
	return A, B
end