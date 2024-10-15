# Infraestructura EKS para Microservicio

Este repositorio contiene la infraestructura necesaria para desplegar un microservicio en Amazon EKS (Elastic Kubernetes Service).

## Requisitos Previos

- **Cuenta de AWS**: Debes tener una cuenta activa de AWS.
- **AWS CLI**: Herramienta de línea de comandos para gestionar servicios de AWS.
- **kubectl**: Herramienta de línea de comandos para interactuar con Kubernetes.

## Componentes de la Infraestructura

- **EKS Cluster**: Configurado para ejecutar aplicaciones en un entorno escalable y gestionado.
- **Kubernetes Deployments**: Para gestionar la implementación del microservicio.
- **Kubernetes Services**: Para exponer el microservicio mediante un LoadBalancer.

# Instalación de Argo CD en EKS

Este documento describe cómo instalar y configurar Argo CD en un clúster de Amazon EKS.

## Prerrequisitos

- Tener un clúster de EKS en funcionamiento.
- Tener `kubectl` instalado y configurado para acceder al clúster de EKS.
- Acceso a la línea de comandos de AWS.

## Pasos de Instalación

### 1. Crear el Namespace para Argo CD

**Ejecuta el siguiente comando para crear un namespace e instalar Argo CD:**

- kubectl create namespace argocd
- kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

**Verifica la instalacion**

- kubectl get pods -n argocd

**Expone el servicio**

- kubectl expose service argocd-server --type=LoadBalancer --name=argocd-server -n argocd

**Accede a la interfas usuario ArgoCD**
Puedes usar port forwarding para acceder a la interfaz de usuario de Argo CD localmente
- kubectl port-forward svc/argocd-server -n argocd 8080:443

**Obtener la Contraseña del Usuario Admin**
Para acceder a Argo CD, necesitarás la contraseña del usuario admin. Obtén la contraseña con el siguiente comando:
- kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode

**DOCUMENTACION OFICIAL DE ARGOCD**
- https://argo-cd.readthedocs.io/en/stable/


