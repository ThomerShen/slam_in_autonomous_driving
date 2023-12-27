
add_library(${PROJECT_NAME}.common
    timer/timer.cc
    )

target_link_libraries(${PROJECT_NAME}.common
    ${PROJECT_NAME}.tools
    ${catkin_LIBRARIES}
    ${PCL_LIBRARIES}
    )
