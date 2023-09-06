In order to query multiple types of resources at once, Clusterpedia provides a new resource: Collection Resource.
Collection Resource is composed of different types of resources, and these resources can be retrieved and paged in a uniform way through the Collection Resource.

```plain
kubectl get collectionresources
```{{exec}}

View the supported Collection Resource in a yaml file:

```plain
kubectl get collectionresources -o yaml
```{{exec}}

It is not easy to search for Collection Resource by using kubectl. However, you can have a try:

```plain
kubectl get collectionresources workloads
```{{exec}}

We can use url query – onlyMetadata to retrieve only the resource metadata when retrieving:

```plain
kubectl get --raw "/apis/clusterpedia.io/v1beta1/collectionresources/workloads?onlyMetadata=true&limit=1" | jq
```{{exec}}

More featrues about `Collection Resource` please see: https://clusterpedia.io/docs/usage/search/collection-resource/
