-----------------------------------------------------------
-- LUA Hearts of Iron 3 Denmar File
-- Created By: Lothos
-- Modified By: Lothos
-- Date Last Modified: 7/31/2011
-----------------------------------------------------------

local P = {}
AI_DEN = P

-- Production Weights
--   1.0 = 100% the total needs to equal 1.0
function P.ProductionWeights(voProductionData)
	local laArray = {
		0.0, -- Land
		0.0, -- Air
		0.80, -- Sea
		0.20}; -- Other
	
	return laArray
end

return AI_DEN

