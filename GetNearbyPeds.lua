function GetNearbyPeds(coords, distance)
    local peds = {}
    local allEntities = {}
    
    for _, entity in ipairs(GetGamePool("CObject")) do
        table.insert(allEntities, entity)
    end
    for _, entity in ipairs(GetGamePool("CPed")) do
        table.insert(allEntities, entity)
    end

    for _, entity in ipairs(allEntities) do
        if DoesEntityExist(entity) and IsEntityAPed(entity) and not IsPedAPlayer(entity) and entity ~= GetPlayerPed(-1) then
            local entityCoords = GetEntityCoords(entity)
            local dist = #(coords - entityCoords)
            
            if dist <= distance then
                table.insert(peds, entity)
            end
        end
    end
    
    return peds
end
