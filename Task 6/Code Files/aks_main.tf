provider "azurerm" {
  features {}

  subscription_id = "a1c4gg57-c40h-5343-bcf4-6bc8622ff020"  # your subscription ID
}

resource "azurerm_resource_group" "rg" {
  name     = "kubernetes_cluster_rg"  # resource group name
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "CapstoneProject-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "upgradaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
    Project     = "UpGrad"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
Nmgixdeploymentazur.yaml :-
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-html
data:
  index.html: |
    <h1>Hello from <b>AWS</b> EKS Cluster</h1>

---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: LoadBalancer
  ports:
    - port: 80
  selector:
    app: nginx

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
          volumeMounts:
            - name: html
              mountPath: /usr/share/nginx/html/index.html
              subPath: index.html
      volumes:
        - name: html
          configMap:
            name: nginx-html
