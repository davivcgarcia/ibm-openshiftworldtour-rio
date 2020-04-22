# Operação modo Kubernetes

## Sobre

Nesse laboratório iremos explorar o fluxo de trabalho padrão a nível de Kubernetes, usando uma imagem base disponível em um registry externo público.

## Tarefas

1. Crie um namespace (projeto) para armazenar os recursos:

```
$ kubectl create namespace demo-kubernetes
```

2. Crie um deployment para implantar a aplicação de exemplo, hospedada no Quay.io (registry):

```
$ kubectl create deployment helloworld --image=quay.io/davivcgarcia/ubi-helloworld -n demo-kubernetes
```

3. Verifique que a aplicação está em execução:

```
$ kubectl get pods -n demo-kubernetes
```

4. Crie um serviço para expor o deployment na porta tcp/8080 (aplicação):

```
$ kubectl expose deployment helloworld --port=8080 -n demo-kubernetes
```

5. Valide o serviço criado:

```
kubectl get service -n demo-kubernetes
```

6. Crie um ingress para expor publicamente a aplicação através de uma URL (L7LB):

```
$ INGRESS_DOMAIN=$(kubectl get Ingress.config.openshift.io cluster -o=jsonpath='{.spec.domain}')
```
```
$ cat <<EOF > ingress-example.yml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: helloworld
spec:
  rules:
  - host: helloworld.$INGRESS_DOMAIN
    http:
     paths:
     - path: /
       backend:
        serviceName: helloworld
        servicePort: 8080
EOF
```

```
$ kubectl apply -f ingress-example.yml -n demo-kubernetes
```

6. Acesse sua aplicação via URL exibida no comando abaixo:

```
$ echo helloworld.$INGRESS_DOMAIN
```

7. Podemos também expor a aplicação via um serviço do tipo LoadBalancer, usando o LBaaS do IBM Cloud:

```
kubectl expose deployment helloworld --name helloworld-ext --port=8080 --type=LoadBalancer -n demo-kubernetes
```

6. Acesse sua aplicação via URL exibida no comando abaixo:

```
$ LB_IP=$(kubectl get service helloworld-ext -n demo-kubernetes -o=jsonpath='{.status.loadBalancer.ingress[*].ip}')
```

```
$ LB_PORT=$(kubectl get service helloworld-ext -n demo-kubernetes -o=jsonpath='{.spec.ports[*].nodePort}')
```

```
$ echo http://$LB_IP:$LB_PORT
```
