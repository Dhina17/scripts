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

# art

# build / make
repopick 14004-14077

# build / soong
repopick 14078-14110

# bootable/deprecated-ota
repopick 13953-13955

# bootable/recovery
repopick 13867-13952

# device/generic/common
repopick 14116

# development
repopick 13843

# device/daria/zahedan
repopick 13862-13863

# Pick build fix from device/lineage/sepolicy
cd device/lineage/sepolicy
git fetch https://github.com/LMODroid-TMP/platform_device_lineage_sepolicy 467ed968543f9c808943c98aff8165ca7dbe4e80
git cherry-pick FETCH_HEAD
cd -

# device/mediatek/sepolicy_vndr
repopick 13965

# external/avb
repopick 14117-14118

# external/dtc
repopick 14119-14126

# external/e2fsprogs
repopick 13998-14000

# external/exfatprogs
# external/federated-compute
# external/flatbuffers

# external/gptfdisk
repopick 13966-13970

# external/libcxx
# external/libnl
# external/libvpx

# external/mksh
repopick 14001-14003

# external/setupcompat
repopick 14131-14137

# external/tensorflow

# external/tinycompress
repopick 14138-14140

# external/webp
# external/wpa_supplicant_8

# external/zstd
repopick 13847-13848

# frameworks/lmodroid
repopick 13845

# frameworks/opt/colorpicker
repopick 14141

# frameworks/opt/telephony
repopick 14142-14152

# frameworks/opt/timezonepicker
repopick 14153-14155

# hardware/broadcom/libbt
repopick 14156-14163

# hardware/google/gchips
repopick 14164

# hardware/google/graphics/common
repopick 14165-14166

# hardware/google/pixel
repopick 13958-13964

# hardware/interfaces
repopick 14167-14177

# hardware/libhardware
repopick 14178-14180

# hardware/ril
repopick 14181

# hardware/samsung/nfc
repopick 14182

# hardware/st/nfc
repopick 14183-14184

# kernel/configs
repopick 14185-14190

# packages/apps/Gallery2
cd packages/apps/Gallery2
git fetch https://github.com/LineageOS/android_packages_apps_Gallery2 refs/changes/98/402398/1 && git cherry-pick FETCH_HEAD
cd -

# system/bpf
repopick 14191-14192

# system/core
repopick 13971-13997

# system/extras
repopick 14193-14195

# system/keymaster
repopick 14196

# system/libhidl
repopick 14197

# system/libziparchive
repopick 14198

# system/logging
repopick 14199-14200

# system/media
repopick 14201

# system/netd

# system/security
repopick 14202

# system/sepolicy
repopick 13827-14111

# system/tools/mkbootimg
repopick 14203

# system/update_engine
repopick 14219-14226

# system/vold
repopick 14204-14218

# vendor/lmodroid
repopick 13824-13861
