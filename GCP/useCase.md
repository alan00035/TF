useCase:
- use tf to provisio resources in GCP
- Provide access for Cloud IAM users and service accounts
- Prod & Dev env *able to test GCP beta feature in Dev
- store state in GCS bucket *potential to switch to tf cloud
- adm can apply fixes from GCP console

references : https://github.com/devbyaccident/implementing-terraform-with-gcp
             https://cloud.google.com/docs


set up principles: adm (google account) / application (service account)


1. login to CLI
$ gcloud auth application-default login 
$ gcloud auth application-default set-quota-project

2. 
<!-- List all project -->
gcloud projects list

<!-- set active project -->
gcloud config set project <PROJECT_ID>
<!-- use service account credentials -->
gcloud iam service-account create prod-svc

gcloud projects add-iam-policy-binding <PROJECT_ID> 
--member="serviceAccount:prod-svc@<PROJECT_ID>.iam.gserviceaccount.com" --role="roles/ower"

glcoud iam service accounts keys create <PROJECT_ID>-creds.json --iam-account=<PROJECT_ID>-prod.iam.gserviceaccount.com