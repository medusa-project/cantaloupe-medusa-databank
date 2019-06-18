# Cantaloupe for databank and medusa
## scripts and configuration notes

Dependency: rclone set up

Clone this into /home/iiif -- the iiif user should be the owner

Copy /etc/init.d/services_startup to that location on server. For copied file, ensure root as owner and 755 as permissions.

Create a dist directory in /home/iiif and put the Cantaloupe war file in it.

The Cantaloupe war is too big to fit in the Medusa Project GitHub repository. It can be downloaded from box by anyone at Illinois with this link: https://uofi.box.com/s/ws7rzabrx1llx3xz2lvpzckgmt3fs6a8

Create symlinks between current versions of files and persistent symlinks. For example:

```
ln -s bin/svc_hooks svc_hooks
ln -s dist/cantaloupe-4.0.3-SNAPSHOT/cantaloupe-4.0.3-SNAPSHOT.war cantaloupe-databank/cantaloupe.war
ln -s dist/cantaloupe-4.0.3-SNAPSHOT/cantalopue-4.0.3-SNAPSHOT.war cantaloupe-medusa/cantaloupe.war
ln -s cantalopue-databank/delegates-4.0.rb cantaloupe-databank/delegates.rb
ln -s cantalopue-databank/cantaloupe-4.0.properties cantaloupe-databank/cantaloupe.properties
ln -s cantaloupe-medusa/cantaloupe-4.0.properties cantaloupe-medusa/cantaloupe.properties
```
Files for different environments are stored in different branches, such as prod and demo.
