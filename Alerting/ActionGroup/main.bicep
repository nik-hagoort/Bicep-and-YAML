param actionGroups array

resource pDActionGroup 'microsoft.insights/actionGroups@2024-10-01-preview' = [
  for actionGroup in actionGroups: {
    name: actionGroup.groupShortName
    location: 'global'
    properties: {
      groupShortName: actionGroup.groupShortName
      enabled: true
      webhookReceivers: [
        {
          name: actionGroup.name
          serviceUri: actionGroup.serviceUri
          useCommonAlertSchema: true
          useAadAuth: false
        }
      ]
    }
  }
]
