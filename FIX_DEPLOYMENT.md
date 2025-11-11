# How to Fix Cloud Run Deployment

## The Problem
Cloud Run's "Deploy from source" feature is ignoring your `cloudbuild.yaml` and creating invalid Docker tags.

## The Solution
You MUST use Cloud Build directly, NOT Cloud Run's source deployment.

## Step 1: Disable Cloud Run Source Deployment

1. Go to Cloud Run Console
2. Find your service `personalportfoliogalinde`
3. Go to "Revisions" or "Deployments"
4. Delete or disable any automatic deployments from source
5. **IMPORTANT**: Do NOT use "Deploy new revision" → "Deploy from source"

## Step 2: Use Cloud Build Instead

### Option A: Set Up Cloud Build Trigger (Recommended)

1. Go to **Cloud Build** → **Triggers** in Google Cloud Console
2. Click **"Create Trigger"**
3. Configure:
   - **Name**: `deploy-portfolio`
   - **Event**: Push to a branch
   - **Source**: Connect your GitHub repo `galindomoises76-netizen/Personal-Portfolio-`
   - **Branch**: `main` (or your default branch)
   - **Configuration**: **Cloud Build configuration file (yaml)**
   - **Location**: `cloudbuild.yaml`
   - Click **"Create"**

4. Now when you push to GitHub, Cloud Build will automatically:
   - Build using your `cloudbuild.yaml`
   - Deploy to Cloud Run

### Option B: Manual Deployment (Quick Test)

Run this command from your local machine or Cloud Shell:

```bash
gcloud builds submit --config cloudbuild.yaml
```

This will:
- Use your `cloudbuild.yaml` file
- Build the Docker image with correct tags
- Deploy to Cloud Run automatically

## Step 3: Verify

After deployment, check:
1. Cloud Build → History (should show successful build)
2. Cloud Run → Services (should show new revision)
3. Your website URL should be accessible

## Important Notes

- **DO NOT** use Cloud Run's "Deploy from source" button
- **DO** use Cloud Build triggers or manual `gcloud builds submit`
- The `cloudbuild.yaml` file must be in your repository root
- Your Dockerfile must be in the repository root

## Troubleshooting

If you still see errors:
1. Make sure you're using Cloud Build, not Cloud Run source deployment
2. Check that `cloudbuild.yaml` is committed to your repository
3. Verify the service name matches: `personalportfoliogalinde`

