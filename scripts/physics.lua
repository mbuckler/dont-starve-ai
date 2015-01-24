--this is called back by the engine side

PhysicsCollisionCallbacks = {}
function OnPhysicsCollision(guid1, guid2)
	local i1 = Ents[guid1]
	local i2 = Ents[guid2]
    --local file = io.open("trex.txt","a+")
    --file:write("HELLO")
    --file:close()

    local file = assert(io.open("playerdata.txt", "w"))
    file:write(GetPlayer().components.hunger:GetPercent().."\n")
    file:write(GetPlayer().components.sanity:GetPercent().."\n")
    file:write(GetPlayer().components.health:GetPercent().."\n")
    file:write(GetWorld().components.clock:GetPhase().."\n")
    file:write(GetWorld().components.clock:GetNormEraTime().."\n")
    file:write(c_pos(GetPlayer()).x)
    file:write(c_pos(GetPlayer()).y)
    file:close()
    
    print("also1")
	if PhysicsCollisionCallbacks[guid1] then
		PhysicsCollisionCallbacks[guid1](i1, i2)
	end

	if PhysicsCollisionCallbacks[guid2] then
		PhysicsCollisionCallbacks[guid2](i2, i1)
	end

end
