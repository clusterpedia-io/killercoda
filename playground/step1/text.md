It's recommend using helm to install Clusterpedia, so we need to install helm first, along with kubectl:

```plain
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
curl -L -o /usr/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x /usr/bin/kubectl
```{{exec}}

Install Clusterpedia by helm chart:

```plain
helm repo add clusterpedia https://clusterpedia-io.github.io/clusterpedia-helm/
helm install clusterpedia clusterpedia/clusterpedia \
--namespace clusterpedia-system \
--create-namespace \
--set persistenceMatchNode=None \
--set installCRDs=true
```{{exec}}

After that check the Clusterpedia pod status:

```plain
kubectl -n clusterpedia-system get pod
```{{exec}}
