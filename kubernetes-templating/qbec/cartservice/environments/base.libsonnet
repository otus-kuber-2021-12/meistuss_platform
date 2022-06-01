
// this file has the baseline default parameters
{
  components: {
    cartservice: {
      name: 'cartservice',
      image: 'gcr.io/google-samples/microservices-demo/cartservice:v0.1.3',
      containerPort: 7070,
      servicePort: 7070,
      env: [
        {
          name: "REDIS_ADDR",
          value: "redis-cart-master:6379"
        },
        {
          name: "PORT",
          value: "7070"
        },
        {
          name: "LISTEN_ADDR",
          value: "0.0.0.0"
        }
      ],
      resources: {
        requests: {
          cpu: "100m",
          memory: "64Mi"
        },
        limits: {
          cpu: "200m",
          memory: "128Mi"
        }
      },
      readinessProbe: {
        initialDelaySeconds: 15,
        exec: {
          command: [
            "/bin/grpc_health_probe",
            "-addr=:7070",
            "-rpc-timeout=5s"
          ]
        }
      },
      livenessProbe: {
        initialDelaySeconds: 15,
        periodSeconds: 10,
        exec: {
          command: [
            "/bin/grpc_health_probe",
            "-addr=:7070",
            "-rpc-timeout=5s"
          ]
        }
      }
    },
  },
}