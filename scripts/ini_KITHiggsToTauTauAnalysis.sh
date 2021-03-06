#!/bin/bash

# source Artus ini script
source $CMSSW_BASE/src/Artus/Configuration/scripts/ini_ArtusAnalysis_cmssw.sh

# set the environment
export KAPPAPATH=$CMSSW_BASE/src/Kappa
export KAPPATOOLSPATH=$CMSSW_BASE/KappaTools
export ARTUSPATH=$CMSSW_BASE/src/Artus
export KITHIGGSTOTAUTAUPATH=$CMSSW_BASE/src/HiggsAnalysis/KITHiggsToTauTau

# activate pre-commit hooks
ln -sf $CMSSW_BASE/src/HiggsAnalysis/KITHiggsToTauTau/scripts/pre-commit  $CMSSW_BASE/src/HiggsAnalysis/KITHiggsToTauTau/.git/hooks/

# setup TauSpinner
cp $KITHIGGSTOTAUTAUPATH/data/tauspinner.xml $CMSSW_BASE/config/toolbox/$SCRAM_ARCH/tools/selected/tauspinner.xml
scram setup tauspinner

# overwrite artus settings
if [[ `hostname` == *naf* ]]; then
	export ARTUS_WORK_BASE="/nfs/dust/cms/user/${USER}/htautau/artus/"
elif [[ `hostname` == *ekp* ]]; then
	export ARTUS_WORK_BASE="/storage/a/${USER}/htautau/artus/"
elif [[ `hostname` == *cern* ]]; then
	export ARTUS_WORK_BASE="/afs/cern.ch/work/${USER:0:1}/${USER}/htautau/artus/"
fi
