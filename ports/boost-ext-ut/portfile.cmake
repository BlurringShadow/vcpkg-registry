vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boost-ext/ut
    REF v1.1.9
    HEAD_REF master
    SHA512 81a6b80948d3a203534244f62f5f3ac57593083cc0c32484498a7d01d29455f7dcb33e2ec0587609b8dff33a81a5551796d7681d48fd93e817d6d0c31697234e
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ut TARGET_PATH share/ut)

configure_file("${LICENSE_FILE}" "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" COPYONLY)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug
                    ${CURRENT_PACKAGES_DIR}/lib
)
