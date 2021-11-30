build:
	docker build --file printext/Dockerfile --tag github.com/hsmtkk/redesigned-dollop/printext:latest .
	docker build --file printname/Dockerfile --tag github.com/hsmtkk/redesigned-dollop/printname:latest .
	docker build --file slacknotify/Dockerfile --tag github.com/hsmtkk/redesigned-dollop/slacknotify:latest .

login:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com

tag: build
	docker tag github.com/hsmtkk/redesigned-dollop/printext:latest 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:printext-latest
	docker tag github.com/hsmtkk/redesigned-dollop/printname:latest 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:printname-latest
	docker tag github.com/hsmtkk/redesigned-dollop/slacknotify:latest 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:slacknotify-latest

push: tag
	docker push 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:printext-latest
	docker push 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:printname-latest
	docker push 384447982274.dkr.ecr.ap-northeast-1.amazonaws.com/redesigned-dollop:slacknotify-latest
