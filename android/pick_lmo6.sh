# To build LMODroid 6 by picking patches from gerrit
# Repo int fifteen branch locally
#
# > repo init -u https://gerrit.libremobileos.com/LMODroid/manifest -b fifteen --git-lfs
#
# Then add zahedan repos to local manifest
# > wget https://katb.in/sugafoquvon/raw -O .repo/local_manifests/zahedan.xml
#
# Then sync
# > repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
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
# repopick 13843

# device/daria/zahedan
if [ -d "device/daria/zahedan" ]; then
    repopick 13862
fi

# device/mediatek/sepolicy_vndr
if [ -d "device/mediatek/sepolicy_vndr" ]; then
    repopick 13965
fi

# external/avb
# repopick 14117-14118

# external/dtc
repopick 14119-14126

# external/e2fsprogs
# repopick 13998-14000

# external/exfatprogs

# external/federated-compute
repopick 14688

# external/flatbuffers
repopick 14689

# external/gptfdisk
# repopick 13966-13970

# external/libcxx
# external/libnl
# external/libvpx

# external/mksh
# repopick 14001-14003

# external/setupcompat
# repopick 14131-14137

# external/tensorflow
repopick 14687

# external/tinycompress
# repopick 14138-14140

# external/webp
# external/wpa_supplicant_8

# external/zstd
# repopick 13847-13848

# frameworks/av
repopick 14311-14336

# frameworks/base
cd frameworks/base
git fetch https://git.libremobileos.com/Dhina17/platform_frameworks_base fifteen-qpr0-new
git checkout FETCH_HEAD
cd -

# frameworks/native
repopick 13846
repopick 14275-14294
repopick 14828

# frameworks/lmodroid
repopick 14523
repopick 14806

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

# hardware/mediatek
DIR="hardware/mediatek"
if [ -d "$DIR" ]; then
    cd $DIR
    git fetch https://github.com/LMODroid-TMP/platform_hardware_mediatek fifteen-qpr0
    git checkout FETCH_HEAD
    cd -
fi

# hardware/libhardware
# repopick 14178-14180

# hardware/ril
# repopick 14181

# hardware/samsung/nfc
# repopick 14182

# hardware/st/nfc
# repopick 14183-14184

# kernel/configs
repopick 14185-14190

# packages/apps/FMRadio
repopick 14580

# packages/apps/FaceUnlock
repopick 14690

# packages/apps/GameSpace
repopick 14578

# packages/apps/Launcher3
repopick 14565-14569

# packages/apps/LMOSettings
repopick 14464

# packages/apps/LMOSystemUI
repopick 14295-14296

# packages/apps/Settings
repopick 14337-14463

# packages/apps/ThemePicker
repopick 14942-14962

# packages/modules/adb
repopick 14272-14273

# packages/services/Telecomm
repopick 14926-14929

# packages/services/VncFlinger
repopick 14826-14827

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
# repopick 14198

# system/logging
# repopick 14199-14200

# system/media
# repopick 14201

# system/netd
repopick 14476-14477
repopick 14963-14965

# system/security
repopick 14202

# system/sepolicy
repopick 13827-13840
# repopick 13864-13866
repopick 14579

# system/tools/mkbootimg
# repopick 14203

# system/update_engine
repopick 14219-14226

# system/vold
repopick 14204-14218

# vendor/lmodroid
repopick 13824
repopick 13849-13857
repopick 13860
repopick 14573-14576
repopick 13858-13859
repopick 14577

# vendor/qcom/opensource/commonsys/fm
cd vendor/qcom/opensource/commonsys/fm
git pull https://github.com/LineageOS/android_vendor_qcom_opensource_fm-commonsys refs/changes/61/403061/1
cd -

# Pick props topic
repopick -t 15-QPR0-props
repopick -t 15-QPR0-override-props
