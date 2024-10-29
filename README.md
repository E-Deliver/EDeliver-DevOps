# EDeliver-DevOps

Ce dépôt couvre le processus de déploiement de l'application E-Deliver, dédiée à la gestion du processus de livraison entre administrateur, livreur et client.

L'application, basée sur **Spring Boot** pour le développement backend et **Angular** pour le développement frontend, ainsi que **MySQL** comme système de gestion de base de données relationnelle (SGBDR), est automatisée après avoir été testée en utilisant différents types de tests, tels que :

- _Tests Unitaires_: en utilisant **JUni5** & **Mockito**, pour assurer la qualité du code backend Spring Boot et sa performance, réduisant un pourcentage important de bogues.
  
- _Tests Automatisés_: en utilisant **Selenium** & **TestNg**, pour garantir la validité des différents processus de l'application.
  
Utilisation des outils suivants :

- _Docker_ & _Docker Compose_: pour la conteneurisation.
- _GitHub Actions_: pour l'automatisation des workflows des applications frontend et backend d'E-Deliver.

## Prise en main

### Important

Assurez-vous d'avoir **Docker Desktop**  installé sur votre machine et un compte **DockerHub account**, déjà connecté avec Docker Desktop.

### Avant la conteneurisation

Avant de commencer la conteneurisation, les codes backend et frontend de l'application E-Deliver connaîtront quelques changements mineurs, tels que :

- Dans le code frontend (dépôt <a href="https://github.com/E-Deliver/EDeliver-frontend">EDeliver-frontend</a>):

  - Modification du budget dans le fichier **angular.json**, en ajustant la partie concernée par la suivante :

    ```json
      "budgets": [
        {
          "type": "initial",
          "maximumWarning": "5mb",
          "maximumError": "5mb"
        },
        {
          "type": "anyComponentStyle",
          "maximumWarning": "5mb",
          "maximumError": "5mb"
        }
      ],
    ```

  - Ajout du fichier **nginx.conf** contenant le code suivant :
    
    ```
      events {}

      http {
          server {
              listen 80;
      
              location / {
                  root /usr/share/nginx/html;
                  index index.html;
                  try_files $uri $uri/ /index.html;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location /auth {
                  proxy_pass http://edeliver-backend:9090;  
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location /api/clients {
                  proxy_pass http://edeliver-backend:9090;  
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location /api/commandes {
                  proxy_pass http://edeliver-backend:9090;  
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location /api/livreurs {
                  proxy_pass http://edeliver-backend:9090;  
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location /api/utilisateurs {
                  proxy_pass http://edeliver-backend:9090;  
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                  add_header Access-Control-Allow-Credentials true;
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      add_header Access-Control-Allow-Credentials true;
                      return 204;
                  }
              }
      
              location ~ \.(js|css)$ {
                  root /usr/share/nginx/html;
                  include /etc/nginx/mime.types;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
              }
      
              location ~ ^/.+$ {
                  root /usr/share/nginx/html;
                  index index.html;
                  try_files $uri /index.html;
      
                  add_header Access-Control-Allow-Origin *;
                  add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                  add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
      
                  if ($request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin *;
                      add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, PUT, DELETE';
                      add_header Access-Control-Allow-Headers 'Origin, Content-Type, Accept, Authorization';
                      return 204;
                  }
              }
          }
      }
    ```
- Dans le code backend (dépôt <a href="https://github.com/E-Deliver/backend">EDeliver-backend</a>):
  
  - Dans le fichier **application.properties**, nous remplacerons cette ligne de code :
    
    ```
      spring.datasource.url=jdbc:mysql://localhost:3306/edeliver
    ```
    
    par celle-ci :

    ```
      spring.datasource.url=jdbc:mysql://mysql:3306/edeliver
    ```

  - Ajouter les fichiers suivants au même emplacement que le fichier précédent :

    **application-dev.yml**

    ```
    spring:
      application:
        name: EDeliver-backend
    
      datasource:
        url: jdbc:mysql://mysql:3306/edeliver
        username: root
        password: ""
        driver-class-name: com.mysql.cj.jdbc.Driver
    
      jpa:
        properties:
          hibernate:
            dialect: org.hibernate.dialect.MySQLDialect
        hibernate:
          ddl-auto: update
        show-sql: true
    
    server:
      port: 9090
    ```

    **application.yml**

    ```
    spring:
      profiles:
        active: dev
    
      servlet:
        multipart:
          max-file-size: 50MB
    
    springdoc:
      default-produces-media-type: application/json
    
    server:
      port: 9090
      servlet:
        context-path: /
    ```

### Préparation de l'environnement Docker pour démarrer la conteneurisation

Dans ce dépôt, nous avons ajouté les Dockerfiles pour les codes <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker/backend/Dockerfile">backend</a> et <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker/frontend/Dockerfile">frontend</a>, ainsi que le fichier <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker-compose.yml">YAML</a> de Docker Compose, pour exécuter ensemble les différentes parties de l'application.

## Comment exécuter l'application E-Deliver avec Docker ?

_Remarque : Assurez-vous que le moteur Docker dans Docker Desktop est déjà en cours d'exécution._

**IMPORTANT:** veuillez cloner le dépôt avant de passer aux étapes suivantes : ```git clone https://github.com/E-Deliver/EDeliver-DevOps.git```

### Création du conteneur localement :

Assurez-vous d'exécuter les commandes suivantes dans l'ordre :

1. ```cd EDeliver-DevOps``` (change le répertoire actuel vers **EDeliver-DevOps**, où les fichiers du projet sont probablement situés)
2. ```cd EDeliver-backend``` (navigue dans le répertoire **EDeliver-backend**, qui contient les fichiers du projet backend)
3. ```mvn clean package -DskipTests``` (exécute Maven pour nettoyer et empaqueter l'application dans un fichier .jar, en ignorant les tests pour gagner du temps)
4. ```docker build -t edeliver/edeliver-backend:v1 -f ../docker/backend/Dockerfile .``` (construit une **image Docker** pour le backend, étiquetée comme **edeliver/edeliver-backend:v1** et utilisant un **Dockerfile** spécifique pour la configuration)
5. ```cd ..``` (remonte d'un niveau de répertoire, revenant à **EDeliver-DevOps**)
6. ```cd EDeliver-frontend``` (navigue dans le répertoire **EDeliver-frontend**, contenant les fichiers du projet frontend)
7. ```docker build -t edeliver/edeliver-frontend:v1 -f ../docker/frontend/Dockerfile .``` (construit une **image Docker** pour le frontend, étiquetée comme **edeliver/edeliver-frontend:v1** et utilisant un **Dockerfile** spécifique pour la configuration)
8. ```cd ..``` (remonte d'un niveau de répertoire, revenant à **EDeliver-DevOps**)
9. ```docker compose up -d``` (démarre tous les services définis dans le fichier **docker-compose.yml** en mode détaché, les exécutant en arrière-plan)

Ensuite, ouvrez un navigateur et tapez : **http://localhost:4200/**, pour accéder à E-Deliver en mode conteneurisation.
