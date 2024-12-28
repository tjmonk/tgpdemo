cmake_minimum_required(VERSION 3.10)

project(tgp
	VERSION 0.1
	DESCRIPTION "The Gateway Project"
)

set(CMAKE_INSTALL_PREFIX /tgp)

add_subdirectory(/tgp/varserver ${CMAKE_BINARY_DIR}/varserver)
add_subdirectory(/tgp/varcreate ${CMAKE_BINARY_DIR}/varcreate)
add_subdirectory(/tgp/libtjson ${CMAKE_BINARY_DIR}/libtjson)
add_subdirectory(/tgp/execvars ${CMAKE_BINARY_DIR}/execvars)
add_subdirectory(/tgp/filevars ${CMAKE_BINARY_DIR}/filevars)
add_subdirectory(/tgp/libvaraction ${CMAKE_BINARY_DIR}/libvaraction)
add_subdirectory(/tgp/actions ${CMAKE_BINARY_DIR}/actions)
add_subdirectory(/tgp/statemachine ${CMAKE_BINARY_DIR}/statemachine)
add_subdirectory(/tgp/loadconfig ${CMAKE_BINARY_DIR}/loadconfig)
add_subdirectory(/tgp/savesvc ${CMAKE_BINARY_DIR}/savesvc)
add_subdirectory(/tgp/libtjwt ${CMAKE_BINARY_DIR}/libtjwt)
add_subdirectory(/tgp/sessionmgr ${CMAKE_BINARY_DIR}/sessionmgr)
add_subdirectory(/tgp/procmon ${CMAKE_BINARY_DIR}/procmon)
add_subdirectory(/tgp/templatesvc ${CMAKE_BINARY_DIR}/templatesvc)
add_subdirectory(/tgp/varmsg ${CMAKE_BINARY_DIR}/varmsg)
#add_subdirectory(/tgp/udpt ${CMAKE_BINARY_DIR}/udpt)
add_subdirectory(/tgp/manifest ${CMAKE_BINARY_DIR}/manifest)

add_subdirectory(/tgp/fcgi_auth ${CMAKE_BINARY_DIR}/fcgi_auth)
add_subdirectory(/tgp/fcgi_vars ${CMAKE_BINARY_DIR}/fcgi_vars)
add_subdirectory(/tgp/fcgi_proc ${CMAKE_BINARY_DIR}/fcgi_proc)
add_subdirectory(/tgp/fcgi_test ${CMAKE_BINARY_DIR}/fcgi_test)
add_subdirectory(/tgp/mqttvars ${CMAKE_BINARY_DIR}/mqttvars)
#add_subdirectory(../libluavars ${CMAKE_BINARY_DIR}/libluavars)

