# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appquickprofessionalwebsite3_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appquickprofessionalwebsite3_autogen.dir\\ParseCache.txt"
  "appquickprofessionalwebsite3_autogen"
  )
endif()
