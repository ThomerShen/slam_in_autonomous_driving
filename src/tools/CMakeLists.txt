
add_library(${PROJECT_NAME}.tools
    ui/pangolin_window.cc
    )

target_link_libraries(${PROJECT_NAME}.tools
    ${third_party_libs}
    )
