First, configure the cluster shortcut for kubectl, Clusterpedia provides a simple script to generate cluster config in the kubeconfig:

```plain
curl -sfL https://raw.githubusercontent.com/clusterpedia-io/clusterpedia/v0.7.0/hack/gen-clusterconfigs.sh | bash -
```{{exec}}

After multi-cluster kubeconfig is generated, you can use `kubectl --cluster` to specify the cluster access:

```plain
kubectl --cluster clusterpedia api-resources
```{{exec}}

`Specify Clusters`, When searching multiple clusters, all clusters will be retrieved by default, we can also specify a single cluster or a group of clusters:

```plain
kubectl --cluster clusterpedia get deployments -A \
     -l "search.clusterpedia.io/clusters in (member01, member02)"
```{{exec}}

For specifying a single cluster search, we can also use Search Label to set it up:

```plain
kubectl --cluster clusterpedia get deployments -A \
     -l "search.clusterpedia.io/clusters=member01"
```{{exec}}

`Specify Namespaces`, We can specify a single namespace or all namespaces as if we were viewing a native Kubernetes resource:

```plain
kubectl --cluster clusterpedia get deployments -n kube-system
```{{exec}}

In addition to specifying a single namespace, we can also specify to search the resources under a group of namespaces:

```plain
kubectl --cluster clusterpedia get deployments -A \
     -l "search.clusterpedia.io/namespaces in (kube-system, clusterpedia-system)"
```{{exec}}

`Specify Resource Names`, We can filter resources by a group of resource names:

```plain
kubectl --cluster clusterpedia get deployments -A \
     -l "search.clusterpedia.io/names=coredns"
```{{exec}}

Creation Time Interval:

The creation time interval used for the search is left closed and right open, since <= creation time < before:

```plain
kubectl --cluster clusterpedia get deployments -A \
     -l "search.clusterpedia.io/since=2022-03-24, \
    search.clusterpedia.io/before=2050-09-05"
```{{exec}}

Next, Let's learn about clusterpedia more search features.
