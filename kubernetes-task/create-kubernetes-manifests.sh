#!/bin/bash

# Ensures manifests directory exists, if not we create it
mkdir -p manifests

# Write my-app-deployment.yaml
echo "Writing my-app-deployment.yaml..."
echo "apiVersion: apps/v1" > manifests/my-app-deployment.yaml
echo "kind: Deployment" >> manifests/my-app-deployment.yaml
echo "metadata:" >> manifests/my-app-deployment.yaml
echo "  name: my-app-deployment" >> manifests/my-app-deployment.yaml
echo "spec:" >> manifests/my-app-deployment.yaml
echo "  replicas: 1" >> manifests/my-app-deployment.yaml
echo "  selector:" >> manifests/my-app-deployment.yaml
echo "    matchLabels:" >> manifests/my-app-deployment.yaml
echo "      app: my-app" >> manifests/my-app-deployment.yaml
echo "  template:" >> manifests/my-app-deployment.yaml
echo "    metadata:" >> manifests/my-app-deployment.yaml
echo "      labels:" >> manifests/my-app-deployment.yaml
echo "        app: my-app" >> manifests/my-app-deployment.yaml
echo "    spec:" >> manifests/my-app-deployment.yaml
echo "      containers:" >> manifests/my-app-deployment.yaml
echo "        - name: my-app" >> manifests/my-app-deployment.yaml
echo "          image: akashpndya/my-node-app" >> manifests/my-app-deployment.yaml
echo "          ports:" >> manifests/my-app-deployment.yaml
echo "            - containerPort: 3000" >> manifests/my-app-deployment.yaml

# Creation of cache-deployment.yaml
echo "apiVersion: apps/v1" > manifests/cache-deployment.yaml
echo "kind: Deployment" >> manifests/cache-deployment.yaml
echo "metadata:" >> manifests/cache-deployment.yaml
echo "  name: cache-deployment" >> manifests/cache-deployment.yaml
echo "spec:" >> manifests/cache-deployment.yaml
echo "  replicas: 1" >> manifests/cache-deployment.yaml
echo "  selector:" >> manifests/cache-deployment.yaml
echo "    matchLabels:" >> manifests/cache-deployment.yaml
echo "      app: cache" >> manifests/cache-deployment.yaml
echo "  template:" >> manifests/cache-deployment.yaml
echo "    metadata:" >> manifests/cache-deployment.yaml
echo "      labels:" >> manifests/cache-deployment.yaml
echo "        app: cache" >> manifests/cache-deployment.yaml
echo "    spec:" >> manifests/cache-deployment.yaml
echo "      containers:" >> manifests/cache-deployment.yaml
echo "        - name: cache" >> manifests/cache-deployment.yaml
echo "          image: redis" >> manifests/cache-deployment.yaml

# Create my-app-service.yaml
echo "Writing my-app-service.yaml..."
echo "apiVersion: v1" > manifests/my-app-service.yaml
echo "kind: Service" >> manifests/my-app-service.yaml
echo "metadata:" >> manifests/my-app-service.yaml
echo "  name: my-app-service" >> manifests/my-app-service.yaml
echo "spec:" >> manifests/my-app-service.yaml
echo "  selector:" >> manifests/my-app-service.yaml
echo "    app: my-app" >> manifests/my-app-service.yaml
echo "  ports:" >> manifests/my-app-service.yaml
echo "    - protocol: TCP" >> manifests/my-app-service.yaml
echo "      port: 3000" >> manifests/my-app-service.yaml
echo "      targetPort: 3000" >> manifests/my-app-service.yaml

# Creation of trusted-pod.yaml
echo "apiVersion: v1" > manifests/trusted-pod.yaml
echo "kind: Pod" >> manifests/trusted-pod.yaml
echo "metadata:" >> manifests/trusted-pod.yaml
echo "  name: trusted-pod" >> manifests/trusted-pod.yaml
echo "  labels:" >> manifests/trusted-pod.yaml
echo "    app: trusted" >> manifests/trusted-pod.yaml
echo "spec:" >> manifests/trusted-pod.yaml
echo "  containers:" >> manifests/trusted-pod.yaml
echo "    - name: trusted" >> manifests/trusted-pod.yaml
echo "      image: curlimages/curl" >> manifests/trusted-pod.yaml
echo "      command: [\"sleep\", \"3600\"]" >> manifests/trusted-pod.yaml

# Creation of my-app-network-policy.yaml
echo "apiVersion: networking.k8s.io/v1" > manifests/my-app-network-policy.yaml
echo "kind: NetworkPolicy" >> manifests/my-app-network-policy.yaml
echo "metadata:" >> manifests/my-app-network-policy.yaml
echo "  name: my-app-network-policy" >> manifests/my-app-network-policy.yaml
echo "spec:" >> manifests/my-app-network-policy.yaml
echo "  podSelector:" >> manifests/my-app-network-policy.yaml
echo "    matchLabels:" >> manifests/my-app-network-policy.yaml
echo "      app: my-app" >> manifests/my-app-network-policy.yaml
echo "  policyTypes:" >> manifests/my-app-network-policy.yaml
echo "    - Ingress" >> manifests/my-app-network-policy.yaml
echo "    - Egress" >> manifests/my-app-network-policy.yaml
echo "  ingress:" >> manifests/my-app-network-policy.yaml
echo "    - from:" >> manifests/my-app-network-policy.yaml
echo "        - podSelector:" >> manifests/my-app-network-policy.yaml
echo "            matchLabels:" >> manifests/my-app-network-policy.yaml
echo "              app: trusted" >> manifests/my-app-network-policy.yaml
echo "        - namespaceSelector: {}" >> manifests/my-app-network-policy.yaml
echo "  egress:" >> manifests/my-app-network-policy.yaml
echo "    - to:" >> manifests/my-app-network-policy.yaml
echo "        - namespaceSelector: {}" >> manifests/my-app-network-policy.yaml

echo "All manifest files created successfully"

