## How to run a docker container
### Generic - 
docker run --name=user_mysql_1 --env="MYSQL_ROOT_PASSWORD=root_password" -p 3306:3306 -d mysql:latest

### ToolShed Specific -
```bash 
docker run --name=toolshed_db_mysql --env="MYSQL_ROOT_PASSWORD=tool_shed" -p 3306:3306 -d mysql:latest
```

## How to access the mysql db in the terminal
### Generic - 
docker exec -it user_mysql_1 mysql -uroot -proot_password
### ToolShed Specific - 
```bash
docker exec -it toolshed_db_mysql mysql -uroot -ptool_shed
```