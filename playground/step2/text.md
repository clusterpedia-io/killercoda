We join two member clusters `member01` and `member02` to Clusterpedia controlplane.

Create the first member cluster `member01` by kind on worker node `node01`:

```plain
ssh node01 "kind create cluster --name member01 --config kind-configuration.yaml --kubeconfig member01.config"
```{{exec}}

```plain
ssh node01 "cat member01.config" > member01.config
```{{exec}}

Set the `kubeconfig` of member01 cluster to `PediaCluster` resource:

```plain
sed -i "/kubeconfig/s/_MEMBER01_KUBECONFIG_/$(cat member01.config | base64 -w 0)/" pediacluster.yaml
```{{exec}}

And then, we join the host cluster as `member02` cluster for Clusterpedia:

```plain
kubectl config view --raw > member02.config
sed -i "/kubeconfig/s/_MEMBER02_KUBECONFIG_/$(cat member02.config | base64 -w 0)/" pediacluster.yaml
```{{exec}}

Create `pediacluster` resource as member clusters join to the Clusterpedia:

```plain
kubectl apply -f pediacluster.yaml
```{{exec}}

Check whether member cluster was successfully join to the Clusterpedia controlplane:

```plain
kubectl get pediacluster
```{{exec}}

> We need to wait for pediaclusters to ready.

The next, we can query resource from multiple clusters.
