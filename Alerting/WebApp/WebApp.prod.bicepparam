/*
  Bicep parameter file for WebApp.bicep - This file contains deployment parameters for production environment
  Author: Nik Hagoort
*/

using 'WebApp.bicep'

// Web applications configuration array
// Each object defines a web app with its associated external ID and action group details
param webApps = [
  {
    webAppName: 'webApp1'      // Name of the first web application
    externalID: 'your-web-app-external-id-1'  // External ID for resource identification
    actionGroupName: 'actionGroup1'  // Name of the action group for alerting
    actionGroupRG: 'resourceGroup1'   // Resource group containing the action group
  }
  {
    webAppName: 'webApp2'
    externalID: 'your-web-app-external-id-2'
    actionGroupName: 'actionGroup2'
    actionGroupRG: 'resourceGroup2'
  }
  {
    webAppName: 'webApp3'
    externalID: 'your-web-app-external-id-3'
    actionGroupName: 'actionGroup3'
    actionGroupRG: 'resourceGroup3'
  }
  {
    webAppName: 'webApp4'
    externalID: 'your-web-app-external-id-4'
    actionGroupName: 'actionGroup4'
    actionGroupRG: 'resourceGroup4'
  }
  {
    webAppName: 'webApp5'
    externalID: 'your-web-app-external-id-5'
    actionGroupName: 'actionGroup5'
    actionGroupRG: 'resourceGroup5'
  }
]
