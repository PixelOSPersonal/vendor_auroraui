LOCAL_PATH := vendor/auroraui/audio
LOCAL_PATH_FWB := frameworks/base/data/sounds

ALARM_FILES := Argon Carbon Helium Krypton Neon Oxygen Osmium Platinum Timer
NOTIFICATION_FILES := Ariel Ceres Carme Elara Europa Iapetus Io Rhea Salacia Titan Tethys
RINGTONE_FILES := Atria Callisto Dione Ganymede Luna Oberon Phobos Pyxis Sedna Titania Triton \
	Umbriel
EFFECT_FILES := Dock InCallNotification KeypressInvalid Lock LowBattery \
    NFCFailure NFCInitiated NFCSuccess NFCTransferComplete NFCTransferInitiated \
    Trusted Undock Unlock

# Alarms

PRODUCT_COPY_FILES += $(foreach fn,$(ALARM_FILES),\
    $(LOCAL_PATH_FWB)/alarms/material/ogg/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/$(fn).ogg)

$(foreach f, $(wildcard $(LOCAL_PATH)/alarms/*.m4a), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/$(notdir $f)))

# Ringtones

PRODUCT_COPY_FILES += $(foreach fn,$(RINGTONE_FILES),\
    $(LOCAL_PATH_FWB)/ringtones/material/ogg/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/$(fn).ogg)

$(foreach f, $(wildcard $(LOCAL_PATH)/ringtones/*.m4a), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/$(notdir $f)))

# Notifications

PRODUCT_COPY_FILES += $(foreach fn,$(NOTIFICATION_FILES),\
    $(LOCAL_PATH_FWB)/notifications/material/ogg/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/$(fn).ogg)

$(foreach f, $(wildcard $(LOCAL_PATH)/notifications/*.m4a), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/$(notdir $f)))

# UI

PRODUCT_COPY_FILES += $(foreach fn,$(EFFECT_FILES),\
    $(LOCAL_PATH_FWB)/effects/ogg/$(fn).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(fn).ogg)

$(foreach f, $(wildcard $(LOCAL_PATH)/ui/*.ogg), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(notdir $f)))

# 2by2-side
$(foreach f, $(wildcard $(LOCAL_PATH)/2by2/*.mp3), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/$(notdir $f)))
$(foreach f, $(wildcard $(LOCAL_PATH)/2by2/*.mp3), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/$(notdir $f)))

# Default Sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Frail_Naysayer.mp3 \
    ro.config.alarm_alert=Alarm003304.m4a \
    ro.config.notification_sound=Notice003101.m4a
