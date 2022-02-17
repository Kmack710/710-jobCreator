# In-Game Simple Job Creator. 
![image](https://user-images.githubusercontent.com/69439573/153830246-d9d29801-3d0d-4f63-8806-b899901057a6.png)

## Planned updates
- Add Gangs to be able to be created ingame also!
- Add Items to be able to be created ingame also!
- Try and figure out a way around bossmenu or build something else.

This currently does not add the bossmenu location to the job due to qb-bossmenu restrictions. This should be more possible when qb-management comes out, or if we find another soulution. 
It still puts boss menu locations in the DB so you can bring them to bossmenu config easier! 
*It makes the menu where you are standing when you click create job!*
## Usage 
Just use the command you set in the config to open up qb-input to create the job. 
Currently the default is 5 ranks 0-4. 
You can also use this export below to call this from other jobs. Or to use with my 710-econSystem Script
```lua -- MUST BE SERVER SIDE 
exports['710-jobCreator']:crateJob(source)
```
## Unless qb-core has already gotten this update(1.0.1) add this below  - Huge thanks to idris! 
## Add this to qb-core/client/events.lua all the way at the bottom
```lua
RegisterNetEvent('QBCore:Client:OnSharedUpdate', function(tableName, key, value)
    QBCore.Shared[tableName][key] = value
    TriggerEvent('QBCore:Client:UpdateObject')
end)

RegisterNetEvent('QBCore:Client:OnSharedUpdateMultiple', function(tableName, values)
    for key, value in ipairs(values) do
        QBCore.Shared[tableName][key] = value
    end
    TriggerEvent('QBCore:Client:UpdateObject')
end)
```
- After that Drag the exports.lua (From Important Folder) into your qb-core/server folder.
- Be sure to add exports.lua to your fxmanifest!
- Be sure to run sql.sql in your database! From IMPORTANT folder. 
