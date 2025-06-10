# Kaiburr Assessment – Task 2: Kubernetes Deployment

## 🔧 What This Project Does
- Deploys a Java REST API app (Task 1) on Kubernetes
- MongoDB deployed in a separate pod
- Uses PersistentVolume for MongoDB
- Updates TaskExecution to run commands inside Kubernetes pods

## 🐳 Docker Build

```bash
docker build -t <your-dockerhub-username>/task-api .
docker push <your-dockerhub-username>/task-api
```

## ☸️ Kubernetes Deployment

```bash
kubectl apply -f mongo-pvc.yaml
kubectl apply -f mongo-deployment.yaml
kubectl apply -f mongo-service.yaml
kubectl apply -f task-deployment.yaml
kubectl apply -f task-service.yaml
```

## 📸 Screenshots Required
- `kubectl get pods`
- `kubectl get svc`
- Postman testing endpoints
- Your screen with date/time + your name visible

## 💡 TaskExecution Endpoint

Modified to use Kubernetes API to spin up a new pod and run the command.

```java
V1Pod pod = new V1PodBuilder()
  .withNewMetadata().withName("task-run-" + UUID.randomUUID()).endMetadata()
  .withNewSpec()
    .addNewContainer()
      .withName("runner")
      .withImage("busybox")
      .withCommand(Arrays.asList("sh", "-c", task.getCommand()))
    .endContainer()
    .withRestartPolicy("Never")
  .endSpec()
  .build();

api.createNamespacedPod("default", pod, null, null, null);
```

### Dependency

```xml
<dependency>
  <groupId>io.kubernetes</groupId>
  <artifactId>client-java</artifactId>
  <version>18.0.1</version>
</dependency>
```

## ✅ Done
Upload these to GitHub and include screenshots in the README.
