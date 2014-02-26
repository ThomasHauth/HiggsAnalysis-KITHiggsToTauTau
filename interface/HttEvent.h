
#pragma once

#include "Artus/KappaAnalysis/interface/KappaEvent.h"

/**
   HttEvent HiggsAnalysis/KITHiggsToTauTau/interface/HttEvent.h

   Defines the objects which are contained in a kappa ntuple, usually in use for a Htt analysis. 
   Members are usually pointer to the corresponding collections of objects in the input file. This 
   is a 1:1 copy of a usual KappaEvent.
*/

class HttEvent : public KappaEvent
{
public:
	HttEvent() : KappaEvent() {};
	
};

