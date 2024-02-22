param namePrefix string
param location string
param sku string = 'B1'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${namePrefix}-website'
  location: location
  sku: {
    name: sku
  }
}

output planId string = appServicePlan.id
