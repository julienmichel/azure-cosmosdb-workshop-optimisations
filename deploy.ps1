# Enter the first Resource Group name (i.e. cosmosdbworkshop)
$resourceGroup1Name = "cosmosdbworkshop"
# Enter the location for the first resource group (i.e. eastus)
$location1 = "eastus"
# Enter the SQL Server username (i.e. cosmosdbworkshopadmin)
$sqlAdministratorLogin = "cosmosdbworkshopadmin"
# Enter the SQL Server password (i.e. Password123)
$sqlAdministratorLoginPassword = "Password123"

$suffix = -join ((48..57) + (97..122) | Get-Random -Count 13 | % {[char]$_})
$databaseName = "Movies"
$sqlserverName = "cosmosdbworkshop-$suffix"

New-AzResourceGroup -Name $resourceGroup1Name -Location $location1

$templateUri = "https://raw.githubusercontent.com/julienmichel/azure-cosmosdb-workshop-optimisations/master/azuredeploy.json"

$outputs = New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroup1Name `
    -TemplateUri $templateUri `
    -sqlserverName $sqlserverName `
    -sqlAdministratorLogin $sqlAdministratorLogin `
    -sqlAdministratorLoginPassword $(ConvertTo-SecureString -String $sqlAdministratorLoginPassword -AsPlainText -Force) `
 
$importRequest = New-AzSqlDatabaseImport -ResourceGroupName $resourceGroup1Name `
    -ServerName $sqlserverName -DatabaseName $databaseName `
    -DatabaseMaxSizeBytes "5000000" `
    -StorageKeyType "SharedAccessKey" `
    -StorageKey "?sp=rl&st=2019-11-26T21:16:46Z&se=2025-11-27T21:36:00Z&sv=2019-02-02&sr=b&sig=P15nBXR2bD2jBnHX92%2BwWRxMnvTeUl3EdBNhLXnZ95s%3D" `
    -StorageUri "https://databricksdemostore.blob.core.windows.net/data/nosql-openhack/movies.bacpac" `
    -Edition "Basic" -ServiceObjectiveName "Basic" `
    -AdministratorLogin $sqlAdministratorLogin `
    -AdministratorLoginPassword $(ConvertTo-SecureString -String $sqlAdministratorLoginPassword -AsPlainText -Force)

$importStatus = Get-AzSqlDatabaseImportExportStatus -OperationStatusLink $importRequest.OperationStatusLink

[Console]::Write("Importing database")
while ($importStatus.Status -eq "InProgress") {
    $importStatus = Get-AzSqlDatabaseImportExportStatus -OperationStatusLink $importRequest.OperationStatusLink
    [Console]::Write(".")
    Start-Sleep -s 10
}

[Console]::WriteLine("")
$importStatus
