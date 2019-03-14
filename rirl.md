# RiRL WebDeploy Solution Design
Solution to the [WebDeploy](https://github.com/watchmen-test/webdeploy) exercise.



## Approach

Using Kubernetes (K8S), Docker, NGINX...


1. Create Docker container using nginx to serve content.
2. Deploy solution using local Kubernetes cluster (minikube/kubectl).
3. Multiple instances via K8S replica sets.
4. Using K8S to provide rolling updates (no outages).



### Assumptions

1. Minikube and kubectl are installed and available.
2. Developed on Ubuntu Server 18.04.02 (VmWare workstation).
3. Validated on Mac OS 10.14 (Mojave: VmWare workstation).


