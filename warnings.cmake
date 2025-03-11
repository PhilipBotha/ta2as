if (CMAKE_COMPILER_IS_GNUCXX OR IS_CLANG_BUILD OR IS_GCC_BUILD)
    message(STATUS "GCC/CLANG detected, adding compiler warnings.")
    set(COMPILER_WARNINGS
            -Wall -Wextra -Wpedantic -Wdouble-promotion -Wnull-dereference
            -Wuninitialized -Wfloat-equal -Wcast-align -Wwrite-strings -Wconversion -Wparentheses -Wshadow -Wformat=2
            -Wformat-security -Wmissing-include-dirs -Wshift-overflow -Wcast-qual -Wcast-align -Wwrite-strings
            -Wmissing-declarations
            $<$<COMPILE_LANGUAGE:CXX>:-Wzero-as-null-pointer-constant>
            $<$<COMPILE_LANGUAGE:CXX>:-Wold-style-cast>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wpessimizing-move>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wredundant-move>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wuseless-cast>
            $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wtrivial-auto-var-init>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wduplicated-cond>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wunsafe-loop-optimizations>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wlogical-op>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Waggressive-loop-optimizations>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wstrict-overflow=2>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wbidi-chars=any>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wduplicated-branches>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wimplicit-fallthrough=5>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wformat-truncation=2>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wformat-signedness>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wformat-overflow=2>
            $<$<OR:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<COMPILE_LANG_AND_ID:C,GNU>>:-Wshift-overflow=2>
    )
elseif (MSVC)
    message(STATUS "MSVC, adding compiler warnings.")
    set(COMPILER_WARNINGS -Wall -Wx)
else()
    message("Unknown compiler.")
endif (CMAKE_COMPILER_IS_GNUCXX OR IS_CLANG_BUILD OR IS_GCC_BUILD)
