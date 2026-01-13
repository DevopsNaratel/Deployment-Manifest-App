# Setting up SOPS with ArgoCD

Since you are using encrypted `values.yaml` files, ArgoCD needs a plugin to decrypt them before applying manifests.

## 1. Updated ApplicationSet
The `bootstrap/applicationset.yaml` has been updated to use a plugin named `helm-secrets`.

## 2. Configure ArgoCD
You need to ensure your ArgoCD Repo Server has the `helm-secrets` and `sops` tools installed, and the plugin registered.

### Option A: Custom Image (Recommended)
Build a custom ArgoCD Repo Server image that includes `helm`, `sops`, and `helm-secrets`.

### Option B: Sidecar / CMP
Mount the plugin configuration. 

A sample `cmp-plugin-configmap.yaml` is provided in this folder. You would mount this into your ArgoCD Repo Server.

**Note on `diwa-app`:**
The `diwa-app-testing` folder contains both `values.yaml` (unencrypted) and `values.enc.yaml` (encrypted). 
The `ApplicationSet` currently looks for `values.yaml`. 
- If `diwa-app` should use encrypted values, rename `values.enc.yaml` to `values.yaml` (replacing the plain one).
- If the `helm-secrets` plugin is used, ensure it can handle plain files if `values.yaml` remains unencrypted.
