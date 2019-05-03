include .env.makefile
include .env.${env}.makefile

build:
	hugo --gc --minify --cleanDestinationDir --enableGitInfo --environment ${env} --contentDir "${CONTENT_DIR}" --destination "${PUBLIC_DIR}"
	yarn run precache
	yarn algolia

deploy: build
	firebase deploy --only hosting:${env} --token "${FIREBASE_TOKEN}"

new:
	hugo new ${name} --environment ${env} --contentDir "${CONTENT_DIR}"
