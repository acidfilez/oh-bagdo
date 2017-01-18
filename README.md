
Install 'Automatic' strongly recommended

## Automatic Mode, for the lazy ones.

Copy and paste this line the Terminal and press Enter.

```bash
    bash <(curl -H "Cache-Control: no-cache" -sL https://raw.github.com/acidfilez/oh-bagdo/master/install-osx.sh)
```

Enjoy the text flying on the screen, follow the leader.

## Mode Manual, for the aliens.

Create the ~/.oh-bagdo folder, and clone this there!

  on ~/.zshrc , add the following lines at the end of the document:

```
    export HOME_BAGDO=$HOME/.oh-bagdo
    source $HOME_BAGDO/.bagdorc
```

and you are ready to rock.


## Goodies

Install solar4.2 for example

```bash
    bash <(curl -H "Cache-Control: no-cache" -sL https://raw.github.com/acidfilez/oh-bagdo/master/tools/scripts/docker/docker-install-solr42-osx.sh)
```
