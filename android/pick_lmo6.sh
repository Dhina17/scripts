# To build LMODroid 6 by picking patches from gerrit
# Repo int fifteen branch locally
# repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b fifteen --git-lfs
#
# Then pick the Android 15 manifest to .repo/manifests/
# 13821: manifest: Android 15 release | https://gerrit.libremobileos.com/c/LMODroid/manifest/+/13821
#
# Then sync
# repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
#
# Now run this script from the root of the source dir
#

set -e

source build/envsetup.sh
source vendor/lmodroid/build/envsetup.sh

# build / make
repopick 14004-14077

# build / soong
repopick 14078-14110

# device/daria/zahedan
repopick 13862-13863

# Pick build fix from device/lineage/sepolicy
cd device/lineage/sepolicy
git fetch https://github.com/LMODroid-TMP/platform_device_lineage_sepolicy 467ed968543f9c808943c98aff8165ca7dbe4e80
git cherry-pick FETCH_HEAD
cd -

# device/mediatek/sepolicy_vndr
repopick 13965

# external/zstd
repopick 13847-13848

# frameworks/lmodroid
repopick 13845

# hardware/google/pixel
repopick 13958-13964

# system/sepolicy
repopick 13827-14111

# vendor/lmodroid
repopick 13824-13861
