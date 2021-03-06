-----------------------------------------------------------
-- LUA Hearts of Iron 3 Belgium File
-- Created By: Lothos
-- Modified By: Lothos
-- Date Last Modified: 5/22/2010
-----------------------------------------------------------

local P = {}
AI_BEL = P

-- Production Weights
--   1.0 = 100% the total needs to equal 1.0
function P.ProductionWeights(voProductionData)
	local laArray = {
		0.07, -- Land
		0.33, -- Air
		0.40, -- Sea
		0.20}; -- Other
	
	return laArray
end

function P.DiploScore_InviteToFaction(score, ai, actor, recipient, observer)
	-- Whatever their chance is lower it by 10 makes it harder to get them in
	return (score - 10)
end

return AI_BEL

