docker build -t kaanyalti/multi-client:latest -t kaanyalti/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kaanyalti/multi-server:latest -t kaanyalti/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kaanyalti/multi-worker:latest -t kaanyalti/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push kaanyalti/multi-client:latest
docker push kaanyalti/multi-client:$SHA
docker push kaanyalti/multi-server:latest
docker push kaanyalti/multi-server:$SHA
docker push kaanyalti/multi-worker:latest
docker push kaanyalti/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cygnetops/multi-server-pgfix-5-11
kubectl set image deployments/client-deployment client=stephengrider/multi-client
kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker