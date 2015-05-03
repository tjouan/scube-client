#!/usr/bin/env sh

set -e

target_prod="scube:www/clients/ember"

eval target=\$target_$1
if [ -z "$1" -o -z "$target" ]; then
  echo "ERROR: Please specify a valid deployment target (prod)"
  exit 64
fi
eval target_host=\$target_$1_host
eval target_path=\$target_$1_path

options="-acl --force --delete --delete-before --progress --omit-dir-times"
mode="--chmod=Du+rwx,Dg+x,Do+x,Fu+rw,Fg+r,Fo+r"
exclude="--exclude /bin/deploy.sh --exclude-from=config/rsync_exclude"

args="$options $mode $exclude"


echo "Cleaning compiled assets..."
find public/assets -type f -not -name .\* -exec rm {} \;
echo "Compiling assets..."
APP_ENV=production zassets

# FIXME: temporary hack to compile the index, because zassets doesn't support
# helpers yet.
./bin/build_index.rb public/assets/manifest.json > tmp/index.html

echo

echo "The following directories and/or files will be deployed:"
echo "------------------------------------------------------------------------"
echo "> Target: $1, $target"
rsync -n $args ./ $target/
rsync -n $options $mode ./tmp/index.html $target/public/index.html
echo "------------------------------------------------------------------------"

echo -n "Please confirm deployment (yes/no): "
read yn
if [ "$yn" = "yes" ]; then
  echo
  echo "Deploying..."
  echo "------------------------------------------------------------------------"
  rsync $args ./ $target/
  rsync $options $mode ./tmp/index.html $target/public/index.html
  echo "------------------------------------------------------------------------"
  echo
else
  echo "Deployment has been cancelled."
  exit 70
fi
