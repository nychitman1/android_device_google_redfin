#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_HARDWARE := redfin

PRODUCT_VENDOR_KERNEL_HEADERS := device/google/redfin/sm7250/kernel-headers

include build/make/target/product/iorap_large_memory_config.mk
include device/google/redbull/device-common.mk

# LOCAL_PATH is device/google/redbull before this
LOCAL_PATH := device/google/redfin

PRODUCT_SOONG_NAMESPACES += \
    device/google/redfin

DEVICE_PACKAGE_OVERLAYS += device/google/redfin/redfin/overlay

# Audio XMLs for redfin
ifeq ($(wildcard vendor/google_fih/redfin/factory/prebuilt/ftm.mk),)
PRODUCT_COPY_FILES += \
    $(foreach f,$(shell find $(LOCAL_PATH)/audio/ -type f -name "audio_platform_info*.xml"),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))
endif

PRODUCT_COPY_FILES += \
    $(foreach f,$(shell find $(LOCAL_PATH)/audio/ -type f -name "mixer_paths*.xml"),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f))) \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Audio ACDB data
ifeq ($(wildcard vendor/google_fih/redfin/factory/prebuilt/ftm.mk),)
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/audio/acdbdata/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Bluetooth_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/General_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Global_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Handset_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Hdmi_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Headset_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Speaker_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/adsp_avs_config.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/adsp_avs_config.acdb

# Audio ACDB workspace files for QACT
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/audio/acdbdata/workspaceFile.qwsp:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/workspaceFile.qwsp
endif
endif

# CS35L41 B0 SPEAKER AMP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/cs35l41/cs35l41-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/cs35l41-dsp1-spk-cali.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-dsp1-spk-cali.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/R-cs35l41-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/cs35l41-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-dsp1-spk-prot.bin \
    $(LOCAL_PATH)/audio/cs35l41/cs35l41-dsp1-spk-prot.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-dsp1-spk-prot.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/R-cs35l41-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-dsp1-spk-prot.bin

# CS35L41 B0 SPEAKER AMP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/cs35l41/B0/cs35l41-revB0-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB0-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/B0/cs35l41-revB0-dsp1-spk-cali.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB0-dsp1-spk-cali.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/B0/R-cs35l41-revB0-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-revB0-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/B0/cs35l41-revB0-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB0-dsp1-spk-prot.bin \
    $(LOCAL_PATH)/audio/cs35l41/B0/cs35l41-revB0-dsp1-spk-prot.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB0-dsp1-spk-prot.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/B0/R-cs35l41-revB0-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-revB0-dsp1-spk-prot.bin

# CS35L41 B2 SPEAKER AMP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/cs35l41/B2/cs35l41-revB2-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB2-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/B2/cs35l41-revB2-dsp1-spk-cali.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB2-dsp1-spk-cali.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/B2/R-cs35l41-revB2-dsp1-spk-cali.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-revB2-dsp1-spk-cali.bin \
    $(LOCAL_PATH)/audio/cs35l41/B2/cs35l41-revB2-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB2-dsp1-spk-prot.bin \
    $(LOCAL_PATH)/audio/cs35l41/B2/cs35l41-revB2-dsp1-spk-prot.wmfw:$(TARGET_COPY_OUT_VENDOR)/firmware/cs35l41-revB2-dsp1-spk-prot.wmfw \
    $(LOCAL_PATH)/audio/cs35l41/B2/R-cs35l41-revB2-dsp1-spk-prot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/R-cs35l41-revB2-dsp1-spk-prot.bin

# Audio CS35L41 speaker calibration tool
PRODUCT_PACKAGES += \
    crus_sp_cal

# Audio audiozoom config data
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audiozoom.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audiozoom.xml

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.devicestate_listener.enable=true

# Audio Thermal Listener configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_thermal_listener.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_thermal_listener.xml

# Audio Features
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.thermal_listener.enable=true \

ifeq ($(wildcard vendor/google_devices/redfin/proprietary/device-vendor-redfin.mk),)
    BUILD_WITHOUT_VENDOR := true
endif

PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service.redfin

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.redfin

# DRV2624 Haptics Waveform
PRODUCT_COPY_FILES += \
    device/google/redfin/vibrator/drv2624/drv2624.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/drv2624.bin

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vendor.vibrator.hal.config.dynamic=1 \
    ro.vendor.vibrator.hal.click.duration=6 \
    ro.vendor.vibrator.hal.tick.duration=6 \
    ro.vendor.vibrator.hal.heavyclick.duration=6 \
    ro.vendor.vibrator.hal.short.voltage=161 \
    ro.vendor.vibrator.hal.long.voltage=161 \
    ro.vendor.vibrator.hal.long.frequency.shift=10 \
    ro.vendor.vibrator.hal.steady.shape=1 \
    ro.vendor.vibrator.hal.lptrigger=0

# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service.redfin

#per device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/redfin/init.redfin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.redfin.rc

# insmod files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.insmod.redfin.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.redfin.cfg

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.device.rc:recovery/root/init.recovery.redfin.rc

PRODUCT_PACKAGES += \
    sensors.$(PRODUCT_HARDWARE) \

# Thermal HAL config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal_info_config_$(PRODUCT_HARDWARE).json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Support to disable thermal protection at run time
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init.hardware.chamber.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_HARDWARE).chamber.rc
    PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.hardware.wlc.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_PLATFORM).wlc.rc
endif

# GPS ANTENNA_INFO configuration file
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/gnss_antenna_info.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss_antenna_info.conf

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvoiceprocessingdescriptors

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayG5NZ6 \
    SettingsOverlayGD1YQ \
    SettingsOverlayGTT9Q

# Fingerprint HIDL
include device/google/redfin/fingerprint.mk

# SurfaceFlinger configurations
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_idle_timer_ms=80
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_touch_timer_ms=200
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_display_power_timer_ms=1000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.support_kernel_idle_timer=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_content_detection_for_refresh_rate=true

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.defer_fps_frame_count=2

# Keyboard height ratio and bottom padding in dp for portrait mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.height_ratio=1.2 \
    ro.com.google.ime.kb_pad_port_b=10

# Bluetooth Tx power caps for redfin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth_power_limits_redfin_ROW.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_redfin_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_redfin_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_redfin_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_JP.csv

# Missing vendor properties
PRODUCT_PRODUCT_PROPERTIES +=\
    drm.service.enabled=true \
    media.mediadrmservice.enable=true \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno

# Build necessary packages for product
PRODUCT_PACKAGES += \
    libhidltransport.product

# Build necessary packages for system
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \
    libmediaplayerservice:32 \
    libstagefright_httplive:32

# Build necessary packages for system_ext
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    vendor.display.config@1.8 \
    vendor.qti.hardware.cryptfshw@1.0

# Build necessary packages for vendor
PRODUCT_PACKAGES += \
    android.hardware.identity-support-lib.vendor:64 \
    android.hardware.sensors@2.0-ScopedWakelock.vendor:32 \
    android.hardware.sensors@2.0-service.multihal \
    chre \
    ese_spi_st:64 \
    flp.conf \
    libavservices_minijail.vendor:64 \
    libcodec2_hidl@1.0.vendor:64 \
    libcodec2_vndk.vendor \
    libcppbor.vendor:64 \
    libdisplayconfig.qti.vendor:32 \
    libdrm.vendor \
    libgooglecamerahal.vendor \
    libgooglecamerahalutils.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor \
    libjson \
    libkeymaster_messages.vendor:64 \
    libmedia_ecoservice.vendor \
    libnetfilter_conntrack:64 \
    libnfnetlink:64 \
    libnos:64 \
    libnos_client_citadel:64 \
    libnos_datagram:64 \
    libnos_datagram_citadel:64 \
    libnosprotos:64 \
    libnos_transport:64 \
    libprotobuf-cpp-full-vendorcompat \
    libpuresoftkeymasterdevice.vendor:64 \
    libqdutils:32 \
    libqservice:32 \
    libqti_vndfwk_detect.vendor:32 \
    libsoft_attestation_cert.vendor:64 \
    libstagefright_bufferpool@2.0.1 \
    libteeui_hal_support.vendor:64 \
    libtinycompress \
    libtinyxml \
    libvndfwk_detect_jni.qti.vendor \
    libwifi-hal:64 \
    libwifi-hal-qcom \
    nos_app_avb:64 \
    nos_app_identity:64 \
    nos_app_keymaster:64 \
    nos_app_weaver:64 \
    sound_trigger.primary.lito \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor:64 \
    vendor.display.config@1.5.vendor:64 \
    vendor.display.config@1.6.vendor:64 \
    vendor.display.config@1.7.vendor:64 \
    vendor.display.config@1.8.vendor:64 \
    vendor.display.config@1.9.vendor:64 \
    vendor.display.config@2.0.vendor:32 \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor:64 \
    vendor.qti.hardware.cryptfshw@1.0.vendor \
    vendor.qti.hardware.display.allocator@3.0.vendor:64 \
    vendor.qti.hardware.display.allocator@4.0.vendor:64 \
    vendor.qti.hardware.display.mapper@1.0.vendor:64 \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor \
    vendor.qti.hardware.systemhelper@1.0.vendor
