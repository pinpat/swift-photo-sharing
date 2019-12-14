cd ./server && npm run build && cd ..
scp -i ./private.pem -r ./server/dist ec2-user@3.212.245.106:/var/www/yaad/
scp -i ./private.pem ./server/Dockerfile ec2-user@3.212.245.106:/var/www/yaad/
scp -i ./private.pem ./server/docker-compose.yml ec2-user@3.212.245.106:/var/www/yaad/
scp -i ./private.pem ./server/package.json ec2-user@3.212.245.106:/var/www/yaad/
scp -i ./private.pem ./server/tsconfig.json ec2-user@3.212.245.106:/var/www/yaad/
scp -i ./private.pem ./server/ormconfig.js ec2-user@3.212.245.106:/var/www/yaad/
ssh -i ./private.pem ec2-user@3.212.245.106 'cd /var/www/yaad; docker-compose up -d --build'