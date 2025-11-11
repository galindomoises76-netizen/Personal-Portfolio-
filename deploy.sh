#!/bin/bash
# Manual deployment script for Cloud Run
# This uses Cloud Build directly instead of Cloud Run's source deployment

echo "Building and deploying to Cloud Run..."
gcloud builds submit --config cloudbuild.yaml

echo "Deployment complete!"
echo "Check your Cloud Run service at:"
echo "https://console.cloud.google.com/run?project=glossy-reserve-477914-m0"

