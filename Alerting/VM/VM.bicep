param alertName string = 'percentageCPU'
param vMs array

resource actionGroup 'microsoft.insights/actionGroups@2024-10-01-preview' existing = [
  for (vM, i) in vMs: {
    name: vM.actionGroupName
    scope: resourceGroup(vM.actionGroupRG)
  }
]

resource percentageCPUAlert 'microsoft.insights/metricAlerts@2018-03-01' = [
  for (vM, i) in vMs: {
    name: '${alertName}-${vM.vMName}'
    location: 'global'
    properties: {
      severity: 1
      enabled: true
      scopes: [
        vM.externalID
      ]
      evaluationFrequency: 'PT1M'
      windowSize: 'PT15M'
      criteria: {
        allOf: [
          {
            alertSensitivity: 'High'
            failingPeriods: {
              numberOfEvaluationPeriods: 4
              minFailingPeriodsToAlert: 4
            }
            name: 'Metric1'
            metricNamespace: 'Microsoft.Compute/virtualMachines'
            metricName: 'Percentage CPU'
            operator: 'GreaterOrLessThan'
            timeAggregation: 'Maximum'
            skipMetricValidation: false
            criterionType: 'DynamicThresholdCriterion'
          }
        ]
        'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
      }
      autoMitigate: true
      targetResourceType: 'Microsoft.Compute/virtualMachines'
      targetResourceRegion: '' // Add your target region
      actions: [
        {
          actionGroupId: actionGroup[i].id
          webHookProperties: {}
        }
      ]
    }
  }
]
