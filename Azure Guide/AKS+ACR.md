

## 📌 Prerequisites

- Azure CLI installed
- kubectl installed
- Access to Azure subscription

### 🔐 Login to Azure

```bash
az login
az account set --subscription <subscription-id>

🐳 Azure Container Registry (ACR)

🔑 Login to ACR
az acr login --name <acr-name>


📦 List Repositories
az acr repository list --name <acr-name> --output table


🏷️ List Image Tags
az acr repository show-tags --name <acr-name> --repository <repo-name>


❌ Delete Image
az acr repository delete --name <acr-name> --image <repo>:<tag>


📥 Import Image
az acr import \
  --name <acr-name> \
  --source docker.io/library/nginx:latest \
  --image nginx:latest


☸️ Azure Kubernetes Service (AKS)
🔗 Get Cluster Credentials
az aks get-credentials \
  --resource-group <resource-group> \
  --name <aks-name>


📊 Check Cluster Nodes
kubectl get nodes

📦 View Resources
kubectl get pods -A
kubectl get svc -A
kubectl get deployments -A

🚀 Deploy Application
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

📈 Scale Deployment
kubectl scale deployment <deployment-name> --replicas=3

📜 View Logs
kubectl logs <pod-name>
kubectl logs -f <pod-name>


🔗 ACR ↔ AKS Integration
🔗 Attach ACR to AKS
az aks update \
  --name <aks-name> \
  --resource-group <resource-group> \
  --attach-acr <acr-name>


🖼️ Update Deployment Image
kubectl set image deployment/<deployment-name> \
<container-name>=<acr-name>.azurecr.io/<image>:<tag>

🛠️ Troubleshooting
🔍 Describe Pod
kubectl describe pod <pod-name>

📡 View Events
kubectl get events -A

🖥️ Exec into Pod
kubectl exec -it <pod-name> -- /bin/sh

🧹 Cleanup
kubectl delete deployment <deployment-name>
kubectl delete svc <service-name>

az aks delete \
  --resource-group <resource-group> \
  --name <aks-name>