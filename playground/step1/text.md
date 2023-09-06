First add `Clusterpedia` helm repo: 

```plain
helm repo add clusterpedia https://clusterpedia-io.github.io/clusterpedia-helm/
```{{exec}}

Install Clusterpedia by `helm` chart:

```plain
helm upgrade --install clusterpedia clusterpedia/clusterpedia \
     --namespace clusterpedia-system \
     --cleanup-on-fail \
     --create-namespace \
     --set persistenceMatchNode=None \
     --set installCRDs=true
```{{exec}}

> Please wait about 2 to 3 minutes...

After that check Clusterpedia pods status:

```plain
kubectl -n clusterpedia-system get pod
```{{exec}}

> We need to wait for all the pods to work properly before skip to the next section.

Next, Let's create two member clusters and join to clusterpedia controlplane.
