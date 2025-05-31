using 'VM.bicep'

param vMs = [
  {
    vMName: 'VM1'
    externalID: '/your-vm-external-id-1'
    actionGroupName: 'actionGroup1'
    actionGroupRG: 'resourceGroup1'
  }
  {
    vMName: 'VM2'
    externalID: '/your-vm-external-id-2'
    actionGroupName: 'actionGroup2'
    actionGroupRG: 'resourceGroup2'
  }
  {
    vMName: 'VM3'
    externalID: '/your-vm-external-id-3'
    actionGroupName: 'actionGroup3'
    actionGroupRG: 'resourceGroup3'
  }
  {
    vMName: 'VM4'
    externalID: '/your-vm-external-id-4'
    actionGroupName: 'actionGroup4'
    actionGroupRG: 'resourceGroup4'
  }
  {
    vMName: 'VM5'
    externalID: '/your-vm-external-id-5'
    actionGroupName: 'actionGroup5'
    actionGroupRG: 'resourceGroup5'
  }
]
