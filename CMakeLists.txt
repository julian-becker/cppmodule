cmake_minimum_required (VERSION 3.9)


set (CMAKE_CXX_STANDARD 17)






project (mymodule)
set(CMAKE_CXX_CLANG_TIDY "clang-tidy;-checks=*")

include_directories(${PROJECT_SOURCE_DIR}/include)
add_library(mymodule src/main.cpp)

set_target_properties(mymodule PROPERTIES PUBLIC_HEADER 
	${PROJECT_SOURCE_DIR}/include/mymodule/mymodule.h)

install(TARGETS mymodule
        PUBLIC_HEADER DESTINATION include/${CMAKE_PROJECT_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)
