cmake_minimum_required(VERSION 2.8.10)
option(EXPERIMENTAL "Enables experimental features. (CAUTION: Out of bug support.)" OFF)
option(BUILD_TEST_PLUGIN "Build test plugin (NOTE: This is not for end-users. The generated plugin is very boaring.")
project(watcher)
add_subdirectory(source)
