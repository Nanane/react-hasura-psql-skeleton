# import .env variables
source ./.env

# GLOBAL CONSTANTS
NGINX_TEMPLATE_FILE=/etc/nginx/sites-available/template
NGINX_SITES_AVAILABLE=/etc/nginx/sites-available
NGINX_SITES_ENABLED=/etc/nginx/sites-enabled

# PROJECT SPECIFIC CONSTANTS
WEB_DOMAIN=${PROJECT_NAME}.nanane.tech
NGINX_WEB_CONFIG_FILE=${NGINX_SITES_AVAILABLE}/${PROJECT_NAME}
NGINX_WEB_SYMLINK=${NGINX_SITES_ENABLED}/${PROJECT_NAME}

HASURA_DOMAIN=${PROJECT_NAME}-hasura.nanane.tech
NGINX_HASURA_CONFIG_FILE=${NGINX_SITES_AVAILABLE}/${PROJECT_NAME}-hasura
NGINX_HASURA_SYMLINK=${NGINX_SITES_ENABLED}/${PROJECT_NAME}-hasura

# MAKE SURE DNS IS CONFIGURED PROPERLY
echo "/------\\"
echo "| Make sure you created a DNS entry for :"
echo "| - ${WEB_DOMAIN}"
echo "| - ${HASURA_DOMAIN}"
echo "/----------\\"

read -p "Take a moment to verify your DNS configuration. Once it's ok, press [Enter]" noop


# WEB SETUP
sudo cp $NGINX_TEMPLATE_FILE $NGINX_WEB_CONFIG_FILE
sudo sed -i "s/{name}/${WEB_DOMAIN}/g" $NGINX_WEB_CONFIG_FILE    
sudo sed -i "s/{port}/${NGINX_PORT}/g" $NGINX_WEB_CONFIG_FILE
sudo ln -s $NGINX_WEB_CONFIG_FILE $NGINX_WEB_SYMLINK

# HASURA SETUP
sudo cp $NGINX_TEMPLATE_FILE $NGINX_HASURA_CONFIG_FILE
sudo sed -i "s/{name}/${HASURA_DOMAIN}/g" $NGINX_HASURA_CONFIG_FILE
sudo sed -i "s/{port}/${HASURA_PORT}/g" $NGINX_HASURA_CONFIG_FILE
sudo ln -s $NGINX_HASURA_CONFIG_FILE $NGINX_HASURA_SYMLINK 

# SSL setup for both new domains
sudo certbot run -d ${WEB_DOMAIN},${HASURA_DOMAIN}

# Restart NGINX
sudo service nginx restart

echo "If your installation went successfully, you can now run `docker-compose up -d` and access :"
echo "  - ${WEB_DOMAIN} for your app"
echo "  - ${HASURA_DOMAIN} for the graphql console"
