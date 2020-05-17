# Kubernetes Admission Webhook example

本项目演示如何构建和部署 [AdmissionWebhook](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#admission-webhooks).

The Kubernetes [documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/) contains a common set of recommended labels that allows tools to work interoperably, describing objects in a common manner that all tools can understand. In addition to supporting tooling, the recommended labels describe applications in a way that can be queried.
In our validating webhook example we make these labels required on deployments and services, so this webhook rejects every deployment and every service that doesn’t have these labels set. The mutating webhook in the example adds all the missing required labels with `not_available` set as the value.

## Prerequisites

Kubernetes v1.16 or above with the `admissionregistration.k8s.io/v1` API enabled. Verify that by the following command:

```bash
kubectl api-versions | grep admissionregistration.k8s.io/v1
```

The result should be:

```bash
admissionregistration.k8s.io/v1
```

In addition, the `MutatingAdmissionWebhook` and `ValidatingAdmissionWebhook` admission controllers should be added and listed in the correct order in the admission-control flag of kube-apiserver.

## Build

1. Setup go mod

   The repo uses go mod as the dependency management tool for its Go codebase.

```bash
go mod download
go mod tidy
go mod vendor
```

1. Build and push docker image

```bash
docker build  -t fanfengqiang/admission-webhook-example:v1 .
```

## How does it work

We have a blog post that explains webhooks in depth with the help of this example. Check [it](https://banzaicloud.com/blog/k8s-admission-webhooks/) out!
