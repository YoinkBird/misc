#!/usr/bin/env bash
KUBECONFIG="~/.kube/config:$(find ~/.kube -type f -name "*.kubeconfig" | tr "\n" ":" | sed 's/:$//')" "$@"
