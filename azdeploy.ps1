# -----------------------------
# Azure React Deployment Script
# -----------------------------

# Variables
$resourceGroup = "react-rg"
$location = "eastus"
$staticWebAppName = "reacthelloworld$(Get-Random)"
$repoUrl = "https://github.com/cosmicmuse666/azdeploy1211.git" 
$branch = "main"

Write-Host "Creating resource group..." -ForegroundColor Green

az group create `
  --name $resourceGroup `
  --location $location


Write-Host "Creating Azure Static Web App..." -ForegroundColor Green

az staticwebapp create `
  --name $staticWebAppName `
  --resource-group $resourceGroup `
  --source $repoUrl `
  --location $location `
  --branch $branch `
  --app-location "/" `
  --output-location "build"


Write-Host "Static Web App Created!" -ForegroundColor Cyan
Write-Host "App Name: $staticWebAppName"