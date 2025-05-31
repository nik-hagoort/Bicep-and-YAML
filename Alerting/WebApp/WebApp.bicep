/*
  Bicep template for creating HTTP server error alerts for multiple web apps
  Author: Nik Hagoort
*/

// Parameters
param alertName string = 'httpServerErrors'  // Default name for the alert
param webApps array  // Array of web apps to create alerts for, each containing webAppName, externalID, actionGroupName, and actionGroupRG

// Reference existing action groups for each web app in their respective resource groups
resource actionGroup 'microsoft.insights/actionGroups@2024-10-01-preview' existing = [
  for (webApp, i) in webApps: {
    name: webApp.actionGroupName
    scope: resourceGroup(webApp.actionGroupRG)
  }
]

// Create HTTP server error alerts (5xx errors) for each web app using dynamic thresholds
resource httpServerErrorsAlert 'microsoft.insights/metricAlerts@2018-03-01' = [
  for (webApp, i) in webApps: {
    name: '${alertName}-${webApp.webAppName}'
    location: 'global'  // Metric alerts are global resources
    properties: {
      severity: 1  // Severity level 1 (Critical)
      enabled: true
      scopes: [
        webApp.externalID  // Resource ID of the web app to monitor
      ]
      evaluationFrequency: 'PT1M'  // Evaluate every minute
      windowSize: 'PT15M'  // 15-minute time window for evaluation
      criteria: {
        allOf: [
          {
            alertSensitivity: 'High'  // High sensitivity for dynamic threshold
            failingPeriods: {
              numberOfEvaluationPeriods: 4
              minFailingPeriodsToAlert: 4  // Alert after 4 consecutive failing periods
            }
            name: 'Metric1'
            metricNamespace: 'Microsoft.Web/sites'
            metricName: 'Http5xx'  // Monitoring HTTP 5xx errors
            operator: 'GreaterOrLessThan'
            timeAggregation: 'Maximum'
            skipMetricValidation: false
            criterionType: 'DynamicThresholdCriterion'  // Using dynamic thresholds for alerting
          }
        ]
        'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
      }
      autoMitigate: true  // Automatically resolve alerts
      targetResourceType: 'Microsoft.Web/sites'
      targetResourceRegion: '' // Add your target region
      actions: [
        {
          actionGroupId: actionGroup[i].id  // Reference to the corresponding action group
          webHookProperties: {}
        }
      ]
    }
  }
]
