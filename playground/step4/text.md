`Fuzzy Search`, Currently supports fuzzy search based on resource names:

```plain
kubectl --cluster clusterpedia get deployments -A \
    -l "internalstorage.clusterpedia.io/fuzzy-name=core"
```{{exec}}

`Field Selector`, Native Kubernetes currently only supports field filtering on metadata.name and metadata.namespace, and the operators only support =, !=, ==`, which is very limited. Clusterpedia provides more powerful features based on the compatibility with existing Field Selector features, and supports the same operators as Label Selector.

Use . to sperate fields:

```plain
kubectl --cluster clusterpedia get pods -A \
    --field-selector=".status.phase notin (Running,Succeeded)"
```{{exec}}

Field names wrapped in '' or "" can be used for fields with illegal characters like .

```plain
kubectl --cluster clusterpedia get deploy -A \
    --field-selector="metadata.annotations['test.io'] in (value1,value2),spec.replica=1"
```{{exec}}

Use `[]` to separate fields, the string inside [] must be wrapped with '' or ""

```plain
kubectl --cluster clusterpedia get deploy -A \
    --field-selector="metadata.annotations['test.io'] in (value1,value2),spec.replica=3"
```{{exec}}

`Paging and Sorting`, Paging and sorting are essential features for resource retrieval.

Sorting using multiple fields:

```plain
kubectl --cluster clusterpedia get pods -A \
    -l "search.clusterpedia.io/orderby in (cluster, name)"
```{{exec}}

Because of Label Selector’s validation of value, order by desc requires _desc at the end of the field:

```plain
kubectl --cluster clusterpedia get pods -A \
    -l "search.clusterpedia.io/orderby in (namespace_desc, cluster, name)"
```{{exec}}

Paging:

kubectl --chunk-size is actually used for paging pulls by setting ListOptions.Limit.

```plain
kubectl --cluster clusterpedia get pods -A \
    --chunk-size 10 -l "search.clusterpedia.io/offset=10"
```{{exec}}

When accessing Clusterepdia using a URL, the response' continue can be used as the offset for the next request.
Use with paging:

```plain
kubectl --cluster clusterpedia get deploy -A \
    -l "search.clusterpedia.io/with-continue=true"
```{{exec}}

Response With Remaining Count, In some UI cases, it is often necessary to get the total number of resources in the current search condition.

```plain
kubectl get --raw="/apis/clusterpedia.io/v1beta1/resources/apis/apps/v1/deployments?withRemainingCount&limit=1" | jq
```{{exec}}

If you want to experience more features, please see [Clusterpedia.io](https://clusterpedia.io/)
