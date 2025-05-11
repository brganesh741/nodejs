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






