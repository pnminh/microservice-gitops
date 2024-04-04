# Microservice intro
## Link
 - [Demo](https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.opentour-2022-dach.prod&utm_source=webapp&utm_medium=share-link)
 - [Github](https://github.com/sa-mw-dach/microservice-introduction-gitops)
## Features
- ServiceMess
- GitOps
- Pipelines using ArgoCD and Tekton
## FLows
- Red Hat OpenShift GitOps -> ArgoCD CR created in `example` ns -> ArgoCD server created -> Argo's Application CR created in `example` ns(has to be the same with ArgoCD CR) -> open ArgoCD UI route -> sync