install:
	kubectl apply -f applicationset.yaml -f cluster-dependencies-applicationset.yaml -n argocd

refresh:
	kubectl annotate applicationset environments-appset \
		argocd.argoproj.io/refresh=normal \
		-n argocd --overwrite
	kubectl annotate applicationset cluster-dependencies-appset \
		argocd.argoproj.io/refresh=normal \
		-n argocd --overwrite
