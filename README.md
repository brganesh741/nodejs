Command Followed Are below:

yarn init 

index.js content is below

const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World! from Version 2')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


yarn add express 

to locally test application is working 

 node index.js   

locahost:3000

Created a docker file 


FROM node:18
WORKDIR /node-js
COPY . .
RUN yarn install 
EXPOSE 3000
CMD ["node", "index.js"]


 docker build -t testing .

then run the docker images via 

 docker run -it -p 3000:3000 testing 


 lsof -i :3000 -> to get the process id of the conflict pricess running on node js port 3000

kill -9 processid from above output

helm create nodejs

updated the values.yaml

helm install nodejs ./nodejs 

got few issues with image pull back,

then created resolved it.

updated values.yaml


it port forward was working 

kubectl port-forward svc/nodejs 3000:3000

even the localhost host inside pod was giviing the output.


had to install nginx as the ingress controllwer for external traffic, as we are not using a cloud provider kubernetes cluster, we can't creata a load balancer.

so we used miikube tunneling and altering the etc/hosts to access the website at http://nodejs-app-test.com/

After this we did a small change to Hello World! from Version 2

and deployed the new verison.

Below is the steps to rollback.

then to list current helm instaled

helm ls 

get the list of verions

helm history nodejs

to rollback

helm rollback nodejs 4 

here 4 is the previous verison.

For scalability then you wouyld need to configure the HPA (Horizontal pod autoscalar) to sent the min and max replicas depelding on the load.


Security you can create secrets, follow RBAC rules here and apply network polices if applicable.
make sure the service is running in cluster ip which comminicates within the cluster.


montioring -> push all the logs to centralized repo which here can be elasticsearch and do a query on it. and depends on the business team as well, if they want a GUI verion then there are toold which are good to have.


****Steps Followed: Summary****

1. Check Minikube is running
2. Docker is Running
3. Helm is avaliable
4. First create sample node js application via yarn init
5. check the running functionality via localhost
6. created a docker file
7. build using the docker file
8. ran the container and checked if we are getting the expected output (Faced port already running issue, which was resolved)
9. then create a help repo
10. updated the values.yaml and deployed the helm chart
11. the pod was not coming up
12. the tag given was refering to a local env, so there was a conflict with envs, so had to push it to docker hub and share reference tag.
13. updated the docker image tag and deployed the new version using helm
14. pod started working
15. getting response locally inside pod
16. getting response via port forwarding
17. but not getting via domain due to nginx ingress not being installed
18. installed nginx ingress via addons command
19. then did a minikube tunneling
20. thne alterted my /etc/hosts and was able to access the domain which said hello world
21. deployemnt -2
22. made chanegs to the index.js
23. chnaged it to verison 2
24. created a docker build
25. pushed it to docker hub
26. updated values in values.yaml
27. deployed a new verision via helm
28. and the accessjng the website I was able to see the new deployed code
29. rollback strategy
30. first get the helm list names
31. get the riviions of the list
32. once you get the histry versuon you can use the helm rollback name version-id
33. to rollback to the previoys version
34. did the same and verified on the domain.


Please let me know if you have any questions.
