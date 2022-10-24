#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/bananadroid/android_manifest.git -b 12 -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch banana_ginkgo-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=yanzszs
export KBUILD_BUILD_HOST=jenkins
export BUILD_USERNAME=yanzszs
export BUILD_HOSTNAME=jenkins
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
m banana -j8
# build bananadroid
