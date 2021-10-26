# copy .env.template file
read -p "What's the project name (letters or _ only) ? This will be used as database name and user's name : " project_name
read -p "What will be the project NGINX port ? " nginx_port
read -p "What will be the project POSTGRES port ? " postgres_port
read -p "What is the POSTGRES password ? " postgres_password
read -p "What will be the project HASURA port ? " hasura_port
read -p "What is the HASURA password ? " hasura_password

# .ENV
echo "Populating .env file : begin"
cp .env.template .env
sed -i "s/{project_name}/${project_name}/g" .env
sed -i "s/{nginx_port}/${nginx_port}/g" .env
sed -i "s/{postgres_port}/${postgres_port}/g" .env
sed -i "s/{postgres_password}/${postgres_password}/g" .env
sed -i "s/{hasura_port}/${hasura_port}/g" .env
sed -i "s/{hasura_password}/${hasura_password}/g" .env
echo "Populating .env file : success"

echo "Your project is initialized. Now you can run the `add-reverse-proxy.sh` script to configure the reverse proxy automatically"