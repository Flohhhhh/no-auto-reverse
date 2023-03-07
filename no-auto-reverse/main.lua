local braking = false
local shouldReverse = true

CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local speed = GetEntitySpeed(vehicle) * 2.236936
        if not vehicle then goto continue end

        
        if braking and speed > 0 then
            shouldReverse = false
        else
            shouldReverse = true
        end

        if not shouldReverse then
            --SetVehicleBrake(vehicle, true)
            --SetVehicleUndriveable(vehicle, true)
            SetVehicleMaxSpeed(vehicle, 0.001)
        else
            SetVehicleMaxSpeed(vehicle, 0)
        end

        ::continue::
        Wait(500)
    end
end)

CreateThread(function()
    while true do
        if IsControlPressed(1, 72) then
            braking = true
        else
            braking = false
        end
        Wait(0)
    end
end)
