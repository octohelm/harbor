package harbor

#values: {
	host:          *"harbor.rktl.work" | string
	adminPassword: *"Harbor12345" | string

	image: repo: *"ghcr.io/querycap/harbor" | string
	image: tag:  *"b0d6308" | string
}
