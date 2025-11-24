package kong.policy

import future.keywords.if

default allow := false

# Policy loaded from bundle server
# This policy can be updated on the bundle server without redeploying Kubernetes resources

# Example policy: Allow requests with valid API key
allow if {
    input.request.headers["x-api-key"] != ""
}

# Example policy: Deny requests to certain paths
allow if {
    not startswith(input.request.path, "/admin")
}

# Example policy: Allow based on consumer
allow if {
    input.consumer.username == "api-user"
}

