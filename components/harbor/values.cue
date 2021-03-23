package harbor

#values: {
	host:          *"harbor.rktl.work" | string
	adminPassword: *"Harbor12345" | string

	image: repo: "ghcr.io/querycap/harbor"
	image: tag:  "v2.2.0"
}
