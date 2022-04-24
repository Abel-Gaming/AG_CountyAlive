RegisterServerEvent('AG_CountyAlive:GlobalAlert')
AddEventHandler('AG_CountyAlive:GlobalAlert', function(text)
	TriggerClientEvent('AG_CountyAlive:ShowGlobalAlert', -1, text)
end)