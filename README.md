Steps to Re-produce stateless application deployment and rolling updates.


# Create a Dockerfile to add the frontend assets and build the image from root directory #

 docker build .

# Create a docker private or local registry to push the image updates #

# Login to docker registry to authenticate yourself #

docker login (prompts for username and password)

# Tag and push the image to the registry #

docker tag $IMAGEID repo/image:tag
docker push repo/image:tag

# To run a kubernetes cluster with the container pushed to local or private registry #

kubectl run $container --image=repo/image:tag --port=80

# To Expose as a service #

kubectl expose deployment $container --type=NodePort

# To open the exposed endpoint in the browser #

  minikube service $container
 (This will open the html page on the browser)

# View the kubernetes dashboard via #

minikube dashboard

# For any rolling updates, Update the image to latest version and push it to registry again #
kubectl set image deployment/$container $container =repo/image:tag
(Leveraging rolling updates will benefit in Zero downtime)

# To achieve a multi instance pod, we can scale the deployment to the number desired. #

![alt text](https://github.com/chandrakothapally/webdeploy/blob/master/scale_deployment.png)
