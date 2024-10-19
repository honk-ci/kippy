TOPDIR=$(PWD)
WHOAMI=$(shell whoami)
SENDGRID_API_KEY=$(shell cat jeefy/sendgrid.token)
STRIPE_API_KEY=$(shell cat jeefy/stripe.token.dev)

build:
	go build -o bin/kippy cmd/main.go

run:
	go run cmd/main.go --discordWebhook="https://discord.com/api/webhooks/1224084450652979210/I-PoApLg1j9SfONoyc_E-gy841Kb3PXyFXAYNhS7BbapsTXBYTMG95kgsqvw6zkIRG7F"

image:
	docker build -t ${WHOAMI}/kippy -f Dockerfile .

image-push: image
	docker push ${WHOAMI}/kippy