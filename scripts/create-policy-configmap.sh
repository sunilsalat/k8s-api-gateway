#!/bin/bash
# Script to create ConfigMap from policy.rego file

POLICY_FILE="${1:-policies/policy.rego}"
NAMESPACE="${2:-default}"

if [ ! -f "$POLICY_FILE" ]; then
    echo "Error: Policy file not found: $POLICY_FILE"
    echo "Usage: $0 [policy-file] [namespace]"
    exit 1
fi

echo "Creating ConfigMap from $POLICY_FILE in namespace $NAMESPACE..."

kubectl create configmap opa-bundle-policy \
  --from-file=policy.rego="$POLICY_FILE" \
  -n "$NAMESPACE" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "ConfigMap created/updated successfully!"

