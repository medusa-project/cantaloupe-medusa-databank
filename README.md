# Cantaloupe for databank and medusa
## scripts and configuration notes

Dependency: rclone set up

Clone this into /home/iiif -- the iiif user should be the owner

Copy /etc/init.d/services_startup to that location on server. For copied file, ensure root as owner and 755 as permissions.

Create a dist directory in /home/iiif and put the Cantaloupe war file in it.

The Cantaloupe war is too big to fit in the Medusa Project GitHub repository. It can be downloaded from: [https://cantaloupe-project.github.io](https://cantaloupe-project.github.io/)

Create symlinks between current versions of files and persistent symlinks. For example:

```
ln -s bin/svc_hooks svc_hooks
ln -s dist/cantaloupe-5.0/cantaloupe-5.0.jar cantaloupe-databank/cantaloupe.jar
ln -s dist/cantaloupe-5.0/cantalopue-5.0.jar cantaloupe-medusa/cantaloupe.jar
ln -s cantalopue-databank/delegates-5.0.rb cantaloupe-databank/delegates.rb
ln -s cantalopue-databank/cantaloupe-5.0.properties cantaloupe-databank/cantaloupe.properties
ln -s cantaloupe-medusa/cantaloupe-5.0.properties cantaloupe-medusa/cantaloupe.properties
```
Files for different environments are stored in different branches, such as prod and demo.
