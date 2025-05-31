using 'main.bicep'

param actionGroups = [
  {
    name: 'actionGroup1'  // Name of the first action group
    groupShortName: 'AG1'  // Short name for the action group
    serviceUri: 'https://actiongroup1.example.com'  // URI for the action group service
  }
  {
    name: 'actionGroup2'
    groupShortName: 'AG2'
    serviceUri: 'https://actiongroup2.example.com'
  }
  {
    name: 'actionGroup3'
    groupShortName: 'AG3'
    serviceUri: 'https://actiongroup3.example.com'
  }
  {
    name: 'actionGroup4'
    groupShortName: 'AG4'
    serviceUri: 'https://actiongroup4.example.com'
  }
  {
    name: 'actionGroup5'
    groupShortName: 'AG5'
    serviceUri: 'https://actiongroup5.example.com'
  }
]
