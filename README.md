# Docker 101

Charla presentada en Betabeers mallorca el jueves 25 de Junio del 2015

Para visualizar la presentación necesitarás un servidor web, desde una terminal y en la raiz del proyecto puedes usar `php -S 127.0.0.1:9000` y abrir la url http://127.0.0.1:9000 en tu navedador.

También siguiendo la linea de la presentación puedes usar este contenedor para visualizarla:

```
docker run -d -p 9000:80 -v `pwd`:/www fnichol/uhttpd
```

## Actualziado 2015-07-23

Añadida la carpeta [examples](examples) usada en la demo en la UIB
