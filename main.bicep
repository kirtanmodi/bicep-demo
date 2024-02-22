param location string = resourceGroup().location
param storageName string = 'kirtan'

param namePrefix string = 'kiratn'

targetScope = 'resourceGroup'

module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    storageName: storageName
  }
}

module appPlanDeploy 'modules/servicePlan.bicep' = {
  name: '${namePrefix}-appPlanDeploy'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module webAppDeploy 'modules/webApp.bicep' = {
  name: '${namePrefix}-webAppDeploy'
  params: {
    location: location
    namePrefix: namePrefix
    appPlanId: appPlanDeploy.outputs.planId
  }
}

output siteURL string = webAppDeploy.outputs.siteUrl
