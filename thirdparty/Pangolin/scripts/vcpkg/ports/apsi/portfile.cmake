vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO microsoft/APSI
    REF ba71aeb28a9f21e4ad59c45aa88232b099ce0b87 #0.8.2
    SHA512 810bcbe0afa3d1c9d299a85bc4266135bdf9adc33bfc754c59731f6cfa6a89d449fb134cef34c4614742bd50e9f8f3916e5b64998dcea69883ca27b7da3c5f04
    HEAD_REF main
    PATCHES
        fix-find_package.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        log4cplus APSI_USE_LOG4CPLUS
        zeromq APSI_USE_ZMQ
)

set(CROSSCOMP_OPTIONS "")
if (NOT HOST_TRIPLET STREQUAL TARGET_TRIPLET)
    if (VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
        set(CROSSCOMP_OPTIONS -DAPSI_FOURQ_ARM64_EXITCODE=0 -DAPSI_FOURQ_ARM64_EXITCODE__TRYRUN_OUTPUT="")
    endif()
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    DISABLE_PARALLEL_CONFIGURE
    OPTIONS
        "-DAPSI_BUILD_TESTS=OFF"
        "-DAPSI_BUILD_CLI=OFF"
        ${FEATURE_OPTIONS}
        ${CROSSCOMP_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "APSI" CONFIG_PATH "lib/cmake/APSI-0.8")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")

vcpkg_copy_pdbs()
