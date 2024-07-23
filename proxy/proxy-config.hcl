log_level = "info"
vault {
  address = "http://replica-{{.Task.Slot}}.vault-internal:8200"
  retry {
    num_retries = 5
  }
}
cache {
  // An empty cache stanza still enables caching
}
api_proxy {
  // An empty api_proxy stanza still enables the API proxy
}
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}
