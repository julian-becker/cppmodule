project (myapp)

add_executable(myapp main.cpp)
install(TARGETS myapp
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)
