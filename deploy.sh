#!/bin/bash

# --- CONFIGURATION (Change these to match your setup) ---
BUCKET_NAME="hafizshah.com"
LOCAL_DIST_FOLDER="./my-website"

# SECURITY FILTER: If CloudShell system memory has the ID, use it.
# Otherwise, fall back to a safe placeholder for public view on GitHub.
if [ -z "$MY_CLOUDFRONT_ID" ]; then
    DISTRIBUTION_ID="YOUR_CLOUDFRONT_ID_HERE"
else
    DISTRIBUTION_ID="$MY_CLOUDFRONT_ID"
fi

echo "📁 Files that will be deployed:"
find "$LOCAL_DIST_FOLDER" -type f
echo ""

echo "📦 Starting deployment for ${BUCKET_NAME}..."

# 1. Upload/Sync files to S3 (Overwrites old files safely)
echo "🚀 Uploading new files to S3..."
aws s3 sync "$LOCAL_DIST_FOLDER" "s3://$BUCKET_NAME" --delete

if [ $? -eq 0 ]; then
    echo "✅ S3 Sync Complete!"
else
    echo "❌ Error: S3 Sync failed."
    exit 1
fi

# 2. Clear CloudFront Cache so the world sees the changes instantly
echo "🧹 Flushing CloudFront cache..."
INVALIDATION_ID=$(aws cloudfront create-invalidation \
    --distribution-id "$DISTRIBUTION_ID" \
    --paths "/*" \
    --query 'Invalidation.Id' \
    --output text)

if [ $? -eq 0 ]; then
    echo "✅ Invalidation triggered successfully! ID: $INVALIDATION_ID"
    echo "🎉 Deployment finished. Your updates will be live globally in roughly 60 seconds!"
else
    echo "❌ Error: CloudFront invalidation failed."
    exit 1
fi