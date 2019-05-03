include .env.makefile
include .env.${env}.makefile

build:
	hugo --gc --minify --cleanDestinationDir --enableGitInfo
	yarn run precache
	yarn algolia

serve:
	hugo serve --enableGitInfo

deploy: build
	firebase deploy --only hosting:${env} --token "${FIREBASE_TOKEN}"

new:
	hugo new ${name}
