# How to Verify and Fix Cloud Build Trigger

## Step 1: Verify Trigger Configuration

1. Go to **Cloud Build** → **Triggers** in Google Cloud Console
2. Find your trigger (probably named something like `deploy-portfolio` or similar)
3. Click on it to edit
4. Check the **Configuration** section:

### ✅ CORRECT Configuration:
- **Type**: Cloud Build configuration file (yaml)
- **Location**: `cloudbuild.yaml`

### ❌ WRONG Configuration:
- **Type**: Dockerfile
- **Type**: Buildpack
- **Location**: (empty or different file)

## Step 2: Fix the Trigger

If your trigger is using Dockerfile or Buildpack:

1. Click **Edit** on the trigger
2. Under **Configuration**:
   - Select **"Cloud Build configuration file (yaml)"**
   - Set **Location** to: `cloudbuild.yaml`
3. Click **Save**

## Step 3: Check for Cloud Run Triggers

Also check if there's a trigger in **Cloud Run**:

1. Go to **Cloud Run** → Your service `personalportfoliogalinde`
2. Check if there's a "Source" or "Continuous Deployment" section
3. If there is, **disable it** or **delete it**

## Step 4: Test the Trigger

1. Make a small change (like adding a comment to a file)
2. Commit and push to GitHub
3. Check **Cloud Build** → **History** to see if it triggers
4. The build should use your `cloudbuild.yaml` file

## Step 5: Verify Build Logs

When the build runs, check the logs. You should see:
- Step #0: Building with Docker using your `cloudbuild.yaml`
- Step #1: Pushing to `gcr.io/$PROJECT_ID/portfolio:$SHORT_SHA`
- Step #2: Deploying to Cloud Run

If you see different steps or different image tags, the trigger is not using `cloudbuild.yaml`.

