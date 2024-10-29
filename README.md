# EDeliver-DevOps

This repository covers the process of deployment of E-Deliver application, dedicated for the management of process of delivery between administrator, deliver and customer.

The application based on **Spring Boot** for backend development, and **Angular** for frontend development, as-well-as **MySQL** for Relational DataBase Management system (RDBMs), is automated after testing it using various types of testing, such as:

- _Unit Testing_: using **JUni5** & **Mockito**, for ensuring the quality of provided Spring Boot backend code and its performance to reduce an important percentage of bugs.
- _Automated Testing_: using **Selenium** & **TestNg**, to ensure the validity of various processes of the application.

Using the following tools:

- _Docker_ & _Docker Compose_: For containerization.
- _GitHub Actions_: For workflow automation of frontend and backend applications of E-Deliver.

## Getting Started

### Important

Ensure that you have **Docker Desktop** installed in your machine, and a **DockerHub account**, already connected with Docker Desktop.

### Before containerization

Before starting containerization, the backend and frontend codes of E-Deliver application will know some minnor changes, such as:

- In frontend code (<a href="https://github.com/E-Deliver/EDeliver-frontend">EDeliver-frontend</a> repository):

  - Editing the budget in **angular.json** file, by adjusting the concerned part by the following:

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

  - Adding **nginx.conf** file, containing the following code:
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
- In backend code (<a href="https://github.com/E-Deliver/backend">EDeliver-backend</a> repository):
  
  - In **application.properties** file, we'll change this ligne of code: ```spring.datasource.url=jdbc:mysql://localhost:3306/edeliver```, with this one: ```spring.datasource.url=jdbc:mysql://mysql:3306/edeliver```

  - Add in the same location of the previous file, the following files as follows:

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

### Preparing Docker Environment to start containerization

In this repository, we added Dockerfiles for <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker/backend/Dockerfile">backend</a> and <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker/frontend/Dockerfile">frontend</a> codes, as-well-as <a href="https://github.com/E-Deliver/EDeliver-DevOps/blob/main/docker-compose.yml">YAML file</a> of Docker Compose, in order to run together the various sides of the application.
