local tempo = 4000 -- 1000 ms = 1s
local isTased = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)

		local stunned = IsPedBeingStunned(PlayerPedId(), 0)
		
		if stunned then
			SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
		end

		if stunned and not isTased then
			isTased = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			
		elseif not stunned and isTased then
			isTased = false
			Wait(5000)
			SetTimecycleModifier("hud_def_desat_Trevor")
			Wait(10000)
      	SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)