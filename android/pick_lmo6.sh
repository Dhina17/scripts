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
git fetch https://git.libremobileos.com/Dhina17/platform_frameworks_base fifteen-qpr0-los
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
# repopick 14181

# hardware/samsung/nfc
# repopick 14182

# hardware/st/nfc
# repopick 14183-14184

# kernel/configs
# repopick 14185-14190

# packages/apps/FMRadio
# repopick 14580

# packages/apps/FaceUnlock
# repopick 14690

# packages/apps/GameSpace
# repopick 14578

# packages/apps/Launcher3
cd packages/apps/Launcher3
git fetch https://gerrit.libremobileos.com/LMODroid/platform_packages_apps_Launcher3 refs/changes/35/15635/1 && git checkout FETCH_HEAD
cd -

# packages/apps/LMOSettings
repopick 14464

# packages/apps/LMOSystemUI
repopick 14295-14296

# packages/apps/Settings
cd packages/apps/Settings
git fetch https://gerrit.libremobileos.com/LMODroid/platform_packages_apps_Settings refs/changes/38/14438/4 && git checkout FETCH_HEAD
cd -

# packages/apps/ThemePicker
# repopick 14942-14962

# packages/modules/adb
# repopick 14272-14273

# packages/modules/Connectivity
repopick 14969-14981

# packages/services/Telecomm
repopick 14926-14929

# packages/services/VncFlinger
repopick 14826-14827

# system/bpf
# repopick 14191-14192

# system/core
# repopick 13971-13997

# system/extras
# repopick 14193-14195

# system/keymaster
# repopick 14196

# system/libhidl
# repopick 14197

# system/libziparchive
# repopick 14198

# system/logging
# repopick 14199-14200

# system/media
# repopick 14201

# system/netd
# repopick 14476-14477
repopick 14964-14965

# system/security
# repopick 14202

# system/sepolicy
# repopick 13827-13840
# repopick 13864-13866
# repopick 14579
repopick 13837
repopick 13839
repopick 13864-13866

# system/tools/mkbootimg
# repopick 14203

# system/update_engine
# repopick 14219-14226

# system/vold
# repopick 14204-14218

# vendor/lmodroid
# repopick 13824
# repopick 13849-13857
# repopick 13860
# repopick 14573-14576
# repopick 13858-13859
# repopick 14577
repopick 13858-13859
repopick 14966


# vendor/qcom/opensource/commonsys/fm
cd vendor/qcom/opensource/commonsys/fm
git pull https://github.com/LineageOS/android_vendor_qcom_opensource_fm-commonsys refs/changes/61/403061/1
cd -

# Pick props topic
# repopick -t 15-QPR0-props
# repopick -t 15-QPR0-override-props
