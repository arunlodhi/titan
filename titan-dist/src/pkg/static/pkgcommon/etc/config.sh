cd "`dirname $BASH_SOURCE`"
DN="`pwd`"
cd - >/dev/null


declare -r MODULES="berkeleyje cassandra hbase persistit lucene es"
export MODULES

declare -r DEP_DIR="$DN"/../tmp
declare -r PAYLOAD_DIR="$DN"/../payload
export DEP_DIR PAYLOAD_DIR

declare -r LOCAL_REPO_DIR=/srv/aureliuspkg
declare -r LOCAL_REPO_DEB_DIR="$LOCAL_REPO_DIR"/deb
declare -r LOCAL_REPO_RPM_DIR="$LOCAL_REPO_DIR"/rpm
declare -r REPREPRO_CODENAME='unstable'
declare -r RPM_TOPDIR=~/rpmbuild
declare -r S3_REPO_BUCKET='s3://aureliuspkg/'
export LOCAL_REPO_DIR LOCAL_REPO_DEB_DIR LOCAL_REPO_RPM_DIR \
    REPREPRO_CODENAME RPM_TOPDIR S3_REPO_DIR

declare -r M2_REPO=/tmp/aurelius-pkgbuild-repo
declare -r MVN_OPTS="-Dmaven.repo.local=$M2_REPO"
export M2_REPO MVN_OPTS

declare -r SIGNING_KEY_ID=25AC7920
export SIGNING_KEY_ID

if [ ! -e "$M2_REPO" ]; then
    echo "$M2_REPO does not exist.  Symlinking to ~/.m2/repository."
    ln -s ~/.m2/repository "$M2_REPO"
elif [ -L "$M2_REPO" ]; then
    echo "$M2_REPO symlinks to `readlink $M2_REPO`"
else
    echo "$M2_REPO exists but is not a symlink: `ls -l $M2_REPO`"
fi
