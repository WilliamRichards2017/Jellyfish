# =================================
# jellyfish
#
# sub_commands/CMakeLists.txt
# =================================

#bc_main.cc  cite_main.cc  count_main.cc  dump_main.cc  histo_main.cc  info_main.cc  jellyfish.cc  mem_main.cc  merge_main.cc  query_main.cc  stats_main.cc
INCLUDE_DIRECTORIES(
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/include/jellyfish
  )

add_executable(bc
  bc_main.cc
)

add_executable(cite_main
  cite_main.cc
)

add_executable(count_main
  count_main.cc
)

add_executable(dump_main
  dump_main.cc
)

add_executable(info_main
  info_main.cc
)

add_executable(histo_main
  histo_main.cc
)

add_executable(mem_main
  mem_main.cc
)

add_executable(merge_main
  merge_main.cc
)

add_executable(query_main
  query_main.cc
)

add_executable(stats_main
  stats_main.cc
)

add_executable(jellyfish
  count_main.cc
  bc_main.cc
  info_main.cc
  stats_main.cc
  histo_main.cc
  dump_main.cc
  merge_main.cc
  query_main.cc
  cite_main.cc
  mem_main.cc
  jellyfish.cc
)

target_link_libraries(bc ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(cite_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(count_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(dump_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(info_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(histo_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(mem_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(merge_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(query_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(stats_main ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})
target_link_libraries(jellyfish ${JELLYFISH_LIB_LIB} ${JELLYFISH_CORE_LIB})

add_dependencies(bc ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(cite_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(count_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(dump_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(info_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(histo_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(mem_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(merge_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(query_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(stats_main ${JELLYFISH_EXTERNAL_PROJECT})
add_dependencies(jellyfish ${JELLYFISH_EXTERNAL_PROJECT})
