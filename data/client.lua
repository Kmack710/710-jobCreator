local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('710-jobCreator:openMenu', function() --- Job menu 
    local pos = GetEntityCoords(PlayerPedId())
    local dialog = exports['qb-input']:ShowInput({
        header = "Create a New Job!",
        submitText = "Create!",
        inputs = {
            {
                text = "Job Name", -- name of the job in lowercase that you will do /setjob 1 jobname 1 to set yourself as that job 
                name = "jobname", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Job Label", -- Job Label this is what shows up when player do /job 
                name = "joblabel", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Default Duty", 
                name = "defaultDuty", 
                type = "radio", 
                options = { 
                    { value = "true", text = "True" }, 
                    { value = "false", text = "False" }, 
                }
            },
            {
                text = "Pay when Off Duty?", -- text you want to be displayed as a input header
                name = "offDutyPay", -- name of the input should be unique otherwise it might override
                type = "radio", -- type of the input - Radio is useful for "or" options e.g; billtype = Cash OR Bill OR bank
                options = { -- The options (in this case for a radio) you want displayed, more than 6 is not recommended
                    { value = "true", text = "True" }, 
                    { value = "false", text = "False" }, 
                }
            },
            {
                text = "Grade 0 Label", -- Grade Label this is what shows up when player do /job 
                name = "gradelabel", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Grade 0 Payrate", -- text you want to be displayed as a place holder
                name = "gradepayrate", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Grade 1 Label", -- Grade Label this is what shows up when player do /job 
                name = "grade1label", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Grade 1 Payrate", 
                name = "grade1payrate", 
                type = "number", 
                isRequired = true 
            },
            {
                text = "Grade 2 Label", 
                name = "grade2label", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Grade 2 Payrate", 
                name = "grade2payrate", 
                type = "number", 
                isRequired = true 
            },
            {
                text = "Grade 3 Label", 
                name = "grade3label", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Grade 3 Payrate", 
                name = "grade3payrate", 
                type = "number", 
                isRequired = true 
            },
            {
                text = "Grade 4 (Boss) Label", 
                name = "grade4label", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Grade 4 Payrate", 
                name = "grade4payrate", 
                type = "number", 
                isRequired = true 
            },
        },
    })

    if dialog ~= nil then --- build job 
        local jobName = dialog.jobname
		local job = {
			label = dialog.joblabel,
			defaultDuty = dialog.defaultDuty,
	        offDutyPay = dialog.offDutyPay,
			grades = {
	            ['0'] = {
	                name = dialog.gradelabel,
	                payment = dialog.gradepayrate
	            },
				['1'] = {
	                name = dialog.grade1label,
	                payment = dialog.grade1payrate
	            },
				['2'] = {
	                name = dialog.grade2label,
	                payment = dialog.grade2payrate
	            },
	            ['3'] = {
	                name = dialog.grade3label,
	                payment = dialog.grade3payrate
	            },
	            ['4'] = {
	                name = dialog.grade4label,
	                isboss = true,
	                payment = dialog.grade4payrate
	            },
	        },
		}
		TriggerServerEvent('710-jobCreator:createJob', jobName:lower(), job, pos) -- Send job to server
    end
end)

RegisterNetEvent('QBCore:Client:UpdateObject', function() -- Refresh jobs table event.
	QBCore = exports['qb-core']:GetCoreObject()
end)