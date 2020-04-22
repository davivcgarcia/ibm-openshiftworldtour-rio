# Preparação

## Sobre

Esse material explica como utilizar o ambiente do IBM Cloud (Shell e Lab) para a parte prática do IBM OpenShift World Tour - Rio.

## Tarefas

0. Acessar o IBM Cloud Shell para termos acesso ao terminal web para os exercícios.

```
https://shell.cloud.ibm.com
```

1. Verificar quais clientes estão disponíveis no seu IBM Cloud Shell:

```
$ oc version
```

```
$ kubectl version --client
```

```
$ odo version
```

```
$ which oc kubectl odo
```

2. Atualizar os clientes para as últimas versões disponíveis via script externo (executar somente uma vez, independente de quantas abas você for usar):

```
$ source <(curl -sL https://bit.ly/34VpXrD)
```

3. Verificar se o script atualizou os binários do IBM Cloud Shell:

```
$ oc version
```

```
$ kubectl version --client
```

```
$ odo version
```

```
$ which oc kubectl odo
```

4. Acessar o ambiente do IBM Cloud Lab, onde teremos um cluster OpenShift 4 disponível para os exercícios (detalhes e credenciais durante o evento):

```
https://openshiftworldtourrio.mybluemix.net/
```

5. Após obter acesso ao ambiente OpenShift, obter as credenciais (contexto) para conexão com o cluster (canto superior direito, em "Copy Login Command) e efetuar o login:

```
$ oc login (...)
```

6. De forma opcional, execute o script de patch para corrigir pequenos desvios do Cloud Lab:

```
$ bash <(curl -sL https://bit.ly/3bAHoQY)
```
