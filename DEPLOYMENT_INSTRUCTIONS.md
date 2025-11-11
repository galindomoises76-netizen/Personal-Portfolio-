# Cloud Run Deployment Instructions

## Problem
Cloud Run's "Deploy from source" feature auto-generates invalid Docker tags. We need to use Cloud Build directly.

## Solution: Use Cloud Build Trigger

### Step 1: Create a Cloud Build Trigger

1. Go to Google Cloud Console → Cloud Build → Triggers
2. Click "Create Trigger"
3. Configure:
   - **Name**: `deploy-portfolio`
   - **Event**: Push to a branch
   - **Source**: Connect your GitHub repository `galindomoises76-netizen/Personal-Portfolio-`
   - **Branch**: `main` (or your default branch)
   - **Configuration**: Cloud Build configuration file (yaml)
   - **Location**: `cloudbuild.yaml`
   - **Service account**: Default compute service account

4. Click "Create"

### Step 2: Test the Trigger

1. Make a commit and push to your repository
2. The trigger will automatically:
   - Build the Docker image
   - Push to Container Registry
   - Deploy to Cloud Run

### Step 3: Verify Deployment

Check Cloud Run console to see your deployed service.

## Alternative: Manual Deployment

If you prefer manual deployment:

```bash
# Build and deploy manually
gcloud builds submit --config cloudbuild.yaml
```

## Troubleshooting

If you see invalid tag errors:
- Make sure you're using Cloud Build, NOT Cloud Run's "Deploy from source"
- The cloudbuild.yaml file must be in the root of your repository
- The service name must not have hyphens at the end

