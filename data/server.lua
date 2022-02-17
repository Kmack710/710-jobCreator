local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.CommandName, 'Create a Job', {}, false, function(source)
    local source = source 
	TriggerClientEvent('710-jobCreator:openMenu', source)  
end, 'admin')

RegisterNetEvent('710-jobCreator:createJob', function(jobName, job, location)
    exports['qb-core']:AddJob(jobName, job)
    if Config.updatedOxmySql then 
        MySQL.insert("INSERT INTO 710_created_jobs (job, jobdata, bossmenu) VALUES (?,?,?)", {jobName, json.encode(job), json.encode(location)})
    else 
        exports.oxmysql:insert("INSERT INTO 710_created_jobs (job, jobdata, bossmenu) VALUES (?,?,?)", {jobName, json.encode(job), json.encode(location)})
    end
end)

local function createJob(source)
    local source = source 
    TriggerClientEvent('710-jobCreator:openMenu', source)
end
exports('createJob', createJob)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if Config.updatedOxmySql then 
            jobs = MySQL.query.await("SELECT * FROM 710_created_jobs WHERE status = ?", {'1'})
            if json.encode(jobs) == '[]' then 
                print('^2 710-jobCreator - No jobs in the DB to be added')
            else  
                local jobTable = {}
                for i = 1, #jobs, 1 do
                    jobTable[jobs[i]['job']] = json.decode(jobs[i]["jobdata"])
                end 
                exports['qb-core']:AddJobs(jobTable)
                Wait(5000)
                print('^2 710-jobCreator ALL jobs from DB have been pushed to the core!')
            end
        else 
            jobs = exports.oxmysql:executeSync("SELECT * FROM 710_created_jobs WHERE status = ?", {'1'})
            if json.encode(jobs) == '[]' then 
                print('^2 710-jobCreator - No jobs in the DB to be added')
            else
                local jobTable = {}
                for i = 1, #jobs, 1 do
                    jobTable[jobs[i]['job']] = json.decode(jobs[i]["jobdata"])
                end 
                exports['qb-core']:AddJobs(jobTable)
                Wait(5000)
                print('^2 710-jobCreator ALL jobs from DB have been pushed to the core!')
            end
        end
    end
end)

RegisterNetEvent('QBCore:Server:UpdateObject', function() --- Refresh job tables event
    if source ~= '' then return false end
    QBCore = exports['qb-core']:GetCoreObject()
end)