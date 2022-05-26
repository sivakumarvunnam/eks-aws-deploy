# eks-aws-deploy

Action:

- Downloads `kubectl`
- Generates a `KUBECONFIG` for the desired cluster, and exports it to `PATH`

The required environment variables are:

- `AWS_REGION`
- `EKS_CLUSTER_NAME`
- `KUBECONFIG_CLUSTER_NAME` (see description below in example usage)

And the required secrets are:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

```yaml
name: Deploy
on:
  push:
    branches:
      - develop
      - 'release/**'

env:
  AWS_REGION: us-east-2
  EKS_CLUSTER_NAME: eks-cluster-name
  KUBECONFIG_CLUSTER_NAME: kubeconfig-eks-cluster-name

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy
        uses: sivakumarvunnam/eks-aws-deploy@main
        env:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: $AWS_REGION
          cluster_name: $EKS_CLUSTER_NAME
          kubeconfig_cluster_name: $KUBECONFIG_CLUSTER_NAME
