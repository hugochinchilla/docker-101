from lib import helpers, settings
from oraide import Session, keys

# stary clean
helpers.reset()

s = Session('demo')
with s.auto_advance():
    s.enter('cd')
    s.enter('mkdir {}'.format(settings.DEMO_PATH))
    s.enter('cd {}'.format(settings.DEMO_PATH))

with s.auto_advance():
    s.enter('vim Dockerfile')
    s.teletype('i')
    s.enter('FROM debian:jessie')
    s.enter('RUN apt-get update')
    s.enter('RUN apt-get install -y cowsay', after=keys.escape)
s.enter(':x')

s.enter('docker build -t cowsay .')
s.enter('docker run cowsay')
s.enter('docker run cowsay /usr/games/cowsay')
s.enter('docker run cowsay /usr/games/cowsay "hola mundo"')

with s.auto_advance():
    s.enter('vim Dockerfile')
    s.teletype('jjo')
    s.enter('CMD ["/usr/games/cowsay"]', after=keys.escape)
s.enter(':x')

s.enter('docker build -t cowsay .')
s.enter('docker run cowsay')
s.enter('docker run cowsay "hola betabeers"')

with s.auto_advance():
    s.enter('vim Dockerfile')
    s.teletype('jjjdwi')
    s.enter('ENTRYPOINT ', after=keys.escape)
s.enter(':x')

s.enter('docker build -t cowsay .')
s.enter('docker run cowsay')
s.enter('docker run cowsay "ahora si, hola betabeers"')

with s.auto_advance():
    s.enter('vim Dockerfile')
    s.teletype('jjjo')
    s.enter('CMD ["--help"]', after=keys.escape)
s.enter(':x')

s.enter('docker build -t cowsay .')
s.enter('docker run cowsay')
s.enter('docker run cowsay "hola otra vez"')
