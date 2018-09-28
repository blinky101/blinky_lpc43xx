cmake_minimum_required(VERSION 3.5.0 FATAL_ERROR)

project(blinky_lpc43xx_dual_core)

include(cmake/sub_project.cmake)

sub_project(m4)
sub_project(m0)

