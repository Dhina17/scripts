# To build LMODroid 6.1 by picking patches from gerrit
# Repo int fifteen branch locally
#
# > repo init -u https://gerrit.libremobileos.com/LMODroid/manifest -b refs/changes/75/16275/1 --git-lfs
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

# bionic
repopick 16408-16409

# build / make
repopick 16289-16366

# build / soong
repopick 16367-16407
repopick 16410

# bootable/deprecated-ota
repopick 16504-16506

# bootable/recovery
repopick 16411-16503

# device/generic/common
repopick 16507

# development
repopick 16508

# device/daria/zahedan


# device/mediatek/sepolicy_vndr

# external/avb
repopick 16509-16510

# external/dtc
repopick 16511-16522

# external/e2fsprogs
repopick 16522-16525

# external/exfatprogs

# external/federated-compute
repopick 16526

# external/flatbuffers
repopick 16527

# external/gptfdisk
repopick 16528-16532

# external/libcxx
# external/libnl
# external/libvpx
# external/mksh

# external/setupcompat
repopick 16533-16539

# external/tensorflow
repopick 16540

# external/tinycompress
# external/webp
# external/wpa_supplicant_8

# external/zstd
repopick 16541-16542

# frameworks/av
repopick 16543-16572

# frameworks/base
cd frameworks/base
git fetch https://git.libremobileos.com/Dhina17/platform_frameworks_base fifteen-qpr1
git checkout FETCH_HEAD
cd -

# frameworks/native
repopick 16573-16595

# frameworks/libs/systemui
repopick 16596-16603

# frameworks/lmodroid


# frameworks/opt/colorpicker
repopick 16604

# frameworks/opt/telephony
repopick 16608-16615

# frameworks/opt/timezonepicker
repopick 16605-16607

# hardware/broadcom/libbt
repopick 16616-16623

# hardware/google/camera
repopick 16624

# hardware/google/gchips
repopick 16625

# hardware/google/graphics/common
repopick 16626-16627

# hardware/google/pixel
repopick 16628-16635

# hardware/interfaces
repopick 16636-16648

# hardware/mediatek
# DIR="hardware/mediatek"
# if [ -d "$DIR" ]; then
#     cd $DIR
#     git fetch https://github.com/LMODroid-TMP/platform_hardware_mediatek fifteen-qpr0
#     git checkout FETCH_HEAD
#     cd -
# fi

# hardware/libhardware
repopick 16649-16651

# hardware/ril

# hardware/samsung/nfc

# hardware/st/nfc

# kernel/configs
repopick 16667-16672

# packages/apps/Camera2

# packages/apps/DeskClock
repopick 17258

# packages/apps/FMRadio

# packages/apps/FaceUnlock

# packages/apps/GameSpace
repopick 17258

# packages/apps/Launcher3


# packages/apps/LMOSettings
repopick 17262-17263

# packages/apps/LMOSystemUI
repopick 17260

# packages/apps/ParallelSpace
repopick 17256

# packages/apps/Settings

# packages/apps/TouchGestures
repopick 17257

# packages/apps/ThemePicker

# packages/modules/adb
repopick 17129-17131

# packages/modules/common
repopick 17151

# packages/modules/Connectivity

# packages/services/Telecomm

# packages/services/VncFlinger

# system/bpf

# system/core

# system/extras

# system/keymaster

# system/libhidl

# system/libziparchive

# system/logging

# system/media

# system/netd


# system/security

# system/sepolicy
repopick 17215-17227

# system/tools/mkbootimg

# system/update_engine
repopick 17229-17236

# system/vold
# repopick 14204-14218

# vendor/lmodroid
repopick 16652-16658
repopick 17255

# vendor/qcom/opensource/commonsys/fm
