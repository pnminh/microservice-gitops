# Microservice intro
## Link
 - [Demo](https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.opentour-2022-dach.prod&utm_source=webapp&utm_medium=share-link)
 - [Github](https://github.com/sa-mw-dach/microservice-introduction-gitops)
## Features
- ServiceMess
- GitOps
- Pipelines using ArgoCD and Tekton
## GitOps
### FLows
- Red Hat OpenShift GitOps -> ArgoCD CR created in `example` ns ->  ArgoCD server created -> `AppProject` CR created -> target namespace labeled with `argocd.argoproj.io/managed-by: [ArgoCD namespace]` -> Argo's Application CR created in `example` ns(has to be the same with ArgoCD CR) -> open ArgoCD UI route -> sync(or use autosync)
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app
  namespace: user1-gitops
spec:
  ...
  syncPolicy:
    automated: {} #enable auto sync
```
### Run examples
1. Create `Application` resource
```
$ oc apply -f helm-chart-example.yaml
```
- All resources are managed by argoCD so even if we change configs directly, e.g. scale up/down deployment, argocd will reconcile the configs back to the ones on Git

## Tekton pipeline
### Concepts
- Pipeline > multiple tasks(run in parallel, use `runAfter` for sequential tasks) -> multiple steps
- ClusterTask and Task
  - params: inputs
  - results: outputs
  - workspaces: shared storage using pvc
## Service Mesh
- Install service mesh operator
- Create `ServiceMeshControlPlane` resource for control plane
- Create `ServiceMeshMemberRoll` to add namespaces that can be managed by istio
- Add `pod` annotation(not deployment or any other owner) to inject istio proxy sidecar

```
      annotations:
        sidecar.istio.io/inject: "true"
```

### ServiceMeshMemberRoll vs ServiceMeshMember
- `ServiceMeshMemberRoll` created in the servicemesh control plane namespace, include all namespaces that should be part of mesh
- `ServiceMeshMember` created in the namespace that needs to be part of the mesh, just a single member and not a list of namespaces like in `ServiceMeshMemberRoll`
- Centralized vs. Decentralized Management: ServiceMeshMemberRoll is a centralized way to manage mesh membership at the mesh control plane level by listing all the member namespaces in one resource. ServiceMeshMember, on the other hand, allows individual namespaces to opt into the mesh in a decentralized manner.
- Scope: ServiceMeshMemberRoll affects multiple namespaces in one declaration, whereas ServiceMeshMember is scoped to a single namespace.
- Control: The creation of a ServiceMeshMemberRoll is typically controlled by administrators of the service mesh, while ServiceMeshMember can be initiated by the administrators of individual namespaces, offering them control over their participation in the mesh.
