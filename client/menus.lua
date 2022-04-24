RegisterNetEvent('AG_CountyAlive:RentalVehicleMenu')
AddEventHandler('AG_CountyAlive:RentalVehicleMenu', function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "Rental Vehicles",
        },
        {
            header = "",
        },
        {
            header = "ATV",
            event = "AG_CountyAlive:RentVehicleReturn",
            args = {'blazer'}
        },
        {
            header = "Dirt Bike",
            event = "AG_CountyAlive:RentVehicleReturn",
            args = {'sanchez'}
        }
    })
end)