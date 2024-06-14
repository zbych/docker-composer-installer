# Usage

1. Copy auth.json.sample to auth.json and configure.
2. Build: `$ docker builder build . --build-arg PHP_VERSION=8.3 . -t docker-composer-installer:8.3`
3. Go to directory where project should be installed, eg: cd /home/foo/dev/
4. Run Container: `$ docker run -it --rm --name installer -v .:/var/www docker-composer-installer:8.3 /bin/bash`
5. Enter Container `$ docker exec -it installer /bin/bash`
6. Inside Container: 
  - `$ su - www-data`
  - `$ composer create-project ...`
