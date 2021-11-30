# Inherit AOSP product configuration
$(call inherit-product, device/google/raviole/aosp_raven.mk)

# Remove AOSP prefix from product name
PRODUCT_NAME := raven
