IMAGE=ueniueni/arm32v7.leshan

.PHONY: tag
tag:
	@[ "${VERSION}" ] || ( echo "Env var VERSION is not set."; exit 1 )
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker tag $(IMAGE) $(IMAGE):latest

.PHONY: release
release:
	@[ "${VERSION}" ] || ( echo "Env var VERSION is not set."; exit 1 )
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

.PHONY: build
build:
	docker build -t $(IMAGE) .

.PHONY: deploy
deploy:
	@docker run \
		--detach \
		--publish ${PORT}:8080\
		--restart unless-stopped \
		$(IMAGE):latest
	@echo "Make sure that the PORT ${PORT} are forwarded in your firewall."
