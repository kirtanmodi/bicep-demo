param location string
param namePrefix string
param appPlanId string

resource webApplication 'Microsoft.Web/sites@2023-01-01' = {
  name: '${namePrefix}-website'
  location: location
  properties: {
    serverFarmId: appPlanId
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
