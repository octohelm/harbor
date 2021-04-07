package harbor

import (
	harbor "github.com/goharbor/harbor-helm:chart"
)

{
	apiVersion: "octohelm.tech/v1alpha"
	kind:       "Release"

	#name:      *"harbor" | string
	#namespace: *"harbor" | string
	#context:   *"hw-sg" | string

	metadata: name:      #name
	metadata: namespace: #namespace
	metadata: labels: context: #context

	spec: {
		kube: {
			@translate("helm")

			harbor

			release: name:      #name
			release: namespace: #namespace

			values: {
				"expose": {
					"type": "ingress"
					"tls": "enabled": false
					"ingress": {
						"hosts": {
							"core":   "harbor.rktl.work"
							"notary": "notary.rktl.work"
						}
					}
				}
				"externalURL":         "https://harbor.rktl.work"
				"harborAdminPassword": "Harbor12345"
				"imagePullPolicy":     "Always"
				"persistence": {
					"enabled": true
					"registry": {
						"storageClass": "local-path"
					}
					"database": {
						"storageClass": "local-path"
					}
					"trivy": {
						"storageClass": "local-path"
					}
				}
				"portal": {
					"image": {
						"repository": "\(#values.image.repo)/harbor-portal"
						"tag":        "\(#values.image.tag)"
					}
				}
				"core": {
					"image": {
						"repository": "\(#values.image.repo)/harbor-core"
						"tag":        "\(#values.image.tag)"
					}
				}
				"jobservice": {
					"image": {
						"repository": "\(#values.image.repo)/harbor-jobservice"
						"tag":        "\(#values.image.tag)"
					}
					"storageClass": "local-path"
				}
				"registry": {
					"relativeurls": true
					"registry": {
						"image": {
							"repository": "\(#values.image.repo)/registry-photon"
							"tag":        "\(#values.image.tag)"
						}
					}
					"controller": {
						"image": {
							"repository": "\(#values.image.repo)/harbor-registryctl"
							"tag":        "\(#values.image.tag)"
						}
					}
				}
				"chartmuseum": {
					"enabled": true
					"image": {
						"repository": "\(#values.image.repo)/chartmuseum-photon"
						"tag":        "\(#values.image.tag)"
					}
				}
				"trivy": {
					"enabled": true
					"image": {
						"repository": "\(#values.image.repo)/trivy-adapter-photon"
						"tag":        "\(#values.image.tag)"
					}
				}
				"notary": {
					"enabled": true
					"server": {
						"image": {
							"repository": "\(#values.image.repo)/notary-server-photon"
							"tag":        "\(#values.image.tag)"
						}
					}
					"signer": {
						"image": {
							"repository": "\(#values.image.repo)/notary-signer-photon"
							"tag":        "\(#values.image.tag)"
						}
					}
				}
				"database": {
					"type": "internal"
					"internal": {
						"image": {
							"repository": "\(#values.image.repo)/harbor-db"
							"tag":        "\(#values.image.tag)"
						}
					}
				}
				"redis": {
					"type": "internal"
					"internal": {
						"image": {
							"repository": "\(#values.image.repo)/redis-photon"
							"tag":        "\(#values.image.tag)"
						}
					}
				}
				"clair": {
					"enabled": false
				}
			}
		}
	}
}
