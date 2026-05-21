install:
	kubectl apply -f applicationset.yaml -n argocd

refresh:
	kubectl annotate applicationset environments-appset \
		argocd.argoproj.io/refresh=normal \
		-n argocd --overwrite
