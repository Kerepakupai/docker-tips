### Crear e Iniciar un Contenedor con Docker

#### Ejecutar un contenedor
```powershell
docker run <container>
docker run --name <name> <container>
```

#### Ejecutar comando en contenedor
```powershell
docker exec -it <container> <comando>
```

#### Modo interactivo
```powershell
docker run -it <container>
dicker run --name <name> -d <container> tail -f /dev/null
```

#### Exponiendo contenedores
```powershell
docker run -d --name <name> -p <local_port>:<container_port> <container>
```

#### Acceder a los logs de un contenedor
```powershell
docker logs NOMBRE
docker logs -f NOMBRE
docker logs --tail 10 -f proxy
```

#### Renombrar contenedor
```powershell
docker rename ANTERIOR NUEVO
```

####  Estado de contenedores
```powershell
docker ps
docker ps -a
docker inspect ID
docker inspect NOMBRE
docker inspect --format '{{.State.Pid}}' NOMBRE
```

#### Detener un contenedor
```powershell
docker stop NOMBRE
```

#### Eliminar contenedores
```powershell
docker rm NOMBRE
docker rm -f NOMBRE     #
docker container prune
```

### Datos en Docker

#### Bind mounts (pruebas)
```powershell
docker run -d --name NOMBRE contenedor -v PATH_LOCAL:PATH_CONTENEDOR 
```

#### Volumenes (recomendado)
```powershell
docker volume ls              # listar volumenes creados
docker volume create NOMBRE   # crear volumen
```

```powershell
docker run -d --name NOMBRE --mount src=V_NOMBRE,dst=PATH_CONTENEDOR contenedor
```

#### Insertar y extraer archivos de un contenedor
```powershell
docker cp ARCHIVO_ORIGEN CONTENEDOR:PATH_CONTENEDOR  # copiar desde local a contenedor
docker cp CONTENEDOR:ARCHIVO_A_COPIAR DST_LOCAL      # copiar desde contenedor a local
```

### Imagenes en Docker

#### Listas imagenes disponibles
```powershell
docker image ls
```

#### Descargar imagenes
```powershell
docker pull <image>:<tag>
```

#### Crear imagenes (plantilla)
`Dockerfile`
```powershell
FROM ubuntu:latest
RUN touch /usr/src/hola-platzi.txt
```
#### Construir imagen
```powershell
docker build -t <base_image>:<tag> <context>
```

#### Ejecutar contenedor basado en la imagen
```powershell
docker run -it <image>:<tag>
```

#### Publicar imagen
```powershell
docker login -u <username> -p <password> # Conectarse a dockerhub
docker tag <image>:<tag> <username>/<image>:<tag> # Retaggear una imagen para publicar
docker push <username>/<image>:<tag> # Publicar imagen a docker hub 
```

### Sistema de capas
```powershell
docker history <image>:<tag>
```

#### Detalle de capas con `dive`
```powershell
dive <image>:<tag>
```

### Desarrollo de aplicaciones con Docker

`Dockerfile`

#### Construir imagen
```powershell
docker build -t <image_name> <context> 
```

#### Ejecutar contenedor
```powershell
docker run --rm -d -p <local_port>:<container_port> <image>  # -rm elimina el contenedor al salir
```

#### Aprovechando cache para estructurar correctamente las imagenes
`Dockerfile`

#### Ejecutar contenedor
```powershell
docker run --rm -d -p <local_port>:<container_port> -v <local_path>:<contenedor_path> <container>
```


### Docker networking
```powershell
docker network ls
docker network inspect <network_name>
```

#### Create network
```powershell
docker network create --attachable <network_name>  # Permitir conexion de otros containers
```

#### Conectar contenedor a una red
```powershell
docker network connect <network_name> <container>
```

#### Ejecutar contenedor conectado a la red
```
docker run -d --name <container_name> -p <local_port>:<container_port> --env <var_name>=<var_value> <container>  
```


### Docker Compose
`docker-compose.yml`

#### Ejecutar contenedores
```powershell
docker-compose up
docker-compose up -d
```

#### Comandos utiles
```powershell
docker-compose ps
docker-compose logs <service_name>
docker-compose logs -f <service_name> <service_name> # ver logs de servicios
docker-compose exec <service_name> <comando> # ejecutar comando
docker-compose down # destruir todos los servicios y contenedores
```

#### Desarrollando con Docker Compose
```powershell
docker-compose build
docker-compose up -d
docker-compose build <service_name>
```


#### Compose en equipo: override
`docker-compose.override.yml`

#### Escalar servicios
```powershell
docker-compose up -d --scale app=2
```