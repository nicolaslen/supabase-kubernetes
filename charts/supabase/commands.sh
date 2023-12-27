kubectl create namespace supa-upgrades

# Create JWT secrets
kubectl -n supa-upgrades create secret generic jwt-creds \
  --from-env-file=./secrets/.jwt

# Create SMTP secrets
kubectl -n supa-upgrades create secret generic smtp-creds \
  --from-env-file=./secrets/.smtp

# Create DB secrets
kubectl -n supa-upgrades create secret generic db-creds \
  --from-env-file=./secrets/.db

# Create AWS secrets
kubectl -n supa-upgrades create secret generic aws-credentials-config \
  --from-file=credentials=./secrets/.aws

# Create S3 secrets
kubectl -n supa-upgrades create secret generic s3 \
  --from-env-file=./secrets/.s3

helm -n supa-upgrades install supabase -f values.yaml .
