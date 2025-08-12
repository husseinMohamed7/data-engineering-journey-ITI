# Docker — Complete Guide (Beginner → Practical)

> **TL;DR** — Docker packages applications and their dependencies into lightweight containers that run on a host OS kernel. Containers are fast, portable, and reproducible; Docker provides the tooling (daemon, CLI, images, registry) to build, run, share, and manage them.

---

## 1 — Short history & context
- Docker appeared publicly in 2013 when Solomon Hykes announced it (it grew from the PaaS company **dotCloud**).
- Before Docker, containers (LXC, Solaris Zones, etc.) existed but were complex to package and distribute.
- Docker popularized "Build once, run anywhere" by making containers easy for developers and ops.

---

## 2 — What is a container?
- An isolated user-space instance sharing the host kernel.
- Uses **namespaces** for isolation and **cgroups** for resource limits.
- Containers are essentially processes with their own filesystem, network stack, and PID space.

---

## 3 — Containers vs Virtual Machines
| Virtual Machines | Containers |
|------------------|------------|
| Virtualize hardware, run full OS | Virtualize OS kernel |
| Heavy, slow start-up | Lightweight, instant start |
| Larger footprint | Smaller footprint |

---

## 4 — Key kernel primitives
- **Namespaces** — PID, mount, network, IPC, UTS, user isolation.
- **cgroups** — CPU, memory, I/O limits and accounting.
- **Union filesystems** — layered images for efficiency.

---

## 5 — Docker architecture
- **Docker Client (CLI)** — user interface.
- **Docker Daemon** — builds, runs, manages containers.
- **Images** — read-only templates.
- **Containers** — writable runtime instances.
- **Registry** — stores and shares images.

---

## 6 — Images, layers, and builds
- Images have layers; each Dockerfile instruction adds a layer.
- Use multi-stage builds for smaller final images.
- Best practices: small base images, pin versions, `.dockerignore`.

---

## 7 — Common commands
```bash
docker run hello-world
docker run -it --rm ubuntu bash
docker images
docker ps -a
docker build -t my-app:1.0 .
docker run -d --name my-app -p 8080:80 my-app:1.0
docker exec -it my-app bash
docker stop my-app && docker rm my-app
docker rmi my-app:1.0
docker system prune --volumes
```

---

## 8 — Dockerfile example
```dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY package*.json ./
RUN npm ci --production
USER node
CMD ["node", "dist/index.js"]
```

---

## 9 — Docker Compose
```yaml
version: "3.9"
services:
  web:
    build: .
    ports: ["8080:80"]
    depends_on: ["db"]
  db:
    image: postgres:15
    volumes: ["db-data:/var/lib/postgresql/data"]

volumes:
  db-data:
```

---

## 10 — Orchestration
- **Docker Swarm** — simple clustering.
- **Kubernetes** — advanced, production-grade orchestration.

---

## 11 — Networking & storage
- Networking: bridge (default), host, overlay, macvlan.
- Storage: volumes (managed), bind-mounts (host paths).

---

## 12 — Security
- Run as non-root inside container.
- Use minimal images.
- Never store secrets in images.
- Scan images for vulnerabilities.

---

## 13 — Troubleshooting
```bash
docker logs <container>
docker inspect <container>
docker exec -it <container> sh
docker system df
docker stats
systemctl status docker
journalctl -u docker
```

---

## 14 — Performance tuning
```bash
docker run --memory=512m --cpus=1.0 my-app
```

---

## 15 — Advanced tips
- Use BuildKit for faster builds.
- Use CI/CD to build & push images.
- Immutable images & ephemeral containers for reproducibility.

---

## 16 — Minimal workflow
```bash
docker build -t user/myapp:1.0 .
docker run -d -p 8080:80 user/myapp:1.0
docker push user/myapp:1.0
```

---

## References
- [Docker Docs](https://docs.docker.com/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Namespaces & cgroups](https://man7.org/linux/man-pages/man7/namespaces.7.html)
