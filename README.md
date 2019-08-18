# Demo

```
$ make up
$ curl $(docker-machine ip):8000/trace/2
Hello from behind Envoy (service 1)! hostname: 66249494acfb resolvedhostname: 192.168.0.4
# Then check $(docker-machine ip):9411 on browser
```

## Changing collector endpoint and version

Replace the value of `tracing` in:

- [front-envoy-zipkin.yaml](front-envoy-zipkin.yaml)
- [service1-envoy-zipkin.yaml](service1-envoy-zipkin.yaml)
- [service2-envoy-zipkin.yaml](service2-envoy-zipkin.yaml)

i.e.

### HTTP_JSON_V1

```
tracing:
  http:
    name: envoy.zipkin
    typed_config:
      "@type": type.googleapis.com/envoy.config.trace.v2.ZipkinConfig
      collector_cluster: zipkin
      collector_endpoint: "/api/v1/spans"
```

### HTTP_JSON_V2

```
tracing:
  http:
    name: envoy.zipkin
    typed_config:
      "@type": type.googleapis.com/envoy.config.trace.v2.ZipkinConfig
      collector_cluster: zipkin
      collector_endpoint: "/api/v2/spans"
      collector_endpoint_version: HTTP_JSON_V2
```

### HTTP_PROTO

```
tracing:
  http:
    name: envoy.zipkin
    typed_config:
      "@type": type.googleapis.com/envoy.config.trace.v2.ZipkinConfig
      collector_cluster: zipkin
      collector_endpoint: "/api/v2/spans"
      collector_endpoint_version: HTTP_PROTO
```

