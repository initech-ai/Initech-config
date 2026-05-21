# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

This is a **GitOps configuration repository** for three microservices deployed to Kubernetes via ArgoCD. Changes pushed to this repo are automatically picked up by ArgoCD and applied to the cluster. There is no application source code here — only Kubernetes manifests.

## ArgoCD Setup

```bash
# Install the ApplicationSet into ArgoCD (run from argocd-root/)
make install
# or directly:
kubectl apply -f argocd-root/applicationset.yaml -n argocd
```

## Key Infrastructure Details

- **Cluster target:** `https://kubernetes.default.svc` (in-cluster ArgoCD)
- **Namespace:** matches the environment name (`dev`, `prod`, etc.) — auto-created by ArgoCD
- **Ingress:** nginx-ingress with cert-manager TLS using `k3d-ca-issuer`
- **DNS:** nip.io wildcard (`<app>.10-0-0-200.nip.io`)
- **Sync policy:** auto-prune + self-heal enabled on all apps
