# Devops-Infra-Final


## This repository contains terraform code that provisions AWS EKS cluster with EKS managed node group and access to the internet (public) and a "classic" LB. Can be Optionally built automatically with github actions with a push command to branch "main". in addition, has a terraform destroy ability if a commit is pushed to branch "destroy" a pipeline condition will be triggered and run "terraform destroy" 


***Work-in-progress: manifests (within the k8s directory) are currently being applied manually with the steps provided below***


### Prerequisites

- AWS cli configured
- Github repositroy access
- Kubernetes with kubectl installed


***In-order to apply the k8s manifests, you HAVE to wait untill the terraform files are fully done provisioning the resources and then run the commands below***


### Terraform Steps : 

1. Clone main repository
```
git clone git@github.com:alonwillmakeit/Devops-Infra-Final.git && cd Devops-Infra-Final && echo "Generic commit to trigger CI" > genericfiletorunCI.txt
```
2. Run 
```
git add . && git commit -m "commit to trigger CI" && git push
```


************************************************************************************************************




### K8S application (Counter-Service.py) deployment steps : 

1. Run
```
aws eks --region us-east-1 update-kubeconfig --name demo
```
2. Apply your manifests into the cluster
```
kubectl apply -f k8s/deployment.yaml && kubectl apply -f k8s/service.yaml
```
3. Might need to wait 1-2 minutes of LB to fully registers and run
```
kubectl get svc | awk '/counter-service/ {print $4}'
```
If you still don't still a AWS URL, the LB still didn't finish proccessing, 
when you do see the URL, u can access it and access our application!


## Results :

Now we have created an EKS cluster with our apllication deployed on , that can be accessed throught the link received in step 3 in K8S application



