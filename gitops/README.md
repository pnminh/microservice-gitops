# microservice-introduction-gitops
## ACM
### Links
- https://piotrminkowski.com/2022/10/24/gitops-with-advanced-cluster-management-for-kubernetes/
- https://github.com/albertofilice/rhacm-gitops/tree/main
- https://www.redhat.com/architect/multi-cluster-deployment-kubernetes-gitops
### Placement policy
Here is how the placement policy combines with other selection methods to determine a matching list of ManagedClusters: 
1. Kubernetes clusters are registered with hub as cluster-scoped ManagedClusters; 
2. ManagedClusters are organized into cluster-scoped ManagedClusterSets; 
3. ManagedClusterSets are bound to workload namespaces; 
4. Namespace-scoped Placements specify a slice of ManagedClusterSets which select a working set of potential ManagedClusters; 
5. Then Placements subselect from that working set using label/claim selection. 