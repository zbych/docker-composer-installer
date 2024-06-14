# Usage

1. Copy auth.json.sample to auth.json and configure.
2. Build: $ docker builder build . --build-arg PHP_VERSION=8.3 . -t docker-composer-installer:8.3
3. Run Container: $ docker run -it --rm -v .:/var/www docker-composer-installer:8.3 /bin/bash
4. In Container: 
  - $ su - www-data
  - $ composer create-project ...
