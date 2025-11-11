# Manual deployment script for Cloud Run (PowerShell)
# This uses Cloud Build directly instead of Cloud Run's source deployment

Write-Host "Building and deploying to Cloud Run..." -ForegroundColor Green
gcloud builds submit --config cloudbuild.yaml

Write-Host "Deployment complete!" -ForegroundColor Green
Write-Host "Check your Cloud Run service at:" -ForegroundColor Yellow
Write-Host "https://console.cloud.google.com/run?project=glossy-reserve-477914-m0" -ForegroundColor Cyan

