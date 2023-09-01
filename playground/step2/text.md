Create a member cluster for Clusterpedia by `Kind`:

Create the first member cluster `member01`:

```plain
kind create cluster --name member01 --config kind-configuration.yaml --kubeconfig member01.config
```{{exec}}

Set the `kubeconfig` of member cluster to `PediaCluster` resource:

```plain
sed -i "/kubeconfig/s/_MEMBER01_KUBECONFIG_/$(cat member01.config | base64 -w 0)/" pediacluster.yaml
```{{exec}}

Create `PediaCluster` resource as a member clusters join to the Clusterpedia:

```plain
kubectl apply -f pediacluster.yaml
```{{exec}}

Check whether member cluster was successfully join to the Clusterpedia controlplane:

```plain
kubectl get pediaCluster
```{{exec}}

> We need to wait for pediaClusters to ready.

The next, we can query resource from multiple clusters.
