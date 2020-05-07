build:
	docker build --file=./Dockerfile --tag=lfq-analyst .

run: build
	docker run -d -p 8080:8080 -p 3838:3838 \
		-e DISABLE_AUTH=true \
		--name='lfq-analyst' \
		-v ${HOME}:/home/rstudio/hostdata \
		lfq-analyst;

	sleep 3;
	firefox 127.0.0.1:8080;
	firefox 127.0.0.1:3838/users/rstudio;
	
stop:
	docker stop lfq-analyst

start:
	docker start lfq-analyst

remove: stop
	docker rm lfq-analyst
	
deploy: build
	docker run -d -p 9001:3838 \
		-e DISABLE_AUTH=true \
		--name='lfq-analyst-deploy' \
		lfq-analyst;

	sleep 3;
	firefox 127.0.0.1:9001/users/rstudio/LFQ-Analyst/;
	
stop-deploy:
	docker stop lfq-analyst-deploy;
	docker rm lfq-analyst-deploy;


