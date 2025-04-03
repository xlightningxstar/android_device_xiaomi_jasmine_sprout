#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
#        vendor/lib/libsample1.so)
#            [ "$2" = "" ] && return 0
#            sed -i 's|/data/misc/sample1|/data/misc/sample2|g' "${2}"
#            ;;
#        vendor/lib64/libsample2.so)
#            [ "$2" = "" ] && return 0
#            "${PATCHELF}" --remove-needed "libsample3.so" "${2}"
#            "${PATCHELF}" --add-needed "libsample4.so" "${2}"
#            ;;

        vendor/lib/libts_face_beautify_hal.so | vendor/lib/libts_detected_face_hal.so | vendor/lib/lib_lowlight.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
	vendor/lib64/libvendor.goodix.hardware.interfaces.biometrics.fingerprint@2.1.so | vendor/lib64/hw/fingerprint.fpc.default.so | vendor.qti.hardware.fingerprint@1.0.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF}" --remove-needed "libhidltransport.so" "${2}"
            "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
        vendor/lib/libmmcamera_faceproc.so)
            [ "$2" = "" ] && return 0
           "${PATCHELF}" --clear-symbol-version "__aeabi_memcpy" "${2}"
           "${PATCHELF}" --clear-symbol-version "__aeabi_memset" "${2}"
           "${PATCHELF}" --clear-symbol-version "__gnu_Unwind_Find_exidx" "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=lavender
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
